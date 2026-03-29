Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920436D51D
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774790362; cv=none; b=nOydBTvjYGbuJ+2TdfJT+XMzmCBhS66a53AveJ1gkd5tst5/LQYYqloWaKnO213Y72OS5JhLmOpg4UL01vt73fQoC6e1ps+9tT7/+89sh82RjvXEZMCB/ylGRleeq7Y4l02+8/LGTM4hN5DMWBYkjJXbcPBpuuKod/0e5E/7nSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774790362; c=relaxed/simple;
	bh=ZbKCcpdxc55m1Ibdev4LPtQYvc3SD9V0itDcYEtNo0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N4tEX/DCcnnZBeGnBMjTLg5AG6yR7tHRyZD2zN2qFrJcuuu5YT8+HlItG1MlF1ee4bfo9X8bUPepYtc/W66CSiZ4920mlzhnq2YbmJK20ZTkX3fBJDerYJRrDpAgdWuSnefGOA4G3O+dBCrY9eDZMRMsb1HO3Ymf1SdgR46BdeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIKgjKXt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIKgjKXt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd27754bso35131355e9.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774790359; x=1775395159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ExCw+aMOyGYhHXagsRu0BWedvsICeJ3pZ8y8FKoBEE=;
        b=GIKgjKXtC1KeoBiP8emsvk3N8EsFiYCQ6/xjCSEu6n4yA+9p/unpZ+59BES/sogyek
         AQjnvXmLaKb8KaODWkZPwUIuw75yH1yAkIghk3Wh0SAiaZqrMnVCwjM4RUIjMJqikPUR
         6Q7i+mieXTCf6KvaeVLYMPmQd2/l+ugdR2DNTjsp0O7RwHU8OOciWmL1Np60PlEuCVjk
         Pc7ofO2gQuB2uV+CwDv9vcNQIFAgBYdCAEhMlJqO+P5iKAd4CMK9ZALkJbUAIkUPQuFS
         zTc16TvaJb8Y5CuMYsd12h0tkLHXAG4RRWWwTBA2/BUdJh0qyW8eR/P0nd6D1+xUErtq
         9l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774790359; x=1775395159;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ExCw+aMOyGYhHXagsRu0BWedvsICeJ3pZ8y8FKoBEE=;
        b=mPwdIauAJo2+zx+yBkxlaD+rZX6SUX5WkuTdmew7cP5ioPUWyrkFha+Fp6eppNRIe1
         A380WLCKuNauUsAtyIj6/59uSAWS+YpIHROMcAZW7NpORvwYcRjBX/jUudT9xMQBI0hv
         e6mnM6+cHgvyYtrymUIS8WABVOI8W3l56XDb6k8FMURGXkG8hBBHFIm6MxtZH+ToTUMJ
         +3IAu3fFS6vfe6zpj9aOUGOHbOBOXJYkKe6WBuGHZNBEYYMBcDp29a6viXSGBhc+CQhe
         32noh2IA1qe8YNNqGPcv1Cs2qIDyAC0U1DaPdJ+mQxala9iDCgkyWVfeZULN2EDOzd5V
         bUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDMbdIJTUXDoxcT7ud+TGwT/tXkawhgbzWttiqHlOz5UCiFBTSzUlxo04yw+G2Pfvg0bvk3cofJxoL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4qzhnQnt4I/GMYNX0bZykgK0YZxp2NdgTJLR9atzqhhxBFdf
	0P/gCDlHDLtnehnXyDgUgU3bnaeXLwqcH7hYPHxVSuBJvT0Hog7rbUkwmDYmSLiVZnUwnn+/oVW
	fsY2k
X-Gm-Gg: ATEYQzwtpb4JoDQSzvUAY46TCR+ByNRWCOHW1SxqVEezTaWx7m2KiKTKpNafxbHm+62
	uIc1Ct3F/GL1AGQ7MOQkWFu3b2LND1hnFX2gOhCkbjiXszan9r8LJ6TXogQTl8UW57Vk2KLtSij
	T+vkUg5zO7mExxI7REO2eGpiruxtYkfT6CVJYpovUYIeyFkZfmBTUTCM75shHf+0Rp795OZfiBS
	xl9m/Cwi8K7XAEnL7h+PRNSAhfNeSz0y3abysPii3/poQYRUPDt9tLcy61Lm7+P8sYW03bykjsJ
	gURI7leo4U/Y+5guwJ7LhXAcsMrN+CJxV1WDFDDcNZBWA79ltl9Zn6YrhfKYHlt+lJLnMtfx12Y
	FALkY2DmtUaEr9KLQDBvw9BtRKtnxcLGwbXWwIaIx5byFPzbHIlCNCSzHtTqpLryONO/tJYJZeZ
	tvHD/59Z6GeL2ipffRGLrQlTj86gC/MuxaDoqhnKGp+Q1G1TSPyNpkPhBzMkyCpVI1Ro9o6cMRD
	xHrA26vttAi
X-Received: by 2002:a05:600c:a416:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-48727d59c87mr126577255e9.3.1774790358751;
        Sun, 29 Mar 2026 06:19:18 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm376642055e9.11.2026.03.29.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:19:18 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 29 Mar 2026 14:19:15 +0100
Subject: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
X-B4-Tracking: v=1; b=H4sIANImyWkC/x3NTQqDMBBA4avIrB1Ix/gTryJFTJzWgaohA1UQ7
 97Q5bd57wLlJKzQFxck/orKvmU8ygLCMm1vRpmzgQw1piKHh0TcvZ/SHHDVtXOuQf/RSKNGsdh
 2jmxtQ21sgByJiV9y/gfD875/usZ0w3AAAAA=
X-Change-ID: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=ZbKCcpdxc55m1Ibdev4LPtQYvc3SD9V0itDcYEtNo0E=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpySbWvigl6jeoHobIK2+4Hhm+00OXLCHz1mVoP
 GsRt8o2yqeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCackm1gAKCRBjTcTwaHBG
 +NMKD/41tgAcoO4nSt5jHaA3PmWRGh1E0I/Lnr3i5Txuc/IjEP09BfUgsiX8Fed8n3VwjYzWSM8
 ptF4AeNEb3NSEGHX8YAmTmojU4pqU75WpQPclQ44YxkNSgJgNbfz8KkPtRKYD9MP6bypR4QlKBB
 vd5RVQrsMMslDIIp9wjFgNGHj5WFbPRrp30NdXK6hjtAwaOcv4JZtvhHwUEjmj3jZic4AWO7wjB
 TcU8gUv8YIoPgr0kN9YaN1Ygg6lmSdDH5ZoFLZqquGyuiBPdPegSRvjjqAvNtcq3VEg5qaJtqMa
 r3eoFTeFad/KjYNk3l5tA2NWGrwmOpvwKPP/vRsl3e0153OH9XBabsysD7oefq+cEEdz8czTfEQ
 7WVD6yNaGWQquDTofzGEQ/RUba3ESIUztfwhxQy8P4m+5jOm6O0v4N9j2X/Uu3kcp/jqOyqGbl5
 +k7LfR4OpRV2qQcar6itFXf0oDi2FbiQlCgMf7tu9dqelVwTsmMfk5qXVePMTUYIz3VVtie3JKc
 yUFjqNLB+N0jEUh5i6SCoTbDa5NJViZKF+00w+cbg4YNdupUmt+AmLFaoVY0vQH3xqKWyOktgk6
 Vxnnaap/ti8Gbyn8UQKLXGwp2MSOq7IglqansNlQ2nmjQO+RE00i2RQk8c4y+fcnmzTIAEaGgA0
 v+lW7KqzpQNo/OQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the BLSP2 SPI4 controller node together with its default and sleep
pinctrl states.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9d4ce47578fb4..7f920664a9d3b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1623,6 +1623,30 @@ blsp2_i2c1_sleep: blsp2-i2c1-sleep-state {
 				bias-disable;
 			};
 
+			blsp2_spi4_default: blsp2-spi4-default-state {
+				spi-pins {
+					pins = "gpio58", "gpio59", "gpio61";
+					function = "blsp_spi11";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio60";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			blsp2_spi4_sleep: blsp2-spi4-sleep-state {
+				pins = "gpio58", "gpio59", "gpio60", "gpio61";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			blsp2_i2c5_default: blsp2-i2c5-state {
 				pins = "gpio60", "gpio61";
 				function = "blsp_i2c11";
@@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
 			status = "disabled";
 		};
 
+		blsp2_spi4: spi@75b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x075b9000 0x600>,
+				<0x07584000 0x2b000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_spi4_default>;
+			pinctrl-1 = <&blsp2_spi4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_i2c5: i2c@75b9000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x75b9000 0x1000>;

---
base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
change-id: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

