Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD53C0A09
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338211; cv=none; b=b+/Xwqp4yfRgTQq7Is8sPZWbOOGVf/SXxMSmiPPQ5or4kyADhmypae8KyqAOXbtUBxEDvXzRpT7RBn7D1aBYmaxIOXWNy1ijkDTBi5aGtXFykN7p7scZOwyWNtxxHWgzauWB94z+i9lW7o0/1/k3isxo76mmCcezSH0MOCkzd6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338211; c=relaxed/simple;
	bh=rQ8xuB4J+WXT2wvFnJ5kvLB9bFovc7E+6VjB6kWfPUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9fsL6V0csTTzVBayDYU8lnSkTYMvs7/SAAXrGtZh1SDfdiKbluLfqwzyCRkvt2G5UHxttKWjbIj8ylQB3ItY80uKHXIPxXl7O+T9OPttxEwNKHeKYRRwTaEg1s17qy+0KoELefS5XNZG7Js3ISUTs97+QHcIfj2b22U9LrUPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmPTxTMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eX6gRyvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmPTxTMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eX6gRyvW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6eUaN1759486
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGh4DFUhGKlawy7UJhBeqNvVy0VePIVrbJI4z+eLSH4=; b=NmPTxTMHh3X8alD6
	KODam319DwAzJ+cR457IyyoUnlimdZZB/rQD6ZwjsoFbZ3PYc1kjI8A3coT5AKcm
	vVHMJpEUpIPBO1u7yQSKNW+MBoAlunV+cnQJmis18O41rHxJOYSVcThT0oekIfHK
	HsEdWX0edn1cu260y90dlTUMruMGsbBU0pjLB2ZeTX/cfH/6G4WK0AcouUzyDLme
	KxF73nPWQ57fQBJKvbxPXFrv92YjWJCVK7V0AbdOXDh/mJ7jkj/1VL/pkwZt3eQM
	xVWN0NSTVYSIaNnoQD7c0mOuDpZaj51m4v6Tt7sFFXVN4dV1KF0BSU4uQRyS5t6q
	AMlA4w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g80cjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85807671b1so808127a12.2
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338209; x=1781943009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGh4DFUhGKlawy7UJhBeqNvVy0VePIVrbJI4z+eLSH4=;
        b=eX6gRyvWHpDownEQdflrcbupFf+VBJ3r2Grpjjo6LxSCuWV0tFhwe9pFwSsaL/jUvC
         HKhrgRuiNeGpfDjsHRm29SRJIeLoRoGklsJsmlhNqyMTnM0B0lxDlub2+MA5x+w9iPIs
         20tn0WGp2ccj/psD/UrBeyHvD1hm04He6PLh6fLX1AA5b7L7YDtYzOlGcwhK/BeayXlI
         6ox0/ne0G+evkVAw8pwqQU9/DOOI76xGqsBhewTyjague7Oqvuy/shSYIB7c4FINsqWM
         SxwNu/l//tDL3SpjBNa529Hg051DwFjDjrAzCLngkvFGkuruuLibgXLzw5buxlLGuzvf
         TOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338209; x=1781943009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGh4DFUhGKlawy7UJhBeqNvVy0VePIVrbJI4z+eLSH4=;
        b=snCa5bqv0E/URrShqf2P2URyjScfWVgFW8nirEHyX9IBTyD/9V+jr+NiHLmT3ZHnZ2
         bTgFSt87byEu6MMBXLpt1Y0/MkNvxx1SSxfvqSPvf3pYbh/3KFVwQT5SS2QlzY1onNA+
         DAVdEinJs7xxJjoAmGOwq9ksBEoP/eYJCtHMtkg7GmzGKUboWxgl+ADCz9/PhT2JvdYi
         Fixg/Q7B+aGIqX6msvJYEmpvRjlmqk6RDHgliH0YhX0ZJfdlUUs0P7rm0oxuTTNFn9Ju
         +quB7hFqRKber/OA1wAHefyHiQAGNVwV0Th80duzIMU5LoHrRhq1WOaEJb3QmEuJSg4c
         jLuA==
X-Forwarded-Encrypted: i=1; AFNElJ+vU7s6bAajjsOMPsHVigyBYp7zXglqQ5JhZtFr3Q6+wWWzC0lGLN8s3Z602ld/t6wx5cuPQowV4AAT@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtY6XcZEvKT+I1QuanHj+P3kQt1kHiZefQIaLsCDtI5SJrgkR
	dXY7i0TRN6TSBhLCZEYkmjdyoi/aA9tMiSlL05LIFrDeFFthtv8yOEjH0ucs2ukZ2YkyHUqH60J
	H1Yas6N6sG/dYt3zEDBndpW2ioeInM/5AS7cPmrLmRFmPRWImhY2lPPT8d4VPNlpg
X-Gm-Gg: Acq92OGc81B1SP+Gxft3W8YmD1vW8+CRdhxzswXmC006CmLYUIZkwo1UZiTznFWgN7b
	w7znGZUVLcY12+LXCoFFrI6q52zskWftesn/PCqY3ErkzdOFbPlFFKdwl1VgLp++yw8CYP9e0Ee
	4j6l0CbvIhHoWgrQPwxThW5JWYYhrII3bom7lEzf/4sNGovpL4boCmYoC/r5L9jRKihtuqZ2ygx
	AqAYnBPKvCQxHx90jp69PtzSL6SfCZoaTPpsk90POiv3v3F3yqnlndfMOcE1AFJa1O7i+LDTb8q
	fld5d4fW/kMQD/PoMsMyp6lcv3cnbvY6pPzrLkvewOoAoxhHUOf59xGq5l+B6LMFoVA+CywaOGs
	1tBbVJEuN5b1Qnv7cFSl3VD+ekHGlruiXU/Y0mWOo
X-Received: by 2002:a05:6a00:1306:b0:843:472b:dba9 with SMTP id d2e1a72fcca58-8434d10739cmr6482606b3a.45.1781338208811;
        Sat, 13 Jun 2026 01:10:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1306:b0:843:472b:dba9 with SMTP id d2e1a72fcca58-8434d10739cmr6482585b3a.45.1781338208360;
        Sat, 13 Jun 2026 01:10:08 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:10:07 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:23 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: Add PMIC thermal support for Shikra
 CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
In-Reply-To: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=5414;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=rQ8xuB4J+WXT2wvFnJ5kvLB9bFovc7E+6VjB6kWfPUo=;
 b=gqXIOm78flkk7c+DAvGdgGQd2ic3p/zYUEkHP4CIr99djlDKIrjEqzgYBtzh+8fWVIsRaO95f
 bb2lAFtRmzGCobtx+4rLDoLEdAPAjVBjY83rqBgqcXx6Bk8BqHPq+Hq
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2d1061 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2i55RyfvCxH4uMM4-2wA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: faUxoV5OnPHZ9r5NzZRsyffvEoxJ5zvt
X-Proofpoint-ORIG-GUID: faUxoV5OnPHZ9r5NzZRsyffvEoxJ5zvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX4NUX8B8q7wXp
 /XlKhnIB8KMtfcMY6hIkg4P5HQhnbkyS3Tl0BKnxnMgRulTT8uWirHLIa/uv+tPmf5LQRWzxunn
 SdC4OlBCd9tyCZ1PlCuE0BBX/KtfOZcVAD2/YrViV0TJ3C9bAeV22FeyuJXbHrlDL5NNea4vkg8
 SCx+NFO+fG4Lj0eDW7cDyrUj166MXStdprJXoOeCwm1Nwitbj1iexpVNm/0nN9UHSDCjLsqdl4P
 ZXTSeppWJxrauzzt9WzNXIpowS1dDB0regqLpYRAQDPPPbPAxGNgXAevJOKHX99SwTLyOpR4tGK
 kJZ6wBoQXNXal6sds+/WQvzP3Prax5/xCv4ZF3eCCLaCYtGh9gOwDeZCrYunL45epNL5tUkVUdY
 Crz9iKSutBeKTORm3JQV+eF2zcCSbFSZGz9Ra8XWF/hkUQII9CgtLnFj8L3rYXS2xXynhae8OHZ
 l/YDj3tmHqA5PnBgjCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfXxSEXQ6INFPBC
 lVBVNWRUsde8COzFxPp+RirgTXG6ncWA0oTeTdkRy9TpTbNokt/24swOzsSK4FpBoKFTxkIWj2d
 ZrjQBSw3I5qqvv6b0XsbVUru4/N3QvQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC thermal bridge nodes for pa/quiet/msm thermistors. Enable temperature
alarm nodes for PM4125 and PM8005. Add thermal zones for temp-alarm devices
and system thermistors exposed as thermal bridge nodes.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..c6c09d773abe 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,184 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	pm4125_msm_therm_bridge: pm4125-msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pm4125_pa_therm_bridge: pm4125-pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pm4125_quiet_therm_bridge: pm4125-quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pm8005-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_pa_therm_bridge>;
+
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
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_quiet_therm_bridge>;
+
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
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;
@@ -45,10 +221,18 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_tz {
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
 
+&pm8005_tz {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";

-- 
2.43.0

