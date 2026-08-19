Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055602F0680
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143956; cv=none; b=Zi7y/EzNtyAsPLc9hWbVDkPfK3DfSw8xz6aRWKrnlC2xITAp85rtdAtZuJv0pak/sQAzzksYSZQgzNIIVqO+wUFe+qbhhad49TyFzyv8Nw9ml6gyxK+Y1v7nfzbM+s/12o8Am7qbnH+J+EE+WzfUpbr5H2D1F9SvAyBiQcZYpn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143956; c=relaxed/simple;
	bh=rvVQ8U+59lrcPllwPDn1FjN8O4z/QUabEbJgp9R8c4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8TJXZe5ZkkbO8PmFnh45LokGkRGJFTKhBUCe19ypnOI8D5NhKNmTS2ka+mGQRW3LdcAbRSXVRsHJUlYIMPbbrOhOoO33KaXFx9pj7TB+gvcB7jaCzMcriUhFPzbUzAGgcomcuG7KelLRJDPzz0S2lj3/rA+X082IXTlTjpKopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C83d9RjI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C83d9RjI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28A61F000E9;
	Wed, 19 Aug 2026 12:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143954;
	bh=HvbPfYyrnZ88xhzqwrnU6JvjtX6u6ytIC+g3pEh0HG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C83d9RjIzhfdYqy8xmShvTBulnB8Kr36N1o/F0OILq4QNyEK1LUwz9CILeH1a7+yM
	 gzUqT7q13L0XfwnPzC21cKeINZ8pN2qMKYgsJgfs3GUAfOMlGgtF+CEkxVu+vPRzJq
	 4b6DEvia9NmkkOlEZlRwP6eO0aXVJJ8Q4IcTvhly79ScAe26lR8ALXlvzqFUX9HVfJ
	 izGq4Ha2ukjlp4UYp9ItkPVaLWj6/UIDv0mE5wH1YG1Kgq3dCLoP7ZCB3bDWvAWoTr
	 4+kQsHexeYhfR6OF99YMrNy5RkH6CXfDu5RqWvJVGbJ1FbB5/Rko7MeAID4okAT4jD
	 8Z+QXaIXiRSmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/9] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C
 driver into two modules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260819-mcp47feb02_refactor-v4-7-beb2aa3bfd09@microchip.com>
References: <20260819-mcp47feb02_refactor-v4-0-beb2aa3bfd09@microchip.com>
 <20260819-mcp47feb02_refactor-v4-7-beb2aa3bfd09@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:52:34 +0000
Message-Id: <20260819125234.C28A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Making the device tree 'label' property optional causes the lite=
ral string '(null)' to be printed to sysfs.
--

--- Patch [7]: [PATCH v4 7/9] iio: dac: mcp47feb02: refactor MCP47FEB02 I2C=
 driver into two modules ---
commit ed5f5f581011130b05d16462d5287ab79c40d657
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules

This commit refactors the MCP47FEB02 driver into a core module and an
I2C-specific module to prepare for future SPI support.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02-co=
re.c
> rename from drivers/iio/dac/mcp47feb02.c
> rename to drivers/iio/dac/mcp47feb02-core.c
> index a823c2a673a26..8bee01a823673 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02-core.c
[ ... ]
> @@ -978,8 +773,7 @@ static int mcp47feb02_parse_fw(struct iio_dev *indio_=
dev,
> =20
>  		ret =3D fwnode_property_read_string(child, "label", &data->labels[reg]=
);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "%pfw: invalid label\n",
> -					     fwnode_get_name(child));
> +			dev_dbg(dev, "%s: invalid label\n", fwnode_get_name(child));
> =20
>  		chanspec.address =3D reg;
>  		chanspec.channel =3D reg;

[Severity: Medium]
Will this cause an unintended sysfs output when a channel lacks the label
property?

By continuing the probe without an error, data->labels[reg] remains NULL.
When userspace later reads the label via sysfs, mcp47feb02_read_label()
passes this pointer to sysfs_emit():

mcp47feb02_read_label() {
	...
	return sysfs_emit(label, "%s\n", data->labels[ch->address]);
}

Passing a NULL pointer to sysfs_emit() will print the literal string
"(null)\n" to userspace instead of returning a standard error like -ENOENT.

Would it be better to add a NULL check in mcp47feb02_read_label() before
emitting the string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mcp47feb02=
_refactor-v4-0-beb2aa3bfd09@microchip.com?part=3D7
