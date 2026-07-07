Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C952370AD6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435909; cv=none; b=Tom8iRTZUweDcLtMdNHAaP1sF4WAMxLs8P7PBnpzBzWdzH4qMO+7vBOfPUys7V0vGVIzjaebYpOc/AuuLxHAJnFsiWuxNK79mkpiCLtMBO5xWD1MBN6FJzVgr4gEPONclqG1HKFH2LKpkSSFUtL8cgepy+1YJsIPepn/pzKHBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435909; c=relaxed/simple;
	bh=vAslAFwxtnX76SeSatSOQIeLFuAwnMan3jvx1EwTzLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdFfEkIv6P7oXJsq47vLtrxg9FL73xRQXHHeOUISDTGxmBVxzgWKAruQBLBr+hkzjOiUhkhqgBRwLFTKB3LfgtyZSm7rdb9QZiVZITobuSKWVizxmOeC0Ea3RXZAydDG5C3ijloAkFpsPqqLi+3OmASBL/x/C733rIDAP/lGhlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2rV6ohz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2rV6ohz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so4646675e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435902; x=1784040702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CDPmQD+4GY6QyFnHeYogutzK0+DQlm88rhGwro4EDM=;
        b=P2rV6ohzQNC1uhuBAt2+ZI3mEtMgwG3cCxoz9sr4W5BGDzSeQK52EI2H0BfBX2CMgr
         2AoU+v5GbhmaIegyo+6uOkIco/URwstR3tbxMcGmcmf4Z+d/2O+Oyoh6ttELPT3HeJyq
         c7H9iRlVcn/TfhuOgVFa4onjEFvSykuHDBRV5QXSv9PXeT1ImuFFRYjq6P0vpl5CEh+B
         x2f+19+9qbxRR4EFrCQqDgmSeVXaaeBQEB7Oa89PcpkRS2AOXmM9vVoOF7Y0s6kQcXYD
         Ac8/6Vf2i2ywhYTJjqMjoF3fDoIXr7Esh6UdaFUB30ybPIe6rgQPJb7Bc4My3WBbinck
         UDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435902; x=1784040702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4CDPmQD+4GY6QyFnHeYogutzK0+DQlm88rhGwro4EDM=;
        b=OQ6bC8TMmk/qHKjuptUsKkqikTZ32UnHAItnT3i5rUh2oZWcmo8JXhOGOSpafGmyqB
         IGSrujGcXTlZgKM9n/NJ+8AUd79/QSijCy4pM96CrKwDeNx2D+87+T32ewZ/JuHxrj5G
         NFhOx7baLzZETpngHNke/sqZE7vffXuZedwSCoTvVnBYxRMM5pIdfIHkt69x+yIJXzSL
         WzW8H+nHUkjVTQROAYfhIQ2ufRzdD5SpYdQCXZHaSqsJonszhviYvIe/gyCLJXKRkkpu
         tiXfjOpVG/Wm3kG633Kozf4G9SHMH+mExqnBFnLdm6Kig0KB8wqHeXTq8+XCYYo5l5aj
         Pn6g==
X-Forwarded-Encrypted: i=1; AHgh+RoSAWRd3xfEleB/PGxnVMF6oHBAazy9Yi6mqqHdx4cQBPi3Luj7Zp1VIQBIj3EQ7VpbsvU+2fnzcEr/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7GEPmI2IHhZNpjgmGoJ7bmkbtxLkbw142sUs0rLCJE1jn9E+U
	0/kGU26ax4x0zW6uzFVp/Oxh5xTyC0uW9ZhRWnSSNduO2re6pzx8T/qw
X-Gm-Gg: AfdE7ckfwdoWuU+Qpa0pO6fRXkA4fnvT417jZJevzh6Av5WaLgkH6crPEVy5o5hj6vX
	RSuBAIr/PIA4T74fpTkvtjaN4JQgHGZ2hR93mv3PTamK19NZPsHmV+nNWVWJN7MnWIbOaFbiEGZ
	PrsBv4flFca4IQJDZa5plHLw+6csJNvRM3m+orIZQxzRYI7hyf8G7O+cclu5odbx680mi80lVl2
	KLKo/aNN4kwu0IfTJdkAmDfETKyyCMIe+wEjkavl98U1WDS97N+EPa10yvo+krdIIUMd9MwA3ok
	fXM/KIMgkK/S7qHcI1r/1KZy4pFpnOAJfKo/s1RwmLn9cilY8WRJoNZlK2CHKm/QihIfTmCBonw
	nZVDEw3yBRB1Q5kMC40amuNBzn1LCuvQwyqAn4z1B0dCuzTWGx17aB7iYsAr1tsXRqgghj7Jga/
	2Cv2oQNCr4dwzMN8mBsOeUw51nsxw9yNrNhOcqqQ==
X-Received: by 2002:a05:600c:c16f:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493e101910bmr34953405e9.15.1783435899787;
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
Date: Tue,  7 Jul 2026 15:51:31 +0100
Message-ID: <20260707145135.247565-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 926a81cec37e..4016eec80847 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1303,6 +1303,44 @@ usb2_phy1: usb-phy@11e90200 {
 			status = "disabled";
 		};
 
+		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11e30000 0 0x10000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0

