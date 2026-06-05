Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2853A9DB9
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640954; cv=none; b=ejG3NUcOgjiN/1VMpAy/UaVreq8K2l7vsovxTBUnhmgbf7QXuMtkdyHSYLBgHOlSNGXYBoNxOtXMZaz5WVnmM2T/nW/2fujUqdSHhpHIYf9piF84An6UHv1Y7hwlC0MAwyhdJZWz6DMOFJqp+dZOXCdgOgr5ZBJSetuZ7DpKa2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640954; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLG1ipn7xpzBKr8qj1PTVcIIOgDO+UZYnSRSaV759cTcHGTnDLFKOEntksSKHIlDWO8oVy+RbufBbi/UCMshP1hOnHX2bYcH/Yk5zv6l5UUXJ0WrAxwW5z6FEq+VwiP3FawFYfzXkzDe+DXo0c+kt5V6w7TxElVN6A4HD5VYDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KSQYDOi9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KSQYDOi9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1060969f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640952; x=1781245752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=KSQYDOi9mabY1ACvziC34TFiwTuWySe5SfCIWx+oZGOrbTpCsIzGkYfGD3a0pn2f+z
         j5wSp2YvHBvndksBVWosRZzs3y0rf2vfSpSgYsYxiuVNYENuKAoePN21/+G0mnwBukHr
         cDsbdovbI33smfnDGu3g+dMatr5Rq4xU7h+ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640952; x=1781245752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=NjBI9uY5QuezRaDAFEbh7nqLEublBBbbJ+3BiUJHG6526MhegS2DzJPLJGDhAb/W5G
         hM4wFbPI2Ddcf1yScXKHAhoXI4MNRkobTQ+Dszxo8FLnMbAaIPiWe/meONllgO4ACZyp
         1+9KE4Jjppd+KqLRba+GwHJHAX4OC03wsC26i/2IbHqAQcoteEeXem4bL8qyJByzNJyn
         g0uOc4k6tdQTgEJJZEHYJ/XIRLWp9tw+r8iDoVyqp+CscanL/Cc/efEMc4oayIaF5nss
         l3fZlLaVGp4qpT0PnWT0uAxUS43acrncWKGVwZIJ5AFq273TrStyXMaoocVCYsgxsjnZ
         vqZw==
X-Forwarded-Encrypted: i=1; AFNElJ+HsPy15yInOfrGu8S9ptfSPv+6QU7CU0RcqbNyMnJKKYIHhpXENJW7V/w/5VaYg+N6ZNSeOJdGx27C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33d7NBxkVlu4dFBpJ5UFUIa9uVXl515IHLN4zd/G1M2DZl0xM
	DduRGAw5JGozrWCqImpwVigtirEy27GS7skJ8Q37ONp8UUgLBihsF1fJpJvJLheErxA=
X-Gm-Gg: Acq92OEUVm5GSV+IBfIzK9JD2jNMr+xv+o+TBHlGdq4AgpBGcdcTBULlHzcNiNAbK4G
	tX0xOzU9a+1zs+llU1c0569HMKLoLvdtKON3hPkDfUbZFPcdRvOEo4EKpKHoh5VXg2jaHWIxnIX
	WWR8mlHqcyXP03TceJbYZ4X/El74kX6VPsYi90vDB6SDYXDBN0kBFNMDrjrwdxs6Kjzd/Nynl0E
	5CshOhVxXOc6LNwBOCLw01POwq67YQkVxXZ11yDHk+KfhyxwGdqEA7VWj9S25/MkPQZDCYWGK5f
	OHaTPCiQs9U5cMq6ExC7IpLQEiZJvG/X88wzzLIbhwgixiTMx8t+SX/RD0zrC5ZHe+m3la9uv3r
	KD6EwE++J/yV+FQWxsjOW501SYRzKlsOenA4aFGfHpM6TAkn7lH+MqhdpGooXSMRWZ+VX3SkE7X
	a8NAVaWV/08MZcFKWfR9URqZo2lVWN+Vh5xDsh+brBESxUPUjqGVWWe+2Tlg7CdS1g9xxUHrWlu
	qbpBU0pQyzroJJPyHJHSaTIoXL3y/3iA6ak+Qzi9jXLZqBR8o69p9t83eW2sm/OlqaeOtuLP5ME
	V1kEJx3m8iOrlTF+9+ifPFFIbczGG+9AzT8=
X-Received: by 2002:a5d:4384:0:b0:45d:b14b:23fb with SMTP id ffacd0b85a97d-460304fd053mr2454230f8f.11.1780640951753;
        Thu, 04 Jun 2026 23:29:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 03/14] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri,  5 Jun 2026 08:27:31 +0200
Message-ID: <20260605062900.368376-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

