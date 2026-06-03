Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CFC41B36E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475111; cv=none; b=QOebnlM00VIgo+SXjafWKGxvKJHKd3F1O2lhAkzfTytU1adISx7xaaaWSNFY3orEQLqE3JnSCvrdimFQqnZpA91iJdARpOOAGQ4PjQB/iptDPRUqnkkAQxo5ybuMv/oyS2Crxexiy4n7wybGk5Vvv7fjP/5AEN3puVTVrrh/BiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475111; c=relaxed/simple;
	bh=8SemRYEAMxCfyipP0JRkYfVN40IkkVu46KbOG90/ivQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5Pa9dPMUiRjN1zClkOuz3A90DBLXrVgRZfozmZwOZfBZRzK9+ul6g/OeI9QHUiwvww6fNh0svhxSBqLaA2m9NwBC7LD6ahDvZcn0e1yd9+x5TJ+GVuI/+RggbjPVnbtOJemEoG1O5tnXxzpymrZ/0m85sXypBRcvp3aJdqAFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao60fMht; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao60fMht"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso35116335e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475109; x=1781079909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=;
        b=ao60fMhtgst7jcvcRys7sxhoPpkJhDQxcXG6a/1hm+WjkreTN+oIWOSm8Fibmf+GCM
         QbhrehHUHdLlFaQ+PUx1NagY0V40BdLGtCTsM+66Tj5VCwqGuAt7vdv7FShwaEdARtgs
         Yu4jPXeCxawmdN7oLsPD5MV2SyI2kIQcG2rQF4J9gQbOI9wvsw8QiTA6pCBJ0W6Yax8I
         caTZ/ISthuddivl4p0d7eSY+r8l/iQ9gS0iLobFkTaOzWzdpfSvtRz1JGLWGTVTsSpnt
         gzckh/0X3qbQvU3yJW9/J+ioWPfZ+r5tCzeSNqX1dbk1IbjOITbEMewXH8/Ag+64Gn2n
         S6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475109; x=1781079909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aN2ZxG3DaQG/RPv69ZqhIztARyJQGFSar0GLFb/Q3f8=;
        b=eE19O4T7xTzWaKRGGb8puZ+XyDWu/SPbNWYYdFwUj7XIwXMmvxnygvBUuMrWIgRt0b
         oT0m+Fy7lUzpAEy3oE+elPlhSRIsNGJ3A5p8eosM7uCmi1IIRVvD8eorXJU07wOfuqaB
         UHkDJj75P1d/MqdxmmsvbM2yfsEjjzKKB8hrO6v4tt5ii5hxR8JmZnOLVhVMTJncUYBn
         Fjm0NQ1IV0jDx4JgUvU3FqQYrXkGPWr0rZe22wlLqnVzYMWAF57ZP8vE+l6mH6EY3cO4
         M1XwICwjaNuK9N+Uosy0SCtWl3bTETK5soQLC1GkhbnsNdeF04vssLPOulBiEc1N/Gdo
         +X7w==
X-Forwarded-Encrypted: i=1; AFNElJ9z41kvsp9mBvnKz1/O/8E854BLo7BwaJOMuGj2xyZQdcmM3fKMot4Y4p14lEWQEt+7stfIdHvt9mx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/F89vVrZgqbICYs7g3yXJ2pNmW0Go1cDeuHTRITlE+W7IaqG
	D0CRIIrD7viTR84rcHny5f1aNZTnMts3DuP0PBjJT4VnID5rgA6smOTG
X-Gm-Gg: Acq92OFmcOoTkPvYvi9kQxR58z0S6akkTxqqMJoYxFRC4XFHy4WV4Vz44vJKwRWOQFq
	jxPizH8mwPixdmIBLBF05nlGW0TuGUaGoJ4upC9xyHnLoV5Y5lw3EWQjQtor06HB/7CRZPAxPaB
	t7yxGrcPa018XBOdeCvr9qt1Y0YWcR9X0BQbKThW80sKpzwJmbb39agUsntUV4IhWz/6IkEV9gf
	iRV6I7bZzfUfmmZv0ancPnqhbpBBrwVtPNxnzpCOw1xUZ279GdqdlrSzgNqyOs1s2iRfTGZwTs2
	xgd99Fv48aKiBPGH23VuP78hmtNqrIZlOd/o8nIFT96KekriKKTsKxvsXOiB7YekYVAAHGjkLr9
	c2CYn9y7pfUy0yz+1eGY+mNguQfAMAPQRtXBtoxwZ0KrUgoJDoOdRTwty5VsOmT9C4ROChWQqvE
	g/pbrW2qrqofQhlPp3I7O3yy7MNb8eZPzzK3M7R3/9YvHIv1FzmaZsnott7ikQBXV3eXVzwI61U
	kXjJqld1VGeY/uuDhcOircnuUQIMrJBu3EhAiy5nPwod9c4bDjbaYC2Gkw=
X-Received: by 2002:a05:600c:6211:b0:490:6e12:5418 with SMTP id 5b1f17b1804b1-490b5ed36b7mr40419825e9.23.1780475108995;
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 2/5] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Wed,  3 Jun 2026 10:25:01 +0200
Message-ID: <95c0dbfea0536bc38cdc71d7451f99a3fa4aa08f.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c736127c7115..77377127c18c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -305,6 +306,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -441,6 +448,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3

