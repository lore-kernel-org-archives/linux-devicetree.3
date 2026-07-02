Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD047F2C9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985721; cv=none; b=g4aKD/U8reXvGvLA2gDFKEYXxTtVQZ02sKSAPBIK86HRlsoa1rRa/SfIn1XTm32AjSTuB5tR/zWcSbc+pI0NF9Z4qpiA6kxMU06F4WFqyohL9teyA/73Qc2qg4nZhS1hupBCo7IJlw4S6E+4mNPnoCfd48cse0ZB6RPBtlEOp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985721; c=relaxed/simple;
	bh=DRcyK1Ists7LuW0qy2Nd7sDzgb/rxnBt67K668JzGgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLWl0JvHDq8jzajFgUxHAgktRokhKsZHGKIx5BViCkN2yzJcVrgXu8EeIfGF9x5fCA+/0zu1xcQL6qYzggoKiRWyE9oanNs2yW8UmfcMf9pHjXwED9bMmt/ndhRQnaQ2IU7Q57kQVxyaWAaVH8a8Aatwmex5RzkchQIsOTZrA7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvQBA9+K; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvQBA9+K"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47248615e4dso1620374f8f.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985718; x=1783590518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VK/id3xDnYoG4iGuWnhU+rvfM11chuqqRcmhfRmmpk=;
        b=zvQBA9+KHwSkCCn9EZmZLCSiijJphlVFSTP0T3/gFsgR4L/kF1NLEnnbhtYrF9w5Lc
         LaoDB5ALlzRqW1kh3aLQ62DXsG8Sx3Oy5GGhKxpHSM/oVjozaccdn8XzrkP5LpSGhJQ6
         6Oa9mZ1ntvsmvUcRr28Ca7pw4/dTtAs1sCRYiXzHAztrvhcyU9Ezq4NB9ylRun13QRzw
         eHkI0xDL3Sp1ZjED8wsxJbp85OUG02tjSMnTJn9pxcwLF/9yCZPWSu9iJg5hw/owj/ro
         93ptp/DdQh7Vz3lnIEnYlF1WHwUHDYtySWN72N/dw1/SWTqdIdxoNReGP7UHcODZbzfN
         r06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985718; x=1783590518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VK/id3xDnYoG4iGuWnhU+rvfM11chuqqRcmhfRmmpk=;
        b=kgO5+rQaeWFK5KKu0054fNdVoA47qD26xVtiQTdDtTv9dBnmQn0/toHGyrEif6R7mQ
         YMz7xEfBOr10NzbDM4TqqPr2VeJvdqCNQQFiElj50YjCr0UJw7eV/hZ6WO4x/JT6q/eM
         8ZVSwAuRFHvGJW77D/MyyUXdvXfkbM5RORZ4dKkobsbd2OL+ui8gbTaebDx4E3bdaJMZ
         3P1V8B5qHSPUfCX5bUETDnLTeaaaEn4xCARpBrmyGxLUhlQpe5Vx9mzlMjqi3T2q7z/Q
         4KTCuFr26hjf6ifPT+eQXGcGlzuUrxHB1IKtqmhHzfpjF+sJSAzGu4hi3hEBeBs8c+Ag
         1Yaw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0eBV1tL2CXI0uZNywzOjafv74ojTjAG7NpDRoslutB1GRqxJFoV3VpoZDgTbjiGfK0QIGl6KBNNsj@vger.kernel.org
X-Gm-Message-State: AOJu0YzLc4PwWvTc3IAw6bsbToOLnfUDoJ0qZxPs5WxmgHWQ+ye3hiP0
	gm54TtDT8ehkTeoK7bPCG6bw0SVaHCTIjYmReAJBaWn6YWsRFTYto5NC9dkFyABI2mQ=
X-Gm-Gg: AfdE7cmAGA0NazdlmpSbCmCaWrAfJ5zrZLKPZUvEd4AFjz9cvQGyA7lePlYclFZ3loo
	L7KJYGGNDnqxfyXOnN5TZY4+X9BXPr5uzTVgNrPLVcZRd5e6nz9+P5rjXl9TlAt5He07KTULbLz
	/i7fzj5HAGhnPEZJiNWqdkVcs4AJ6FrQEWnSCOXqEp0bN+uC0G/p+Zl4AOohepxNp9yDkWozj1g
	m0J7Bty0TO1u1NaafmF7dX1NXX2nPjb97bUu0/WrjhOcKyZFxTrYjZk+cPex1MSM+1UAyj3BeBb
	Til90KqweO0j68wFIxEI2ei0K1YI5gp9v344ukAxkbAWKIY5qnTpWeRs8H/Uu2oUGCHCzLgt3Kt
	nobQF5LDapuB4X0GIdv2iRrzsvgrUXZt1sm9t5Uk53TQKUfOdN0qSvSgvvn09d/fHQYTjT3nlWH
	7LAZ+1RHKlhMMfxecFo9m0rDssFtqgndz2bA==
X-Received: by 2002:a5d:5d09:0:b0:478:3f4b:348b with SMTP id ffacd0b85a97d-4783f4b365fmr2962717f8f.7.1782985717870;
        Thu, 02 Jul 2026 02:48:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:31 +0200
Subject: [PATCH v5 1/5] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-1-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRcyK1Ists7LuW0qy2Nd7sDzgb/rxnBt67K668JzGgw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPxrLl+2y/YhpE14fa83jz+U1xKkplrS/FLk46p
 N4w7FL6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8QAKCRB33NvayMhJ0Vg4EA
 ClIQuzY6rk9v07bZp9VUMVjRjDdINn6+4vVeNY2pnWDFZO2GuTGrC6NIPeW+BQdNdlS1SN95CnjV2C
 VpSJG58Jr98qRiF+CaeHV0aVnPuU+3w2x2Xbx51UP6vDwDuhZlLRy7Jf9zjThDBhqdFbyDmhBV3gGP
 joUEaJxtYt55yGxwmpqOXrP/4MeqFGDwj/WQcAE5TfRuWcyyMDbYOVmsskpuDu9t8WAPJN2cYghMNM
 dhqH2Ya3AOJ1beBQoUWCVhThzAp4weHjTF+cIUwO/f32EDF+GQMqi0DaAe90INJaRlwmut7yjOehUN
 awl4Da9WuwNqPsogKujkLIR/gkxMaIO8WXJukwYWdufEys9gbAo6yTrgNj/oLtgUCHRsPI+VMhANHJ
 OvaiapbZTtPvCmuu0mvFUfcGDQ/w3zppO/psSc/U0sJAB2ddH+Ik/d8rbhMbQdYDz3R6WsI2MYdUs8
 pDWTe7QbEh0jof1hiXbiauvBkFgzBTVUmUhQkFRPA7wV7Gof19NpZR39KPn6m+mBGVozc3w5lsCfoH
 2JqBigi/7R3tSeZhhco9+0q4ClxYxqigzmNOB2NuwPH2JzF7rV72FufIsmba54NKBlnBvx8zNuiUOX
 92amUAWi0tMnMV3W4SuaO8G8DFjRas0pat9A2N5Gd5TiN5iPWJbKwZFP6nzg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the VADC node and the initial pmk8550 adc channels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..3a9d9f7c3742 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -64,6 +65,35 @@ reboot_reason: reboot-reason@48 {
 			};
 		};
 
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			interrupts-extended = <&spmi_bus 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+					      <&spmi_bus 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+
+			channel@0 {
+				reg = <ADC5_GEN3_REF_GND(0)>;
+				label = "pmk8550_offset_ref";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_GEN3_1P25VREF(0)>;
+				label = "pmk8550_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
 		pmk8550_gpios: gpio@b800 {
 			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
 			reg = <0xb800>;

-- 
2.34.1

