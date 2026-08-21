Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C643D4FD
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324367; cv=none; b=T5LEMt3cRQHi/LrpexImLr0K9F49MMBEWfLFbl+zEwdyt764BoOEXr+hrIjIK/v/M0vl+cnPbTmpePD7erbJ0Z0NpDKEirPbLJM2yFXT2+iDSnmY7Q+MnDWako0uTTuXHOOSCGLzJ5LAbbte76BtUQcHrNHA3Hs+AKZIveewopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324367; c=relaxed/simple;
	bh=rH5zmUK9SzoukX9NWfQSCfvEsqUGZmMdB2p0Tr+O7s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAqQ592JvEwg6kD/q3DOxZ9Z+C07TRQ0Wp1PXmvJIkku6BjnPbSPr0Cc6hs48/19R/qwaIBMN8BlxC4v2xu81gKu0nKwdRDwcM9FkRP5RwpNcoM7JNICjT3Imbr2dQODVs+mP3Ghr+VQq5a42gygJVlzkuDs6gtrKYwOki2YHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuZYwyfk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuZYwyfk"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2084208a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324364; x=1787929164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i28649nrMbrzjwe7lKZ6MKTSXfJUvAObdfOOl+7VWTs=;
        b=nuZYwyfkbV5ZRqjs82ast6UW1y79yY0pumJSXBsXCiwVBIzCTzQUk2LslBg/vpbCDl
         plRABzIvlEnVJ0TntEz2NS3Fz8HMHdJHv7JdJ7UTZidn2t4m4MsnW60SWZyaxDynOVsB
         bUOQ5+QbJtca6fMhdGPhsrOLtD7p1V8rLFVJ34PsUR1jGS1D8o0nf1rQXqlGrE/x2KFT
         tsybFqjhzeSjyw1U+VnGORXrn0oheKenIhTbyWe9PneAT5Jb9gpGj9zTxIWxYP+WaLLm
         f6SIc+0nbJA/yGmSvy7wWpCvP7eCgRRmyFGeFjTbErgoUWAkdDiKuYqkTf1af+d2195n
         Hrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324364; x=1787929164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i28649nrMbrzjwe7lKZ6MKTSXfJUvAObdfOOl+7VWTs=;
        b=mQWzTCsyGFzIxWXQYOBiyN0NVhuE2Pt8HfbdFO6rarUqiOQ7n52IpNaZuFb5yuZN99
         eIxEvttdGhlwkUWU9mSJKeR2FmYIw8ydBX81MKr8MIp4zAjhaUYycBLIkiii7QQjeXhE
         oBJN/c1UvmKmtuFFrJKXdN0xEO6u4R4QuVs0H+kJ6hUx5QImTaahZruHQM19LSxTAYCw
         en6DTC5nc4+JX7Zn6UnEihzeiocwr/7vZQoOZSOUGsgFTZS1q8T1TMuynYQ/9RliOYRR
         M/rvhzhPVk3UL0RR8Baw/vM5RByL2QIgxORFcaBYTYLcAz1/EQzCQ90c6tWknXbIVJQm
         YKrw==
X-Gm-Message-State: AFuF++m8eJiGe50yvzX5eB2sAU2WxQJ4xiH6Om8Q/T4U+nvMlBIVer7C
	kN39WI5EJzqcwbCXIkoTTkWJqVRPco32Wxx6ilSIzyr4cSvrVpSYEtUP
X-Gm-Gg: AR+sD111XWxzBxWNWmyhmF/RPP5nEONxpJH689GirRg0eH4d2fVKBqBz55gQo09XJXP
	Fhsgw+n3QbMMOK1Py4gYAktcDxYr4eMSNk5TADX6DWZ/a6LuMS6xN5S9S0TnT8Qxny+GpqaGP5D
	K2wrObhQ110bQa8f/Z2vpWnXufeaLP0EKOG64lK0Fv1yQfAJTCkvPbWXlNo6zfZcV68aHSwhVdP
	Dljoe03uL5BNndobF9DKSfKnaXrCfGQCxP4b7uRhfg7dK4R/WGP7s0I60AuCimlS2diV8fggvtF
	zB5jFSQ0MnZTXMSiFlgEq4kRqba147kPZVVNPUAZN8dSgLXnapzEzU7sm4vJt6zpdUFLDkg+AaY
	FAl3O5ke8K2LuisRmOISmTgn2mrZs/Kxrj4P/FUy34mms95JF5JDs4HrVdKJvqoqJfp6mJWtCqw
	H9VkYbYgNW8UzgfkSHPih7GinJG/MThCMWEjAsA4ws8YfJs6a4ZIAvoBJYufYRFZXOTevBxUxhL
	aCOu0fY03ikc6fa3q1uXKR4uHCVlaldw2YBy6Odsd2/CG1d6TvLgKv0F/TdhCC6SnkPk95dATjD
	PcNdjRDJpwSoxRZe7Ub7D3BLJ/MdiR4n6lqdMg==
X-Received: by 2002:a05:6402:322a:b0:6a1:f895:1ba with SMTP id 4fb4d7f45d1cf-6a42f20b899mr8424396a12.12.1787324363509;
        Fri, 21 Aug 2026 07:59:23 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:23 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Fri, 21 Aug 2026 16:58:57 +0200
Subject: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Add the required nodes to support the iMX8QM/QP USB HSIC host controller.

Keep the HSIC host node in the QM/QP specific dtsi to not conflict with
the address used by usbotg2 on the iMX8DXL variant.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi   |  9 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 26 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index 176e2e332f87c..44eee9abacfb1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -384,3 +384,12 @@ gpmi: nand-controller@5b812000 {
 		status = "disabled";
 	};
 };
+
+usbphynop2: usbphynop2 {
+	compatible = "usb-nop-xceiv";
+	#phy-cells = <0>;
+	clocks = <&usb2_lpcg IMX_LPCG_CLK_7>;
+	clock-names = "main_clk";
+	power-domains = <&pd IMX_SC_R_USB_0_PHY>;
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index ccf9f510e0f88..168f89eebeedb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -4,6 +4,32 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&conn_subsys {
+	usbh1: usb@5b0e0000 {
+		compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
+		reg = <0x5b0e0000 0x200>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+		phy_type = "hsic";
+		dr_mode = "host";
+		fsl,usbphy = <&usbphynop2>;
+		fsl,usbmisc = <&usbmisc2 0>;
+		clocks = <&usb2_lpcg IMX_LPCG_CLK_6>;
+		ahb-burst-config = <0x0>;
+		tx-burst-size-dword = <0x10>;
+		rx-burst-size-dword = <0x10>;
+		#stream-id-cells = <1>;
+		power-domains = <&pd IMX_SC_R_USB_1>;
+		status = "disabled";
+	};
+
+	usbmisc2: usbmisc@5b0e0200 {
+		compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
+		#index-cells = <1>;
+		reg = <0x5b0e0200 0x200>;
+	};
+};
+
 &usbphy1 {
 	compatible = "fsl,imx8qm-usbphy", "fsl,imx7ulp-usbphy";
 };

-- 
2.43.0

