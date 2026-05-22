Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5F3D3302;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=uyDqt7BVuzEkzWewhkLXOMOK/EA7nrlNbPTDD+0XqYOeOV7oF92bZ7loXmj6TDsbLCgxK9AofmeVxD0tsrPyw0JAzZF57/Hum1jI3ai/Z01qhxAHedMaXojmdAddtWsN6uBbVEBK7s7i8mAWOe0ylX1zmNhrQMXX5yoGacT8W8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=kttq8r5N9SuU+zd+XevZzZNP1guN8quvQiyJ8IwYod8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+FUEKtXASMjH6IHQXYLNEkV+hMUJ5qdev5HbSkxHSCuOpAqIG5R+N6G4/9rQdGRKmSSPleNeu3wgnAme/iiEAyTpWP34/CqMIkawOw81F+9I/JxK++BATFdGAW3RnTBh0J4pmt3VIFo/bj4Af+WVjL1GZF7rrWM6Fl+gA3ZrDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYx0mPW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYx0mPW0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63344C2BCFA;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=kttq8r5N9SuU+zd+XevZzZNP1guN8quvQiyJ8IwYod8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hYx0mPW0EmwGdc5PROvPGiMrk3eEW/FlAoGdo0fkzDNZnBtbu9nH2LySA99YyUMO7
	 1BhMtdgYYib3QCquaUAuD8S6cI84z4rZwUq/hvX+MLYzKmjj2uaF27+ZCQ71ZJwo2L
	 btahUDdGebcNwTprHrgrIZlhJN+pnc17I+KfQQGXKAbqavDHacK5eh0QL/8honWvr0
	 qi2iRdnymcNJ/5sU9aykh3im4ew5+BHDjyqs1EqZ6DcXjPYdj29duXlcCRbkBdT+ZG
	 plwxtcMYqEMPO0yh8rQhg6wvArA9y1KIKp84BDnhvXFMU/yHiQd976AmgL5M2xA1GN
	 il8UyQa9KT3qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C228CD5BB5;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:22 +0200
Subject: [PATCH v2 06/10] arm64: dts: qcom: sc8280xp-arcata: Add volume
 up/down GPIO keys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-6-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=2100;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=tpMMqCuXTpiFyNTUXE4sxQpXvBNTdGkNZVRFY5KiZGY=;
 b=667Epu556yOoO1R1q99p0L2nR/7HIAhQUqIj7Ol2x0jyOHTS74DvM5LDsjglQidQgPade2dzW
 ieETzxNjVqhDjSFJip9OX/TbPh3wXRfMAmj/2Cab28+sALSTJnIIZa5
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Configure gpio6 to serve as volume down and gpio9 as volume up to enable
the volume up/down keys located at the top of the screen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 10fafd752734450ecddb2113ff972a08793a763c..4e601eb4165b1eea16d2772786ac0a18f6177e60 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -55,6 +56,31 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_down_n>, <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-down {
+			label = "Volume Down";
+			gpios = <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pmc8280_1_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
 
@@ -922,6 +948,22 @@ edp_bl_en: edp-bl-en-state {
 		pins = "gpio8";
 		function = "normal";
 	};
+
+	vol_down_n: vol-down-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
 };
 
 &pmc8280_2_gpios {

-- 
2.47.3


