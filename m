Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6E46AA6E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647896; cv=none; b=XFJDn5mDkc+79mWE61jzRFVjMKrkDUMNN2ogiPXHBqVsLFpsQlaC/NP01ExF1vibcVCLcrW6Me6V1rEoRasv9h41bVZjQsD+nSv9ZzYivapIUThjMBQTxH49KeSmKbwDgoOTJ5odiVg5+31HbrthngpKovqjMpKAyRaEgA6by2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647896; c=relaxed/simple;
	bh=DRcyK1Ists7LuW0qy2Nd7sDzgb/rxnBt67K668JzGgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VF+gbzmrr1QODChCYQtzCzpSGLp1YNki/NU+9whmgfLTRBlE69VGaPYMt3JU5+EYFeM3vOPAmB8WGRKQ9YuAKUMsvCaahDn7uGH8wkh9HjOx5Dows+BnOzFYvaJU/BufyLegz5dGOPcvRB16RrnrS6bWNvlrM5YZ9kVy0NDs9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpsyJ6sh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpsyJ6sh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49550ec592cso16188325e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784647893; x=1785252693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VK/id3xDnYoG4iGuWnhU+rvfM11chuqqRcmhfRmmpk=;
        b=dpsyJ6shMsiCDGCejh35ngtQhvnh63+xC04axBDwbQFKcKLNimvUg78zK8z3nSba5/
         QhNGcprqSesyEcVwScj/5DDN8BZV6wKn2re3WtFWZ5SKJbcUlEJKkTihZ0Q1jfR+X05U
         lxADaMa6Hc2WJ9/UAY/oy/99HKIA/5qv+PhJnDs05cluEK6J5lvctLW2gV5rQOPlF5xm
         2sRk+Tf+HgeSQwnAi9cPhiWS2Bn0xKqjEIHGTj5L+00v7rTspw7Dw8Zqqxmp8OajHIna
         84CaQ2doaALoHzNzHIsXUIjs6lQLUp1BwkbGaJPvmzgNUOYf4vb308kDKdRWxSIAC/dS
         XqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647893; x=1785252693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VK/id3xDnYoG4iGuWnhU+rvfM11chuqqRcmhfRmmpk=;
        b=IawjXXfJTRttj5p9vY3ErnYXE3Ry3tKU6jKGR2av+anSdjOXM/IJmFMjdq6pM5EjO2
         yaxzfS/3VkrTG9MdXSWBupxdJY9UiZxlj4lvLu54I97Vxgx6BfyhqsoZD8BlAFuJVUNU
         h9Xuks0tezmtLqA501FedD9UtpSQtx6CEnSbduZthjrN2oiN7I7gEqQqxYetELu/ZVyO
         //8zoi80EsMVSs0hmJgv58V5HSp0otxv84KM6bs4eDYNHr6YWIa/rXygfEK2g7TpgzLb
         9DIvFZQGMq4+lFApzKcbe6lIGKAL82DKxDOXAoHnR41IvD79qC2AFpXgQEJO5o+SPlLZ
         hlWg==
X-Forwarded-Encrypted: i=1; AHgh+RrOK8MITwu8fRCGegry7bPssR4NPApEDcqMmlYQHkTnwbytV4IXnnSme8MEzDGDr7H9SsBI8/cbhkjy@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1PH08ChYnWTZTT38WA9HLysTMGUnWxTsWl/Ef3kE0KCnprdQ
	yMU+zCfgYZP5vxgrcp5iBlvtCU6rGYq6pJOhu5nCm7lMRsGRAgXph3jI1bUT+XPobOM=
X-Gm-Gg: AfdE7cn75qzMC3LhTkOIHrZzCDhg97M4YmF3F+jKMALIjhKtIRLxg+0UkUOXMvwS+1S
	quIzy1qkN5j32XuqhVLb04P8hsVfbeqdZU8cZl6RefwnrpfmeraC3F8Wajv6UO5dw5fhgTPwabG
	J9d9TwB4F1oVwKSWKnr1gPafJanKmCLPg2tvpsShBdJzmOF9Wxq2j4EJeq+a90hUAzMcSFR/+p0
	5xFxOspsNJjpsNWjffpiWJygBkJ77lM9Lhcxldot/7IltU9U7uRC8RE9hV9markuIzTLOqEv7hB
	0UljM0wk/5/1fPk5izUKSpW/rLs8o1PZFBJ4Gq4mI6M5qVB1ubVDloce35nT7YByngVJWmk1sx3
	qEO98o2FBudDsWSIPw7CX3Rbpjqvt3XDpFOIkFJur+3535YZVwNUtFnibZr5fET86XiGgM18Rk9
	WHGyHTCwsDXwR8jtnw93ei9VI=
X-Received: by 2002:a05:600c:6610:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-4956a511b49mr1357765e9.15.1784647892865;
        Tue, 21 Jul 2026 08:31:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm1043495e9.12.2026.07.21.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:31:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Jul 2026 17:31:24 +0200
Subject: [PATCH v6 1/5] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-topic-sm8x50-adc5-gen3-v6-1-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX5DRgi/APCtoeGY2wA1Dvox7rLmwiLu2PVRu8S7Q
 KS1rldOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal+Q0QAKCRB33NvayMhJ0V5AEA
 DDz8TN1j1NxN8m7U4ERh+o4QgEt7SI44vxU8q/Y61cRRgkRfniO3GWzYuYyFATKBg65W05+ocOvUZX
 vn8A9qJlLGK0sUXnuwFROJOtrGrlXmIZPSlqQ5E7PE6toxy6SysOuMs9l1Oo5mAjkH2/yaeSWUINZr
 qUWizJMCReqSyWU1TblzF7JSL80WCE6QHqhecKpohOX26clnKHQ289yvnR7Q4STA2FNHPn0/dU8iMt
 DnhB+4aAex770k1YSgYkQMtfAhj/RKOg57ymg0YW/yT3N2iAKNQ8529cVp5EsBVxX/2YRR/Ppjy2Bd
 ulrRQre42FF5l2RrArQ2YW3GEt6RcfB5aGPADvjn13lPBohBcaNpy3gxeWLeIMZRJ4cfQxoJDB/9n1
 UJS01ikFs6eZlPo0g9XyLHiI7Rb6juvrqbefqfthMcJMo3nphLZsvR7GuDj/ED/hX36qcZeaD3GaX3
 cqda2Sk1k+4MvIJ4ZYVk1NPonA2Bwo21lC0NDUSqTScADrni3x2MOq860694VlPpFDbP5b3ZrkEwcp
 YJt59JZOL1vIlFWwIp4Exx4cvqhPOsFzuKE2oOZ52rZapdExLgV95a3QNW3gycOX5mj2WLPVOFUBOK
 75sdGsAnPVi1GdJJmMvHDxD4E7ghG5KnX2Fhhx4dryKsGfffjS4IlYzwUgFw==
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

