Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A55490BE3
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531880; cv=none; b=Iobp9dpkqQdGoLjr0CgSUBHdWrZ5ghIvFBGHkkJqBOF9N1STnl3Bd8maulCNVviWZFBd9GKApVz+Jx9mPs99czRXUXOO5txXhWGPT8YzbV69eFPn2o8hDtePceUGl6yc99eppUedqVuPYGT8BqYmgo2diXRbtn05IuU86q88/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531880; c=relaxed/simple;
	bh=3+xz/PZXF8hVZHS0IAmbwnxyqLOqDpmiVSnymmkHOvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=abhORN2qvzijW/0xXhHlNqb6GkCvPINiAub36j6Dp7WkrDDCr3mCDrHw209wV7gS+z/KbnP2DP/Ewdfur/POo341UpVWZ8wOMrUwH5ypzVKUrw/LlBINtxYUf+aDXxMaUv/PLE176a56XbhFTI0cVOqWZexrOnhq6WwH6WIXSdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmiJrXJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmiJrXJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AE41F00A3D;
	Fri,  4 Sep 2026 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788531878;
	bh=hyeRxZUBraYfVaxOt7l6Vg2b1L2t0j3hfhXppUBES0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JmiJrXJOGW3ewJKC+BjY/suE+KJmVQO3ZLi1LiQq3/AcRv8uyxyrSY0TbFNPclgNj
	 JwfpDp92Ny4ixC5nAzs9Z4531Kdc4iWd+c0cy659p6QoHKYj3wLP5ApRvg5YHAdiwW
	 Zs8sXulVnd5wx6Xn2TVYumAR6bg1unqymqEx2kNk6MZu0355WKmubTva5sG7x7iv86
	 R973SXmhAjIPgXs4XIASiKuXwCRI/rRP2t1K5MhjcbitNWK5tLAot8lDlGCqZjxrT1
	 l2k4zGmulBanvpwyiO9wUdZbs272Y4TcAfw1vT5/kzENV5q/RuCZZNobQnedsg3fYY
	 4MHI8OZdzNDyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/17] iio: adc: adi-axi-adc: Add support for CRC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-4-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-4-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:24:37 +0000
Message-Id: <20260904142438.29AE41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] CRC operations are not hooked up for all AXI ADC IP core variants
--

commit 432feaef6b44e5ab8e03ad8059b2636d78ecf5d5
Author: Janani Sunil <janani.sunil@analog.com>

    iio: adc: adi-axi-adc: Add support for CRC
   =20
    Add support for enabling and disabling Cyclic Redundancy Check (CRC)
    processing in the AXI ADC backend. CRC provides data integrity verifica=
tion
    for high-speed ADC data streams, ensuring reliable data transfer between
    the ADC frontend and backend processing systems.

> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index fc7cc92b35f0a..8b7c45d51dbe8 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c
[ ... ]
> @@ -47,6 +47,9 @@
>  #define    ADI_AXI_ADC_CTRL_DDR_EDGESEL_MASK	BIT(1)
> =20
>  #define ADI_AXI_ADC_REG_CNTRL_3			0x004c
> +/* Bit 8 is common to all AXI ADC cores; bits 7-0 are per-HDL-project. */
> +#define    ADI_AXI_ADC_CNTRL_3_CRC_EN_MASK	BIT(8)
> +
>  #define   AXI_AD485X_CNTRL_3_OS_EN_MSK		BIT(2)
>  #define   AXI_AD485X_CNTRL_3_PACKET_FORMAT_MSK	GENMASK(1, 0)
>  #define   AXI_AD485X_PACKET_FORMAT_20BIT	0x0
[ ... ]
> @@ -644,6 +663,8 @@ static const struct iio_backend_ops adi_axi_adc_ops =
=3D {
>  	.num_lanes_set =3D axi_adc_num_lanes_set,
>  	.debugfs_reg_access =3D iio_backend_debugfs_ptr(axi_adc_reg_access),
>  	.debugfs_print_chan_status =3D iio_backend_debugfs_ptr(axi_adc_debugfs_=
print_chan_status),
> +	.crc_enable =3D axi_adc_crc_enable,
> +	.crc_disable =3D axi_adc_crc_disable,
>  };

[Severity: Medium]
If the CRC enable bit is common to all AXI ADC cores as the comment above
suggests, should these callbacks also be added to adi_ad485x_ops and
adi_ad408x_ops in the same file?

For example:

drivers/iio/adc/adi-axi-adc.c:adi_ad485x_ops {
	.enable =3D axi_adc_enable,
	.disable =3D axi_adc_disable,
	...
}

If a frontend driver paired with an axi-ad485x or axi-ad408x backend attemp=
ts
to call iio_backend_crc_enable(), the call will fail with -EOPNOTSUPP becau=
se
the function pointers in those backend ops structures are NULL.

If the feature is intentionally unsupported on those variants, the code com=
ment
claiming it is "common to all" seems misleading.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D4
