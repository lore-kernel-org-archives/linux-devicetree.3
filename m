Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE4413612
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542823; cv=none; b=Hxw8h+cyU0SLcXzBhHUtALz6SglsW2Df5EnyZ+p8qvkSoO2aRYqA/KgRo9A/ISOde1dfnXjldDtq2l93BtaPynDV0iXtUhB6c0smvsKLwzzuVK+ThxNoIARpFFLPwTu6Ase0UaDSmBIOnJ/YQKX6G1HSHPBqUYHApg4/o/NM0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542823; c=relaxed/simple;
	bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYdhzoCSgUwcjEIc0gYRJaUcOcUJY92Jyt/pFu2ZD8rh9R3yYOYZkQKPFywxEQ551GPT/gdVbbsyUi7D4MMQn1w7T5GhG+QljEJDUG1rzIhaZrZg93Srbo1a7/d6UPZR8Lv1aaIHNO1aHBZbQ0sKuYVa6V5s/pgWL4fmv5UCvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GP+ZIybc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GP+ZIybc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so22011355e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542820; x=1782147620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=GP+ZIybc757YmKx7Nvt4Te39xPa3eeRKudbftFBgDz8DgfYMPk30bMgK8lsWmtQEb2
         PohKhzMV5DTsTLoIRdlxfanwFhgNDCNEBHSk+wumW9suGZXkEMFbbbtOsoecvt84MGK3
         P+pd/f1jcSfrvkrjAKdDB53p6Mdr/Z/UCQeMJ3WWHSYiD97/E97hff9EWwkc47HkBUbs
         Low67lZ88HJz1Q8GW+dMN1Cba4dsBp/BZO8aQhki4PWqmiwZGzDFB8gZTbh+RJ0eW0AV
         yT2PPySHn+6wvbTeS40gufIZ82wYI5T/jYgD3NkHgmrH/ToAVf6QJ8p6B+251d6b+vEI
         8rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542820; x=1782147620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=bYWFk0Qgk9gq2KXUTNuGFMx3vBX2IZ9IBsP9qVWNdEncipT/UG08gnGU6ugZuXwqck
         tCBhNVMuaPBlJXhQ5Y+HHgbP5YSbRF0MS0ApMbV5dsrzHVIoHnFzBHMsOSzriQZr763G
         j1X8wxSNsmulgsJsQsFGTZcnDELxpp9m2lQkWaRex6X54ie/ULCRuaGXR5OuhrYdzDor
         qVzSh/ak8v27/dUHV9buFxrFe4jxmPqCAqJPhgWpD7O6APSKq4jCnE2UcDYRR8Gsta97
         Brar+bkM8aba7Z0tj7moccYtf98BZGwHfhSdC0X0RM7H564ebRRcRlliXSkSKlaHzpqm
         tl0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9N8gpLcocyypTIqQK5hQQfmpBjs0xEbX0Qg5BK2hTryEgqAfXE68xFSpANDDCFT834KbbYUjPUQ+D3@vger.kernel.org
X-Gm-Message-State: AOJu0YysPnSSJ1HVL5aWTJprY856x4TopAwLI5mWj8UEvJ+K8XnR7OuI
	AyKEhDSlvI2QZW1N/qap/vTAVeMDVzECej2c/C/bzNWPaIO60odRpfoftWlIvrK0IfEDAE6XpBD
	dMBs8dLQ=
X-Gm-Gg: Acq92OFYonTEPRCWck1AQIHbWtG58wBkR09z3K4PzZpaOLhqc5W0UQGmgS/WBSNVe2s
	Yqcb6ckE/jDoxoMWjh+MMdciQg7umArmyiddy/2ae6KIxuP5qBbjUqK2AsA03/OwxMCe9jvAfxz
	iOg8WW5AAnE3ut1vxd6kF2MgjhSIzOlETQ8D3PkQGo574HKHF4TJb7KlQji/tYwkcJKKFWDNfw/
	5DCkGCgJfB4lu3fXHdIoFec0yl8xxRjgaFmfi0h5/xiVOcXZq8m6VptcUVFRvaqbCIVMaBTitO5
	Tvt75GZTYm9LFeJw8QHRKegcxX7YorXqpyXQIAIZGoWjda+pYL150QQvSankk61dqq6DphXTmdT
	iKXcrkEckI2Aeaz6YF1r9U+ialGhj+qPtgpIt+OAhaeY2jI73HCU2c5DlQ0IgaeS+sQTpKTd92w
	kuz2yJbOCC2UPzhVxS6Je1pSvJzAANksiUEEbi2H5Ddi+k
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490ec4d523dmr203951295e9.11.1781542819863;
        Mon, 15 Jun 2026 10:00:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 19:00:08 +0200
Subject: [PATCH RFC v3 2/6] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-2-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+ePrHo1DsAs4BxT26u19Q481/AZ/g+SfmJ/f7n
 zBb8jnGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvngAKCRB33NvayMhJ0VuFD/
 426aBWI+rtVqsem3Pcx40E7pRg1vfROX75vFrzcPCc5sZum6jg4Ab/qCWUJ3a9y3BfZVtI0V3c64Io
 XpMR9AgvsJbfOLfOQLEHjQSUQx5Sl7sgpr7Hup4j4Y/VGfU+XvqqaoZChwZV+5NpMT8WP6OG3wS9i8
 G2aqXczt0xUNd0dUJ3+zKHDx6WV8UwK6T6pnHQfwSaW1ZbHhnVNTvXX3iCXTdMzKFBansMKRDPMBxW
 jMFF79f5HkeW6vtDNWCKazl7uP6+otB3IoQn9357LBA/3C1fpFHJlqpFTm3TVMt6V415HKNodNOrAD
 QgDXpqAp/wpvW/6WTP0o+kBwbpb5rc4xNpBoN5sgan0l0ek9sHqm0bBd3pULLFgUgLtDy0XTIAGSHb
 ydzkKcCmVU4QrrxAPrycftPQmRMQhCEbG3eU+2QGHD0UEcSsb4a3VziP+LweNbrPbbnAHBDoNnQtr1
 dVtw4eTE05uVejaSBfhuGwMDBciM5gcY8nzf0xFLgNp9ooX4gse4QIHBwAx/HCe9LZxEufGv+Uf5PM
 9exb0e0LpPqAwVlUD/aDOVofcpZxzxyMPu11syYl1irGJjXttG0Z19WwAhoSE8TKANCez7kDbEdksa
 RIqevdwMBmQxRLLtXSLQhv+LSP4yxH14bldxsfEzdrTcW6/W53fJFzSB4c/Q==
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

