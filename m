Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67E533588
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916035; cv=none; b=AdHhEO++n+9HJDEWe+jAX3DSmwrXaaymEZ427EEfPfWfSxc57XM24Q8D8NpP7rZSCX5fFSe+sSTKO54edkxB4UKG1bDf5oZVHfe/ISA1iLMrmr3OWgs2wJX3kJ2KFao+1Ib/rCWHcitEzk/4cXDu5/9WJ0dwrTuCi2MpOIY74P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916035; c=relaxed/simple;
	bh=X3b72InDyNL5CkefH7jIZuLOGBtL1TizRre/DXcwpwA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T4Ohw7XUivPMucjnDfqXodMcaFw+IHyU9oPWSyGaLYn1JtxWLxPeDsUjVzYOzq2SINBEkOxKFk3DEASuSnRrO2qkgXID87tAGq9CbKqlgUf23a1cmGl8E8KjigXoNQfeLxSibCf58Imh+hcnTBX79ghh6qoi/6WINvayNBYIM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ew/CY/2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ew/CY/2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F911F000FF;
	Tue, 13 Oct 2026 18:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791916034;
	bh=DtPxc61p7tzGbuA1nBGSUL8Ycnpry3lhwPf8Csi0Enc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ew/CY/2R5O8JFFjqj95EH8X6LJvznX7QjqRxnwkpNgZhmbVJCrKCwutrkpehNTKWf
	 GbfI1pe7lumy0QQp4gnPrx98zcaLcBELb2faxIn3AJny4zINpqvaE2X42ygtAYz+U6
	 Koy/zoQPHhW+h339fEH6txO7dAMP5SCqXFTNDUrCH/vozyx15ePg2WkjPOZuGdJrfv
	 VTpENLHqF/cl7MnJMyl3eQ6oQyJjSMsh/M0nY/6R6QOglJ3ldITA7nXFXq9awUae+n
	 JPM8Yyh72cvPLERZoFM2i8PxJ4WXKx20tWQxsw89kbmd7JbSp4WZPgfsCZAKQNDEKt
	 9ZpiegbtZ9A6w==
Message-ID: <sashiko-outbox-170326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] regulator: lp872x: Remove platform_data based
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013181417.492252-6-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
 <20261013181417.492252-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:27:13 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: gpiod_set_value() called with enum gpiod_flags instead of lo=
gical integer
--

commit 66e7cc15bc21448dbaf8906353d687e2f61e221f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

regulator: lp872x: Remove platform_data based probing

The platform_data-based probing is tightly integrated into the lp872x
driver structure itself; removing just the platform data support is
impossible without remodeling major parts of the probe sequence.
The lp872x_platform_data structure was removed, and its contents were
incorporated into the driver private structure and lp872x_chip_info.

> diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
> index 1e16d7e8361a0..50870ffe75ac5 100644
> --- a/drivers/regulator/lp872x.c
> +++ b/drivers/regulator/lp872x.c
[ ... ]
> @@ -344,10 +333,9 @@ static int lp872x_buck_set_voltage_sel(struct regula=
tor_dev *rdev,
>  	struct lp872x *lp =3D rdev_get_drvdata(rdev);
>  	enum lp872x_regulator_id buck =3D rdev_get_id(rdev);
>  	u32 addr, mask =3D LP872X_VOUT_M;
> -	struct lp872x_dvs *dvs =3D lp->pdata ? lp->pdata->dvs : NULL;
> =20
> -	if (dvs && dvs->gpio)
> -		lp872x_set_dvs(lp, dvs->vsel, dvs->gpio);
> +	if (lp->dvs_gpio)
> +		lp872x_set_dvs(lp, lp->vsel, lp->dvs_gpio);
> =20
>  	addr =3D lp872x_select_buck_vout_addr(lp, buck);
>  	if (!lp872x_is_valid_buck_addr(addr))

[Severity: High]
This problem wasn't introduced by this patch, but the modification of the c=
aller
in lp872x_buck_set_voltage_sel() retains a broken data path under the new d=
river
structure.

Does lp872x_set_dvs() incorrectly pass enum gpiod_flags to gpiod_set_value(=
)?

Looking at lp872x_set_dvs(), it assigns enum values to state:

	state =3D dvs_sel =3D=3D SEL_V1 ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
	gpiod_set_value(gpio, state);

Because both GPIOD_OUT_HIGH and GPIOD_OUT_LOW evaluate to non-zero values,
gpiod_set_value() will always drive the GPIO high, breaking the dynamic vol=
tage
scaling (DVS) state selection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013181417.4922=
52-1-clamor95@gmail.com?part=3D5
