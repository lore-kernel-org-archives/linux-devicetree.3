Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8155481672
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492388; cv=none; b=FHvbZynPLW7uE+aelDoaIE10+QBZLyVNPnLJ0llI15reXwfySI1Pb7PCmK73h+zr0GArl3j7l8AGnPnVFOJXqKRcbUn21S4N2e8WztzQWCkRRX/hrNoOT+8GwlwAuewIMSn+FtkYmDDGHil0Mii5tYvMMIJ/ZX8sgYVhBjpcFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492388; c=relaxed/simple;
	bh=0mBB7Nmgdb9DHOrwSylsGjr/VAlcq02PlWCpkRtemKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6+WDZiKIeYIy+pq/h5UBthaKjqHK2N/ceyCduihHz7qKVLkkyO0dd9KSkdZZI5cMnVCsTEB3KnQWD9csVeDEFaY6aGT5R+YTXfTRrBTmnx5lmoWW2JU+0+fjuuZNg/JX9k/X9kDbytaXBabBTxqWBPbzqdpO0B3KyEOATu9mu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqVpX+zl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqVpX+zl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef4223be7so3236189f8f.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492381; x=1781097181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=;
        b=qqVpX+zlEDvv7FyMxtexJO8te0DP9d/i1xsQ8Is6cYb+9G9NyNPn7hVxrsS/qOBGzU
         FaFWimycP63wxQCzePzMVXs4uIutcNMDEVMiLWKTf3L5ZZOPU4vhSd7Y6MOAlv7+2Hvy
         8BxcdV1wYW67hWpGx8Ze5YgVcsb6zxcbL702TjeP4isegdzGiOwY1WlbiEayRYt2H7e6
         17sI0yDByezLsPA21JVF1P91idKZaGja7TGXRNvikbQczt7oDsHUziTATvqOS7+Bfaac
         b6vPJqM7CCE6FiFzbmXy4wYriKtszpTli3A0Qw/4BfrXhIJslPGsXWcssrCevJe3mXpm
         /S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492381; x=1781097181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=;
        b=LiF2AW1H7KG+HHLRN0zO/sbQ1RJuAYXmfo5Ji0fGk+pOdJNb2bG3Vi1U845roHg+6/
         ew1dpgR9ZuYaZxd3BLbwj/ptxSwXXvPqWQNqvRPnQNVkEI4+6KhLv+YBcqb/IbqV4jpl
         QfqcdUtcjjGXTB0UK2bT8rQGPOslchaV/N+m1ITZIALeJ3oRHv9RJvzMWr28HLlehLEY
         Fz95g9OVIxeqo5jWncyRYnHgwEkhVZMWlcsp81AeBWZoPZ8uYunJRm6od6rB1xhTj4iV
         CS4Enduc0HATEcjyOnz3PaZTgpvQUyir8caN2in6wTryAxUp9OwiZeOZpOCXd+W43J2M
         bMTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/t0MWS05KAG/UyMNdNokNHGMFQ61+xEaCqiG21+EZBiFUkSBjJk7OUw/ounkSX266pRUVY3yegw+vE@vger.kernel.org
X-Gm-Message-State: AOJu0YzYvbWehnqUK1HyejFojeYaX1wp/Saq5bDyA9whwTQfAaOmYiyF
	DSmoWlSfs8rPVPOTaeFt9eIKk8zNwduByyKXheERd42UOedtiYmmOrL9xwwSsQ==
X-Gm-Gg: Acq92OFYWWzJnneZ40ZJJ6F3aS41KYXIg/8WXSoLkJpbjHowsCTX4LGKXByuNeXCEsQ
	1UCZgwRGuJJkUcJFSYYyyVMMtiLP20bhsB1IjcVaF8vEgKaw5A3L8hCeinQ3bCdjfzcTSlBANTW
	ZTnQ23/hB36wNCLIWlpImQGfXGqkNOs/frOnxckkGEFQ/RNrWZwxilRnWXB+b97eVgrW7RaboAB
	ufXlDWNuMCUdIslFRIpuert39+jmEuTt5Ku9/ykWk5gOgpDjV1cSovWbNWfLvtC4BBctts92y2h
	NGQKFuJ0XwK3mP4x+aju2dXaDD0t2/qkQg+YsiavthZw8Xq2a0JFbyZdsj5Z6O44Cr20ZU77Mtc
	KmFGxZ74NeLkYQH6wWsgyOay8tPI6Xi9F3dBVZ7cM7yTJxVeUwTWqv9hGkwBt1lrq/uYjuLUdWK
	hzkuttFdPB77lQvEvkf1Sj6YLPIchkhY1MKqr9Pv0TyxlmAdhdy2uy6U64x7p+JpxvZxD2WJo44
	g4g74oSMhLCp8oOX28YbdBEcdCHzzyXbFF9UBRg9P92ACeq
X-Received: by 2002:a5d:5702:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-460217a6ff6mr3663164f8f.10.1780492380895;
        Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
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
Subject: [PATCH v2 07/12] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 15:12:45 +0200
Message-ID: <44c0b8b81ee16d0a47f4745428bca54497f993ac.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index a928dc2d9adc..4d8791886a78 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	status = "okay";
 };
@@ -252,6 +305,14 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

