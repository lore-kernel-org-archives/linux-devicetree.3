Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1D361DCB
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684184; cv=none; b=pXkIKXbk+xCIHibsXBxEB+WXkMOoS6c2O3y1vAtdQk93BkiwCujp4Bb8AM0nGmN7bEnp7fJSBkRNEHUkHaG/HD1m2LMiNIE4o/UsvFFmtj58RQGacYQ4bgAL9lS0U4Myk5HU3F//pT36p5RfVG+E0xMzFaLek20meMaxdpd7Nvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684184; c=relaxed/simple;
	bh=+TAkH8nRV9j2LLZCUpKNfrJa5Md8HV/28lbZPf+5y/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ItNgPOyLEzefJc087JP7g7OZdLH04o+mR9jMqtP788gOqfl+8F9dTy4oxZNebVsvjcj5Yjpc3dbtnmxhVE1FB5keygYbt3NdT/G+fC8OODRliKHuzfNYidLtEi8kZpCBCTqBK0yBBfzU0HUGIUfyBt9YgW2ZSdXG4seFWGFuKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USh36Gqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USh36Gqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA6F1F000E9;
	Wed, 17 Jun 2026 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781684183;
	bh=4OcL97xrfTE7rUBq9e/XMFoUkkFXURodxoTV3L66j/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=USh36GqqAVvfJzEVSOtFZmPE1doBm64dGpcD37gvtN5hF9lTRCRRAjcOua/K/TBwA
	 qznzpv/Nlq4DY7LhS69ERm+CR2orIfvAW9Gb/Z5enP7z0+oorUDZuzAQcujv8N3Mb5
	 uw5uM6IjFQzrcUgEZtTmqhVto/x/rLWXqYNIhcX7iy61qR6gmmhwvjoGT1eUDGR+TY
	 x4C0bQxZmodP4crcb822q4zZzg5071qTFJKmAhQ66/dZ2zJlQYIj9afsgXJHwlwU6j
	 xWLRnhccq/stMuhIXoUDvQXpYV8sFg4MMTdpPi9W9FlkYuEIgO7qCfPhHw9VMzVRse
	 yyKS/kC9I4ELQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/14] video: backlight: lm3533_bl: Improve logic of
 sysfs functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260617080031.99156-12-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-12-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 08:16:22 +0000
Message-Id: <20260617081623.3CA6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Sysfs attributes were inadvertently moved from the backlight c=
lass device to the platform device, breaking userspace ABI.
--

commit b4eaddced56809e9f87ffe143724f151f0e7013e
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Use dev_groups in struct device_driver

This commit replaces manual sysfs attribute creation during probe and
removal in favor of using dev_groups in struct device_driver. The goal
is to let the core handle the creation and removal of these attributes
automatically.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 4d6f680334802..9ef171d3aaeab 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
[ ... ]
> @@ -304,28 +309,17 @@ static int lm3533_bl_probe(struct platform_device *=
pdev)
> =20
>  	platform_set_drvdata(pdev, bl);
> =20
> -	ret =3D sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);

[Severity: Critical]
By removing this manual sysfs_create_group() call and moving it to the plat=
form
driver's dev_groups, will this change the location of the sysfs attributes?

The original code registers the attributes on the backlight class device's
kobject (&bd->dev.kobj), meaning they appear under
/sys/class/backlight/<name>/.

> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
> -		return ret;
> -	}
> -
>  	backlight_update_status(bd);

[ ... ]

> @@ -377,6 +370,7 @@ static struct platform_driver lm3533_bl_driver =3D {
>  	.driver =3D {
>  		.name	=3D "lm3533-backlight",
>  		.pm	=3D &lm3533_bl_pm_ops,
> +		.dev_groups =3D lm3533_bl_attribute_groups,

[Severity: Critical]
Does moving the attributes to the platform driver's dev_groups inadvertently
register them on the platform device instead of the backlight class device?

This means attributes like als_channel, als_en, and linear would now be exp=
osed
under /sys/bus/platform/devices/lm3533-backlight.<id>/ instead of their
previous location.

Will this break backward compatibility for userspace tools relying on the
standard backlight path?

>  	},
>  	.probe		=3D lm3533_bl_probe,
>  	.remove		=3D lm3533_bl_remove,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617080031.9915=
6-1-clamor95@gmail.com?part=3D11
