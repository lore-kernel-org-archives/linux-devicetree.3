Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D8A3EB0FE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282336; cv=none; b=m5IqTejbRIP4P/fvyZeApJgoJQScEVDJfKBoUrYHfhk/jVQd0AAjYxWSQx99DI0hgeiorOafcAnB8WLhotkfDkv5pg03dqnhxnwrOZMr2B7L/b2J72UYFHmHzxq9icfLiCJED+jtfdrfolNUaWVAbh2NdwYnSu+TyrMcgqkRBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282336; c=relaxed/simple;
	bh=hYUWA6hHRWFZeBTK+ngbbDcvAT3eVLKP8fJugqcLyGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lqwtAKbDKUpiAvSQbC2LlbroN8TgvxnytIELJTdnkXfTnKi56ZDPY2SYAtM5jGrOHdU3q5bjM8n1uMzqD/SVmTO4VVZAOdJ8m4eQgEKVmNfRjATIVQ9rbQiQgJ5EaaN8wg8tEyZhZJXZjn8P4by5skbtZT7K1wy53371o0Bzqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVL7fYTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePKyaChw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVL7fYTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePKyaChw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d3Ur821143
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZuKmCF6V5l3
	azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=; b=NVL7fYTkXc6m4F12POIlR5xy2Eh
	U0uL1ozZPfnMiQDaxx+nn1+0XU1Am653iVkfUKyckjMZ9aLJtudaDwvTE4dlyHpU
	BXlBR6nE0ooOd9NmcQRIrwlZsK+39A8wEFIF4suqtqYK6zexZGsPRThKAB7wU8Fw
	A12Q3N1ZKdRGmymlQV7LjtkohkjmynzwCx2SL9IUOHhym6Ne+6XbmHuijkM1YSF2
	1QwPcjaCt3muY2O4Fb6PX7XqH+VkrdcHrT3enoLgfQ7i+mj1f5HznytqjBHAcEC7
	Oxtj4oDrEFJ0HQhdPJRwFOClcuca/4R9hGfoBWWXigHq+Wto9ijr1zGM5fA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8qtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so9961731a91.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282333; x=1784887133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=ePKyaChwwzU0QeFUWjtUWfdqn5PjcIBDkHAaUHbwoEJezyvzEk3N30oMsWVT6hvpea
         zZRKgU2EpA+fRhbvNDyqUPsaXVR5S5BU4XMR6pdM90cffGM7E++THsMx0LVqgL5Elzas
         U8bDvlXf7bwmvOMFVc/02BTrKjGwMoUzsD5cpUYIdvST9P1ai6IJYvYjp+mLNGIqKMJs
         b0bweiE++L2Inl+teFll+Qp8g6PUHeozDDtmNHbx9DCVjNfnLBBFInz8LVFKYR8A8FgS
         G4OTpHPJTwo1cqfnTDrwuYzNX8RR/VB8dsBpHC+3P3XAy6bh7ZMXyjggdLLyELWEknBC
         Epdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282333; x=1784887133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=cfkf8xuFINPuOv41FbgmQCCNcxldLGPMeHrPsnRzq/vF76kBZ86EpU3AVhgTIjF3Oz
         1bGOdea5q9ieYuSQDzjxRWr/V8tpBhjrqjcL7Ctpl75vUSSsigfg9N/KnqYay7cU7ZO6
         p6GmCmzzXXCQiitoe10M1JflDGfNo+B8bdJpjIVENf4DpJj+elzUVV8iVv+VdEj9TZdB
         5vo9tJ871T46kFGcIUozBMQja4y+vREfQP7vcQ4AXqmZpCcECCLfIhHOv3loA9B2INLJ
         bR3nR504X38EDGkNw+ewafANuJ7vcarhz2AbxjIeEe6v+1XIP8K5uWEmuEUHXAs8wLPr
         WxTw==
X-Forwarded-Encrypted: i=1; AHgh+RrIBUok86bc6mz4n+UghmOpOof2ajU6KZeKPXaG7KrmIvjmtc7CrhluzxOl3iv08D+wnNodLlX8hs/R@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNn+tS2FhyFhAqDmhaggNVi+M9gJattYU0bYkPtTvL9PnSB2v
	C1OJFtwtribuWLOTFkFfkNIlfGtPOOipaGQQxoVmDfcXPC3M+hZm1JlVFCH0CHIScFtCFDLVtmL
	U5yRO+aZyfno/XXTHArjej973YR37onnXUZASyNVuOd9Nox/QvEMo9HU3faoF/1T0
X-Gm-Gg: AfdE7cnLot5TmmdwnX6gtpH12Io3pErozVfG6NsyvlkDpc3Wlzaq8CnZ5YXQunoF+ZT
	lrdCRuey5hrFi5wMNuK/LuAnE4BfCssd1HdNNn2lIrIWyKQp57Q4vE8NvVdDmIuuqX6f6X3Kpk9
	ojOv3bVMZL05OYBHh2FLity4uKa42560FaHRSLQp/uK+a7Mtpfa/lJFfipU0nMxOCnJtYwv2brj
	qLkY2qI0EV0jgLeRdiFKvEy25mW8t097g1R8FRIrz8u4nUKO7yOvDtnLQXsOOIHHCmhR1RE4luf
	7Ol21pCZbExatTJPk4YuaG0s73+knhp9yX8I5YBOKlLqkElfwNndQklWN9nWP7aGyHSu6yvH1B1
	fKBRQZqwg0q61XyBGEXX+AywhsnFB3pVbFJVi
X-Received: by 2002:a17:90b:1844:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e4b55af0emr1994053a91.33.1784282333024;
        Fri, 17 Jul 2026 02:58:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e4b55af0emr1994027a91.33.1784282332540;
        Fri, 17 Jul 2026 02:58:52 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:52 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings
Date: Fri, 17 Jul 2026 15:28:25 +0530
Message-Id: <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXwdSGG/e/m1Wn
 Xzuv+qMkWWeO3M6VMvh31Bik5pJLwcmWeDpfe7p0T8p7rUBeQgFAXaoKp07VTUH6WOLNRNeNJuU
 C6DUdRLAPZpL83ziilhnva1Ux3haWYlOudo774bRIZO6g4tJ2jUiqFaMME4CSxV5ejleziwbUNG
 n9hAFblFWo4UPCCtxFn3td/A1WppbRbAsVMkt/ODlRqMEIya5GZd5S1MKe33WfdLETNlKFBR/ze
 lBOGh3wSWiB5CN1k2RFjqjM7VpPjmPPHhJgLAo1p7Lc8VUFH2tQ5q7ZL98rHdS+yJuSqO8+KpM+
 5mQ+aG/eGhgnKy0ufWYHj4zPdo72Ozcb5zrUN7RJx+OrxGtRTthcDxOcIg4UM7YDN5OAgeYR2rW
 TfjfizxuIBTzIRr3UPZewm8Qt7Zs2ZFaAgpqjcgxQ83DUhJAXpWqJbtOL7VQgCNOgNEDwosW/Wt
 MPgyWbkqIch6evQppCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXybGKb8RhKa/P
 sWd3o0JGwTrFStVk4QCg3SaTidLIsOmyKtlSAyXxo2uFUzFhurFF7ODqMiGHmm4JA7gVc3Hmjjc
 mYLVXmiROjH+mj0U6fQ6nuCi6OYCuKY=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59fcdd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: zTprp5PJAqpqgKNKLWEUMg2K3vUmPsQN
X-Proofpoint-ORIG-GUID: zTprp5PJAqpqgKNKLWEUMg2K3vUmPsQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
index a7e3270f8609..97bb8287cec3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
@@ -17,7 +17,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x2000 0x0>;
+	iommus = <&apps_smmu 0x2000 0x0>,
+		<&apps_smmu 0x2060 0x9>,
+		<&apps_smmu 0x2062 0x1>;
 };
 
 &remoteproc_cdsp {
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..d971c0ea1b30 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -729,6 +729,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		aop_image_mem: aop-image-region@90800000 {
 			reg = <0x0 0x90800000 0x0 0x60000>;
 			no-map;
@@ -2844,6 +2852,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x2001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

