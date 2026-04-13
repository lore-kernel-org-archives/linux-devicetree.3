Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38034DCF3
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117238; cv=none; b=nPI921N3QcvSD4lbut8lVe3hxzs+qxYwls7Pntls3qc9HyI8I61w1WalZ+xn+iOukQRHh1awXrZsn/BxGIfH3Z2JiuVw7GhQOBMsT4Y9fvHvENhQ1l7rEPKIlH4QY09m0bZtvsPyZc/4cmnG+mlXFwQWeCzZLNAUzh/hZXw3reM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117238; c=relaxed/simple;
	bh=GduQs4mnC0TiWfiB1zr130rkIiYVwmD7FjRW7S78JNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fu7dd4csICBe9RfsDnbOKCcmDN1MlB8+XUWfk7mYrLnqHNsMTvKP83sCTROof6HbaSdhNluwSzyBzrGdIe92UvXpz1huC4I+jdGmGAFN/41+vgD4Cr5iwJxqz6wYwVMMVDVy5ttIaCQmkeJ6evq198FGkPMZwqp012iP5Ynwc6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2geWxAe; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2geWxAe"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59de8155501so5403877e87.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776117235; x=1776722035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOXMNTIIXoqpY3VFkb3PMLMzullDNaoQaiXPYXq2Yho=;
        b=R2geWxAeqwzXUuZtu0Fq5QRkt0BS9SE0GZAksYUusqzxQPNXKVT2WbnKq+eNUPMtog
         qI9ZopWTBqgjUqRa1B/sW23zLEq7Q7nlqUUPUg3Q272Mlnh8Ti4B7X489ieiqNCNc/5M
         9u8NW5LZT6+gbumOABm9iFVD+Y0RFQQTA1vcaJZmwwu5uKgdz/Yn+r0/2aGKwntcC6Yz
         VIVQtsfQxoqc5uwV3rbLaDXnvM+EpMF4cU65o/zwysj8ItP8K2a0r9h2JXR9Q//yC/vL
         ulLQ9trTOsFwHeiy8S+WoImxtUwc1H11KDHHSEEEChrRHNL8W1GA2UtDdZ0MoxKfAPwN
         4BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776117235; x=1776722035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOXMNTIIXoqpY3VFkb3PMLMzullDNaoQaiXPYXq2Yho=;
        b=rBHWK8Q208e0EAB6oQ2fLkfbdzn/FdhXNVEmmJiPHBlJKNTQmuokhVgylK6YBZEeyw
         Gr/gUNUIpEiKlJycUxJ+I6cwZcLGebJwhNiIe0DfTKGpTbNbhf4AqH/ve82ViA9bLlJD
         u/DAncQ2AaRvU7jtCCLxpVi2CHI9QXoFQ99kDr1vVMkCnisEw5luEzmRzlRq/zjaTG+A
         QJID43v2odfJiIiQNr0TeHHr5YIfWvOzF7IEovNPB0r1kHuxLnIrlTDwS1mLFYPfQrZN
         72ixqud35bCX9BZO3HxENQjNS8K7pi12maxEBedv6yqWVhk8NwZcSD8BYTGXH2pt6Jbv
         VPlA==
X-Forwarded-Encrypted: i=1; AFNElJ+cL80TKuF/2icd32oNWLno1RzUFrEsdQc9opR1ZUVkQpK4rdBnUxwOHTBkbKb/MLwl9wuaoY0QXMDz@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjlHyEkmQeMcx0ivKv5nCjJoPqNNujfUg/b3Pl0cGJoP3NDXP
	1VWrnmgsmMwyvAmkuIOUTWz3DHEjza61uWsjheXIQt56ONoyOm84L803
X-Gm-Gg: AeBDieuvvqerhuyoIJ3sgNilsON/fDKt25Xba8i9do2HMgtUeEiB3UHa3lNhbvaZxNf
	tOBlUK+6sf2yxj5nDzv3WVPJ4xpaB7errj2FI9kwhCov6b5fZ3LQC49Q+jaTyan0ScaFe2/elMr
	xQzUg5su+R73RhWmCfP3CNycDGV8h6nM2K7uL+ZTPn0XPnVOI9HQzKJBmXPvScr7dGqM9bQu1BB
	nPeYhvb1lLad4hMgeDbkODEb1uWd503NSJY1AGlzS748R6F18uuErwWKf9Jpr1oLpJAUmqo07aI
	+Hl1CZa36ItWKa7q3GHMirRHkZQCofx3C5sMg1aXv4xQ5Oy26NvJPdCHWDRS1rxgdjg8Ra/HnSI
	lAUnMNMBfHP3R79XNHPoZRF0+Fm3eZr/M/Xqx1JunTC7A3bDQ0wFAz1sovxDscT17WJNC9RYz9o
	e8TGCR22pb8II7g2n4WWSTNRppbVjvUC4AMlDPYWN0q9sZJMV7vuy/IMEZxfl+rh35F0Ug0e/mv
	K4uMYkCG9t7/E+4sWbCmHKXXOfW4g==
X-Received: by 2002:a05:6512:108d:b0:5a4:d4:5c5e with SMTP id 2adb3069b0e04-5a400d45e20mr1006936e87.22.1776117234891;
        Mon, 13 Apr 2026 14:53:54 -0700 (PDT)
Received: from rocky.so.lan (9091-40f8-8d6a-8ea6-6a01-841a-07d0-2001.dyn.estpak.ee. [2001:7d0:841a:6a01:8ea6:8d6a:40f8:9091])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe65214fsm806370e87.49.2026.04.13.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 14:53:53 -0700 (PDT)
From: Sten-Silver Ots <stensilver@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sten-Silver Ots <stensilver@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Torsten Duwe <duwe@lst.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx
Date: Tue, 14 Apr 2026 00:52:49 +0300
Message-ID: <20260413215301.4656-1-stensilver@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit enables the NPU on Radxa Rock 5 ITX board.
The regulator vdd_npu_s0 was already in place and since the NPUs
power domain supply is now described remove the always-on property
from the regulator.

Signed-off-by: Sten-Silver Ots <stensilver@gmail.com>
---
 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index de154adb1497..d3ab6c68a60b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -421,7 +421,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
@@ -683,6 +682,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hym8563 {
 		rtc_int: rtc-int {
@@ -802,6 +805,36 @@ dp1_hpd: dp1-hpd {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &pwm14 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm14m1_pins>;
-- 
2.53.0

