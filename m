Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A456E06C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096274; cv=none; b=Ii4Cb2y2S7uadiPVUyVwMLNfT3i4DFBkTemHdAbdD+a17jCy3QtiBiRsmlXfwf1GJ23zKnA8erKUXNo9sjuPOlicGEw7bbxtg2WA0NbOytwAZ+dGcVRYTHYhb4K8jz6DVvqBedzojTLdinwxbhJGx2IEIsqFX3CWowLDvuRtz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096274; c=relaxed/simple;
	bh=gQp5P6A4HKZPmr2RXt5nnsqu1turFNqjNRfQGzceh+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gw1uZrXyYhAS5naxf0xy9+7c8tjd+IliIYOz9YliafGHn/TgtQH0ZkNAWn0wXAuBSIRtLq2OmrLAqbRGirbun/U1vgm+1ZQxPF3zpKyV/qu6WB86Mi3X8lZwP5Dujo/N280mdANo8zcthYCA93QQxMTYDSU/RZzI2tEn7bSkIRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZABkxZUf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZABkxZUf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so10125e9.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096270; x=1790701070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=ZABkxZUf0otGT+/5inGL3hhjZ1nWQrK0hU9ek87pyACpySKaLceOTqRKQEvfQ9IQJa
         Vl1WQTc4mF/d2ivT3nZsoIzlT8DAyWRM7C1w5Rfgs/io9rTSZmZNenfmUJKSm9G4XcPk
         gtW4S7a3qe1DKqv25xVInlKdZ7lQX0Bi9uJJkn9WS4RyBb+bWNZ3o/LPF9Kxq7zTH0TC
         FdPsD669QYi+pD8PfEBLKffMjPBVZBGej3TwSS6QrGsl4ATmlROiOeHVz1pD0PsLENkm
         5g8si/AE/bzLFdGn67Sulg9uwoZ1dOe8+0rI6DiPQR/pcQuQ8bqbSy4VtQAHzizMlx07
         mPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096270; x=1790701070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=m8LYfAP1Ko4o57FKOzbitckbjFAcGLuamscq9c2m76YT2tgiyg2YQjiPWluh/xx6Lo
         ZMgBhbqZw/h8bFSHWy6+xkcIy8NRxCGrEy5/6xbTFLKdRiu/sAyMxiz0xTAM/5xz7RJZ
         y0qy8z9KDKX9FL+SG33t1ApEDmS5pkbFbebd32YFYBzwT1qi5Z9i40ubUzNu5uVD4eGx
         ZH5xS2HGZ0Lo3Et4TSOCxxdCsTm0Tm3hYmQC8hl7JR2qeeCGoqkKSP07weRahprQY9qI
         UMQMJtKdf2Eh2baNoqJGqkiXkxLFf6b+5lsWhzTTGvtKza3LVQHpziIYn4LfcRcvN71c
         t69g==
X-Forwarded-Encrypted: i=1; AKwUvBx3iRsuOEZyVMGvqtrVh6bfaUijoYzBhp4W0oEzccCvoPIQbfBviQiQrQXzHg7F2x6Qr39tt4ru0DxU@vger.kernel.org
X-Gm-Message-State: AFuF++kMIvRmzhaVI7a9nXnzbsewXxsQf0Jd04SGzEa5HYKeHpdla4vQ
	66vIzhsn27G4dE71ehKN2e44LlTg95xhEH5gy0VSeGqoADuBowzWMkIf
X-Gm-Gg: AYBFou2BJ6Tirt4yA8CMdt1B1UbZ/Vvi7iUhBr4Uk9YyI4z8UV36B4InH0dbV5dpSpT
	suezQTV5XxgjvgEAN06jZGPh2mR8lCE/YSKgp+Ypd0ReWkSjNqAiGG765oMeQiLU1DN53aYAg3/
	wvojm06vgadjgmvn0RaYA2r3dq3bNo8zsGxQhZCFCu72sWBJUTIzoq5536Bn1FokgbqJ45X6T2y
	GUrZJEe8+4fnWxme4I2fFqoAWvr+e0TVwRQDGYHXTSbkpD4lbv1/EvzoG7Hj5ZIMPx9mfTDPTfv
	ii7T2ZrgfL3ytoJhFdqpvY/S24vCZdMyWCCZh6TESkR7ScOod8iNTklk2bSNt2cN8VmNjQQjL1l
	TPNBIHL/r3BZI1Nx8v9g49FrveOJlx6RWNCoi9rRDuMLBsm3cpqY19CFaPCcc9lToYMm3ON70qV
	3jFav9r6DYPB45fBegjkM3l1u/yyqY4M75nZv6lPNV7T6W3uiUJXnasQuExXDmZzbtwK/u87VGp
	/FP70s=
X-Received: by 2002:a05:600c:64c5:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fc56aa4e8mr216310585e9.7.1790096269744;
        Tue, 22 Sep 2026 09:57:49 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fdabe8a2asm68693625e9.4.2026.09.22.09.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:57:49 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Tue, 22 Sep 2026 18:57:37 +0200
Message-ID: <20260922165737.260443-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922165737.260443-1-okerixx@gmail.com>
References: <20260922165737.260443-1-okerixx@gmail.com>
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

