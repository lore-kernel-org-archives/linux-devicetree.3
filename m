Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C532A3E5;
	Mon, 20 Apr 2026 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693268; cv=none; b=ZrAHnQmyHjBDrefzUPgWT49UB62zceOjNFGdtFivonA68fX6BA6OnZEH41DzDdGzm/fvdWCoffBm0n6EMKKVWcVzr+J5ZE/8rDJr428uKPiC4pEpVrnCcVyVqOxkOIn3enILyOtbtYwJ5pcZ6gU0V2/pcVAnLxzW4g3ceiJYJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693268; c=relaxed/simple;
	bh=RBIiK8CES8R9gJcjoYTCoKw0do5/miRgk0+ffcE8qDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8zNAmdhrk3eHEeKRx2WUOjUivpzsXfjR0LAt+2g+IBL6TGV6ZyK24SHBnG9pwl4L2xHNSX50r2dxU4V5BkDaup7CNLQr06ZBjxzKoVzeKQdz3/nRmTUFkGoIq23r1yjr7RowaJN6PzXEMTohqU9c+ZGP5yv6Cb3AdqOVQ8xOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=Bqk3LylI; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="Bqk3LylI"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776693264;
	bh=RBIiK8CES8R9gJcjoYTCoKw0do5/miRgk0+ffcE8qDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bqk3LylI8jz9spsXo5qoAODLjNruZyLazz96UrsETlsfWkAfRPY6utJ/xRL5Q2dWO
	 5lX4rvRX8iZ+HSMfU9tLrdY/moYUwmcxLKcnLDKUDrqW2hAguHUxWcqKidVvLYd4UX
	 evoWZkGKxMiAgegVqwcDAebS27djyLVe9XgXDQEQ=
Date: Mon, 20 Apr 2026 15:54:05 +0200
Subject: [PATCH v4 4/4] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v4-4-9505df0e7016@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776693261; l=1452;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=RBIiK8CES8R9gJcjoYTCoKw0do5/miRgk0+ffcE8qDk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJpxuZIRj3W4tnr+l9B6tbn37Ka+/vmOZd3e8M2idNXYnjh4fSQSDtqZDilNf0yv6u2Td8L37uq
 uitqUOdsCHwg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Enable UART C on the Khadas VIM4 board and attach the BCM43438
 compatible Bluetooth controller to it. The node configures the RTS/CTS
hardware flow control, the associated pinmux, the power supplies (vddao_3v3
and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
clock, and the GPIO lines used for host wakeup, device wakeup and
shutdown.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 3227ab27de107..8ea7ae609fbd5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -251,3 +251,22 @@ &sd_emmc_c {
 &uart_a {
 	status = "okay";
 };
+
+&uart_c {
+	status = "okay";
+	pinctrl-0 = <&uart_c_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+		vbat-supply = <&vddao_3v3>;
+		vddio-supply = <&vddao_1v8>;
+	};
+};

-- 
2.49.0

