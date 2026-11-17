Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919494;
	b=ADUEf7RH8hblXFep4gL8/vmRfslyb7+0JlMFY0zoIZ4p0/oXaLCEBaEEdB6/J+tdigMt
	 zi5MPP019TMOXgJEAaix280EY7kuVxW8DIRkyfpRxiBH3FQ2EjOPRS8LPZiDFhrq4NJ7h
	 XXuMnACD0OKPRIct2/22oxSZLdfU1UmgXIUjccG58jc2K36fkg7+Ym7B8u7/h3D8ioQsQ
	 o9FBNfBORPB+mHGXFMN6DinrNnXuLlMLXqf8sqLFSFISqgh+RbRZsWiPsFJ5JN6a4EuAO
	 UXaifu/N2aGxQ1+rmWLDGZ7DR9r+Lp2QJ5b61aHhsHwA5QX37OdmxT/g+nI7ftimYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
	b=TRsD6prLZKhsvAeQ4TvN5vcIsbqHOQzXjU4WLA/28QxMNkdopcmqkUAE1WRThctaQEUX
	 0sdN3S+tbnioQXhF7JbUI9ZhahGoD7Wy0L24GaRf8WEdY89jY233hjevKonwA6maNgIok
	 cmHT68twC2Tjt8b9j76nGYJqE2TosiMQmNI+dkLpWFXXAISWZlNK+EYPOicZXLX1K0Umz
	 bZdlNvDuOPmat1SnvbCuhFIBrtKY1jdO+XtOrQP6XVlYvYhmtjic0P+8BiDk1oTbq87i0
	 asAwgkCf9wDPyyqEkHYI7akH57AaOkBlS1MK8ERc1aSpHLlWqPGjbf86Aczy8P2FSjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be0LeIe1;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07957606A882
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07957606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be0LeIe1
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efdbab4e03so3401845ad.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919493; x=1795524293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
        b=Be0LeIe1s+DPxfbZt19Ni7JzRCL/ZUq8og51OB5IPvEe/npjrIVf2knICyHg9DiqfT
         vsO+6h5KbSfVFqMjTY0OmDWijZ714YE4QNKtCNsZeUVGEfhjaVYoqDv1qrH/+4eKu6tZ
         2xDg9DQH68qDnAOZnU/3m26m3eIQV4pCp8w8+rS7YBb7uj5JY7Rj0BUI1LaLeNHXFf7D
         wDvZNYTUR82Kr/Gt4JHtk8pfS9dDDgoW4FYwvdApNXhD0nmSZ+/RRlTZYlNORzI+ZnoC
         4lSlMwpgtD5DktPoEgNj8Qf9os/6LBT48mGzASc+3q0u/pdLiseyNkCeH9KKuFizHSWb
         IUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919493; x=1795524293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
        b=j8zncMaA1dNAoNzPnBouybmDVi9N60LVyC5hocv6n1Sw3cqiJj9psjV9eQ61E8z3WY
         pkGL3iucHghwEigF/ffH7GzNiqeNZTAzFcVCnuKNp+2XSrxqOW+mx7F3W25NqSJmBVZC
         aqIG4wDgysHg/3PGMQD9NCTkovxxQd1RGKspaMYG2pofSySGVUzQQhgge4EM3lhpaanq
         KEaS32WZHG8420bSBMdmvr2+kXevAiEUPBjWKBFE+iwh1UBQoVM602LkhTzdo8/Q9S6X
         9a5Y4/ojTXFvtYzBGovcjn56ga59Xha3xbg0HwJCaMY1PZXfaThGj/lgaPYBQmQRZ9a0
         RCfg==
X-Forwarded-Encrypted: i=1; AL+hErHpo3e4FUpYzKByPbsRg/zr7fMkyfITTQngcVj49XcDI8Ct4Lds9Uz7pnccSZE39wlIgCbOKHP46ZtP@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cip2tC0Is7lHQ/W6nKbwxgJM9b90S2FpJ8IZ0OiwUMRL3BVf7
	8OKhLldn+zYk3Avhfz27j5hlGd57mCODJ4lmI+xfrCCkzYm0zhNRAHon
X-Gm-Gg: AZFdTZd/7w8+t+uEIkG+XhI5o2dgNVXmUuFiEsPVl4OJN/KxMom+Exi0EYCpd1x8SvO
	lH/6Zralb9fU9JVuXltyS6UcAx1iBKChMbeGvvURMLuI2RTYs67hKz2ra/UVy381u9rtjpnCsJJ
	Asl7ftpQJVfH1Ficd5TKwXx6C15rhymnoNsSKI67u/zcOJd+H8S7qoQ3lCUzIzGBC75EIR3HeKQ
	SXsI4c4kYNAwmqrSVEkH7qx47UlBEc79IoFUBauJ80EuRCCQJUo/6YvQLUb2MB4DFEOuLc4u78B
	yc8Oqib6Hc8kUUGLt4p0wijHa8FUWEIoiSgu4IxERd9HSN+jUT8Wq2aQ+FHZ73ieBxZ+gFaaRio
	OXD0afEK2Jx4gFrvNNq5q/7v2EeghRktoqsfsAA+9n0mwb01UwxFmpaOSFkWOj6yKFQFqGhVPHi
	8RWiMMDyTw3y2Gdx/ZdgsA9zhJe3fo9dEaz3gbDrIax2MPTn7alUc22fOzNJlGoYTJSELUqVw+b
	QznJ+9wKESAS0uIFvKyOHCSVCg3Sja45UzqyfbFvcMSoq2OBLAadCw8J3Tk4K/Kv3MZYEUFasCZ
	QGebrqm4HffG0zq9sB5Y7QC/0MxagUvUbg==
X-Received: by 2002:a17:903:1aa7:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2ee0da31f96mr148127665ad.2.1794919493062;
        Tue, 17 Nov 2026 04:44:53 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:52 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Tue, 17 Nov 2026 09:44:13 -0300
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx8mm-verdin: Rename
 Toradex display overlays
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
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-1-ecfd237cf7ee@toradex.com>
References: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
In-Reply-To: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=7204;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=BwcIZ/VlbJg2I+2C67AXmg/i3dqu1nwSQOaQPkMofeE=;
 b=zTGHKRUj6+QU9NIEurqGNxE6+qIs8D/4pyarGxXDtGYWJ8gLa20jm7Ox+50i3lhQqvZTfyk4b
 I0EhtdF3zMjBAvrXHc5G1QeRcEQMgywvvyeCp+gsfFii5KIqDDoSZ2k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Toradex Capacitive Touch Display 10.1" LVDS, Toradex Capacitive
Touch Display 10.1" DSI and 7" DSI are Toradex accessories, and the
overlay names are their product names. The naming pattern
"panel-cap-touch-<N>inch-<interface>" reads as a generic panel
description and could just as well name another vendor's display.

Prefix the accessory overlays with their vendor, "tdx", as is already
done for third-party accessories on Toradex boards (e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso). The combined DTBs are renamed
accordingly.

Additionally, the Toradex Capacitive Touch Display 10.1" LVDS has a
correspondent V2 that is meant to be its successor. Encode the major
version number by adding a "-v1" suffix in this overlay's name as well.

Link: https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 30 +++++++++++-----------
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |  0
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |  0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |  0
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..0bbc4b6a6b537 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -257,9 +257,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
@@ -268,15 +268,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -286,19 +286,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
-	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
-	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
-	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
-imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
-	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso

-- 
2.43.0

