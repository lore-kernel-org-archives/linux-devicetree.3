Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F57448B9C
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047061; cv=none; b=mcGDaJyneScpjFgInSLxXVVIh8Rn3Jbn1GCViVhMle7qHE4kk7yMkiHZ+7IxYziAVPPSUwidzSYiGcbaiXrs0LB0v64JllRlwQ3qQgAzFV4dzPanxMpKKHWOt1uIXA/rtJyGLUl450LNTIukLUeaFHKvzLbf5mdBJAg1Ui9PWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047061; c=relaxed/simple;
	bh=bemDIOn0VrNRAwj1EwlGo1lM/s4EIzRiDWaCIEacfi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gXhTxLOcPa/DCDIOa3TGM1YuIYcYRHHFFGiClCNeVyfeTEhbFH7jDfS9Nn7JEGPY5X6v6j22tKpBrZaimNm/ZM+3zFYZAMcqb3FnGx6VDnv9+0xjGigwj65ZACTarqhdubApP4FwiKfRNNjqIHXD6TfAR5oWOLQIToGfDk1jBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Up/9afnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Up/9afnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBFF1F000E9;
	Tue, 18 Aug 2026 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787047059;
	bh=vLUU5OTmEHoV+X/z2AvNmh9KiyiWcu1h9nwEAnahLlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Up/9afnIaKWRYnKzT46hMDVeKnmZwb2Cw0snmqunwbOvM/PQADLBbaidMqomi3Bww
	 0SDtVIeYTVjBsljL6hPmrdo6GgMDgUrb4LV72Fe1gma46ldM5oSUYjNHYDUMD+YaaB
	 g9n1zEimP5wSRKDUpyVnvhHMSRqiGGmQXGlsFZEf4ED1ekX3rLm6FKrkS2nmB2L9wB
	 Z9myRQvZZcMEzCnJdQxazLZM0Y6fvvfjJQJytUgNaftZcqSkx6DwOHbVJd0tORuapP
	 tSHrr8+J0QMZpDw053Mk1Ji73Tth+jSqIIgjwGspC1YQzaTU/9wLIlc7/Na6zsc4HC
	 nWacIlWkCmc3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] power: supply: bq27xxx: add support for bq27z746
Reply-To: sashiko-reviews@lists.linux.dev
To: "Henrik Grimler" <henrik.grimler@axis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260818-bq27z746-v2-3-0371e206665f@axis.com>
References: <20260818-bq27z746-v2-0-0371e206665f@axis.com>
 <20260818-bq27z746-v2-3-0371e206665f@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:57:39 +0000
Message-Id: <20260818095739.7EBFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential null pointer dereference in `bq27xxx_battery_i2c_probe()=
` when retrieving the I2C device ID. The driver relies on `i2c_client_get_d=
evice_id()` without checking its return value.
--

--- Patch [3]: [PATCH v2 3/3] power: supply: bq27xxx: add support for bq27z=
746 ---
commit a0624890a79f9b2398a034239df6144de2c581e9
Author: Henrik Grimler <henrik.grimler@axis.com>

power: supply: bq27xxx: add support for bq27z746

bq27z746 is similar to bq27z561, but has additional battery protection
logic. The standard register map is a subset of the one found in
bq27z561.

> diff --git a/drivers/power/supply/bq27xxx_battery_i2c.c b/drivers/power/s=
upply/bq27xxx_battery_i2c.c
> index c4e7a9521d086..2a6b4534cb28a 100644
> --- a/drivers/power/supply/bq27xxx_battery_i2c.c
> +++ b/drivers/power/supply/bq27xxx_battery_i2c.c
> @@ -253,6 +253,7 @@ static const struct i2c_device_id bq27xxx_i2c_id_tabl=
e[] =3D {
>  	{ .name =3D "bq27441", .driver_data =3D BQ27441 },
>  	{ .name =3D "bq27621", .driver_data =3D BQ27621 },
>  	{ .name =3D "bq27z561", .driver_data =3D BQ27Z561 },
> +	{ .name =3D "bq27z746", .driver_data =3D BQ27Z746 },

[Severity: High]
This is a pre-existing issue, but adding a new device id highlights a
potential null pointer dereference in bq27xxx_battery_i2c_probe().

If a system integrator provides a Device Tree containing a valid fallback
compatible string (for example: compatible =3D "ti,unsupported-chip",
"ti,bq27z746";), probe could be called with client->name set to
"unsupported-chip".

Since "unsupported-chip" is not in the I2C ID table,
i2c_client_get_device_id() will return NULL:

static int bq27xxx_battery_i2c_probe(struct i2c_client *client)
{
	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
	...
	name =3D devm_kasprintf(&client->dev, GFP_KERNEL, "%s-%ld", id->name, num);
	...
	di->chip =3D id->driver_data;
	...
}

Does this code cause a kernel panic when id->name and id->driver_data are
accessed if id is NULL? Would it be safer to explicitly check if id is
valid, or use i2c_get_match_data() to retrieve the driver_data?

>  	{ .name =3D "bq28z610", .driver_data =3D BQ28Z610 },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-bq27z746-v=
2-0-0371e206665f@axis.com?part=3D3
