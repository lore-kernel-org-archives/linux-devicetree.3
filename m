Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26192397E9A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779825764; cv=none; b=IKPU2mSW4pDBOk3pAVISPtV5gZHykxwwF9N8WzeFeVn8vOIYzIDm8rgCQTEzPWovX43NwEBHiW45aosuNCQwO7drlQU4x9+4EB7X1A9IysGoDp2Q6y4kvKGEBMe1+pMMMSlvPUrxv1KB7CG9yqNsaC+Pwjg+x4414eAf3ZLJhVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779825764; c=relaxed/simple;
	bh=KnD9RFlJFt6VpLuvkwEU4Fv2cj845g4gQXMBKZ3rpdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TUuqHWk5HsCX6FsCFrJvzThsOIfUmACOWh5k8jX1zSbQ5oE+8W65W8pn8Q+vAR6SBtHp9evKl0dsAypqhvPz/ar0VrFCoRQEh3KnNAALf+CfTB9CD1eZWStqBYUhvsdpLHxWIVRtLNBSmJBesPxW2IqXhL5bNS3niV/fWxQnT60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E++NIqow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E++NIqow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5A71F000E9;
	Tue, 26 May 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779825762;
	bh=+9gpZGRcPYlI1N+mslya2NvmpuDooH8SeT3eldbfutA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E++NIqowLa1af3NNuSk6VYSPQKrF+UqIwSwIW3P62vVjvQ8EHJDUa97tM8NndSPEj
	 +dUv+qBiq6BvsY95L1jwWIoY9FTrQGC2bMD+G46t0kkCgFk/4YxB4899ckBWMpACbi
	 /57wz4idXEX2nDjFbUoR5JjO8vCxkgut7pYhcelpBerw88K1nchXhRLSvA6UTAMfEG
	 CAixHDoGZkp/UA/0nXyyKYclkTCz66z6VHE3WGPstjtEqor25cfMbqdrh46OBUs1OL
	 NkVnp5XxeuQd9fudls+Bq5OtxC/4okDoK4Wp2symPxkqq/kOxD9yszvOIEIIyFTwBj
	 ejArXEXo3Zaaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] regulator: 88pm886: Add Vbus regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RHVqZSBNaWhhbm92acSH?= <dujemihanovic32@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
References: <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 20:02:42 +0000
Message-Id: <20260526200242.8B5A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced `pm886_vbus_regulator` structure contains func=
tion pointers but is allocated in read-write memory instead of read-only me=
mory.
--

commit 133b6ca9034767cb2bdba63244660bc0872522af
Author: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

regulator: 88pm886: Add Vbus regulator

This commit adds support for the PMIC's Vbus regulator to the 88pm886
driver. This regulator is mandatory for USB OTG support on boards using
this PMIC.

> diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88=
pm886-regulator.c
> index a38bd4f312b72..039822e86ec87 100644
> --- a/drivers/regulator/88pm886-regulator.c
> +++ b/drivers/regulator/88pm886-regulator.c
[ ... ]
> @@ -337,6 +338,25 @@ static struct regulator_desc pm886_regulators[] =3D {
>  	},
>  };
> =20
> +static const struct linear_range pm886_vbus_volt_ranges[] =3D {
> +	REGULATOR_LINEAR_RANGE(3750000, 0, 7, 250000)
> +};
> +
> +static struct regulator_desc pm886_vbus_regulator =3D {

[Severity: Low]
This isn't a bug, but should this pm886_vbus_regulator structure be declared
as const so it is placed in read-only memory?

While the existing pm886_regulators array also lacks the const qualifier,
making this change would require updating the local rdesc pointer in
pm886_regulator_probe to be a const struct regulator_desc pointer.

> +	.name =3D "vbus",
> +	.regulators_node =3D "regulators",
> +	.of_match =3D "vbus",
> +	.ops =3D &pm886_buck_ops,
> +	.type =3D REGULATOR_VOLTAGE,
> +	.n_voltages =3D 8,
> +	.linear_ranges =3D pm886_vbus_volt_ranges,
> +	.n_linear_ranges =3D ARRAY_SIZE(pm886_vbus_volt_ranges),
> +	.vsel_reg =3D PM886_REG_BOOST_CONFIG1,
> +	.vsel_mask =3D PM886_REG_BOOST_MASK,
> +	.enable_reg =3D PM886_REG_BATTERY_CONFIG1,
> +	.enable_mask =3D PM886_REG_VBUS_EN,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-88pm886-vb=
us-v1-0-f2bd1fd3c19e@dujemihanovic.xyz?part=3D3
