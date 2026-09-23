Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601CF47FB09
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159193; cv=none; b=JQfijBG97wYp90MPLwP3U0tCneioMwjVlcOHHwJZ6h4DgsXEheZLKa0EtZL6CNuBbSHbv6SxDFmHgRBg6bNd9ZU8exvOrVlf2YFsLjQHpmwDLr/Q13sK7aixHJb1AXpEWGLBqMqtG7XN9gHyZJRBsW1TtyLCXO4gdsZdlMaSB3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159193; c=relaxed/simple;
	bh=V21+W5V5cnpKq7cOeRXGNYr9Gsz3y+i1HRNlljSDkDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZ3ZbDlJsxka5rMCBQEadUopAVjVFuD6TK3UiSGI6wWEjWGD9mOBz+HjE6qkzie8ScU0dp32kJ9WK5DJtrQh5HyNd2+p9IxWqEbLVC1+6WhN0iEzOnVepkqI2emCXO2xeRlXebWkNsIylPhpHS9EktnY+hpyALxqYEV2tFdEfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG42YElg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0cHz3HF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG42YElg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0cHz3HF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2wPg3409885
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=; b=WG42YElgMQfoDgp1
	JMkrjIz/tw2k/5eaVT4LKhK5oL6BCgcsvgZ1nXqJ/X7y8LflcASiFMc5slM6F+WT
	PXiN36RcTDEKlPxs5EhwvBb93NyUy/PmI0gYNsi5STY3NdqgYVB4PgCwWj2VGB1G
	T2lwCsN8PzyzfGlxft+B9c+Ccyg4nTPFO+0t66MLq22dDMmxe8MWl2NtwQ/MEhbG
	W4jbnvtKUBz8SeM7jtdgnjYac5DYJLViYLM6kkwo9Sf6npk0eVz1DsD9ANcZceEe
	mhnKtssgPtyXKtH57/e+ULy1bSmPq4NskqynPOe4jx/8XM1SE5mBfKiXqdOKF4HS
	L6d4ZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863vne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so986921eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159179; x=1790763979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=;
        b=I0cHz3HFHDgONf9MxsaoKAvm01Fg5l03QbzJwsviUu5TjgCMjDXqJnbyA2ZL/AdV2p
         uxnUIBrnAzEztXRUF0Jv0Pu+0SLukV/7BvHZPtrnMCcwKPrQFz4DUpT7ymyiai9xxMV/
         1IyNNLRfZRpbe3gtVw97lVUQp6GXK90W1srusk4O1Pb25HW7TsPLQU+nF/LWLAHn2iOQ
         k+2iZdnv8SiyxHe9nhtdZxUEbiWiMXnJoDhco3rS5d8RWuCZT5Fgt2aFPKnBAc/taJJZ
         oI+aHP9CYRLbRwMUZnQO3dF1QE1sl+/mVpKAk7OAoKvr/wO8Mt8CeCE6s60J2AgZe4zr
         m/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159179; x=1790763979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=;
        b=2ss9nlW7GK4zZq0NXnVs6mpdnDum2AyHvWomERCSlXmo3D32IeRQfmyz2VR0Nm3CtW
         yUnAVbwoPDL04tvXaa74E0lwDMEoEYiySHZ9C653jHARZtoiUbniWlyqY0Urw0WTt5bo
         OvsUZtLFW+nXIMv1pAFjx9ex9Pl2Ya9IpZqEWRniTHRv/LT6LbUiAOui2X1ogfGwugzC
         c73R5X9+aOciZfHkibkwdPLZ8PIB9lbJMvmp7IBs22MYrbKUcZKFq0fMRLNZmFk18LUf
         QhQq7+Vb0Hp3iHyMKPHqYWqmY9PYxem4DSf2nD1MaswaJB0RF9bdw4mGJyWC5JeLl18W
         sH3g==
X-Forwarded-Encrypted: i=1; AKwUvBy0yChnxYQYht767TjQ6ipjGn+2W/oOuzWVRvmJLsAVYvEhL4HaRZN0rxkDRFU1+e2d8eyTVwhKzji1@vger.kernel.org
X-Gm-Message-State: AFuF++mnGO99cu24kV7F/VOMw6Cp9oOuh98rQj8+LjGKf9WLoW1jVNmM
	yIjVaWNRnRTte995cWUdrX41dUahRpdp9B0VyAbwR6D+VLmG26UJK0TZD6aiJaPr2Y04APTdOT8
	w4Lwc3Xxww32V+sTa5FIBAoouSUFtG859YR3IBjlJCSThYuH1tTe34qjZebsPHwXH
X-Gm-Gg: AYBFou0ZjGwAo/34LtIBxufQQxWf3DqJufH46euR5reWF77igGl/MsRErBHeB5LexF+
	XSNLLl3zD02EW0EGr7kJ9kcIJYdR3ns9p7KO1wZ9N09ooX8zng8mmbJtsei9H27H0WSWO0lQobN
	HFqM2zW4/hO+BZq2c0Q27Pmqs3aFojdJjfjaQVjhwKsbuKzhMoeHCgXV1wGZiJQyjW+xgf8b1ZB
	ivYEcDwQaGGYHg9RO0IPnSZQepcrdlGbKKqBGZlrdRFlQLV78/cy7pukV0GfFuSjXLJq1ViMj2P
	B7gKq93znh58C66I3BQ+Q3nuZuQEVEVaM7TDJLbr3pHtC/uY+TeieLfKCui8Jy4oaSDHR1nd3k7
	MLvzle5c/Ft/IchZxdRYblbU=
X-Received: by 2002:a05:701a:c96c:b0:13b:38fa:2dd with SMTP id a92af1059eb24-144f915501bmr2194620c88.23.1790159179107;
        Wed, 23 Sep 2026 03:26:19 -0700 (PDT)
X-Received: by 2002:a05:701a:c96c:b0:13b:38fa:2dd with SMTP id a92af1059eb24-144f915501bmr2194590c88.23.1790159178553;
        Wed, 23 Sep 2026 03:26:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:41 +0530
Subject: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1864;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=V21+W5V5cnpKq7cOeRXGNYr9Gsz3y+i1HRNlljSDkDQ=;
 b=gz27hGiIuj7IwDt3Zs0yojZ6ao33Idt442AqRxr7xS8f590tFgvvo0/KU6rsToa1fVC+5Pwr/
 GbXZl65xVv9CMvyQhgUFyagbyOlCz6K2SCKJdOQMo8EHar1jR6v6++h
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: H_qtNU6eLXcbwM307wc03vOKSLuq3kWr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX8sTlZ+LOy3b8
 w/dUsq6OO1Ikzs9bLQRYVpoG3AVldJmlEVKXAKYydCLNP+Cehn/Np6gBsNqTzWU/L0PyG/llNfL
 I1ClP4llAVFU2+a3ysgYenNzI7YTpCY=
X-Proofpoint-ORIG-GUID: H_qtNU6eLXcbwM307wc03vOKSLuq3kWr
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3a94c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RtdH9gem4_UyrOKn0ZQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX0feYRrnc8JCU
 JXlc8yiUapTpQORhMH/MXZ1mdp1M9bhBCJs5KcUNyC+66dqOTF8mAo6dsGqVQoNrsz+m2saa3P9
 l6ZqfuCst8D+X/IYb+yFZfHwvCy6+lA72JeOyUQieInJGeLUxtT9m7VkXtHq+5w4rlMjRNVA9mP
 roubwBQbJRrFpSRB0ApsE69w9ayBACzTvjzV5WY/iGAyqmQzQDtnqFNtIE+vF5P8A/ajiNUzCIM
 /qK9a9eD4May+PPlqmMXRhwnbVcGvWGRUyGUWXfQDHzGM8QDA23Tt5VuVxWGJ9XzuRhEZ+PtV4G
 dpbSnGn5Gp2QPo1cb9Z63IRR76a9IwLui22YF40v4JAPo2DUQqWzwP1Gk1d0iCCZ+WtT/7223+d
 OWu0d00uFbhP3QfOf4QqP83SlHbJFmqH8nHN42PdtMNA/CPc4SIWpS39wnQMTpKZ8HM++gjBmsC
 7DSEYuuK8Z5MaRAOmJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
votes above the perfmode_bw threshold, similar to the A7x GPUs.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 8 ++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6d49c51df1a2..baf77a620572 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1656,8 +1656,12 @@ static int a6xx_gmu_rpmh_bw_votes_init(struct adreno_gpu *adreno_gpu,
 			if (bcm->fixed) {
 				u32 perfmode = 0;
 
-				/* GMU on A6xx votes perfmode on all valid bandwidth */
-				if (!adreno_is_a7xx(adreno_gpu) ||
+				/*
+				 * GMU on A6xx votes perfmode on all valid
+				 * bandwidth. A7xx and A8xx only vote perfmode
+				 * above the perfmode_bw threshold.
+				 */
+				if (adreno_is_a6xx(adreno_gpu) ||
 				    (bcm->perfmode_bw && bw >= bcm->perfmode_bw))
 					perfmode = bcm->perfmode;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..bd5c440f1753 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -580,6 +580,11 @@ static inline int adreno_is_a750_family(struct adreno_gpu *gpu)
 	return gpu->info->family == ADRENO_7XX_GEN3;
 }
 
+static inline int adreno_is_a6xx(struct adreno_gpu *gpu)
+{
+	return (gpu->info->family >= ADRENO_6XX_GEN1) && (gpu->info->family < ADRENO_7XX_GEN1);
+}
+
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 {
 	/* Update with non-fake (i.e. non-A702) Gen 7 GPUs */

-- 
2.55.0

