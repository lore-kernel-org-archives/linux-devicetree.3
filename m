Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F73EFD19
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655465; cv=none; b=N/Q8v03KQyUeoo+FBIFTdxjd+NwNzLwjLS9VOYb573k+ngntPAwTgvQT+kh0Wx0sk9f5cgpQpzMr3K8cPf6OKgtv/YvIACE2uExDm53siA+f2g0he5/Wt0m0+32xoJbP6i7M0Nzo2zEEox33vKW6Ayp/26qtCEHbuhYtiMM31ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655465; c=relaxed/simple;
	bh=RMmUS7P/YYJG0642552czUXuROi5QP98DTBmTl6xcyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCwC+yZD1cXxZHbOsQKP/0Qwed3u+6mKy5adZYVOLYznW6w4xU9ce1bq+3mYbQ+B8yfZrM4IXcvvkd9hBwabZLnCX8n2YKJ8o2XVd1mIOgO5ZcSGDdMTMjKE7wi1z4uvk8h568luhUq7aQ2LjG7EjnhtUHYzPnd+ta0O7FJp9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETLFdJ6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWboyWYD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETLFdJ6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWboyWYD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLf2Y625440
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmchRiC83pBOcYN2TSRxwkiX9+k/o1bOWXi13viKPWQ=; b=ETLFdJ6fP1Hefpbl
	Jdq7AqRBBX/W763Nu5RWMHzpoWdOWnwhh4XRbyUlPxa9HuwzdEHm7uGDI1YA2JqV
	FVM7t73Z7rbSXP2LwP5invX82BRi7M7s0/w3zMicNHkiMFN9bY6SG0sH0uKF9He9
	c/inB5EsRjEgN6E91CcA6aDnWQIep3s5uivovA2bH3rxu1NAsuWZTDQEwjIcW6jH
	gpfN3cYSEkeTvTJeH4Xe7sJ99CAoKw4W5Vjt62JmXTpaEmUFzjdJGoYF3nOx4xfP
	XPwkGIt1Rw1JEzY74FCt+Qencw/iqsQbGJQsE/ltiUD/7C++38EFjBWCpFxmMsSH
	BwI+4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc45bfka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:11:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f0e12d375so1239295b3a.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655462; x=1778260262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmchRiC83pBOcYN2TSRxwkiX9+k/o1bOWXi13viKPWQ=;
        b=EWboyWYDgqdFSYQF17LMNZANicnJb6TAvfEcWXMMwnU+x7hJJgB8AdzBKKssz2mt04
         gk2eDDfkVUXmsskxfUHXscZTqpweFlamLI+e/hVuzDLtikWbWvvvXAVfBbZxUmPDQN2C
         kBakfHfUFdVJUkw3AkitA0k1xa1aNPECjb4QBSRj2e8mQg1kVzb0XWT1BntVy+dPb5zx
         9x68pxlGza+9A97/3wru06qERjArMfyhMElgBDt38jbiEDP/ibIthyr0NOq/pScnT8RQ
         JQFqkaLlAr8cUPfUx2CQexTTmdbVTHFPVoaC+ATiGxfJwBU1xnaY0x4jQwseRdyFZ3ja
         zCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655462; x=1778260262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmchRiC83pBOcYN2TSRxwkiX9+k/o1bOWXi13viKPWQ=;
        b=SEoeGq3ItkpXkIkfmbvVzIrLsZCfJ+21CRKNsu1xIkYexGXNjk6w2m4nA/SriWH6qp
         8ji1Z9RLTAiNL6pyXAK0uzSAd7TZn0zxYYE6APcF3rNtDrsVx/vUbRqePH4Uh57MNGIz
         iNdORsHnjGPd3ztcTmOk4SCype9aMLhSK1623AL6WzlkzlTEIGW7zenutxdGSYv7SPkt
         ne7BrtRM5HItNWt4jvQPAzkknwnVgY8FCzhDHzJ4NAJG8HR/Oi7s2Vnhf6iNQ70UCWxm
         jwbcWskYnae4QDkB8QYzwVXyvgqJX9ijVvzTrHh5QD9tf6CKp2l1IxA9FT/G7f4BzrXf
         wV2g==
X-Forwarded-Encrypted: i=1; AFNElJ/YUG+zpfeR1Riua6Xp35ZfszYPt16OEd+46Uida6dTM6d/3pTevWaVNSvFdPiWx2XuJIqZlmwjs5IJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzl7SZCm30S5jzPB4XpLfc13Q4XGda4eWc9wpoz8iqqQVHBB8
	FDjD5tL6DWngB9FcOMDq+KCqepDuiJ6eiZqKHLvBoo2onSSkT0164N2F7+p9ziNZzaDWQcLegXF
	WgPQm2eKBx7RBVxxighoXiAA4a/q+w1N8EHRm9cScm6uWe8QMSpfzxcjebwwuhAUZ
X-Gm-Gg: AeBDieskO6ptHvNfnwxXN9a6zsB1HuK6BOoZUz2gEqtvArGVmmiq3rTRRNY7cNP5WFa
	77/bN9xv2hjigMnVYZWIzumoL5E22EWCTSy1E6ZQehWs3cRp2KpKWZNby7dBa2j8TlMiwfy1fEU
	qxFHZnFUtuq72SbnjwxejudRp+AnukF9qGwISLktOYGh5Tqns0t87X1i5kn3lo9WSMX45gM+Szi
	dMLsqfRuUKA5oLT6tWo9jjpyfM+p+39VO2FfC9HtfQGs/el/ZgaQK9JVcs5BoOqxMD3zC9Oyd2e
	ofEaz2aPr1ftvgfsCfdLGz/QPtyrBLGAYVeY6FvQzaeCBLeC7ZIsWL/P8Whw33t54niLSNU83aT
	dMdRA/lUAZLdRqTiZJHhn0/Gz8d16XIoEHw4PtfZ29rNyyzvrJCEcMHfh
X-Received: by 2002:a05:6a00:bd0e:b0:82c:733a:697a with SMTP id d2e1a72fcca58-8352d1a699cmr95802b3a.17.1777655461735;
        Fri, 01 May 2026 10:11:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:82c:733a:697a with SMTP id d2e1a72fcca58-8352d1a699cmr95754b3a.17.1777655461232;
        Fri, 01 May 2026 10:11:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 01 May 2026 22:40:37 +0530
Subject: [PATCH v2 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-glymur-gpu-dt-v2-1-2f128b5596bb@oss.qualcomm.com>
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
In-Reply-To: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=1187;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=RMmUS7P/YYJG0642552czUXuROi5QP98DTBmTl6xcyg=;
 b=e9oW0jAXsu6wgIxSd+1FdZ3vabLA2IjxuqyO67ysdxQlJ6Ged4eWhCTqoiWteZWe0Sfb9EqXk
 ccJtt4/KtffAFXlb96jPtT6hCjWi2jfud8USwjIqwKd5SWwWBC/wynu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfX1cZSnRQ2Vtpy
 pwgD0pRH2U7qRjMtUQhztborCWZapsk2Lc9t4Eo2qbgv0X4fH/7iiAOh4aKL+s4Hfhul4tIPXP8
 ptmGe9fBZdhbc7qhkF3Hjldu4RNcuTEmpmoa/o3Rlef8Xey/wiLX8oV0jaSiLNH4ZVwgSojM1Kb
 4XwZsMb3Abqf+jCJAGLM48XFi7jszpUZLSlhjESVSTLtQ3Y4tfvfv1ZOzdiR66unpoja4F4keoV
 hF6iVLC9b8c2KsWqts3afsfX/1t6TPAdPixXNXJuVlNpBkoQpwgRAkjZA7Vkaq2SPuyXiC9BQ+F
 aWKNv9uhzaDtDSFrxte8e4AdWwStahCQ3V+LMUuS7gsatJRwYH7G92wERoCsC/9tcG/3eWudDsb
 L37DQ1PqBExlkNyItW4dAX6YR7AFAWeug8GcWrxilnpB9PHnXTI0sY4RpDQhhrDcgNaSIYdCHQx
 VPMHLxsbc2TWKxGDSvg==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f4dea6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: EFYEhCE67oSXN9207FFc2YP0n84BQSjo
X-Proofpoint-GUID: EFYEhCE67oSXN9207FFc2YP0n84BQSjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010169

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca19d35096f79f3aa958371d46182c..bdc8e6fa53596269854540b30d7540a21e7dcce3 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -434,6 +434,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0

