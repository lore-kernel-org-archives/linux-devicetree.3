Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97C43F088
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582968; cv=none; b=hJGZgZxWuhFufNrI8BrHicfhb/XJNgPgD1f6d0J4MpEqtOqLvwDimaXwr6me+9iL9l9GSRFvFd/qqFxA6hAnEq3jR4f/jkJOZ2otykW2WLWJ0r1724nabvvtxUs7gSTy6hcAX3ihIpcL8N6KSKqJfnZAXRRW4JxVOMx1aWS6N9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582968; c=relaxed/simple;
	bh=M3hWtkSQwDzoGMH7gxDF7Ea1GQo2jLOyFAcLh9g8LNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VswKu0E8zrkFAolf4LhbQb72KnDlrAVGP+LLmKs8gI+q3EsN/kdOiLGkh2TJnL2Esmyach9YKFgSEE2jDurD9DApwf6IZrB+YtIQ7XqxD6WR86qA/Hn6kygcRAQR644zHxGXNIOpW1kKE/y/1Jep0Ew7JaH3mYUjYK1Kq96F+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFo2PvTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJKBWM/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFo2PvTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJKBWM/y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv2kn3402773
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mnYmeiFImKC+h9r32ZdcGN
	VJHEuap9+QyemBxgLkgyc=; b=pFo2PvTYjlfW5VXzKWdSk5LrFgCv5ufRTt5/J3
	ZEzliDiOJgNQpyDGLXecDqTfZofc/HKJBNmnCCB/CTZYB/pNl5z+0CJMXexy+cGW
	VTLRVMlI3wePuDv2Rgifr6VByHu8xNcx2bcUYuWQX+UBfYEmgwfhFaLJy9ImNLdn
	nIP7FI6U/bL7s2z4QuT4p8rrPUQSUKnTMB6otEPsnNZe3CoKz52TSn5bplr4Tf/O
	DQurBfoFW+QjmLBMGNLiv3LYFZpr4N5pZTMMe/gmx6Qhkmvp7QiCZrUuTKlHM0u/
	ixuCi/DAu2r2ADkTPVmAvIkcgHhoOPmTDdxf5B20S64/frUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgsty9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:49:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so75890585ad.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787582964; x=1788187764; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mnYmeiFImKC+h9r32ZdcGNVJHEuap9+QyemBxgLkgyc=;
        b=XJKBWM/y/wepY5TxXArTm/1YIii5AWOg5gk7/6hJ85eanshCdSMJniRTAtk0TdPhFZ
         u0Wv/KsD4QTp2g9PTI3rH8CVAgjUjxOCgyFGjjzmGmGGl/ElCoVd1Wb/mBRFuveR9Gq4
         rFnaB1/7l48+0exLPKKaMh4TNy3WT0N1vf+mt2Gl4I0fLfJQqCM2he3cF6EaZXnTXh5N
         l5VsfyBE2kjoJYZZ1w+A1GGJ9K3e5v35WdWc8GMAMk7w3JfqRsypFFaLI5gHMKj+guJr
         HrBNYd+ryw5QlGzihHzJz759OuYv9mwntE6iIgAbObkUdvs3i8gHGE0/FrMPsO7p4tqa
         hfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582964; x=1788187764;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mnYmeiFImKC+h9r32ZdcGNVJHEuap9+QyemBxgLkgyc=;
        b=T/W+/VJwnfVwWFZLFQS8iCxw1vqJGdQpkOdFbD8DKticUU3mvYLsXfXilEKmrZQoAb
         GfxfjJEhhiZx+PenFY7eAcDQLn0nN6oBTSdGYEKmSlC3iSXFzf1mMpcEvcGST9+SmVXp
         xw38nF2CoOJLflMUBLZbpFEHRh3kIVbuRCxAZbZzvP4BS3fgse7A64CWJLcJPlxwz5uA
         x2CoCEdITlmy7KAuQH7+CjBAplRbF7zBuC2JNwUAkBP+6a7tepa9r2+f7L9osD2qfXkf
         F/52jmDaCghRORIeZRrqguDfSYNOaDV0CKiiCD337EYiwfL3yrvFCbcAj5Jz59sDUF1k
         tW0g==
X-Forwarded-Encrypted: i=1; AHgh+Rpp3Jz5jSQLmbC47py/LQ2qdhr177feb7UqzmOm4vbs6e7vhMH+Q5g7xo7ExnDJuF+Wb0E16yo+YEse@vger.kernel.org
X-Gm-Message-State: AFuF++lOM0DCetfURtmfm02gr1ajRrMedL0pbNoHxWkhbtXZ3q4zi9Ex
	VspbTLvs3oMn7ydy6rFSERu67oljrcw0SEVtS0bWU64nMmMFblU+OEfxw9FLjV1EOMA80+0hbQD
	Tf68wNhAG9aXteLIcGEYb5K5gypWtSDdipVnxEADDDKDHJLYQZXEdASdNztfyC8hF
X-Gm-Gg: AR+sD11A7XVfydLmjtV2EeYaL/m2RikAq+u8fux9SEV1SCRcykvFyQulXjyzILBwMoG
	dtepsYbszgX/PO0b9iFj6HZ5P735FQXYUMhK44hvcLlRaaOJORWzKK9y6poOBMbd8S0Kqf4KYA6
	Oekr+hxRNmP+vI091Nw6OtnyulvPVsp/6U2n4CVUqnFSbY+5uLJhGQxa/md1Z+Y1HqclvUQTEgE
	3NJvsfff0bTIE6dz62F548F7qHiWjVr4d71vG8W9pEsV7ayB2A7pweaIucZBFboEpUGPlpjKo40
	QYvKPXRfN1g+2wPdQxLLQ47X57MibHNplyDt/HUZj3m1f5VlL5OvwjWgfBq3VrVJLMJgyqvpwsG
	59hzBgeyRg2b3hvBQwhnOfm2yIw==
X-Received: by 2002:a17:903:1585:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d670bf23e4mr333130485ad.7.1787582964313;
        Mon, 24 Aug 2026 07:49:24 -0700 (PDT)
X-Received: by 2002:a17:903:1585:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d670bf23e4mr333129645ad.7.1787582963926;
        Mon, 24 Aug 2026 07:49:23 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b8427sm18863965ad.55.2026.08.24.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:49:23 -0700 (PDT)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 20:19:13 +0530
Subject: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOhZjGoC/yWOy4rDMAwAfyX4vCp+JXZz6n8spci2vDFbN6mdl
 IXSf1+3uQhGoNE8WaWSqLKxe7JCj1TTfGsgvjrmJ7z9EKTQmEkuB26FhCVrIXvA4GGdqGS8gvY
 8GqGMMhFZO1wKxfT3kX6fdy5035p73ZfMYSXwc85pHTsVuI3R9KgNKjIk0ekelfPoBiOV0+HIB
 y3lW52pVvxEjd2exI9Qp/Rb8NKSLnVblrms8OiBg4uDtTII6zCc5loP9w2v76+HNtj59foHrGn
 NRP4AAAA=
X-Change-ID: 20260812-pm4125-adc-thermal-4c0f713737fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787582960; l=3501;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=M3hWtkSQwDzoGMH7gxDF7Ea1GQo2jLOyFAcLh9g8LNE=;
 b=IZz5LeUOsAkknQPYWWTPuRubODVFHeyl6Uuix2OGyjJuivT1lGFPpESLdh/vh8SXSEBzd9lib
 RF+Zhw0so3cATQgN1rdMaUiqaHB09y7uAqSYPkIEZw0V+seKVhPH94L
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNCBTYWx0ZWRfXzOzCUFQz5Qid
 6QaAKg7TVWqtm6kKc8/+wvcQHumwJ3J/BTRiMTv7ENGIspDMJCxp+laTWhq+yLvZI7qZ7x/9dnl
 iSrrZgO5EJHmFVA6noqUwEUMHWkiM24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNCBTYWx0ZWRfX+dQRe19Vwiky
 0bZoJWZpw92cbxe5Osz5lYY6neI6u80lLaWaSQVkmqpJz3s/p4GcIkqhFZgP8qoJ+bjqp5iKMX3
 a5Hmms+d+xOI244ftyFRSkuTKNpKCm0AEimCa4uyF/WRrH68UO4eZhAUZUMWRZprvp0fNjuoQY1
 pq7q6v9/IjTjh+5YN2adVSXik+B8UIutDuB0q/b6Rqbmbo2S/KfmpzkyFqt2D8I43brtzWOOtff
 2xD+1SIYHRspo4etoPz6OIhe8VlwVCFfaypYwwHIi4fvR9+N0RVevyNIqrVLPDHaYaElKGYaEb+
 y37B8RloVODZW+EKBX+ItkeVIXfHdOrKSUX5jAN+33iGJ7J8nBvsYp4cHZUFMNF0mF5Hy5rfBkN
 DbdIP4LuYwic4fnOSxYDMQLXtq0/aOXCS9deGat3mZoCcM46YRka/Lz90HL9M0RLJeYSwkclm1v
 mrxaUxLXiGVDn9ghplQ==
X-Proofpoint-ORIG-GUID: k69hii0baDe0fXYHlEHHywqCd-TlwAMH
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c59f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s2S2f7peMjUm9DWXigYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: k69hii0baDe0fXYHlEHHywqCd-TlwAMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240124

Add ADC channels for msm, quiet and xo thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 91 ++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..c4038c1f1e88 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include "agatti.dtsi"
 #include "pm4125.dtsi"
 
@@ -33,6 +34,68 @@ clk40m: can-clk {
 		};
 	};
 
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	xo_therm_bridge: xo-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&xo_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -333,6 +396,34 @@ vreg_l7p: ldo7 {
 	};
 };
 
+&pm4125_adc {
+	status = "okay";
+
+	channel@4c {
+		reg = <ADC5_XO_THERM_100K_PU>;
+		label = "xo_therm";
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
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260812-pm4125-adc-thermal-4c0f713737fa
prerequisite-message-id: 20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com
prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
prerequisite-patch-id: 391360a3fcb2c44648ec62930e3af61d4eb12001
prerequisite-patch-id: a1c862130f572ca027bc9c482dede8da183e51b1

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

