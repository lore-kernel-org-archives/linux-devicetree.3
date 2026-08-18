Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9B42123F
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068484; cv=none; b=O+Q2AG+g/hguH06iSm2/+tWkGXEo33u2TUokF7ippT/hygXdJk/ahjuaRinvNEBeT2Y0rchq6TYomIzqLcPrhETLJ+endT8WtRmtBMb2WZ4kD1F+SAvHyXWGtJxr0pOcwQPkdhaR+0wAkYtOHr7M2ZSpJwbIi0Zu0jlc1cfRLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068484; c=relaxed/simple;
	bh=0PqC6+pA+upeSdG9qohub10QOHiozDL+AqpKZ0qsSlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL3Hi6MLHP/EMXXbby/r7fPe5VS3CCYUusFIV9eNhn1J5kIg+BhXHI0eEdtXx9bEnwEhBN7WTY+srIPuJwMqfJsY+zrjjsHOxFNSMKVjJMRMLJpXagezeH/5lNjq8ZRNX8mJI2JsOqBqe9vLdcT2TghEKIji3BHiqYuFIwLZLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNFH0FyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqC6U9DV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNFH0FyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqC6U9DV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0jwv1327128
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BEW+CIRrZQp0gkZZZbYGm+dB8HccqIdZMRtCd6mN3HQ=; b=PNFH0FyYDp2KGwtZ
	noL4J5gY1SUl8W9K9KAI3DbwVqazMzbH7MEbGqch+zi9sBaLpa7jA1M538J9YMPn
	FWY1J0cdn/bYLFlB/6YtChV9fu6KYhiprRAEQkFO95CJ+osL2FHWrP1jTM/K7axg
	aynDkWLJE0i2Fnq5Mw2g8B+OkS94odqCiO3BTym4c8tfkWrM6Bugi63tCmstlpYr
	oeCQ6z3GIiQUBFl71/7EnUiSw21jKYLAhyJlEIYase8DE8kib4xYXEm9RagAhbUY
	ofYKiV54Hwp3Lx1iOqBasIuN7DmiRtb4V9LgmSbI/XgnNtZ5bbIqP0UeSDTZ0WxM
	4DlU2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p2xtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so3434465a12.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068481; x=1787673281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEW+CIRrZQp0gkZZZbYGm+dB8HccqIdZMRtCd6mN3HQ=;
        b=ZqC6U9DVMWSZSQKHkJ5e5nu9OMJ37KdBy4es1ypg3rzxWGWSiITok2L1iMxxGMPPHi
         AbRfYux4eU9BDlGO3mrDVe3nvf9ynUb9B/eE4T7vopB7gswUkg0LtLr8FkvpGuwzDRxK
         Z8zpZEn1YeXhiRZW31PAuzUON35GoC8z4uvfWIA1eZZFU+um2IY9S0qx/V9HQHWoDRGf
         Qx6caTiRHnHKDSPrqAeWlQ66XwhUvu/vwps5SWW0Y719wJs6RHYoIx3LAFPYh5WRpizE
         U9fETbWVz6r6lo5ldMnzjMtAy10L8n5+AdINMiQILBxBYmTPpMYNRYeHT1g2H188mX6n
         oPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068481; x=1787673281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEW+CIRrZQp0gkZZZbYGm+dB8HccqIdZMRtCd6mN3HQ=;
        b=pLnlWiOdrqSr+Pk2Fz+rxRRXUU7nEP6WdU+mpiM1Quj/my7lwUPgUAquZIfUuUZjOC
         L9VALOCRATufLTswp7t6NFPTBgCBr+uftEI8sVraw3Ab0F1IJAWCAPioNNCGgvOfJWP4
         ubhbaGja3LHJTR/iQczPD1+R7y+E5yx3pLosNqzI27AIxMU+AvSUwsAawg8azIpmM8/7
         K1zJ16jwqfwBCVcLRdUFAD46dw4XWngcL9/ORYgQycT1DVbDxKETDXj12H8G4TF051zX
         EHao1tAReuipGayMlqPav3ytvmueMFNIvO15JhWFG3lMJ1HhNTTvGB7Xe34bT3FVv/oY
         N4VQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrk8WvHeEAkciC7nMoXenHFU788Q/Lnp6kzxX8Y4dFiE4EYFEMhxzrTljqAac6h0rQsQttYBkpnPjxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1G+cY8kqzt4grGr8xGu7YpB6J4GiYzv6gp2bKzXU+KNK7Y2G
	Ll0cfixJS3JZeMphThRWs4MzznxCM6M5+sfkIPDQpT8vbTKjFYLcNOeUX7v54ZMT864AT3nGmzJ
	avm3gkC9XolYpri7gwl+sTTB7XP3HqWsAIorxqVxbAQZ+sko8Ow4eQZa0fhA+U072gHA2X083
X-Gm-Gg: AR+sD13gBPViuNtaBOzjJ3tbYLr9SWy+vXnapHy2sdgsGvcV6QRCdq/JJV7jIOoUHUu
	AqVP1qPBvs6YlBGrTDzGICQq8Ng5tHvEq6its6ib0RNXwfzz38NvFIx2n5g45ARQ4iYBk1tDEKd
	lG1Wh16/SJ06HKdJzACyOnvSz8wX3Oqpt7zGnZhctHl2IKpumpkqxt4g11779X1no5smlgbaUsp
	fkg4LinfA58grPv2e/o8Ew/+ZjaEiYFUv6p8RdCq5FI9Ol6n4I9xdFVT81dqggN5HP1QwbRuKzV
	ouJqB8mPiPwXRjvqWtlgarLp//QsFB+HUCAXATZdC0wgBEEV93iBc7yoGQmaFuJSdLEd/tWcooY
	U7ezhhGz8wHQIbTz1Te/1S5p8qQEhwKHQsA==
X-Received: by 2002:a17:90b:5645:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3955a7f8e97mr13337449a91.16.1787068480650;
        Tue, 18 Aug 2026 08:54:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5645:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3955a7f8e97mr13337399a91.16.1787068480246;
        Tue, 18 Aug 2026 08:54:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:39 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:15 +0530
Subject: [PATCH v2 2/5] dt-bindings: media: qcom,sc7280-venus: Add
 dma-coherent property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-2-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068460; l=1821;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=0PqC6+pA+upeSdG9qohub10QOHiozDL+AqpKZ0qsSlo=;
 b=hCNhAws51z6kUkElVeslS+xeCq7dkznJyZ8l65o5+9B1qAZyCmMoFrHjgijblBpo/C+hjCyK7
 mxKvXtn0zTOBJtm+NnFXX8nfq5qAU6iroHVxbIOZfuMu6ghMNEg2cMV
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 6mAixKOCAX8MoUYEp1b39I5ppD1c1IoN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX1waAK/Bt71UZ
 VAGY9TCewLSjuNYMG6RveaPDvXnAbSF+i5jlDJZhrIGgN7F9vxfz8SAWGu4TaOHP433rKSZUcxJ
 lbPA5z0NsfQQ24pPx2NeyE9yqyXJCmI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX+Qi2UEt91D0Y
 BJ+dDFIDe+Ip8I0aXAll8nPCFxZcGm6jpXxzLtAtmEMcW11CPyegwnXhMgt45QkEq0FUasxnCdd
 bcusg60QfyrvkwiIABee9C/+4NjnKYx9k3YFKAmW24IbNrU3B8idF5crh+vbKqg4CL/cNioGRHt
 lDS54cfIrT5yrNT+CVVh1h/6kqB24VgMSnSqyRnjF1aK1DIWMGUFug7mdw9kVzmlJXsusodjVPx
 5GxUe+d/r9+K3hrIkKjpKprcxaDMOdA7pNTtOj+/bgiXyCgfEt7PV0ja+HO1sWa4+r7sHoTEihr
 OYKiTHh6KCXlJF8t3Gbx388S4jDntSxH16vkyj8B2f4mp5qw1I2D4NXKLNyUJmZEVZxKwJsrQrY
 y89eyDMSioktWTBGsasnLXAi+HFlk7Cgfwg3htc/z3s4D8KPDScdwHVUk817tR3Xr1TPXbTry2L
 A6gQFY4+uQtSD+r8QWA==
X-Proofpoint-ORIG-GUID: 6mAixKOCAX8MoUYEp1b39I5ppD1c1IoN
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a848041 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iEGguDXwTU0lvcBalcwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180117

The venus video hardware on SC7280 is IO-coherent hardware: even though
the driver does dma_sync*() calls for the input and output buffers, the
venus node still needs to declare dma-coherent so that the DMA mapping
layer relies on this hardware level snooping to keep the CPU cache and
the DMA buffers in sync. This avoids the unnecessary cache clean or
invalidate operations performed by the dma_sync*() calls, which are not
required once hardware level snooping is enabled via dma-coherent.

Add the dma-coherent property to the venus node to describe this
hardware capability.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 9725fcb761dc..cc31f3ba7e7e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -42,6 +42,8 @@ properties:
       - const: vcodec_core
       - const: vcodec_bus
 
+  dma-coherent: true
+
   iommus:
     maxItems: 1
 
@@ -85,6 +87,7 @@ properties:
 
 required:
   - compatible
+  - dma-coherent
   - power-domain-names
   - iommus
 
@@ -119,6 +122,8 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
+        dma-coherent;
+
         iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;

-- 
2.34.1

