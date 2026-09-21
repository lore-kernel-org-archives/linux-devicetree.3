Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794314AAC62
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002209; cv=none; b=OPnuFpyIE0CTrNDxyntPzTt/8NxdKa2QzB+eiW1Opj6btob0O+UuN15w20VmnqJSJ+X3Di5/mwxd4BS4FkfAxd+om/nsGTN1Ka2EpFXU868mzfhh+E75L1tGFMoTztnR8svvaMK8ywchcKBOORwom/lZ5tO/NPoEul73Rc2F2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002209; c=relaxed/simple;
	bh=gQp5P6A4HKZPmr2RXt5nnsqu1turFNqjNRfQGzceh+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGkJMKp3NnMa9G1/snGwqUxQF9wzCZqOH8vpvbpHKRizB7+aXxeIUePH/GzSUvUEkQQdZLhLyAON4GZcjN/kD/5LIP9mH78lb+KdYz+pmo1Fucz8VBybLl6hAAAUsY14HSOBd0FC8p48RvD6XJ7jST10WC76qVyp9A8x5PfNBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1l6QMZl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1l6QMZl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso22632695e9.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002206; x=1790607006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=M1l6QMZlJJ5OBCcXf03tRRdMPH1cHn9uWdZSCVQnYfrqzEOgMctZqG7bT9gpR3rnh/
         jWKVXR+egPc4mmsrnoDVGIEbdW62poaSZAijxmgZqqtNeKwsIZC70UcO9vJraAonk3up
         3SRQbPINez22DWc+3ooNL9bZvUpr7kchGr595QhalcUa8uuCCuTETJXypbksWa+2rY0j
         t5QIooTPHYEgAYxseUhv4+Nzs6T4eJ5rzizXJ8tniK6odNhzqTNjead5ZaGFoG4B+Y4w
         Dr+PC0kbnn4OT0NXTConNFNP5foW3E3Z1meDHyToimIFzejow5CItn6zqNzTTzEN6rzw
         8yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002206; x=1790607006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=FuvmjAWb+zSSvkp9q7m3TeLzvVrdBNk4NFipqupCzp+tCxbNGcQz9gLj3bGG3KF6re
         ujF6ad6Ajk35/VhllZjpMp7KK0UtsY54IUxN9NhVu41A2AGDFVHcU7+sBMIFU/gRE6Nt
         A3wsAj1jy363jYwHGGN6UA9K4a+Ou5Bfozp7Ph6C+bZQJr8LRLUFoZSlSgIABwEbT4ZL
         ZMrF9g7C9f6Z7krUegE9/5l3PbKYZ9RkBJy3GINnjQt1Lvb3ylejGyWe38af+gl5Bsk5
         B1WhXVvrIWB7AivWKVRF6b+ExBpeUIXVNnau1QBYS8fGHh3auFf1VjEJc+dIfXdT2Ft8
         gf0w==
X-Forwarded-Encrypted: i=1; AKwUvBy495rl2iB2xiDGHxLO2qvbGi/kLq2uZ9MY8KAQU+uOAGhab6i1DbtUju6/BTtYm/2LKb9zISHi/VYR@vger.kernel.org
X-Gm-Message-State: AFuF++nHqQFKM9EhR6a5lcP4CIhfwtpyUX64AnMfH3JmwfBpZL5akK05
	IpTDSZK5JmXF6DVWdZ0tHSECE8wcISPIRCg6lge7CFHAhRc7NZ+XThC5
X-Gm-Gg: AYBFou1sMjSX5tqCDJauvRyj6U8bmpyE+6h6X63rq50toUR2Zudjtr3HusKgBeQmh7f
	kBBrRfxNmBdaFpkotQM3Oqm5lUsAuQNE/J/sG8aQZnYIKZ1BaZePqRS+0MJUbAqWQaEQcZFwGX5
	59ZlOMcmjs4vqGw+3VsbIsrb2C1yfONDYqDEPigXzyclFNSOin0Ox1D4pjqIqvukaKSbHn0SiFK
	zeYlXQMNTiOaBAgzUpXzxmlGcPmmH3vlBOsDOG4cc924veHa/RtHbA6vB5gHETt3KKPJT9EMHps
	VTZvWvbfX0Bim6hb7Dwn4b0RGpP3t6nBeo2+kqWf8btBxDq4/FWCooPo6vVdB3XzyHYtQYrE/qe
	+l9uPkKVje5GqJXa5RmCVsqu0mJrt18rGV8B8tBfe1y8xoRJczAU0oRVs2r5zWilp0vHATP8YtZ
	EVom27879djx5hA5syAQ3xiAccNAfsXbO4sGHGZy88je1KJur6/IvqNi3DMuMLz3U7YmikRF7xP
	i+Dj4LG6GY=
X-Received: by 2002:a05:600c:3e19:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fc572f27fmr153111575e9.21.1790002205475;
        Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm191595725e9.1.2026.09.21.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 21 Sep 2026 16:49:53 +0200
Message-ID: <20260921144953.15113-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921144953.15113-1-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors, the battery cell voltages and the CPU fan
speed, and drives the keyboard backlight. Its interrupt line is TLMM
gpio66, falling edge, for which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts      | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..bc840fd8e458 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -659,7 +659,15 @@ &i2c9 {
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -990,7 +998,7 @@ reset-n-pins {
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
-- 
2.55.0

