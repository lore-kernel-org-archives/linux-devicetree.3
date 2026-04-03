Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F030E0CC;
	Fri,  3 Apr 2026 01:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775179733; cv=none; b=g0XH41rLkdjx61d35n8c71yHlAdf+cvim2xAWPHYbL5VsMw21Ht9sOWMNTtfv3WyP/fHY+//t1M31eQzpokxBm0FkPQmACGX42hIjbhqd0OQj+qS8G3UcrPGEY0xHtkFOeMySypwzjfRq8T12tmVutLbdlW2XewPvWpv7Eq4pg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775179733; c=relaxed/simple;
	bh=TCFlb+7kVFGBZoPgy3YkGmJn2qGBQL4O7JHylBTbtJA=;
	h=To:Cc:From:Date:Subject:Message-Id; b=Ho19M8DvtoRubKmaLo5F1EA6myeaBGpb4PViINBmb1W89Kk9wAbPijcf05MgxoNJMI+zgqQhtqecZadcWAcJaUxMaD322SbSnq0DawulPNDtXzY0pJAlu6QLJgOKC7BboYBuBa+Xh3YD2aCt9MeSYvkmX4Sjma7ANn9GBXZIFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dt-fdt-0001.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAB3IW3JF89p8hUHDA--.27729S2;
	Fri, 03 Apr 2026 09:28:41 +0800 (CST)
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 08:47:51 +0800
Subject: [PATCH] drivers/of: fdt: validate flat DT string properties before
 string use
X-CM-TRANSID:qwCowAB3IW3JF89p8hUHDA--.27729S2
Message-Id:<69CF17C9.10A8CC.26415@cstnet.cn>
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8JF18ury7WrWUWF45ZFb_yoW5GF45pF
	WfKrZxJw4vvrsYq3sFqws5u345Ka1rJrsrKr9rCwnrZwsFva4UXr47Ca4rZwn5CrW8uw45
	KF48Z34kJF17GFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4kE64xI4xA0e2IEY21l
	c7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0pRWCJ9UUUUU=
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
 drivers/of/fdt.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 331646d667b9..311a258fc225 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -68,7 +68,7 @@ void __init of_fdt_limit_memory(int limit)
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node)
 {
-	const char *status = fdt_getprop(blob, node, "status", NULL);
+	const char *status = fdt_stringlist_get(blob, node, "status", 0, NULL);
 
 	if (!status)
 		return true;
@@ -741,9 +741,10 @@ const char * __init of_flat_dt_get_machine_name(void)
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
 
@@ -775,19 +776,14 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
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
 
@@ -1032,7 +1028,8 @@ int __init early_init_dt_scan_memory(void)
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

