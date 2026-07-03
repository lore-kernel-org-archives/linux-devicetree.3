Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2A34C9AD
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110938; cv=none; b=hJ/PYPzdlbbbWQdUfPDdWmF2s9szggzBX7ctoKOK/IYUh6lFDPkvWnooM3x7Br5Feu00b1tvWC5l65XKrdaTzFolIH7HgG3FiEtLaKWu4Or1KDKLGdyT1LLiSOqUcIqgPeXr7cTIwRKE36TlAu8qYovNeiZz7kFx3EfXTVMO7vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110938; c=relaxed/simple;
	bh=49NOvaGVwlvi581GKoxSpuUe/4IKdws2QDL7UFNjgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3olFJZZ3KpMOt10Q/wMdXksCeKcC/o9zJooHXs5R1zlZA6ZvF94TMazINyAfSd4vEzAfywkfZCkDaFJvF6s2PqZUdIfKY404SGpPhYqaLGJBearvDh6cjiZkneXY7n+wRq1SnqkDCH6RJWROgbtdeBmBsa9lPeGlJ/KiHAyMHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QK0bT6ac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSxXjDQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QK0bT6ac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSxXjDQ0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPSGT1039983
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=QK0bT6acctMmVRcC
	2/da5Pd4TXGhQi4kOuWThCPpHrSeU90ccV7oPPbEG/ts6Xwajo54zSQS7shMXiVf
	z90g5tuSbTLKlK0r+3Bpt+Woe9V5rm0OQMqW1zbBFCpaTITAsTBeFZKUTBRXc3gp
	Aw1lsRCA1j+A0wJ2aPqhSjkvjzJMR15gBUCHJhR+RE+axWX3+lmfVbNZqPEIqOgp
	H+Tns85ndROt4nEsfLIYKbPGq5wDmrxdCygCHlpmYqMJLkN11fX2/PAiTyptGVyH
	jjLA5cauqLhul+JvsmQQ9I/SwdbX4KhLdw+fMl+mkNOZ1lGTxKMb0xKH3N9PiM7R
	5p2wPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a9bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:35:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1684792a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110936; x=1783715736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=YSxXjDQ0YHUkzl+Yi4XazWpJzcS4aSN4XgpeBJVfOLQ12VV/u7mZkCVxWGmWI8iOUR
         2Xh79PuOonVqnQuRq7/DT/0ShrrPwU+E53e6z6RvV0lbQX+T1sspdN2wm6oX48H9rU6p
         C0EIFyzI5hPWTCc6EETtI90a5NgyeA+wKhTr2IsAhGoCoqfi0BaA049oHmFP15ODpIs4
         nZK3z6E3nU93y6AjRqltr+adYCRREDeb3RB7iHflpbUtX0oSXItb98abLptjHvyKSzFd
         GwpbbHnlYsxuU1hjsY6lVOEE6tcEFRUE/fMDcVkUPTW7ouUYjw9Hr8csnW5uGuU8X2OX
         iwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110936; x=1783715736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=BPiRNDXKs/KVgqpvoKB0X57wlQPxY29rcUcONksbhAcuMpKKN7YQnvoWOBZcGdK6QL
         D3NuA4jVkaZg8m1kjRsxuWLZPAkrc2ZlxZEifTrm3darK+e+I1Gc6ws2Z72Dh6DO91JE
         xSx4OImojTcyM2onHC2OO4wc/mhVyFqSuEXRGorrCMNbnf3tltnHHbwd9swrPBP4j1CO
         w17RzhM4YinWZEjpiThc3qC6QJjQLGAKRdwxsCKCbLz59xDeY0erpoiLWKExZiqx1AxL
         P31eOZqH/0H184fcTGOeOuh6c+Btf6XFz2gtqYK+bcqFPoRC7Xpe74kj+N3yfHdyUvFt
         cy2A==
X-Forwarded-Encrypted: i=1; AHgh+Rp5i3Hf4ir1NrHt8W/poLIBKxRe+JUklotLfJbBVaPpMvsd78UsryXYkp8r/VNtpo9voWpD0JzyWlK5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/wQrNAdK47tj/bV5tZhhS/QpCJUV9STVjAfwmO1DYAdWXw3w
	+WXOlZJ90ARVB+IV4sudT7L3fTe+ffco7IV3+XIqwiVG8Fi2kKEO8Cl4kIQxOCsY2YkroNxg69/
	F71XwujOhCqWw7dHxaY4fWP3aZ7qVQl81ON/UWfOPeUTL3L023LK4KsmgOG31d7horJCzxG0P
X-Gm-Gg: AfdE7clSXH3oVS01Yu8brEen1PdrV809nn4zYauTcRKMc1Ol9MiajnOh8mWkmU/tKbF
	goyVXkEYgEdHl2SHf5Iu1ZywDf1lMVBlSomnPNY4tHyfrbBsmrsymsHHuJ/Ci99Dkc7t8CRxkUK
	x77SbgFRzvvlJWc0+RqmOhsKE1N3lABSe/ER3dj1L3EhUvgCrjggXGTn/tCvnTMF6m0sMJ7v+LR
	rKP85muAwS8KS2APFeRKTyxCpc8enf1akyxb9y0TJohyP2TWDRvbk5nnWYEgeKjTZVq9awzsB5m
	TGPl+4+3vgFI9KqQejE8IdKIDB0wDtBSrrBqDyGuMBRsw3Auj+hWZD3JAm2xcOJQ1OKkhov7uVF
	cmnOu+EwdN5pFHpCpGS3DR3LAM9pIr/9VaE4=
X-Received: by 2002:a17:90b:3c0f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-3829fbd7827mr851928a91.31.1783110935538;
        Fri, 03 Jul 2026 13:35:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-3829fbd7827mr851893a91.31.1783110935077;
        Fri, 03 Jul 2026 13:35:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:28 +0530
Subject: [PATCH v4 2/9] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-2-90cf1a52e539@oss.qualcomm.com>
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
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=cN7pn2+JEuwNoT9wv704PT5FWDf0yxNfWzcSdWVP2z7Sjet4xiZVOgeM2KvXBFueaSmGt4kuy
 CcHPa+9lH75CVOuJgzKjvkpem+q3xyNaj1NqF1nIpvU+/j/iI6FWZIZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: kk1530J8tApcW0nxZUSfhwrCdoDgYtKj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX4h54u6fYcQAB
 KrMi4241n6FfftxjjIxyZl7srJtWMwut5wBxMXa3W0b6MhEyoccNzCn4yZol92KnigGElM7BzPe
 DDC3h3DdlVL3pufYme6g9uBkrCReQyk=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a481d18 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX0viwG6fMMTpA
 28oOxHP+7JaLGj0txgDM5FcEm8uldEFfT0vZDtL0+5UelFvBRjLcSf5nXmCnUFJ2uC/8gJ30KON
 JlRpPdQqiYBry6ezHqluzTVpGIgBmYXul9+m+thC/qZBGpfbRsu9JW2X7XeM7EMDRcgZgW3526k
 66gzghQANDFAAvz5Moha9adPsnc8h1RtwDVl+4xTJ1mnnPYqwsHUZZR0bu+YqHMxrW8i23t+K+i
 iJOn9LMgnJ6O38lRRcxxXtjWw6vpghMWNeUWK9uYOA3f8D6xnYY8FwNDkAGRhrB2Ysr9rXBc2OR
 cd+4X1OfSzYAlHEaNSQQM2qHsWume7B1inYiUFgz9HECL2L/bc0DRmBvoUKMxAABgCxV1f09ujs
 By1y8bcTJbL23WZ1gbgDxWHJZYiERHSmYd16qI8v6e3sUP6anT8LE0JInjWRi1qZlE4CbDnB/oP
 HgdoEpcApYVk5cAxjjA==
X-Proofpoint-ORIG-GUID: kk1530J8tApcW0nxZUSfhwrCdoDgYtKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.54.0

