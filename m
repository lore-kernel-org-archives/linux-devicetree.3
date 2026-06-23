Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3807171AF
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782177952; cv=none; b=TnRN0TTzIUN9cgce2FwxXWRp5VL6Ac/uqrtwYhAfesR3/dcz60zKPTrUtC7S/0ACVsxSL+SDgt7DuYSYTaukKYOQabbrQts4OJ+R49HYdJ988fPJGA3GbQKDL3ZL11PSVzUP4ZHvu6Y1zYSbEgcRl6mfHUmagxZgZylVDD39KXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782177952; c=relaxed/simple;
	bh=Avfg61A9u/SrCPiGvOrFX3Faa+2EJtHA1IA+1qfBgVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fWF/Ih7i0l5HWesFnITZa/LrAA+bslimJdT+yJeqF7+rW8Qil2hQBSmxNyfMjT5urxAld7LeHbkhDpLPLTPH6Ymh6hWIDJYvXXKp6JFReq/l+CkDOsQMXdXc3+OSKbpmax0Bn8H6bQiO0Cm0QDVcKgQh2CrIbvLISPGgtlJJwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0SIfHem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0SIfHem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569C1F000E9;
	Tue, 23 Jun 2026 01:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782177951;
	bh=abX/JNffn3KSOVLnNv0Z8zCOyYZuGUcnIYag2cb6q38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0SIfHem/0zHrs6IFqrR16Mwq21LsjNqJT6OZ3/r/ROI5UPCyA20bkRYNHqraF4bK
	 xQH9jRFL2Z+7hW/pfKqNy4pDprqp7p43rCogH5xuyL9WxrOJAtcfPpYKWcrKOn73GX
	 DQSqpZ9/MlzjHXfCq36QOJK5z+Poa8OTxBkEC7bkpuCxr26QyVaQo+IK4gccAa5Yhh
	 321CNlk06FY5Ktr+uy33m6yVFTCoHUctmBNfqwfED6c/iMleFaKleJaMgBYPEGalG8
	 20Wa766AyZhxEb3OVJmz4aaKcBL4G8UPp5hU4fQ/swwbw9Xv0caRhimAocYncD8b8t
	 jUWOIRATYL/2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623-upstream_i2c-v33-2-6d5338fc56ed@aspeedtech.com>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
 <20260623-upstream_i2c-v33-2-6d5338fc56ed@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 01:25:50 +0000
Message-Id: <20260623012551.4569C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing division by zero vulnerability if `bus-frequency` is =
set to 0 in the device tree.
--

commit 5605a3233169152a9f01c947946a36d0f4f9add6
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: aspeed: Read clock-frequency via i2c_parse_fw_timings()

This commit changes the driver to use i2c_parse_fw_timings() to read the
standard "clock-frequency" property. It falls back to "bus-frequency" only
when the standard property is absent.

> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index a26b74c712061..f00bd779146e7 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
[ ... ]
> @@ -1025,12 +1026,18 @@ static int aspeed_i2c_probe_bus(struct platform_d=
evice *pdev)
>  	}
>  	reset_control_deassert(bus->rst);
> =20
> -	ret =3D of_property_read_u32(pdev->dev.of_node,
> -				   "bus-frequency", &bus->bus_frequency);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev,
> -			"Could not read bus-frequency property\n");
> -		bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +	i2c_parse_fw_timings(&pdev->dev, &timings, false);
> +	if (timings.bus_freq_hz) {
> +		bus->bus_frequency =3D timings.bus_freq_hz;
> +	} else {
> +		ret =3D of_property_read_u32(pdev->dev.of_node,
> +					   "bus-frequency",
> +					   &bus->bus_frequency);

[Severity: High]
This is a pre-existing issue, but if "clock-frequency" is absent and
"bus-frequency" is explicitly set to 0 in the device tree,
bus->bus_frequency will be set to 0 here.

This can happen if 0 is used as a placeholder in the device tree for the
bootloader to fill in, but the bootloader fails to do so.

Does this lead to a division by zero panic later during initialization?
Looking at aspeed_i2c_init_clk() in drivers/i2c/busses/i2c-aspeed.c where
bus->bus_frequency is used:

	divisor =3D DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);

Would it make sense to validate that bus->bus_frequency is non-zero after
reading it?

> +		if (ret < 0) {
> +			dev_err(&pdev->dev,
> +				"Could not read clock-frequency or bus-frequency property\n");
> +			bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +		}
>  	}
> =20
>  	match =3D of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-upstream_i=
2c-v33-0-6d5338fc56ed@aspeedtech.com?part=3D2
