Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F9E40DFD7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615399; cv=none; b=G8esIoTpU13s8b9HwqqUgsOnNiaalY+Jql/CYIeajZ8Z/k4RgEE1PA/prE5y4IucLJuKYoLUUcp8859IFdX+I8ahif0R4HxBMnZZFNrGnLLXUIUL82UtdFc8xKPOQAsZ9ZCZsz4IL/Ucez70DRkW+ooGYRkTXigSCXkwF/QmHTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615399; c=relaxed/simple;
	bh=ZifbSMwbsL6byJybvyJVqhBSYfY+Ur7ZoLWanU+zR6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuVlCL/RSHDbUK2/5JHDPLcUKoM+v/eOAoZ3pFojJ2AFtrxoVN+Krx72OOoJK4wdomJEos9vXv0kVma58vxHdwhPiEYlM+Ram8eTfGmF3/r9/+S5XoulG7u7ebeltzj0iyPlVbD2bTKy8xWXp5V3vtAcS1FBhuG22/RNz53bY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqklPy5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dhi3aztM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqklPy5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dhi3aztM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4SiDn527007
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBQpj5JJuprPEDHJoD7J9a7kieOLqOFIM3U9fFzAGEk=; b=EqklPy5QRQAH5VsW
	4yelLrNi76jaM2bFOmsB7x1TGwfb4eU/+oUvm/bGazaLCfxmVfHMrLW0CmX0/v9S
	tIxYgzLWPZSZNN6sNQdx7/oObeLcY80p+8T9wBZmTb6Yx8eJkd7KYG7esUzmMXDO
	up0k5/zWl7CQ4jQi6YY/qvDF8dd9J5OPUiyTiUOGy/TFuiqUMOSDcJK/Gt6Y0t3/
	rYLHx7R+3wRpTJHuelocpwrf4q7xdiIU/ocTbU2ydXWCUt3zRVmTkc38z7AAY9aE
	gzywo2l9vhPfE8tpw3C8BT5PImuOSwN3QDbfGxw0ezmmN+hsXDhfcaGY4LPA2p9U
	JmYoUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0dhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:29:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso268241845ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615395; x=1785220195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBQpj5JJuprPEDHJoD7J9a7kieOLqOFIM3U9fFzAGEk=;
        b=Dhi3aztMlfmt9T2bpDLw2RgGgRrpw4ctvLlDCKgLouvvkrT8+mmnooMlHCl5u8ynOC
         o6gy0U9zK2KJehADhA/hLjESwFc2rLI2I4yxypJ8g7wFMd6cFdD0KXLE4ikUiv9hkwPs
         WP9aurIHuz1ecs6DZpC3ojvoovwasZzeRDz1uIh91DnAzidMqMl/BkPPe0c/+EQQX774
         o7CLiFJrgek6XzQNFoFC7ln1VTaVW7uPvVVg4WiN562jgTHvVd+E2aynSYChUQ10XS8y
         I3b1VKAjyJTBOq+DbIo/hCZuYseeKQsOXtA5lxMv924TA+yeWZqxOo1JLDDieG99/tIR
         M1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615395; x=1785220195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBQpj5JJuprPEDHJoD7J9a7kieOLqOFIM3U9fFzAGEk=;
        b=Hul1SwIZ/PWzqrK5+vcThQi/4BMmsSwHCCrm4OzGSvNdAkbvjuYeukL3hkPYklXUsd
         3VjdbrPDpii7rx2qMU1ZWQmMREQ96TuNxOzipEbzGcGwq4IVH1/qbpTx+bOX4o07Tms2
         E/Ai+3ks8CNrbhomBalROTpGYWMeEvJt3kvc/EiG6hsbsuNX/7TCDrClKy/YO42aeshm
         UkmUcbd/8ezT+qQU0xwmOJOIz5Vs3Aq+JTqASjtRlXo1GStW9Ym/kT5fCLMGZfeVEfdg
         VtifvSDJn1xVGXtjrloksGT1CX4ZKcsB5YifSpNWMNhREjXV/aUmZQCB2pjXmFE7tD76
         8vqA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb+ILGEc1d0OIkvjk9vf9XBv0tk3nQvOToFROtjMDrOLj/Qrg6DVYvaUp72P1Tfmb4nTq2ZUDFSRzI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx281gt7RGfC/nnSxnOTuGOxpJ9Ua5DxVRyemBBf4d0lEQIfg8a
	kN5kLRF27ulDxWDwCsPNaoxDodU+i/7wq2eD3vvr1m7DKw9Dc5SSuANw12CABS4hpcaw3rP44pu
	oSyB/SipPRs2/fWAREJ0vslFhMiwGRKibkag11slkMcH70Vn3P8ffsdKSuug/nv1U
X-Gm-Gg: AR+sD13uhk561t0BdNxpCCEWr0KkmIPO3o0K1iSV3Lau5NnvBvd6VIDErs0XE00aFTQ
	E1l5ZH1bfbatscw5BlSnHNyZksH0LaTD20eJzQOJtyHcgf4oSpbjVr9nIDkl/l18ikKsvsVWJ0A
	Uqb79ELE5JRBjxa/Ri2pbQploJi9aNvM5HW/0SEhqTSvI6vVz552VE0p0e/raxseUpJZtT655vc
	BH99MW75mZXP47Q8Fiqgs8C+IQGVm94+6PReZ4jmkxBJJku3WQNbXhTwrIKIyEAhZ6rd1NslsKP
	FvWdf7E4VF+vHq7ER5mpuaYabSAQEq8DoqBt6AXJTFbM3nsuX7LIOdIvkaUV++DaFFeQ9cwxLq5
	bZJqDpN5gt9ue6QJgnnNw3gEoracxTQ==
X-Received: by 2002:a17:903:13c6:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2cf348686a0mr183194815ad.19.1784615394568;
        Mon, 20 Jul 2026 23:29:54 -0700 (PDT)
X-Received: by 2002:a17:903:13c6:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2cf348686a0mr183194465ad.19.1784615394071;
        Mon, 20 Jul 2026 23:29:54 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:29:53 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:02 +0530
Subject: [PATCH v5 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-b4-qmi-tmd-v5-5-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=13045;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=ZifbSMwbsL6byJybvyJVqhBSYfY+Ur7ZoLWanU+zR6c=;
 b=cv1nNNK+Ow/xYBvH2Re5AaOymssxAIRJyPP4IzMDpVMBsdrOYbiF3Ux+VCNLnrTrbae02rTez
 u/kXa+jxmEPBX/1Ty0kohCScwsnBxLOUeo+9k/4FvXXpzaglettn4Gs
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: SZLKYBu5jRpSKK_A3ZHHYTpQ-LW6axqe
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f11e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZbsVDflEkj9MvQmDaakA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX7SKtWO/JJfib
 LGWiXqY/xYl0P27vThIGeAGj0HyN1HsnVgHJLjB92t+zdWn84cBAseImC7oHd4oDQd/AC98hZlv
 m4TGuP27r8+UIiN4xUF3IRQXnAIspSE=
X-Proofpoint-GUID: SZLKYBu5jRpSKK_A3ZHHYTpQ-LW6axqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX0PTF2txi9Vb9
 KR3GFl/yrm6LSy/wOa5+GY8+QFGOIV1OFLSKbWenfiNkS2S/QYJ1jp6aKHDwvlaHEgbCEt3D04w
 IzKCrhyeX4Pq4T+7Hmx1wqBkNj509rjscoq1sJbv8SrKq0L9gpMJg7vorYAMZ21jragiJCt9f5o
 gwjx80Alfp4hURnEWDDCAcP0f2v67/HVMjIr7f3tQ2uAHhN6SDfTFAgl/gpaQmAvaZo1coiEZq/
 lZiOalxZfjjjnVLP0on+uA7Z3hpauAonVnG0UfcaDa/cTkdaGIWGnT7+yyRAzWCTft+SIgw2Vlq
 Hovp6COb/tWgF6w/Sxot6Uv9A0oMNDl1s27oTxNoGtpYXq/HoqOBGv3UOD+MSB6hqTu6nHes7OR
 0396TVidHXaR2Z7lsVZuUr27NAYcOrSkJjcsxVuz1RVOC+wsENN+y3AAQmQTsb8AtIj5Jf3qPEd
 FzfyLbN11TO7A26ayBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210065

Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
when it reaches high temperatures in kodiak.

Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
for modem when it reaches to 95°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Since the remoteproc_mpss node doesn't exist on non modem boards, the
cooling-maps that reference it cause DT compilation errors. To fix that
remove inherited mdmss cooling-map nodes.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  29 +++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   1 +
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  29 +++++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  29 +++++
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |  29 +++++
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  29 +++++
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  28 +++++
 8 files changed, 304 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 7e73348fe0d0..df5099023b77 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -30,6 +30,7 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/thermal/qcom,qmi-tmd.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3431,6 +3432,8 @@ remoteproc_mpss: remoteproc@4080000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -4803,6 +4806,8 @@ remoteproc_cdsp: remoteproc@a300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -4922,6 +4927,7 @@ compute-cb@14 {
 					};
 				};
 			};
+
 		};
 
 		usb_1: usb@a600000 {
@@ -7732,6 +7738,8 @@ map0 {
 		};
 
 		nspss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -7741,15 +7749,31 @@ nspss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss0_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss0_crit: nspss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss0_alert1>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -7759,12 +7783,26 @@ nspss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss1_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss1_crit: nspss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss1_alert1>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {
@@ -7803,7 +7841,9 @@ ddr_crit: ddr-crit {
 			};
 		};
 
-		mdmss0-thermal {
+		mdmss0_thermal: mdmss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -7813,15 +7853,37 @@ mdmss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss0_crit: mdmss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
-		mdmss1-thermal {
+		mdmss1_thermal: mdmss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -7831,15 +7893,37 @@ mdmss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss1_crit: mdmss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
-		mdmss2-thermal {
+		mdmss2_thermal: mdmss2-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -7849,15 +7933,37 @@ mdmss2_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss2_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss2_crit: mdmss2-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
-		mdmss3-thermal {
+		mdmss3_thermal: mdmss3-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -7867,12 +7973,32 @@ mdmss3_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss3_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss3_crit: mdmss3-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		camera0-thermal {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 82ebd88f9aba..befd3f908ce5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -24,6 +24,35 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+
+&mdmss0_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss1_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss2_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss3_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e9a932c90d14..48751bc2265d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -25,6 +25,7 @@
 /delete-node/ &rmtfs_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
+
 /delete-node/ &video_mem;
 /delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index c8eed8ba93f5..041a02a03d1c 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -22,6 +22,35 @@
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
+
+&mdmss0_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss1_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss2_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss3_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index d8a9a7e47bdc..764c9dab046e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -23,6 +23,35 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+
+&mdmss0_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss1_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss2_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss3_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 4f2e0109f49b..2a49f07ceed1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -25,6 +25,35 @@
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
+
+&mdmss0_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss1_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss2_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss3_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index ac89724ee099..ccb13d2fa5c0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -28,8 +28,37 @@ &ipa {
 	status = "okay";
 };
 
+&mdmss0_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss1_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss2_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss3_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
 &remoteproc_mpss {
 	compatible = "qcom,sc7280-mss-pil";
+	/delete-property/ #cooling-cells;
 	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
 	reg-names = "qdsp6", "rmb";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
index 3ebc915f0dc2..87b8ed5d1893 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
@@ -7,6 +7,34 @@
 
 /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
 
+&mdmss0_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss1_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss2_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
+&mdmss3_thermal {
+	cooling-maps {
+		/delete-node/ map0;
+		/delete-node/ map1;
+	};
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &rmtfs_mem;

-- 
2.34.1

