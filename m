Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956443;
	b=TEev6T+5rPtt1sCvBrzwXPRTC5m54eBievdnsbIPz1G65w4K0XBwxOmPCnlRYpzKod7e
	 JX/SLyHjObalHKnasYyhz6T9I32ibaEpzslM3kcgE2JcQNDbhBcQPsr7FwLK2RzFGFC+P
	 aLh2dWZ2mek1OyMKGShr+9UJ/eUo9C7bNP1U+jckB0l2CXRv3eVdiAKRUgEEZBDNqyLlJ
	 Uw/IfFki7X5ChP3v+wZx8Wj1dCnKGu3x1X/bj2zEM6cC31b3yJJCXY7B8mMsP1GHJ8bMk
	 mMTq/iSm4G+Qkw38x4bzeYQrwiFPmjI1VrlSeNxKm2QkO0yUBvnEdapmyuI8tqa4AFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
	b=mFUgoacXKQvgtk7HFsEwUkK0ZF7070XjF/6eZUXMsgq905Ud0fNcKLvWjzc5oPbJqyj9
	 9QAH/Cu6XwKP+bUYwNma2aevCHixPOJZBrdsmYmzJWoUJgC+oMIfRNUl7twAE4+AtXTty
	 oUhvltfNUh7LYHdvAspKw2VZ37rrP/mMI9uXYJLSbe7vn4+OMQUoca6Uj8937K9pSEaTb
	 RJJ6Q9hA8SMWRFDdOrYcbEreggARP5yr/8vi98jiicI1vjPoeumQywXlPzbh9HN3y3EWV
	 zZGn3c14Vfcv1OfvzlYsBCr56gIBAql1VcyeabrDJyLZh3sL7vhiEUwNgYzJjtxhDbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXmjkkCX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RecvNmA8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB092606A884
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB092606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXmjkkCX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RecvNmA8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMgFGG3561145
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=; b=HXmjkkCXMmQ07/pQ
	dK5tApiuY6ApddYlMeBxpHYCJ/DEz+OHOuaPrSZrvGsA89m/mdBeD2jTh4wtGbr+
	IbkrH5YUH19dbAx2t/R/NIrNySHYr1zAomTssvUFwCVXLmeSizj7XtGULAc6nTpN
	Iix5wD9BGVcL5uoP7ZrujhV6xeM4x4kstm6VoxjPGkY4sQPDfpvQunyNkPsCFcsy
	5c1GcpOOkbTSWfE9fArk3GxXSR+p6gizcYRzXAEu4HqHy0l70gEqV1rN0cEtbjLn
	cthjbRGuZmBEDj7APlm0p7+hAfmy3gKh+IpxbGWCHSUnm372TW6ieBnCrh9Vz2bp
	6bYs9w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcg4b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso70078eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956440; x=1795561240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
        b=RecvNmA8L0ipElopUa5RwG+RyL+FRvZfq8YKM/6lkz2VgLLI+I9LMbajnOxmoKyQe/
         1Z62MtH8TbvrjzbGVO6ZnFRqwkAhuhbQu5E/4w/O8FtT8DyJNN88kr7aVewVzyQfH2tU
         zfINS0HV3wyZsk3asyNjFo3+T+BUTqrKzgwalMWsK8shU+TojTK3Otlf1IZRWooUOkj1
         sqxE11YATrRzOUw+P/Pl6/7FRycHZQCMeRE4TJ4KqPibL9GBDYDilBPMr31CjXc1p9SH
         tM8c2re03WNu2++MM+NCerRvmN7XzdgtVVUoijJMzfcB3C6/AqTKtOJ7lDjUttO6u7AJ
         daSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956440; x=1795561240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
        b=HdVdjZbn03stUkcL1sUw9e3AyGRcc5HuFxLaeHRgHUQkOS7Loc6lAHzaw8qIJp6jGR
         cTf3nXckRUlG5hTEciueCYaL+TZXlU1S0jm5lQ8iWnP6NMBc9tVNtUf67GfnhGR7IwrH
         6sY5euG2uTolJPyw+zBRB4KtBuA/Q/iXALyoyKUIpZsWtDpL5zP1nZI8p016gml+5TBn
         qEOwOwxfh2hKo8xCNrybDd+xS3iRU4Nilh0MNKSMuivpeZCDV0Vtcdswl2mwgsgj32Qa
         uCYzBMpdK9OEnPxOK2g88PL+3bb6mm65hmP9shjgrAuieHWf06Vxy8GPgQxzwfVrh2wc
         83EQ==
X-Forwarded-Encrypted: i=1; AL+hErFV2DgPY9xzmqgvAqV67Se4ykDta15Qv7h0WhNGeg0HngTl9wxBwFMtaBuIwSBkpBk4SXb902PE0YkG@vger.kernel.org
X-Gm-Message-State: APuU4Z9W8NFZXqhrkMlRRQMi6i5CorcDY5mh0HrVkUVmxL5OEIcUS7RZ
	FbfCt9ttp40YQuhDeHKoV4DRt3O78Tmn4HDXo6UuhxfX0fMDLPzDrdp5m10PuzoVf13k/3ULOtX
	OZYaxpitJnGduBAsmhEttqrd1Alcg/oDF0KYTyIOkzwmHJ3odNQKc5RuwxHLAK0nJ
X-Gm-Gg: AYBFou0lDEKffk0GqzLqPcLqS7LfiY3lHIR6abLSill3aXXibtHhy6AB7PhE1sbvU3P
	Xpwk+e+Gl6PmqczN3qI583K4M+fBhXy20mYwMW7YmevBlNSCEfFx5Bh++oqOZ29V25VJBRi2O1a
	axlpiHSfeXl88xNYhSprxDA0VpqnedVpNaeRvzuyNe0I5Mak+tn5dkwN3HlDVCXhTQ9BUohyLhy
	6Yjj2DoAU/8U6Ib44RzcFAs0EcKDzIRAuPeLvtnKDAd5TRx07ug2jgV9IN8FVdEndgUVZxt2QzM
	4kurOTaJF8PUZa3/mJPScWbLJiCdEISYas0kRq9OgmC4y//NUTovNP6EZgSVnqQgvqJQBpFcJze
	N/HW4C26TMV6bgfmXLZZWEogJcH41pDf8v5RHCtCgfCsaFBYWro+S5BZkIVeF56MPpgGqAqrkHw
	==
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b543cb3e8fmr889040c88.16.1794956439064;
        Tue, 17 Nov 2026 15:00:39 -0800 (PST)
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b543cb3e8fmr888979c88.16.1794956438333;
        Tue, 17 Nov 2026 15:00:38 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:04 +0530
Subject: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=5375;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XPMx9YeTMn3NW5my/QSibulL4PbEkf63zt5e+XGribE=;
 b=iQMioyMW+Gvwiy55j00nRWZ/pCqgAtJMxr8lzXpjw5zjYAooUHT6Dqslag4VAiHXESG2z8yWL
 1tgkT/OatFMCZ8oeyQfQI9bi+jZcFuHBIs8pCcOtktDzRS2DaS0MSEJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afcdc99 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hH_-AztgxIDa4u2WOLkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 9QbmmRoOJYXyZoAPkLSKESiTAKPiYFuy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX7OvVpaHG2iJe
 Vf7v9DUm19Tim3EK4/wYwSM91g00KapzAfk7bvdUQpEoJKHsNLJWRGQ0GUURlrDCXnIMYitw+mm
 NIDYCrteGHTU8HH0aY8B6i106zlEd1c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX/o4ybnx4TJZZ
 MUFuoCSjhMIlijMqI2WN9ZTluWQ62uigYPMrOhJTr1h60+wgYaJclgavpCBFVqBj82vLSZk4hPc
 THfDAI0La6uD0ii9Bk4FinuleTKpoclmYEpA5oW9GTmiNp0c3aVn5UqBcQSW17r4RX19yi2YTGO
 CjGsp+TPGM2XbXtYnrTKMLs4knxr5bDST5flXZYBkRfYuoUwICyAUqaM/hbCjXJVGug2lu8PG4v
 KySGPiQUAd7/Xj00uOPUK9Hs9IHt+92HTfkbl2RSG+x9mLIISYr0QCpiXoIGog1cFQqbNnL9r20
 ZanCL14lNFSH2zg+cVhaLEiucXxonJD1C4tg51WcDMyy30uAJi9g78nxu3/ZAnGpMlLM7ZiDt64
 RFxRitwai3S3B8yOgAxyDNbG8r5bZKWACWnwJHwmTEp93hkzbkU4y3gL+28eY/nM7rlF7qzX5pB
 hjxLrH450lTWgvFJmaA==
X-Proofpoint-ORIG-GUID: 9QbmmRoOJYXyZoAPkLSKESiTAKPiYFuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
the A7xx Gen3 family. It is derived from A750 and shares the same
IP-level configuration: protected registers, pwrup/IFPC register lists,
GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
record size. The differences visible to the KMD are the chip id
(0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
firmware.

The Nord primary GPU is the same as A750 but has a different chip id,
so it needs its own catalog entry. Add a new catalog entry for this
GPU and an adreno_is_a753() helper. HW clock gating is not working at
the moment, so it is kept disabled for now.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  5 ++++-
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c | 35 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a1561ca41a5b..0fa2d2091f3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1051,7 +1051,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
-	if (adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a8xx(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	} else if (adreno_is_a722(adreno_gpu))
@@ -1227,7 +1227,9 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 	if (test_bit(GMU_STATUS_SECURE_INIT, &gmu->status))
 		return 0;
 
-	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) ||
+	    adreno_is_a753(adreno_gpu) ||
+	    adreno_is_a8xx(adreno_gpu)) {
 		/*
 		 * Assume that if qcom scm isn't available, that whatever
 		 * replacement allows writing the fuse register ourselves.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3e4afaa5345f..ee885c663ac1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
+	if (adreno_is_a753(adreno_gpu))
+		state = false;
+
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
 	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
@@ -1421,7 +1424,7 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
-	if (adreno_is_a750(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		/* Disable ubwc merged UFC request feature */
 		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
 
diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
index 6f704898cea6..9465ffa3dd12 100644
--- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
@@ -451,6 +451,41 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051701), /* "C523v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71300_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71300_gmu.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
+		.funcs = &a7xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
+			.gmu_chipid = 0x70d0000,
+			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 3572 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
 		.family = ADRENO_7XX_GEN2,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..2911d440ab17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -559,6 +559,11 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43051401;
 }
 
+static inline int adreno_is_a753(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051701;
+}
+
 static inline int adreno_is_x185(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x43050c01;

-- 
2.55.0

