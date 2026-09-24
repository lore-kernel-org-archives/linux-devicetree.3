Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E647C105
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255573; cv=none; b=IjVbUPBb0EyPWpXSUoYD0GG59RPXS3bm4JDocQ3cMJgmQs6YpRBiXEdSGGC5f0NDeK3zFVwVMps7gcJmIXps4wE/jdSx7J7vYmfErUggGN01rrrToM+lb76OKE7witMyb3udC6QvWCpElSwNdY7vEX8SEpC2EjQZuQJI8lzrJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255573; c=relaxed/simple;
	bh=kRdbizh6itEVzwsODGfexgPLE+lgsyR3uA96KLVdHOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nLS595iFqV07puXoXDV8HG2BYuzYb+Y78G6o7+F96aMCSmWv6CUYZKIvNxh2CLgEiSgijWhARUG78rqv0O3PG0wyReyJldgnOYFT32ywPgXmWc4WxW/N4iOaP+3eOmTEnrDSShYsyI7O+Mi4CLeMVajRpjQKLrPY4F8c6oIIeKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ze6m0A+F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ze6m0A+F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D59D1F000FF;
	Thu, 24 Sep 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255571;
	bh=WTX6cKXGVVLvBVCMvoOi7/KbV58V/EGfy4BAckOYJvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ze6m0A+F0eoPO0OS9w5LP/sS6iEqMgL+bwPVPKO8dl45uQZbGg0ZreKdWViPD3avD
	 A/FNexJ1RxzcHMw9ijY5bwPYPj77xqsw6cfXY6ibLUqR5Ln26JnSEKSF/amKnRsE7j
	 N00ULilN8wiKpeN5YULO2rnFo49O8KNgVMrPa3PD/3CZUQVpNO4o1vHyrONeVucscA
	 yTyPZOChpXuSnEy13x695HymmlgPcdDW3Tu22l2Ry3mgJKn9FetK3X+d1uieuYD1DV
	 NrEWWRCpc8HTU7tdy26pHHkYC3jm0FSFx2Lk9x1ZjS6VYnx50fBahgoozrxcQinqJN
	 lViMzbuKC0+DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/5] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-mcp47feb02_refactor-v8-3-17dc2ce3485e@microchip.com>
References: <20260924-mcp47feb02_refactor-v8-0-17dc2ce3485e@microchip.com>
 <20260924-mcp47feb02_refactor-v8-3-17dc2ce3485e@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:12:50 +0000
Message-Id: <20260924131251.4D59D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kconfig: silent loss of driver during oldconfig upgrade due to p=
rompt removal
--

commit 18f0a50c0487bf003f9efe902b8ee1569bb70adb
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules

This commit refactors the MCP47FEB02 I2C driver into a core module and an
I2C-specific module to prepare for future SPI support.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index b6c8873c68c54..8121a71945f63 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -611,9 +611,13 @@ config MCP47A1
>  	  will be called mcp47a1.
> =20
>  config MCP47FEB02
> -	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 DAC driver"
> +	tristate

[Severity: Medium]
Will this cause a silent loss of the driver for existing users upgrading
their kernel?

Because the original user-visible Kconfig symbol CONFIG_MCP47FEB02 had its
prompt removed here, the build system (e.g., when running make oldconfig)
will see it has no prompt and reset it to 'n'.

> +
> +config MCP47FEB02_I2C
> +	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 I2C DAC drive=
r"
>  	depends on I2C
>  	select REGMAP_I2C
> +	select MCP47FEB02

At the same time, the newly introduced CONFIG_MCP47FEB02_I2C defaults to 'n=
'.
This results in existing configurations losing the DAC driver entirely upon
upgrade.

Would it be better to keep the original CONFIG_MCP47FEB02 symbol as the
user-visible driver to preserve backwards compatibility, and instead introd=
uce
a new hidden symbol like CONFIG_MCP47FEB02_CORE for the shared code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-mcp47feb02=
_refactor-v8-0-17dc2ce3485e@microchip.com?part=3D3
