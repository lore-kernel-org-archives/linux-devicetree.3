Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2493DDDA6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996337; cv=none; b=uLNu7/f8ccvx9ORzSIy1GXtdLw8tkGAXp0FZT1JpCmH16pJBzuvlhi6QNy6iGxAu1+LNlWfPaknOT1cwvV5mLWUsbBkOJeXV4vtGQJ0s3jEL4qlgNrAlFH+DdyrqAXd0mpu3+CsunPG+L95wcSDD0W23O/cZCgaRCeo1VTVfcdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996337; c=relaxed/simple;
	bh=VnL/S3vPgmayRLFDfwITKnGQpEOa78OA1ybDeKmfK9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hKEl+NMdJnuvpI4a02pu9g68j/mRhExFvP2AF5dBY3Y50UuAwufMDu+1x9hpmd5c13jqA1T3e1w2k1s3rPXhF+sUqywuQg6zj1OcDHdcCUwl0diLSL9MQkBkGN2oZnIJ+i1runYZI6hCvgaUOFRUprpDBwuAbNIK5uFTjwj8V2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEGQVBro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyO/UCY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEGQVBro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyO/UCY1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rf2U1568403
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TlfhGqGgTKnIq2yjfl/V9swsRpNHZ9GFfY9
	HXAYAWbQ=; b=cEGQVBroHvmTXeBtJpyG3QcBJLbPeI+zJGlJ33GGmICLIzLBGoI
	H9zGtd3wkDevDPU/DNkyL+JwGzl/fIeVAS8OvtQVXqif5Gws05oT7E9/7V4bgX52
	rk4Xb2ZpsTFKPZL1+o4wMOSTFbYlS810fU7MnQ74cYbz72dkGSqDIwLMb9o6mAjp
	QcMGQjWMTHKRVO6F6dQ6AhLKCu7FZeqlJAD4mzcceUhFzIlXT4JsNKga/cR2rt6Z
	nVpOr5/x9B7Bu6r47tGJOMFR8pkQs5bVHuthEDCoqdaVRPmOFT6UcZW5k3XN8hI+
	PM4aJPcd4jpJ4gvlSiHXj5yAZkpTfjFFQqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx46e28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:12:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517c65e497eso19787951cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996335; x=1781601135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TlfhGqGgTKnIq2yjfl/V9swsRpNHZ9GFfY9HXAYAWbQ=;
        b=LyO/UCY1wpgDRA7e0Wx37M1VN9a0jshh+diQjR0zpFIBG5frlgpj6SRs+zYfXeysly
         +LgqZO0+KjFClBUvqQGxHEihS9j+Zunds6FpTcdV5yxgT9I1VnzD16J1Al5rvNfkzhof
         GqWcqXUNn0QatGxRk3dL4ptOuAOz0YdWwZzD/HrCCDxfQc8Fi7mNhWiemYtCPWK31RJS
         gIf47upH6elCU1TPvBChl9uf04XYNxS6k6fyUd7d9bTZ+zccejTlt6/bPpsBHVr5JUFl
         wKRcI4QQP3RC2WSA6GCnnKhgTTWzcPCtdMyZJHqUYMYw1zg+FiJZuJ723AeRNkIAKK+9
         V//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996335; x=1781601135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlfhGqGgTKnIq2yjfl/V9swsRpNHZ9GFfY9HXAYAWbQ=;
        b=Dkz8KD01MjABtvgu3xLQxq/DpMh70WVRLwEuo2ZpZqQOPPcRUf+05AYTlAaeiaFy7R
         XQUpNd09vU4DmRHGxNhDaWfmDNNhoMVnL62jEDxQyHCy41TWO+iynyR9srQyeMkGJ7xb
         sSKbF6Drnlaz6hZ5N4M/b4PEDwM55o577AAxBiL8F76eAe+trvgLg0V38B67z3YIxhx9
         iIOMtWGGR65L3ZGI88TKpY/B90h7KH/5xMoGWBCe1f35vU/IbV+9tSW8mDzZ+6tuk8zz
         oJQ8j74+oIVQcRG/YHJq9/Q3XHVstP4dHHMGcWZfm8loKuGolZV1PQCtVcW8sr+3Y53J
         VMeA==
X-Forwarded-Encrypted: i=1; AFNElJ80mmKx0Hlc/CChOIzX50/elZqZWD0at2Vux2+r+AqhaXNKoWJ40yjidf0MD4Y+yUoGkgmEg955dTUq@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKsEwpSY+UsxNwMGAY+MS/FS4zLOrFEJXTB2ziYPI7ZAG/xBC
	G6yNWKHe5L1TehKS93YLtstFApbJWyIRpJSc7opCMlawiQCNaBTuv1+ZNlVnBa8omkSxCnhLcA4
	VY9Tjr3Bjg40OXFAvTkQ/seBcM/cYxlajDViB7tnrEeWXAm8PuTFMUErCtvcqahCr
X-Gm-Gg: Acq92OHdKjWYQWjlru7hrmwl/IuZPB2YXARNq/Ny4BYezutkvJ/GxdjmiUZWz8ZU0Vd
	n+XEgKQjOf5zqJTfTqam+352VNQieLFxmL/oUniwTqCeM24oyzMrpOO7TIRD+IV47PFzaP9jG3m
	/yFgx3kQUVYXklJxaMiPqKZyfGuKACvpFh4ra3sR+pWVXmM38sVBua/ujo7+IZyBRyc6FWrk04+
	1a9JMWfvL1aOpvCuUPjy4/E+Bv2Jg6obBy22ACfvMAP8rOOWfbzK73MIsUUrOwHEK2WOSuM3s29
	zE7WwNtH1Nuqgp97ePESIs7xmDEIvWMT0X9CJkUbuNL003Gp0GvZU4HZMYtXs2dgSU5AQmTM9Fc
	e4CVvB+aG3Dp9HmM5wyWqx1wTy6ykQ9ND5UCEbdFtnJwIHdI46JDyVNE2tPHZg2WMGa6hWGFvhV
	UmYVsOsj4pecyv+PPdZD4EostSb8pdJ+3CtY0cNjYeO1MbaP282myH1OeiTKfvntcXEHNrH2CHl
	eKrNbrX
X-Received: by 2002:a05:622a:410:b0:517:8011:3a4d with SMTP id d75a77b69052e-517ca550ceemr26387421cf.20.1780996334663;
        Tue, 09 Jun 2026 02:12:14 -0700 (PDT)
X-Received: by 2002:a05:622a:410:b0:517:8011:3a4d with SMTP id d75a77b69052e-517ca550ceemr26387061cf.20.1780996334103;
        Tue, 09 Jun 2026 02:12:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm4502822a12.19.2026.06.09.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:12:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
Date: Tue,  9 Jun 2026 11:12:06 +0200
Message-Id: <20260609091206.522331-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27d8ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=CL9vroWOvsCo93LnfqYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HJQj-aqYAPtds8VoZvYrOdx4wUPQzoqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX9S3irWw16oY7
 k9pUnAjxjcFu8nO0SV3UKKkOFZHGKwUrKOU3VEUCYXe0sujuTGZ7jfTulcWJxZ6Mq45nQ/A+Puy
 UochXETe0XK8HFuo8z5M9b4fmTnD2VxLeHcbtUCWmAByTqY2I5ZnHomFY1vAmaubHxnhqI1t3Sd
 +oajksrFo94+FYhEsJA0fU1UcFwbydhslomkZduQObO7QAtWArLnDRwh8MU1ta8v1NX0OLH2rO9
 bsYdX9kvm1p2hKVFpeaTdj+BcYGPXocaGh/Jo30Cik8HYQ0XxbYFAPcTWZr903CtRh0IoWBHNDT
 /QZjzS98lo/4DZXNCbM85pFciSSajzjlOSMNFU1SIghhGJgTKXdlqhEunoCjgSgWCflc8Aewsy4
 GJkipiSsqW8MPlpGLhqgfyTr4JrVlA==
X-Proofpoint-GUID: HJQj-aqYAPtds8VoZvYrOdx4wUPQzoqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090084

Enable the CCI1 bus and add support for the Microchip EMC2305 fan
controller on the Monaco Arduino Monza board. The controller is
virtually implemented by the onboard MCU.

Add a new active trip point to the cpuss0 thermal zone and
associate it with onboard fan cooling. The CPU subsystem sensor is
used as the thermal reference until support for a more appropriate
onboard/skin sensor becomes available (via spmi-adc5-gen3).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f..dae1c199adc5 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,26 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	fan_controller: fan-controller@2f {
+		compatible = "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		fan: fan@0 {
+			reg = <0x0>;
+			pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+			#cooling-cells = <2>;
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;
@@ -369,6 +390,27 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+&thermal_zones {
+	cpuss-0-0-thermal {
+		polling-delay = <2000>;
+
+		trips {
+			cpuss0_active: cpuss-active {
+				temperature = <32000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map-active {
+				trip = <&cpuss0_active>;
+				cooling-device = <&fan 0 THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
-- 
2.34.1

