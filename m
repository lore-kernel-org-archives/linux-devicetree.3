Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2403AE196;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032129; cv=none; b=F3gKlWDC4drO6vX9M1YL8vEQha521SAsWvK3UoJvBOlY/izxqViGSb+XtBmv9lHUL9BwZQzaYScTu2HH839v34Hou0c6vKLvk6x3xw0SYZiZqURo4pWDV/1ZgAr2BxwG/3e1o6RQBefd8IJWPip3pIE1KJFlsX+MUV0W/dXxkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032129; c=relaxed/simple;
	bh=jCPQDtWRGtkhOAyxLgatH2I8yh8E1WzV1BBP/cT1gcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4R04b8nHEeYQ4wvoueTMZR/gqChn3yznfrMlkemSNmZOpdhG/KELgZ94y9EWRbawuNIDGZDFCJ2Zz/Pkbt9f3pt5jiDHt0Gn1PdqwE6vGEjSH9rCz5QDWmQdFFmglWd5dSzpOTrgAJ/XaRJn3KbIiuFnqQp5uL340fuKLAmhyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqSLgoca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqSLgoca"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B74DC2BCC4;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032129;
	bh=jCPQDtWRGtkhOAyxLgatH2I8yh8E1WzV1BBP/cT1gcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oqSLgocaZg8ASo5YkjyhrFfQMExyha+vKjFtDsaB30o4HZKRX8/iWYHJdFUwaGhu3
	 y0awEOtDiqPYJzho0csgH0flkj10/KPJNAxqKeXNDd8IknOt40ffjcXr6uiYXxI9yF
	 QeR057HAXoVYFGKx8zTcmu4srHmuFof1Sm+ChuR+tYDbLAl7hMFrWG0CSvt/TDh6MA
	 r1xgYAW6yTJ4SCVysh0NQv+P22h2YMOl6sns17v+QXCN2SGofZUtOOwHc8kAR6VBtS
	 YDVeFgGm/jtZZU2etNftNvbTH8eeLs+5BAni2SBQcrgxeFwQIUIc9nh56KGnobwNFo
	 cdIVRbh6KVrYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644D1D3515A;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 01:28:50 -0700
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add MAX17048
 fuel gauge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775032128; l=2637;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=6C/QG+g2riU+HMSpgvYlES6lzgzGMbIcBfB0DCWzf4c=;
 b=5oyv6cK8ZpEN8a9DCnj85xYw2vgICQuDn6h7zqFSsnjRfnFdvOmz9NeBx32IIIbTTdDhSbWzK
 QFt71it4A3RAEFFHnY5yTafHckkyaTG2hbjafvWV7hEUFpDX787RL4L
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add MAX17048 fuel gauge support.

Tested by comparing battery capacity readings between upstream (mainline
max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
across a full discharge cycle. Upstream reads ~3% lower throughout. Both
track the discharge curve correctly:

  Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
  Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3

Each pair of readings was collected by checking the upstream capacity
first, then moving the battery to a second expressatt running downstream
Android to check its capacity. The battery was then moved back to the
upstream device for the next reading. This swap occasionally caused the
upstream capacity to read slightly higher than the previous value
(e.g. 86 -> 87). When this happened, the reading was retaken after the
value settled.

Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/board-apexq-battery.c
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/drivers/battery/Makefile#L5
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/Makefile#L308

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index ed913ca5b825..bc976008ae45 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -182,6 +182,23 @@ &gsbi5_serial {
 	status = "okay";
 };
 
+&gsbi5_i2c {
+	status = "okay";
+
+	fuel-gauge@36 {
+		compatible = "maxim,max17048";
+		reg = <0x36>;
+		maxim,double-soc;
+		maxim,rcomp = /bits/ 8 <0x62>;
+		maxim,alert-low-soc-level = <2>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&fuelgauge_alert_pin>;
+		pinctrl-names = "default";
+		wakeup-source;
+	};
+};
+
 &gsbi7 {
 	qcom,mode = <GSBI_PROT_I2C>;
 
@@ -582,6 +599,13 @@ touchkey_irq_pin: touchkey-irq-state {
 		bias-disable;
 	};
 
+	fuelgauge_alert_pin: fuelgauge-alert-state {
+		pins = "gpio67";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	touchkey_i2c_pins: touchkey-i2c-state {
 		pins = "gpio71", "gpio72";
 		function = "gpio";

-- 
2.53.0


