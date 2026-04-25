Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1337346AD7
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777127070; cv=none; b=Kx9sbcol2kWGeB9lFwAb+TnpeWnIiLV3YhinciOvs09qiatDD79sO+8253m4tvxo5apNOShVHPeHTf9QK1gCBm7X07VNqbJwtpHFfzLS7tZpn6NeEimKSStP0GBqF4Ix9OGZfjcx+nfQMQda9gTtsqxZAcTLm3IvHP2YZxq1faI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777127070; c=relaxed/simple;
	bh=9OLKZiD0LziQgnO4g6u7E1A17+jLJuOlpxuaeaCg2EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8twxI7vyZTuJsqvamq5C2ACX2d2tgD4l+6tgmRrroHjDwXr3PFEmIcZJrbAMAwtIfeqE3i2uvjTl7ixR5GX+u7l/pQMtdoFEK/Q/NsF2TF1PvWGb5Kkl02k1EZM5SrcfxFBoZg3XllWTQSOFo2ky1Ui3wwDsuJiGf9HTkbBnn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV84CZbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDOwsV3c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV84CZbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDOwsV3c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4n5tT3846108
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixUuUGkcS1ogu+Ork+yFuS7W
	ctoV+chAiSQKyR8/7As=; b=LV84CZbJ73kJp0FekAB/P5MFtE8cPCFmomVJgA8/
	HltgsE2+S3s8RndEDZoWzufhFPhHv9rrTgYsJVLsGLo9EfW4ZKo8Uy/7t5E2xpL9
	r/Ul/d435zV2Ukr6cwrKZi7VfHBAROBA35u8rKTxC95sVgHDQ5UeGZssUWcjIoal
	IkKHCnmJZJZA9T/XMO6yG8pOqkkf5cyJC04dmRMJTe+iyDuiAPrcutLRx2ixA91i
	nfrv/Mh/xsbRLLxxbY9tErJ8BxDhdbPMPHU36B9/DROKtbLukDyzJNwhu/SofGbU
	E0sK/QMRT0pTpQgi6e5k19Jh+GTVN3UScVIEEyLx3+Ef+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw98y17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:24:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso25100221cf.0
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777127067; x=1777731867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixUuUGkcS1ogu+Ork+yFuS7WctoV+chAiSQKyR8/7As=;
        b=MDOwsV3cXY87DzG45/vPbpJDI834pDazdsi9y6v1gGbdOwl9hYbFvLln/iuX/rELzm
         UQErF4MrCbWHum7V4mWerfyToGxJHbiuSjiwHklgpqysr+RE3DtA9x5cLg42DB6kO/gp
         lKo7YLTulcacXbOY/Et+2trK63dGwrPpUJRg8kpIuqR7zRSv3DEhB+8wivQ14X49A2Ik
         s5VSW5KZj6CEZ+yWbJNinNvOlsqhYXEEjEDCKc/xjtynzE7NAVG3aGy6XLbLIQJwkjgU
         t11EXJAKaIzNEW1FqbCZ5ohXqYHYH9m4NMfWrNcvoExrPahGvH7axEiJloApow4OvJVg
         Q00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777127067; x=1777731867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixUuUGkcS1ogu+Ork+yFuS7WctoV+chAiSQKyR8/7As=;
        b=mNZSqOya4j0az6zMs2mE7tPAp/PXoNAYxMK+VbcA5MKxd6J/2CiJNGLVObUXLJ+JhF
         EMJn1m12MfRfiP3OQfFPuzTmGmWWxkoYCDQJnr9K6abrkpWN44Vgu+lMZeMQZUuzEuwX
         4yLxT+xVsqNhdMed6961AvGqMa1N5JnOZbts9Oq1AhgotaOeEmyx06xZg1LskDVMBBIJ
         9PlMXDdHA+tmHvAxq//7qFN4lgXs9PJe77jfandXrmYRCCB26ugeIXFaH5iqWBCrkUaa
         vZqM28cSZJehTQKcSjvq/YdZr4viRI/u4/Yt7VB/YpftmJuNQxuf1hyPyhEHQ8G2INL2
         q07A==
X-Forwarded-Encrypted: i=1; AFNElJ/usOTEHzVwmZHEDKRYfZmuF2iud/asxdYDb09zHQ7eaup9oEk7QiKTc9JnEeLmpHL/pJAkjKC0wfo7@vger.kernel.org
X-Gm-Message-State: AOJu0YyCF1711z8wOmpDN7UFhK97R7v5vgXx7yRb/soQYimrQQb/J89n
	6EvhBM7acutXJ/n/E+rNHcfRgmmT78ytOb6DJ9hqLY1EN3aqrtDeYcH9N/KfU8X+ilcIY+8x1gN
	0jMJA02gjRi3o1H3CT8mFe0OkPp6LVfq2bd+kseQWyX0aXEnsru5SUFJVKzQZNa+y
X-Gm-Gg: AeBDieuzVC49k+zkwHXVQt1OJYXBTQhRkELZfv8j0vXAG5Xs6HkdnafESAmQOWADGxd
	NRY8TxOF9Fn2sjwJcSpkgdsqBZ1chPwdQmw9C567l7VJ5E2WH2JGKh3JiQA1jNUGIiHwqZ29VMt
	iAekuHFr4oor9lcXMiHFIeVfBiLYXse3pvkp9rvwMNtG0B6dKkiqnnlsBbdgOzjmZnlabbGsYBv
	Hg1wD6wkkETRkR6GvN4CdUMJT8wPm7hYJQ9MnSUflin9uRkLprs9AmZkKOD+n2yy0jL1LCnFFiA
	Kkqr0QRt+YVJhEqxTVL/BiQZIpQZLUsIMgQCcW3xoEHsbe4EkIFrd5qmPd+EeSxtA8sPSKuk9Xf
	+TTVAN+7zEh1gfDzPVdzNYwiJiiYPN/WKSKkPyr5OFBMKjPWB7KunIFC8zafpU5wimULW5jJtMb
	n/oe3Pj8LRnvNjUFJ1keM7fUZvmRIHv5sORs/ZDAKO113XVA==
X-Received: by 2002:ac8:5dd1:0:b0:509:965f:888f with SMTP id d75a77b69052e-50e3669f7a7mr531573871cf.0.1777127067118;
        Sat, 25 Apr 2026 07:24:27 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:509:965f:888f with SMTP id d75a77b69052e-50e3669f7a7mr531573301cf.0.1777127066688;
        Sat, 25 Apr 2026 07:24:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1116sm6909552e87.54.2026.04.25.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 07:24:25 -0700 (PDT)
Date: Sat, 25 Apr 2026 17:24:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dennis Gilmore <dennis@ausil.us>, Heiko Stuebner <heiko@sntech.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425112844.GB2964234@killaraus.ideasonboard.com>
X-Proofpoint-GUID: sBHVH3E9--R74QUPQrHXk89olGVG7TkA
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ecce9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ssO-rxKZoUVbP6lRNB8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE0NyBTYWx0ZWRfX6nH/Y19xV9iN
 zynBiWwK8csuIwIP47bW5sEXGFnd+JcBRsV1z4ayAplJFV7nt/7lQgwRzsuiM3Qr6RhPuCUtO1C
 SeVyK09ug7kDW7QAbu6R/ww4qheo5TeL39VERI0jxpee1pvWBj00vzKEeJtZ+uG/Yg2nI8Zpfik
 4yGNgS1X75ylRg1MC0pO8bwe1C8vaZbvt1qU3MXe1UWGxy+pXh4VpKD3i0+MCQDj+mYBLee3aYW
 CQV2c9cLgJVTmLImSOpR04azVZrru9JM1vHrpmd4B3X8csnYPEqR1ru8g7VIW3iL1fGIVA5P+XN
 OaNI9QXUiLV6F1hQFNyxlf32rAcgdtQtZp2rpp6WLmZEQEQDAB6Ym6oZiWT0G8536cBOzoCmqax
 s7Cz9KdHE4w6EX1u3IaQ7MaanivU4RJz2YcIV8ye4kF2SGx9S5oeKHBCp+/4DGumPME2JUvtUoW
 jzQZkIGuo+YYPrzNijQ==
X-Proofpoint-ORIG-GUID: sBHVH3E9--R74QUPQrHXk89olGVG7TkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250147

On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> Hi Dennis,
> 
> Thank you for the patch.
> 
> On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > a DP1.4 source to an HDMI2.0 sink.
> 
> As far as I can tell, the LT8711UXD has an I2C control interface.
> Shouldn't it be an I2C device ?

From the datasheet:

The device is capable of automatic operation which is
enabled by an integrated microprocessor that uses an
embedded SPI flash for firmware storage. System control
is also available through the use of a dedicated
configuration I2C slave interface.

My guess was that it can either be an I2C device or it can function as a
simple platdev with no I2C controls. Please correct me if my
understanding was wrong.

But now looking at the schematics, it seems to be connected to I2C6.
Which means that it should be desribed (and bound) as such.

> 
> > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
> >  		.data = &(const struct simple_bridge_info) {
> >  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> >  		},
> > +	}, {
> > +		.compatible = "lontium,lt8711uxd",
> > +		.data = &(const struct simple_bridge_info) {
> > +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > +		},
> >  	}, {
> >  		.compatible = "parade,ps185hdm",
> >  		.data = &(const struct simple_bridge_info) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry
