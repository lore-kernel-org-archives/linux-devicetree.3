Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3425B0A5
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109534; cv=none; b=RckZRnh00uExbVEGG02gU0Rst8Wv89aWyTAskv0ZYKPitV4LXc6bZubcxu3xSiAj2q4gG6t+EkgmirdjgLynVRB9i6lyVw3n81QDRkIhkXfAZ10TqNYfPPxGx+9kI0mJ5p8mz/gDiai8V9ZRU7kxEmM7K/Z+osj9arCz4f1ADiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109534; c=relaxed/simple;
	bh=2EWWMIkHIYH1207Zd5ZSrKRSn3sRkXe5rHxmsjXhQg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EugeJoOs5V5maEeIEqQq0TyAkuo+/EQPuxfAxWSllkQGe0i4BzE9YbHTFpaNDpEeXigiCSqu1+6wTi+yra7d0N8iXIQKFkSMJ2uGFV5KR2FC/WlYtAvxys+DzAo0TdKSHXVVUvSwytyiKHxAzqf0+l8rKGKG8BHJFwt3NLp3EV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4O2L8SM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4O2L8SM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DAB1F000FF;
	Fri, 11 Sep 2026 06:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789109514;
	bh=hTXtsAdiocrmQXRdHXlU+7vIXynpBcDCeT+7ACeN+uY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K4O2L8SMzcwsVZy/TsftCrnVbcb0s+hO6d85+Kn0+ICeQuvIfjXvISWDlFUYK2T61
	 5PqG9XtNqvlMSHToZ8VZdsm5TWct72OkHZNcA3a/r6XLMVV93T3lBlrtJmCwhXJlce
	 faJbR14RGNiSBLJIbJgf8mraiPVHvtp0l5zsCiDGkUth0N2GbtxU5VHf6gOQBOnNDd
	 KSxXSUU7AmWuICzrjobguPIhkou0wN2sGiC08M6vaja/BbFbVIRhUFPaebCK5mWhUT
	 rhi7PBiG916Sdhu0ZCWA+Za9W2uMfa3N0hWXhgZMRizReQVWmeZiyuTCl7M53feicG
	 CgZAdIvppGuZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] nvmem: add mt6323 PMIC EFUSE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-mt6323-nvmem-v4-2-626dd17531dc@protonmail.com>
References: <20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com>
 <20260911-mt6323-nvmem-v4-2-626dd17531dc@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:51:53 +0000
Message-Id: <20260911065153.C3DAB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] NULL pointer dereference when accessing `dev->parent->parent` to r=
etrieve the regmap.
--

commit 9cacac916b33064bc7243868fd8890da0759dff1
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: add mt6323 PMIC EFUSE driver

Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
thermal sensor calibration values.

> diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
> new file mode 100644
> index 0000000000000..6f6f1cdc2f388
> --- /dev/null
> +++ b/drivers/nvmem/mt6323-efuse.c
[ ... ]
> @@ -0,0 +1,84 @@
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
Does this code safely handle cases where the device hierarchy is shallower
than expected?

If the device is instantiated without a grandparent (for example, via a
malformed device tree overlay or manually created via sysfs), dev->parent
will point to the platform_bus, and dev->parent->parent will be NULL.

Passing NULL to dev_get_regmap() forwards it to devres_find(), which then
dereferences the NULL pointer when attempting to take the device's resource
lock.

Additionally, if dev->parent itself is ever NULL, evaluating
dev->parent->parent will crash before the function call even occurs.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-mt6323-nvm=
em-v4-0-626dd17531dc@protonmail.com?part=3D2
