Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F5486634
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159240; cv=none; b=goDTUu7b0qOHx8aAZYrSeRUh1f7Tr1riAcRlRey1tGzimSQsAcnJwXew+7GLLOIe5JSHmG0erIPHPyy3nqqyId1c6JtoatfwlnFIeaJ3Ore8S7dVskIsdm55nRRUTXGiU9/pcMSUDGRtt60WLABIc/IGCbEd7xUuPQNdMNHMQxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159240; c=relaxed/simple;
	bh=y6Olh75Fc5VCdWLQG6EWVT/Oxp2EPOrAyCE8KeR1J1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PchxFEKVp4sE8a/12vMXSi7eZSNjXPQC6F1AeZxSCZ12cryYdNycLpN5rzWYqFWcNVXDTWYLUTgYUGXAp6zXDzpX1kiYhqCplkMA35pF0aHfGUoLZT50aPRZEBlO3JMSvSPfxKjbqMSucNDxOw60oTXaUsFkNYflCbADooGjN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqfEM/dP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJnE4rFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqfEM/dP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJnE4rFJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2kSE3087121
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=; b=SqfEM/dPwnhorwBi
	UxbPCSqj5ZYcaKZ2Ap9I1Ae9bmaYO0LTAlW/d7YEP561DNovMjZyeSrL/YkFI51K
	PV1/U8DIatH/RFkDXdR5gpha53dB9sYYQG/qFsIRRJwbyjWY4PtnZWCvPpcEq9MF
	3Y3YfzephMd2zQue0CNzj7u8YAwnEg1n2t+jEBRZgFebHIgxs3MLSSQezoJIa89+
	qhV4uqhjolV2UEOphs8bTmB1Hpd/cnXnkUj5hpnTijBfkD702oF5o3FaF+wiU1lD
	duX2zvqRILFd0l3BkQ1/vj3Aqe86lIVHJ8iMCrRcpvWfNGKEOVAp06Iik6x7+TT2
	Ec8SGA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8ap8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-338c2e27430so539478eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159216; x=1790764016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=;
        b=gJnE4rFJ6MBSht/uz4q0GS2+O4cMt0otzGxpPK/XJ9nkUeIaqoKmgbxE4o0lv477Xc
         FXUAPjEvTmIt8l/H4MEbHB4KnfB5THv4sd7ocks5ldnxwbr4C5ombDkXbKUJVCtBOJgf
         1VSPBUcEOMgNUqyeTcJmK6heMqoFeZbfrLjF+2LLTedVvZ9ew5XEVXL0Dd0wn77UuU6y
         WYXZY2ZcKKSNhVu2XFP0/TCy0EW7OEovBGu71eTE/9Ne2Z+0p+4ZbSYv1HIHyYwf0r5U
         0FhbNJABwbb+o/CHd31pQCp9Wl3pS/+5DU/We+N1L2ZV45WriPU4nyu8u8SlJaFCpWmF
         yavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159216; x=1790764016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=;
        b=GBg0ID0UbAiPDeOv7sLOAZIo+L4wzkS4SOHNKKJBHw0jtC0WzsD46hBNTss9obElzL
         /zs9nBrL2T9r0R4De3s/X+6DOi33GVzNACSVX/79mtSoxCVZzPu3v661i2c846l802rt
         0j7u/THpgkiOMkIIjvvytbngJDrS/UA3InFlmmxR4l6tfPnSaLXpt3cXlWBuwwYJBMd8
         AmwZw+iXf9G931NByXdV++J+wodiddorKPDkuo0ijmSrJm724lg8TRrIpZRwNp92EWb1
         w8wCVtFtCB3sYvs1dSxYTKVHTrOYXi+k3MZ9ZmJaI70qMKvfXAkcwiJNRnGrga+3QlKr
         +sWg==
X-Forwarded-Encrypted: i=1; AKwUvBzZuyTQELE85j8ttX80grmJfhv4q51AcYi/8wvtP8YMEXZWTXfKHMTPP3cQX0+zjN8ed4r0h/0ZzbhB@vger.kernel.org
X-Gm-Message-State: AFuF++moeFbB/o84usj76M5CCxpnJ1SoOj2KHs4TUNUKJs3H2MPaSTQD
	Hexd6LTn6tZ+4CylS/LQQAu1Nb7V+yjeBQXzhYRhk8OT2W4eczwJkJ/lZGmJzMquzexr3qqoUPK
	Gf4xdJp/2qz8xX7AnXQyPM4r0lhfEG45ie1iJz3zjwVZ4ajSkd9FOvx7kN4keiZpI
X-Gm-Gg: AYBFou3AA3KvHAhIn9Y9mJKkTwBCUVH09qkmMNGdMYNOITR6zX8L4akoKUK4o9TRZ5c
	v9084/3eEH7hiEA1/YBAaVPga+0B7I2VczRAJi3Uyko1NqnIJczIXTLNDaQw4x9Jey57Lnc5+M+
	Yvb0OkKQ4vVg8XSh5S8Fu17iae9dIws+nr7ay5Mf3aNMFmDNEw9lEShDT5/fDIIaGvMEDjOuC4E
	gzNaQ1s+pBtf5eF2EQTo98waY3xhUb+j62PqNT+HjKaGpjvWgl+5nP+621N05GnQEkhvX+GbP4w
	XCa1lH9u4zP9H9q9uKON73Q0+u8oJfh99kUi4udg9n43BntjlKJU3n2OZd5BRIPQ7Yh3V/R2Jag
	ci4TvbUkd1nMzu+5VNAOyLPc=
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2388186c88.9.1790159216340;
        Wed, 23 Sep 2026 03:26:56 -0700 (PDT)
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2388140c88.9.1790159215758;
        Wed, 23 Sep 2026 03:26:55 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:46 +0530
Subject: [PATCH 06/15] drm/msm/a6xx: Clamp MX dependency vote
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1006;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=y6Olh75Fc5VCdWLQG6EWVT/Oxp2EPOrAyCE8KeR1J1E=;
 b=EsDOz8yeV+c3gpSP6baw1ovG28clMjsYZni4lG6rN/FJULX99TZzacIk8ZsJLWufpEOi+PvmV
 2Cw4rPd8btuCPeWaGinzZWxb2wY+olFO74PiH2SuMrA5mubIRElH2Vh
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX32xFvXcEDv7L
 na6u1Sd8eYONWWExxUvxS6LYMDrlwSLbNS1/UtPaAbSCkXBtE0YsdgSjlnLlqzQc/7+BnmGoJRF
 1w8cbS/8V79fCjHD1lHH58KRp8aNMKA=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3a971 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MBm1Spx5gLoAAc79GfsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nvbkpTQqpIH5xSDP2k4JWqpoiZK_U9Yc
X-Proofpoint-ORIG-GUID: nvbkpTQqpIH5xSDP2k4JWqpoiZK_U9Yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX4Bfpb7o3l/Rl
 usKZzKlDhLQKV42sy1G69ti7b5aN0mSIjFbSIshOs1JYnSlbI1LIs0CPA8uTmTKe5qsUqKuYa7t
 fT7e3rIrq2iS31ZHSiKjBSrOfaZDDYXieT+93wDSwecpXoa6qWU1N+51ECKEGDxDLSMssIEBx8p
 Q0fTkHqB1LEslWgonOTm2bbGJFWfymWCiBqV8iWVaLJ0lETpFFG0qQvbbfC5YuKLetY70z2Abj0
 8f/jceAiDX49gFjtfCGK5RhfuMnuZjz1D2E6gZWZY0bThRFDtoH7vOpISjtqlJfwVqlOMwz/QzK
 1YV1ngE/yHR149HC2oBh7dmMbnX0E18iLZom8lbWxMkzs8XnLUV3/8H/PjTB0Xj/rPUJ7JnhLfs
 otSVPU4Ded7iU7CneQy5nB9SOwMxkWZwcmeRP5xb8K/A6coJA/yKUvvYLs0FGXgwQq1JVNsdimI
 ogOPH8bWLdr96oiGGrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

In some chipsets like Hawi, the GPU arc level can exceed the highest
available MX corner. In that case, use the highest non-zero MX vote instead
of failing GMU initialization.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2b66d6c7fd19..14d422d7ab95 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1833,7 +1833,7 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	/* Construct a vote for rest of the corners */
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
-		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
+		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, true);
 		int bx;
 
 		if (index < 0)

-- 
2.55.0

