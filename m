Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067CA311C15
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424347; cv=none; b=NZcmob41hAtG1e9LAWJF6RU1W0GqSTFYK8+CqBW4u6aXE4thzHGEUPGXACkw5j1TqXK6Pj4o+JCvDCXJSv2p/BDnePxKMKT1K9Mwzl+IMDVB/CLc5ms/JzpJZFyzQDqFx5OcjxcT0ev9U9QiH0RXRbY0aZGvGX28BUkXz7vFDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424347; c=relaxed/simple;
	bh=5BYm3y6m4USF4Pb7mcNn2U9eJ4f6+cVQmd9I5zMj1kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmAVCUCSYJmTo/fH/jzVvNqffznPocQ8mB+B4q9ZDk5XAhHJ8IZ8+YHJmpPDj7t1zut9EDrg7U8gV1y80zXiMbvZ+QfXXBXYDcad1+FXGAxucSr5y+tcvyc1uxtHORrSYiXE8KeYCvXNeey1s7SQhvyiKhwMDTijGRhwIbMQOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyRbH+aX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzjQK+kt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyRbH+aX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzjQK+kt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E48aKV045448
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+uKJsbgWZFTB8SDypIdJZhB6Q+/orfms/lo6g22tKU=; b=FyRbH+aXgK9rF1JS
	R3BMR3ll55NKwyGPHsRVaqz1xTdHXynWhVABXBIlP14pys7UJN7MNX8D8Xe7bwgj
	6+Nb9NyQcC4rarkKaOVm3UM77U4Wtmp41tN1I5NAZOScvTAhRguXvQdf8bsjuNc+
	zfoMiYOn4abnY1ZDLvAWm1eDvPGHMufc9KBtGKJsQXQtDieWr51dFvApunpq23pr
	2PP878tofTk/obpc8151i1GKZqWfbXvs+Icoes9SmJJqTNybqjkBQiEo5iFyZccD
	1qjxSfLIOnpZJ9SGo+scv2gyLTWyNnoEorihJfRV8a8uEgVL+OJIDFgmf2L05LyW
	sju3IA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybty4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso62815115ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424345; x=1782029145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+uKJsbgWZFTB8SDypIdJZhB6Q+/orfms/lo6g22tKU=;
        b=dzjQK+ktY3YVe+9Kjm6A0jLQUTz6U3LS29a5PELGlbz4l8+QgwD3qOkJB0l3YeM9Nn
         SKt1vNRvvGnlCu474Q8rOBRneykPeLQyAcpBM5d3xOXqFL9ngKdkH+I3aNdktK1Qy0S8
         wP6cCMHA+Z+Q8Sf42Wim0o+K9P/0+exoAcsF5sWNz++X+VJg/nUOfXlhq3gQZjRu+OOb
         kb984zOffH4w584sqB9ZJ6I1zqGJQXJikSfJBHnDqnvTKzz6u9sCjDAalt/Edwx2b03w
         kWOa2gw1IC5YeqpC35MUQrwJY5e+lthhMp7T1sLFmfueW84yDeakqCANpAHGuhvwY2Ee
         cvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424345; x=1782029145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+uKJsbgWZFTB8SDypIdJZhB6Q+/orfms/lo6g22tKU=;
        b=SaG1GN8PNIsllVYaHKHZqYbyjTDJ7D7gfB7obHCsoUs22ijGvNCswSzRvQ0gAfhumy
         oLaFF+BioZwaNUPCirJ8F35ColYvTiAPrxpzzEnHUUMe442STyYaUVs2BEqQ6tPu/AVL
         T+ehEPYrH+Aii+mq/ycko2/kjSVhmHHuRtNqyD8UdK2PkUmksm7srPGFw6UD8Of1LvcK
         xj6mA40opRBHyr8ink1HYvYIj4TQAevleJIZeHJ6+aFUckiXBmdfAfvoZaBmQ3Xfv3Ug
         mZGml78zUAC9nXGY4HdUFuIOukhNfo02YXplyS6nUwf6taYR6Ou1CelaMJw5SXnWAjWT
         48mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b2TFbL7wPvHJ1B54pcz5pBgaXk8YNMQ/XVJs17rsIrtW9Izlo57FSlxfrOlLL0O4U21v2RQtZb5am@vger.kernel.org
X-Gm-Message-State: AOJu0YwpnPlghBN/zPApIBE/aBB7wUgHhAKhFBtyR3RuHQc7MCOrQ7yu
	FjcUhafXxptRda8d7qhI9VufmsPAalE7ndXuIPV5CFb62W7e2E8mjDe/wc1y3bRECKc08p0MTJk
	ADKTbwTsoBJzeU51oIDSNW2uZVBQCyVstoWNrxkIn9ZWiuQse6feAcEpDORIehdvld/xFCQVo
X-Gm-Gg: Acq92OEJ+4TWhJhge4uIf4SaV2IkT6Y9JBe6fe5k4jNVYZekYSnb0WHylmOZTtNGqFn
	hVDiIwcOnC2dLRVkoNyoGz1LhYQb0n78Iv8R0ErhRcReAAlwj9Mz4rniMnUsIf//c64B4/k62J9
	pwTRIJDmKUvY1de8cU9DYSD8OfktmOjw2aIw4EMgW/jICcLzOmCqX43zUpiUjkhPywUgliSBW3q
	UC0Gza138gLUqNOq+PpygOBpjd3tVJTBBUOMZIzbCIQ7q5XWVWSwExc8UmQK91LixMOKvunOX/B
	I3Y9ccTA9UgeGs811sldSIGgzjQuBNZeG6sMcTAyBY+Pm/IZl8j1Rkbl5BlMSClVjc37N0109/V
	g4IhpGkiCCWEs6RO0G+jNxfCBe76+khuRU9/mM12/
X-Received: by 2002:a17:902:cf4b:b0:2c0:c262:b91f with SMTP id d9443c01a7336-2c4109ed6cemr110344025ad.8.1781424344479;
        Sun, 14 Jun 2026 01:05:44 -0700 (PDT)
X-Received: by 2002:a17:902:cf4b:b0:2c0:c262:b91f with SMTP id d9443c01a7336-2c4109ed6cemr110343775ad.8.1781424344060;
        Sun, 14 Jun 2026 01:05:44 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:43 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:11 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=9555;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Os4byVg9k/u5AL4IttQusDpFVsFGFMPWWLUebVsWPsQ=;
 b=C7xhWEHm69os9GD0vuyJJ3jL5VKuHJpbgCYO9Qt39t2m/tN4zc8ildkI42DGIcK81YPzgG3Ra
 /H1sQN8QOgIDZGVd27A3SkE7vWuMYEPA7VYnfgVf/Mr0OfRpElNnRPN
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: -CSxwfwmkOufYdVdURnx9P0rZsRy3KL3
X-Proofpoint-ORIG-GUID: -CSxwfwmkOufYdVdURnx9P0rZsRy3KL3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfXw53Kx9qQQKHR
 8otBNBArfwrsGmcC6dN0Fg+2nOO4cb+dPpRbyXOxalwSuhyQWLojHbqVigtjx+E/Kj5Dcw4Qpp0
 WWhVbUKoWteRSRf/WR55pkPRRR5Rdhk=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2e60d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=izxvgA0RxB-DvlahdVkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX6aTX09S+1+r0
 fue3ghYtKfin2YjLVIJiSGkhzD4sbh7t9iXNkjOxma5M4Zz0aAe6mfXw9p34uyBd4gAZdYl18k8
 9lQvfDWOkLeAZl7V+U8K7YopkVlfz7Lva+vrFAVLZmx4nBKdvcnuxBZPJdVzvg4nrjB/jDRgUe3
 a6eFqFARdegnNJDINgnLQV+G+WVBcxLxKWvXHmAOkALdW1V6jD8waYQk5W7DxgS3ErHqYeyfOH3
 iXkcaur46Dc7nXQo2b7xfXGKRcPj1rbzdvgO2vEyvZ6RXDTiAUpR24vyT8nUz4AqG+AAIRj1Ep+
 tQgp8eu1J0yi6zonD89ytWAfeRjuBja/WBevBKYkPycxcJDhaadQ4ZKC2OL3HANgFnUVdVIjXl2
 4EUS9NYyqT2uUHzK3nHGEJYXu3mzRErLc0ZXjzxQPqdjhb0E+sRhfkCX2nV5hAp+KWpfO0GGmt3
 sWJ913pRFHWeXqDFp7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140079

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC node and define channels for:
- Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
- PM8550: Die temperature, VPH power, and system thermistors.

Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
correspond to the off-PMIC system thermistors connected via
PM8550 AMUX/GPIO lines.

Also,add io-channels and io-channel-names properties to the
temp_alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 250 ++++++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..2e746ede850f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -6,7 +6,9 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -189,6 +191,90 @@ trip1 {
 				};
 			};
 		};
+
+		sys-0-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-1-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-4-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-5-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-6-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 };
 
@@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
 
 			status = "disabled";
 		};
+
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#io-channel-cells = <1>;
+			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
+			pinctrl-names = "default";
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@103 {
+				reg = <ADC5_GEN3_DIE_TEMP(1)>;
+				label = "pm8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@18e {
+				reg = <ADC5_GEN3_VPH_PWR(1)>;
+				label = "pm8550_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@14a {
+				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_01";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@14b {
+				reg = <ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_02";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@144 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+				label = "pm8550_therm_2";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@145 {
+				reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+				label = "pm8550_therm_3";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@146 {
+				reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+				label = "pm8550_therm_4";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@147 {
+				reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+				label = "pm8550_therm_5";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@148 {
+				reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+				label = "pm8550_therm_6";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pm8550ve_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@303 {
+				reg = <ADC5_GEN3_DIE_TEMP(3)>;
+				label = "pmc8380_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmc8380_4_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@503 {
+				reg = <ADC5_GEN3_DIE_TEMP(5)>;
+				label = "pmc8380_5_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmc8380_6_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@803 {
+				reg = <ADC5_GEN3_DIE_TEMP(8)>;
+				label = "pm8550ve_8_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@903 {
+				reg = <ADC5_GEN3_DIE_TEMP(9)>;
+				label = "pm8550ve_9_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
 	};
 
 	/* PMC8380C */
@@ -291,6 +513,8 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550_gpios: gpio@8800 {
@@ -301,6 +525,18 @@ pm8550_gpios: gpio@8800 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			sys_therm_0_gpio3: sys-therm_0-gpio3-state {
+				pins = "gpio3";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
+
+			sys_therm_1_gpio4: sys-therm-1-gpio4-state {
+				pins = "gpio4";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
 		};
 
 		pm8550_flash: led-controller@ee00 {
@@ -329,6 +565,8 @@ pm8550ve_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_2_gpios: gpio@8800 {
@@ -354,6 +592,8 @@ pmc8380_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_3_gpios: gpio@8800 {
@@ -378,6 +618,8 @@ pmc8380_4_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_4_gpios: gpio@8800 {
@@ -402,6 +644,8 @@ pmc8380_5_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(5)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_5_gpios: gpio@8800 {
@@ -426,6 +670,8 @@ pmc8380_6_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_6_gpios: gpio@8800 {
@@ -451,6 +697,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_8_gpios: gpio@8800 {
@@ -476,6 +724,8 @@ pm8550ve_9_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(9)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_9_gpios: gpio@8800 {

-- 
2.43.0

