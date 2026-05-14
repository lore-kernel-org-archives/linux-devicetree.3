Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841013563FA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729570; cv=none; b=e5ZGo+tD6g0fbul6NKS5t4oUwDt1fO5oI+obgE10V/yWkQpDeIGuwQehmOjsFQEVQu6scjt9CO76YkLrJ4EAiUBjxibTPyW06sBMrGBkZymr41WS2WUSSdzRmw0CO3ec9HcF/+Z+nP0JWvOIxg2Jr/0GqlvgZ8y8oQgtWS9agIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729570; c=relaxed/simple;
	bh=/ZnCrcpv9Xo5bD7ptfYPDHPXGSiM3xi4VJ71VDRB+L4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BmMGfE/o21QsmoTa9AzOHTLgIVjMJeEo4hnTLx8a2Xg2GQLKPuekva/cW38XiPhdUMOZcTebIBMBdWXEOwoxVjJqWgzlpWaMzMMuLkYosm+ycuEqKQkb4ZUaj+SEDyO7Sg4aY39WLcvEdFRq71W13yzx5nzaLCDOsRuf8hXC6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/8HC/TT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/8HC/TT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC3EC19425;
	Thu, 14 May 2026 03:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778729569;
	bh=/ZnCrcpv9Xo5bD7ptfYPDHPXGSiM3xi4VJ71VDRB+L4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=i/8HC/TT1dhvqIYywy5+yPAyG/18KXwbGQyJmX9ScBga29/xNw0Zh78e6fd4YWv6K
	 74NZC8jfmGN1X8XL3SiwYENnoognuuRBdQvTw9uIwCDj/TRNK253FdFQy3/Ze48Pq/
	 Irz2d88LzrraLdbIUvH5Tj+9tAPyMbcp7RoG2HR26tdzZmx8IcEu8RksY0iDcRayeC
	 wC7RgiP32eHkdWjG8tscPH60vP6Qsc/ZZPlQyimpf0SCgnRBT2GYrvxV7F3y6aew09
	 d57bj5HyATl4IAlI8TwBa4SHW/ilD0LC60bM75UgvmOZt4N3cemnKwEhWvJLDwl5q0
	 CrVXkgF1SWsQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/17] ASoC: simple-amplifier: Remove DAPM widgets
 and routes from the ASoC component driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513081702.317117-9-herve.codina@bootlin.com>
References: <20260513081702.317117-9-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:32:49 +0000
Message-Id: <20260514033249.8BC3EC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Probe fails unconditionally for non-Device Tree instantiations (=
platform board files, ACPI PRP0001, or CONFIG_OF disabled).
--

commit a564ff83aa42e00d34fe9812df9996695059dbc5
Author: Herve Codina <herve.codina@bootlin.com>

ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC compon=
ent driver

This patch moves DAPM tables from the ASoC component driver to the device
compatible string matching data. This allows the simple-amplifier driver to
configure different DAPM widgets and routes dynamically during probe based
on the compatible string.

> diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simpl=
e-amplifier.c
> index 231e84ab4c0e3..3e644c1c26960 100644
> --- a/sound/soc/codecs/simple-amplifier.c
> +++ b/sound/soc/codecs/simple-amplifier.c
[ ... ]
> @@ -75,6 +111,10 @@ static int simple_amp_probe(struct platform_device *p=
dev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, simple_amp);
> =20
> +	simple_amp->data =3D of_device_get_match_data(dev);
> +	if (!simple_amp->data)
> +		return -EINVAL;
> +

Will this cause the probe function to fail unconditionally on non-Device
Tree platforms?

Since the driver does not depend on CONFIG_OF, it can be built and used on
systems without Device Tree. If CONFIG_OF is disabled, or if the device is
instantiated via ACPI PRP0001 where dev->of_node is NULL, the call to
of_device_get_match_data() will evaluate to NULL.

Because probe now returns -EINVAL when the match data is NULL, this looks
like it will prevent the driver from probing entirely on those platforms.=20

Could this use device_get_match_data() instead to safely support non-DT
systems?

>  	simple_amp->gpiod_enable =3D devm_gpiod_get_optional(dev, "enable",
>  							   GPIOD_OUT_LOW);
>  	if (IS_ERR(simple_amp->gpiod_enable))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513081702.3171=
17-1-herve.codina@bootlin.com?part=3D8
