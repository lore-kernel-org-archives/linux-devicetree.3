Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C083C0617
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174092; cv=none; b=ieIAvW3ghL7k/2N5JniI9o1h2qdgH/KZNnz/tIK6VUYIpXX7rHTHoHhNtVqjYYkZgQFvRs0GRbI79vsZlggvC5uwF7BP6NdTqOe/gweJD0tsZWmOnG+S1GR2CNhQ8hgBFU8fFGYFNsebxB2FIgxhtzZKn0D6CWYLVGtuGTe1MBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174092; c=relaxed/simple;
	bh=MXbwExFB1G9ZhXdlIXQoW4mkpuwTpm+e3H8zPqcs29k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YInjY524s8iqJEmS08Sq/wPg60Sy4XMOBNLEXL6mxwwwE6u95b8ZYw7Bgif95T036Selu2EyyP6q4SIIpmENw+XlmIIDEaB9IK5r8Pg58IOyLoDzrjXU5f+HGXORawEJuisAVFKMbbTtPl5h52U+DtBDM1c9UnRqnthSDd1kMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5FTt/1G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5FTt/1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889D31F00893;
	Thu, 11 Jun 2026 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174090;
	bh=67CE+Ta7TVvmqjrlLY6u3zasdIB5sGeCt0vkDrIO5Fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5FTt/1Gdd7Gof2E0IggniNqX1d0itIAKIwJ+zNwxn6SBZyEIkUopmA0hT4eoxhg/
	 I2yXI6lE4J3/N1njwKFvX0HwJtkb3Urzkj7w5msLmd2hYIHYgJ930JfWkltDEuglti
	 ebDVS8MAErGceHiZ4MltDrX03zsVVlZYzraIEXOFd1ONMKuqh+YIXaJqdWsyWO3IEn
	 J7Guz+PStLpubcucQpHQF3b8dK0VhhLJKTuJcQR6Axqk6rhnopFq+vP+X/rdH7vQzf
	 Ml0EZiGjVXPJ1MmCAe7GgE/SHYhwoIpexMTK1zSoNfieILSio2H4qGO78CddIxPe5b
	 bQU8yPS6UTYEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] nvmem: add mt6323 PMIC EFUSE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
References: <20260611-mt6323-nvmem-v1-2-b5e1b9ce51f2@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:34:49 +0000
Message-Id: <20260611103449.889D31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Blind dereference of `dev->parent->parent` can lead to a kernel pa=
nic if the device is not instantiated with the expected MFD hierarchy.
--

commit 227574270c722d2b535d72fadcf31ba55bc47f8e
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: add mt6323 PMIC EFUSE driver

This commit adds support for the EFUSE controller found in the Mediatek
MT6323 PMIC. It introduces a new nvmem driver that reads 24 bytes of
hardware-related data using regmap over the PMIC wrapper.

> diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
> new file mode 100644
> index 0000000000000..c6fbfd96ac047
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
Is it possible for dev->parent to be NULL here?

Because the driver defines an of_match_table, it might be instantiated dire=
ctly
by the OF core or bound manually via sysfs, bypassing the MFD subsystem.

If dev->parent is NULL, evaluating dev->parent->parent will cause an immedi=
ate
NULL pointer dereference. Furthermore, if dev->parent is valid but has no
parent, dev->parent->parent evaluates to NULL. Passing a NULL device pointe=
r to
dev_get_regmap() causes a fatal NULL pointer dereference inside devres_find=
()
when it attempts to acquire the devres_lock.

Would it be safer to explicitly verify that both dev->parent and
dev->parent->parent are non-NULL before dereferencing them?

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	config.dev =3D dev;
> +	config.priv =3D regmap;
> +
> +	nvmem =3D devm_nvmem_register(dev, &config);
> +	return PTR_ERR_OR_ZERO(nvmem);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-mt6323-nvm=
em-v1-0-b5e1b9ce51f2@protonmail.com?part=3D2
