Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C745BD4B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544398; cv=none; b=e5BxyAFfG2XOqIAAYQVGFd7RiRkfzz6iPTvTOFF52JhHeug80/CwYnb1pNFbqieXDHDKyZ3Lbgs50Gspy/gVhJVQipXRhN+V8QCuHR2MMCZPMF07QyTJbOHQXtdLpVR3NpIqincPeDTdNX+lHepxZVPk/AHgCLTG8pwYTfTTWmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544398; c=relaxed/simple;
	bh=mWp8cNG6FobHCzBdX577TxnAx0bfcXUKKJ3tl63Q6ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJe8l4hfjiIotSgh/LTJuCMw1rrAXETA55V7ipXvVq/uqOQJ+0F/Jh853QPsui3EU+WBf0Lp0mzBFQ//fP6JhahK7RneYpWSjD+QAEqaV10u2FrbU1ljyardPUNWpjfiPFfydPg0ubkSeS101Vd44+/F+dAOXlpVPnAiiaoMcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7jTzNtY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7jTzNtY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49558ce01afso8129445e9.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544395; x=1787149195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3O4HqI9FUl3N3OwjYhrI38dFG6px6AcdWe9jmzIWwBw=;
        b=q7jTzNtYEnufU9eaRJJCJuYzYNmMV542IVueKDp9fHlqXLtNP9rXy8cG7QIaR/7YlS
         H3hjjO+pwLSixNBzgzJClWF3LnWPYrnIYIt3DcpnTrn6PGRpq8u/YvlcEGzxPBKocBIU
         kLac0UUVGijPWAUdAT/TWjnoXsIwVtBGnCDbv6zoO+3fv1S7MawfYQh1fv/VLQMIuiQJ
         Ubax/54k+Is8dntodmNQ1WbDZ5c0r8syaek+SjWjo4DP4T15DR+fJYEe51X9Liox2O9E
         pFFHDJomMEgpNT9oe3pIHxm6gYA5DCR77UHetiM2rXeD4HThuyAzozaYkIJOvUq6Jkjb
         +pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544395; x=1787149195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3O4HqI9FUl3N3OwjYhrI38dFG6px6AcdWe9jmzIWwBw=;
        b=eJS4ijJXnsj8Yjkubw4D7XKgJZOqSs3ed4ftqAHL0SfzFLSxnhpQz+5H5cooHKM0Zy
         BVRy42149NvhLyMTh8VTwBwhJQ3ZO/90nW1bnlvy/xPST5iRxusemXuWW6n9/TsE7VQv
         ZIAhFUG79PhTz4vn43NopatVhbj4fRnJLz3F8ujJadrTgwyPk5dfTHdZDTM2jFTcGRvC
         Yqry2By+S5wWJULwe1D0usFT6dmTzmqspeJzPGCowlcsGKpCiQCEmcwBuZxQTCaTitu0
         /AB1zFcubRlcZSoEp+oi+jWqsw3h+YCWeGaVV5qQ5OHHF4EhoXBfSKtlTVgD8ySZQmDX
         Q6pA==
X-Forwarded-Encrypted: i=1; AHgh+RoqotdM9PZt+79XWYZzpUDyS4XYkABWqK3FkinIBx7LOoNxYLDPRlLox6HHoGyOu4jjYMKHG8zn/ZTv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/qe3KBeV+enHtQ9jrJOaLW8i135lQEQyBywO2FKrcMnk2oroX
	OCGdGQFVZqAe7GnAXy/zRSpDLiMYaQjuF0WURZUuwJXgXMxwt76o2o5D
X-Gm-Gg: AR+sD13IyEaGiOp85FTYB/64997i5e9e/f7NsQCedyTGKFBEeF2USLXOaTqAqbyHUPC
	Jys7CeqFbh5QOTiuCaQDem/NQadsa9JTTYxstZF6neKiHG2mRU013LL5OV+kxXAUfuUfYS/lhHT
	G0NoGpVNHBytDD88jWaF/+qII4yXjhs5O0Cdf7XIwp1UB5eZcX2LvAuwo6+gcWyIRO4mKUtI40V
	qtrV4CevzYHszYQsfgmrY8e88aix4qdS4EXkIrir7nSjp4LLVgsAYjAEmMKt7ln4ESA+T1aZdcr
	fi0CxQgOBy5Z7QhHvLNSho0b4KWA/cRSn/pKBt7SRtDXnq7bmehFpkxYw4bOL8xbOaAeSs+nMA0
	Svbplsc5G0zyqc9r/a/ahShKpbYc0x4wBFrxzWDwQnTPLA7ZnUmHD8kuuM/zXydbbHtdN3Dit+3
	TXb68H1iOkaVbPK7aoDzoMBVHuGkaeuRkTBTzKnJTqIjK56sTlsZwUZwmIddsp4fdWnZWF99DxD
	yXHGXsbbCZddQ==
X-Received: by 2002:a05:600c:4692:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4997c0f7161mr59440775e9.4.1786544395172;
        Wed, 12 Aug 2026 07:19:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:53 -0700 (PDT)
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
Subject: [PATCH v7 7/9] arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
Date: Wed, 12 Aug 2026 15:19:25 +0100
Message-ID: <20260812141940.246223-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7:
 * Moved the patch from [1]
 * Collected the tag.
[1] https://lore.kernel.org/all/20260707145135.247565-3-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bf0dbac66d14..08d919470830 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1302,6 +1302,44 @@ usb2_phy1: usb-phy@11e90200 {
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

