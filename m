Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723085;
	b=nN66WIRmh3Y406I3ntKwYHo4nr+qX5GBTEI8o70PDlom09lCXM0/2QzwPKN9i7gu6f4r
	 /ej8k6dop76x5pZo7FJT6CcYM0K7JaIykUcy6DRKwxMjSyvOoOQL6mzcG423Fjax1IWEH
	 wj6rqK8bh7tVvozHqbF9zmhJ1zb50TsV3fGxpHhN/8oCNV+KxTYZxVUJKmApYvpVZG0Yo
	 qSgKty6BGN1+fteOaN9XMGAqQ+Reo8nuyWjFoG69Y2UqYCjF/Nybn+5HywoAfAAfh6H/2
	 dA8YocgQCkG5mBnbD4hjrt5ns82gv4Zi6j74CTaIkTo51N4JwR7J9PgOmyGRxYVl56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
	b=qO4XvN0ZU85JHK1KTgJBkVv6uZU5mOMm7/uDaIYBxuW1Jyo+ZenPgASxecMLaaag/ANZ
	 lgngJt8xoDGIyxtVYT8d0syJQ6XbyhIycRwxbIe9LYQMt6YwIozFf7Y25Tdv4+DuLEIwQ
	 LZm0DTc/C+BJPlbg+IAe9I9A8aJBewQFWXmCnFxbAUewyktDSt07OJAWmJbVc+Pxc2yGc
	 9RxRDgpHCLDfg2nZxDb8ciCoY9/Mj4K5k062V12WT5QdkCV/UesaVCeEsx6EIK25XHeN7
	 g0Gte804jX9brNoymxvD6aUovk73cs2WTQ2RdkciEWtoFZdqtI6zZEeyiRpdBF4eR9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmW+6zp6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546AE606A88E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 546AE606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmW+6zp6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25620225e9.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723084; x=1795327884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=cmW+6zp6Xlgj7izVi43T2QLLWs2jvIaPcQUPoRlSRkHod2Hmkj7I8GGdIIqaFzdhOj
         joQvuzWrVSE1V+VHc0M/sRQrh07V/dbdLY61bkG16VaaqEwGt7i6bWvdjX9TClsE2zJ3
         m2bG5HcGk9z+H5FtEnpdZgiVtoPukWHjrvmv9bq/m+tCCCWxz3Iix7zVn4mF3sJRFejy
         afo9TsJlp6gf6DQahAZBoLLxXLIL+cO8E0NWGkyWYliib0MU8oMApBluqOnijy/hhvUl
         3kpFDip1bzDGViHejpON6vvBeFc1SGA4LLbGj4H1Mf+gLBoCRX4+LdvpMq7bfpqlR4M4
         xfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723084; x=1795327884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=U2sx9zEX2WgvtgVYRuFjNatkX5QP+L3N8ZwRUe/b7wMxRKqu0KaJZzjEsKF3H9w34b
         vxffabGFkK2rZPlRoW7cdLnporjkhURoII+ySYfX2M4wVVV9HGciDsniiw2PVthbIWWP
         ml8WCQ6GJOGzwitM7gLOCQKDrVljkF1d6eFzsfpAQsPtgMDiCRJK83AX/UpHp05ldiF3
         k3RWqao3a6FO4yT0+ABpO1KJad/B5TUDGlZYnH03CgTP06v7UJJxck2Q6thmo9CFcrak
         WOsAFuoLmRa5dvTJFyLhLMRtkZgewqvKMPjU+t5E1RKQVAUApU2ede7fHnXdgRUWmqDc
         7CeA==
X-Forwarded-Encrypted: i=1; AL+hErFCl9E7+znNnrYBoNbaqbMdQXw1xy+Kfet2mwBou8JaZCUB+PQIZUhUbhVGD/l9qT0Ub/FhcNanbdzF@vger.kernel.org
X-Gm-Message-State: APuU4Z80V2AVotvxZ4he7K4saAuzwYYYOkRvnREf2s0+Vn/pzZByaD0o
	79e6NnYsaoxwDF91ilf0ZOVP9cXvCZKp8yRCi4nQIW4V3WE9ZX7ZLQKE
X-Gm-Gg: AYBFou1UZxADR6lsdvmxlFeRZiksJVUVoBuNlIFZqhl7GAP/V9U/gnP6MyUr5EbZFca
	nxaQpa4tkE0XrSimBTpbVkfgry48tUjDkP36S5038yCC8HJloO61xUCdQ5JipKI6IBgjKh3JdgV
	7EqL3pChzaf1Ta+lFTZ4A7pHQshCawd6siRLmul+M2OKfj52VVyO70oi2FzGO6KPTkL/5KdExT/
	bjVIuYD5jDMUKJ43C35BzyKB/j3/tXLZL2hod0pqZXW6w81298C+u+/ZVLni7Dc+aP1vTYHp3Bd
	rNzmcUG1s7w0W5pTOo55UXpWDqx+TMlpGgQoGHw5svPdJxsZxvFzgOYmTWENVRrhT+FlUXrPA9/
	3dK4YHnknQ60/1KHbYp0T7rBPUJKPWerwQTFRVrwIKUu9n1YxGuxAPTjphMU2FYj+wcdL4WUKwA
	LAp3l+FLLIHxSxq8+0Mi3B4slG1WkfbLnrtacOZ5MLoaUv4KeYDRE1z+gM2jFNE7fwE+BvKVO0R
	uS+ZrKxgNyBAqIaV6bhrM9ikVHO121EzTD+MYv9JHbLFZoH0g4CTo7J0zfoakATOJdXj8JdiUsA
	QxnhPOQUsbtMf2CV7T9Q83Lx4MX3cK+XuxWQg2Ahco7Lj8SQ6NyrFU/yvHcqAP7UAW0zdpED2vn
	SgSI2C5+L/NhN3/DOe5+rRMFzIschQLYWnw2tJkVfb3GJ8SvBizVinRfIN2UTyY5uT6JFw705e6
	XrQ8fdEWoZl+XD1oiTWwR03E7AnPIULUyJosHgJxX3KOSZkCql7r4nUkl6/osoLXkQERyJNuMTT
	iWSQoKpH98vQA==
X-Received: by 2002:a05:600c:4f90:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb55a47680mr145173255e9.7.1794723083470;
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sun, 15 Nov 2026 07:10:56 +0100
Message-ID: <20261115061102.229680-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DE33 clock driver presets the plane mapping, which is not something
that a clock driver should do. Remove that and export the mapping
registers through a regmap instead, so the DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..f17570efafaa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +284,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.43.0

