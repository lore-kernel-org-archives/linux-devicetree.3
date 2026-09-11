Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E153A1687
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140564; cv=none; b=Rtn9epcM89Jzn7UP91eyxuP4dKcU04074MOvFDIOudF7FREMoBunTcHys1d0AuOPWuw6GICyTqGnGICgdxvSX336ApV99RffjaxTYzrr6xOXXbqoE5+XuZROes61Nmte3I/fDitgsn8OoKTyCAKSQoG22todV3+cPy5OWrDJ8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140564; c=relaxed/simple;
	bh=peYt46gEnplFq6VAGkOGT5G4FCVR4PjJCVV/CvQlqiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=US00UA7dm595Sfjtwzj8RHhWzWfEamP+sHW8eIUu9qEOxI126L2nE0Z9c47FTUnJNMmJyc9kIltu+xHPBq0H4yYYXW/OvxGzX7belBON58Z48yQxy51oG0k27D89y5Kzurvf9etRDkmPx10bHYu9TGlo0aoKcQNJu7YBFLQSDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=X9BUDtwM; arc=none smtp.client-ip=91.218.175.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="X9BUDtwM"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=peYt46gEnplFq6VAGkOGT5G4FCVR4PjJCVV/CvQlqiQ=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789140556; v=1; x=1789745356;
 b=X9BUDtwMo5RuqpPHiLXsntdkaPtrn4dznM0BxpF7FvQuWgBV5CnM81YxXX9CdLArTJTvsVdX
 Ui62sfms6CYNn1+RK8FQDIf5HUazc4Vd3dVWzfzUQD6/OX5zwOME5tJUdNrCmDyVySPgaUoKB/s
 2Ee7xwEaNvMwc0V1RGchUYCCCVW5MCLbcBnBiBwROv4ApgqUlEml45ns5Xp7TqGya66GQPz9Dy6
 erSANy+E281zijLeztY0LDsM1koHHrxbbP6kXXYCwOMOpcLnaxYYWTtdKirkhhW5TewT3Q8u5FP
 hrtq4mzYDQFhbc4yp1544A48mQCpFj3HFoxPRrkJq3SNw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4a6b1134c34ec148;
	Fri, 11 Sep 2026 15:29:16 +0000
X-Mizu-Trace-ID: 4a6b1134c34ec148
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on NanoPC-T6
Date: Fri, 11 Sep 2026 17:28:33 +0200
Message-ID: <20260911152911.2088363-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c6 bus needs to run at 200kHz, because at the default frequency of
100kHz it may fail to find the RTC resulting in warnings/errors like

  rtc-hym8563 6-0051: no valid clock/calendar values available
  rtc-hym8563 6-0051: hctosys: unable to read the hardware clock

But only sometimes. This should not happen when there is a battery backing
the RTC, yet it does ... sometimes.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 4d97afbc33bf..ff4f766ce0df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -455,6 +455,8 @@ regulator-state-mem {
 };
 
 &i2c6 {
+	clock-frequency = <200000>;
+
 	status = "okay";
 
 	usbc0: usb-typec@22 {
-- 
2.55.0

