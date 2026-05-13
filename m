Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653A383C65
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704459; cv=none; b=FdhDV2HUHVnnb5fn3fQ7TY7ZAVxl6V8R3exn4Iq96N4BUMXlL41jZh1zXdPZg1z9t6+CaXLc9namfzzqxBkvSs4+m+nssNRC1LnCsxPUSnJ6zFI2W7a/6luTZU0Gf/io6mlcEv3D6VXjgjQ/xek/Ef0FjAq+LDrV1gky9zBPOas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704459; c=relaxed/simple;
	bh=gOKy7EZ2exP2NF8vNfrCDlEa6tRuTxesUmreRAV+KGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l165+GnPbUeQ2vuycK3vXGudgvYeh0agk0mVU7cf64ebDtAGXNh6mVDcjN1wM6bBn+W+Swh3lLqDaNvabK044GQc7uOv4cAnaCgaqj3vPBycp9GHkeHv1VGNqBJHpG/JE4up8OoeoHZlXJUTb0xxevtmMlC0odPYy9Ou4DAVNnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3AfAxy4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3AfAxy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51058C2BCFB;
	Wed, 13 May 2026 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778704458;
	bh=gOKy7EZ2exP2NF8vNfrCDlEa6tRuTxesUmreRAV+KGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=j3AfAxy443lKudxDPDne29SLHFrV5hdUkQA7hpISF+hZH9r+PPlUU7tLwVYIUvAQQ
	 eiLON3VTAfQHTL1UqibNG+Q1DshfHgafNS5u/uYzs16n7QdkZ4of2m1MOWP87OWi7S
	 MTvbwGauEULKZXkyuRtFszELoQ25Y6PL9pXX7FS+VN2bogJMavSvbKXX3fziaa9pYc
	 ph5+HF1HQfQ9Qn9bayaZAGedSkYxrDKL9z5GeGnr050lXEAXxW37uVbbmfIL2ZwP3r
	 0oIq53StBiu3ISlqMBCRsYoVVhm2ssmyZi7wtJKOcp7azGOQr9NaNysF/pyoPvHvvd
	 sy2pRxhzVBJvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] regulator: mt6359: Add regulator supply names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512085358.1693208-6-wenst@chromium.org>
References: <20260512085358.1693208-6-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:34:17 +0000
Message-Id: <20260513203418.51058C2BCFB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant memory allocation for `vbbck` regulator description due t=
o hardcoded supply name mismatch.
--

commit 71212b8ad317d34fab479d1bb93b102697d370d4
Author: Chen-Yu Tsai <wenst@chromium.org>

regulator: mt6359: Add regulator supply names

This commit adds .supply_name field settings for each MT6359 regulator to
match the DT binding definitions. It also handles dynamic supply name
assignment for the vbbck regulator which is fed by vio18.

> diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6=
359-regulator.c
> index bcf9a476a34e1..fa97c3189df5d 100644
> --- a/drivers/regulator/mt6359-regulator.c
> +++ b/drivers/regulator/mt6359-regulator.c
[ ... ]
> @@ -641,11 +649,12 @@ static const struct mt6359_regulator_info mt6359_re=
gulators[] =3D {
[ ... ]
> -	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
> +	/* vbbck is fed from vio18 internally. */
> +	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
>  		   MT6359_RG_LDO_VBBCK_EN_ADDR, MT6359_RG_LDO_VBBCK_EN_SHIFT,

Would setting the supply name here to "VIO18" instead of "LDO_VIO18" be
more accurate?

The MT6359_LDO macro sets the default name for the VIO18 regulator to
"VIO18" using the stringified #_name argument. Because this is initialized
to "LDO_VIO18", it seems to guarantee a mismatch during the probe check:

[ ... ]
> @@ -951,6 +959,7 @@ static int mt6359_regulator_probe(struct platform_dev=
ice *pdev)
[ ... ]
> +	vio18_name =3D mt6359_info[MT6359_ID_VIO18].desc.name;
> +
>  	config.dev =3D mt6397->dev;
>  	config.regmap =3D mt6397->regmap;
>  	for (i =3D 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
> +		const struct regulator_desc *desc =3D &mt6359_info->desc;
> +		struct regulator_desc *_desc;
> +
>  		/* drop const here, but all uses in the driver are const */
>  		config.driver_data =3D (void *)mt6359_info;
> -		rdev =3D devm_regulator_register(&pdev->dev, &mt6359_info->desc, &conf=
ig);
> +
> +		/* Use vio18's actual name as supply_name for vbbck */
> +		if (i =3D=3D MT6359_ID_VBBCK && strcmp(desc->supply_name, vio18_name) =
!=3D 0) {
> +			_desc =3D devm_kzalloc(&pdev->dev, sizeof(*_desc), GFP_KERNEL);

Since desc->supply_name is "LDO_VIO18" and vio18_name defaults to "VIO18",
does this cause an unnecessary allocation of a new regulator_desc on every
boot, even when the device tree doesn't override the VIO18 name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512085358.1693=
208-1-wenst@chromium.org?part=3D5
