Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B244683F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117024; cv=none; b=d9rI1B6nlFJhywbMxn4w4P058m2xAuhHCc5JdUghpMQgMYjPu4A/s+/fRLYqN3jL7bOVzMh2oanMn4jMyXxbW/q1xoDDG06nGaUz0/AB7cZfPYBJHJfb4V5qXKxS+4BNVfYC6/IcpW7EqLKPCCRcJ4Y8wy9KNg071ItIW+CmCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117024; c=relaxed/simple;
	bh=f+dhkqTyjTS6vJ6uZoDcYVh0BMKOvbLC9tFpGcacrd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C/OUoRK7ja1PWV5lV3D7KkAmxUl8agM11yjyiTFdNLWZceglSM/9isVS/ICpVGKJSnbLtUe7F6uLodM6voopCRsqLnsnZTv2wKJ0ORbgSicytj9h3TqJDr871QBfYzRiuyIc9KHlWKhWzIEuRWudwGPyW/lUl1BKDUjR5vqi0Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJT0FBg5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJT0FBg5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398D31F000E9;
	Wed, 15 Jul 2026 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117019;
	bh=9BMIlKthVW4SSXb5Ewe4A1dJj7wI8DYKseKDLS0+VYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AJT0FBg5cbw0OO7MTbLBK3TZ1178N0trw7NbbnRUKm14osaO0dNavuj0yNcYyAYtK
	 zhRByuZsi6UPJIQ6lY9KeAYq+frkpABHKiYlHoap0kGq+730REvRuPFvleF5Q2R80j
	 C9p/s2N8oPEXOv9lAaVY3E8qZwMAik+5G9xFjAnZdZtqigHCqX5y1dUQ0G6p5OEepa
	 wrDlFd8FD+fPT9J0GINkkikdS/Kh15sqcB4NCJxmCP6hag9F8W0E6kITZSutHL/PAs
	 BG6ZUG5oSssXbHj01av7v6YiJ7V/djmDtha+N/mvMmNk0EwdUnB2uD1EQgf7osOSq4
	 luHFa7zCha7Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/21] media: imx355: Use pm_runtime
 autosuspend_delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-media-imx355-v4-13-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-13-f7f966fb9ffd@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:03:38 +0000
Message-Id: <20260715120339.398D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Low] Unconditional assignment of the imx355_pm_ops structure causes dead=
 code when CONFIG_PM is disabled.
--

--- Patch [13]: [PATCH v4 13/21] media: imx355: Use pm_runtime autosuspend_=
delay ---
commit 6f6f1ba748842249c2565926292b231a564e183f
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Use pm_runtime autosuspend_delay
   =20
Avoid powering the sensor up and down unnecessarily by using
pm_runtime's autosuspend_delay feature.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 120eda46d9820..17a2acc1152df 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c

[ ... ]

> @@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
>  	 */
>  	pm_runtime_set_active(imx355->dev);
>  	pm_runtime_enable(imx355->dev);
> +	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> +	pm_runtime_use_autosuspend(imx355->dev);

[ ... ]

>  static struct i2c_driver imx355_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D "imx355",
>  		.acpi_match_table =3D ACPI_PTR(imx355_acpi_ids),
>  		.of_match_table =3D imx355_match_table,
>  		.pm =3D &imx355_pm_ops,

[Severity: Low]
This is a pre-existing issue, but shouldn't this PM operations assignment
be wrapped?

When CONFIG_PM is disabled, unconditionally assigning imx355_pm_ops causes
the structure and its callbacks to be linked into the kernel despite never
being used. Would it be better to wrap this with pm_ptr(&imx355_pm_ops) to
eliminate the dead code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-media-imx3=
55-v4-0-f7f966fb9ffd@raspberrypi.com?part=3D13
