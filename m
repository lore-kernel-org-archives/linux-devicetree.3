Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391A388862
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387030; cv=none; b=FhkpzXXeYCcpZFEsdPJpnxeJW/93Dt8m9LtgVQOdO/8vTaFtoFJgxbkJB40kpqHxl+Wqpi4GyG7nC0AS2Z7n8ymDkWauJ5hHGDuZ71/OgiYEay+8/w8Xd8RvDpYbpQQWyXezwVSxDbnt0PJTIupBmAqzN71wo2YvNCWN3uK2Nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387030; c=relaxed/simple;
	bh=GwRHblL/JWSksV59fgsYa5OgJXeKrKQcHQCOP5M0VaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KU+kbUBiWrczMxVsBGV76y9Esp0KTVWwB4WYfWxCYSi+K/FtvM+/pb6Ak2CiIUOHgnY6m1O7U2KSZHTgX1GdEdbE8erBOOB+mCb3fw7HxJXd139qk4agYS4jPYHFOKhq0zrVv4Pl2dbji5Rzujs8MKh3rWuTz6jsE7B4D7HuhfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuL5HQEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuL5HQEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C000C1F000E9;
	Thu, 21 May 2026 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779387029;
	bh=DgGWva+6e/Dbunc6jfiDestDbWTUYzrd67ZpMt1x0hI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuL5HQEZx9IR6YU2ZjUw/Rv7O1GlkTus7DySmyLvq7ALqGNjc5majNuy7cPOLTbFm
	 CmJl/Rk5zazP6XHdUDpJvq1lR+uE+43RW8dEdylDHcXzYWZ8Tp/eBNqKnkfyF9TxXU
	 UU+6AWbqgcm40snvzfQE1UNMdxf70lILKykVC0VkluB0EcxQAsQ4s6UjiHR732srkZ
	 VTn+dGR+Xl6EqYCGChs77LeKhLWVeCNMsHYELdH2syUosRI/rDSEEEbd48bffy8yQJ
	 b8Npp8vuVVw9GqCa9co28MkVFGL0tPb+TRH4TAcHsSKoYQM4eovg0RzAyAoOvxpbuL
	 S3uQsx1hc9k3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] iio: core: Add IIO_COVERAGE channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521164323.770626-7-liviu.stan@analog.com>
References: <20260521164323.770626-7-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 18:10:28 +0000
Message-Id: <20260521181028.C000C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The sysfs ABI documentation for IIO_COVERAGE incorrectly uses 'X' i=
nstead of 'Y' as the channel index wildcard.
--

commit 6217a0a065fdaa7ef3fffa525f2928d59a323a05
Author: Liviu Stan <liviu.stan@analog.com>
iio: core: Add IIO_COVERAGE channel type

This commit introduces a new channel type for sensors that report fractional
coverage as a percentage. It updates the core IIO structures and provides
the necessary sysfs ABI documentation for the new attributes.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/=
testing/sysfs-bus-iio
> index 4fc9f6bd42812..90fb8ef26de0e 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -1959,6 +1959,23 @@ Description:
>  		Raw (unscaled no offset etc.) resistance reading.
>  		Units after application of scale and offset are ohms.
> =20
> +What:		/sys/bus/iio/devices/iio:deviceX/in_coverageX_raw

[Severity: Low]
Should this use Y for the channel index wildcard instead of X? The IIO sysfs
ABI documentation typically uses X strictly for the device index and Y for =
the
channel index, which would make this in_coverageY_raw.

> +KernelVersion:	7.2
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Raw (unscaled no offset etc.) coverage reading. Used for sensors
> +		that report fractional coverage as a percentage, such as leak
> +		detectors where the value represents what portion of the sensing
> +		element is wetted. Units after application of scale and offset are
> +		percent.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_coverageX_scale

[Severity: Low]
Does this attribute have the same naming consistency issue? Following the
standard convention, this would be in_coverageY_scale.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521164323.7706=
26-1-liviu.stan@analog.com?part=3D6
