/**
 * Copyright (c) 2022-2023 Contributors to the OpenNTF Home App Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package model.util;

import java.time.OffsetDateTime;
import java.util.stream.Stream;

import com.ibm.commons.util.StringUtil;

import model.blog.BlogEntry;

import jakarta.enterprise.inject.spi.CDI;

public enum PostUtil {
	;
	
	public static int parseStartParam(final String startParam) {
        int start;
        if(StringUtil.isNotEmpty(startParam)) {
            try {
                start = Integer.parseInt(startParam);
            } catch(NumberFormatException e) {
                start = -1;
            }
        } else {
            start = -1;
        }
        return start;
    }
	
	public static long getPostCount() {
		return CDI.current().select(BlogEntry.Repository.class)
			.get()
			.findAll()
			.count();
	}
	
	public static BlogEntry createPost() {
		BlogEntry post = new BlogEntry();
		post.setDate(OffsetDateTime.now());
		return post;
	}
	
	public static Stream<String> getCategories() {
		return CDI.current().select(BlogEntry.Repository.class)
			.get()
			.listCategories()
			.map(BlogEntry::getCategories)
			.filter(cats -> !cats.isEmpty())
			.map(cats -> cats.get(0));
	}
}
