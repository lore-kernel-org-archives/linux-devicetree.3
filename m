Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674715;
	b=Z6V14ANZEmmeCqzybHkiVse3TLF5IsaBHZ5cM9lcvArgV7qBg/eKiUDZu2svMr8jvaXV
	 KBh5vfZ+YD1MCzNLtE6nOKuIWTmQ935taI99YkAMEHuLE1XLvfA2D7fwl0DeFzhJIRr03
	 h4TLbcLfuTWUWhe1R8u7VgVbw4vFuAK2/MzxkN+4rSXuQDd6ow5AsnPxanvFiS23jPnZy
	 UcPrigekkDXg4KZkRYyk7SvOvgcb6k/k5PvUw1IPDN73p95CAObfQvjvGfPLnJsHlvik7
	 d9dVtn1H/idcCNdz+BzDV7CMyR/HHh+9MKIhVbbgzc+WjhEamzj++X8/VptVWK2RFkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
	b=NNfUx3UVzavJ5rTpsE97/fQ8UJ/HcSGAGARiwOlZ6gWY3OMmEmKtEGngu1fpAHHloldB
	 8/78i/74UWVOCnSRzl+rWrK1MLpofT4G0EqotkRJDKYtGwoDVzUjn/KTemy4p2f8tynoA
	 4lAtkqtV9AbgVYrGwPlrgV/zV5jX+unYIapgYP1jB0TkmyZsEONdcFIqmEuaRhcxAtIBU
	 /ww/Qx52qYhW6LeWmSEYO7PenH9Wz+/YjDSH+Uv0o6hOC9dkEK1v3BTEOlDVg9qbsbghc
	 M30+TWCNwUGz3h0RNxl1A2GpHInUyMPUdMm2FTim3+f7ixf6Tp9LeXnRqtqn7Mmwi8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF20606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36P8k2068555
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=; b=l2BL9GBKLXs887F2
	sLqje7Dq6r9V4WZ5Xnvv1YrGUb9S/WkxwzcCEQau3Uacff//5mVTuLHAtxBoA6n5
	El3q6WkqxpLGOjsUkIM4ZqMBvy0wWWk8DfWlQ9/HjYSD0M1uZzaxORxyHG90mDwL
	MfXx41rkB5N+CjNvefQYLiyZ+kOFhZSOIfDb5tGmZX5s7nICFRkA/4ITUFoSSyb4
	FzUt1xJFPg8w87az5Y8gy66E2i5GuMJ6QEeBCn6ALmkSKzrGK514d5XX28jZzRY/
	kBJjAkLanu5P7Ty0JdJhT1rCqrw5yRiZDxs/XHq3COxZ7/27q/f6YOQ8pqtsNSFX
	iQnJLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s9rx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0467a525eso50565315ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674713; x=1796279513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=AXZh3xYWvpotSMsqiKqzf/q4VrePNeO7i1gXziRCkbHkthUJF6JQ4anRKGFD3HDAn2
         kgcvCwgV9VZtODDvemtmFUBDVMY0G60jK2XNHTjvu5yxBC3g3/9WiM3xZJzSZJlJiGCI
         h2PZQ9AX8808QHWl7f/oIycC8ZQS2igWi9TCiuKvP8rfDrEHySUSSTXK3jJE8ojRwq75
         F5qYY5ot5WrOdg/KRTHqUV1BbvDe6/6kfJZj+ecPUYudMA+wAZdzwVkIZFI8BS+yzcny
         UaMkSjoolvSSqBP6MIYFn/Pm9xBuwPb1eusJNWkE4Ng5z2t4ac0TJ90xZM82BbWL4JWG
         lZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674713; x=1796279513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=oxexewsRPKbKx9Xv5/Fwi29HwIjEHbhCuFboLbKR2C7QC/GWDgjpaRcSweuLRw+5zA
         u/g7AC2XDINLzUC2/hpb/YGtHkiE4ZqZvLUCS8YvtC1N83skBOwfb1FcXJz5juVGa2D/
         k1XvRtmYHbznWMww2E1CXNDC5d3p8dc5kLzP/15O9poUM1ZioBESo4LgQ+PZrAt0hJzv
         3d1hXY6OwwAQRzpz/toV6hVvil3MCSncGG395bRdAyiRw179GzQnPWPgcp87CRPtoC84
         UeY3D3d+leyaKvhLaR03o6OS8qAsSIeQyO8b1lKciwCyNZFC1A0S/At3Lna+U2qmgo2J
         xnAQ==
X-Forwarded-Encrypted: i=1; AL+hErFNZf2R0Xjaf/U8jzD8OrHoXtgNMC67JQHyfDXwSdh8LaE/SG3eRkNF9rTs/pqEtmlbZL1M41N2aHrL@vger.kernel.org
X-Gm-Message-State: APuU4Z8XGXcvrg9aa8oAbMdLKfYMv6VaFI5lyixbdHJb0GLKMmM/w1fs
	Xnrq30oIgwgMT+tXD9Fgxx9R1oPxL4NcyabiDK91HskUwdRPEmfUtbSP4vxaAk37uE8Lep1nBjH
	xPsRTt+2bNC/3rjIDWC7XPRJx0wD18F44upuguFjlsFSUrdE3qsM0aGiYrdmeNWJa
X-Gm-Gg: AZFdTZelK+ulHk+LVfrYBoOuN7ymME2qOsbPG7OoKlwxe5DlnYE/X2NXQnbhS/bPgpj
	f1+EkgarWuMivOB+xJOU/BPp6yZA2inIsIiTSCEE5WEYYiljtNxmj6JX2QmZL4PP/msYCcEYVOp
	c2ooSuXucWDcFrUAUs5WNHHQdW56EKk4oovtvyP8CpIcXyGLFIVJqGu4v1niH2wLvH9MtmjzveQ
	+UgOHB0vS1hIwQQ0sQk/NdGxnfK0vv4XDTR5Mk8Df91kn93l0fVXnukKI++jLnrWTmbzTtx7yaX
	8fKuE4RkdcDKSxZI0r55ZQbIPcOj6KxVmlqKkgXsoCy8rvSsQnoVpqGU6SFsfGaPMuZV/3owNnF
	6MixzcWEqMwxMIH82CdQw7uBU0+FQKqA/62m3qgDAAcFSV7SN1A9Zp3si4BpzhP12Od3jhQbicC
	pxbu6wcmJH
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216412265ad.24.1795674713088;
        Wed, 25 Nov 2026 22:31:53 -0800 (PST)
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216411775ad.24.1795674712566;
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:25 +0530
Subject: [PATCH v3 17/21] drm/msm: Export GPU component matching helper
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-17-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1633;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=+kHZ6OP8gcD8pNbmCuB0Bs0MumxiGgHxobreJFpOXLw=;
 b=3pGTZXEIQomPo58QAYimRvl0pzI/Q2Jyk4johiZeBLOcZi0M1YjrV3Vw/j14XFIzbrcxTGQhe
 bv/vtYoQfOGBxQWGelLfLKDlhbSG/r1lhDKz6ZbhAoi+3cZ6ozveD4j
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07d259 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=a_sH-KrDn922EyEOKHQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: b7XNB-M7574GI4MIPQBgECEsIom0FGvo
X-Proofpoint-ORIG-GUID: b7XNB-M7574GI4MIPQBgECEsIom0FGvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx22DW3zWTDjW
 v1LLCYPl9YvGvXTmdGlay4awlwYONwpvgGS87ShyJ0EnwPjfdbsdNKwzEdpDdlnbJcxhu2rL4IW
 csgS8PmRt1eigiNcI6c4KJqW9fX1Fy1nzOOsR+2DI1+eCp+Py7P6N8iZCgdzfGjqYWpvNzRpOAA
 3KJUZOUsflFMMUL6j9SjuNVNoPu1B3HRyG3EcG6BDQWjV0msaqrCU5yZeNYYCmFjw3dDr6T+rKv
 v2DLcXTam7XgJzljeVqXAifFwH3LiwIlL4hUAy/g/prOeaVdSjGscIkk85D5eCLWXFuMu5Pmr0E
 ujMVDc8cqQskP1QYG27yALmO3DB3l19d3jqH0b4/MbIv/6CBkf9pfuso285TPLKw2wn8gVwkVdd
 vi0iCqckc7QHiBIKiY3M7YS6YuKv9GYVwo2/peIp0RQQQslEQEUzzy5A8RmI49qz3rJEMtWrKZc
 FnRdLhRXnAsBFT3Ns7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXy59Su5fK5q6m
 hkYeO95034og72qBmJs90zdOSQ4Gb9Qj148ciW1Kp9anyonZbEVmuweRvkfG8buyYcnLESGJt8Q
 Um/Hf+gDg11pg5aNpbhy5Py2qZDTKjA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP DRM master needs to reuse MSM's GPU-component matching logic.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +++---
 drivers/gpu/drm/msm/msm_drv.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..bb383bb0fe8e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1094,8 +1094,8 @@ static const struct of_device_id msm_gpu_match[] = {
 	{ },
 };
 
-static int add_gpu_components(struct device *dev,
-			      struct component_match **matchptr)
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr)
 {
 	struct device_node *np;
 
@@ -1154,7 +1154,7 @@ int msm_drv_probe(struct device *master_dev,
 	}
 
 	if (!msm_separate_gpu_kms_components()) {
-		ret = add_gpu_components(master_dev, &match);
+		ret = msm_add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..aa5dfd82ac6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -523,6 +523,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 /* Driver helpers */
 
 extern const struct component_master_ops msm_drm_ops;
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr);
 
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);

-- 
2.43.0

