Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3611A3F075A
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776885748; cv=none; b=mki/58lCVL/5Vh37Ma4CSVgsqvMnKIwBdPW6bu+ZYR250bPvBY4wILgLSV1AH7YtXvy2q0Kz1mK92KpPQ+m6+rJ9bUL//sXqq1tBSTEdl6DYVSxJN2mRzqgK9CWPGurkbPlmnjkjVE/8/DKlHfHEN+VESeDVtx7WHjxQQvZEekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776885748; c=relaxed/simple;
	bh=DaaY9JMftRxObm5OZZZ+H48xFNU9MEELcWj2Zf/6MG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDj1JWncMPEM8lRBsD6o3Aa6S6jCA57jRGPF0dALbyN9hwKkf1FsgGVNK0Tj7lY1V+i1WmcH60R9w4AUtTCzQ5CJAjIydoUeui7aK4+n6peNEWZnZfp4aAu6WoF8xsfKZC6F31m7Fj/IosAWMxj5juQp2RSBy2ypHA3txXO70Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A40eLM4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEN32ky2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A40eLM4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEN32ky2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3moh121902
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gd8Jn+YnGMOFa7MuN99QaZkw
	rSfwywBTf0cnvOdaVqE=; b=A40eLM4tSJzOgUsqpN20mc6f7SS9kzDRFvqemXUc
	RCnz0ii0ZZLvHzTWFDqyxPR3rQRdW+SkiJFlFeYWDBw9amuvYV5i9u4qkkP2x4lJ
	O5O5QRd3X8u3Ye+jwJH1M1jb99OSS+Lwhc2hj5PH6zJRlFZRc4/X6WDEZbYK8xc/
	16RyB8/NvxduzDA7FmGvC1990/r6nDyzciJ2ZmoMqI2uaPkZje5MsUhToIG1qGah
	3/f7J9aVVYb+UVB63vwIl9DIKNWFXLRmn1ax9H1yX1GMt1RLBA+PbkHBXvJOtmtr
	GlE9OOlTJS9Q5FmSyk4pZcPwm32+mma3bVT9M11SsP92YA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h80nqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:22:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso51578491cf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776885735; x=1777490535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gd8Jn+YnGMOFa7MuN99QaZkwrSfwywBTf0cnvOdaVqE=;
        b=TEN32ky2HFzwg5cUROfZt4gwH38evIZkm6OYCPs0hPu9QkkpdsnMmMuCN2I+porNGc
         xmF3p5MJt+/BGsk03QjWHP/9CdlowLQM5DJlYjJp+5gIDbDzwtRR6nu2jQE+XqsaVDuY
         5EGDUZkM1o/s0STrt49X36Ajiy1pw8lVndOPObwjMiirgDIPu8vKyfx+an9A5PO9FZSc
         dogih8x04dGdi1gwhJl+ol6kYuLh82n+o781bPCO5sNGxpVoP+a6iqM08lTe1b2sP+fc
         Lz6t6JoNQ5hFxMuSHfcHnXLs16AD/VjKLsX4tU5X3Dd2T/bB0m06bmmI6J/etONcPSHP
         kl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776885735; x=1777490535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gd8Jn+YnGMOFa7MuN99QaZkwrSfwywBTf0cnvOdaVqE=;
        b=AjPK30Vhkj6GLtSG/wzjPG/9oi8vFhG9LPTHODlcZ5C69B0D9Gsw+0DfkNgcLgmi1N
         YsDxiS1v3MMHKSkaxS1vWxTd3Neg/t1nht8TgxzkwpycDwFZAlt2uUqgLZeGNqiRunaH
         P7C/1OSyuJFHzR++v5sGEhiImXwmlqfhSR3gj8oDCdoWja/RDNO4YLX+5usRVNVvmEZ+
         HBwZsj1bSIiLsAS4CI0NrczzbESvCuc813fwtsYISDwM8gCvlUz7ZwvzPBjeWDQLejP5
         r+4TmDV1nEdUpUfG5G565HY6ysbfZtYW4XIiF9lJ1D0z5zsSRxnkJrM/DlRJ189hb532
         I5Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+3RP+JJl1LtvkUBsWIs7yw9l8Ctg6vFT0lp5KZTkQw1GdpZ0K9/505PoVRg5a/HhxpcjhYifEhRRE4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2eoI4ZqH7ELs2R96FQjOl9+HoP6C/NCbjQI3bVQvMECDIFEE3
	ppgmHkwJiM0qvi/lsCU+BfkZ19l6mUKUPcK0llOkrZskgx3NESLnK7R4jqF6B5YjaiWmAHuWxO9
	h4MOJkG81esn3Q8yIggb4mWimt1rlFsF/59BKQNswm4M1e5D0pMU3StfpjWk2ZjlO
X-Gm-Gg: AeBDievUCJpsiheET3WNaCMk0j9TXPvBVVm0zm/1XkbSj2UPHq8h3s/3WBRhHoFTj9u
	ppiyiluk/z6xtuMlgpws8g7Uhktp5NstTdZnTzAXALc4bF9YchC8EH1CxHBDwiz0Tm43nX86V6K
	MxP9qGJSAtGY4375cHFnS6oKXKNwwvUQpsHK6A3DZhUbKOFk5YMnV2jKiXotHqzHFFONhlO7Y8q
	9EkaJyRZmc54yfh53+jhre3CeV0OEVp7SbSrpYmlrLOL7BfwDl69c9D3M3RkupcU/fDLS62Ylvo
	0QvyPOuL1k4XeaNglhgJCIv/vvhv59vQezgoNZEk+myYiz8UPClAQo0pNvGP3YAG7xaqfUUaOQM
	jiw9euXL7QepwrZKKpTEZMff6qqUy7aajHx2ZWyilFhoOJLz6SX6a61wrkc0C5qkjMKjyBoeY8W
	/EgVA85t/eAbph9tblaz0GpM92SLF2ldu1fQPrIU/Nrm362A==
X-Received: by 2002:ac8:5cce:0:b0:50e:63b4:9b9f with SMTP id d75a77b69052e-50e63b49f5amr193354551cf.55.1776885735245;
        Wed, 22 Apr 2026 12:22:15 -0700 (PDT)
X-Received: by 2002:ac8:5cce:0:b0:50e:63b4:9b9f with SMTP id d75a77b69052e-50e63b49f5amr193353761cf.55.1776885734643;
        Wed, 22 Apr 2026 12:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm4633175e87.49.2026.04.22.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:22:13 -0700 (PDT)
Date: Wed, 22 Apr 2026 22:22:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: simple: Add timings for Raspberry Pi 7"
 panel
Message-ID: <3z3u5mbngmbzsch3mzs3twlh3aec6r7jokstzv3ghxyusrzt6b@jqvdnuiapx6e>
References: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
 <20260420-rpi-7inch-v1-2-e68d5c9c44bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-rpi-7inch-v1-2-e68d5c9c44bc@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4OCBTYWx0ZWRfX8hn/LFL6/SEE
 q96wA9Bn0OMi29YD1r/xoXgFynKa85FFu0GDwJB4SzRq9tP7Tew+i85WZ15EvkPGhSxwZzxVUXL
 MVxjXFbBqDHbT2ihfv+CjoAGs3E67SbmlbhMBvb6LvSdGkquxOEWzOcS3lCUhRcrMwtt8ftAJGv
 pNOR4dddUt+aECE9ZYTx3USBENXydBz3uI5wo73d5OxSaExIxIEiwOwsx1wWWcTkw0/FpBQvDgo
 KkbYrlIUqQJ3S50l7UEt90QbWLQbHpo0VCO+ahwIGKLVuGZ79lBVLesfL1pCu72jXS7V6w3Q4ji
 1do8nnzLyxkMcxYqAYQxBF6qU2Q+yrVwIzVj30M7gXOFR9SKW+sDkP/2eof6WtVhPZBoNdUv4yK
 9nEVUZGc6A9x1ozkoA2S+K4vWD+eNU5+u4QY4AWP5JKK4EI7+6qbAynfKyEsYmJizFrxfiph4vZ
 LFSBI0KG0WnYJdL5/Ug==
X-Proofpoint-GUID: D-XioWnK3UOObLFmTbOifHQqqmi9n6v7
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e91fe8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=RF00TdSWAAAA:8
 a=P1BnusSwAAAA:8 a=b2m3sqVslbpkhv3KnfgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=_nx8FpPT0le-2JWwMI5O:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: D-XioWnK3UOObLFmTbOifHQqqmi9n6v7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220188

On Mon, Apr 20, 2026 at 04:13:36PM +0300, Tomi Valkeinen wrote:
> Add timings for the panel used in Raspberry Pi 7" DSI Display module:
> https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> 
> This has been tested with version v1.1 of the display module.
> 
> The panel is very strict about the back-porch values, they must be
> exactly 46 for hbp and 23 for vbp. Other timings can be defined quite
> freely.
> 
> The panel is exclusive to Raspberry Pi, and different versions of the
> display module can have panels from different vendors which are fully
> compatible. Also, as the panel vendors are not public, the compatible
> string used is "raspberrypi,7inch-dsi".
> 
> Note that while the display module has a DSI connector, and the
> compatible has "dsi" in it, we use DRM_MODE_CONNECTOR_DPI as the panel
> itself is a parallel video panel. The display module (as of v1.1) uses
> TC358762 DSI-to-DPI bridge to do the conversion.
> 
> We could use DRM_MODE_CONNECTOR_DSI here, which would have the benefit
> of showing a "DSI-1" connector to the userspace. However, the panel IS a
> DPI panel, and gets its input from a DSI-to-DPI bridge, and the
> panel-simple.c behaves differently depending on the connector type used,
> so, DRM_MODE_CONNECTOR_DPI it is.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869ba..e75eb20301f2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4208,6 +4208,35 @@ static const struct panel_desc rocktech_rk043fn48h = {
>  	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
>  
> +static const struct display_timing raspberrypi_7inch_timing = {
> +	.pixelclock = { 10000000, 30000000, 50000000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 16, 72, 354 },
> +	.hsync_len = { 1, 32, 40 },
> +	.hback_porch = { 46, 46, 46 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 7, 21, 147 },
> +	.vsync_len = { 1, 2, 20 },
> +	.vback_porch = { 23, 23, 23 },
> +	.flags = DISPLAY_FLAGS_VSYNC_HIGH | DISPLAY_FLAGS_HSYNC_HIGH,
> +	/* Note: the rest of the flags are defined below in bus_flags */
> +};

This looks pretty close to powertip panels that have been used before
hand in those modules. Are you sure that powertip,ph800480t013-idf02
or powertip,ph800480t032-zhc19 don't work for you?

-- 
With best wishes
Dmitry
