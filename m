Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3744C66F
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866378; cv=none; b=NWGUcWkiMWdLEqmSIfwSG/Q8kjI5c5jom194n1txDtoza+mqJqGxHuJlklcSH8gIATQsP92ndCw1foiOf3Vd+d67Trg2XY31VFAZkDmGisyXDPvjDQ/EH7pPGFsgtFTRYERTefW9QIw5VY0TRYj14nR3kQe5U8ZPXJ1QM/AHXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866378; c=relaxed/simple;
	bh=zoThcxV+v/cpiVenG61m9Nlau9r0zLy2wUTtma1gcu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAW3mWzCjtAdcGFzQcIljCKcKC9XRst6Pk2u5sAXDbk/Qwsusi3mR3jhzgf/g7vnlGcF1a5uEHAkviAITTpz6Ig0hk2HVELxh//+6lNdp70gPAK6BsGR8cXNQqRJ1Me9bQYvgnpNMH5XSqlmsKcRnXre62XV9a75cgPA8a7DUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APhRPjhM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APhRPjhM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD901F000E9;
	Tue,  4 Aug 2026 17:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785866377;
	bh=3SAl60rju2Ied5M+Nn1NZ6rtkJPUAiUtdb5WZ1e5ZE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APhRPjhMMOqHLsdscTHcBQc3vM6EMXnGif36X7vtA4AICsSy1sl5gU3QW2NIWHZbS
	 YaoeTxqt25iKAsYyKg2jSxXRydxxKEd+sMOpUq7zG3iTH5b3yxDEP/v00VxJejkwod
	 csHUuHLJPubmDDjIQs5/f1NTgZN4vKFx5nOId3K3S2s+HZYn0rz6aLs6EzyDF81f2e
	 IBeig6HWRlg2GRckAb6vYnnyPpSXMfAyndZHIQjEY+gEwW0YW53p/X/bCRkEOH+DvL
	 45iPhBrCdtE1j+TZbOJ8PKIWsYBCi8EFYUEFQI95g6o0eOjvX4RoF8C2kP8BOD/V3U
	 9CI6KuJ0SlVkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] iio: light: ltr501: Add ltr329 driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-liteon-ltr329-v3-5-c6b768c7c745@geanix.com>
References: <20260804-liteon-ltr329-v3-0-c6b768c7c745@geanix.com>
 <20260804-liteon-ltr329-v3-5-c6b768c7c745@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:59:35 +0000
Message-Id: <20260804175936.BBD901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The software trigger handler incorrectly maps the TIMESTAMP channe=
l to the Proximity Sensor for ALS-only chips, causing an I2C polling timeou=
t and trigger failure.
--

--- Patch [5]: [PATCH v3 5/6] iio: light: ltr501: Add ltr329 driver support=
 ---
commit 62d63375d5ea8d7644dcba28928c83f753f6e2cf
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Add ltr329 driver support
   =20
This patch adds support for the LTR-329ALS-01 chip, which is similar to
the LTR-303ALS-01 but lacks interrupt support.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index b36bd10a02624..9d37872ceec58 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
[ ... ]
> @@ -1257,6 +1271,18 @@ static const struct ltr501_chip_info ltr501_chip_i=
nfo_tbl[] =3D {
>  		.channels =3D ltr301_channels,
>  		.no_channels =3D ARRAY_SIZE(ltr301_channels),
>  	},
> +	[ltr329] =3D {
> +		.partid =3D 0x0A,
> +		.als_gain =3D ltr559_als_gain_tbl,
> +		.als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
> +		.als_mode_active =3D BIT(0),
> +		.als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
> +		.als_gain_shift =3D 2,
> +		.no_irq_support =3D true,
> +		.info_no_irq =3D &ltr301_info_no_irq,
> +		.channels =3D ltr301_channels,

[Severity: High]
This isn't a bug introduced by this patch, but will the trigger handler fail
for the LTR-329 when using ltr301_channels?

Looking at ltr301_channels, scan_index 2 is defined as the software
timestamp:

drivers/iio/light/ltr501.c:ltr301_channels[] =3D {
	...
	IIO_CHAN_SOFT_TIMESTAMP(2),
};

However, in ltr501_trigger_handler(), test_bit(2, ...) hardcodes the
assumption that scan_index 2 is the proximity sensor:

drivers/iio/light/ltr501.c:ltr501_trigger_handler() {
	...
	if (test_bit(2, indio_dev->active_scan_mask))
		mask |=3D LTR501_STATUS_PS_RDY;

	ret =3D ltr501_drdy(data, mask);
	...
}

If a user enables the IIO timestamp channel (scan_index 2) on an ALS-only
chip like the LTR-329, will ltr501_drdy() timeout waiting for the proximity
sensor ready bit, effectively breaking triggered buffers?

> +		.no_channels =3D ARRAY_SIZE(ltr301_channels),
> +	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-liteon-ltr=
329-v3-0-c6b768c7c745@geanix.com?part=3D5
