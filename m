Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D17F346FA0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110948; cv=none; b=q6KiglOh2V8YGF45fHLwdeugvciI8HqQg/NGY03bYM308bLpm+XbL38g8CcxC79nskw7dPz+FbxExeAwCFUWeLW5axlOgM1Xe1xMMzQL0F+SghiqAqmSEfnLhxKgq3nKCvC9FdVq3DpGXj+2KN4SxvvELhZg8U4S47FDBOiEpE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110948; c=relaxed/simple;
	bh=8G002/IxABPssrEzt3TqDoNY1L4MUJqdSn00j40u6ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRZV9u5LtwyvM1YF32YRjZhX6nsgMRCEP6KpyjloZUlwMXJqbw1t8MBNo4GvVCyxPZYIUa2p5FjRdZ7fFNSA1yBl2STnl/vy305mJcnO1YJTPje2yc1459hd0I/sKsAX+sME7+6YNmfu4+GmcwIzJ1wBYJggnkug4K7R6Ll7hac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OomLeSBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0xaUC+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OomLeSBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0xaUC+h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPJ0J889639
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=OomLeSBGdaXwW9nF
	k4zirJkKvIjQMNSCeeMHkgHg2Nu41+fTSH1hESfZCyqPqxPLdnBB6nyVzOsIP/1f
	npgRwIiurTWf0CEL6Q4jBVciA4VGbDTS9eCvC1/E1fOh+eaNJsRF/lSRshNXlsxB
	6pte5e140Wu3DOMLOzi5j74PoHdWQ+fRbH69UNzrVI/nOaQ/mRVRuorfoj4DlS7q
	aPbzZbNv8igCLD7FJa0Qx42Lwm2LKb7lsaBxh9pp95l5SHgjqdjWUe9cAJT0hmYy
	DSST4wfvfyJ8TwNN3aOfVPy66dRhq/kUMyzHieWnfmv0eXLU0R5jMx9FNZp2QMO+
	epyy/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j030ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:35:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so719833a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110944; x=1783715744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=A0xaUC+hGP+j1TGZlWTMu6Q+ZQoz4fNn6QYcI1au6x6RApzSbbHE6Xn8IhaTtOvyF/
         r0xb2Yu8Excz9ykg9zESLjpNNjZcHwfpTR9B4y4aEq6ORbQJdPg25/lRVb0pz/cmBkUm
         3373rhRrZNSofGMrwiCGhTO4NngqxuUQeO5p5Mf66pKLFgWu87T8kDiBYgkV1MkcCjFu
         R4QEjUjE5VZ7Qh+KwYoyHwXynk06uhDigunFre3TJQtkvh9+XZ+qGWwLZkEGGA3F/hAL
         0atJBfQVqUfs6v6apsYlzCZ+eCkfm+Zi1V0lK3Svem+6SE65dmduxQXXviGe0toVaAAt
         0D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110944; x=1783715744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=eAbQh5D8qGzeW8ORv9MNw1g2ORccJZ1tQZunV+6ed8E6YqJVzxIylezF82g214yXPg
         /P6CHCdeBhxIyRwJ0mXcCuhxsAam13qO4JyB5io53uoGjpKlphOt815jQ86MZXaoMIE1
         +xpIa1jpFc77ryyeb3mnjG//essadz6xv9j5ClT3YMy+Y69tR6EXKHtAC0ydtsdcj07n
         jZT64jZcvTqN9mqN3yYMYQ0KOr2jcOEdP0pG21e9djELdxaUcYifZBi/wewMc5s7fFOL
         d6tTIUqRpNf2OCmvwjTahwSdInAG0WauZqua4dsFAi9mFxeBH2JQ52g7bJd2P0UQMadj
         Dw5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq/QFfrEG+cvtbHok0eJZNY5x7jajhKObCuoLCYTPExsH0TWoLK++W3vnRuddm4ZHcarzrjwqTCGoAM@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdIkAJUC+SR2Lu6wBgaRaaNggulGShLviuGRyCBfFbJKKCnBX
	aRcG11+vZ1BgslqPqfL/sYQGxUFO7InHcHoyj6T5+5QYkKxtooPgycZcdtYUKgGFvVK0ABcPS2j
	8usl5xGGU7hGAorV4ohylmn9aonvHrceRYvkVotyMnRTkzY4ytm8VMS2d9Rz3VPvGXsgY8sgo
X-Gm-Gg: AfdE7cnZfMbGeFsx5NNXeZ2zO7GxDR9JmhGM2oISUdy7CMQlDHYDmMEloijmZrzjLLA
	dZeKRo6j0dD5ApLUdyZc5FKhGZw/gxrsI6SWNqLNWOsL2c8A5PLJwTrWrlyzsv+yHuriHENyeeh
	Ml8GFb+TeqCKFofW8mp4USsLboB/gNBjNrQ029YCEknfFOCf8vVwVsLwdDjPMnVDZ3y+dIYN6xI
	Uu9GoDoJZj2wmOnfh6WJnPgu4Wb6hWgkls+Qhamfc/m6RvmrTKHWu0U725fGIqaCnlaT6Tt3Iy9
	pw0ICNIiOuSIBiDOVw7thwjJBaXXZbOZYaeJ4nOQT2+at1wpArik21KL3hD0w/g2CEy814T9HVF
	mieMglV1L99fj3EfU+DZg7q02u33SsETg7Hw=
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr957989a91.28.1783110944162;
        Fri, 03 Jul 2026 13:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr957959a91.28.1783110943675;
        Fri, 03 Jul 2026 13:35:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:29 +0530
Subject: [PATCH v4 3/9] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-3-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=KNwcyIU5VqC/XQr4QH/U8KJlsgyT01EHf38v8j5tlJ2UjyZDi/yhU6ttLhTIayHlMRgIJ0PKZ
 lcgwcjlSFQYDI5rA10heEZb2fIAwdN9cVwv6HJVUEhVI+ZiVqtcHGSt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 6Eiui1ZRBX4lkI-P9QwU79HiSovF5-r1
X-Proofpoint-ORIG-GUID: 6Eiui1ZRBX4lkI-P9QwU79HiSovF5-r1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX7tpFgGCA8dQi
 dUrhILFgopNKYKDjKoGnP/iqlSJlxu0+Qmi+g2pMbWQRXKGA5dyuNwuubrfSZHCYOhsdW+Mtyqa
 5IE0bWVdPSb2RUoTHKnfHU7ooW9GH3c=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a481d20 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX9svpxyo67AUQ
 WXPpKwx1af6W2uYHRJc+5uSa+ct01gsF649dDdEnIudNQhq6b24APOer9DU4p6tnqxhp0q1RvFH
 picFFDE8svTpRoHozx4H2LPKyqw7AKAwfjTMIliiiwnDz/WluS0G+lXZlh8ZEIkfjvbgzDDqg0n
 v1nJzNXGSiBxjkaFiUPMLgHthuZ0UgCIMDwqvaKwcg8028VerKol9Ew2V0kRxJQF1EcCMNxJCVS
 EsEiho/XCu55DmoviJK9TN/pA38XKDGDwMsguyO8/YTXv6E1PFXjfiQJCxnOqYIV4WGISsDD4P/
 MdSyckFW9pnKtYjqTiCvvukYMKeU64Q57rPguRoiCEnbKeNZH9+UZJS6E+MaqHcoNUmnM6baIYC
 C9pXy6OVskSzQThomcvxQxxr/awxiSgCf1nSvP2R64Iq1PHlpXSqIcgYlogrdoWqKymmvL5R+o8
 EjKltb32rSGjnD65isw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

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

