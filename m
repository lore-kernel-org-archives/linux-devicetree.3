Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674731;
	b=UDvMdi86CI/STMtCw6rf+HaCMJxF03bH/pW8ZtgtjcCgZHxn0jJfchdMHPqKTiO30zpH
	 +2xXLZKhb2HKEYTAKJwVm48b8JJOyLl+5YWHdUfV5+b/OyRV2eKhkDQqPmU4jjygKVh4m
	 Huyh7PqaAuEShD6N67laKquHjk/VGiosYc9OW78qvNq+PAJawAWhFmzru6RbEBhaGruoX
	 Z2geuCbJWWjVaqnAInHXHkJruAuXXYSKB9L3wUHF4L4+YWapMJO0LWWKpG9lH3FYaXzWz
	 d0TGcaaUiAJZsPI5zjU1C1Eh7UJkrFVGj1UF19TfTCN8YSWDKTRmo79Hmb4NT0Zj9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
	b=ixKIV/eNV8+XLC5dQUszKpvu6hDEEufEU7VmopyXRVk2Auq41GDRgJVdWft+5jCggOVQ
	 x6PJfrMpOf0/xSkfI8ALdppkVF00UYKGxdhBgySHzpGVl6mKUgE56yDlgaNU3bbbBenUS
	 HvxwRiYma0hYCXd343lx3mm4rlD3B802h1Wy7j/GiHALNK9d0T4RctdEBomVkQab/8vcv
	 KeRO+Nyly0ndgjKtlx/af548muTsAo6R3sNTfaIVIfzsdXuwSetZpwGr0oV8saPHSwexQ
	 rjHjnrifQNX+kjLDPVgl10p7pJ78cLGju42xq36qN1ozgTbK1vp3Hexe3LICunKIe8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B4B606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B4B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36TKe3023720
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=; b=KwLkEcN+3tM7E/Jq
	zrm3P6u1PZaHxwIDGxCqcQv67I8AFt5Z6oAFSlGRZNygTSa8Zdud/JWqoU1ciy1o
	ZVUDxEtEFTew0UWzEEQhlj+leiGzmap8kC2czZcUp03ICNBUAoms5plgWzac9age
	WAcJsgbhjFE4f7BMXMyjKs8I7cG6IJrtN33VUKJEJyp0AcWn+VEDAuZ05Zl7cchV
	B7wsoLBOEatDcqR4Qx15WMs1Vf9vERRaioz7/HjuDhj/znDdBNmr47SurzVMqeMv
	7MHECDSdFczxFmeKZFjYehR1CVIwg5U93GZwcXFmvsvc7ZzlwqLVhg6BuI8JL9yl
	t4xmZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatkqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0467a525eso50567565ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674730; x=1796279530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=YHuwOi48sQZqP35mnueZaBwuAd9EUBqR8x0amSmD/1fWMKj+gHujO2dUyFy+NHyfg2
         AXpQ2zusIwUv9TKmeHqa03rwzdYmtZbB0hPxCHDWoIlT+Q0RKNZqfzpqqTN5yQ7ckXKR
         4W1+sLPKrX2JUQGFEHPJWZcJ6EkYD00ZNNJfopwrAP6CU/WLHQXbz5J0wokC6KelJyi5
         6uo43YD1pxA0r72JDzN0HQKWggcOztz8EXswYWs2kefZ28TAF44q3zfd0yF4+mLXTtEa
         RoQVux5gXs38Kb3p6XrsOjnIDOYDIrezLfpdpojlnp2ChO8vLv4SuP1D7/7XfhSp9pVQ
         T+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674730; x=1796279530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=f4hMcwLDVlZHwm40GoTbuqRulOmfMZhXngp0hmiF93y3ZS+8AguGCQdO/Gre15ItJA
         JbSTRgsK3avGYV4aVFgZRoitQLdhd4rBPnYQHbIlnk6NzCvlczOclkuCUncxP0gVw4Cy
         5sjOtb5oj3zQWjGAeGY+2OqwZeiXRTwWE/lVJ5lTlu6sqzooSPKQkcrJPlWpcKj6nd+B
         IUeKEQRuWfjx8WClDYKgTL1twMkaYTLGAKrB6dtJxPnM25JvMzNYWC4a7OCjsQYffLXC
         YDsR0EEkNGaerI/618lhCc22OK9SDFlNxFcEK/wDj8PIVcRc8l/Gx9US7EvxbviCMBEH
         bh2A==
X-Forwarded-Encrypted: i=1; AL+hErE0InFJChBa+d8y2zBcOBWUF+pQKpHX7p0r7ICl+B0aYPWuJqL2fvr1wohp59xpNjB/VI6hFOqIcza/@vger.kernel.org
X-Gm-Message-State: APuU4Z/X4ly2SuYAI4VZ39/VGJTXeDH9E8kG00EWQfXSldNg+7217T/S
	xnda9+XP1uEZHufz2nl5OVXJRs1005IKIoBNv7b87cpNhvpKNy+FcDLcUQDkVgUHcJL6XMepPIc
	nLX3qZ3amhS3jqawJopiExWTMGw4ytR2lXgtSRO11sq7NRKtqBra8ue26WZrD7lHF
X-Gm-Gg: AZFdTZdt+AxhJbIxd1PNudspRvgKF7/B7CiTQn+9E9p0WvsaAeV8GHEhkxnHEvencQJ
	i51KZpWQEHKmToxVg6foc7VOmDfNrr1rf3RvqMDgFzTEA6iF/VnvnwLFIzCty1QlN3pbo5EHAI1
	Z+CTy348j9aqbQ3kdXqyp4jVYiOT4hTJ7Tdle7dfRvhjM9u8yMcMSVE3oGjA3VuBrYcO77yQVaq
	ceIN8p6oedi1kxJsNe51GrPGlYrzldLKlU3gFep45HcnkHxiiVC3MjtwI+W+KyNH+cbTfQATyh5
	lSwocAwwOZU1/PArUqSYc1TD+y6BDiP2M8Yu0eAwIdsyVWyfIXd/m00V+tYOVkjcqzcXNcPpWrb
	N5kZTK8v+tI2MIDXMYyUIMQCPfeZGk+v3BbrSDmxgm1xKvw4IS5fuRTGAy4Nu3jL+dl9PnL8nbI
	AMCdDgAP60
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218271165ad.37.1795674729927;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218270835ad.37.1795674729434;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:27 +0530
Subject: [PATCH v3 19/21] drm/msm: Support KMS backends without a display
 IRQ
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-19-f1e9d7505039@oss.qualcomm.com>
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
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1191;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OeeUkS71qhEHZfJKt5l7tFxYoS0sgnGLM8wENixTSYU=;
 b=xviT776rfCeMHIFO3g8aaW6MLHf1PKw27DBdPxkNYkyDI6t+nLjVEm6uO4H7Ode9HZee3kh4X
 Qit8ls5DWndAfFs+hSXsT9IZFIJa4EXjRfVkVEvK5CL6qZ2pjmmnDDb
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX7LA1y2lJAjek
 VgAiBRTzkO0f2OP4k2O/x4T4Jduqygso8uISSWP+pE+vGWpF5hrbN5p0k/G2f+QAfCZ99yhHQv6
 H6YMlKTWKCevJl/c6zJ0Yg63LHjxM94=
X-Proofpoint-ORIG-GUID: dVOzQuhJnhzqHNldVUwt9xNiQt4u16AA
X-Proofpoint-GUID: dVOzQuhJnhzqHNldVUwt9xNiQt4u16AA
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07d26a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX4HbnUpPTew6p
 hXH0/4dcM0ONP8B2Ymnk7j/g7MFAms5M4cT5u8e5i9AV3eO9zJFF1KBAJuWHVZ5FujDJlkOWzQ6
 SMnQi9OoTi9t2Vhe3nPhMlwB/DhhGC/t/53jWv6gtJT3fKhcGD8MmECeGJElvbwCGiZ96r5c0aK
 TYBlNiXbysvVum1PY6ldcG/3hZirBE08b6o/+Z/CZEONDFZhEjKnYeNqih6Ltsta869BpKnzKVf
 EFzvqiBk3aVCvjQqtNsihDPKmXiTGTzsGxpa7kVO51lFnP0kArKo+PCowlKJcUnXSZ3+8jUhiYA
 kkgIivmNfRqemKx9yWZcxov4bTEzJfyE9RlC22OkSg3BqYTCHtj5Qz6JBCyEdZGUMvC4jT07Xwl
 1+0ll8WcbETEMFOegCrpbI/Gt/9CmW8Uwq7J4yS/izOjgjvmku1qBZgQ+thsbPVId+NBNTLdpui
 jFuPotQTEW53dSVtMAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP (Display Co-Processor) KMS backend receives display events
through firmware over VirtIO and therefore has no host-visible display
interrupt. Rejecting it during common KMS initialization prevents it
from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9592fa28c85b..fe6f290d7be0 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

