Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0431A576;
	Fri,  3 Apr 2026 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202917; cv=none; b=hWSCn82ghH7MPyGCmGl9aongdz+JQTSqVzG//8I+GM8uzA7lLwuaNqCyqBMSBsghOAEOXpTkdqnfh+3DxFZ0P8zOlZpGABbVAPNLhCHDc5OBs9uYc6LyRCJu4gkz+ktLlFIw2lXFWNUDT5gZcimvzCpmz19VEfy2EAFmg3UmJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202917; c=relaxed/simple;
	bh=8GYgkPIo1FUe0kvQg6O45DX9xQLijtTCdiCRCynLDlA=;
	h=From:Date:Message-ID:To:Cc:Subject; b=LHw6UIuN0FzJnVQH+DiXGfPQOh6tX1uLf/A8vKqRku0qQidaP566uLscr7/SAoPI88aPj7s0Y6l4EJjsf1DAMkNYnkuR9eg5VEaz9PJt96myyCYvY6GG6AcUty5ohQnSu3iRQ/xGu7TpGyQnshLyCclHzf6QKcHWPRUSqGJRImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-drivers-of-live-tree.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABnhdxecs9pXaO9DA--.12964S2;
	Fri, 03 Apr 2026 15:55:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 15:32:30 +0800
Message-ID: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH 1/2] drivers/of: validate live-tree string properties before
 string use
X-CM-TRANSID:rQCowABnhdxecs9pXaO9DA--.12964S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr13Jw45Aw1fXr1UuF4fuFg_yoWrXFW3pF
	4Yy3yayrWrCFsrJrWfZr1rAa45Kw4ftayxtFy7KwnruwnxAFy5Xr4xGF1Yvrn3AF93u3y5
	KF10qFW8Ga17uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

`populate_properties()` stores live-tree property values as raw byte
sequences plus a separate `length`. They are not globally guaranteed to
be NUL-terminated.

`of_prop_next_string()` currently advances through string-list
properties with `strlen()`, `__of_node_is_type()` compares raw
`device_type` bytes with `strcmp()`, `__of_device_is_status()` compares
raw `status` bytes with `strcmp()`/`strncmp()`, and
`of_alias_from_compatible()` treats the first `compatible` entry as a
NUL-terminated string.

Validate these strings within their property bounds before treating
them as C strings. In particular, reject malformed string-list entries
whose next string is not terminated before `of_prop_next_string()`
returns it.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

---
drivers/of/base.c     | 39 +++++++++++++++++++++++----------------
drivers/of/property.c | 30 +++++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2..3c6af4051ad3 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -82,7 +82,14 @@ EXPORT_SYMBOL(of_node_name_prefix);
 
 static bool __of_node_is_type(const struct device_node *np, const char *type)
 {
-	const char *match = __of_get_property(np, "device_type", NULL);
+	const char *match;
+	int matchlen;
+
+	match = __of_get_property(np, "device_type", &matchlen);
+	if (!match || matchlen <= 0)
+		return false;
+	if (strnlen(match, matchlen) >= matchlen)
+		return false;
 
 	return np && match && type && !strcmp(match, type);
 }
@@ -491,22 +498,22 @@ static bool __of_device_is_status(const struct device_node *device,
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
@@ -1217,10 +1224,10 @@ EXPORT_SYMBOL(of_find_matching_node_and_match);
 int of_alias_from_compatible(const struct device_node *node, char *alias, int len)
 {
 	const char *compatible, *p;
-	int cplen;
+	int ret;
 
-	compatible = of_get_property(node, "compatible", &cplen);
-	if (!compatible || strlen(compatible) > cplen)
+	ret = of_property_read_string_index(node, "compatible", 0, &compatible);
+	if (ret)
 		return -ENODEV;
 	p = strchr(compatible, ',');
 	strscpy(alias, p ? p + 1 : compatible, len);
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 50d95d512bf5..edbc7a95aa4c 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -648,16 +648,36 @@ EXPORT_SYMBOL_GPL(of_prop_next_u32);
 
 const char *of_prop_next_string(const struct property *prop, const char *cur)
 {
-	const void *curv = cur;
+	const char *curv = cur;
+	const char *end;
+	size_t len;
 
-	if (!prop)
+	if (!prop || !prop->value || !prop->length)
 		return NULL;
 
-	if (!cur)
+	end = prop->value + prop->length;
+
+	if (!cur) {
+		len = strnlen(prop->value, prop->length);
+		if (len >= prop->length)
+			return NULL;
+
 		return prop->value;
+	}
 
-	curv += strlen(cur) + 1;
-	if (curv >= prop->value + prop->length)
+	if (cur < (const char *)prop->value || cur >= end)
+		return NULL;
+
+	len = strnlen(cur, end - cur);
+	if (len >= end - cur)
+		return NULL;
+
+	curv += len + 1;
+	if (curv >= end)
+		return NULL;
+
+	len = strnlen(curv, end - curv);
+	if (len >= end - curv)
 		return NULL;
 
 	return curv;
-- 
2.50.1 (Apple Git-155)

