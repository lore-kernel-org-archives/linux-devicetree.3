Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075D4BCAA9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844202; cv=none; b=MBpUs69Z9xntcJp9024BuLicorXSAQ6kP6+HtCtfJe5jyPn5Bsfi/vsQfJFFGC3HQKUx8PrZPXVyqyQru4eUikwfH2o2W3HAG9y11JvSMgTVwxpQzPleDdqkKnfp0UH5CJhblk78gsSOHtPhpdhGiy/H199OsbkxUSUjszM5oTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844202; c=relaxed/simple;
	bh=nWTgMoW7Alfvw4HC5D4yHSnYtdfCYBNHKKsHkW8vWn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ix7qwCVwVpeQExVTAxamX1NPPrVfB5p/YKt3MhGt7nTwdMv6WBNtvkgMIh4Z/uWAlu33PVWVIXwZtSpxt4UpEdnw0p+N6/tNpsCmThCwoP7ncjShY9qyTV8vcqqlJ8TJI3VJ7AyzAHjRHhcwMnM0hTMkXDy97CTfpEA1Ojlt5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGOFa2I6; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGOFa2I6"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso1155310f8f.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844197; x=1791448997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=qGOFa2I6j0UbTpZ+26SLtwWxpAki1cTfHjbqrmfm+//k3I+0XI+XrgZFXYtdgCQVWj
         mEOkG0NseFbDOkX4O9NJ2dYax8Uy2dL4GU/5dZUSMgvZFYpowoCELEXjz4mBS0BqthsO
         0oue2sx0L7ErG7BZ1fYDvzO9ZhdpFzVWrXQsSQtedcDOu+FOiKeVkTNxgOtEHwDOzvdO
         X/qn1HM168Xk3T0U9jD+UeRkgE73O4A5zIyPDL9U9yOpXg9/+76MpvJGlV4DoTK7gqRI
         ikmo5YjIJNyQ+V2TcEINyvWzI/yzar44UhR52e+Birl0/cwcpMXTAhc5ZyqOkeDyr1pu
         ai7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844197; x=1791448997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=kfN7kUgq6Fv9mQnyTuKkM6m6hQ+Ngo4wLA5bNiU9TtJrYgCIuFt20hCxjsB5d7xrWH
         fqZKqJwT61IqYrSP99T9AOAPGomcLe3iXUzl+Pv7zeQYWwN6IOj6PSRJudIbnOVUv4cl
         KVMLosIW4b7PpYDMXqg3tnfCcL2OdB7BCy+xxUJyWaw89ypjEwx3LKFCtP1+anU1rwZH
         4Idb/Yar+E1hq4ysp3+BVb6yTcTiYu86TLIk26N06v5HbsXl19TzcTSKToh12K+GR2R5
         o8PDdINk3eMdMMI2yCt4xTWjd/7/9c2qaXdd0WqtSeIGR5GJHbFKD0zbFpAndPWsjItF
         jKBw==
X-Forwarded-Encrypted: i=1; AKwUvBygktsKOazOh2qhbg/8qIceDZdyg02zZ7MkOFLlU1fN5vrYNTtHkW65hkJ+76eX2NwSlsF6FpbQCZXl@vger.kernel.org
X-Gm-Message-State: AFuF++kvIf4irTgHZLVyGIOMOZxp6RlLi859HO+zIDl3hJqIEHIXu6zt
	bOPzyYOpAG0X+lI7m7Xpe5I8BDYhdLhnzy5mA8M3AU2XL7YhsxiDDnmm
X-Gm-Gg: AYBFou0FC+lJfeznezJp+WIeenHcQUfAQyLvDX5hS/i+EfLh3APHq8LZGj2LVK3IyUZ
	THBvkK6bF7qlGongnYLk4YFbiCfubW8+x1wGMA2Xd/Aak9aWpEPHCiHT7KvgGP+QyKWtSpXer3B
	Z88N6Rjo2YBATcp0b+xRrekja83PHOiJohE/t5MPyr0SQ0yoOI6SEihG0PgV0dQI4EWaOTSsVVN
	/IlqeadtEAa9B7Fp2IlhWmmC+UTJ/sR7umMDJRi86dzqzAKhDSsxs3ZretXzkKrU0/b+qb7jv9W
	O1OYxCjqGXNUOw3GIJx+k3/3jy2Ws7egUtskWHaB1Quoker6WAJzDoPznZkXF+hLVvuoNoR4s2M
	qG+AFNq1sVMU9Elea68tYB/i+mmCz53GMkwaTR4+WFh5vhYbg8yL9luMZvrWYDeNCrl9r4PpFHJ
	dc3my5YVKTZoKPVCTtQPz1eQrYDr587grkjGLIA6E2fYu8sZb1fvut6JGl879+A3/T7mRmFEvqe
	hHfEUUF6fcLz8AeH8HbPX/o6KqCCorNWc7Dpo6zHthF1BC3JIYrVsgaLSq5dDfm+noVePoylw==
X-Received: by 2002:a05:600c:46c8:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a01ade9bd2mr64054025e9.13.1790844196791;
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:10 +0200
Subject: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge
 Tied Load
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with the Apalis iMX8.

The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
routing are already described by the carrier device tree.

The overlay supports both Apalis iMX8QP and iMX8QM modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
 .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9971b34f7301..2732b223eb3d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
 imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
+
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
+	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 000000000000..b2f9c43d29cd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};

-- 
2.43.0

