Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19FF386C17
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278677; cv=none; b=hi8YhurI9IVswWAmNRXJzL9Do/MFh9zBHt+zB6ZHrUAawtDCMLKZPAI8eTCFh0ZAeYVsdwzYB5ouN05oWOStJlnAnQ21972KDdA5MHvcdHvgdpWptBuM+G4234zHvI/8VK6JrGWLMf0inhaA8FB1tPmzb+8ftvyTDjxXWCeNZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278677; c=relaxed/simple;
	bh=A/ZlkhpKXOXspcZO+2h9v+w/LUVpdAPN+/yLddIsV6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiuiTX9R+AMMT3G+DEdNpVvAJks9fgeiWmpqsuMaTZcKkjtyLrXjGHKeQcxze6iwADPs2XqOXU9/0DDZgk0hyKhe+esq2FkqN8E1+VaXKbdJgZu3N9Wgd8wi7SVmbdA8+/uAyK+xZ99NR25rP/jfuEBgIT4L7yG3OSmGeTzV9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4Optehs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As+bKchX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4Optehs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="As+bKchX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1qBi2731195
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 12:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STAmXKRhhM1PNoYloH77abYDI2FiolvS4IlxwlZE50k=; b=p4OptehsX0YIjfrQ
	4Ki87YZ+xuhhXMiCZ/J4nB+AIso2tWkQRVkjbMqoxkXBEUaolrJ3O2Ryj+jvgUvR
	wWsxY+KXI8G7RnQq7MMnVtg5xg/ARSJ+NS8bHQ469T1IgYJRUozgvM4Cf0pIPWjK
	QKdN/p79TSfoaEtPyISRvjLvWtqg5O1UR03ae0LwbeAbgl4DN3rkCN9IglwesxSC
	j60gPFQhf7vdhCcWJnv+u650AKXRk52+IithhFAp56uyKRJyMzXLgy5IzZH7Eckt
	0Atwr7qFAENjO48xgWCV15Jv22X8RCql9v6HJFl29Mcb27nIuWxl8m3lJ7G9T7lL
	Am6CuA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1jss9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:31:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so13820905ad.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278674; x=1786883474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STAmXKRhhM1PNoYloH77abYDI2FiolvS4IlxwlZE50k=;
        b=As+bKchXCQys4g1MqnT/zK8wKQY987IXwVBpH6iwMr83/IxoN83BVtB4BjxBJg0ZI3
         0F42QI0YOfhSUmuO6caY+uQfJLao8FJBakML58TfEN7McNtVK7JxYOwH+aUX3E38K7QD
         uiobAbJIauJv7YdD1HEE7j8lzRb8E3LuR1fCUw+Bjf5FkE2TavaircKEx3j7i/XK/JD1
         tyrUY1ZgoSWqwe413KhXZWMGLPRwCPz7xWQBcw81yWqoNj/zD2FVe/2rvbdYI53K5PIK
         UtAt7PdyGQs9/eICgLCyTMm9c0geTcxmI7a5e6L7G95W/qQlxOmQZ0qr57WPbq09cVfr
         epOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278674; x=1786883474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STAmXKRhhM1PNoYloH77abYDI2FiolvS4IlxwlZE50k=;
        b=qa/yRSYpU/3XPsrY5bYgcZJBLEI7YbrC6JeFWHsUF6/rVP/mmtw528zHqcMBlAoy+I
         ULoaK9qbK1Bbv9g560U/n+xjWCWnFQ4qVQ92D/7noT23f5Fw28krl67jvyvjLz2GPe3p
         LMyvip+z/OceJ7VE4cE0g4kfsWjh1eATfvZ7nuwPcKkMz/R6+4ghJXMMUsILdctGHSoD
         ynXno6nJJGDfc+cktNJ2+b567L/ZVZ0t4BaEPOX0Np7xW5Ce+pjleTPtl7wyk25tEyiW
         vSTSnsHB+QkYsCEbOvqJSPGeiIofr0ROPIEi4mfasGdWhsx/u8c2SybO+D9qHFm2gOgo
         PWqA==
X-Forwarded-Encrypted: i=1; AHgh+RqiYOUJCJdkhLJ1p1I2meKpPli6x3D6xj+1+ro/yJEYiVuxQsXhBqs0A2DXChEatXbSZcsg4tZPZxsU@vger.kernel.org
X-Gm-Message-State: AOJu0YzlU7/rKnXJXP4KB2VIWg8azwY0bFcpC3gDLrnF0GizL2G6ZxXV
	1GOBsFGl2NHas2/uowtLHiR9wXO52KnxStSXkwQo0u7TJHSH/FYX9V9hFuUpSz5yBXaSrTBig+3
	Fj3xaSAhDZ/NjDnFILSCvZeUiyq6dRQD2pJMQ50tL4wOAgntsgfWwubgnd9itJTZg
X-Gm-Gg: AR+sD11Mu+fsGDvsVIAPF0cM8klYFtQDoVBkGtR6RUmKa4lX5rUN/QAeuOWKE/YIY3e
	r+px0emOUdEl/ubCVR+c4gDmH9MeoPahy69J2Ac9LVNswsu3ZQecZWk5xvXIGYtdzmL9GwGx5vZ
	coHuVe3bEVUMcGQz8/hqcGzqpa5QN22byAuY+CYAXVQ2pXIdeUJAjEB4wVwRZYwAEb1ArRm0SXl
	SPsG2Xbsja/bPE4n3GeztOKm7EJGoouJNd7+SZSedyZJXY+wzNOGdFwXI9Pmvqhu9h8LU428Lb1
	cLpXWfR33Hz+NWbQV3m8kmCLm4qL+lnDXIEoSJYhi0AWaPwj2w9O3YkOOcmAan68GR2d7H4AyOv
	UlqZnPlxagSo8Z6Kdc7p+Gzfal7L2bA==
X-Received: by 2002:a17:903:985:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d2a8458fdamr173706895ad.2.1786278674106;
        Sun, 09 Aug 2026 05:31:14 -0700 (PDT)
X-Received: by 2002:a17:903:985:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d2a8458fdamr173706275ad.2.1786278673667;
        Sun, 09 Aug 2026 05:31:13 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51842997eec.18.2026.08.09.05.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:31:12 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 17:59:04 +0530
Subject: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
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
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786278595; l=4988;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=A/ZlkhpKXOXspcZO+2h9v+w/LUVpdAPN+/yLddIsV6A=;
 b=DlmOZROYsvhmBPP+o1mpIILAkZPge04dcZHn4SlZSMk4gFLO6ssQ04zG2Ax1La5gmqkcgfLdm
 9dN2VHCCUjDA7uOFxHvJYiIpuhqeGJoefbLZVscrF8CI/JsgmzuLfCR
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX62shmEFuv6cb
 LlcQNczvyrzmzUmVjXnsnF6bzdWql6UqUq7YhnVUBJer6LDBVr6t+zatKxseiK+EY6FGctaTH1I
 /07WTDt7OvmWZlM7dffwkBN0cwp88WjQyFMyGY7GOxfG1lSYclYiZLLXkrt9y8tE57qqnd8NpL5
 hoF2Q5U/3WtcYlzrIwQcPhHx/WWx52nMlPkudBXejCIibNcrIxkiE7BCaYXeAmz1Mgn1ANZNz7C
 X0tF7FzzFWPcNxef32h+k9pXR35jsdrxUbmvAqwGzGx3QedIU9vahEhUUGoppSpL7hXULyHnsRM
 upMy9lJg3lqEEl5hLrCO4Wj9+uCzWZi2fuGMi6CbHDa94vaUXRHdWAvhIXUdVWz5MgypYs4Cmk+
 gqoomaQ6TdKmC2AwV1SZNHzVt868sZr8lsITRllGB5lCede6uZdCXXiyZrmzvq8no76jPr/pvYN
 9ewo3qxRyN5ELMVgZnA==
X-Proofpoint-GUID: QI3qGDd0m6Ikt3spNT5YgSKU8LOggg3O
X-Proofpoint-ORIG-GUID: QI3qGDd0m6Ikt3spNT5YgSKU8LOggg3O
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a787312 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX5oxrrAevcCIi
 xKtnPlLRGzosme7BpvcQOJ8rY22P9mpJYeha5M8y3uv0SFHEeo67HExK5/mbKUHcYYUCqS7DPHt
 2KK86TqWy5BSiMLpZbcUVc6CiBJFQVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..3f388c000fbb 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -7738,6 +7739,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8170,39 +8173,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8290,39 +8341,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

