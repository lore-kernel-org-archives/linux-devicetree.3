Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF1359A9A;
	Fri, 17 Apr 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403588; cv=none; b=P4cfbnljxvQXgcYpXYDnyp3LXp05ETM3/3z1tB9dj8p6Z1W5kenrysCnHslsiIBte5qIzdqEWWqeuUCMlnPdrumX9w534X+yh6gxBhbxCHrudhI3ZB87D0gGUpKu1DAJF+TlbZjhFXQNZtNqZum5WeTEMqN9n+MxKpPVJXCazvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403588; c=relaxed/simple;
	bh=q6OPc7hn9kPNhHx94Hu4LfFumXodAU5ZSx3p21Sc+A0=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=ObzBw8mTB8jLmNbYHF+llmdRViCtQLuhMSDoVVgUZe4Xz3lWDi+sW28OoXkjAXdh43KPfHudu45OpNPxbqA0SP+iDJQn5Dyen0UB0W7mQLYIqoCxpz1tZ98UaF/o9k11id/WO7vlne6TRO9XicjtB52xz+CFmrO2ZOsd51XFWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0004-drivers-of-v2-1.eml (unknown [111.196.245.116])
	by APP-03 (Coremail) with SMTP id rQCowAAX++F7xOFpAjhZDg--.14973S2;
	Fri, 17 Apr 2026 13:26:19 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 17 Apr 2026 20:36:00 +0800
Message-ID: <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
References: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
Subject: [PATCH v2 1/2] drivers/of: validate live-tree string properties
 before string use
X-CM-TRANSID:rQCowAAX++F7xOFpAjhZDg--.14973S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF43CF15ZF45Gw4DtF4UCFg_yoWxCrWfpF
	4jyayYyrW8CFs3Xry3Zr18Aa43Kw1Sy3yxtFW7t3srZasxJFy5ZrW7Ja1Y9r1Duryfuay5
	Xw1kWa18Ca129FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK62vIxIIY0VWUZVW8XwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRAku4DUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

`populate_properties()` stores live-tree property values as raw byte
sequences plus a separate `length`. They are not globally guaranteed to
be NUL-terminated.

`of_prop_next_string()` iterates string-list properties by walking raw
bytes, `__of_node_is_type()` checks `device_type`,
`__of_device_is_status()` checks `status`, and
`of_alias_from_compatible()` reads the first `compatible` entry. These
paths must validate that the relevant string fits within the property
bounds before they hand it to C string helpers.

Validate these live-tree string properties within their declared bounds.
In particular, make `of_prop_next_string()` reject malformed entries
before returning them, use `of_property_match_string()` for
`device_type`, and add unit coverage for malformed first and trailing
string-list entries.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- use of_property_match_string() for device_type as suggested by
  Rob Herring
- rework of_prop_next_string() so the first returned string is validated
  through the same bounded path
- add of_unittest_property_string() coverage for malformed first and
  trailing string-list entries

 drivers/of/base.c     | 36 ++++++++++++----------
 drivers/of/property.c | 27 +++++++++++++++++-----
 drivers/of/unittest.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2..96e4d7a7d5b8 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -82,9 +82,10 @@ EXPORT_SYMBOL(of_node_name_prefix);
 
 static bool __of_node_is_type(const struct device_node *np, const char *type)
 {
-	const char *match = __of_get_property(np, "device_type", NULL);
+	if (!np || !type)
+		return false;
 
-	return np && match && type && !strcmp(match, type);
+	return of_property_match_string(np, "device_type", type) == 0;
 }
 
 #define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
@@ -491,22 +492,22 @@ static bool __of_device_is_status(const struct device_node *device,
 		return false;
 
 	status = __of_get_property(device, "status", &statlen);
-	if (status == NULL)
+	if (!status || statlen <= 0)
+		return false;
+	if (strnlen(status, statlen) >= statlen)
 		return false;
 
-	if (statlen > 0) {
-		while (*strings) {
-			unsigned int len = strlen(*strings);
+	while (*strings) {
+		unsigned int len = strlen(*strings);
 
-			if ((*strings)[len - 1] == '-') {
-				if (!strncmp(status, *strings, len))
-					return true;
-			} else {
-				if (!strcmp(status, *strings))
-					return true;
-			}
-			strings++;
+		if ((*strings)[len - 1] == '-') {
+			if (!strncmp(status, *strings, len))
+				return true;
+		} else {
+			if (!strcmp(status, *strings))
+				return true;
 		}
+		strings++;
 	}
 
 	return false;
@@ -1217,10 +1218,11 @@ EXPORT_SYMBOL(of_find_matching_node_and_match);
 int of_alias_from_compatible(const struct device_node *node, char *alias, int len)
 {
 	const char *compatible, *p;
-	int cplen;
+	int ret;
 
-	compatible = of_get_property(node, "compatible", &cplen);
-	if (!compatible || strlen(compatible) > cplen)
+	ret = of_property_read_string_index(node, "compatible", 0,
+					    &compatible);
+	if (ret)
 		return -ENODEV;
 	p = strchr(compatible, ',');
 	strscpy(alias, p ? p + 1 : compatible, len);
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 50d95d512bf5..e97bfe357808 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -648,16 +648,31 @@ EXPORT_SYMBOL_GPL(of_prop_next_u32);
 
 const char *of_prop_next_string(const struct property *prop, const char *cur)
 {
-	const void *curv = cur;
+	const char *curv;
+	const char *end;
+	size_t len;
 
-	if (!prop)
+	if (!prop || !prop->value || !prop->length)
 		return NULL;
 
-	if (!cur)
-		return prop->value;
+	curv = cur ? cur : prop->value;
+	end = prop->value + prop->length;
 
-	curv += strlen(cur) + 1;
-	if (curv >= prop->value + prop->length)
+	if (curv < (const char *)prop->value || curv >= end)
+		return NULL;
+
+	if (cur) {
+		len = strnlen(curv, end - curv);
+		if (len >= end - curv)
+			return NULL;
+
+		curv += len + 1;
+		if (curv >= end)
+			return NULL;
+	}
+
+	len = strnlen(curv, end - curv);
+	if (len >= end - curv)
 		return NULL;
 
 	return curv;
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 29402958f11c..ee53363dfa84 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -713,6 +713,7 @@ static void __init of_unittest_parse_phandle_with_args_map(void)
 static void __init of_unittest_property_string(void)
 {
 	const char *strings[4];
+	const struct property *prop;
 	struct device_node *np;
 	int rc;
 
@@ -789,6 +790,37 @@ static void __init of_unittest_property_string(void)
 	strings[1] = NULL;
 	rc = of_property_read_string_array(np, "phandle-list-names", strings, 1);
 	unittest(rc == 1 && strings[1] == NULL, "Overwrote end of string array; rc=%i, str='%s'\n", rc, strings[1]);
+
+	/* of_prop_next_string() tests */
+	prop = of_find_property(np, "phandle-list-names", NULL);
+	strings[0] = of_prop_next_string(prop, NULL);
+	unittest(strings[0] && !strcmp(strings[0], "first"),
+		 "of_prop_next_string() failure; got '%s'\n", strings[0]);
+	strings[0] = of_prop_next_string(prop, strings[0]);
+	unittest(strings[0] && !strcmp(strings[0], "second"),
+		 "of_prop_next_string() failure; got '%s'\n", strings[0]);
+	strings[0] = of_prop_next_string(prop, strings[0]);
+	unittest(strings[0] && !strcmp(strings[0], "third"),
+		 "of_prop_next_string() failure; got '%s'\n", strings[0]);
+	strings[0] = of_prop_next_string(prop, strings[0]);
+	unittest(!strings[0],
+		 "of_prop_next_string() should return NULL at end of list\n");
+
+	prop = of_find_property(np, "unterminated-string", NULL);
+	strings[0] = of_prop_next_string(prop, NULL);
+	unittest(!strings[0],
+		 "of_prop_next_string() should reject unterminated first string\n");
+
+	prop = of_find_property(np, "unterminated-string-list", NULL);
+	strings[0] = of_prop_next_string(prop, NULL);
+	unittest(strings[0] && !strcmp(strings[0], "first"),
+		 "of_prop_next_string() failure; got '%s'\n", strings[0]);
+	strings[0] = of_prop_next_string(prop, strings[0]);
+	unittest(strings[0] && !strcmp(strings[0], "second"),
+		 "of_prop_next_string() failure; got '%s'\n", strings[0]);
+	strings[0] = of_prop_next_string(prop, strings[0]);
+	unittest(!strings[0],
+		 "of_prop_next_string() should reject unterminated trailing string\n");
 }
 
 #define propcmp(p1, p2) (((p1)->length == (p2)->length) && \
-- 
2.50.1 (Apple Git-155)

