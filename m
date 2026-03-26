Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3586394477
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499643; cv=none; b=oBGfnmUyQfEa3v/ccigsxyMq9DPrOmtekp4P5bq6wsN0NxFgtf2lny+BdV4yboaXvqQpIiL8hFZsQXb2hpW+VaVwf7zql4fnyk315NR9UsLeSpJ7DMobj562oNHkvA0hIFBpOh8q9FiGPG+mlQ7OD+BKZO12ZSJxzL55lBGSgLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499643; c=relaxed/simple;
	bh=l4ivXt3lsKb4kgsBy1mCcps0SSDFqqQ/qyQMopTJGyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cvex9gKO3t+IOctd7b3lejJHbIpNn7j9pxOwg6eDabayTWcFCYxw+/sdIH6JOsTv1iPNqSluUcG5yWEvmZWoeL8Zgo0TS6aWnEdp17OpMiVgSdBXD16n4ePltLGr0cCXEHayZpzpERhgLrhwAA2DWMOy/8vS9GocIiCkF1bQEMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8DT6Sl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj67NoHM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8DT6Sl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj67NoHM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKkuTt051541
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b1gGYzVXgpW
	/TOjAzqqRnI55kNpdkgiirOaPxukUIGI=; b=P8DT6Sl1HzxN4C2oGlRZFb0DRii
	maU21x0lRkH6wW/FmG5zi7hQ8VGcACVWHhKbpPMu/u0E05lHVYuBHPRmS+Zc1Kbs
	1XSsAK6lCncPoNwMYBHj1L/jBZWXZ4KBE/tnDVds04RhkkhdnmTI3Qyas37vPIi/
	ZET8ZaLIbzET7P1X/5WKfWJzKUeko+aSgDA1c2Kg+3bOwkoWB9ipksxNGlRhk0Ya
	J0BtkX6Lpz46UKZezGoeynSawVXfMV0DAjrm6ZDR7E1M4LCwYmptG4kk5zoLW2SJ
	y+XFd8fRy/xmpjEw1cgz1S3PMsGAfAj0ItDp6ap3O/E8UwMLraypGRQFuSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t166b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:34:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b079b4a8c3so20469285ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499640; x=1775104440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1gGYzVXgpW/TOjAzqqRnI55kNpdkgiirOaPxukUIGI=;
        b=dj67NoHMKdvOgZZKo8WXwwfn93AANtOQ4g1TgmM6QeARtW+RZw9/M9ar7KkYzB+npm
         5KzGWOKpDlwUdtSePTtDWbLylWhjw/HczPNz8SALwJEIt1iZANCym0mhJyXS9jGWsl5j
         gOT9JR2bvPgRNwf2FGlx7HfnjhJMR1/TNaAB5tbV7htKXt3/X7LhxVrQU/v0ZaOBHgBj
         03nhyapC/L4hq3nLGRTZCJKHN08r5PY1ZFywxMMolH7u/wTxxmHYhezQh7SRN29x9Dp0
         ick1ClL+uisbyCYTRZkNiia2gCof7xW/3VKVhQTFN96nFTXLnhx6F8CxyQrLpAfSZ8Kj
         vdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499640; x=1775104440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1gGYzVXgpW/TOjAzqqRnI55kNpdkgiirOaPxukUIGI=;
        b=hYwjRxtAkElqGGBq6p26qFl0y+siSL7Ln4I5pdAzpKZxhLG1qyc1EB0HYanjE2pEhd
         02PIHVvFjI1sQKMbPwMwhRj+TdHrsn+cH8KjTKE9pkqM/G5ja/AxNqLJRYnqCuQQXNuh
         i+mlLYSVdb455Ql6D/G+9LP3A8eE3udALNg460Qjs8RYx3DnW99EAiUR3oHSPPcu4bgx
         ZS0vpWetwDjvrivXIZN2YN7wRtXK+Fw/ubRREQVkPf/F9MbS9h/RQ/6rCzC5a6ayHEtV
         DK617ipZD7fDwB3syAL/4Z1i2YcyA7tFBgsGGYzZHZ19lL6auk/BbNZmvyNGvkElqayJ
         YIMA==
X-Forwarded-Encrypted: i=1; AJvYcCWziSY9Fnwu7GUvSxPosiaaZ9ZXNizWxd8kjttYkgWRuuknOD8TP1ZWTl2Qqx3qFLdMUcmrgb8bM+rp@vger.kernel.org
X-Gm-Message-State: AOJu0YzZA8QkYE6eYY/UU/VNBk5rpakZOmFpgKKcf34s1/Q0iPUa8x3X
	HQtq70hIDCWpaU4JgVX54suFc9DuYezoxPVqIk1Vx6dA9Csrn7jXm2eHZ0yq9Xw1qajTTv5jiTl
	EzksXSyb1jD/I1PMiukFN2XJFYECZZtX98TbNEpzbkiJ/kaPzsdeUuJXM4d7v9zlY
X-Gm-Gg: ATEYQzxrNjEqaXEizCsmRhkE5YmiEWKdawTfvCD7XbHsw92WjUJEM8HdU+0CGBeeT9u
	jYmGSv06V/XpmG28nw/DD3zCIgP3HO6xWSLbhEewzm4OiJAEJdHhQnZBGbSJn8Jqec4DwA6xs0t
	ShiJdROehrp7ivJsfVIH+Kk4d2eezs+4HRmMgU9NQnbi2bxMbUlxpZE0kC5csg8mWXNY+u8yx7I
	2zIZyMoycqvIDtY/E9L55+yVoVi2VN9rs9ZwO7wl8qrTUSgg+o3q+1GZ9eay/Vc1qMQBDBj0tYs
	qcwEdLss2aFpU5urE6SSqVElD6khBMlsveZVwjO3H/vAOGjIJjZay1DaMMybE/MzRQWynJUgQHO
	KmvK6KmeIrzirYfm0jNaaFJyTrk5vwGQ4Mi6FDLuqi+0pqsTqfK7NOlmMyLGt5jtCsLB2GY92Jx
	JEJmIGBJwmpBgvbp0B59bMHJCAX6/+JpIqz4WCfj0g02uCtX3yrjY=
X-Received: by 2002:a17:903:1ae6:b0:2b0:643b:41c9 with SMTP id d9443c01a7336-2b0b0987e0amr71476775ad.9.1774499639855;
        Wed, 25 Mar 2026 21:33:59 -0700 (PDT)
X-Received: by 2002:a17:903:1ae6:b0:2b0:643b:41c9 with SMTP id d9443c01a7336-2b0b0987e0amr71476435ad.9.1774499639367;
        Wed, 25 Mar 2026 21:33:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:20 +0530
Message-Id: <20260326043320.2507890-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4b738 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=nG0a804IO7H6KQc07wUA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yEXSCYGyAqZNp33cCtlWB7pPh1yfaOEM
X-Proofpoint-ORIG-GUID: yEXSCYGyAqZNp33cCtlWB7pPh1yfaOEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX4zkIVCfG4DSO
 uHTM3wDSXbddFBs0Hkcy5e+uwfiJlzUEoebILZpFroA8CCsCDgxBYIMFYXm4XJS8lF8CnZyDvPc
 FKcuI0Bw3Ev5xt/05gDRyAg1kY9wT1BprSADV7G8MYj4/JLhuf8NyGV+QFMcuKnBgf+Zuq8jm6l
 ioSgA0g46v5mOebnjkHdLR1uFTsYqOxyh7HEG24UhbH4Ram8MO7Vhyt9I+Gm7dnlQsdzFn8oDTA
 gmkiRVsjkxvELRRYs+JoBWjjZDyApQ1hs4KvQS9ipbnoygXSVrPUWGqV9+LoS60ou55+2h91mA8
 iE9pP8PVoSOAhKNWtLoPkFtAli4mL/jwJM9yy61izOylcpBbr7VKF/CfBaV9Hvsfa77xWKX/jxm
 6FuP1RHT2lgHwDy1YAvhnxOD/OYOI4iGa0V0YUmiwb9M5I2Q2R38hVqbF8ShvHSe5xpM6ZPb48/
 7TG6jXgbrKblvIBIZQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 622cfa96ed2b..5c828c855c98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -914,6 +943,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.34.1

