Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0633557D
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965280; cv=none; b=rA8vw05wIlHCSrz9rz6fW5iWMmmONXApOD+W2xLov8vNoh/NLo8Cydj6ENK6VDrFzX0VEStdr+lQ/Q5CO9PX/yhS/88U4KeRhbdMnkPPDTTfaikZT5HBXdKdk3yVccH7DZ9XWGU1f+SoOM/5/533j8/cvzjSHuRQRqn0tyQRZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965280; c=relaxed/simple;
	bh=mBSXEvVMxm+pdizqkgGd4f4BV+SH4BXxf3Gm9G8Sbos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVqd00lbxy5ax9BhvDXEoZ9Ajv2udKsjPU0Tl8BMPxZsl1S/hzOmGS/xpNrr0AbuBBqUkb14rCe/6eGafYwIeY5COr/xZmLs4uzbRhKhNR01oPkZ6EpStUygQUrUvJfUWty3/VURzlhZlXAgIF50hGxrih1Bn0KxWnVTtQBu0WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGVj5Iue; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGVj5Iue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AB71F00A3F;
	Wed,  9 Sep 2026 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788965278;
	bh=Kh0msfJsTN2Yybb2tDAzKvWLFRb2vG4mfLyk9409bzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGVj5Iuefr/PCK24E7Cg2uwMO+lDt/1o8tcPct3N7lYiBqjd2OoiblCJjTWWn9E35
	 U+dkQIvlz/haxrkkgIXuf09bm29gJ7y87SX9mQ/tBbe3ayN9u+YqMZPjr5R16rN1cg
	 YFeuEwV0ykNyM2aJxE+kIslGKzaqAWp77bAWqUyH1CkbhkqWxTeJzURFnhaeXP8sBD
	 N56bOHhb4Q3o/tI1gVjl+dT0/xgLTq8FLHs3gUL66RSIHlnZP3rRLxxwQMTJUBy6u4
	 hmL5mdHUlPaA685XVfBEzbxXRuucwKjJ0ILT+S5z4kpsa+1kM2hP2hD4iz9o4CbiRX
	 m3acAQ7PgAmRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/10] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-8-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-8-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:47:58 +0000
Message-Id: <20260909144758.97AB71F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Renaming the visible Kconfig symbol breaks existing configuratio=
ns by silently dropping the driver from user builds.
--

commit 528e4c3512ab81e838d441fdb1209303ed961a7f
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules

This patch prepares the MCP47FEB02 driver for bus-specific code by splitting
the existing implementation into separate core and I2C modules. It introduc=
es a
new I2C-specific Kconfig option to support this separation.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 657c68e75542e..cc10d43ffd1e8 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
[ ... ]
> @@ -550,8 +550,13 @@ config MCP4728
>  	  will be called mcp4728.
> =20
>  config MCP47FEB02
> -	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 DAC driver"
> +	tristate
> +
> +config MCP47FEB02_I2C
> +	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 I2C DAC drive=
r"

[Severity: Medium]
Does removing the prompt from CONFIG_MCP47FEB02 break existing configuratio=
ns?

Users upgrading their kernels with an existing .config where
CONFIG_MCP47FEB02=3Dy or m will silently lose support for this DAC. When th=
ey
run make oldconfig, the module will be dropped because the new visible symb=
ol,
CONFIG_MCP47FEB02_I2C, defaults to 'n' and nothing automatically selects it.

Could a transition path be provided to prevent this regression, perhaps by
defaulting the new I2C driver to the value of the old configuration, or by
using a configuration scheme that automatically enables the I2C driver if t=
he
old symbol was previously selected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D8
