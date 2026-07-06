Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E913328FA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371930; cv=none; b=WBPIrbhJGWrkiH0p7hBO3Fr4XKh0KEuMyuKyDGZrPxwjTurtVxWtmeql+TAS5bASEVR9VA6Mitw3zxL3b0N91C54o0tfbpM5QUzT5nIEjzdINRCHcm4/rcaajKWQNNpDJF37dNkUMDUCEFjfmBDM3STM+BL6sfYEDLmNfMSnDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371930; c=relaxed/simple;
	bh=8G002/IxABPssrEzt3TqDoNY1L4MUJqdSn00j40u6ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7DBUWHXBtjncsF9SCSp8fIbKSyM3k6tYyuN3TQIoJ5rFh2gkrZtRvIrhPrrR8x88Sm6dKJsduXMyQ5Ya0hZhQ9c49K5AeXWmg+t/V7jlf0LEXwFcNb/fHQmfhyD6DFGXFTwm4XbxUIX9fl9zrTP2BQMmhhQi236XWOxAHJIJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nfe2e3kB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZWIWu8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nfe2e3kB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZWIWu8W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE82n1654887
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=Nfe2e3kBjn1flEcj
	9fCTeI8Psnisy1AXPGc3a2t5QPCx3o/OX4aze3IGnGTLw/W7oHQbVFny8/lWiokG
	jBNGIGUimQ98xkXAiv2AOmVBNnqF7X780OUA3zcJwXQ5Y/2mUEBO3H0Uvg6SHVeG
	zpS7ooPd5lUJ35xhwjS2anhkpvmI8Ng4uGuFKiaDIWGk2luoKo7N+hVyo/2hzOtY
	k1ewLJsHXcu7FzvLbheLXOeJXBH0Q/W5sC5MA7E6FP/hJ9/57cJVE/U+UD0erleF
	zjUhO2/MQuszqOdM262shEHp3EBhx/GorCp/N/+NNfgiBvnPUq2+R2V4U4T1nQxj
	Jj8LEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjy1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:05:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98136ceff4so5969591a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371927; x=1783976727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=XZWIWu8WjC/V7cnnuqo+Yortscs1iWqEBxT/Tm6lC5v40JnCdh9RdrQaOPobnRVNa2
         7kAsRnyCWn8jww40A95kdB+qPQRoAoYDlpRyCnsWv8VinEaOn/RqZAgp22/Sr/PTOYzJ
         gISPlVtcMbtzOpI5n024SC/Ztsi0qa9wnCr11FIpbDqyX5SgjV52ii5TJz0Wy/1XlkeQ
         JLOzUSLM6VyrPO/bh3ceRl4GaP3UJrfTPPBdpy7AwJGXByKzcKarNB1g0nMVdU+sewQ1
         Q+hNIx1Lo2puTx6CyH9jO1yyy7uUOAg7NgaQpRIwayoynmW03jOPL9FQGtgrtl4C+hRt
         /jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371927; x=1783976727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=hIj25Tj5mKqGMPKaC1oA66+gFtrt/HOd9pbFQungpmnsHJqDO6PNB+E7OKZAPiLWlC
         lIs1WWLNV7xXJlNh8zrB7sWdiKFkmXOQOTHOFn5k2lG4MWXVTk/L+SFNv4XXWT+Xdg1x
         5fws/4vabapMfGkVD+LGMhmMRJPwK/ecIqjE15SW4tJEf5WwZD3YHOReyZxLHny6kx1x
         4rZ0++I1tlwT0fZBzmbLuobBbZh8zSPEAkwbG03bB+lRVzWi78vn4gu/dgRpeOsodkct
         e2b75bU0NPWCbCasOqHlz0BNA12BLhnbztiGsclWBs940aUYwnAmP4YYsqZeivXd8XOs
         o+IQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSFWuhjUYFU7QKU9RLH7ogVgJDwzkiftzssG+JgQBK0LgQZaZ182LqsRFFHtDY94OBqYJiPGrW7ljf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3v1IQzea/IpvE35icPwno93nroXusZj9TnQzUGwS3UVYIvnrY
	XSetqgcd1A5LpLHkDqWL6jzAL59HS0YQsT16bF3Bcv+SUHG9QbJQNtvp7oKqhktTKorYWoa9g42
	rQeqFIIruMYB0TrS5gaT4jOdpbjWk0ag5ZZLVXymefmds82zLmNoXI9VxBeCUkqW2
X-Gm-Gg: AfdE7ckQ8exccG24Xh0tadx3TFR9zBVvijNQ01BlqC/rVrxg7qQ9XqrW0KPzWZccmFZ
	rF4cZz0e//rTf8BF3+REeIY2QMIccVWZHhgNHmonxyHBRqA1Ca0Fmkj7f7WNzDa4wsQYMshE3IV
	Fc0aL54khuj511ZWo8/5JvCj3xXk9fEhmc+esNTwqwF4D+HEVLO5xobcF7OFdSUq2ml1rn0bQxh
	PPtHoGvLMTXI0vmoLRA6JhAnnzGzd38cb1LpxdxQn37LNFk6Ro2/CJboJJ5Q7xrsJEy7dDSw/Aa
	g07cNlCKqZsfEIxTvxzU1P5pVIQHkJc3PITrQ3y04tBPWh5qqzNGSaQ3MUUmIvZPA3/GFiLHukK
	vg0FfvdlNRr01g6u/DcR3X2S4pVjXvt+5ScY=
X-Received: by 2002:a05:6a20:914d:b0:3bf:6c08:284d with SMTP id adf61e73a8af0-3c08ef83fabmr2831642637.60.1783371927249;
        Mon, 06 Jul 2026 14:05:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:914d:b0:3bf:6c08:284d with SMTP id adf61e73a8af0-3c08ef83fabmr2831599637.60.1783371926807;
        Mon, 06 Jul 2026 14:05:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:35 +0530
Subject: [PATCH v5 3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-3-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=ql7/qNujURK5g0Rtx0oRe5F0EU5W6LTR4C3UxuwOB5V3LYSyWrfhLBHWlDx7ojbZZsimC6+l+
 g7ggaP35tf3BZydN57xyWo8ihHxk0MOvYi4WuQM9x3G919M+PkRSAFe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c1898 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: E4p1RBLoN_BziKvpwRUHrzF1YGyI9ewF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX7SocdEztj1Vc
 3aEukQniaboy7ZUbS333gt8NFupKXO99SrFL4Rwda2BHbjaUcg1EZ9mLA/p6Brmb8BW5eAzDBnK
 dbhjneZNFdaaS7upF57ijFFxc+1YiHbKcPCg+bnFbYfNi2tpHqWBGAuAiUZEmjsVz2ZXcykvFpR
 LRhL/P/mPevGRRLnreccss/Rss3UY1W2NFJe74beQB9MkqI9bHKgWtmmPxLrFaTg4qw+KbZMWin
 0/S8WgsWJONuHZqIv4joEsijQRRmsS98gGhQtc3sAxH0bskTx9NnT9Me2mFYiMlFIQ/8/AXroQh
 8xVTUkzvJznmziF+XR11tBJgU4bToMWlIxP9eQYS9QhS708bRbCThfmC37MjFMK0aMA4q6y1vx4
 1n6EFzNyB0CvpC9QgilF7bOfvQWyQkNM7mb4C+/OWJPybtnrdv4Umb0kaMMt+8Nr/4r51MgGB2u
 NasxmQmG84t5xeB6QDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX8OtPPuu6WCkh
 kbT4sPZJVN0UF90+74dI1syUUwt7wNOItGTCQMIAYfJ8K+4CmcWGyzkeQZAtMl87MDIb2UfbiN6
 L7aGhuPTf4AIBerME5Wf6wWd1bA4Fg0=
X-Proofpoint-GUID: E4p1RBLoN_BziKvpwRUHrzF1YGyI9ewF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060213

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.54.0

