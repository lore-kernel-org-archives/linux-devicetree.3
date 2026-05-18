Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870F3F58F1
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114729; cv=none; b=O8sYoekOmmsOtlXmqxEhWl7+zM9obJ6Zr2jIaBsvrIZflhLYbUZm2UbXZoiv3MA9+7mbKLBLufXMasQUm9tXQ/9ue80zKjMaDENbgbzfNxFgsLU7kSRAo7aAEZFx5uSooqNXtnerTWijJ9NRnKnW50jq4OHztoFsShyjY3LRTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114729; c=relaxed/simple;
	bh=K7o9pMLNekFsRN2+H1Bx5xvmdBCysmzxPTFbJcLzqL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwhbf6dVNsMIKeVx8pJwtU/ZlrhbpZ7nojNB5zHZ3UOIaZpijNENRI4kbuc3jMbwVp7FmTW9vTb4t5czKLkjkQuWyHoCflSC/iWPifYLsdH1kdZh1P2NFo9CItUxixYMJ6PS2bqSIvQvaR42EliBqmqjAd5FdAwWZTZ0DZqRKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JIZ5Jgxn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JIZ5Jgxn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-444826c16ffso2078964f8f.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114724; x=1779719524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Sy2PqXZ6ebOtE0DOUjyEW5oMkeY/jMTLVTy3qbrNxw=;
        b=JIZ5JgxnbuDFg9cTTYzFi9n9r4oeWNTJnbnM/iT/mGZlOwGVybHNVZtasdDQZmj8eH
         wGEMrCl/F8ezn0xALslQU1fKVWcwV+bxLtYyVxpVTze7M8q44ilfiICHaQ9Wnz3He2zC
         3Eo9z/k6d+wF+qrB7540c1XdJ6jnmrtrLo/eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114724; x=1779719524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Sy2PqXZ6ebOtE0DOUjyEW5oMkeY/jMTLVTy3qbrNxw=;
        b=loEqEuQknYHDXwiyAGeH+8zrTJZSQKEAs+vjD3RazaYkkJ0OSYFwbxmOIJg2LMF5SF
         PlCi03mcobfqTNmHbGUC69g04BYxLIxkKyhldubnuwa5VbpGQpzdctobiGXuPL4NX7Rl
         KRWcPp4gx7VO2Q3ZrLM7Z2Dl/2H/2D8XupGVY8OLTN6QTiytARmSbuxsGdyDoz4kBgnN
         Wm+qP59qYMamGABSXCLs3BJPxpwLhY8BzOB5t5N136x37+bHsp6/r0XRsSf3pVQVy+iF
         l0q45i2CjlIYtiarebMhh379zh0VIbZAIcRBq6dAiK7QiAloPnrhV+0nMf7BbihgK5OZ
         lLmA==
X-Forwarded-Encrypted: i=1; AFNElJ9dYnD86kcyXkCH+fPtiR8iDYKdzpJoTjg2ZO0hH9yGOpEKe7OsFarhu7Uekkjj5tWXLXdDYeegWKLd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BKH0tE6aE0xVgMka2BDK7OfCjcnAk2XZbt8wwyX1r25nR9yJ
	EVXZ1a2kmGy/tgDlGPYkKQyJhJXKprEOwQyttYI45zdGKmug/7rb6ctBwkJbwlNFnOZtkp3sqAn
	ZNe3U
X-Gm-Gg: Acq92OGgJdshatQWHVjWA3aTvr/gTE+dEfRmIF9yvh0AQTDBIXSwJhsX2OibYXuh2mF
	Qzl+JjYUAcVny/HKkgJqSs3lPsvC4+VFN0stuyI0wEQwzEihCaenc5xuSI4m/DF/bOpsslD2NAz
	JEVTthg/a19PmYfv+5sDapHsUZrAcZZFeqbMOMZDhCu+z5on4v28tz8vl0NA4WyotBCOA06lfdV
	ErcrEMr1SJwYNt9jfPBkrzKOIu2AZ15rztqMJF8r9NmQouF15P4b3vgaOux5afLqyQ97FJOrfpy
	bduyP1zU9bXWmH5c980PczpiGvU6EyknypKWC108JgukO0Q8gINCH7II4bYI5Ei6HY6nzld7Fg5
	mIPOqTNvc7wxLHVtEQIY5KBuoOygZAkmxegru+HNeX1G9ehae6UBMqV4RETd1yvAHsyu2FjAp4p
	qJMctzY3mLjrk1lSgXdf1irEblhi696WNfRtVBMaLKXrHJXCM0tWzcPb6oe57NgmIe9+0IgcJZ8
	uYkaRiB5xWKam18IjgmdyLfxIydL2350uAsCxzlYWlpx0oA
X-Received: by 2002:a05:6000:1845:b0:44a:47a4:ce91 with SMTP id ffacd0b85a97d-45e5c58d4b5mr24057819f8f.25.1779114723899;
        Mon, 18 May 2026 07:32:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 03/15] arm64: dts: st: add CAN1 support on stm32mp25
Date: Mon, 18 May 2026 16:31:18 +0200
Message-ID: <20260518143150.3138712-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..d5871203ccb0 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,21 @@ &optee {
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

