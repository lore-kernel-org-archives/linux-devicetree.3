Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C47313E07
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677452; cv=none; b=IPuO8AaFqRvpDM4jySOoaTHla0GUeEupRi/AppUVI5pyTT9cZE0MYoIhCbSB85FqbvfW9FnRCTQZwl2jrR37OvhwrtrLdZi9EDPd7Mwd5/7Scfm2Hom4GIERR2dS0eEgaw7Q1Mfc+aUYARSr0yMqaNtkZH6hqrPb2/T8Furh4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677452; c=relaxed/simple;
	bh=BZ3dh+y8yTw9vQ/ebXnkfQKj7qgCkDxIISZu2jd7JDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nEhF/iCmp7G+mMqDYh/4xoDMNnSnUHCfEYZT0YTwCkKPEav1632v8z4pEutJaumRoLnTgomA/8gYWR/7tmdaROoxcqXDbcifS9CKtK/9tqWcQCVd3+YCYqiDQK3WpjC5R6ttg45akVFhDFPGKpOSJBwK6FbjL9CeoJol8Ojvpt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5I3zGnb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5I3zGnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1221F000E9;
	Sun, 28 Jun 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677451;
	bh=y+DjoLhvcubmYEPQzl6nJihLhI2hNMhfZZ+CM2OYqNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M5I3zGnb48gmSxfD5z+Y/AoxumDJt3BWwVsmhFhh+b1jf1j+V+mq1Z0MUF0+C0gDm
	 Bu40vD4AWDTkQWDlwNKA0eZoMLRZgEsa51XigizWfsDAD04NU3mmRAVxOZO+Bjx77i
	 /WAYtIPqMD3sbiLykg6Wpgh8moIs4rpMpFC06k/we6LQ72IpUdhrz9sVrfab6ppPps
	 z4jWm09GkwXrpIHcP4ZKIiLOM9rqQKppHjnI76eVz5mDtdpXQgNquayEUj0zyeRA+C
	 GrkVHmg8ji3Zs9apvLmgLQEDeXbGOjhX8AA1xJBFB7BVSYgYizEIzLv5k7ALZb0UEF
	 6XwxtZzvxNLkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628-zx29clk-v5-4-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-4-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:10:50 +0000
Message-Id: <20260628201050.7D1221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing NULL check for the return value of of_device_get_match_dat=
a() leads to a NULL pointer dereference if the platform device is instantia=
ted manually via sysfs.
- [Low] ZTE_ZX297520V3_CRM selects MFD_CORE without inheriting its dependen=
cy on HAS_IOMEM, causing Kconfig unmet dependency warnings on architectures=
 like UML.
--

commit 495318b62d6f1914184cf6bb01fdd361eef66cc1
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

mfd: zx297520v3: Add a clock and reset MFD driver.

This commit adds a new MFD driver for the ZTE zx297520v3 clock and reset
controllers. It registers the child devices required to drive these
functionalities.

> diff --git a/drivers/soc/zte/Kconfig b/drivers/soc/zte/Kconfig
> new file mode 100644
> index 0000000000000..1016fb99cf734
> --- /dev/null
> +++ b/drivers/soc/zte/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +if ARCH_ZTE || COMPILE_TEST
> +
> +menu "ZTE SoC drivers"
> +
> +config ZTE_ZX297520V3_CRM
> +	tristate "ZTE zx297520v3 Clock and Reset Manager"
> +	select MFD_CORE

[Severity: Low]
Will this select statement cause a Kconfig unmet dependency warning on
architectures without HAS_IOMEM (like UML)?

Since MFD_CORE depends on HAS_IOMEM, and this driver can be built with
COMPILE_TEST, it seems this config should also inherit the HAS_IOMEM
dependency to prevent silent build configuration issues.

> +	default SOC_ZX297520V3
> +	help
> +	  Say yes here to enable the driver for the ZTE zx297520v3 clock and

[ ... ]

> diff --git a/drivers/soc/zte/zx297520v3-crm.c b/drivers/soc/zte/zx297520v=
3-crm.c
> new file mode 100644
> index 0000000000000..bf5a71bc7706b
> --- /dev/null
> +++ b/drivers/soc/zte/zx297520v3-crm.c

[ ... ]

> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	const struct zx297520v3_crm_data *data;
> +
> +	data =3D of_device_get_match_data(&pdev->dev);
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, data->cell=
s,

[Severity: High]
Can data be NULL here?=20

If a privileged user instantiates this platform device manually via sysfs
(for instance, by writing to driver_override and binding it), there will be
no OF node. In that case, of_device_get_match_data() returns NULL, which
would lead to a NULL pointer dereference when accessing data->cells.

Does the return value of of_device_get_match_data() need to be checked?

> +				    data->num_cells, NULL, 0, NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D4
