Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5C1ADC97
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122348; cv=none; b=FdAg330gRSeDwZMSdghCX3EJLixGsIzTG+N1zT0EjPxZQaxZrXqZwQgZfJbWyil5iWw13JQkVLIXxGMngNgDLukWznpjXTfua6Ve0z/bQomkm4IGdG8Ym1ejWmPUx9+GoIwBgWAdvPxnApXghCqUzc7WIKAd6ENrMNUtS2UGOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122348; c=relaxed/simple;
	bh=YHZWub1dEp+o3tQt6xso7QeE4pmUYb1+RMCKOt/kU+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZEfqkjXSxRlaJcoE+MpU1p+3qWAd1Plif5/csBbS4G75/qe99cjQL9cyZ5MTBHSYB6BJSc0Fhawp5VzPpDtpct5Ymv0REJzCNnsbHO/gT8hCtCavyDZN06i05PlKJWFkB26ntF7hq7z0Bx7KBBiVFcBqame94wb2sXvQPBCEm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efb8H70f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efb8H70f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3412A1F000FF;
	Wed, 23 Sep 2026 00:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790122346;
	bh=7oP6ps8gAOM4ixs7A9+9AtPlLIz2wupiiDoXMkVxS80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=efb8H70fa6Ni2DLJX79xbG2z79vJzDWjWJs11LjfE4dYwjqIFkZArfCLt5smlut3r
	 9mrUU5Xg3Q8MRePPfD/umyxeOqLv9n5xAbFbzcMQXWIO5f4aIeKIVyua8dYkHqyp2H
	 oS5+7CyInoeKSFP1wh9LGC/fbk/tTQzn522IYTh+cPTT10badMnUgE4WGsJDf/M6Zu
	 eMiIxQD49+2SEAJ94vwR5tUIhFVojLR0YJW3IuFbeKdfKeLZl/1mupXxpjFFspB5p0
	 HwWUbWZd5X5dXriupCbs7JwqqTQGpW/tjtyPGIAi2OtjV48tVpR3nN7Z6dGPKGqozB
	 BWiVzrxg9uTOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 00:12:25 +0000
Message-Id: <20260923001226.3412A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: qcom: sgmii: incorrect hardware offsets written on mode change
--

commit eb8579d974b41d6c98fd95052875c10ccf3e31fa
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

    phy: qcom: sgmii-eth: add Nord USXGMII support
   =20
    Nord uses a QMP v7 SerDes block which is an updated version of the
    SGMII SerDes PHY IP. The driver currently handles SGMII and 2500BASE-X
    configurations only. This patch adds support for configuring the SerDes
    to operate at 10.3125 Gbaud, enabling USXGMII and 10GBASE-R PHY modes
    for the Nord compatible.

> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qual=
comm/phy-qcom-sgmii-eth.c
> index 029dafacee785..3c68bfe0ea443 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
[ ... ]
> @@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct ph=
y *phy)
>  	case PHY_INTERFACE_MODE_1000BASEX:
>  		/* 1.25Gbps mode */
>  		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> -		break;
> +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
>  	case PHY_INTERFACE_MODE_2500BASEX:
>  		/* 3.125Gbps mode */
>  		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> -		break;
> +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> +	case PHY_INTERFACE_MODE_USXGMII:
> +	case PHY_INTERFACE_MODE_10GBASER:
> +		/* 10.3125Gbps mode */
> +		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
> +		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);

[Severity: High]
Does this logic incorrectly route SGMII and 2500BASE-X requests directly to
V5 hardware initialization sequences, regardless of whether the underlying
hardware is V5 or V7?

If a MAC driver using phylink dynamically falls back to SGMII, 1000BASE-X, =
or
2500BASE-X on the Nord (v7) platform during link state changes (e.g., when
plugging in a different SFP module), it appears this will write completely
wrong offsets to the PHY SerDes block.

Similarly, if phylink falls back to USXGMII or 10GBASE-R on the sa8775p (v5)
platform, won't it run the V7 initialization sequence instead?

Writing incorrect register offsets into the hardware IP can lead to
unpredictable behavior or system crashes.

>  	default:
>  		return -EINVAL;
>  	}
> -
> -	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
>  }
[ ... ]
> @@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *=
phy, enum phy_mode mode,
> =20
>  	if (submode =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  	    submode =3D=3D PHY_INTERFACE_MODE_1000BASEX ||
> -	    submode =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> +	    submode =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> +	    submode =3D=3D PHY_INTERFACE_MODE_USXGMII ||
> +	    submode =3D=3D PHY_INTERFACE_MODE_10GBASER)
>  		return 0;

[Severity: High]
Does this validation incorrectly advertise that all PHY interface modes
are supported by all hardware instances?

By returning 0 for all these modes, this allows phylink to believe the plat=
form
supports them unconditionally.

This is what permits consumers to switch into incompatible modes during
standard PHY mode negotiation, ultimately triggering the incorrect hardware=
 IP
initialization sequences in qcom_dwmac_sgmii_phy_calibrate() mentioned abov=
e.

> =20
>  	return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-nord_ether=
net_serdes-v1-0-f8ac1c487882@oss.qualcomm.com?part=3D3
