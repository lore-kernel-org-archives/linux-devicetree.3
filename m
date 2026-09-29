Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C8379C39
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699703; cv=none; b=UlrmUOjI4iE7uRigAJrBsO6ZgfaRNS3FyWjC5wH/iYQJHhg8SEZ/ywJVkABScJVHQ18le7VTPQfhT4VB5zneX6BxRGUXk4EkARceX1LS/YtNH9H9cW/ogZj+5bGOPk7QjvcRMo9QsZ+7rlUSdD5Z8c3mUdzbCAVP1b2WYdemZWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699703; c=relaxed/simple;
	bh=k6vfP0YVA5s+JVQXM6pymggavOZ5XjrfFxmMafASOFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQLs0uBymjrVBGVN97IgE5+ONzKwBMm5XyvRPkHvpUVytIjTq4hMJ+LGWfN7wan+hOmSjdgxlSCaJI+KsDM4LEsHlfK7G36cetEHLW2HzOE1O4MD+EGIC0Up1MphKLAcP2ORXqgDawrjWP/5R1CCb8Xgt5owoyj50yBOX11jaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=a0bHqX0m; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="a0bHqX0m"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9179750d44eso432476d6.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790699701; x=1791304501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=a0bHqX0mA/dZ4o5lgXC9lvCRB6d3QLvS3Y745XNssqKCi14Z1akbIL2cDbgceg8ReD
         3Aa0FI5I3VFwYFeHBaypvzUBt3ODCoNdBMFBX1wzbTNTwlX64zDa2X32q2bqxoiOXR0Z
         bWJ7DCugQkUEZlDEQeE+3sExhuTxq/nIL4YasRzc/ugYl60nnWDpiyn53owwRPYdzyDG
         bPpJyC6rAls1OierV78842Gog/IheVbxMSJEykcPDISpxJRxnceiScBDlVUxRlDnx6CA
         aekJ1IaIatxPDnnJzHCJ0oYhMIzd5HCSjzkujZiL9FmCFfe/EL21z+y40JLW8TU75NHj
         7Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699701; x=1791304501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=zf+N518lA8NHVjQGkdbdRTkyQszd+33fouOm7HxWZPJaYL/4J1QHNDWEMHtBKZyy1J
         bpp7+f+asnQXPeER/qPdkLtL7G0gabV7irAu1R5i1mg+flCvrbxRzZRIzb6cepiTmm85
         8mb06WWjqCiU3uBfOPUW8f6uF3OKvncxOA6YqJ0BT86wh/3dKKedKVKHF1T7CR8BooXU
         jPmfY517pwu1wYOzTOm32OWFkgizjahN7ZrVyuzorzNsp0nHLtCPwjxK1CqR87sTONaA
         trFm9X7Zjjkz9VqjeSloFix5nfKelaSalVbm0U7JWbNLqB+Q1SdsOifA5zqaYIHCmrp4
         UKxg==
X-Forwarded-Encrypted: i=1; AKwUvBzdF5kkV0IqTAtS+/pWjbIyUoQhqQXUbkO5jT8RMthNteOHoUa125Ji9GRlu/ZVOau+86Wse+uVOBG6@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Q10R0/3isUoTzqKh/JOuq7qk5Yl0ijXmzEmA0gTRGewlD5ZB
	SIf1I9tq7uG9zXTGU036j0l0cY/jOlzu+Tji1SmbLHoZNmWZKzmlhKGiSjgHSaklKxNwNrBEh3J
	rqL+969dUCLCzz7EWMIaOc+yGUZ5uZEpw+cLQDrYrzfrkxctjYrjQ7jYu
X-Gm-Gg: AYBFou1Fe8g4GH7s3vmZhyenbF2Jqk3YcsvqbfcXlrXlHQg8gRstRQ/lqjFAoNfmCHM
	TaAEhIhEFrCKD43USmefmv6mfVcw+K+YHnEUrKhCPVsflY/oRUpL5e97okFoi83kj69GlxY45JE
	rkulnBTRhCIGo+Ygu6huqqsOo1CR588X7M3PL/O7Dz0GB068GrugGhWiIkjXIaV0z1m/xZariU4
	0zSuTM3CtvUs8NRi70YBiFIIWNY+7eGTKZzfUCw+gJlPDYF/WnaMIYBtnFiiH5aySenU/tYsQHt
	Yu/qec7KlIINKXWZtzuGdUZy//NKzdLB6DVGVGCFJbon66N/7b9yY9rT1twnW5Ioozij21VE5fg
	P+YsGwG2L4fP5t7AM8UZ3etpP1OKWHuyR1TUPJzwBH+Dx7+B31JbfNV/RTDF1rL33Pus+5/W/mc
	ZpKsGQSMZ+dH2Uvd6VV2/LjDBFtnGoYI/Wr00sWwGurTNmlHsXR6kR+VUOKmoJHcyT
X-Received: by 2002:a05:6214:248d:b0:917:8d04:deae with SMTP id 6a1803df08f44-9178d04e0b4mr37336786d6.35.1790699701212;
        Tue, 29 Sep 2026 09:35:01 -0700 (PDT)
Received: from strozzi ([71.163.254.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d39627asm14065896d6.45.2026.09.29.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:00 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] arm64: dts: amlogic: meson-s4: Set stdout-path to uart_b
Date: Tue, 29 Sep 2026 12:34:10 -0400
Message-ID: <20260929163457.3237394-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If stdout-path is not set then bootloaders such as U-Boot may fail to
boot when they cannot find the serial console. Normally, this would be
added to the board devicetree, but in this case the boot ROM,
first-stage bootloader, ATF, and TEE all use this serial port with this
baud rate [1]. All of the listed components are signed by Amlogic and can't
be modified by OEMs. So while someone might want to use a different
port, they can't prevent previous stages of the boot process from
printing to this port. Therefore, set the serial port in the SoC
devicetree. Boards can override it in their devicetree if necessary.

[1] Actually, the baud rate used by the ROM et al. is 888888, but some
    userspace tools (such as agetty) choke on non-standard baud rates,
    so we use 921600 which is close enough for most serial adapters.

Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts    | 8 --------
 .../boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts    | 5 -----
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                | 9 ++++++++-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 0a3f81ea0fb0a..15bf143317a2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -14,10 +14,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		serial0 = &uart_b;
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -141,10 +137,6 @@ &pwm_ij {
 	status = "okay";
 };
 
-&uart_b {
-	status = "okay";
-};
-
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 99d5df71b9cd4..c602091bca0a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -22,7 +22,6 @@ aliases {
 		mmc2 = &sdio; /* SDIO */
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-		serial0 = &uart_b;
 	};
 
 	memory@0 {
@@ -334,7 +333,3 @@ bluetooth {
 		clock-names = "lpo";
 	};
 };
-
-&uart_b {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd5308362..3e432e232a76a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -13,6 +13,14 @@
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
 
 / {
+	aliases {
+		serial0 = &uart_b;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -794,7 +802,6 @@ uart_b: serial@7a000 {
 				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc_periphs CLKID_UART_B>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
 			};
 
 			reset: reset-controller@2000 {
---
base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
branch: s4_stdout

-- 
2.53.0

