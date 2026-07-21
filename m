Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A146D2D2
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661648; cv=none; b=Djfz34JrH6qxgzxR6suJMrEeYaZHoMcTRS2gMxB7Vh2SqRIb9zh2HfZnJXxe+IgNsuoWait/zzgqQJAfyWFVDHzeBFYaXSPthMs3SN2WKOOHGRQir8Zw3c62YnzizeioxDZQh5S/brdgcy82mmKAvqfms3MpC40mWSS72lL+YT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661648; c=relaxed/simple;
	bh=976HmEgEyjvNINI7D9X9m3qAEsYOYC7sCMbY51WSAIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bg/fsoHPvTv3i66ntIE9c1yjAp4DYoXbvhqBiPkgCD0+hSmfQx8Lgzpem1VNU16d/P5sbq11u524fmsTnj9jkrYtO0N85ifqTG+TLqvCuH5TsutQMTVgslo3i5xcwvPqcweCgUkO2Sm6S6h0cXmmQXMBUMJyLgQRM/t1KSmR09s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCFB3pZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCFB3pZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87811F00A3A;
	Tue, 21 Jul 2026 19:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661647;
	bh=6f7xqEhZLjcD/Nwxqz57DzDyLQfpe1yhnbE0IILZcck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCFB3pZtyhBqf1mMzKkasJyvidASs9J6Ujpb/23ygtq8xRHINBbfY7BemIu0tLPwO
	 bh2hDxxKJ7MyVIygbcJUDiVz2FcdkFMXdv1ix2eqcgQ583MetgOcm92I1LyO8ounS5
	 SBwpSZLnJvrRlIHcxfl2bygzflO+SIkojLfJ5dmn+IdHyMll0EgRC8ulBVXV50gg1v
	 tbzCn62Z6K0vKgb/pXNFBHHzsl6AVsZq8hnkik1z0KBv6R6DDeR7wpDb17eMm89O0h
	 Ct8gKuh4tGSMThGY9JZVpNVJ5Nb6F3pJsNcVgUayg6utoRPXTdiKzuoQEUZHdggcfV
	 ZencNnT0d+QPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: dac: mcp47a1: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-mcp47a1-add-support-v1-2-da045a2567e3@gmail.com>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
 <20260721-mcp47a1-add-support-v1-2-da045a2567e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:20:46 +0000
Message-Id: <20260721192046.A87811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver incorrectly allows a maximum raw value of 64 (0x40) to =
be written to a 6-bit DAC register.
- [High] The driver performs an I2C read immediately after enabling the VDD=
 regulator, without waiting for the device's Power-On Reset (POR) to comple=
te.
- [Medium] The driver requests a non-existent 'vref' regulator instead of u=
sing 'vdd' for the reference voltage.
--

--- Patch [2]: [PATCH 2/2] iio: dac: mcp47a1: add support for new device ---
commit 8241b9b8cd61665484502687ea7820769722f397
Author: Joshua Crofts <joshua.crofts1@gmail.com>

iio: dac: mcp47a1: add support for new device

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converted
which communicates via I2C.

> diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> new file mode 100644
> index 0000000000000..251c2281634ff
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47a1.c
> @@ -0,0 +1,193 @@
[ ... ]
> +#define MCP47A1_REG_MAX		0x40
> +#define MCP47A1_CMD_CODE	0x00
> +#define MCP47A1_MAX_STEPS	64
> +
> +struct mcp47a1_data {
> +	struct regmap *regmap;
> +	int vref_mv;
> +};
> +
> +static const int mcp47a1_raw_avail[] =3D { 0, 1, MCP47A1_MAX_STEPS };

[Severity: High]
For a 6-bit DAC, the maximum value is 63 (0x3F). Does defining
MCP47A1_REG_MAX to 0x40 (64) allow 7-bit values to bypass validation in
mcp47a1_write() and be written to the register, potentially causing the
data to wrap around or corrupt configuration bits?

[ ... ]
> +static int mcp47a1_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable regulator\n");
> +
> +	ret =3D devm_regulator_get_enable_read_voltage(dev, "vref");

[Severity: Medium]
Does the MCP47A1 have a dedicated VREF pin? If the hardware derives its
reference voltage from VDD, does requiring a fictitious "vref" regulator
here force device tree authors to mismodel their hardware just to satisfy
the driver?

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read vref\n");
> +
> +	data->vref_mv =3D ret / MILLI;
> +
> +	/*
> +	 * This is a volatile DAC which doesn't have an ID register, instead
> +	 * the value register is set to 0x20 every Power-on-Reset (table 4-1).
> +	 * Any other read value at startup could indicate that the device is
> +	 * damaged etc.
> +	 */
> +	ret =3D regmap_read(data->regmap, MCP47A1_CMD_CODE, &reg_val);

[Severity: High]
Since the VDD regulator is enabled a few lines above, is there a missing
delay to wait for the device's Power-On Reset (POR) to complete? Without
an explicit delay, could this I2C read happen before the internal boot
sequence finishes, potentially resulting in an I2C NACK and probe failure?

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to read register on startup\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-mcp47a1-ad=
d-support-v1-0-da045a2567e3@gmail.com?part=3D2
