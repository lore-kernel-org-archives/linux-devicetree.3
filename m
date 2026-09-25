Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC1F49F100
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344199; cv=none; b=hw4B42s35UI8r94xK2/JiYpPrLAu65QykGO+uEpqPMZ+EqSDGd+TewUzvJYxbX4gOzlaNMU4CNA+0lrlo9qLJiGHEZf3tkwrb8TT/sy1wlCE+vUhnDLBc+a7TQcqI0px5/5g8XEcegGBTpOBBexOdtOjjIK/Wqq3yO+GoG5KsaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344199; c=relaxed/simple;
	bh=MX+vrIgS1ywA4qaorUa6JwPBZ30cDrf9GMoZgU50GBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZFBDif3uIYWTgcVa+ZOR2V6N2GKvv7aZ77T5MrS6razXaBgopn1vJWbxC3iY/v3y0W98aCF9uwek+IralNjLcr0fE3aSJVetsTVVKVLTHgg8zTspJgutKHjo9y8WJqKSp0v9JJa5Rbykj0ubi9q9n63V4AL1UjKklppVnTpSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgRlUZDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZ2Uj8AT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgRlUZDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZ2Uj8AT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J5Fl756811
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t6xPkxuvJoftYbLtH1g8lpuw
	KWsBecQ19PbQ95iT2Ro=; b=VgRlUZDgO4FjOvEGw6F50IArihOULTImgp+1g1z6
	YiUGWhHvD3xxmhy+ng3JzBwaEOCgeK7xGv05sQtccdJIFbVliGGfclUAhyN56kxD
	T8+YHGn+eNwaXU0qW3UGub7sqQdKwtxvPdpeLhVu/PlX9LeQMz0SY+vzz4Gln60D
	QD5WbK90AsxPu/8u3ZgcF7F/WgB55wA/Ocu8dxG6s8JbI8K9csjAiGob3n4P3Yiz
	Mi/djYMVgM//vwIszZdTN4H24wbQINJVTEhHjMgZ/osZq9qllFN8HcoOxAmtF/a7
	rzdJaMMc5TwHjUj0XLnHYqu0Trnro7dAAY5/lV+6k3LbiA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq09jaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:49:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98537d1242aso848455241.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790344195; x=1790948995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6xPkxuvJoftYbLtH1g8lpuwKWsBecQ19PbQ95iT2Ro=;
        b=JZ2Uj8ATobcOsZmla1trJcNWaypjo8qscl12j1CRrU7CLOjBOhR0LdO9uWjFZjXPdt
         ONdZtzTZ+ZgpL+3oRHTbG27iF9gLtThfTd0zphlEt0GFzQ7tLRqIPQ83CzBmZu4rOZen
         Z9x4D91A++x0YlPvdfAYJAiI1c7DZI+mlZOWi3Ll/IpPgQ5eYCg+sCdFjjPdhiEKbzJ8
         JfidZFT+cvGuMDfCkMnMdsdXg/paQ/otWL7CmJNYIvqN5p+gYqn/qwU1uxplYCCgXDra
         FlmSWQ1Ia5r+Et+rQDRHPZ4w5TwYONkSOF/Ov+/ZGY1rg/mulIJcbxkx22rT2HVdsWjF
         38+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344195; x=1790948995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6xPkxuvJoftYbLtH1g8lpuwKWsBecQ19PbQ95iT2Ro=;
        b=2xomq8ADimD5W1xUrlsE7r2lYTFsTk4fpc6gaLk/OqB78pgGGCQevFQ5GG3yrgALgy
         qa0VYYIJv1vJYhiNMBspzFLpLpNHqg0dJLWrk9YuG3hZoNFFP9yH83Joc32ugZ/DFON8
         QCbnfN0rsB0QapqEOgX15mx2pf9nzdlZl3RZUNzAkDAJGo1eW5mSlAx+qU4UC2TKpw6u
         gMukFBC4kLar/DMlN7We2EXbdYWOOKDk5xLVPtA0p29/tBW7s7eKLW3vdH/EhlSkLcLr
         T4OXdmwVNaDmgsaJlp+vQv+GMod8LAkdxDWBMVkA+dPPKu/iqgS9lACOnXwwHBGXX/Qi
         lc9g==
X-Forwarded-Encrypted: i=1; AKwUvBzv4W379cwA1i/1maKWL43W2glRa0llk7sJbD8T+gS0xGkHCm/T/p8/ROtnUNBcebyM9hR9VL9/Q5N7@vger.kernel.org
X-Gm-Message-State: AFuF++n+yweERX+UTZxSSYhvLPZzroN+L4i/kREZVGRq78BlFY1EDmbl
	PuX+tr7m9H4wOVXYwP2AzyMn2rfNi5Crl9Na6vB8b8cpEsNl1PEUzWQCQtik/OqIt23oNZ2j8BO
	Sv3N9IDkXbO+5dF2wq10J3jQGVIzRqDnj8lpjPiBuf1YM8D0UTTnH8TMyC7ajnMbC
X-Gm-Gg: AYBFou2Qeal6LNirnTgP/QOtE73lAQElw6KECJFGBA2vr+zzaAxo53lKz2xaKTxJqz/
	P6qJuLEooOI/AIGWyIOXkFKk/nUUTlTbpJOi/Ke5NeYwM7cLqzhmsOz/xp5ziBMiRLcP6oOlbHI
	XBTIDJiZlInY4tmQ7tw8IWscgS1aiW1dVYnlVVzrTsKt1qWdHV9xvAG2M+sKJfFfjRcA6smzmC3
	XwyNXkgMaOeXg4q4cwjL82WT7PL1Uoy8F1TNJpDiX5/6emW9bYG72zsAdD9wIMdrmnKgZyN3FrB
	F9gG3YV7M+He+NfVetIs8hKlbTWRsf5dHlJW3N2gRMbWMTR60a/WNJfljku0kJ8gWXuevJ/jjg1
	EREJLv2LbKaxIsQ==
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7af1f2fdbe0mr2551492137.36.1790344194570;
        Fri, 25 Sep 2026 06:49:54 -0700 (PDT)
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7af1f2fdbe0mr2551472137.36.1790344193905;
        Fri, 25 Sep 2026 06:49:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm6803889f8f.16.2026.09.25.06.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:49:53 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:49:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] phy: qcom: sgmii-eth: prepare for additional PHY
 modes
Message-ID: <arZ8AKV4vzzrGuKW@lore-desk>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-2-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yKk0FJ90Lp2MZhgF"
Content-Disposition: inline
In-Reply-To: <20260923-nord_ethernet_serdes-v1-2-f8ac1c487882@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NSBTYWx0ZWRfX+yIclShWUaUw
 DLy3kM5dEKp0EQfwH2LLRMj1ZQXhU4ouVJ2fXs4QCxvVNneIXGu/c8pXpOYvOMHiesAhA+jyeGt
 aX0PE6lrVhtqImIBnm+fT9l/OzMGLZE=
X-Proofpoint-GUID: ztIizP0JodstEzXsuBKey0qhe-WUN4j3
X-Proofpoint-ORIG-GUID: ztIizP0JodstEzXsuBKey0qhe-WUN4j3
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab67c03 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3A7O19NBzCfcshX2nUQA:9 a=CjuIK1q_8ugA:10 a=nBaL-gEMhMgtoG46ZuEA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NSBTYWx0ZWRfXwIaITdLbQy51
 YSalJomzBulN2fM1tsA7GilfnMql52nBfPrCkz/nRPKa5Va5mE74iQA1X2ARI5FB1bMch/gf53A
 Op8YQj3uApJ8k/J0XFsPaGws9V8NQyEA3rYO/jmATmomkuNc/bonZPHe4KGsqlIZ3DMKqtWxBtf
 YRyPAKP1oCPmO4HOrI2JMxRFokT+1EGCErdzwkJ2rY/5JtrKdg71kADIhRwdbYDYzqTKX3b8FtI
 yXdl0f5CrEfI+8ybWD5+y5xO1HZ06C2Z3P14T19TgXHnIY3L/FvcpMaPekbYihsCpMudYElaCZu
 i1Jxv87KqUiFrNdxq/V/Yovq47lAi2tAe5p2h2nAkOdswsBdMPoy3fxHnDcEePlAPJcItmzuSX+
 0JnQyeTxoiWsejqpMM6FHGs72Ftu/+bOSikV72PrN2lIHQTeqxpfNufbVkUUgIYeCO/KLnQWDku
 /gHdMtmTJ+TuxXBLTCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250055

--yKk0FJ90Lp2MZhgF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Prepare the SGMII Ethernet PHY driver for PHY modes that require a
> different SerDes programming sequence. Move the SGMII readiness checks
> into a helper so additional modes can provide their own status checks,
> and select the initial interface mode through per-compatible match data
> rather than hardcoding SGMII during probe.
>=20
> This does not change existing SA8775P behavior.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Hi Mohd,

just few nits inline. Fixing them:
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 70 ++++++++++++++++++++-----=
------
>  1 file changed, 46 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qual=
comm/phy-qcom-sgmii-eth.c
> index 7137200c3f310a4d2642bb9bdbe3adb7589b2241..029dafacee7853648ef24afd0=
d9c4b83a549badf 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -41,6 +41,10 @@ struct qcom_dwmac_sgmii_phy_data {
>  	phy_interface_t interface;
>  };
> =20
> +struct qcom_dwmac_sgmii_phy_match_data {
> +	phy_interface_t default_interface;

nit: maybe better 'interface' instead of 'default_interface'?

> +};
> +
>  static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
>  {
>  	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
> @@ -227,47 +231,31 @@ qcom_dwmac_sgmii_phy_poll_status(struct regmap *reg=
map, unsigned int reg,
>  					val & bit, 1500, 750000);
>  }
> =20
> -static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> +static int qcom_dwmac_sgmii_phy_poll_sgmii_ready(struct device *dev,
> +						  struct regmap *regmap)

nit: can you please fix the alignement here?

>  {
> -	struct qcom_dwmac_sgmii_phy_data *data =3D phy_get_drvdata(phy);
> -	struct device *dev =3D phy->dev.parent;
> -
> -	switch (data->interface) {
> -	case PHY_INTERFACE_MODE_SGMII:
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -		/* 1.25Gbps mode */
> -		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> -		break;
> -	case PHY_INTERFACE_MODE_2500BASEX:
> -		/* 3.125Gbps mode */
> -		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
>  					     QSERDES_QMP_PLL + QSERDES_V5_COM_C_READY_STATUS,
>  					     QSERDES_COM_C_READY)) {
>  		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
>  		return -ETIMEDOUT;
>  	}
> =20
> -	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
>  					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
>  					     QSERDES_PCS_READY)) {
>  		dev_err(dev, "PCS_READY timed-out");
>  		return -ETIMEDOUT;
>  	}
> =20
> -	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
>  					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
>  					     QSERDES_PCS_SGMIIPHY_READY)) {
>  		dev_err(dev, "SGMIIPHY_READY timed-out");
>  		return -ETIMEDOUT;
>  	}
> =20
> -	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
>  					     QSERDES_QMP_PLL + QSERDES_V5_COM_CMN_STATUS,
>  					     QSERDES_COM_C_PLL_LOCKED)) {
>  		dev_err(dev, "PLL Lock Status timed-out");
> @@ -277,6 +265,28 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy=
 *phy)
>  	return 0;
>  }
> =20
> +static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> +{
> +	struct qcom_dwmac_sgmii_phy_data *data =3D phy_get_drvdata(phy);
> +	struct device *dev =3D phy->dev.parent;
> +
> +	switch (data->interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +		/* 1.25Gbps mode */
> +		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> +		break;
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		/* 3.125Gbps mode */
> +		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> +}
> +
>  static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
>  {
>  	struct qcom_dwmac_sgmii_phy_data *data =3D phy_get_drvdata(phy);
> @@ -374,6 +384,7 @@ static const struct regmap_config qcom_dwmac_sgmii_ph=
y_regmap_cfg =3D {
> =20
>  static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
>  {
> +	const struct qcom_dwmac_sgmii_phy_match_data *match_data;
>  	struct qcom_dwmac_sgmii_phy_data *data;
>  	struct device *dev =3D &pdev->dev;
>  	struct phy_provider *provider;
> @@ -385,7 +396,11 @@ static int qcom_dwmac_sgmii_phy_probe(struct platfor=
m_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
> =20
> -	data->interface =3D PHY_INTERFACE_MODE_SGMII;
> +	match_data =3D device_get_match_data(dev);
> +	if (!match_data)
> +		return -EINVAL;
> +
> +	data->interface =3D match_data->default_interface;
> =20
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
> @@ -419,8 +434,15 @@ static int qcom_dwmac_sgmii_phy_probe(struct platfor=
m_device *pdev)
>  	return 0;
>  }
> =20
> +static const struct qcom_dwmac_sgmii_phy_match_data sa8775p_match_data =
=3D {
> +	.default_interface =3D PHY_INTERFACE_MODE_SGMII,
> +};
> +
>  static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] =3D {
> -	{ .compatible =3D "qcom,sa8775p-dwmac-sgmii-phy" },
> +	{
> +		.compatible =3D "qcom,sa8775p-dwmac-sgmii-phy",
> +		.data =3D &sa8775p_match_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_of_match);
>=20
> --=20
> 2.34.1
>=20

--yKk0FJ90Lp2MZhgF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZ8AAAKCRA6cBh0uS2t
rEGCAQDcF3QGqllo5A0wikzR4QE2j/w+6DxZ8Xl8T35b1UK6mwEA7KQRxR7vSWuW
IIiZdgxaw+0xxfMCQqB3lH4occUf9Qc=
=EKj3
-----END PGP SIGNATURE-----

--yKk0FJ90Lp2MZhgF--
