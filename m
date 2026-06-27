Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62FE3A1690
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554536; cv=none; b=bT1hHfVnKi/xxalWjg02Cw6TRAbMGXhMzGKPYJFIToXl8LD3kNYpN1Kr8DlyH0Fxs6iJJRm/8AdrLFHDOFTCkcOtlQ6hghdQEIqlQlNJiOfg2kj2KQSiE0tmyWFLKwiIoolYHqXCOr0s+D/LnFk2K5mCXzgQN1TBYe/j508B+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554536; c=relaxed/simple;
	bh=OLwru4B0n9B4zjPqkxB1ugvevxz0A4+EymlOnCUE2yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uf1TenVWjH7sj4Cs9cDz7Qm8on0YrsEWhr0he9FCSs3czUOUTql+WPoa8AnxoDRp8fda5Z/n2pCxkkEgSzSOKGY1gJ8jhaWEWczemi8Cs8F08kgiR3/jByHLli3A8xFwYcVMjHoTQntEjj5Zpj367xLd52hJ3wMB4Mo1beyt0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkW2Ds1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXzXL2A6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkW2Ds1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXzXL2A6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZkU0696158
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPGki1z//OChB538XbgvR2XCB8ufi4VZsCeqa27hZ9Q=; b=AkW2Ds1VI8c0oXHR
	Ej9yFntuegjO3YQYLf56EUUFYF9zhTQ9fYI2krdzRm0HT7mexdzKI8/10dq6T1Gg
	Zlo+fkYtpQC3+9CRhlso5s9oRtRBvPeMMg6/nfi0XvVSwUpMrfR4/wRxT/bGCfqN
	Un2sjTPDHQwjcNSgvxHaPI7m8E6o8YaoGUudy6K24KuDrO+4aFiE+IZ0sMf6rhk0
	mnBhuv5w/2bM0XrvEQZvYrEYCL+JjPoSoH13exyLg1X/ohMqO+B59yfxhRIcrYRO
	kOzu4z2Wy8qHJJG8eY0442clxxkk1G3fK/vShnVjrA+bUYyfKXRbL4u+32TFdq/n
	AXu31Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27348j52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139c6673856so2851865c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554533; x=1783159333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPGki1z//OChB538XbgvR2XCB8ufi4VZsCeqa27hZ9Q=;
        b=MXzXL2A6HcUMmlOmVhX8o9AEIGfy5+3hzcteM7oZVPabgGHiKg0HyzQbqtmgv8eXmp
         CuRAQzZbEWYNH/AwpYLp2maKpSN2Fwwxutlg5IHoGlsNo219BMxPKwJM1fULhzjUXvME
         igbMRED7ycUUJfIzVDRD4T+I4iTBT3vNc44pifheoqMIZpM+WFCFi55zBgH1UpbYGdaW
         PTFHRhy49dhSnro0uiZnSA8dM7kTXkJ1wEl52tWb0RI5yD+yxzNPa6//fRSupRclYy04
         3uH63s5PJE607P1+am1/1km8vfjJT/EbuOdP5DCrBTy+1acCvlugCJoObekdaPnuphPq
         M6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554533; x=1783159333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPGki1z//OChB538XbgvR2XCB8ufi4VZsCeqa27hZ9Q=;
        b=FZftHtpoHb3pU/E5u+QZLxsjeev0F/payCnd7FqFvI40g2gveAS8W1blVPhv12GwDj
         QC7gC77eAHVXUA4VwwiM7U8GUcSurQ1BsxC8+7FJ8xMdu1zKksuT2d1iKoUbDeIBiAxg
         wqFzQzeDbFUn8EGR0TqC55e9r2MxyAMlfld1vrW39FNsP8DslEV2e5BDkWsErhHVl/lt
         O4kq2dsYaEVApbnG/5a94kArEHZZgqUpWVZymzUB+wR8cBFUG5xlC1sXoLQb7nUM2V8x
         1jyzMgMfn2cqYoWoFVLsl6LiOfEGbJtzZ/iiXNq13PAtYV9Z+/G+V/O4gTWIl1gPX42Y
         Z6Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9GTeB9Kd662pJkw46VJs7k5SOh+mEcwN1ONPKtTRwA0vpOq4Qz7Y3QOYl1heFvYiQMLtqf+pswMMg/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2A/zkilkzUMIM+f7YIasLyibiJ69giuwDkj6ozgVbAAur5MW+
	sBRa7QyT/bnK5b82vh2rY89RKqFmFws30CxZ2nAhNCAMeQRSvceSVbNt4OkiBdTYqgjfraDSO0l
	D+//p0aDPYjea4XcxzC7nOM/EGVteIZO4upi65sc2b5owIEAtXYTt42pdPSEEl9k5
X-Gm-Gg: AfdE7clOEEzLgL4XNCxPE9xyiKV5CYtlz+OTAKhNPi0NJOKBqUgF/fWk38W/LJyI3xb
	w8dPyBEd6+4GMsmgBVVN6qJzi11DF8Z6kfw/NcgfWcklQvG+QIX/CewyiSZlLiM/2ineONpjjwz
	zbk4EvYy90Ypq+yUXuSqkJLMyvgfltT9tdvgPUlv87zD0WIv4ntRe4R9XY4LRCO0UjqOrIgzNN8
	qzyY6L5NQeAOC5Nc4FfHa1O+DQ/SGsxGPD/+MUH0LrQqh00AT7+9lsuGbBz+alcziADyZxDsxKw
	kqYs6G0Qma56rop+dIUlQjZS2sPyrWkfGPkcgmHpljsCtddFMLh7hYiplgSWT01jifrfGL91WBv
	yTKm56o0i8xdy/5T7NevnUYrGsXp98b+ujCNotw==
X-Received: by 2002:a05:7022:e0c:b0:138:12fa:3794 with SMTP id a92af1059eb24-139dbab9a56mr8471991c88.26.1782554532884;
        Sat, 27 Jun 2026 03:02:12 -0700 (PDT)
X-Received: by 2002:a05:7022:e0c:b0:138:12fa:3794 with SMTP id a92af1059eb24-139dbab9a56mr8471971c88.26.1782554532343;
        Sat, 27 Jun 2026 03:02:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:37 +0530
Subject: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-3-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=700;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=HTk7aJ6aEI8OqBHaXPdZyZUgaSNwdzb6u37QVKXf2U4=;
 b=YIKVpBf6Han0nPA1fwpOFpZq8UmiRj4F/gL7Dmcw4f7Csyy2mM3I5Iki9yyYsGbO3W3BQls7D
 pCWDMLbItWUDfsfUXGwOwC77SroE1bXv9L2N25c5+5Z0bY+FCVvb1ZC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: ye-gYD2UJwkonYXP9SHac2zetv12wQ7h
X-Proofpoint-ORIG-GUID: ye-gYD2UJwkonYXP9SHac2zetv12wQ7h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX4vlCxr8yaRGe
 gC1pMZkOOg7m7h5uQ1xstINqKLQveUlFn6YbsdUGjBj8PNpcKO2cIQwnXn9gA9Em6Jp9rF3qmEe
 kjx8slCyx2YVKXMW3YNtA96VTupb/zM=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a3f9fa5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX6btGn/xkl/5W
 BzZjnSq2Lv+KD+fW4jmJmclrjLvibJ1PwY/dMAKu2r4D7GBlHsPl0a6CQIeXjwDnACcD0w2v9EI
 zMst//Asf8x7e3BlMLcvpuw3eQ+t6AtK3RaPSYp6G1KP8cdgAA02rFSN2B0E/ohnsOp2X+e5bco
 aL+yVa46XW6keGPOz/+YF6ykbk6OwpBmvrrWzgyZBjV1QGRdxv9AEGa6z+0HUh6BvSTr4wayL0z
 a7j372SSk1l4a3TXlHvn+sbsP17EFbfAuVVOMCI1qOyomYKIrCBGsN7R/E8BGL4vLH2s+FPDmX7
 /hShzQAz2cvIgde/9eUz0AMzEf2DHh786bX3kGBynxJ+hrpw9dnURTMtg05U9ilRCpptKTLolsM
 lvzMXdFB9+HRE7fZp6bvumcgqnmOt8UkXV50S0tvEsGVTu8pPekiK1g39bbFYQMz5n24RuYjhz0
 97nu7BQ44CZ34IYeH4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270086

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..0395873ec03f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1009,6 +1009,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1

