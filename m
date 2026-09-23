Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC0948641F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159242; cv=none; b=ahDqvaThM6UNSvWH5sZbx/iosDCaprmCYIrPIFo3Otak4Mqz4bcAqs1VpXQshV3wy2qMNi5ALjYOcAq8Y37pr89xxg5Z/mR8Sxgv/58PmsF8A2t+4k9tSumU1wypX3hVCJvvlZe16YMKD7N1ZioEb4UYOtBiFXtPSX1aYAYcOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159242; c=relaxed/simple;
	bh=kURPhCqwLXhWyHDPUC0FBQT0xU08pc7L+Itm6hSzjGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9M9kpn230yJTTN2WxMXTGsXYu77aD2Q+wazRPUk8KWy1BpwUj/DJnmMGEONm2brS0bnJ7aIJVUsNRP5Rxd9lOO2DWjDnrP0ApbIs8DuolYva9FiGc/ax7nZH9fhAIMcDF4KJ4URic9lrS57lJKYJQgMr/QAPjy2C8fljKedgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RidMsegH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoB6wZGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RidMsegH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoB6wZGD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2mJN3087171
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=; b=RidMsegHyDJOlqMk
	e0uVv769jwlF7ICnDIZcPtOmO7KGPS/L9wxSzxRh7lMkdqYpe4b03W7R/ZVTKUhE
	0i64msJMx1guvPdHfI8uuQ4qfvGGg41orKEwAQP2DtZegZkzY1IBjBwjZymv2+Rl
	BgH2L7l9sZOPCUVVpb5/z4xoQ7aTtVngE6Awzv9PjLFF0dAanahlLwuDvlsl13XP
	lHvFt6C+doVSEZ4BDCW3IGtWzbok8bJ1sNWwLoO3FqWqsqDZzpPhK3TvdrDYth7T
	/GlwpQSYFVJFyPcrIo+mn5C76/3BYQ7bEpVvKdyEfRjtVfNQyNv7UpDjvu55tLe0
	J2U/zA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8and-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-144f706e063so543914c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159209; x=1790764009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=;
        b=PoB6wZGD0ubfJtSY1TN+B2aToKfDZTLsJPM4EDuFA6w1mh4Cbj0rEG+XP8atBxfQrD
         JGSEnfE8rBSh1PP4pGTht5gEpn0eAAxege+y06a9KT1wOBUIFLleJoldhx6UTI3rPacL
         X5U+tvnw2WIlw/IYq3gETAY82UzRYnI/R+2Y+Hf4llzXvtqLndXs8ogMCYZfZB6zTiEv
         a+sCKeJzMCXEyP3pMy6JBrJP4fmJCxXIvyoem5s6icIv3frFui/Ys4iGuEdyjToVYSw4
         nfbhjAUxrEwdDNkQ5/ekr3T5lmZxCHPKn7Q53A2yzWsq1r9KH7d9oGa/RLeC3hZjcLZu
         u0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159209; x=1790764009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=;
        b=zSzxN/O3nH4BcXiFAOGw+Nvgu/NfQn+vBJZ7v2h4N6U60EdwwRgsU83iqQyru5a+d9
         6p5pQq1g/bZNuQCKEGrTgEwH20beeV8eFGp5fWhSRDyYdOX7UfdKMvgFBGCYG/KDeyi0
         w+vlSEnG4sfUP3vOsxtSQb55zt+0KisBkdpta4QjO8OsDn8a2wLYMS7kz7kzr25vuqB9
         a6lQLf9vzgi1Y4IB9WkAC8+JFfaLMBHBqzt1hZEIMV9NVzo9Eo/3M8zUGPs1Vscx76xN
         638etZP78U2yIGdKMHzdQWDRwQ6Bdr/HA+vBcyRd/zF2ID63fX8wVRFsauol48xUWNCF
         I0tA==
X-Forwarded-Encrypted: i=1; AKwUvBzJO/DI7FolPVqeE2fex4tcIJvAwC9oPNY9AZOzmFpGVcKVScH4C0Vs7TiYxfg87NgZVfZyhKX11a25@vger.kernel.org
X-Gm-Message-State: AFuF++n3q+/NSOxpdusd/GPJP37YXKzZH2uKbKnEQzeDCyxKTm+jze6j
	qkssWBI6XRZe/08UOX3ToMALbYQvF5YsakHWpE0ekgnhyP9dpbLg6zAn05PIuWLKlRsNTidu/SM
	ri20G0vCA5jVyF0bMGK1kWokY9+meDuHKQGSy+GXclc1YBx4KU6e/EmhdyJDuhTTf
X-Gm-Gg: AYBFou186oZxnhBuPSpNHNgVc6TV2rG6sitluX+IcoJcvYP8x/PC5ph0OR7bmrCc0Ok
	dGahPPzgNCXEf7FewFFm759vbHX2f/gzQuNXOVBnUzw7a2uk0pW7tz2/NlkDY+jMsfqdTKWf9bp
	Eqo/qwPhsdFpQiirp84glZbXOAAbBXkTYxVX2iNOIZ2/aMtsA95kFtBu/4prcB0PAdWIWUJOKZ/
	iRISRFQlSXhcUQSIflJ8jEJ0nxjptog8BZlujymEsVoYcWaGLvxnbj7CNs63+Re99vRoGsNJ++Z
	d5mijjVCskkFShoKl06Xcnq0TBS94qHw8OtPmrkaibVt9Ccs+1V4ofhRCmq14l6so1/h+2rfGks
	hfrU99Jfk8aPBMG3IrYKGMkE=
X-Received: by 2002:a05:701b:4291:20b0:141:9d33:f1b8 with SMTP id a92af1059eb24-144ef0eca37mr2418638c88.12.1790159209299;
        Wed, 23 Sep 2026 03:26:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4291:20b0:141:9d33:f1b8 with SMTP id a92af1059eb24-144ef0eca37mr2418598c88.12.1790159208743;
        Wed, 23 Sep 2026 03:26:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:45 +0530
Subject: [PATCH 05/15] drm/msm/a6xx: Add BX rail support to GMU dependency
 votes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-5-0c3c79a1a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=2678;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=kURPhCqwLXhWyHDPUC0FBQT0xU08pc7L+Itm6hSzjGI=;
 b=NWMeHEh6JevxUszMhW2aEo9xuwPWpJ003QMf9bmjaSM7H2sFolE7OUzs3B5B7nYc1829Pvnxt
 hBq+lahzKu8CD86SybRsANUAVOYQXh0bSvQkzX1i/KG8rgr7cH+8kxm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX1bsNoU4/QsAm
 APBfZ7M2m02kSAUMc5KJQbUTaltgqKiph65U0fHJkVLYU7yR5/yo2h3pxrRKxEwXn49/wUazzRT
 Poy6sOAbY5jqzoukN0Qi/AovCv44qCs=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3a96a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=55tSWijHQoufD_vR7dwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: VtbuHB68hyiPn442mv4Ikb-iX6UlsWBL
X-Proofpoint-ORIG-GUID: VtbuHB68hyiPn442mv4Ikb-iX6UlsWBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX8yLYRMlEdbeC
 tMNMHE8YByrlya2AJIUP9SUftms2fLUECGwpAld49zQ5C31/IQwsS4C1Cm5e1X59b6Mn8t6Atst
 adsFZHyNnvI6p8dRDcGQ3MvAC1gMQjeWGNYgMA2U+TcW1aFd88U09iSA+fxNqOVJ8IvnvJUZHWL
 xttPBgnMtU99bmPcLthcAa4GSnu3mZtyAYjbcUjxkuOApl61LEosqjFmhEFzdilzVg8vDzAKrgP
 ErebuISnjEfdIAGz+d8E9gJvQOVPmO2Ee/LCAK8H/mW+yisRmchrFUmhBO3e0ypAUxtOYA7Ky+P
 nWjMtPOg8mkRW7PK7d4+v+qpEIx2NrhofU/DBS31nVl7pKbsAG0rWYDGRQDHsitXoaAzjDgHoyJ
 eTdrYqvdLYQToiD9DHeh1/AFj+Snq0awRTwXvrl4Eyn/wdS0OB/CtCqnghTSxauJx2hoQOI8w5o
 VfkWWoHDJiZF18p0evQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Some A8x targets have a third memory rail (BX) in addition to GX and MX.
On these targets the GMU dependency vote carries a per-corner BX vote in
bits 25:20, which otherwise default to all-ones (no BX constraint).
Prepare BX vote field to pass this new voltage recommendation to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0ed01ce1c5c5..2b66d6c7fd19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1799,16 +1799,34 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+#define GMU_BX_MASK	GENMASK(25, 20)
+
 static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 		unsigned long *freqs, int freqs_count)
 {
-	const u16 *mx;
-	size_t count;
+	const u16 *mx, *gx = NULL, *gbx;
+	size_t count, gx_count = 0, gbx_count = 0;
 
 	mx = a6xx_gmu_rpmh_read_arc("mx.lvl", &count);
 	if (IS_ERR(mx))
 		return PTR_ERR(mx);
 
+	/*
+	 * Targets with a third memory rail (BX), in addition to GX and MX,
+	 * expect a per-corner BX vote packed into the dependency vote. Detect
+	 * such targets by the presence of the "gbx.lvl" RPMh resource. The BX
+	 * corner is matched against the Gx rail level, so the "gfx.lvl" corners
+	 * are needed as well.
+	 */
+	gbx = a6xx_gmu_rpmh_read_arc("gbx.lvl", &gbx_count);
+	if (IS_ERR(gbx)) {
+		gbx = NULL;
+	} else {
+		gx = a6xx_gmu_rpmh_read_arc("gfx.lvl", &gx_count);
+		if (IS_ERR(gx))
+			return PTR_ERR(gx);
+	}
+
 	/* Fix the vote for zero frequency */
 	votes[0] = 0xffffffff;
 
@@ -1816,12 +1834,27 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
 		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
+		int bx;
 
 		if (index < 0)
 			return index;
 
 		/* Construct the vote */
 		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+
+		if (!gbx)
+			continue;
+
+		index = a6xx_gmu_rpmh_arc_index(dev, gx, gx_count, level, false);
+		if (index < 0)
+			return index;
+
+		/*
+		 * Find the BX corner that satisfies that Gx level, falling
+		 * back to the highest BX corner if none is high enough.
+		 */
+		bx = a6xx_gmu_rpmh_arc_index(dev, gbx, gbx_count, gx[index], true);
+		FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
 	}
 
 	return 0;

-- 
2.55.0

