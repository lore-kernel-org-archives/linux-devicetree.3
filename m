Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A029237CD45
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068373; cv=none; b=kuQqu3uvb++ig+5zOxoT0w4CbaAqs+X9Enj3Uh/WUpUyhV44Df6gnn2+//IZbFdKXKfgGKTO+FUV0clXZpj+Nygb2dZQvSTrnLqLt5ZCTEiYH/joIagX/UxGydTQFfYpYFeJfGxYGi95GPtCW8SAnx2+JLpHiiclE+7VSyOsD6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068373; c=relaxed/simple;
	bh=E8D2Pp3GZk7l8flDyWsDGN+v1xV8lS1HufxU972x9Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQpKfkV7gOXAiEqYS5ZYzr66G0jdaOMLEQQX/4Zee1YwZPB41vHx+RiDd4pgrkxxb8f6cQF9TmhgUVtwo6qoOdw3e+gRsp7m/M6fspQhSeI9e48U+D1h4+oXojxwydEg84QLa+sjdGo+nsNhB3itoXZDrrfudWQSEyiCdNRNNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuZksVjj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuZksVjj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so13755955e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068368; x=1783673168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=;
        b=WuZksVjjABZEElmHNgkFrqzEK5ZNUzqBflYuvRNmhTBC6GhOeMIfI5tv24qGYWJbIt
         oMUIi3T9CGmMe7ydZhOUSkOzFuI3DKZJfT/S7sIJ6RPZukt6K+Sr2fPHbtbpj34OSoDT
         5jlVQWFqbbuct0sRhKjt16jVSIL8K1vus/OiiTqc40Wzlh87CmNNJRsYW6BA2NkrKAZN
         R/BH5Q3U7Cb22HDBuYdmNy4MmgGRKheLnZY4k6pwJtp6g3kCZOI64q8yNXN7RRTIlses
         EnMCbKjg9HU+NZr9mdI8gCoGmWAfMDnsPdTILq++1kEPvQZwF7JH7utSK886R1w+HqpW
         vU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068368; x=1783673168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=;
        b=fMuCDCX7CMGwwKi63Xndtb917XUjRPRlbGcXTS7qwkDUyyIYsoVyU7xSwcZ/VcYPl8
         UAoZWxguFdF0GzoUolikT+mpEO3XyXNQN/rIj/6o+UuGGr/bB2Yqmv/h03jvCdvFa/OU
         E0kVHzbZ6VXMsXNubPGXpiYxftSe5KVCMu/p0RDUVuzVLeyPnIIzxaKXqmDSlPmsUTpV
         SJJJbEl8j7Tzb+9lxMjSYNH+PUNy+wsfvYa8p83qnwnr8MBHxZ3MZetx+x9bo1/iSGbg
         cb3rWEvPAmhWOi3+Vu2mMo+VXOi/vM4ED/Bp7DcDooVhPp3pKTNFsVG/QBpbXUrXmhqR
         RrDA==
X-Forwarded-Encrypted: i=1; AFNElJ8RoKWdntcnpC29WZdR0f1kWoiocG3REAz7KRHOWT9TGHuDL4GS9uLe4dxJOXc74+f+y0mXQ36FjV4V@vger.kernel.org
X-Gm-Message-State: AOJu0YzT5aSXKzWBIYgTJVo1zOizbCftRBabw/oCNEFV4cIGvs1cFHve
	8CQPcNQc8pSPZZI13/8D2rKJJPSeVrkP0e5DmfiMpq1c0obtlhYGzyRK
X-Gm-Gg: AfdE7clM0i/qnBF+9eTpU37UMnyysvdstngHB0kqIeWc0+dyqPhak6kMsQSZBPI6UV/
	y3IN/11JmAbxyyhnDhTng36miGQyAw5SJRhBhdzMYQyHPiCAS57UCaWdkV00s1bPDR55nXUIft1
	Gz7ts78VV+gtS3Y/89KbuWSEe2lYRkj4rhfRDprj3g0kohOE7pRXQpxU1HfrXocJZ1oxrefTEJn
	dq8sos+7QjyJ4M70sN4Ja0Ne08nx2aa/VIjfokxZZCtQv2fkgBln5IYLClUDjHv4xtyc76OMjhh
	1UeI9HCDvyUnpQbsG3WXomZez5aN2fbkG5+TK7p/LzLTOt1Bl3UGJt6/X3EAVvRn5gHxvgmZkbC
	Fbh5HYON8t0SYxb+cXaOqAI/cb0uTotY6Vw4UaKweTpTt6fhyUbwWkeoH5NeS2d82NwZRYt7ym5
	IJc0SboguxFSBLKTVjZj/Gi+Qq3Um3ZtGKN8gV7MrOa27R33ogc9B256p+Z3y43rydO7j7ZGduc
	JyjNo1CfExB5Bu7rc8+KhSkVg==
X-Received: by 2002:a05:600c:3f0b:b0:493:cbdc:7cd2 with SMTP id 5b1f17b1804b1-493cbdc80cemr21533515e9.3.1783068368277;
        Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
Date: Fri,  3 Jul 2026 10:45:48 +0200
Message-ID: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 3434b189fa58..b07e71d3adee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -15,6 +15,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mn-symphony", "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -171,6 +175,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -234,4 +245,11 @@ MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 38ef9e4fdf07..32f101ef2850 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,10 +11,6 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -432,13 +421,6 @@ MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3

