Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9527C3655C0
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618928; cv=none; b=m10foFY+Uj20jbXWuWx2OjeU70BFc8M3WNGeAtgYZ6mzb7R1NB3k1b7jgfhHBKblS0kQAg+K9Clf83lHwR4p2ba/79HQGd7T92Mn6L7x9kVlmycJLm1HX52HME5fxfqsgp+YXm3PSBwZEZ/PscDHCmFtgl1b2fxog9ADYCWpQLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618928; c=relaxed/simple;
	bh=Idg2syK1y5H7A+GBfksk8LmlY+eD46ymTF3UmIAXtMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JbY3njtgqlTNTSItvZecy1dhXQwZxTqUrOX87gbRrb5Zu6esOyG2Fk4Ur8uZL+GT986SysGsCLFx3pghMgE2m4JhSOQaaCO7TP/6hdGWfRRYwlcqeKb91cnSF2F1tftRxcf7ob8X+PxUwKYgv/KbX8QeBckhzwMNo7BngHsTNm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtkE8fgI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtkE8fgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1695C1F00ADE;
	Tue, 16 Jun 2026 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781618927;
	bh=s5v9PCpUEele8ndYqw1viJeJvVWp2V/YKZb3yNgetls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YtkE8fgIknPnC4st3qJxiv+mN8uKawGX/IxM9cxAaOLQu5F7o5j/Ly9tpzIt+oi7A
	 6L3DMey7W8E3V6wlLMv15aCjCQoQFwwnlvP6LFpsMLtOuK4nTrId3mnwjrlHZsKgVR
	 cSwLK8d+bVWJ9MxlOSf3VPVmgmzLw6YGFaKV2pWShghyQgGfv6gOaYQ6aY02RJ43ou
	 iG0xjbn4NbWZkhJ+KFAN7iiFp5TyD/8iI9izMeAF3eWPkcGlSb5eXpnlrI6Xv7Cr3Z
	 CeMh4Ef2lI7WJYvu1Qc/OGIdkHTKnj7rQMUdJlpMYV5aTWrjmVLHCY6grHbwzB+wXp
	 XdP1lR9O7tW8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260616131559.3029543-6-salih.erim@amd.com>
References: <20260616131559.3029543-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:08:46 +0000
Message-Id: <20260616140847.1695C1F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Static temperature channels are missing the oversampling ratio i=
nfo mask, rendering it unavailable if no dynamic temperature satellites are=
 present.
- [Medium] The driver's cached oversampling state is initialized to 1 witho=
ut synchronizing with the hardware state.
--

commit 81f60069d7c6ab5d01862c8402ee14a0ef2ad23e
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support
   =20
Add support for reading and writing the oversampling ratio through
the IIO oversampling_ratio attribute. The hardware supports averaging
2, 4, 8, or 16 samples, plus a ratio of 1 (no averaging).

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 8d567f9fa05d7..309c39b515f6d 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c

[ ... ]

> @@ -787,7 +932,11 @@ static int sysmon_parse_fw(struct iio_dev *indio_dev=
, struct device *dev, int ir
>  			.address =3D SYSMON_TEMP_SAT_BASE +
>  				   (reg - 1) * SYSMON_REG_STRIDE,
>  			.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
> -			.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
> +			.info_mask_shared_by_type =3D
> +				BIT(IIO_CHAN_INFO_SCALE) |
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
> +			.info_mask_shared_by_type_available =3D
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
>  			.datasheet_name =3D label,
>  		};
>  	}

[Severity: Medium]
Since the dynamically parsed temperature channels get the oversampling ratio
masks here, should the static temperature channels defined via
SYSMON_CHAN_TEMP also be updated to include these masks?

If no dynamic temperature satellites are present, the static temperature
channels won't expose the in_temp_oversampling_ratio sysfs attribute,
preventing oversampling configuration for those default channels.

[ ... ]

> @@ -834,6 +983,8 @@ int devm_versal_sysmon_core_probe(struct device *dev,=
 struct regmap *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Are these initial cached oversampling values guaranteed to match the hardwa=
re
state?

If a bootloader or a previous kernel instance left the SysMon configured wi=
th
a higher oversampling ratio, the IIO sysfs attribute will incorrectly report
1x oversampling while the hardware actively operates at the previous settin=
g.

Should the driver read SYSMON_CONFIG to initialize this cache, or explicitly
write the default 1x value to the hardware to ensure the state is synchroni=
zed?

> =20
>  	ret =3D devm_mutex_init(dev, &sysmon->lock);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616131559.3029=
543-1-salih.erim@amd.com?part=3D5
