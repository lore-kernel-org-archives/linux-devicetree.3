Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A78407581
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976629; cv=none; b=cQcajzOpjNhZKD7ukVW8tCy90k2tCa1mrkr9iCWrIv+AgdF4Gw5V/M8w8WrG03pHJBpSXGrBn3URbwJe/w51v7M5k1Myz0MNOPN9bU9CYGGLGr57u0K793hsnym07dbfQ3nhSOse5FgGDE2X3wVakigNFJbyFSdUqbOwPpgN0nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976629; c=relaxed/simple;
	bh=Fsz7kG3w0RkxZ4KPuxZbiOPZymBoUHmIUdRNM6gCFVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pBreshcQfqeUdwBQkOOe0KpxpBcCac5YBJv8WQ9zr5Qbt2kdPYhiwNEME8kd/H13+s9kGrpDOBhUDa/D0Wkmzf13fSFsF5WpfWw/uMXQ51rURl+KvNn8af7hkbOda1FDNEYhT3pmuJ/8FwX5zQMbKYrBQA2xbPSgHNteGkxB6x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apg6ZMTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSAiSpzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apg6ZMTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSAiSpzH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458ohI01346212
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 10:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zpy2+AKjwB8
	Kf54slnwusTdEi5rsASp3w8t/OQg9gGo=; b=apg6ZMTL+4ubkXpc/SMYPIoEVum
	0Phlz07TIJPbWV0tLJy7Ihx0NUNroX/Hncqmqsz4uRJlbGZTRAJ2YIk/K4laIThg
	IJKpsMSMX/wzdMj9MDFz+RfoIcGNSEWQAyM7UgV2l1fJyNoLboL0PLHlH25JbIED
	1TM5g24FFupm8EdjxppN38gTcfOT0vfW5BAQTDsBlXN5DClJkzo9IPZ6DO/dxU7G
	of2CuwLbQtdNtHgPy2VOz9/yIFWKAbY3JgzBiBRjdnwKTMTiTF+c8nLTqax1nzRd
	TR0zi+MPqJXHh7D87mm7sOeMRtYft/emb/pHVYPdLSTV3ZjlCTKOUiypTYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xbk4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 10:23:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso12898726a91.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976626; x=1778581426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpy2+AKjwB8Kf54slnwusTdEi5rsASp3w8t/OQg9gGo=;
        b=iSAiSpzH6QxKKIDqievEDuGhGloBLdfnWfD3pzHfEhL3HvLQpv61gXTKYjRn5j1zbj
         TAWJoGMY/65nBQgyjB89Jgi7ZOGnfz/a/2+nN4GzUfPbVdvS40hvPnu0mmUHJAcQYAQ8
         3OJybN13eilyu4xYj1f5MlQk8NdZ6hv+02o/8ctULdwuXRwEySfhcXJ6/RwcvvD8SMfF
         qVZfShbl/QBGB58zDzfkGCFP6sgk5Rv0BI/QAQ+Au3kOwv0iza8pOc6Naiqz5Z3nJd9v
         atWiv4ufQtS2HQLtaUfvNoFBSKUC6dJ3NMntbxmcexf/KSK2ZotRWNZ7Ry4pFJuuo018
         xa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976626; x=1778581426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zpy2+AKjwB8Kf54slnwusTdEi5rsASp3w8t/OQg9gGo=;
        b=S0NujPu8azZQRlIfAFWoKXn+KGxZ67yCCWO/jvomcM0mygZcHZtvldscP8FJqGDduz
         h5Y/zp188VnSCP/3Z2Z1NCuqNUX9fttxtQqiNi8opQccR9Lk6TGDSNHeZ2MdLDQbQ/cC
         x9BU+JFAbWf+K5QMqJ9acd9VQBRcGh7JROdsJRU/MueFYQ0gXNFDMgoNZBu0ARW/Aim1
         K0Lav/E+/3vFVJANe3/Tc1yE8eCUdJbS+ug97Lqcz6GKoSXfHAPiSh7gLoqrsaivU86/
         +nUZC5nAFNNuWj6EUiP8nkIgx12MM505B2mm7FdXU2lcUFu2ZCgJUFVF4afLAwsIwyCx
         ey4g==
X-Forwarded-Encrypted: i=1; AFNElJ+u4Ja4JIDUI+WhrswLm/OKCkA1l5fdDehC5aPS87S1zrgUrQ1WYPU9yBMG7A9S7QMVdCtJetMfakx6@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmyjaXg6r2BM4slh9xogPp5PjD3nuG98Btvvs5bbXumxfs+zi
	Sqk0B85FckBrGaAP8g1AdoB5yHP3cX09zqrUZhY51se5pEDHmpBVyvKPuPCY3/Lc1Kqm+6sGUkO
	+Td2FIO9Iil8NRsUGsAiCxrm34qwiWuJ4o3uM7G35KlLg/WOtydsB7buLGzYtmycW
X-Gm-Gg: AeBDietAenNQQ027Qmn0j+rhzhd8LRGDYRvTMSiCUJm38mu6tVuOZQSyM/gLv6PEnz4
	tmidWHRUw+oJaZ3pKf5ekofKxe4/wHN/pxZt8J+EPC7BRJWGSod20OxRzsI6u4truRLkHJSQbon
	ORkH2t+M/cnU5ntAi+RlR/yEiCc6zBSYyLm0YASbx40kfOsiBgo5d5f77qWSrNxJwSybYjCNmjc
	9OdY2tWihSSuey7GVMxv7xPj2haEjWPGDZloSHSzETPt7pCk4Ty9PDJJtRskAEob6wi7K/hYCf9
	5hqbCIM6Tfx4PD0wlQ8tbByvUnXnDmvmCSoi5f4etgWhyziACvQlioVRjLr3dHKTRUPse++nMw4
	vtWWbB3CbfLcg5GEpv99sYJ//bszFButIfeqDUyRkk3EEU5o4gnmkfRLz6G/4Z4sRrzlxzZYQXR
	sXfzGU+Pcd1qvfxgNIyAbFvaRGMUG1wtK5cUj1mAYuv0QAsfaE/qZ8xR3OPnoI1w==
X-Received: by 2002:a17:90b:4a:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-3657737bdeemr2674111a91.3.1777976626296;
        Tue, 05 May 2026 03:23:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-3657737bdeemr2674083a91.3.1777976625770;
        Tue, 05 May 2026 03:23:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:45 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:09 +0530
Message-Id: <20260505102310.2925956-6-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9c532 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=mZiPdHz2TdHmxByWXckA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -ZH-cGjxfbGrYZSqX-Gz0Xrh7QSLt-Ff
X-Proofpoint-GUID: -ZH-cGjxfbGrYZSqX-Gz0Xrh7QSLt-Ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX08SzVO3K5JR5
 n3l7CwMAFWzEcppeo8eXTQJBexGpZPX6Qmeju7BbCvUjkbXosRHVS7FkKTDafu85zfxzy91Nfey
 kAHDG0GkT/rfXVTkEt0szzQSH6mkVdsBN1JFF6MTaBvz1TW1XM8X1g3onRl01g1ie5cHiDOBO9f
 sN+enSvy/bLhpzq4m94v0f4GSQrfpVf2mgWWJDAslQ+X00bi5IDvOLLcFU7hPzbqCd+/y0nxnan
 XwS9CRGpH6MyWpd6EAuR1VzHAXEhNZmojssV4lXiclnTepn3RvVUAKWuQjlPuMfurXg1Y+qlfBp
 sOUHOHGsrbiEDHPfd9xuN5tSBZA7RN0bpblw/nqy7iM0At03X3MCv9Wj2dmhoRUFFZ90vVySnZe
 CQat78eK0e20QGQJ5gn5SL08YU22ZqIi20ABmjDmd2CbCX9C5qDB6ZxTeqTwH+CEKz8pZIUeCLi
 EvRjtNZ3UiRNvyW2DNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: Change Manikanta's mail id to oss.qualcomm.com in S-o-b and Author
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..2173f187ed9a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
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
 
 	soc@0 {
@@ -619,6 +648,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
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
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
-- 
2.34.1

