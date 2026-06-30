Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF713EDE72
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811609; cv=none; b=Dan6hrOIq1uGCwlDeGEjicaFk/cF5MKWQn9HaW9XRxLUCPHlJ23DArWwyCbPlhq/W9rDoAggf/BI/5V1C6nw0egs1noEiAkTXs1LgCOw1TcYWKP4qUy8vvD7EFoFH6hiYprYCEFG2X+m1bvaSpW/zWBPLmjYUp9sN3QrY7HamYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811609; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfDnYG+5Ebn6j2Y5ksGGbMzXiyoG8GhxYmFdVYVwxqotwho73h8bNrpq269qmPas+128uF6Z2yifc0uI6F6dIUKEk13mawD4VBOv3w5AhX2nMm1tXRSUVgzSSYQYm1yYbZZIzopORwy4pCotqodlxJzuawILo6VJIDfhsQteuMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GoKBifQW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GoKBifQW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47122683cf3so1614790f8f.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811605; x=1783416405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=GoKBifQWZw7YmCKPx2/5YmC/1Us0MyaThtHR9lvHmNVZpQO/KtwVsfqpNSXQdR0vul
         V1/z1/lVkW7mA2doDnWbDEOnA0mezxZns9zktotLK9toaFC11HNSqvFyUpfVQmr+BmCD
         423t8lITCeKPr+nVKyIBmHfvFZE/+jTlzk3Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811605; x=1783416405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=CS3wU7TUGQUlEy/OGj9owx8I6OZuNL6qA0xNQtZPYjHIjptCV8s8FKVKPvEGUWcM7h
         rXNOlPFLx9zRagJs+MPmDcBYnaWt2U3+Ae1sXsW7yybD43wd8ODiFvCidrfOLB97crMO
         DOoVK2xhxEBrJL2T7GtNtw8A2UzfnbGlZjFd2YfD1rUdtOfQNLGDMORyuu8nEDmrrxOc
         whNa/FeWt/+H1M5KK/qWi1MkE/4sChsnN8wIWv3VFP6/9hxraGH4Fbj2wvoqNLU1Ejdo
         dRTx0o6SONEJF1te2XkOSL9WLGwFqKu3Kw3RqvokYe8bBb6M6kT0yQKxLyq4fdprT7wy
         /vyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqyo7QSmBoRyt4jxxFUogkNcyOhY1yECdUxPNxDHAhqHw5cQurHnF8SBgSIJgY9MvU/GSZeCcjwHKsA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJy5+G2cG/5y+p9TY/yfMq9n28sGu5rp0aBJ2Hmz50UVC/80qu
	hM1U//Ba27sTyvOjGf/Ixe4ksgOQxllyLzqqMSxMniDnMh8bzQf28O4Jbp2GQfgIHKs=
X-Gm-Gg: AfdE7ck9qVPZQx/4tnkmIG6Uc/A3HnfP71UYZ5/QS4cuKoo02yWvXomQbaKjoG4Ge2O
	sXTBsX7mxSIBoSou9Sr7ZeHujat18+gpgngQHQHWMOdvLweBb3mAG47gH2GuKFrRkmd5iQOpIe8
	QLR0BtSvKfQ4lJVWCPt9Clz8TpFaUHCM0Td8RephkUhjcLOw14rijK0eMRzINdyxY47TllszeuB
	Fs/ROSfthoD1SstBODTd908UwBKa8FECAHAJXm8Wpz+4Z6zXu7aX/aad2tLxOMqqu8m1VfCVe3f
	udIDutnOyWwklf1/guyZvh4XnY1/uaqdE4eOKPtGqhj3P5GNbbRKGJpsW3Qk+lqkFytDiNceM+J
	dfbxiI3kATPFzSGpngvDUEea5PBivpv6mqjKib1E2zUNoSxUK+VkBthMdxTpNnsekmT/4DowQWa
	S7nU+Zk1RkgnQOWXx3TisDkehegq7rap8OR8gT2/1Abg9J6BVw3f7K4CK2/P+6j194NGaxphO+K
	yz+3M/a3/+fk574m5TNZnOjyJLb0mzslJ86scc07Xm9VaOtZUuuYvdQ3LSGr5nYCuziBoQdbGzy
	IwPCsgS6zP0KKA==
X-Received: by 2002:a05:6000:2c0e:b0:476:8a:5 with SMTP id ffacd0b85a97d-476008a03b4mr1277965f8f.34.1782811605026;
        Tue, 30 Jun 2026 02:26:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Tue, 30 Jun 2026 11:24:34 +0200
Message-ID: <20260630092628.1695560-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

