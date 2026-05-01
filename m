Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B433932E6
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632687; cv=none; b=Aix7SLpXSbb9iGs1BZsys9zE+Pup2AgmW39Njm92mDjUFDG+NQddR81JnCCywmC3azQ0slcXIWhXWVf08lGsI4K59aRUhGttNB8kJha3w8P2z1nGN5kRsYdGoPQXkvodgPGn9YbDlkRHhT3S3NZnMIsg4/Q+EdWwp0wfIKzpFdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632687; c=relaxed/simple;
	bh=YZIfv/xYMSLx8rfHDitsoPPWFI2+0SnNLOTeX3UVhcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1pkc0nZ70PFfHdMu/Y5ZUscL51220fZ8buVjSF3260pr2RS3SStAGMfbrdD3AJPBywzDi8Plfdf9sieHMZYYWvz48Y5WpKpM9k/VEZol2oZ3K2mxx/EemJRK+cFSufwNCwkdq6wObHvlbDZHxwremoMXiRBZXdbyxLMedOmNHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SypkS0Kx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SypkS0Kx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso13784685e9.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777632685; x=1778237485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCDFZE6fV1aNg2yGAdNEgFgwQukxcDX+8Md/YoFmfdo=;
        b=SypkS0Kxn3dkyHxYjls0/n0gPkNlXGJiBfPmMApcEH2UkiS0rUOFKFqB4AX9nD3K+I
         4EDdY0oX4Fe4EWP5xiWaUyZq5Z969MAE6io2sbTdpCo24kmzgxYM/yVJMGci16ZjtmAq
         B0kY6Ycs1zdU7bLD59EU0hfqT14gMO7qeVGbrRXcbt0iUGU1yWGQoMNmNot2M423baNT
         Ie7XxPgC/mZDXsaZ8SA6TUEJsmyutbbrz2I8pytKb2K4ao//IU8UJ9kDPi6PGHcILiyG
         40IfGYfSKg4MxNgozKf3gpEVsHTOY2x6rJFNwt3gSAgjGg9mSnoDIJt4Y24wv0BPef8c
         aG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777632685; x=1778237485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCDFZE6fV1aNg2yGAdNEgFgwQukxcDX+8Md/YoFmfdo=;
        b=fGbI5menAkWkXbpNPE/5g5h4TI+4Y1umI21w0kjYAMp03PxhS6vZ1psw0X8RoGYnPS
         UdLUdON7XBxnPfTiw4TkQYwV3fGdm455izt5SH3+zamHi1eCqrggOPUEFVszJ0vP1AfO
         u1O5vvcfLx66JOQcuKBMdThkkLb+/guNMWaJ2G/YY+qqqyHl+wWIFavD7+jE2Zja/5HD
         gmoCuNxhkQmhBdByLFN61ofKSBA00+m5KsX4PKdUphQamiPmc357qBd+q6WNG6h/aBUJ
         aW8gD+Whvmn2qpoHv33XUCAq6brtWhUfur2KrM2cUtrTSZMPVKAThJ64oCVxWqB1Nojf
         IKAw==
X-Forwarded-Encrypted: i=1; AFNElJ9dO1+EDswS6aF0R/PRzUevYEahuM7CZe7qn8YSfDhzCi0x08m33BOUq8D1EZlAhxSLGGZPZz5H84L9@vger.kernel.org
X-Gm-Message-State: AOJu0YwqRihLm8xWohHwLhWu3QW/Y9TcWlfxoLZvoDFLI2aZwPBTcdHh
	BEmUnQ+kybRwzJ81/OdzmA1B3N+nLRaKuf/f05a1QTTZxSyV+uS2wDtQ
X-Gm-Gg: AeBDiesJ2jh7jZ6lsrd3ge3PW+CB72+7DBpRnEabcaGXqu0SPKFCleAmBBP2gEXtltr
	3ezPCe2phXCZ4vYFvano0WMt6P/CnTHNvgp7ZvjmXeAgQTbl1T1cg1UFspD+TXCDINmiH6ygpcP
	GT4NjnEeULLLQQ+qujW8Trqlo59IzVn/cZsDUUa8Q3Yggmts0JZkQ4o8+iIHHkGiZ2vwM5c6d2o
	JeSgx/DjN30+3gW4P67uAfUF0HrkaSlXt5YSIVMtVtDXANrxjQXD0R+G4L6OVtP7xG0pF9j8yFP
	G6sho8COBja4xYE8fSy4jBQWBLRGCVnBDEl9p1RajqzwxIEjF7Y6SHLWfbZu+/lIWYJFaVO8t1d
	OjH9wJnOXyZgdyFwp7BiiJ7V/YO+QlnuAp62uAmnYay9sVUMc80qZPiSWY3T6rBHGGPjBgULJyt
	wOonReelsvCmm41cF82kXqj1vMIx4fXJttz/gGM6Jqx+qPq1/tSjM5trhJfdZ/W4wdDHAQBUIxF
	GXPDLq7nMnfkwTciTKTWObaMBulJ8DARztwV4Jv//Pqo0k=
X-Received: by 2002:a05:600c:8b22:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48a84524e1dmr110237815e9.20.1777632684583;
        Fri, 01 May 2026 03:51:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm122313805e9.0.2026.05.01.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:51:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
Date: Fri,  1 May 2026 11:51:16 +0100
Message-ID: <20260501105116.33452-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the PCIE1 slot available on the RZ/V2N EVK.

Note, the PCIE_REFCLK comes from 5L35023B versa clock generator, once the
support for this clock generator is added, the fixed clock node can be
removed and can be replaced with a reference to the clock generator.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 00e5455ea5ab..43ffde419d91 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -63,6 +63,12 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x1 0xf8000000>;
 	};
 
+	pcie_refclk: clock-pcie-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_0p8v: regulator-0p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-0.8V";
@@ -333,6 +339,17 @@ &ostm7 {
 	status = "okay";
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pcie_port0 {
+	clocks = <&pcie_refclk>;
+	clock-names = "ref";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pins = "ET0_TXC_TXCLK";
@@ -383,6 +400,12 @@ i2c8_pins: i2c8 {
 			 <RZV2N_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
+	pcie_pins: pcie {
+		pins = "PCIE0_RSTOUTB";
+		slew-rate = <0>;
+		renesas,output-impedance = <2>;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.54.0

