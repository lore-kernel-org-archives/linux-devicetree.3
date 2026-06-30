Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4A3E6DE8
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805835; cv=none; b=pARAHEPdpQms2JDWmVFDz3mbGkdeNUVlpYkRoasW8jmt5OLLm7YW+TrmEegkv8UYyk9AhqcOhBS8+nM5GBxsXPommyA0xbZdi6F32hq5RPe248pR12dFbJzeCo5nG0OU4qpELIauGF+C8hWTsy0gFLg0TRb7Eql9Sye8A69E/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805835; c=relaxed/simple;
	bh=fKMU1NeGGUQY41fhAOV7CeZ1kxRC2hDpCeMw00fNp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e2w6l8/a+Yu9c4ZfVcgdQwAXpB/GzxUW1Wl8QB2k9PR8kiMDcNX/Yv2KzeVrXMGY2h+E8fPepDiWlBaSq9BiJ7ZIzjJcIMp7fpTiocRqmTAuq4Mn9AO4+gnAEdzcwTZp7jUGTCAKw1dAYWopvlGn6DyQraEBA/gCp025AgzUEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuIH6k8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDrZ8Q0b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuIH6k8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDrZ8Q0b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CIee1055971
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cDcsvQ35yvivZlq3oSfzhB
	6wOm05GoaQYkiAbIzSDPE=; b=FuIH6k8Z+hjyc7wMKbqXG2UjcsqHoy01up5sND
	VDZaWzg1EomW3IJEsOr6ybWl6XDD+i83yfJYVHMsjEOl16DUjyipBLPyA9mHljK/
	2V2wgxE3xSuhMl6y0vg7jVrRxtKMYf4453V5DFEHDIUAgZ7uaHCaqgNNU8buLbtu
	qqEm2xRmMb5XOPJK+QCc5IqCnl9QHAjyUa5+HLO7o7mKmacbOzN1Hdltm6hwzi8L
	52iH6fP+hCm3pUS6kmIoG2oWwOosr/ALsBjD9ynQtGc4VykYGUmTw3BSe7f62mjn
	gbFock+yYcFTvmU0V7ZgbIPgKwv33pZw91RoGDyDHS9VfOFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46860x8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:50:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so317717885a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782805831; x=1783410631; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDcsvQ35yvivZlq3oSfzhB6wOm05GoaQYkiAbIzSDPE=;
        b=DDrZ8Q0bIPPCq5Pmi/mqYem0HsHXZaNzRJWLaOPRO8vzN9WLtzPZpKwX/FF8EhuF3Y
         2+/SV8TDfX2Xke2oiV7GfzRZn9/F0ZYJUh5brPYBT/wM8wfYXUhrZb4e/SAcTFIsZEYr
         A2WdjjejtIlPFviGGm8/V6DYHe/Ndkmfps+DKFc1jk9m/jPglEPTnngbQZLKLyt+IjEP
         GA9CZfrlUjfRex4BwUx82ji6/PeY4ShD1HcLGUtfaANZO5mFM9LDqMFSt3QgeYmzWAub
         ngFZ56axuGvO3apjYqaPoJdmVBcRiTvBao451yJ68FN2+O7Q7iAYMnX688N5KOsDDWJI
         BxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805831; x=1783410631;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDcsvQ35yvivZlq3oSfzhB6wOm05GoaQYkiAbIzSDPE=;
        b=gzvJdYtzeWETAie69hTqF7rvNc7xXR649UVXfV1DNbx2yMo/ZYUS6exc9+Lh8opE2U
         Jek0Kw1SX8t3o67zfbHbUVgQILpAc21uFSuTZR+hOlbhF1NBaoQT3m4wNjAAS3u1NH9z
         QK08BYoa1+ndczDUjcydeSJsfObRD0rsKoYRM30Ms6/Mss8QmnErCIP4Nv3r+bKU/+RP
         ClLJBo5hCs1KMpa2ibmmmZuoFqpwGeMeScnWdW7EkISpTpWzCp12kHw4TxTKtxYNo4vP
         PKKju+Xy2Coqc73VTIHuVxaxfWJtwMdIaBUfIXIg3/gk11QlWaThc6gL9U97aoHbzxJS
         4CIg==
X-Forwarded-Encrypted: i=1; AFNElJ8l5RkARb2a6tGG2zBFc7yDy3N+kfanHrUQxFvfBsDnNmkAUyr5wBOykBLMOyoJK8jbl2A+Na8J8yNw@vger.kernel.org
X-Gm-Message-State: AOJu0YzWntsACCVcnhvOGs1zAW1Uo9adhTieMUWuH0O5iWcDbbK+91uu
	IiCOscYdlzTUAw1pB6jJTKPLmLSf5fPa490m1USbsKqeSt1u30MPEL2JPw1I0VfN8gvLyIuZfK+
	s1AT8IAmX2U1e09eyyR7Ca5ZbGqnmOAPr1ZUAl7QJGXrdRaLu9Iv7Di5JZ2OVt93L2GzhASj9
X-Gm-Gg: AfdE7ckb817FlDEB1OpceR9w2akPdQSS1HbEOx/zWWUt19tDeMIKNoEG/zLoctp9iaG
	CmzL/2iz5eHknZ0DC9KY0Eps9+1JPMX0nVvhXUvND5Z9WBucjhVq3M035EXCFiWu2PQyCDP0hPu
	FummXsnVi22qXfLl6ncxFbabNvudimnqGafRjxILUv0hs19qYb90onRRbZaYL5IABnx4sZZnVxg
	LTdZrATZswxBw3GnMoaC+cjwqA4k5QkxSmx/x78UI+3rKJm1wvm4hd51Rts6F6aKx3PxHCdrYIW
	Vb9nfN80rVJo6RVm78I+p8HQsOTAjJO2tPve/MdkTpEI+HqH7Nioxgj9MTOYmcLJWEgwUFfYUZM
	4iZoalPQADUDqJII=
X-Received: by 2002:a05:620a:444a:b0:918:532f:9693 with SMTP id af79cd13be357-92e624e5a2amr412657485a.28.1782805830462;
        Tue, 30 Jun 2026 00:50:30 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:918:532f:9693 with SMTP id af79cd13be357-92e624e5a2amr412654785a.28.1782805829771;
        Tue, 30 Jun 2026 00:50:29 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bf712sm18766245e9.2.2026.06.30.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:50:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:50:20 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and
 MTP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADt1Q2oC/02O2Q6CMBREf4XcZ29CWcryK4aH0l60KltbCJHw7
 1bAxMeZTOacFSwZTRbKYAVDs7a673xglwDkXXQ3Qq18hiiMeMijApWzOMq+RXrpt8DWDUjzE4V
 SOLRaWsziWGSMq5xCBf5mMNToZUdcqyPbqX6QdN/fc2FonDzbHTOohSX0kFa7Muhocfjjw79YG
 ex1ypLT5pCzu1HWsIQVOYt4WpRzAtW2fQBMwFoq7gAAAA==
X-Change-ID: 20260629-dts-qcom-eliza-mtp-evk-add-pmics-733a716d8e0d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11340;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fKMU1NeGGUQY41fhAOV7CeZ1kxRC2hDpCeMw00fNp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ3U/8rucHFLXLLvT8eauRAQxk5cIsrWL9AV/q
 N/5v6KibXCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakN1PwAKCRAbX0TJAJUV
 VvpqD/4yGpUbboPlTLNQf5svZPpOcj74FrN4Efvr8WhFUC1VeV7soyDjvGxZEee2fYk2GVGa4Gi
 Z7ua8yq/vJK2EzqD3AtNAmgil/ezsNaEn31vucWUtnSljrJqo61X83JiVMGD/NG0Popn6uaQJ++
 4zh+qUvkn1Ki5Zlap7ziUAY8O90tinTj/jfC5xiMwvW7fNZFtDImHda+rc7K3TwNoy9gBgYdsuW
 xYidKhe7pk7OVvwnY6TghM5gzvNObbbk387oHXdD5+PVKkttcplhSskGZztsEuXRuGRlQaRRj1P
 oH2f6jIYXSjHNM/ECpSReOX4TNomJz5GJ1zE2lUyZBLBKbrjpLLgiemXPFMQNWFWBx9V+743KgS
 8NfpbEx8+IS7nvxCSKEG+7YpVyuK8oNE5myqKeK+1i/RcHxt2hC6o+1PengcalIlGf2iipDRSzs
 EeEOcRzwNOaRcPF5nq7ePu2rYEtCCj/cTUJ4QWc3fg6zswSOcfLByuhwlfkMUxJXEAHFc128wOw
 TtpJQNXFoMQAsrxisrqWzLYOPQ7AVH0uWHQuP298XXnkJzCyKeI1496ny6GP8jmqYLzSK8GWHgZ
 lLL4PezYLtNSjsWfTOAqUBQPk7rwB3K8rLsho2FahHTY8y57seIwrM0PrJx2aQe4HdJG2ks4mi7
 pv138VKEyoxfhRw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: eZit0hncQ-5oAoceADvJnIlEz-veuFge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX987GMQnDQ9mf
 B6qotyNik0YFEG514S9br8X+BsxSZ9W/5ddCoVuyaAXuoVEL4LoO5McS//1Hk2J2VYGQN9f1fG0
 YB7JkVA/35+LWFcLEsI7rhqs3pwFGI3xxxkjRI1uv31dgIlwvqLlMgbt03AvHe66wDqHEKVerUf
 VGfMmiUT+mhkELnS7Sq28Sojw6kLYsiph5MU4NfSljap5/hFaWcckKImt+ADniV4w7p9me8B0/d
 wOpaRnBvGIypgv+XTWbV43CPYOYbch8/7Xk5iqbxYL5pDbfb0rHEq0NlQmTcOi2SUt5MEzTei41
 mkH1FOOg9Z6xgV52UveKi/xsmdo/esll9VmlzKAO+vWZGINgatvfuYbiacnMe7HA/QuXf324u/5
 uuy9UHeJTNTcIBallae6zUj3bHT1eAgf6lgBYiMJEwj/3GXXIUjAbAyNyu81MhfXHBPxmz2L1b2
 joJEbtHUco7q7ybBJLQ==
X-Proofpoint-GUID: eZit0hncQ-5oAoceADvJnIlEz-veuFge
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a437547 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uEpe_3vvm7urPFSnT1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfXwfSa1DogBikH
 MQ6jAEt+5nm9HZR8PJ4CmQwq6iLn0r7zwlSbgHtd1DPjsXUGxBwkziX7+un4zCYNNXUY0dbWN58
 VHhJ7VIlQGdExHMk4VDzAT0x6eTWmWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300068

Both the CQS SoM and the MTP have the following array of PMICs:
PMK8550, PM7550, 2x PM8550VS, PMIV0102 and PMR735D.

Since on Eliza there is already support for SPMI multi-master,
it is necessary to duplicate the devicetree description for each
of these PMICs, due to the SPMI bus index and address.

So add a new Elize specific dtsi for each of these PMICs and include
all of them in both the CQS SoM and MTP board dts.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi    |  5 ++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts         |  5 ++
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi     | 61 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi    | 87 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi    | 63 +++++++++++++++++++
 7 files changed, 347 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 33f4cd282272..318ae3c22351 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -9,6 +9,11 @@
 
 #include "eliza.dtsi"
 #include "pm7550ba-eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pm8550vs-d-eliza.dtsi"
+#include "pm8550vs-g-eliza.dtsi"
+#include "pmr735d-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
 
 / {
 	clocks {
diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..a7d6f9d52ef3 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -11,6 +11,11 @@
 #include "eliza.dtsi"
 
 #include "pm7550ba-eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pm8550vs-d-eliza.dtsi"
+#include "pm8550vs-g-eliza.dtsi"
+#include "pmr735d-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
new file mode 100644
index 000000000000..9b907f69264b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					/*
+					 * Current Linux driver currently only supports up to
+					 * 125°C, should be updated to 145°C once available.
+					 */
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550: pmic@1 {
+		compatible = "qcom,pm7550", "qcom,spmi-pmic";
+		reg = <1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550_gpios: gpio@8800 {
+			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi
new file mode 100644
index 000000000000..548d2aa83962
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8550vs-d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550vs_d_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm8550vs_d: pmic@3 {
+		compatible = "qcom,pm8550vs", "qcom,spmi-pmic";
+		reg = <3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_d_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_d_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_d_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi
new file mode 100644
index 000000000000..4ad2cd189a6c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8550vs-g-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550vs_g_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm8550vs_g: pmic@6 {
+		compatible = "qcom,pm8550vs", "qcom,spmi-pmic";
+		reg = <6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_g_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_g_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_g_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi
new file mode 100644
index 000000000000..e0ff4ff9c469
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	reboot-mode {
+		compatible = "nvmem-reboot-mode";
+		nvmem-cells = <&reboot_reason>;
+		nvmem-cell-names = "reboot-mode";
+		mode-recovery = <0x01>;
+		mode-bootloader = <0x02>;
+	};
+};
+
+&spmi_bus0 {
+	pmk8550: pmic@0 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8550_pon: pon@1300 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1300>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				status = "disabled";
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
+		};
+
+		pmk8550_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmk8550_sdam_2: nvram@7100 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0x7100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x7100 0x100>;
+
+			reboot_reason: reboot-reason@48 {
+				reg = <0x48 0x1>;
+				bits = <1 7>;
+			};
+		};
+
+		pmk8550_gpios: gpio@b800 {
+			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
+			reg = <0xb800>;
+			gpio-controller;
+			gpio-ranges = <&pmk8550_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmk8550_pwm: pwm {
+			compatible = "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi b/arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi
new file mode 100644
index 000000000000..1c29d8ddea65
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmr735d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmr735d_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmr735d: pmic@a {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

---
base-commit: 758ee0279ff3463f564cbb36687f4faa035b7878
change-id: 20260629-dts-qcom-eliza-mtp-evk-add-pmics-733a716d8e0d
prerequisite-change-id: 20260514-eliza-dts-qcs-evk-7f1419812659:v4
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

