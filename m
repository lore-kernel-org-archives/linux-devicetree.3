Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED121770B;
	Sat, 11 Apr 2026 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775912642; cv=none; b=r/KoKtUVkgPDQInfGjY6mc3LjtSKXgC+A4m4QSLEvOAI5FooSxlUj7RJzakTUsJuJ9ggeRbCsllUDq3C9J8PQkmrxUYPCr7Hmql/uy2oz2k8dRaq5XZBR5n4WpUS5yGlEwpTodlle4djzybPA13aentExy08sjOotHOD7S2l5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775912642; c=relaxed/simple;
	bh=5BP6GmLFUns7P/zG+k1hgQghoocJwzv39cfc4qotZsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FeaHQBaENNNmNAlniobtm7XArEYR22AXshgGc5XQsUvkGUojU9n87eiepFm3Z3AFb/fUqeczBqkhaCmanxCF7x7K1nBZyygZtZ+FH0Mc+g5/E0ZS77nF7b2Ke9zIxwFIYQSpeJPLB64b/gPb9oz7FDtqBct+tBK5wVqim+IzkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hFKe7xtV; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hFKe7xtV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DB8C113964;
	Sat, 11 Apr 2026 15:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775912638; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Cn2rQUk1tKmpxYp0wGwPKfZn1n0sjn09eGZvl3z2nRk=;
	b=hFKe7xtVoN+yPUb1sjbwm6420K0wWoQerdZW6bPlyzdKvbFUUdqWUX4XzhXgScxa7adfzn
	TS9hbIhXaTjWRKMSije7YuzzFnFH96Vz8U3CGibeoRZgOUtWWPLB3gjjCsbsp94ckuqGKF
	ZF5Vp4Hc15UTSnqVAeXb2eqKE3dNslIdjdJMDUsdmO4SJhbMCKM20oPuZ3lRbnQniNpLnH
	z5R3IcY9CFvpSmZFC26sFMQ2R6hrEIzepIAh6EdKfmsDhWOSn7YVM+KQc3OXThnPsyR1mk
	xUMGFlrKGh2Wi/6c7llTMklrRC68G0cS201N+likmo2Ef4uNWSsLZgabegt5rQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Enable PHY SSC on DH STM32MP13xx DHCOR DHSBC board
Date: Sat, 11 Apr 2026 15:03:24 +0200
Message-ID: <20260411130355.19670-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add realtek,rxc-ssc-enable and realtek,sysclk-ssc-enable to both PHY
DT nodes to enable PHY Spread Spectrum on RXC and SYSCLK, CLKOUT is
disabled and therefore does not need SSC enabled.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 9902849ed0406..70d85af467353 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -97,6 +97,8 @@ ethphy1: ethernet-phy@1 {
 			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
 			realtek,clkout-disable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
@@ -146,6 +148,8 @@ ethphy2: ethernet-phy@1 {
 			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
 			realtek,clkout-disable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
-- 
2.53.0

