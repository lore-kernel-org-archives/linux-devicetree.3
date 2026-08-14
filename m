Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B163A874A
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701119; cv=none; b=ICn4hK9fywBsiQBsr0Z0+dPeCq5f8QzjyDwfzMGMmOyxGYsw08ow8bvSdg8ghWYj82SPUNFVXcJZX8roVx1madUJsv0K09HsV/tg83WGyIEs3UavNK+lA4NjtgonT865kJcg8ksO/h2vBxOBXf30uWQzH6wZ0sGygesDQgXNC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701119; c=relaxed/simple;
	bh=//5pNOjXgtYQ26hA6DUWIhqpNmW68K+b9y52OeKDUTk=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=Nysn6MZ1Bu8tjNvfJI7p9o+TPxcgncY02xcHgKuDuaeFhJ/Hx0PLLBKqsJMn6CG5Luy0mDVjAtV9gvf4g+07E+BFricAEt4BWrk7/v6uPl2aoh1P5wgmuFSK9h8Ueq4PaEVb0X4mDlEoyVQDHPhtiGb5KzYJvTDCGTtPn/iB4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CM/VYcAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilGGyzK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CM/VYcAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilGGyzK8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fhNO736450
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WiT1xh0A4XEEI1iIxBZPnF
	kkOipaWzRSL1LifVnTfUQ=; b=CM/VYcASlVuB3vTt/tWdxrpZJ3U84+Juf8vCy+
	e72MPL1cW33ECH/RhB3fXbtIHwXBJzXNETvgWAQh14Yap6e0RgIyPRA6AcZoah77
	nYDjoufi+4DX065cf16+pqVXGkmBiSxfmR2k5jJ68e3zXLDeWveF3g2sCNmM1RMh
	Aikwrb37fODl3jOmhBFFaeH5t2KqkYr8yV6Q2R8hgupE/8Bh4NjvE4WbIr95riRx
	Ss8oMmeU7bFcu4Wo7s2qkds0QIyL4S2V7AuhWt5sKjeoj7wf/Zw3WOWUPVgyncxV
	VI2cM9jod6QkzdCBr4wiw4f1wY3BqrtMxdAy974NQg8ruHNw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f3ft6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:51:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1261763a91.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701113; x=1787305913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiT1xh0A4XEEI1iIxBZPnFkkOipaWzRSL1LifVnTfUQ=;
        b=ilGGyzK8bJSJaCcmaDb4IQg8Yw40wI0Sr6JyRqI6MhfAKFjYXxlDPuVNVCgqCWru9Q
         NzXEB3GBjWXTWlCP+uFOpfRQpYPYPTPJ8OPWF/9dg1LgriuGKwVLvdg7YxHRTEWFogIX
         W9rF+Ts6lhKHl1jocTmFm4OcXpsSvOzMoNc8cEhgkdj3SyX6PP6Wyz2fIV8aZUXvwseP
         liKLyxNEVXUmwySI+SzkGg5QBFm6/2QD0SlbhxvoAxW540QVQCwKJBF4y3BxI9Yl4Azt
         T0yQcgRJhiKESehxO9F8IQBcKYpZGvb2wXMMDuTX4Q5TBmu9GMw1BO5fRR7DMReEbrNZ
         w9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701113; x=1787305913;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WiT1xh0A4XEEI1iIxBZPnFkkOipaWzRSL1LifVnTfUQ=;
        b=IETmUxWttSXi+Gl6C5lJs4uuMee4QVwN6QxxuBIOnkAiqe4kNzqU+qF/+UNvMlQySj
         gFvL554Q9p6lU92mNFuQiW/jvTjQDf7CUgK9ICbkqX2O/QzuyY23GaGfIVT6UlJKdCTd
         31Q/87XPbX63/x9HdMnadW7G/bwfURbWTutd9F0AOLmHhxo5DkrXwSUXdNiwDbjy80bg
         K3B+tSl875Lj3uj7r92fEODgi6cKdMBfnGUYkhkWvzR88qnYhM2imof4U3gGcZZmxVPD
         UsEuPWLF2FfO3LnyNHSuuwUT4mJHRU6b/ZszqrJHPXmzuh0p1iXoLBrCpaMRGrwmBZ0h
         krvg==
X-Forwarded-Encrypted: i=1; AHgh+RpvS0Mc7M1Dpqa28YEhrAPG+6R64o9Fa9GZUloKyW5TCT3Jwd+z3KuqB8fqaIKu9y/FWbvu2vlG4o52@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zBKI2vGMWZLDVnqLM7xgQ18HUmcQeg0jT2TV41FDWuyM3Qaz
	g664nrs/fqwLBQMncv7UHnWIgaKFwjKIlmaTMXdgmTLYpygu960aU1o7CZBYQImMflZ1aO8IXTP
	vmTn42H2TbFxa5jGILBWKWTwzoKNhM+oT0ObCBb7x772QFJITpP1Vsb0x5rODzIWO
X-Gm-Gg: AR+sD11TuLMnonWe562rEMq+9r5UJyISjzTAwfja5PT57qgEh0QooYb0hXKem7C30Yt
	Qx30lhlHvSY/ZslzOkUPn1xzyA+7HHYRHTxXc8AYkdL1Y9weQSSRQWXAmus9VYdhCQR07gBj9NJ
	r/YyAZccN81i7SkdCK7SxXAHY1d0lSPs05TLzorrprRkfQpqlJkYkiaGk26UO2rsciVeHnfoz8Y
	SFKJE0vVdj6/TTxlGtiFQVDJJIk7Rpu8oRZRCzkFu2nk+8+tc9g+45qzjVR/CpTvsT3c07EcvBE
	tpwNyPJiesFe9JYZySX8Z0Se5VXy0GcG/C8CjytONCDQY9G23/Z3/XG6w2B6dYWGnv4WAIrjhOx
	DKpVTpSE60Mg/CQkDYNaR9neaEkGVbiYI
X-Received: by 2002:a17:90a:dfcd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3933b503abcmr5060804a91.0.1786701113098;
        Fri, 14 Aug 2026 02:51:53 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3933b503abcmr5060759a91.0.1786701112597;
        Fri, 14 Aug 2026 02:51:52 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea995222sm2073160a91.6.2026.08.14.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:51:52 -0700 (PDT)
Message-ID: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:21:25 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: lemans-pmics: Enable PMIC MBG
 thermal monitor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7ee539 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R0EjHnQZn9ylPLZPdjIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Wxfs1nxIkIaTt5TrC3aWzmUA5sy8KIaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfX7gr8a/8VGqlQ
 OYQDM13czw5RJ+2fuyXl8IDdlgVyTQPEIqiXKyZK4hMdL0qGVQFQd1qB490valErBgdR+0wEYWr
 1+t/H2KWoOojcQFZppKB2KCoGEXYncoN4hrYUT8bCoBFlzsGk1OrrqEpcS0Pjo9e4gMiNRJ/ybH
 TMVw9Vt/3bXA69jxCp1HaBfdAashQUyUUykD3ZR3TP3Q+mT89EkiMUU04Ej/dqz8b5dMiukyb5x
 1JT2MFJfWj379e6Dj8rokVJ2iIxZgjmqlZEcIFg1GbXhQgebao4LFIpiyMFiuCyq31C2RgMh5P9
 roiIr5i5w4YNNKe6oogjUZZEXNnSOakcQzeUM+9Yp6YySFAwsQBu620hVVb+2eYnYW10DgjWH1z
 sAOOuQ5RFqOfTGyopZ3YxuhVnfO/fo13KBbFeklD1ZnNZogCoBNVxr9tzl3HRsqECJ/91L2oCiK
 xH/SYF3CqGsvEtj58tQ==
X-Proofpoint-ORIG-GUID: Wxfs1nxIkIaTt5TrC3aWzmUA5sy8KIaX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfX/P3wcxvPplRV
 VUslIIVoOhjfPgqrnc2+zDpoy1hPtx8T2ekr0ilUBXeiwFR2MUJ8R9+YRjqmibRv8bWSHIzc716
 DISeS00qlOLSYtigC1xqvNOa0MlE0TE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140075

Lemans boards use PM8654AU PMIC instances that expose MBG thermal monitor
blocks handled by the existing qcom-spmi-mbg-tm driver.

Add MBG temperature-sensor nodes for the PMIC instances and wire them into
dedicated thermal zones with passive trips, so PMIC die temperature
monitoring is available through the thermal framework.

Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 116 +++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 500f715931aa..4c853053be85 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -88,6 +88,58 @@ trip1 {
 				};
 			};
 		};
+
+		pm8775-mbg0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8654au_0_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pm8775-mbg1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8654au_1_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pm8775-mbg2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8654au_2_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pm8775-mbg3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8654au_3_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 
 	reboot-mode {
@@ -189,6 +241,22 @@ reboot_reason: reboot-reason@48 {
 		};
 	};
 
+	pmm8654au_sail_0: pmic@1 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8654au_0_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
 	pmm8654au_1: pmic@2 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
 		reg = <0x2 SPMI_USID>;
@@ -236,6 +304,22 @@ pmm8654au_1_gpios: gpio@8800 {
 		};
 	};
 
+	pmm8654au_sail_1: pmic@3 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8654au_1_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8654au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x3 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
 	pmm8654au_2: pmic@4 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
 		reg = <0x4 SPMI_USID>;
@@ -283,6 +367,22 @@ pmm8654au_2_gpios: gpio@8800 {
 		};
 	};
 
+	pmm8654au_sail_2: pmic@5 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8654au_2_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8654au_2_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x5 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
 	pmm8654au_3: pmic@6 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
 		reg = <0x6 SPMI_USID>;
@@ -329,4 +429,20 @@ pmm8654au_3_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	pmm8654au_sail_3: pmic@7 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8654au_3_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8654au_3_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x7 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
 };

-- 
2.34.1

