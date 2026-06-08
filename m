Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31032B13E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961827; cv=none; b=XYBprkoKg6WWIkkF3qq1Y/9TF5vL3gU655yUnKy5m3cMVPUuvexpDjuNtAjCLRwEh8v5c2LNeeVr4+2rbvSpLSnbT4RbasdpppzGAeQUsTTJ4D/8HHW5fYAJ9h/QeBPHRVBFK/qaW1KKe/KTswGxCAkx+d8NKAWtKcCxTyNpyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961827; c=relaxed/simple;
	bh=GJtCaUAfxOpYNaqSyjwj+ayQdmU2jUnlbzLJbpgNafQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MS/Y0PBQmbAuQtTDkm32xI0Mv7WaLmanKwwCoxO9543t5RQKuQq3FAarnQbGuZOXfeNZg4CZmRMMZu/kxiHQuTYmCmRROkXijcHoIQ9UtcBmbx+ldhVk3Xsqt/YNk06OQJzCqaAz9jGOdk8bwcX3LOYqslxJ8cv+JTTCWfXeNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcxQcO1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHAhOJDT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcxQcO1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHAhOJDT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NDbuK408945
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 23:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVpi8do7RhaAMGVQUssy+84jr7LhWyRN9eNu+bS8Oao=; b=OcxQcO1Uuw4e3swz
	NlY3JZyXbDrM1/mfggOBHj3FDiN4DMkx4A+mtKP98hJneL2LOy09+wTlHkmPo1Uz
	QV1Cv+Cc1TQFBDUckHFg2teMioa/Xx4N6P/2fXtBRaFIuFVVkvbN7Y9ORR1NSyW4
	rh3fBPIszwHyLr2ss/49nhIuBwhRkqp8m7rm3rmmsZkov2JBUQgug/YKkyZAYcL3
	Y56MwwAclPQe8X51tMAwfRZgLXg6u20iKFUy4TRMzMn1SmBdhF3iXtpBk7Qu6FB1
	m8xXXKw7Je4fhYGTa5eTKuTwmbhXXJfaG/1nAoFwlRHeTVLCXVtFVJT6Xr234itB
	gEwPsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunabdyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:37:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so89597745ad.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 16:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780961825; x=1781566625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVpi8do7RhaAMGVQUssy+84jr7LhWyRN9eNu+bS8Oao=;
        b=KHAhOJDT57YPme5iV+3a1AicBHWw9FznBt9iji3eBCOXOCgsnClmBrTpt+2nLfWuNV
         lHKKpWRM/TTGTvhzwPus+67LRb1JiOeR43lMSIaQmqx0fC2y/rT1XLfonNuhIUJVglyX
         cUhgmEFABHaxAzm0kcsJ0Kmv1E1PanpqguFXE8kjKdrPPhDEsmhtmPwW+Mx+SMIek/7B
         ZvqPz136htcT7+QI7/qm2XYrPYQrIGfvJth0hRR67tzJcQICBqcaS49iP4iSOIhfUnzf
         0uYVGmhHGDyXFZi8bFeUogX42QcvIsmMaUCU9grOpHz9Rx6q8jhqCrq5Fa8yzZaRwvMd
         R9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961825; x=1781566625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bVpi8do7RhaAMGVQUssy+84jr7LhWyRN9eNu+bS8Oao=;
        b=Z58Ycl6cKSZRj3l7WsFdaWfM60YQzGp6EW/1+l8k0mVWuE0VdjnUjmKWCXurww3pWd
         fBAipg1BvWGkMtWgOnDKhVeEgiCgqwKzAqkG08jP/910i04Zf5lsWqaxeh9goGaDWqAb
         VghSlKa0AosNrC1gyXzeLolQvc0zlGqXDQojx1ylEg8Pn/5R1nBocd0ppbpfuI9vvV+A
         svXCM8QM77KhF8ONomsEiN7ulZOrHrp3qFqUt4vn9/5m8B5nXeQIwNQab20tVaKycfNK
         aJ3bAYaM0iCAirqJIlxQPahttJ2ti/DoF9snn9ShKaT71zBjzu/A/mSXFANlrUyZvv/2
         BIGA==
X-Forwarded-Encrypted: i=1; AFNElJ8NIDIg1N4Zjhou4I9tjN7vxgV6Gnf8EygtTIrkMRDW02PnTA6F3N7cXkBtgP1X7kCf63EwSASKYCKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YymXAC807H+qyHVVnze25NCrlAUZ+g2RBlbgu8c+4EjaotYYgm9
	lkELUl+IjXPRwF/3p8IqDnfsbR8oF/i4aEcBTUYtkLukKSCKfEeFwr5isFgFVwEBYdAomSywR9G
	A/j6MZyAz8B7jqw2DGRyj4UT5uVmp3+kjotRtikr0udIG/G1Cd7BMSLUJhcUV6ysn
X-Gm-Gg: Acq92OETc/kAMKYsuSF0V0J/5hzb4g/WBlvXLu5eGZtCvKfvk5DPXucRseE19w9OoRI
	13T71skAdtGRm1glrK+ScjOWwdc+o272dDwJ+2zbI3a73TiZrgt94y4chPF8tkWvEKxIMp3Drx6
	rAaYZ0r3YRZsOtMizcOrdcPOMXt3sl438SDDqqQpb67akJ3uYNZzbOBrdKqOsOk7hX3rSHa7ijm
	LHNvCB3ITHNqnn5NxFEqvsxkb4vhCIe2i2xlUB2C2NnbZemBmnM5QV4SSLgZdzAzvPktDKggUs0
	pm30dBKfp1Z0EEyuvUYz2cQZC4UVYaWQOfKBQ+H9aSAsy9wPnSPCBk+UCAARkWuy+MwI7WUwCwa
	i3v+DjNdbSe8F+BwWKQdqOAtoYzO/Ns1TqcBfN/gwV5+If32Yc4x/8IsZ
X-Received: by 2002:a17:903:228b:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c1e85ac3e2mr205206905ad.32.1780961824867;
        Mon, 08 Jun 2026 16:37:04 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c1e85ac3e2mr205206635ad.32.1780961824482;
        Mon, 08 Jun 2026 16:37:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm66206975ad.42.2026.06.08.16.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:37:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 05:06:30 +0530
Subject: [PATCH 2/2] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra-gpu-v1-2-9d0e09cab115@oss.qualcomm.com>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
In-Reply-To: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780961805; l=1082;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=o+EGLlf37sh89ugeHzfYo4ynac3l8aLtWkmBK6mfyPY=;
 b=WAHARlB/kFp7nJ5bwD9czp03Zj5uOELfpNZuGTQLexVSi0AyrJ8BSNj0HlgSyeHUAjYdqC+yH
 xd/nwL+m396AraiuLibFrrrja0zVM2Gu1nklO/BKVSCdEm7p7eTraOI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIxNyBTYWx0ZWRfX3MFJSbZ9ndx8
 IEnwqHdxNWKGkg/Ab/4atKndF+p0/fz5PsA+cKwLMW1rYlcopmv435s6/R2Ow93NdQ5nxu9q4m3
 cCg/84jVwywuSwzwr6ajRtWmp9MnLWBfR1bFyLU6AZyqSt06rbPp7XaSzjXFd4UpLUwbgCdvyHB
 bvxcWKewHWfPqez8FdItasZu3IATp5zYvF3JK7cRdeVKdW1nDsMEBF+lscHPYBV7CjFSjlcSw8B
 TCDAeFzEmeMy95YUVRBNXgcIRVAN+ITr3577m6M4OMEOEsKKpInZ6VJNftR+hYk6V84mGYiF5I/
 S88U1oqRCRLkytWOmpdFDrOx0XQ2NYl/j34dJUB9jeuIemW0meor7pBXMWc2JxzOhO6E3DN/+qQ
 k3CFdXwLpz4PNsC/pRPez9N6GkhmOvD502gbjVvmObmImiyQnLuhQ2Y+RCWlSxMmA3tpYEyigDv
 AAUalSSbrQQK9Cs0jcA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a275221 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YEJLi0fs0cJSoZ3QxulO-4w4I9vKnOcD
X-Proofpoint-GUID: YEJLi0fs0cJSoZ3QxulO-4w4I9vKnOcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080217

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
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
2.51.0

