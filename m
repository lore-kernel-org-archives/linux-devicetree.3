Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4820531A55B
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924470; cv=none; b=CqlQSC8y59NQhUbOisgTJUzb0AioBiUx7yPIxf5JpILFIjduqUDYLBGNLix6YrQSGMFBjLOAhL35WamZqMDvek+l0scD+GTk+UYkCICVmMveghEBWZo9mHFnhw8RLLr4CAbfA0TkFi9ulkPV5glPJR0rUsGU6L4/PQQ9iR/O3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924470; c=relaxed/simple;
	bh=mYzkB9ThUQ+do9DM4Df/BqKYcIPRCl8M++baQRJ3Pc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tybya5WetsXAom38aMXDt1Y/N2rdBWOdWCggRs7ZyJNcjsF13lfwmW8d2hi6f5C3uXWENwzoaLJ2PCA7q+nFdl0CVvzFZaUL0+Jml7AKycH+V4UAMqu3gf2Qw/6UVxH2aMnNHZ6fCZHaO+Za0yGUJzjN/OvyGNqffjNj1CytRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzfsScn5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhPXK2+z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzfsScn5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhPXK2+z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhtR648372
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=; b=EzfsScn58eUWByI5
	que33sg0iKZQ1aW3SJzR6uPMrNmhqUocB0zSLM2PDdLlV8d1PU8rG/hGPoNcDXHi
	lrEnSexIZ5G6tYzGTt1zHa5JSzKRqbsU1OZX49JwXNJdnptRsL9dCBSxLKkyXqDh
	95SFBltmiWEQjXOTm6l7vH0VEPCeulDVKCkUQ14cv7U9cD9sQOpks6rJESgdOSEC
	f2ED5nDcl7xDuxjthWMYC1FDDOmEVSVEt0S7IeqnYU4NjkOeEb41KzAq2BtiBAVu
	N7YrMtKeaTBM+unDGa5X1wU++p0qd8jeM5wZlmAJ9ewF4H10BJDrGdxcMCLndLX9
	3KMSEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4mqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso2633353a12.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924383; x=1784529183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=;
        b=XhPXK2+zAtPofgy99Zro5klu3yv1D5CfhfcNBcdqv1B3SRQyrgPM/LN72WuCt8LXZP
         112IQuXRk6/OZDO5mbQIBQ2YQzEbu/IsCFWUa0N1zM5E4TLRTFEWnOq9GEmmzTLR+9qH
         6P1zvouj03Nf6MFjRAog66AGlb0FXpfY7JjJl28PI30pJl89X69GSXywGy8ilO6EspvG
         r0OC5dVfvxHpSh2+R8fqASOarIzAKpIa+TA5HHYd+bz1itShSggfy/lpkCI+WVQ+7mMH
         huHPbYsIr0JLPnM2NTKxY62adgXQqp5PNbBvd2mn240vHq/ECZeSZhgO62DuYT5LXxY4
         KSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924383; x=1784529183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=;
        b=SDMVjJNe/bOoB3UldgMa5meEp+8fTCYP0ZkSrnFOtOPClc2OVov0sv52LRd24elL+w
         FG1wuToB68zoziNnF59RMUL1rbQhl+sDbfgUHQDv0Hw1pu79gKL5+XZyprvk5meWMPa5
         S0am31FWBZsHjdqQdAu6LYyf4oiwSY5490slPsMOlFDRD8ZduXdEhzd0d7q0MXqGmcbc
         ZAmdUgr5jLjnXxMLcApq4gVmz4At6n7aJVTe3UGVwb8zY8zolhs5jdEmvA1JRCP/mxk5
         mjS0rigIB4IBgLBuEqho9Vb3mpF72Ce9ENv7o/1VaPng8ZPSkSW/Yr/4kC9rar5iJmom
         OrTA==
X-Forwarded-Encrypted: i=1; AHgh+RrkSEeDFfyeyhgqe7QPMf24OORnS+od6eit2Ty5KV1QOmO7XqoZSoJP7aG9WvYRpbSgVMb2UBpM+JBR@vger.kernel.org
X-Gm-Message-State: AOJu0YysBut/cVPzgClwLispKCuDjTFSJ6QabvNJRrPrQ6xtoHlPmEuK
	3PKPupIYzwtImnEBhMs0l796se6gl5eKspgjRHmiO+n/xUhBViKSwUwUuF+xoPC2SKQ0BwlrgkC
	LzTzuWMyeNwC8gpeuqx6aSqEo8NokaVJjPyEca0agEU2p3hbFOrou9DMxVsAczYGB
X-Gm-Gg: AfdE7cnhjYsB4UZ7g2FYJwoVuMU4oNV9dFdLcRNbYreZZDELUxOIRDWbnjmYUspQkRR
	aN9AfuzX7/mVWVjw6eXC5Wb0EiMmKiZss4avaklaL73OT9/K3P3I+pxPp/ofOGTTEcGtxFdmZ8T
	fjWBIGSzYAhxjS6cJFnfYqe8edjSLalmVgVY8RiW2vQjnTiaY2WP6kopDZwh5xg6V3+xAwCmrsq
	BWZXajtDKuUaD23rdjnDQwGFnF/Oekefo1XyOTyMD1eo/DAiFezNhppjWsaPRgy+/w10GuPOLdF
	31+7ANFW2WiAqawwjI/yVo+4U8VqXb6AGWZPcA9IcYSHhvYyJDGFtA59fesgc1TvR7zPx5Ly6IN
	FJHMSqH9OSzd4dRfv76zU7gtI1fHT6C7/ZbzIV6gAgI1Z0pzxTXbIvmWPkKwC4CIvc7aIDBjg63
	D9HL6sNiU4S4B+y9cCFrfImaA2NMzf1StRyh8FCg5f
X-Received: by 2002:a05:6a21:1f87:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c110adf5a9mr8471441637.58.1783924382519;
        Sun, 12 Jul 2026 23:33:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c110adf5a9mr8471403637.58.1783924382048;
        Sun, 12 Jul 2026 23:33:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:20 +0530
Subject: [PATCH v13 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-4-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfXzFc63RM6LbWf
 nYaSMKzETMZRMsLcj6wIMjWiF0cVoKfKuEFxV4Lp53X+/qz1F/PnUjh4cCVvK9yyD6+Is8NyYSl
 vMrTclazjI8LHG3Auu3lkaSNt+mz068=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a5486f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: LznJY33LaBFkUxYfCOwSxmuAPM84jKJC
X-Proofpoint-ORIG-GUID: LznJY33LaBFkUxYfCOwSxmuAPM84jKJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX+XyZjObqMeSo
 kgjJe3x3iuw6Nu0BfFKF8N0smsQZjYmcHvYgKvHoFOyZ+iHrzbU6DwQgq3ByW7zjfcU4m36Mwl8
 OsoG0ZxD5g3xXZpJG4c8hvVBYt9DqmObiLqESN3hW5fBwKJwYKHpYgC/mzJH7bm+8kGazSkGhAh
 v1vHSkwfA9GB7r/wXjNZ0EQXdtomTp+tR7XSjWyax9VjyWoCudJB51EGRJonCkKWSEf2Kukm7kn
 /T2QIxd27kdUy9NlxMAUXQCwL4bc4NrDVrZHtzDQNGIGY/sG3tRBTehZDAbaU7ndtjbp85aI9Nt
 szcLCGYryE/zDd9CZ2ELU9cVF1dfja9QFAOtQITzw0VPgEhpzr3ytfxzI69Y2KQGzF+eqR1KlIs
 9IxWcK/jTdfSXZiSm01o7zqzBIVXgxWSNtt71G8zvjh6KVu84KXo7Y8KdRRCnsAH85jOz2nqdgd
 9K1HrfkKNmrCfAzyTuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index edff89257468..86e8f837bb09 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -731,6 +760,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,

-- 
2.34.1

