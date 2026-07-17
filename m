Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281963A1A55
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320921; cv=none; b=rBCxFvET5wRlOdHdzu1lJYDDhm2Coo9wuO+erfI6fZwBsy5S48DiambS5lGBYRrxYUFYJv2s/Usi3yshS6agELpngpz88rd2M52xWjybgr4BjjgtjkDqJ2U9yz5CeEEIy+ADRhNMH5iMX/E7ON3TOFv2gnATLIZTS0awviL7sP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320921; c=relaxed/simple;
	bh=9inCuGVgbyRRoULQ+mF7qHPLQIcozjf/f8dlewYf790=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQWuWt+LYagncqqvvBUyweKGxL5wnkmSv5e5QOegFui9yEvWo+e7djQqeVuxTKeyigxOB7H/4IV2RH1rVSEkntIc5zvlATnXTAzVXLLzPASnFiweIjIAXsr+UhbgN6VubHkDM19ch3JBDIOYClrooFYBEzGqlekozS/l9hFc3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHl6nAEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmwmrwYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHl6nAEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmwmrwYI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtM9C2619408
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=; b=ZHl6nAEWI3hupkUA
	RSklRR+dgpPQifepZ+uCiNbc/lwwhV9sXYZ2JsPr4nannzsEyudc3hLYcZ+dKuRI
	fsH7hrYvDaOmeHqRN1YgIx80p6Q1rdI9yjYvdZ7a2Caa4fh6CyjWvxPOeT5yDVUz
	o+sUhfF6o3IAP6Pvq5sd8se77yVU6+f6JMM6yQZFTJFbeCDZ+k2zsTVUg3HZ7YA9
	/PwO/Bm1jSfoKDJIZhaWnAQQaxb1nQgF4ZC56/+hAtxgr7QpR0nfmWdxqkUtSIfu
	pgcSIm/DOf1yW2S3XozgVCwOiUlQWF8VRSqIANpYJCMuvARJFOa0zxa3yQqytlRF
	GZzmvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagb6mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:41:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so11461745a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320918; x=1784925718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=;
        b=CmwmrwYIG2weAV8YxRQo9VFAePGd0ybe0x8NzQnfhEChpD4XgF8S8m5z7pS2COxCCi
         pS6KLaqsY+OzJvheMeg6iEe24++fin1SLM8WmBFSI+jy93OvBcq+ybVfQzgxpaPmAo+M
         7zpJ5f7hEKmmRJt65SNyg1DFF3PzD5pD8HlgodVnvz73JejaDCg/JsdrvEQ+Fl2C16RM
         Xi8iAXchNhl+Y/MahMGYr2VreTuS2Z84iMj1mZAYdPKeK5VHTYU9fB8glu9vr1yN6o35
         7i8Dmd/N7whHgr12/FY1wkbyr16uNDzhmAoBedA1nmEW/anGODAqomTioLHmPZ8oHLP6
         nGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320918; x=1784925718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=;
        b=Vw56oNddsgDtOafDHmbNfUTBAruL0uFIZQPkil6Zvs6QAlUmqv937Q5w69CiyTQlaV
         xjxRurA14b79S00SDRF+rxXs22iBa8HW5FWQvhrYUzajbnaYgwA9ugNMxqF7rJEr0ynG
         NzGMaH9CrztnZW9l6xLXd7JBN3Uo3XKmRdGVW5g1XWpeEfnDaiBAh00y56ZZVMIEs0Ws
         oHJUfa5rDHP7chL7t58TiRa4TfpQvTcDREH4vhvmfABRqg6z7/BnFxeCfZRLQkRNBPOd
         dTz//MeFZia4baBzcNZvrE7sRsSFTJyg5sHc+Fqv4+24+k+mGfjpHYhslSVuaUHlRmDV
         7IMw==
X-Forwarded-Encrypted: i=1; AHgh+Rqsm0jKdi9ZFOAD82mmQIydl+fCohvmIuGw/jRjzeYK+bxmHyUPet7tQmPmReKOUngJ96UFrwxlUym9@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaL6FNuGHjFZpcpn1RZTCqT3e8YAksAGP32GQRuz67UcpToPG
	yAH8ZD9ZMIh4jndC425MePoNAVQOgbyg7I/n3Oi8/DNO9UfjNkHPF36xPnftMkODCv7sDqGsKUl
	lHqfQaCDuaUm8VcToUzALIVc0jTvfcAvtYmzwFt8K4XuIpm6jD9f7yXZlTY7JudxO
X-Gm-Gg: AfdE7cndBzspNVRffhv9z6W7t+g9Z4Q208rriKBp7cPITXdi8sbu9EsV42d+8wVT6/p
	VDoMajaxeDLSVFE99472qYre/+t+PNWx62PGQ/+1Y+PX5QUvNTkJjkrzmxj3i4P4JodyLKEA4Rs
	M7Gzay3YBhKuC//1MRWFxpm2XR7NxKsJyIFEC9/TlwTFGHFG/uLk64WaK1a4aK3FAojC/66Cpre
	zm+C/ORlAvyu4ZYLxMMsWRUvkZuRin8Gw13tTveJ8KlTqhttoDn9kX61zEaAmmeabkwLbrMGQRX
	9dsHQUf7m1k79QTaU3V0OVzEriY6IJlAr5fYxL7A9ESllgTM18Q2qOMLBtgGDOjwJ4PcRqE5Ht+
	q6R3CNx8lu6H6AqHEHiuWHvED
X-Received: by 2002:a17:90b:4c8e:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e4b43cccamr3944732a91.19.1784320918478;
        Fri, 17 Jul 2026 13:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e4b43cccamr3944683a91.19.1784320917831;
        Fri, 17 Jul 2026 13:41:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:41:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:26 +0530
Subject: [PATCH v2 1/9] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-1-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1299;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7exucDpQz56UUOX/GS72C0Nnz1GCp2aiTngaIPcMmkY=;
 b=59JZ+AiPbO7Um2ErH7yj1zS6z8HAFQqgcXTIpwOre8CaO2cTECbjzx98rAS+Oug8orhhgR49a
 K3NAhQOAEYCBdkiHjRWR8HaW5ARAVWD3vALuGFL4Nw0BCXXBQAVBjGF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX7l6kLUs7W342
 jGwKr3KpEq838aQAl/UrBOyWwavp7vvt+Q+cpkSZ6O6U/nWTAWXDw37CCcXWGxAJqbhBC7umI+s
 um5LHVqVgVk1ymeUOXvjQPXP2yamQxyxcdEDgvBL0bS6fBi2O1hZSEkXGfotihCojVGbsrK2wYi
 cUdnTDaS4eFOiVQhgzpA8/2ui4IhMTbnaC4jl2r8p/8cjhhPMIoYstJzWHywtYAr92d9H0AMJzG
 8IgFHRoY5uiafloFKdYv7hjzBV+NMUkpn6t6wToaHzvg1MBpev6ILMG8R+cJxEFfAcgLaS4b8L6
 ElkLCy1sof8rpBTu47zNK0rLqKiCETDXLDXKxmqquwBf0MAJK1nF0SOWiLCmgDjJqwZWPPteEoG
 nsjSQQBeF032TuzkZLDVCFBlYNSDBo0fROfmeTrkAnxmKExsUbuDUu1ax9mgtGTwRPvJtdkPKT3
 dgyVNHbFsv9fSg26/Cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfXxnoJaUi7+dc0
 PftuW3UZHlXuoiPRN4izr2TqI7X9wJ6tQOONP5gbmf/OpMHR/EbiUn6vzWjwTuAhTzZt47x0uuQ
 Ou3mmgjoYvfo6na2Q6OM+0qxCn39A0c=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a9397 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vf0ozLlH3VOCCO7dkaEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0kx01yadeJySQdzM_OVEKmNc6CuDPNgW
X-Proofpoint-ORIG-GUID: 0kx01yadeJySQdzM_OVEKmNc6CuDPNgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170212

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
(clock gating enabled for that TP0 stage). As per the latest
recommendation, clear this nibble to disable clock gating for this
particular stage.

Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..a98d550b72d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1199,7 +1199,7 @@ static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
 	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
 	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },

-- 
2.54.0

