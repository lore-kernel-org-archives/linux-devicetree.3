Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113152F8EB7
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 05:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780723832; cv=none; b=jKQuPx/4ia7yVeEYmo5HAzmEyWn0w2CNUWGzMKnypQ6QDpv+Qw9ON/7R/Fuys+5n3vX/9U4IrCtx5jSryOR0cSUkUuuQ5jSwr+IHd7f+41e+MWVQqJOeIMfhJb9IMPGrdDPkuPgxrxAnFc1Fb/q3AqiYCA5rff5KjPB2FT8IVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780723832; c=relaxed/simple;
	bh=VpX8QN7Pkj8xAsqJ0Pne920IKUiH5xrsMNKEc0V+PAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aKKphVWK6jocy0mXDOUZbokIPQsVTM+GnLBYX9vGOjiIAeyzdnsDLMUz2qYBCDZxv/fE4KuzjmlTLgynhvvoJntOH52qn4rlMk6brLlrZCZIO6M6sWRS0Q+yXK05igSBSpwHV0hA/qWqk8iEwqy8EK/ffNgiVrZHq9g4wE+ZtdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/31TB+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/31TB+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD211F00893;
	Sat,  6 Jun 2026 05:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780723830;
	bh=iN+FJihJdN54Q0tlUM9/mZAZK9Dygn/lV6UL/GW2seg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/31TB+mYduoAqc2rNlYRmKdj3hELy+8SfvJHOX9AxBoemgOyjVvTsf1+EGowjcYN
	 YqHNifF3dCb6/Ss77nyCEd4SGB6BZviePP9NA3V+xXGANJZrxeZx04U5EpJ0pN6noU
	 Yd8qcrpdkJ6eLRqWDky7ypqJ4ni8mJ6MwLfoixb7Esef44lJ+XgtIQ1PQqFzIOxKGT
	 F4+xD2+XJ89y90m5hZHvHUYf5Ya5GIeLCuspBKYejdWKKqzgdDHnH7yPJ6yKDZC65t
	 5guRiThv+en8ze2Dmf1pYA/Ns1dhCt8oahczec55UemtMNDbDDUlR0+l7lRmTcMYHK
	 7z8R3e8QfsN9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260606051707.535281-6-salih.erim@amd.com>
References: <20260606051707.535281-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 05:30:29 +0000
Message-Id: <20260606053030.6FD211F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Hardware state desync for oversampling ratios.
- [Medium] Inconsistent IIO ABI for temperature oversampling due to misuse =
of info_mask_shared_by_type.
--

commit a087d8379a588d07c739e642f022da0f04e19054
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support

This commit adds oversampling support to the versal-sysmon driver, enabling
averaging of 2, 4, 8, or 16 samples. It exposes the configuration through t=
he
IIO oversampling_ratio attribute, shared by channel type.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index e87974c641a16..8a8ca4506cbaa 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -842,7 +970,10 @@ static int sysmon_parse_fw(struct iio_dev *indio_dev=
, struct device *dev,
>  				   ((reg - 1) * SYSMON_REG_STRIDE),
>  			.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
>  			.info_mask_shared_by_type =3D
> -				BIT(IIO_CHAN_INFO_SCALE),
> +				BIT(IIO_CHAN_INFO_SCALE) |
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
> +			.info_mask_shared_by_type_available =3D
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
>  			.datasheet_name =3D label,
>  		};
>  	}

[Severity: Medium]
Will this lead to an inconsistent IIO ABI for temperature oversampling?

The patch adds BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) to
info_mask_shared_by_type for dynamically allocated satellite temperature
sensors, but it appears to be omitted for static core temperature sensors.

In IIO, shared_by_type creates a single attribute (in_temp_oversampling_rat=
io)
that userspace expects to apply to all channels of that type.

If the hardware's SYSMON_CONFIG_TEMP_SAT_OSR and 64-bit enable mask only af=
fect
satellite sensors, using shared_by_type might violate IIO ABI by falsely
advertising oversampling for the core sensor when satellites are present.

Conversely, if the configuration affects all temperature sensors, omitting =
the
mask from the core sensors means systems without satellites cannot configure
oversampling, as the attribute will not be created.

[ ... ]
> @@ -890,6 +1021,8 @@ int sysmon_core_probe(struct device *dev, struct reg=
map *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Could this result in a hardware state desynchronization for the oversampling
ratios?

The software cache is unconditionally initialized to 1 without reading the
current hardware state from SYSMON_CONFIG or explicitly writing the default
value to the hardware registers.

If the device was previously configured with a different oversampling ratio=
 by
a bootloader, firmware, or a prior kernel, the hardware will operate at that
ratio while the driver incorrectly reports 1 to userspace via read_raw.

Should the driver read the current state during probe or explicitly write 1
to the registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606051707.5352=
81-1-salih.erim@amd.com?part=3D5
