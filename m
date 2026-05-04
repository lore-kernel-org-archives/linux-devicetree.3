Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88B3E3C45
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912201; cv=none; b=sFIoTU4PLizyjBIVjesVnhWBNvD5V0MVlU3BvrsQxLce6W8T2ErzMUbTULcSCUy97XhzuprnmylKfRZftH8QGOoVwiqbBeizQ7yaHbO9tewXipvRP6vUckqYGZI+g1AlYKb8QDCJKt5yjcr44o0oWMxeTSN43XJmhWidR4vjE5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912201; c=relaxed/simple;
	bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6IzVT/f+/QfPxbJ/BDiZO39a52FKzf1xT87uoPzotfwaVjyp7SiToCva7yze78+n1GicNX+2anlSEqUxvEBeUXfSQclzprFy49JqXW15sfmv8NAU8gBjsdWZT9MeRCgzYSs4BSvdI5gpJGV0ARSTWUHuArj0YwfyGgrtfuok/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8BZMc7u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8BZMc7u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba840146so37499485e9.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912198; x=1778516998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=f8BZMc7u8Br8te45osA2JWJo0lGCFLK9XFmAZUDTZ4yxKlhFFGUN2HL19nvXKiVgTY
         4UrF5QRZ4ZPREkD4OwpM3+u5x5S/gjBJPkVDzwFhlczkMzfSxZBS16PC5ZaJHeUHmgor
         asPo3gr8aY0nvLA1zO/hYSu4LTuVqOC/K1wAacS69/wArYne4jWKs33Gcp6e67gkIyua
         M4Bh6/3Vr1ro0ugwGAaXP0H5dOOzC2okKFP40sxI12htVFbY3VOqvvJpq/EABWeLqup3
         3AWvJrJgtUWa6TV8PaDLpNXJ3PZ3W817D1IYOEmzW3y0dl1uUxq4rTmfQRff8rF7KZPJ
         jBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912198; x=1778516998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=gpTSANC3DQ+Cx0QdTPSRui8iv7dVxxRSF/8OPh8BhU/2/5pz8Na/I4vl5cTPLzs3o3
         nuyczuCbf367ceshv2vWqU4mUnLnu5c/r/Xr/HrcwJuyZ8EDUib3hnAYoP+lSCEX5hJX
         dLWZY09I+ypTic5Rj253rawsaQg/lgGboQj6RcuwctYq9SYJ3w2UoU22DZIvHvFqf6s7
         hYrnhw4oiA5MiN+/Jq5v+28oMYBxqbaYaYu3BnrgkiQqfNr54DpLV21sUpJ3b8Y9IqDk
         3oVlgOnCJAxqr7H+mSVRxxxqTT2izI8YhlEvO6FIE/rkxbDgcaXiAQYRPh7KQpiy87uJ
         J6yA==
X-Forwarded-Encrypted: i=1; AFNElJ+lWx1H7Dc2cyljCXW2WZYgGPtutDB4Xk3K4zHP7MpMaHfBgckKL/De1gZHtYZn107KdkBGlHwWOMFM@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1wg8TTYFvzYG61hjiJi1CsGjg28cGtHBkfay4p6lMZIM/6L6
	LPn+7vN5jjIMJXC/QApOZvRCKjSK013O3py2CIKKstwzCsQkpPa8tiWFREHsVCZ2kCw=
X-Gm-Gg: AeBDieuqTdD4mDg9x5CMSMb8zAmlTbrHl4vHYMNv1dP/+37ldzK3+q5PiCuLPBnepnP
	npHtmlhZwW3zGIHLMghsN/KKovsg3NAFndF2Gek+4OHb4skx1W5hofhfHuFSzsapjZ0UlRuuZtq
	ZsbBj03csdl+AIYheS/XNnjBexsaxq33E06KnC2qmHSDPJJ4SXAagFVA79LnKna7G1HryjSrkrQ
	1qRrppRbZxt/Q1AOMZn+61Ct6v06DW6hg+C03aA6WFuAfb42jIRNvqp6r3KWJHXQGT7ufL6AgSS
	WPrr++Iy2+WMpsqxAq8R5v3EK+MV1USHxLurVrbabmjGybElfihBQ6bJhY6p1t3vAivMN0wNt5E
	7MlYGoKspoZ2tYNem8LohSSTYDygmbLeCc2Ilhy1pZkBZRUZMgbW3CRa8ulKr6L4LAtOU7qoDED
	IEQsXz1SgBAQKorUPQzRbJWS093CoWbxOIuIxALpN/QGSyuXXLMXYcoYFknkS5gAUaDw==
X-Received: by 2002:a05:600c:3e07:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48a98640536mr168020275e9.12.1777912197519;
        Mon, 04 May 2026 09:29:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:50 +0200
Subject: [PATCH RFC v2 2/6] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-2-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmA2HAoftt8ljk1CUAVolLq3pN2NCRdXTJL8H9C
 jo1jMpuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJgAAKCRB33NvayMhJ0fqmD/
 9LC03AW8uj+0Hpr/XqW10Uuk7oLHVtzWJXQt2H6BKeUNi2JUbMIv/+aHRudIP4Vq+ol7a9+T8R/Xv0
 uDMOH8ewkfpe+OWUXWz6lh/W2Im9T0bi8goGVcnGQInuR0L8Kn7S3WWcnrknNaB2E8qbXqJ7/y+DBG
 rhzW2AIPqLbWx1ahXMycQqt0BrVF+JHS5TJxHRGthxoGaSCSlP4zbWQdE+7V1B0d7sAhUItn9CrNRK
 UbVuox21wwOxfiKvLqCAXERSO18351WBFz82ZkJBDMns2YUJSVE4UC4lClOvgHICoMfrFKxYJqgzPd
 JCvNZ3UswP5DuM3iZkUj0o0//41YeEE0s8YSJCnicwWBv2m8WU0XZ/VU/IYURynYa93B7XdEvfcLl4
 a2DWXEZhIexwuIx529EiZSU7mZWukdBXHVwuOts6N6CRnBasaZb5tDT1F5HfNIfKEDTwH/eNNwqrNv
 T8iy+j9QNYgCs8JvI3zIxWmQdekJZBqduOahOGvtCRq0xDIapyDavNbVyxl2GddMoR+6yIBASoFM31
 wBAA2ajFQ0gnQ6OXdEsPltncmmvdXIrzEMevmxrNHgr1wdhbMkjoUXqOCNPyjR8Fwtt/BBMHcdY08M
 KRTQAt6nVxC5btASySUh5SfPk5JBLAlEOIF/+qU1W3z20B1K85FffahGur2A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..515cae060f27 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom,pmk8550-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -44,6 +45,35 @@ pon_resin: resin {
 			};
 		};
 
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+
+			channel@0 {
+				reg = <PMK8550_ADC5_GEN3_REF_GND(0)>;
+				label = "pmk8550_offset_ref";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <PMK8550_ADC5_GEN3_1P25VREF(0)>;
+				label = "pmk8550_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@3 {
+				reg = <PMK8550_ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1

