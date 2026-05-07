Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B016382F00;
	Thu,  7 May 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141902; cv=none; b=gObgEONcrWAfiqeUMBrBKKwJLE+CMZ46HU7ubmMMX0dxJtkJk4WZTH4XKZWo1+9zL3DcxwQP7UDTy6VBtpQPpF/+BXzFgkkonvI4bsQzZX4eJITf168vqhYy05zQzAF29Jyxg2udvQld88NVPX79opJydCUosvkqDWCDYSKoznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141902; c=relaxed/simple;
	bh=B4ppJyGkh6i/b+gg68ClW850Lq2mX9CjqZCb9bFOtAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jxg9KfyYBn3aLp3KRz4y8CVxU4u58VWAlIlj+VYnwCHF3anZciB+ro9AwsCx6krTrVVgx9WywTdH/Wxaox+66SozO6TAQhn3ewGEGBSYeI4f9kArS80Ve4fkR3okEjYKlQuUPiJfBQZZywoKwVMS9gLFLVBwpwjM+lFdHvbGiUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD32uHGSvxpM_1NEA--.16716S2;
	Thu, 07 May 2026 16:18:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 1/2] drivers/of: validate live-tree string properties before string use
Date: Thu,  7 May 2026 16:18:10 +0800
Message-ID: <20260507081812.91838-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn>
References: <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD32uHGSvxpM_1NEA--.16716S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF43CF15Zry8Jw48ZF1DJrb_yoWxKFW8pF
	4YyayYyrW8CFs3Xry5ur18Aa43Kw1IyrWxtFW3K3srZasxJFy5ZrW7Ja1j9rn8ur4fuay3
	tw1kWF48Cw429FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBmhwUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

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
before returning them, keep the `device_type` check inside the existing
no-lock helper path, and add unit coverage for malformed first and
trailing string-list entries.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
- fix the QEMU virt boot hang reported by Rob Herring: v2 made
  __of_node_is_type() call of_property_match_string(), which takes
  devtree_lock while __of_node_is_type() is also called from paths that
  already hold devtree_lock, such as of_find_node_by_type(),
  of_match_node(), and of_find_matching_node_and_match()
- keep the device_type validation bounded, but use __of_get_property()
  directly so the helper remains safe under devtree_lock

Changes since v1:
- rework of_prop_next_string() so the first returned string is validated
  through the same bounded path
- add of_unittest_property_string() coverage for malformed first and
  trailing string-list entries

 drivers/of/base.c     | 43 ++++++++++++++++-----------
 drivers/of/property.c | 27 +++++++++++++----
 drivers/of/unittest.c | 32 ++++++++++++++++++++
 3 files changed, 80 insertions(+), 22 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2..515e364bc4ac 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -82,9 +82,17 @@ EXPORT_SYMBOL(of_node_name_prefix);
 
 static bool __of_node_is_type(const struct device_node *np, const char *type)
 {
-	const char *match = __of_get_property(np, "device_type", NULL);
+	const char *match;
+	int len;
 
-	return np && match && type && !strcmp(match, type);
+	if (!np || !type)
+		return false;
+
+	match = __of_get_property(np, "device_type", &len);
+	if (!match || len <= 0 || strnlen(match, len) >= len)
+		return false;
+
+	return !strcmp(match, type);
 }
 
 #define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
@@ -491,22 +499,22 @@ static bool __of_device_is_status(const struct device_node *device,
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
@@ -1217,10 +1225,11 @@ EXPORT_SYMBOL(of_find_matching_node_and_match);
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

