Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAE3BB11B;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608101; cv=none; b=hIRA5yKn6vwaEoZE7t4ac6PNEkemg9hiZaq/0ktNlkCoIgT6vLdqLzgCZHJ7sUXY3F+JYpkMleMNbScuneEqTWbWqJGcLtUAs/6oeE3aTrU//TnZmBL8CJOa8vz5zBahaUAOWoy4o6Vjqa35SsRcoRyBg4MCobH/OD+8sdp+Jxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608101; c=relaxed/simple;
	bh=fcW13kjSD93mQbIhQzCZ6BHO6+uiUNMkiFo3/S9zFOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ9Zy5JATiRtBcgTfoKuvOwOn1/00HXbue2bOqbMToNrt7ZYo1hrgdzkRpgBfUEotlVbz62xu1a071Har1hO6p0MB6EYmKx2KHXVCb4Uy/oZlbv9LFNtMhsvQZi6tP9O8Vbg2fFhCE2ZEkGbJzlgZZH1Hi+yUXlT+lOQBr2K0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvQNT6kO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvQNT6kO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C83E3C2BCFA;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778608100;
	bh=fcW13kjSD93mQbIhQzCZ6BHO6+uiUNMkiFo3/S9zFOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jvQNT6kOjZDRDJgCV6PO9c//cQO9AL1lHVvtGDkV813udL+7TtbTsoNnCTKXPuD64
	 1/QeVBEMwll15/TS+agJkqctRn0+iWcBB873BfnLsObv6NoI++QZ4J5oyBD+g08tvM
	 oDQUrOB39ZBO4d1SVA8lIDNO6Yd7BK8k5hJVOAVJ8i32b+7M5TLx37muNx8Rex1YG2
	 KDF8vRaVP1OY8l1jnD4eNGl3UcKCGEz6lOvqE0U+p35VnQEqK3Hhay0V3DpNpsNrG9
	 VMC9zVo8yLJYH3EoWNtF7qnV6fIV6Mq5FLgEu6I9coB4pXe3B5LrpEcJUJTB105VoI
	 Oam6nTFxDaGMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9E1CD4F24;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 12 May 2026 19:47:29 +0200
Subject: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
In-Reply-To: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=ljQWRXfzQQh8+VfKgDXENiNlXKLzV1x0O1tJjws741c=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZz+iOTDNUAxlZuft2cj74q23NnBk7RKjZxtJpo1iuW5
 vWhqr+jlIVBjItBVkyRpX+u5Yl3l4+e+bpHPQVmDisTyBAGLk4BmIjOf4Z/RlOWnGoRnP0j7dAi
 190me1fo61VWLg7R+zvjztvgysq8LkaGaXu+2JwO5FQ6nr7i+4N6I9G19zji5roJWQsZqE8KuXC
 SGQA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
Enable the pwm_ao_cd controller with its pinmux, and declare a
pwm-leds node with a heartbeat trigger.

Also, move the xtal-clk node to restore alphabetical ordering.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..c41525a34b721 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
 		};
 	};
 
-	xtal: xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
-
 	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
@@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
 		regulator-always-on;
 	};
 
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		status {
+			linux,default-trigger="heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm_ao_cd 0 30040 0>;
+		};
+	};
+
 	sd_3v3: regulator-sdcard-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "SD_3V3";
@@ -155,6 +158,13 @@ wifi32k: wifi32k {
 		clock-frequency = <32768>;
 			pwms = <&pwm_ab 0 30518 0>;
 	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
 };
 
 &pwm_ab {
@@ -163,6 +173,12 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_cd {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-names = "default";
+};
+
 /* SDIO */
 &sd_emmc_a {
 	status = "okay";

-- 
2.49.0


