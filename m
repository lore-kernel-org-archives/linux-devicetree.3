Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423893;
	b=5Hv5CnsEIq/kwtYBFwUdUf4ycQuHlu0CHYWqNgdICg9/c4Mo+j1N95zwlo2rca/Noymj
	 s6HcqvQs3HI0lGNpCiG6BX+Fi2Stn+MoZawKxUdiMigfRy1l4RKnrWkrZGYvk/myRDip2
	 amtEKzlP8l6C4zHI61VbYImwLbAnGMY+Ok8k+bQEaaXt4FBKS58AJBzY81i+yfXFwBWy9
	 dWVBCzix9KjIagMvlbLggkyBW/nvC6sJjPpdRptQMPIcp8SCkFa7mfs2nu2mT/LHbpCBo
	 Z7ZRa8DCDaRRb3OICE6lv53tqczd88xERQGuwr5dNgKOh+wyU8KqsY+b/KcjW4hh+Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
	b=w+9pcjddqMGp31JFKTqkZr9UgmV7SvwRn5m6cunEC5Py9GPliUXT5i/eqH5ZsxV/z2Y+
	 l1X01usjz8bfBjRKIMNL24pP+arV/PEFz3UKq23teEPRVp/CsISX7OdYlPyBScoGgrFnG
	 unb+CslXSdeK4SNfAzsBsFNU5+xK3om1qyraXjpc5WPgcwY44EFep6RrT+6qwodvhQK+Q
	 +AW3QD4sSjuzc1QGmeXt6171kw0/QUma32pIoqrb3t/RKPeWxOUBMMJNmx+1D8StuYjE4
	 UV5SsIfZp2zygZ3zMoIWoK0DoS0Kdnv63wNW3nWZeXCKeADcNuVP1YqT9zdnjti77OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWWxyrN;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670F606A33A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0670F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWWxyrN
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd69954c755so2447365a12.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423892; x=1795028692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=zIWWxyrN7oHXkG1jICmt7YAaGA2MesgeCR7SxP0iQ7tXeoE/cHx83Ddbgulj89MYb/
         6M6T7cDfCDuK2dKEHtRf8IRXlAeGKqKLY2zfFMDAvuV/BhlXRwMJhUoOeJXkoudixvsT
         NK3gwZseg0ihOy7OF9wKfbGZuUvn/zKDuNx6lof8BUBwS/iXaieNLWjJibgfn2C2125I
         sQsp37USoJY/MSKN/jLkIDSvXWc2IUj1aMqZIUvOw+MQHLGFst9aEauQho9sWcL5pFk8
         AN0X7pzwi+3FS9cpn1En3eL3Sy4q1lz/w8pUenWfMq+d2YWLb+ub3lmhYVajrzHEDtwO
         hl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423892; x=1795028692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=cRKapArg7jjSGdjoUIRGQdo7itzpRa4W6eopICxqFRPMEHzmhZ01Xmln7v8tp4mCyT
         D7RiB7Yn18J1e+0X2iWhM4UuQ6CvTdWJQb+MPv3QCB0RJfh+zBpLNSOh0G2P/BwrUO7j
         SA6zdCy2NAZflhdWpXqejuwjEk8rtetruj51P/okMT6UK5CRRLg+GOdJ7gAX7SBWCLtr
         rpnceW9QNHMd8MWoC2v2V96oxbIed9fZiJ+pFkLqP5sNJ8GBk5qtcbOjbPcAWqVbmRZw
         /JqJWCBHN+7Tz6Qe6qMeM2vWUeRevFF2IcIrXguaPZdV7ehprfabR5GQu0vkTW6MU4Qs
         vVeg==
X-Gm-Message-State: APuU4Z8X/XpDBt8EVm6xDN5vmdAU/UPsJ/GVllwq0iKk0DyEx5AIpYVO
	lh3eyxSIpcRmhwezNMjn0bO3fMMmjQ1L0j68+aCBjbMGZEWXHBX9lvTo
X-Gm-Gg: AYBFou1wNZ7TvJWfGGfKPivQDoX8NTjwSLUR0p+B7tfuUZR6beouULAaClTXyBeXPfF
	E52cR8HhuZFwDRx4SfISaxjqq67fe6TOwYE3nE4wLglSm0vlU0hkqPiA3uOCgJzBmH2w4ISJywI
	Kjr/m8RM55HBq1h0Fri4lFjv3osb+qwlGJBF+AKUqgEvu4GMGyhxbOTCJST2WEH3qzOH3iQtOOX
	/YUUXi/9+5/uHKvcgs6Pg6LJN23FB5H6jaeVoanaQT5l/pKKbPnlAzih1GGr+BggvyZuiNg/jhh
	msrTDDK50Ok4gZ26sl27WyH/BBSdTHvhechSq5kyMyM20QPoLbXiIzsWEpK4ssRbPVNURxJ2B6Q
	d8FXMwwT1OVb74zM2eW3Y/MkVzjA+fZxf9L8dy9xAmAJzjkcRx9G/85djcFiewtKVraKj79yRB6
	RkgWEmJOIOzR0QoIdxueN+Kh88IpHbfWTqT7i9lTLHDSYAc/SquOSmsYzk+f7ipDpMT+qoD1coV
	tfDrHcMTGtvfuMdCjYokXMqYSSpca7sD3htsh2DXmP7D45FDH1VmH0tNH6ORZaWSeFRooSgcC3Q
	8wRX+U8S+0Gw59wmWYq2+516s879SvT+YQ==
X-Received: by 2002:a17:90b:4a43:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b182e6f662mr3176907a91.17.1794423892375;
        Wed, 11 Nov 2026 11:04:52 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:51 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:02 -0300
Subject: [PATCH v2 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied
 Load
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-6-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2480;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=SdMTfWEdhEcbVe3jVg4HQtrokGsmQDzPQ6HKrJzZjGE=;
 b=GUA2MhZVPFVVx+fP4wtJTG/ZVarRMQCoFUO+AAwZGNJULsfUqPHcm55hq2RjOIUamkxu2JjEU
 s7y2NTEMgqhBHj95eIB/wJVpRyhVGVv/R6f5pa0rylqerr4dAklrjSi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                        |  6 ++++++
 .../dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index fc9a68cbdd313..fffcc54545b09 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -152,6 +152,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx-hdmi.dtbo
@@ -326,6 +330,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
@@ -339,6 +344,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-nau8822-btl.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 0000000000000..b2f9c43d29cd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
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

