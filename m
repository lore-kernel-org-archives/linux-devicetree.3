Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0B3EA957
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938408; cv=none; b=A+ypbKX87/4JAiakVfVKP8m67Z+yysfBZ2UiTezdA10qjVZSzarV5MFbhdG0owBwn1d8pzsbqygh3J5XlpRqz/WXcgoEmi8Rwblbl5h29bUDCW71ofhA7nQlIMq307Tasby7x7uXgordyESIxFjLpyZM7e2gAHdWAdy/llec224=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938408; c=relaxed/simple;
	bh=L6W6cdlHAOrVi3YPff6YFRe5wqcHpjV09AmtPKVXMsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R08biKaWMJU7HjUJ6jh3UD/VWJG1J3IFt0oPU/nVbPcYHFV+bvtyKJOGTaTmWQ3TnWqCS9IgahzB+nwtlAHT7gpmCR8brsTxiv3F0s2RxNls1C1PpAtgg9x5qXn8uHxMzZQ33nkMo9CjxX95ZPqBfq1CtzGWPPpURXxqEqWNOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8P4cwvD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8P4cwvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385C31F000E9;
	Mon, 13 Jul 2026 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783938402;
	bh=8aFhG6KpRe0wyHDXywMD37d9u5HMW8dOJ8bgCt14hwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a8P4cwvDjnfrAWODPtjZz5jVIkBlJLjac/wnRj8m/qu6jjgaeS8KnXplbNLQfnYE0
	 KVF7Yftny+MoKXkP3e+0nic1eeOyHOh/6dU0OqXbLBeWjljmDPesiQmpkBleQCMX8l
	 qns++jqlouoI+BQaf66j2gK15h+F477y4h4Jw6SlZ7FZPAS47L0fRYHLsN3alHfyhq
	 jmIpuKvUXfQNePyWZkdPjbdkC4RaSocBAcM4TCMlvw05DOYU5jpwS1ftYUUj0jnszl
	 tXJxUfL1EfTgunYAr+ChG1kWmh1VeRkjnhD1VDdKynBDulXQtH81BlhQ0ZPCifKpPp
	 tgH+yNFCdOMuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: add mt6323 PMIC EFUSE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-mt6323-nvmem-v3-2-205c39267a24@protonmail.com>
References: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
 <20260713-mt6323-nvmem-v3-2-205c39267a24@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:26:41 +0000
Message-Id: <20260713102642.385C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver blindly dereferences `dev->parent->parent` to retrieve =
the regmap, which causes a NULL pointer dereference kernel panic if instant=
iated outside the expected MFD hierarchy, and violates MFD subsystem guidel=
ines.
--

--- Patch [2]: [PATCH v3 2/3] nvmem: add mt6323 PMIC EFUSE driver ---
commit 25fbde0741e1e6a18bf5c1f7cc92f4eb70b9d17e
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: add mt6323 PMIC EFUSE driver

This commit adds support for the EFUSE controller found in the Mediatek
MT6323 PMIC, which stores 24 bytes of hardware-related data.

> diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
> new file mode 100644
> index 0000000000000..41678915d5b62
> --- /dev/null
> +++ b/drivers/nvmem/mt6323-efuse.c

[ ... ]

> +static int mt6323_efuse_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct nvmem_config config =3D {
> +		.name =3D "mt6323-efuse",
> +		.stride =3D 2,
> +		.word_size =3D 2,
> +		.size =3D MT6323_EFUSE_SIZE,
> +		.reg_read =3D mt6323_efuse_read,
> +	};
> +	struct nvmem_device *nvmem;
> +	struct regmap *regmap;
> +
> +	/* efuse -> mfd -> pwrap */
> +	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

[Severity: High]
Can this cause a NULL pointer dereference if the device is instantiated
outside the expected MFD hierarchy?

If the device is instantiated directly via a Device Tree root node overlay =
or
through sysfs, dev->parent could be the platform_bus. Because the
platform_bus has no parent, evaluating dev->parent->parent would result in
NULL.=20

Passing NULL to dev_get_regmap() leads to an immediate kernel panic when
devres_find() unconditionally locks the devres_lock.

Additionally, MFD subsystem guidelines recommend that child drivers retrieve
data using standard APIs without relying on hard-coded assumptions about
grandparent device topology.

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	config.dev =3D dev;
> +	config.priv =3D regmap;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-mt6323-nvm=
em-v3-0-205c39267a24@protonmail.com?part=3D2
