Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592574;
	b=3ATHGMVH+V+4ZepDS7gH+TDi8BTJgA1EkqLTeuKT1xoFOWPNKg4fg0CLMBR1ZFkZ98J6
	 bRTIzvrA2rcG9SDd91CvYYjIxKqPk2P3IkBoAAc54E/Uz3tC1a0AnNK603Hs6kBWUbuOM
	 Dcf6V0R6cEvH23gEe3vmhDatp2yirdgdKwJ42tyLVtyNojhFkCcfrN6rm5/iaXnKlYYon
	 bTg9CeM1+GIrFwr3ZbEXx+hCcv7Y7zj5NIhDD5n9WfjGeB1D/DJogpoUNPFXfQFjXu3hC
	 QMaL7xRvadwVmHTye/wDqmSYxemaHB+3647bUGa+ZMWMnS94LI2ym2mhklkTw9Me3iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
	b=OmqGyNKo5AtnnrqEytyN2rwv85ZPMwagWUPcH7w1MlUYUHmC06iiFDP65tKouZ5dwGNu
	 mgVPQcprJ6QqCQf36UxjVA1WW5JMVuP4oWkjh1MfmRr9i28aDgMLWu7Vc0It7SOOO4hpJ
	 5UlX1fA0tRjToaOdsV0p3ERTJjICxYC4M1vCWu5tr6/KE2kClqiAL31XfS2sZ8O0vaJG7
	 9gKJJVDAb57yxqVrz/EcnwftL5p1Hbq1Dwg3Eu82o4nYFusmrf7iEB+Zjr+BsTYIDgsSj
	 IfXKoBUdEuKw9AnJ/I2lWzIJRW4Uqi2etabyFeTBfyaizVOeXnwklvER3zo54ytATug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZtr1oK9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747760A3804
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7747760A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZtr1oK9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFPEo309928
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=; b=npG3JVPex9jt6z10
	QuZIaEnlHy40zUnbeFPSTkYUmeMDGFZCXcebettzkxQbnZqXYb1i17KBG/KDiysh
	UelSLZXKjkX/RyEf17chZpDVJSP5F5OrerMgAeXCQOciEjkHGbYyXvTJ/wSzwf5b
	7I4hQsZzIda/5wP6dgYsd3XUw4yeXQ7u8dhF9I6Hb3aPNQ7wMnGjaudfezCAgk+G
	M4rwAjpOd00qImACEhz8A1xLA2Q5bbM+bpxB85kz9yQwp3CTMxT+fYRGXbChb/VK
	rmjLEx+/xW/y0UITXFQEkJY9uJ6zQPq54qDgy7HF9QrtTdJyppbceRbGD8VsAU+r
	80lMdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0mbpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313b1501a0aso81859eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592573; x=1793197373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=iZtr1oK9aLkpe7Au87SRx4LXNHm+fI3gxsHJ16TVwtpr2T2BtpPfCZhMuJaWe5Iw2I
         VOfJh+93At0+46yAqHroSszhSA5UnmUkKHEvJAcAqFgkJbFftxHYyVnGZbAXqHnDo/Zf
         ew1jN59GbR2F7FVkgid6FYDePkrXw0KhZrS9Tfr23HXvvJG9OqGoUy5NvOsullhls2TQ
         wgPDamDSvfCU3JTN7Ow9XlK8P5PwBkNHxTtGYF4Pxxgsd3nC7K1+AWdnny8m6NyW6FBc
         iFWFw8tLFh+Frdxc5WGH9gtLQtrhBfaezMv9vro2U8jAm9JjyhRBFJgRb41LZiC/y8AP
         gzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592573; x=1793197373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=XMjujVl6OTkySA8h9HCblZgalIzkJMIQCkBDOxfNZbXj2Di6Rldc3LQMfwWgNElhUL
         IWgTlvcxq0TwPdYUyCN9WMl7oxcE+VQFuXW6RpWDcwiV1SqfU7WYqwXKTKSFXMwXJ0OV
         7clUI1yOGDzcDp7aW/RhxggSD1oizFPe4HUY97FN5PUw2lUeTUsuDq0SZ5A4ORLYoCTp
         dQ0pQbkdInntG0NBwp1qvl+MBG8G5+yaCCXpifQwtklfK6fSHCXsvNbEE4KQV1kPsM4n
         ORxsXxBpkz23v/TyKNwM2WKioDtZFLwShjm9V8O/VEXOmwJco2Bt1Ujng/DCm+JyctPG
         n9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFm3esgQUeO0HCC1XvedED9S/XrZBp/Ukv30xgLpaJ/KyuaQoeqmzmZVqm/pR3c41nrtycWPdyCJzM@vger.kernel.org
X-Gm-Message-State: AFq9FYKhziQw9V4llqYIMRFNhLi9mCI/jpx+TC9g6C0XI4ujVumVeJ51
	5aNv72KDJVpcZfVfAPYXM66ypYxvZT708ceT4Z4wgm30nOuiFZoG2zYsn25rGioQe5dy4785CCp
	mPYd+cpSgVDhSzKV2Li5c+X3zbkpFFq3aHZ1//NeIsZhYwsf70lTsPBIuD8ceKHEk
X-Gm-Gg: AYBFou2jKOvcOTgir07Q9R7L4T68NhK8sLQblVnGJ+XS5IWhcSk6UhkLApBu35MiSRB
	WuaLace81j3/Y34cP6mLtNMNOUij1Hd/Tmv9TMQrYwEXKHApflZPTjRgWHT8PZNb87vBHuBnde7
	nS9zcuI+r6+vC5fejadhV3NoNtS8bM3rbXcbb9xSkdVlmoK9B8eGYALs+8QLA/2gQAPsCTvtV8b
	TvD88NGkvFxFrE/mdf1Ool1VZNh0x4bTd8S1Z9y4Mz2RqxoR+22ut4IDhtm8HJcQF0suVVu4OGu
	7i1OncK4OX7lJ2YEdY2edYbgcTcYJiFWZNC2HkA14Tu6NslbJbEXUOAMr+fwuMLfQhVlGfXDPTi
	Uuh070qQae6IBmwrfh2oYOF/xE4NpF+lT5/ZYJYYpyJFW8VDl7Z1ObldAnU3NGxksTT8nhDlhRu
	mdiL65YOZR1Mg9NcfYHkwMKVUkEDPtq/GGWDm2L12+xfpo8qEJHgI=
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156117c88.2.1792592572919;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156022c88.2.1792592572043;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:51 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:49 +0530
Subject: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and touch
 GPIO drivers
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
Message-Id: <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1137;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wKRFTCBJIBMmNDY89gm1Ek35up9XQQNdIjIma7SHnF4=;
 b=0bZgy1KRlsumildNKdSdrtd+3ObPSv+aCKqiaI3pmsuFxXukpbKiDMIQXPRvPcNqNvwmsviKd
 MV0zGyK0DJHCPB8x8c36kDrYTQpLaoxVrIouWd1foll7OmwigRFK+Vl
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX03xQ6sf2at6g
 fHDsLbRolt41R7FjttbV7NmYnMghNz5DCzBzyO7Wt8u4fIriZAR2HzrqlyDM/gKJg6N/E6oIh2+
 yshImUo37grthTw6OIb1r6SzTG4vKhT6JuCKVqa5xGIvFbPNRKEzd3e32AWFjwILyFGfkuiztMD
 wfOsYDv0jS7X6VEr06mEXVe7VU0orOAyKMrHagdHSPRsLJ1YMxh9wpEfOs3FIQFQ21zE947hxEG
 XlPXXsjKS7M1eOz0eYEfnE4aakaXJDUiVgrb9zTCE29s5VF5IRGGpBQnAU5TOjHlEN6E72Uuim3
 W4Jw2RwSgrY0tHEeNj1OoY9IzTjM5ON34i3ozAq4RcZ6/vZnQpu6m7oWgsRWTIbp8gXfuFqOZQi
 gUUEhtpHO6WQj5q9UulKI18+zm9NMxqIlLGC22VH5+OoQDpvBjjrbzwX379ymOvRkh0oVVBdxLS
 fMqdp/yE6Z3CnJVdNJg==
X-Proofpoint-ORIG-GUID: WEX3CiN0kngrBusDM5W4SirTBU0pKylq
X-Proofpoint-GUID: WEX3CiN0kngrBusDM5W4SirTBU0pKylq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX2O9jjaxCsAcP
 cVbZfxxdXK7gxSJ/roiYVyPy8uh8yc4KOehWEQ7PCng7zI5OJUj5Kiyeo32MCLcIHLMls4XKeHa
 pTWodDov/Pr5Tad8HAl1e6S7bKN7dRY=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8cabd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

Enable the Waveshare DSI touch GPIO/backlight controller driver and the
Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c4c47a44af9..73c07961f655 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -727,6 +727,7 @@ CONFIG_GPIO_SYSCON=y
 CONFIG_GPIO_UNIPHIER=y
 CONFIG_GPIO_VF610=y
 CONFIG_GPIO_VISCONTI=y
+CONFIG_GPIO_WAVESHARE_DSI_TOUCH=m
 CONFIG_GPIO_WCD934X=m
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
@@ -1032,6 +1033,7 @@ CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
+CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m

-- 
2.34.1

