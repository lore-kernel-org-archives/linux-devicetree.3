Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B367383304
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538226; cv=none; b=dVYtTL+As/kuTuuUG2n4LKkvuzHFbrSegkNykSpY9oPn/ECVtTlWMC6SfZllUrY8ewytdmG64XPF951nguMH36U2Cb5ihEQXrBQ1kRmipB0Zy9SmMDtil+UAaoMKvX7OlRSbEQAsIa48Ym0cl8nzJEoQzCDCnm6NLSDj7ntz98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538226; c=relaxed/simple;
	bh=qFEjGgC4wb1fvQfsiuDZ/uQBzV5scQmb40bLkCfeBGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LF7OD2KXZ7GkOBLSsVdf+chEvDvAjOlZgARFsIuPDjQHa2Xg51KaFr94Ita5ExBYQD1Q3gdnTodkgPk+IhMuyEn/CiCGO+4mjG7pJwBKv0sZ7sjCbNCT/RQp0Ia2yN98sURJVgH2MrIHgGixjdLfEi4Er904GWtIGv48n01chyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKo9MRf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIqfFFgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKo9MRf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIqfFFgZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7LHg3385911
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=; b=hKo9MRf3/BMSbuvJ
	o8LINdzdvxd16Af2Put7T6zzZBBUBCJI1tB5ibOUFOhmhaLx9iirsACJRiU2fHj9
	mphD/eMOE/pybz9LFSFRLFTnrpfZuM915o42jL6vn2kmsrpO23Ap3NMwoZcPtStv
	ko/waX+jd3cegtaEimjRbEQ7uNwFH5raSxLj3ECssCrZj5QOupsqKjdRUPhshMEg
	76ECORk0L+sioTLrAdxa65fWi6PllGBYSv4ktJyHsm0+2gxquJ0ZDC2pDkDkFbk9
	c5NDnqy6nCJ5L6bp/KrXE2hk4/y/eSiVAgS8OH8rjFHyMM6/Jj6DpkZuNJVSM0U9
	7zpX/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4gevv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8276c91addso1268773a12.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538222; x=1779143022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=;
        b=BIqfFFgZvNg/TFdfSAfxF+EPD8RXCy6uKdOEDUsTkOS6SqpjBjI4JdBv2Mz5BXMThc
         VjXU9bib1hWX9rBPIUpvo8bl325KxnAjZnADHFtBI1lXwgP/xA7cp+rrgzNEq+UsNwdx
         SLZGNZI3gDiMOzwiVqjzN9Rkm5aQpUyIU7KqLWMmTym/uqaqJTbWuLYVHUPXtHGUkaev
         JWoWHjA5CPhPD7hC5KNP+bFLLkLqsfflotixTT657f4zELKhbIsUwhi492F9wOdufBTh
         y7er8CsLO7ZOCNMVlmZLVWM04eI0s9hfvwklQQ5vB15pArv/JLFKhLIyMUWKgucpIDUC
         azCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538222; x=1779143022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=;
        b=ZwskOF3C8fcjcBLSOKdC+SzGkUsVYrMXuiqeEIqsA6gx12w0ldT3mHBhEJLEi0nXAp
         BsAfU8ew50V2A/HFtttaYrAfN+l81suMlzQuFR9jMzD8daADcHo0/AJ1H8jO9pchkVVs
         RrlxJvCnXOx6VAc0ANgt6MhJaBRWnsDl5LN+UMaWGki+F8gN7m3Lh12TuIrXjnrLRo/m
         YGBYFu+wQh2O1ToHYojUUyZxqPQh9bThMBtkY/XZp+2OlbPscgtP2axS6PhinRpol9EP
         gFC6BwUvKChZUsZVUz1g4g0HKNJGmfkirpvQaqHhRuJ7a57u6G+kNgrlWcTbnaH4OF2c
         SplA==
X-Forwarded-Encrypted: i=1; AFNElJ9Qbh2+XgagtT9l+hV9UNxu7HzaZ1C2W1W16sM4/pZGEhf9ufia/xt3gTTpRpfWbO29AbS9dEfArijB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1P9eOIE7HtyLBwFV+057hG6n34gAJF/fimSJq+MUYMAFHQv+U
	EqXh7N6VNrVZ1iov3VLYp9UQ5C1xXIe3ET197X/uDpPfOajLmhSx7x57SndNV/zkCBye8yRiPTK
	+sM4LPNN2yzPLTrObjpzJGpti8cE1v7rtkPYnCanGVeQc2Mxrq1ZEvdPbEx7Li+Bd
X-Gm-Gg: Acq92OHtZDiJDY2Aji8tRU7yyf61UXaiu9rwCAMuiijHUKQqLilELF+vcTDUJCcC0Ja
	ZOkrmDw0Gow5lpB0RZQ4IpEjejtsqJNAPkdzDIRJU0AF6sz7N8G2RLgie93Z016cCgNMgRBvHhv
	plQAqqEioMs3VKIwDw/u14rsFh7DwdX6ArPJUPS1GxT3mEIHvmyaCoDVhbVgUzEqykMRKH5NWC2
	/vWeYpnENg7hHfJepacdkgj/uktns2W7oKGGn9skbMenmBF6LumU+WdelxhmmQDmew8ljCbHU1r
	AxZglU+jZSls3X0yGJGgDn1Jy8Abrz0fT5s0k2ysi8KGtwWXiXP0FltCNymkiv5g0lWlR9uhYaT
	Kvts5yRR9RqHtXrri/Se6vt2mGhtxqZ7p8ZvNeQfjxxj2MA==
X-Received: by 2002:a05:6a20:12c5:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3aab12e2f4cmr17859594637.4.1778538222115;
        Mon, 11 May 2026 15:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c5:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3aab12e2f4cmr17859568637.4.1778538221662;
        Mon, 11 May 2026 15:23:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:15 +0530
Subject: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=866;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFEjGgC4wb1fvQfsiuDZ/uQBzV5scQmb40bLkCfeBGg=;
 b=63jkHzMyfC934McaMS72qQzI1obDzNntWJQBUz0AVtE273amGFUWx7fovSDObmw7m1nz/fPSz
 r8jcxbe20XFBLRx4d/OizdOTrANdLrOMhCUnnVRkTpMBeNetRGijKeL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a0256ee cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX/i+IvO2hXKo4
 wo2wBdmW1xNvbTnm6PWyhfmNmeTdn+v/LZ4/LGmjNSIz6+OeXls+hkxHrtI14fMc5PvSy6MySua
 qA+Ad8BMuVx6Zw/GQzMKO76/dK/fGO78kN5BzNhJj20LvHnZl8kwp4JjIcKPGAL1mkEb1wwJtAd
 VEqFRE/4AhAvMSQc11LHG8QoO30fW3040HO4X+6LZjkIH2teQrcQ6KcWI352+3EloZEXaq8qOSw
 /hWEV1M+rEEW12MjLYORYtyGtj6ifu61DTEpSRNgYhV6laa0Cv85uXX8UHk118ZW/AqfdZY1nnn
 1HBf3pBZEk0SNg/4RKhKua/ZFFhzTe63yLXMl/4CnEbpaPkLdx0IgEVN1WbA+6AuNXKvd8HF7Fi
 ijIGzkvaPdsysaE+JWV92T1XWwctzQQtfrO5UYVMRHGWJ6DrTiIup/t+QFb/X+2WYYS5Y0sqI9Y
 ddpta/vcJ3HeW8UrjGA==
X-Proofpoint-ORIG-GUID: KbGyYwYBtYduVBxKBb4yGRg_UBav6W3Y
X-Proofpoint-GUID: KbGyYwYBtYduVBxKBb4yGRg_UBav6W3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236

Extend the sm8750's clock description section to also cover Kaanapali GPU
SMMU since it uses the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index b811ece722c9..d1330fc0178a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -568,6 +568,7 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,kaanapali-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500

-- 
2.51.0

