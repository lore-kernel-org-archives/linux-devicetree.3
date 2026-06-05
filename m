Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D53F7AB9
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654775; cv=none; b=Tv3ZTmng6tRJ1oQFHm40pMljHqtuHb+vHqQOfVc4QZKpYPm73rNUu8IbPtsmWCIRqZFNMWlXqGXpF1SsDPA+gA1Jt9WgYoWcXJMpfJ2KXGZJJTqcZ7KSjqE1RZ39Z5G8a/K8drdlmhBVLIxdU7lt9exMaZm35UkJug7VLYFHX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654775; c=relaxed/simple;
	bh=b3y/Ri3dF5pPUhVma/VEkqg6XXHRERmZ3NYb/UDlu8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qajvzNUKGbdw0PRODgBs/MC7xN63KONBUnVTCfoaMu9zHSEK+aYIpO/58zGXwrgMkOUzKjmrWckIs3t2xu8nuUkt+d9UNAogvCQfZgo4SGxLQTFts/P/AU7yDmwIWwzo209REZDytGKCgy/DMMNOpVGi+oKhmH+zqOnZfiy1EJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICYn+N7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ya2OW+x6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICYn+N7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ya2OW+x6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65584dW3021067
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 10:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=; b=ICYn+N7myKnXgswH
	bQo/8lg0kxpiIsoldDGC/gCBvv93FgpFUDsZiqWxEW5IyZI9xSmOtpZ4LIwn+UzD
	YD86S2Oh7R5qvswSwd9/vySzJkbatdiifBNHWj+VyWU+lFp5rh3jyoNMKl6+k92b
	Bo0uVS2dDPj1s7IrkaKU8MNvuhBDlbW8mzjGJtXvhtS7RM4WeWUVey8f8JKF0BNo
	HVP4MSj79zvTpbS2ZAmCVQM5pBT35uE1OmPx17Fs6KQgzvNvzJjpyo6GBLIgAC1o
	jSy5twHm6Kq3/QkqqSVuBPtfaRUZdTns0JQnGWdoTxyagp5KZ3XwGtO+63ujvoM5
	gF/90w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ektmf8hdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 10:19:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c331eda3so21152385ad.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654772; x=1781259572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=;
        b=Ya2OW+x6ubNZETusVDpSdFsptl27AGAvWwKIvQJdza8m3lfwFQ0lQ6CQoZtVvB335R
         ZQUp0WHGlkaU6DOT7dfxbvkgpaEaDiBhhufCkzWdwTxy/4ZA10VjEqbsOJHObpTUSfm4
         4zILTSUR0cYlSJGsfjzywXxTyW1wbEjDK8tvAz1G9AyeUZau2vW2CCp9jO8qP27zbhbV
         rcfUPbnqrinkHMjoZKtHj5KXMdj5IOrCfCLhivCMMTzaXTIC/K1bVRdhSxo3CIc3eahR
         jQK3nvzxhoSoAWDXq80xLoENKxbSmVyR7JMgII76zZMJDWEzejr0fgu8mEDVBs2GILE5
         ktxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654772; x=1781259572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=;
        b=Y3KVImjZxJs+cB9RLTqInEYDSJ9V0iyPXsxXWDoL0wTXVMyO/fYT4fBiZy4TqXPq1j
         7xERmUO7s3KW22tEfAccYjs30QF2hzG0qjINlEZBDyi0uJ2Cy2YUDpvUIiYDsE8e+qjI
         Xl+Aolj3vFsOGiWApGl0G8ZNqSbry0K32eIIl5qXrIEnwsqvl/6wwV1FhMOoZKHO3xbQ
         cBS5YMvbotLzIZrE8yqnUXFPICPwja/xolNwQWtGuA1rqROKakz+lcjk0B86KU0tfwWp
         IBEdR/9HrQpT3E9mr2VX2PRbPTmi8GGO+h7hARbhE7QU+LJN58P5gDdpEe/TL7QFXhnU
         oUow==
X-Forwarded-Encrypted: i=1; AFNElJ+ZnepElvhDgZoRWsxwLPzwgm9nGjfyRROGblHsfNuhD/jtt6LxqWvadnATUZivRKZpj6rt6Ht6IrW7@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuPyK6ecEKza5qHfh65iK4attzBgZJLAj+9ZeMI7AHxM/YWEM
	D6WTP6t+thhkqSmtRrO0Y1xRCPeiD7tB2spIN/1dDUs0XQoHIJ/1wnFAmD/az+02ejuR0IObJbi
	/OgbXFescUy9FVBEiQJbEJR13WX0B6Cg8VWHzQbV3ZNdgEru/oRJIsuCmYEapMEJD
X-Gm-Gg: Acq92OH5zHoMQOgc5D8cPJrllp3ouG5CSnRHNKwXkvctqIJLMv62qJfrrM6XkDnMxko
	ZIypMLZCBgTAsV9027qm+PqSDIC/heQCm9We5IWOsdmTTdycesa8GA5D/otTMe9EODQBKbTeZbO
	Yha7QiSw2yDovz1s12hhHvLpPoVl6IQzU97oH7w4rtPN/+SQxsjySQC87q/8vZIFtMEZ/2U3NZu
	EwA/nwlLEPKxwtTvjnPjN6ZMBxPcBhgqlczoJKLZxERytxFrbLSILVQY/YfkTaWVPktuc/3XmCK
	rRrja2tufsLyDnipBJsmUDFGspUsmb7msHtI0pC946v/uIAV8m6G91psRHrDG0/7gEJpj2YYjoe
	u7vpr4sQwsWWhR3scRaOsRwv1Qu+uAPziKaL/5FF90eDydQ07oVSTKJgdg4g=
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr31586125ad.16.1780654771916;
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr31585795ad.16.1780654771441;
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:52 +0530
Subject: [PATCH v3 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=775;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=b3y/Ri3dF5pPUhVma/VEkqg6XXHRERmZ3NYb/UDlu8k=;
 b=HHM3jKlqb5X26mBRFsD9fw5P1MjZUiGWDaoGxngkOUjuZ5dFNTpjD798rKw8GJ45ZtvnSvf0d
 90SFK/4Eb5ICuvRht1mtLZquyu5ms+kCPxWy6f9+XSOw5aD7GeN5o8L
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 3TL2aYrApn9KYHKzfx0241PyXsf6SoUg
X-Authority-Analysis: v=2.4 cv=GolyPE1C c=1 sm=1 tr=0 ts=6a22a2b4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 3TL2aYrApn9KYHKzfx0241PyXsf6SoUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfXxm68bBxNo59N
 awXGeIXQZHUjGyuM265vPrUjrShvuJ4Ey+Pv0cPpT7s20Cf0yiFxbr4ZfU5BCuYqs3zhz/R2948
 QGSpeXkCtgjkfzpEW8GZ43tDmJ3gPE343kU98gpRHzAogSN2QLV7XOeRCCzZE4dS+zrA+rOInO0
 ne6bMeDjV6S3Tz5UN60WztromwenAEZuQWTNAtCB2iy6A0gEPLrNWcxJCGlASLogZNQTdbrQAY8
 tlc9bv9aauZ7tqOPGehCgOsDo7EFVvdZG6TmZrCBgtC0vZo0IGph0X1w5YtC7WvGrypaD3iWe/5
 0Pjz4r2iyGACuuMbwUY+yqu5mgCyG2eex5HbkiqZHglWhyYQFF8/uOOvttsyUH9oyBJbv48sEkP
 Idk/W3vyeIYdR/MIExP/flcQuMqTm95+dL45CWRx4xaK6a7wEdgTkGGHJXChNX24aRA9ZYOdZRl
 9xHFxlvyjb2y9nW753w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1

