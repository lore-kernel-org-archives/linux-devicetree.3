Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543D3F8ED3
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700835; cv=none; b=tkWHyOzNPE8di/tfD+BYtJKKwmVMBZ3FBbkb0MV6TW+IxLQ+hCkiSOd8yuDK3iQ9aGwBEiZY11xZMHZYa5Jn5cTz94Xgfu/NT1pIMX5pIA7pVJqzWo+ZN4TS6rNf/TBQKBMEHox69imieHFB15SDJDM+RZ3e5+Zja/7rZfqJqYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700835; c=relaxed/simple;
	bh=9LjIdqxAzGA8nyRxHZsNelWOHdlFc7h4Fc4vaHKP3W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFiYOorRb5fRjwcjd7Rfk0Fcxw9abGn2ObkwyO3IxqmbYdf7J/gmuZo9cQx5lwPi4JRe9MScivLVUDFBK+kqyVq8oOl4X0Kkhq0F5nXPBRNEKvbRiVXE+WD0Zmst5lUWREPx8KTqO8zOM4/0RZINcFhDZsJEFqQBQfquq6dOOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oon9yAzZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oon9yAzZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4619990ca5fso2166881f8f.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700832; x=1782305632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MYvgWHAkHUaG7o3YOGCvdHosSAjO5JAruEtY+ONrXQ=;
        b=Oon9yAzZADmIVPCHRaC1aw2ZPg1FosYq15e0kb8Z6YztSY5pZbb75z0BpuhU1F8YK7
         Zt1XRA0GwG5xvfLPWMjt4oi2H15HFaHmalbSsfxKa0oB3Vv4rWzo/5q9qsGHQdFNbrHQ
         lPH89QIz1PvS7PjnkKI4FMh/dFFTVXT/pHEoAymfEp0yHp4Yv3ydxcZaT5JoAucEk03E
         qpOiA/2HHeKROUPB3nBfCBYr6RxtH2FgVlKQx+FKibXERxSANXEhUA88p+4Gn2ZtvGm8
         Qu5KiNsjq0rQeUnFuxBSRX/r11HCEr4vxkl0LpR7ChHeqd+BUVM0ObTBmtZKpbOaAgVS
         ZEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700832; x=1782305632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MYvgWHAkHUaG7o3YOGCvdHosSAjO5JAruEtY+ONrXQ=;
        b=MXD7qv/yLRBBEblM40eIMHLEIwTSojEGnpxg+vTtb9pPfltOmsCR1xWSnrbxGcWt+A
         wzY6443fRFrck3htmtmTdslPM6lpLxh3nSAER3mUDA0XvGPoahmyMTNfVNzVceDU0uhY
         mI+jEM7smPccjlUVBDh6XMPd1kLO3MlrsWzd2IvOVgpNCpa9/0ChrSQj3m1DYSDo1T8E
         9tqbjymB3irDYjeDcIaTS2zgryLSH6JXoEgNIP870oU2JAHQtzSWwciLYynIcJtGL5qw
         rpwxsanCzKasxa+dI5DIdjXnU8spiKVsyylCFADBpdWooGkluUNTiznHMIv5LOlFm/GL
         K0xA==
X-Forwarded-Encrypted: i=1; AFNElJ+WMyHRBbxUUry3q9WrMuQqRpDSQULXeNzVwrg89VWlXdn5HtL6FvzWTm/++mDN3SsWwi3Y9Q5My+9G@vger.kernel.org
X-Gm-Message-State: AOJu0YwljKJwG+5mBDtndw+rV+pHzfjGrPB1SX2eaQtMko01AQbK+W1B
	ivj0MjHHNynj8LJKc61CvIi2hfU83oFNi1mQuGbdO70Pwk4YrbKRwW9NovoG3Cn/ptLT0U8vrTj
	rrXbp
X-Gm-Gg: AfdE7cniJ5f1PbrNIX7w9oIIKv6/uUZee+7aSy632pa76aHeK/bmsRpLXpbd0wnswib
	b9bCOVbhm+XsrMuNySLSqs3c807Y3KxM6aygVNX8uCKIwZcw8z31IvMTMz0EVlP7OZ6el4PyTXH
	CLiRPO7CUfW+UgN7xxEZAWHMYgP7PqfIkM+kOtZZ4bwV7mWniO0bTEdFkuAbUtUE3rDn5V5dUcy
	69ZRNb51rOqNN7ZoIWBbkEMx7lLk/RJE1JgDFFgKMwKi8AyjH+mUB2b09uSec5HikB5zSWGsJYm
	X9cWR8Auc9dFNl6pmda2YmK1hXExpLoLhPe5MYL3rtY1ZpYHnI4p4Yqy+0Bz+cCmnPKn1mcJM14
	5YIUUyg0G0eduOsMoXlWi3fQ58Y1VE//nNQlBemk7LmDq5CPxHj0A9MeWCnLLTeQGHrzZf5aP5+
	pWaVzE6OnMxG3dzoxjQIhIaSSzAWbOHEOvYQ==
X-Received: by 2002:a5d:6ac8:0:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-46236462012mr5351485f8f.15.1781700831949;
        Wed, 17 Jun 2026 05:53:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:45 +0200
Subject: [PATCH v4 1/5] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9LjIdqxAzGA8nyRxHZsNelWOHdlFc7h4Fc4vaHKP3W0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjb/AYQqnbXL/+ebEyFlDs/Sb6NOySe7vVL/8YO
 kEKuZ6+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2wAKCRB33NvayMhJ0dUzEA
 C9F8bEdrJxUF+YKQR7KkMoogmOeBImh642IteRv6opb1FkXRW2RpCjtgiV8pMdjnFIVt1+HoRC0HFu
 zoAL6u+HUy/lVLMZP7gpQfJYbyRz7iTWmR+TZPgWg4AQtOFTa7ZQDLFF+uP4mge/R2yObJM/LnwQtz
 NsmucAbX+XdUhpK06by9lhTVIgYbK+hTaliB8X8k+v5En+o1QJv0Tc9s2VDIKuZq0TsdSjy3NUJs2x
 bPlQ1g+kUjmGEl5Qj7FHBJ6XJHT0wuFFj+zj9Aq3oV5cZSPSbp02KtZz35c4Bx9+YdkaYewJWpR97Q
 BTM5hM7ilLh/+U8xn4fvv6Xnxo5mEpXoklgk0IymXnxB87c+bG6WBcVjqbgVrydcyCHmWh7HOGoBPo
 wo45Y1RSWQqZA7mHranEzK0SVt3v3WGNgeSG99NiPr7f/bFe4V7w6Bg0qb7YHEcBMhepUvIe6f57bo
 eg7/8oIYa4WrSvYhfo8OqbyEM/pnr57S9jft79gqdnY2niWITvi3Rz14GRMKeJfmnMgY4QvFmlCjql
 db302AAWMjo3KCEVfdr97W+afCc4dt4jFt2vgOFqFuP65UGp8QqqQam0DCJfJzv8a0BP7HKHiFMBxs
 bTigj78hg+QtntHFYmkxsg3Ftmm8JoYV1tHuhnCvZ40GFTe299UJKuo0y8FA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..639c0b1e0c33 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
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
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1

