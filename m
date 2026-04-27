Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C23502A9
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306516; cv=none; b=VA1ggP3x8wuvbOh+USDQeuhxJLTSwd9fIF6jazFLBtTzMEDjhaS/NuqFcfhVk+xD0Fz7m/+8zUuHQIPIvr/6sRmzDZPOqMx7DWM6GvhQfAw+Ktw5yh6mVeWqFFQwpQSRPDJaF71hNax6BgoTk2Nf4/6Y49E61iwn7NlgvlRKRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306516; c=relaxed/simple;
	bh=ja52A81219p0ePqreXtVMW+SLCQcQR7+LrrsEvke3mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILLCvNbu5r0Snn3DzSO72hkTkn/RT06hneCXe2XJU2beekzECctX4//KRGaB0IQAFj8n3Wxaco7/8M4iKqqmAxdZstM4qdCfOkYPC7QkPAFTg4YL+dzSoEKyeibCWqEkIg268ZCzbpdS7N4xkZ6YLjAdrh9dzYMFwALoLrszy+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQfxqP9/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQfxqP9/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso86452645e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306513; x=1777911313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEGCvJMMGZUGWRRutNitBQD1FIXZV4buFivR+bBW190=;
        b=GQfxqP9/1tKU5sCwXQv2s9hWdphUhVJ8iWU7qSj92kpC1WaIpjyFggOo8+QwceoJcU
         gmAD+3fy+kJcJnG7YyLnYAU8+nRwQm4353xiVMx0hFdLP5MsNyANcTnmiHiAgMGYxDRI
         Syc7xtC2SFycWV3pyydTtZyQSOxtgbDK5yx0YlLvnvsLwsEgENXJ08la1CybGUSyihzn
         GaoqO4abUxv8d7bmzCkBCx4mjSNFbOxnZXJRHgKgesVNKLEWk2VPdxl6Vb2cYh5UH+2+
         +x5J4YPsDTiup2nQavVhQGHn0ZXBRKdD9tdyNbnzWwSS8V1XxNmGprxnMQQuNLSjw0Io
         nHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306513; x=1777911313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EEGCvJMMGZUGWRRutNitBQD1FIXZV4buFivR+bBW190=;
        b=NtO5315q/qshZKq/DLYLPmajbyxBlIOgwlHZMjf25apP1CaayLCQCEM50vloc9miKq
         Ide45/IQdBqtzCAZepIr4vgUhQljFnbZmjjNrbsxxiLtiuaScjs2rfPXiTrq7IHWIciO
         EJBNWJbJT8GVezLSNJuJ3N2GlgR1EfNzhHLLhwc6ejobM5Qk8nxKnYRSxXPK7YfvjFD6
         B3/eGEQKNFbQwQ0sQRTtB20N/YkJlJvXwMZW54RLKAA1EbXA6oUcvdRt6T6KuoO7gTNf
         4rBmgJUzCCsh6IYWNquGukxkem2Kr/p/4ebg58UYr9Co/kJs5eyN/SlQBArWOI70j/aU
         b0Lg==
X-Forwarded-Encrypted: i=1; AFNElJ8xH//cpfkSAwlb3qQhsqPzMVCVr0pHtQt4KlB7iduOcISo+PH1IBlNSI0zpUSFMlVWgf1HScofVEoo@vger.kernel.org
X-Gm-Message-State: AOJu0YxmN6FG0xXkUipjQi5A2aERbDIzWladJvwicdRB4ZDs+wvFr9ea
	yE9jz1tO16z38jlEPstoA/jKIRJKdYzY3MsBQ3uqo9jhyLok0iimuIoMtyH5iyNL+mA=
X-Gm-Gg: AeBDietLdAmvFeXGlSibFMCvIUFrO1/lISIcaKVSNKc/Z46n9tVcFbqRY9nsGIyHtx/
	RpFUyjTXt/sZXs6SZZXSc1ZeaoKj1Xc1NPRtHESkb2QwZnw6fRtZhmOA2sFuO59PD9hxO4tX6aj
	6ByB88ZixzfR6AVFBwqKqfXBXLGzaXpQNtrO5Byia83L94qPGKcVQoIzi0OApRfQS60mlV/tCnb
	8y5fHaSojP0Bnp6BvyYoO3VJ+Mgki0evBUBzxLPv5yOxQcOhCc1KS8FhY4zRWEO9esYaKT+CKFk
	hTzzV120akHjyf1tLcCU5Uqgpn6ZcNwdWN1bA0y3L76wMs6RHUcOY8Gk0W/HZzOgZJ69n5g/3M0
	BM95SzKKEuIeEIEcbl9yyUDZ0binw+Hfha2k8um4KD10aZLgnXGBZS3IS4EqqFB9KJoW0jy6kXe
	EWIBUGg6UBHmXpW6xNtosHax5m6hTOv2UUqtgivNKG/ULhClL7/7qDuu8=
X-Received: by 2002:a05:600c:348d:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48a76e00c19mr1628115e9.0.1777306513158;
        Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:06 +0200
Subject: [PATCH RFC 2/6] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-2-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ja52A81219p0ePqreXtVMW+SLCQcQR7+LrrsEvke3mU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uMHV9IkV+hAR6m8z5+XvyiJ8jBWig2Dko94AkI
 vk7W6dGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjAAKCRB33NvayMhJ0TGLD/
 9z0OPMlS+b6Ksh5+XnUkoro3vILp1uAs96hRYPdXBiBG8pKSoKj3ulu9x3TwCaUUBMmF6EqPJsXEZF
 K8Wq+LvpGE8a/U8i3Yu8cU9K2xbHD2l7GVSm/lKUTsPH5HbNE+CSnL9TqfLi/zckY24MK95j7PuE2X
 jVbotqxHmw4tjBIrN2Ti1cf2zg2GNXkllVe4sV5Cjl7DpJD3XMl6VYZoG7XS3BVf+AY2Z2SRLi//Qz
 /6O6zbeytvuJcMGWtvcEQUULJ2uKtXKIXEGWXb9Lj/g1dh8YhMti0YmEY63c4uPCk1l7e8RXPmws4S
 MqhnU8FULGejy6yiKeX02/geDP17gTVrnmwTExPjWUsI0HadzRFFja6h+6o+P5e4Kdy6jE0ROgKAAI
 HzluxwWWnVSlgxbLT5z4XUyrX7JHmWYy/1Neh9aOfKgD9b/wYfJsboHLu3g9ZQJ7enPXjaPn+Bkty8
 srziYf6JdtmrHZy6MGSldaXgZXJnEFZI2KroyQgyz1NTAb3ken//0ZKIpbBToGrVfyH5Nv63dHX0Gz
 IU9OPpFQvzI3BZNmwOtZw1uUbIfp96i9JR68ZH+6tBBqAJ2TUx7voSdIfZf1qnhR+64lD721M6XFJp
 +oK6ZxWjqPnJZXzZvr4idbdNai1mo6fOqBc6+wM2qF942ci+G6EfoI2twZfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..92d57d101c7c 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom,pmk8550-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -44,6 +45,36 @@ pon_resin: resin {
 			};
 		};
 
+
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

