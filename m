Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7936D9F5;
	Fri,  3 Apr 2026 06:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775196156; cv=none; b=TmJqjE33+aPqgXFk4I8ocR3054GIYpBRdCVtttAMn0YHSoK/0kOSbfSpBs9jn6FpRlWxK73b0XaxXXucqX667U5VRTVhE1dQrcnCd2kgwTQSrJQ8OtkLzu7aGfNFB5Arku1z1Srfreq+kmM1UNyV6If6MhTrOg1mHkztcg3Emy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775196156; c=relaxed/simple;
	bh=m/eBvVaO9X6GykTESNaURMam/E51eGSAybXbxJr7/po=;
	h=From:Date:Message-ID:To:Cc:Subject; b=QxQ30H9PBR/svCdAwk3uycti1/dZTHzUU2dKUlOmblf2HB6YDC6qA76oIy9HBBgXPj5nHmGr9StdUJYymSDj+pM8JxkZK+ELdsTWkTi5I2nK7QfOG5BoWdl9xsSoIR5ieEV4yH/rtEU7OVnPoyn4Q+iqrWspHTk+QRopXrHdkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-drivers-of-fdt-v2.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAA3VdzwV89pfcO7DA--.32675S2;
	Fri, 03 Apr 2026 14:02:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 13:59:47 +0800
Message-ID: <20260403164501.1-drivers-of-fdt-v2-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH v2] drivers/of: fdt: validate flat DT string properties
 before string use
X-CM-TRANSID:rQCowAA3VdzwV89pfcO7DA--.32675S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8JF18ury7WrWUAFyftFb_yoW5tr15pF
	Wft39xJr4vqrsYq3srtrn5uw15tF4xArsrtr9rCw17Zws2vFyUXrW7Ca1Fvrn5ArW8ua15
	KF40v34kJa17WFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIfO7UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Firmware-supplied flat DT properties are raw byte sequences. Several
early FDT helpers fetch properties such as status, model, compatible,
and device_type and then use them as C strings with strcmp(), strlen(),
or pr_info() without first proving that the property is NUL-terminated
within its declared length.

Use fdt_stringlist_get() for these string properties instead. That
preserves the existing behavior for valid DTBs while rejecting malformed
unterminated properties before they are passed to C string helpers.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- also validate raw compatible string-list walks in `of_fdt_is_compatible()`

 drivers/of/fdt.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 331646d667b9..00cd3da3d880 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -68,7 +68,7 @@ void __init of_fdt_limit_memory(int limit)
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node)
 {
-	const char *status = fdt_getprop(blob, node, "status", NULL);
+	const char *status = fdt_stringlist_get(blob, node, "status", 0, NULL);
 
 	if (!status)
 		return true;
@@ -677,22 +677,15 @@ void __init of_flat_dt_read_addr_size(const __be32 *prop, int entry_index,
  * specific compatible values.
  */
 static int of_fdt_is_compatible(const void *blob,
-		      unsigned long node, const char *compat)
+			      unsigned long node, const char *compat)
 {
 	const char *cp;
-	int cplen;
-	unsigned long l, score = 0;
+	int idx = 0, score = 0;
 
-	cp = fdt_getprop(blob, node, "compatible", &cplen);
-	if (cp == NULL)
-		return 0;
-	while (cplen > 0) {
+	while ((cp = fdt_stringlist_get(blob, node, "compatible", idx++, NULL))) {
 		score++;
 		if (of_compat_cmp(cp, compat, strlen(compat)) == 0)
 			return score;
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
 	}
 
 	return 0;
@@ -741,9 +734,10 @@ const char * __init of_flat_dt_get_machine_name(void)
 	const char *name;
 	unsigned long dt_root = of_get_flat_dt_root();
 
-	name = of_get_flat_dt_prop(dt_root, "model", NULL);
+	name = fdt_stringlist_get(initial_boot_params, dt_root, "model", 0, NULL);
 	if (!name)
-		name = of_get_flat_dt_prop(dt_root, "compatible", NULL);
+		name = fdt_stringlist_get(initial_boot_params, dt_root,
+					  "compatible", 0, NULL);
 	return name;
 }
 
@@ -775,19 +769,14 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 	}
 	if (!best_data) {
 		const char *prop;
-		int size;
+		int idx = 0, size;
 
 		pr_err("\n unrecognized device tree list:\n[ ");
 
-		prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
-		if (prop) {
-			while (size > 0) {
-				printk("'%s' ", prop);
-				size -= strlen(prop) + 1;
-				prop += strlen(prop) + 1;
-			}
-		}
-		printk("]\n\n");
+		while ((prop = fdt_stringlist_get(initial_boot_params, dt_root,
+						  "compatible", idx++, &size)))
+			pr_err("'%s' ", prop);
+		pr_err("]\n\n");
 		return NULL;
 	}
 
@@ -1032,7 +1021,8 @@ int __init early_init_dt_scan_memory(void)
 	const void *fdt = initial_boot_params;
 
 	fdt_for_each_subnode(node, fdt, 0) {
-		const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+		const char *type = fdt_stringlist_get(fdt, node,
+						      "device_type", 0, NULL);
 		const __be32 *reg;
 		int i, l;
 		bool hotpluggable;
-- 
2.50.1 (Apple Git-155)

