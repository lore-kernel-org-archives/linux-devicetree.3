Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7C38A72B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705993; cv=none; b=DehMg6elKHiKtOZSx1iQsrMBqHbWvoy9p61gjI/jI++LeLc2KUo+CKuNidDwXJohlIbNRvEFQvjiQd6cVHLuMAw0wgD+hQyNMhK9iJq5r7q9UPoAM2p1cnlC+/3UF3mSiJdp+348ZqwWDtDmAeKSOQZyl5jfZ8k24pCQh0AjJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705993; c=relaxed/simple;
	bh=tvlrGcM/AUE8AcKczZQ9XpmobKLfQt6KWsN5V7FTq74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VOSxrrKVk9JEik3SQgzXTMvuMrScROvv0K1TNlMTM2KZtiAPoJ8Nl1wQyYm4cpchH5cuYum3zveLnCa3BfXDyJ0PYcn3pqpZoXeoU8KH8oaZMFfOxMZh7Utz0dZnuTjENl2BCyIYj4aTyaLwRcRt726LOwlOlS7pOMvX7h1Kggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+3NcvI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+3NcvI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CF4C19425;
	Wed, 13 May 2026 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778705993;
	bh=tvlrGcM/AUE8AcKczZQ9XpmobKLfQt6KWsN5V7FTq74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=N+3NcvI7jVKjlZtGlO2tx+IwVSGuTK5ax+cK7ulIy8Ub3P1Fx7t2iXxBUQw9zY+IJ
	 IczFTG3LfU8oKtEi63K+K78QaKKRDx9z7GWt77MhruOsmG5WjfspdfaynnpkmH/BXr
	 tAQorDgqt+/qoecifceNf02cMubj0uVXVTqqzziGBvianh2aXE7eXB06TQu20+rE3h
	 P4GpgTBwVq2z7s/M5/HMipGlG3BHGY8oeLqtu1v7n38GVvvdmB47SSJI/IAS5Egxz+
	 w3jksUrpLtW+SoeQfSTltuPu0Jgaau/TWB7Z1eK/Rh1nU9IAFrlM9zVHrmtsOOxTXk
	 Vuz0pgWcR2QAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] regulator: mt6359: Add proper ldo_vcn33_[12]
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512085358.1693208-7-wenst@chromium.org>
References: <20260512085358.1693208-7-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:59:52 +0000
Message-Id: <20260513205952.E8CF4C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The return value of `mt6359_sync_vcn33_setting()` is ignored in `m=
t6359_regulator_probe()`.
- [Low] The logging messages in `mt6359_sync_vcn33_setting()` print incorre=
ct 0-based regulator indices.
--

commit 6f24659e7932d4cb71b42c3442fde771560f8271
Author: Chen-Yu Tsai <wenst@chromium.org>
Subject: regulator: mt6359: Add proper ldo_vcn33_[12] regulators

This commit consolidates the separate Wi-Fi and Bluetooth regulators into
single hardware regulators for ldo_vcn33_1 and ldo_vcn33_2. It syncs the
enable bits and forces the Wi-Fi bits off to simplify handling, while
retaining dummy regulators for device tree backward compatibility.

> diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6=
359-regulator.c
> --- a/drivers/regulator/mt6359-regulator.c
> +++ b/drivers/regulator/mt6359-regulator.c

[ ... ]

> @@ -951,27 +949,114 @@ static const struct mt6359_regulator_info mt6359p_=
regulators[] =3D {

[ ... ]

> +static int mt6359_sync_vcn33_setting(struct device *dev, unsigned int id=
x)
> +{

[ ... ]

> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(vcn33_regs[0]); i++) {
> +		u32 bt_en_mask =3D vcn33_regs[idx][i].bt_en_mask;
> +		u32 wifi_en_mask =3D vcn33_regs[idx][i].wifi_en_mask;
> +
> +		ret =3D regmap_read(mt6397->regmap, vcn33_regs[idx][i].wifi_en_reg, &v=
al);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to read VCN33_%u_WIFI setting\=
n", i);

This isn't a bug, but since the loop index i starts at 0, will this print
VCN33_0_WIFI instead of VCN33_1_WIFI on the first iteration? Would it make
sense to use i + 1 here and in the subsequent error messages to accurately
match the hardware component names?

[ ... ]

> +		/* Disable VCN33_[12]_WIFI */
> +		ret =3D regmap_update_bits(mt6397->regmap, vcn33_regs[idx][i].wifi_en_=
reg,
> +					 wifi_en_mask, 0);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to disable VCN33_%u_WIFI\n", i=
);
> +	}
> +
> +	return 0;
> +}
> +
>  static int mt6359_regulator_probe(struct platform_device *pdev)
>  {
>  	struct mt6397_chip *mt6397 =3D dev_get_drvdata(pdev->dev.parent);

[ ... ]

>  	ret =3D regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
>  	if (ret)
>  		return ret;
> =20
> -	if (hw_ver >=3D MT6359P_CHIP_VER)
> +	if (hw_ver >=3D MT6359P_CHIP_VER) {
>  		mt6359_info =3D mt6359p_regulators;
> -	else
> +		mt6359_sync_vcn33_setting(&pdev->dev, 1);
> +	} else {
>  		mt6359_info =3D mt6359_regulators;
> +		mt6359_sync_vcn33_setting(&pdev->dev, 0);
> +	}

Should the return value of mt6359_sync_vcn33_setting() be checked here?

If the regmap operations inside the sync function fail, it returns a negati=
ve
error code via dev_err_probe(). By dropping the return value, the driver
silently continues to probe and register regulators on top of an
unsynchronized or inconsistent PMIC hardware state.

Could this return value be captured in the ret variable and propagated up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512085358.1693=
208-1-wenst@chromium.org?part=3D6
