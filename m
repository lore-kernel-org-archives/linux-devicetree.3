Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523D2BD59C
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776766801; cv=none; b=JWS4+Rkf6pM5jWigZc6bmnxwDU9hMBhDnz2jR1As1RYr51h3vua0XZJZxGhRZf48aF1sHoQoJIJtRlRfeU6KlhMXC9guQCM1l4IlvKr3dou2zK+NKhbhB2pjqLpcNw5rtevJjWBavoGgwbuWwfUgpThr7XR0lGkDxhTvJV/Ssu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776766801; c=relaxed/simple;
	bh=f2d31fKICaRc7eSILNMa+qfIwIjktWJHAPS1tLqZR54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XOmZgNxhXIxFpFA1tbU1SLAAt7CWuRZwh4mOof1JjpAMLIwDQ2J0dDiPuSWr451pIPvwcAQz/a1ii7I4jwjPYV0AcEv5UlJ0AFVyYzRXdP9mUnr5fI2BVcJr3/2G21oTu3QoT+BHOMTtkLKXDrq+W1PVxFmhRqhrI9Ly8dtAbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFa0jQ9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVXxV9Ob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFa0jQ9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVXxV9Ob"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L64RqW3257259
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lpMC6OOA7fewd0kPfM6zC/yqwiUooS/N1/w
	2gqDkMuo=; b=BFa0jQ9WqnZ0nazUStHoFzKC8WJbdv++49r253XK2s9+Xm1AA+S
	t0WllF6stiY+JW2l3/VPmk+Vb6WdcXajwWX3BJkrxLM/mUYE8lOrh6dvB6kxCK4q
	kqbqiS6/h96IlZMOU41To+1mft/yX2EdDkEFvd/eLH+9Ouv9YLq62ILQtSBg6tWu
	VVG10LfgYqgYB467GXY+RDdMYeSIFZ8VT5b16kjhQSM5vZhuvqDqpijBKdGnGjpo
	R60EU/xryks1ISTPkf/al4zxRaHqVpah2FxcR6n6sIEs/1X0/KaxCVTW0MiI1Cdh
	G/Bu946XP3ZTJF+hQUS141ZWf71OEURILxg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3na8xrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:19:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e4c29caso92039471cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776766798; x=1777371598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpMC6OOA7fewd0kPfM6zC/yqwiUooS/N1/w2gqDkMuo=;
        b=hVXxV9ObAmAUJkNEn+PxU3rdnutA/F7T/P/iE+1bQNQoQGPgpbncKIqeZGW8R8A+Za
         tFvn34uNQYCZGT6TlRVkRwSw2WhtbH945rKoN0OZWD3Du0TfgBsGOJm5ADZENV9tmjpC
         TcMypWOr85AroU8Xbi8j9bmIPuEKTI/0h1MzMAgCluBiHL2Qg63XtjGPB6+rY1MswyL9
         xw3JLiMmuSfjfxhyVuknjG256xBu3vxmCcGXZa9rnJdEbKH/3q64vH+Hc/vw5GF/9p1a
         sC/r0Vq6afsJtef8cKHfY3vfxaqOe5rizPwAFJJYn71Whbi+OpFpl+2XwLyw/mgU66UZ
         6SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776766798; x=1777371598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpMC6OOA7fewd0kPfM6zC/yqwiUooS/N1/w2gqDkMuo=;
        b=pNBt16bMUzVzvpld1n9N/suRMHNWeVwCrINvE/1Awgu2RIr/ndfUvrFsXk2970ezXm
         /YL56KaQLC95/XPH1IzzaDp4CgS+iFPGU/dPI2wWeQsF3deTcPVtMmHGD6V2CL4JdOmV
         AcYPZ7lmA/nb2hD/hUdgiiTeK07C1pNit4lRirAsjiuQ02ShUDtS3nMvWiH+FX8yytjg
         Jr0E3NgJCzXidMkKhOlREBzcYBJjuUDNpF2mstG1AUZXS/jm1GPFi65li9e37g/TECRU
         WxyhFW1KB9eJDX6IGQcoE9vuPh/Tjun8f7BMAAZQMHNhb1XKWLD12TZk1ebfYaZy93dT
         IRbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jEZn/+nMFwok5uTg+AfDJf2MpEIUFFad94yLkCIpdzFRzg/wyxQOGM+uEMq1pgUdQzW6HmcBzQ8eH@vger.kernel.org
X-Gm-Message-State: AOJu0YysjOAFbSCNheoiAjGMwAgIC2kvYdsCGhazZzuEc+cOP4D4YEcF
	0pfo6gm8N1APMaZufe4QsI/BMAOaHzrGlCQTijh709Ctu+GbEU9ui5SbsJ/y4EwPFiwAuXW9S3b
	5GohuTtRvmkrWL5ficZcQcuPyi08I0xEU2WnKQaG5KcdfKmj+Ihi9tAJFv7hton2K
X-Gm-Gg: AeBDietgwk4FnoRKgc/r+XxArdrPmODMeSo8ikaQhkxoMQcaq5Q8i+SYSM9C3JAuXTu
	nYvjK2j/V5lWqYYkGJXbr5DfwT9MS46HSmi1qCYU8/RQ4ymivttEg+mLDtygEd7O0R5QOUlHFpy
	Ll5WdGjSyRcyfWVQtkXv8X3pfr7ivS9d5pG+ggrDVX0n0zkvMXALE5BG48PxFQ2FFbdAIdQaczl
	lKgH3kgnB3PSPUI1c/71uhdP+xyxJJGWccbIL+PPcQhjQHIE0bZsbQN74kdGHiJr4msmxv0d3as
	KOaqHUaFrf4lLx2yFLV1tBrm3rMSyg4WUatsrh4TwzoxJRI+GCzXOUP5+JSJue0r462M824pBos
	77hudrJqXnZylp8RiDrbqRzJ7QcDZv2FZd+hPolEkMoLRnE/d84IQeZb56NhOTWYX8WiWSrPChN
	2FRPJmLwjmgsp7Kw/5io4=
X-Received: by 2002:a05:622a:98e:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-50e36e9c3c8mr268988921cf.31.1776766798401;
        Tue, 21 Apr 2026 03:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:98e:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-50e36e9c3c8mr268988611cf.31.1776766797990;
        Tue, 21 Apr 2026 03:19:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:34a4:17b9:744:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512115d6sm440017166b.7.2026.04.21.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:19:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
Date: Tue, 21 Apr 2026 12:19:54 +0200
Message-Id: <20260421101954.411698-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CMSjv8y2jh6lHcuUJhaWLgsnBLwlG1vA
X-Proofpoint-ORIG-GUID: CMSjv8y2jh6lHcuUJhaWLgsnBLwlG1vA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMSBTYWx0ZWRfX1j9XxXpgG+lT
 pmwSxrINpnHknL/nlG7s/m59cFRWzhcGiEVh6HNHaH+AZMLVkZsiczQmaQ0Zx9445eRGyQQ2Ghw
 EQfjMfsjd4oym0TUxdfTtQRvgGt1hvR7s24mqQhr3HVQu3u29npQ4eX8vtNMb0P31uyHcunfsL7
 f/uazkj4VefFMkFmK8dWSIH38aEHf9pZQ3awNwEJReqsZrqIqidTJjoEWP0xuD/yrIuaRojzNRi
 W1z8SrSbr7UN86Ahq6nJqz7pde9+bjewvvX/XLYuz3YhAat6hacQ9cirhlp+8vo0rTLqLt67t2k
 yKafpuCocJ9YkaCWbBk8+UNlDv4nJKHuZAOpMWYb7CXu0Kddu2+gBBUHBCi/3rbiv49yCsYXfYg
 tzUVb0MNyTTIbUtMdBzTMWuhXKMyv078khA6cNOem9y5ago1YTGhqLc3vkdB3LRleUCvcqn4TcF
 uRWVjHzCqg0LYz1QBQg==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e74f4e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=CL9vroWOvsCo93LnfqYA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210101

Enable the CCI1 bus and add support for the Microchip EMC2305 fan
controller on the Monaco Arduino Monza board. The controller is
virtually implemented by the onboard MCU.

Add a new active trip point to the cpuss0 thermal zone and
associate it with onboard fan cooling. The CPU subsystem sensor is
used as the thermal reference until support for a more appropriate
onboard/skin sensor becomes available (via spmi-adc5-gen3).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..2d790f726d56 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -155,6 +156,26 @@ vreg_nvme: regulator-3p3-m2 {
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
@@ -368,6 +389,25 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+&thermal_zones {
+	cpuss-0-0-thermal {
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

