Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4183D47B3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929692; cv=none; b=uKbt1RGadyTo2i1YEoCLP/KfHMUKNBYFWtbJncdgZ/lGzKR77EopngcMR6JlX+iMQGs7YrZpnei2o2Ly3QM0fe5KnRQOgUKhHacb8fu2mOnUDDap60tn/G3BrboBz2krtTqa92cyB/H1pfUO4wRD4EHUoGy9hfgUFeRUq2gGfo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929692; c=relaxed/simple;
	bh=R0Z0w3pzcd7hvzgUGg68GXouwsZHRDKWxJ+hHZRL96s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8Tvolt4UYDxCayto3h07bjJ49nMTfO0Ya3UcMYQUpsodXpDGJvptTVBfp7UOZiU7IKMHO+Wbeyxl7DxL/sRbptqXXXP8aHZUEh+eWJ2U65D601vCd56msC5WxWELIAyai9iRYZrYBi5ItecBafa87HzPmZU4SFWyhxKSHaqJpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbRCyHQT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbRCyHQT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so3093732f8f.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929690; x=1781534490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=;
        b=GbRCyHQTwDyET/Y8ZN9meUMqQH4DkazNKcFQfslWVvAz7i9MiQAUt7zKyVh2v9Jv9b
         5jlDMr3LWBOB1Yznx+DMP2Jy4sNMt+9hw1Kl/eLLmkPA7LvAqszw7Wh/2Yk9i2de/UE2
         EzN6+KRIT9OY3odkEMNUdnjdkdG4GVivQACY7IhIH/1TBM6mh9nlQIY+nnm+VUFdTl5R
         EhGAuLFnfwErWJtfAABaiI+p5PqMwcaloi2l+A21J7iy4Jr/l5VtzArDAcS+Wg7bImf/
         Du2351TdA8k4XhYrktj7EjPCjdZcMT+Hd8gLnPPBBbr2cXC5Zq4BYxGrQe3iR4rJNSIb
         zWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929690; x=1781534490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=;
        b=ZjyLR7JTEQTuyraGizaELFh8X2PZMxKZmtFcaBH0SoI+9LmbkI425ykHXbXJ5cFiP0
         xOL4iYOv4mAJkvImDLjBFUMvPCOY0qUXY3QpkAP9Z5DBlS4hyeCa+bkUaCM7MZj628Rn
         A4fBVeH3IsJ1SGGXEwZydJHIRyAc6dfGHvIO77g1E2TlPjcgYj+kRePIOIsaYVu/bjTF
         2QxQpndWKdeiA2GjhdXCaip+rLdEPqf6oB9qfVQ09I+DnXxWvuz1Q1cBXR9N3N9ORw27
         8kGx5gNSN+ZRjSUbCdFnZNbixCdF7aMZHH+sHhMTm7v7dyhgiGrj3FIWNXhS/Hto2QaE
         jDAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ESRUz2xC9VIWtIELTorpoPBPMq+oT9h2frhH7MasFNR0Ngzj5hodrsXWwRS4wAknGPl1TtANWtJ/e@vger.kernel.org
X-Gm-Message-State: AOJu0YzZq4/4+C4bx2wbuwN/VHLuJSJG+3TVXEF3Zz0rlDx6JDsOxUoj
	adAR3+Mq7Hl5J85dWb+Ji44LT4C/AQGB+YWq0T7B6PUKOEU25qQHOJaah0fwnA==
X-Gm-Gg: Acq92OF4qOTLU+SYGEPpwPzu8AsBkkdSfqmycaHpr5MXzMtSOcirBs8fWoRiA+yx3y9
	qrjYlwzCncK1voM1qxzLShwSECSSXA83zwCgVK82G6Sna1QE/8BnYP2YPzYrnR9qovFxzX9wVTC
	6Fg2bsQSlP+DCDKlOJOQSvQSuwW0OvdSLNxVl63WG8eX5APwxwWEtOz4GXAdymJFaEwxBZ+fafG
	JVLhVyWjcndNvrjDIt+zOtj9ZQUiwwLvNHNnjsu1zLZ8hdlhPdvR0o0mcT/zghxJj7roCW8tHHF
	qCa01MOcFrok8YwUcFUmVpAelBZXursxUV89Y+yHilS3rUslMJUFRY+SfXivjYfYygmWwbaSrG6
	W8C9sfvi0P0riuhcKNxrQJ5lCE0WJ18Ce5BY7VWnEduTHXH0D3I8OZl5Ubi3kVbXLanCmv4hdiC
	xDfmeN3HXUXIbed9KCB5TfQf47RZ9vPIv99q8eBnVXjYI6rqpL6YyFU+AFwna854AuDAuA4YpYI
	XJR/1hhqDXhQm0FR3r/JfHy1MepfFNM9ugrgo1miO5776VE
X-Received: by 2002:adf:f911:0:b0:460:24c1:db8 with SMTP id ffacd0b85a97d-46030777545mr20410603f8f.38.1780929689827;
        Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
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
Subject: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Mon,  8 Jun 2026 16:41:07 +0200
Message-ID: <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - Add pcie reset-gpios instead of deprecated one

v2->v3:
 - 

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index fdac4ceb4c19..698f02fc39a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

