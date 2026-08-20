Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FF41B8F0
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223858; cv=none; b=e57EPCSp6s+GzcXoT5yKhNh3ZawVHeoGhaVsbx+lOKbWgZugTHMqlRsL5+cMFPaF0C9oXCxNEX1SZG9+57FhSbrh6YGGIglMxs+mrN9sFq5711bB8W3K7tIMQHbz2FFaquqI4/+1wGzXfBsRF0vi5XzchapQ4qEDSI6H5ftkf50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223858; c=relaxed/simple;
	bh=07zJek12zGtd4CLu847sOJ6nk7YwbaD9zP8Alz31hhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQGQRd9c7ZdqgiM+6EmIpdQ+Yrqg0WtgPYXU2TKyczt4ci92lGfDe7xxiRpC6eGsRnq9cLsEz1p+6Nmo81mBbYU2Hxzf5ZLmxETzwrlMWxh8EBK4jU9+JMG1WjPm4KgnaFp+ApXLKEk05LAc+5b4KenkJK9QwqpJ2xWnvxpKFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J77rqAv8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J77rqAv8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1717581a91.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223854; x=1787828654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkXxwlrpsmhjssCMZQzBcBPG5hO7oiW1VIf9dPISCWc=;
        b=J77rqAv8jYVEHKsueiRep8d+HPwRj/JDb0H+7VZtM5vsnoxeY6Y6TYPnpE0sxw5oro
         CSSJnSlOTv0xRbVTUb5k4zNupGoSpQnraITGW2sDT/QZrq2FUvDqlPEx5ePddnRXZCOp
         o/T1qHrCHyWP6SMsGymLRvVXaQvnkx5fnasCc7Pfutlaokm58sD7ltl05olPbIfR2FEH
         hvYV7x3+ukU2OyznaxrRMoEd2YbC7qSg85ejZFRj2hkP5f/ujHzWGoFRuB5PVjEFJanW
         k4rjpQS9LjJS3ZihoEkXsGD7Es33L/R7D5GxO47MKVl0BYJWk6VMRKfJDGT8sVvkSght
         mhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223854; x=1787828654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkXxwlrpsmhjssCMZQzBcBPG5hO7oiW1VIf9dPISCWc=;
        b=bHbIudVYMBDITAzOw8Y5bmx4Si+n6704CZUYFCSCvbr6d8u+yo3hOoZZ7E/3M19gp1
         v/g7koU4A6TaYn3Gq5x2cq3tOaEfquHqQ8lkY5N9avYK+3UIJ09KQCbblPxpMknWkP3L
         OOaXFdEcpyg4VupZg2M9er07DXcUONqnOqzaEg+GjhGoJUIHPewkkJ1peaqSRJ3M6aIc
         6Wfa9yMnQCpb/JoE8ZVVwd2dwLvFJHIzG3xA2l292CU9b/5OASVFaqrYeyTH2BAunZQ3
         9NRsDs4/k481ZfPT8jhSGn/KpHZnoIDGcz76+5NYPzyareJ0dva5/34PiqruFMPyKIWQ
         12uA==
X-Forwarded-Encrypted: i=1; AHgh+RrxoAaz1qW5rzt9hdziiDWnmIMKaPTBvtUuU3flBymUPZ2q9DIzJ3tRj+lA5zEIJCeLMmfHdDadbunD@vger.kernel.org
X-Gm-Message-State: AFuF++n7curOJ2mROMZDRlexqeCh+Ylzg0claUgM5uMSNXFcYFZ9FetP
	/rdXtT2uIwF+lsW+zCyOkYNYay5fTwji+Kow4jfIeaWdPPiL8dCfcLXmg7Bc0Q==
X-Gm-Gg: AR+sD13K9TEZWLjvGDVMyEDuJAjOXd3sur0Qc/6b1QI/52dczGpjhyXb7Ih4roZWpDd
	+deQH4CA+aYfqprMVIF/iuJDsWj3ZYnRBzhuzIVR1yCoRws0FB2jwKVvisF89zlLlan/CYaLMpN
	o239l/6CXWcYkWOh0MVRuRP+TcoHm1RRDUQwRqeyq59MKyxO5rYzm7LBbNjBilSniYRK+PZzeVO
	nYh7rQ8ik1mLxJ3g3v2IJQ7WmovO5hnqqCsUoX3bnVHnM4ibUml9w9BjaVgczeR+4ZKxscyvxmH
	XTriZTvW9oejr9Td5o9KCQIM7w+I74lXIHPbWJlcdTx3NPnJtzP0C1ftbBsYknnY3/pncIDQMSX
	hnOFolWoJF5MXZ1JM2mrFVTK01WtkrWCNq5k0ccjPX5e6kz8rdcGnb3PHI23gBcmu1kxgGITayb
	mlbOutJ4hr6FVufntl8zucnNUqLjfAAU+FLA2x/ukXVlqolu+pHoyo0eTeEDIEig==
X-Received: by 2002:a17:90b:5624:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-39580a7c3dbmr23921881a91.6.1787223853734;
        Thu, 20 Aug 2026 04:04:13 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:13 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support
Date: Thu, 20 Aug 2026 18:03:47 +0700
Message-ID: <20260820110347.98068-4-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the aw2013 led-controller node for controlling the notification LED.
Since it communicates through I2C, also enable the blsp1_i2c2 node.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v4:
- Simplify commit title
- Add commit description
- Drop redundant status propery in LED node

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index a066d9d7a..7c323214a 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -35,6 +36,26 @@ vibrator {
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
-- 
2.55.0

