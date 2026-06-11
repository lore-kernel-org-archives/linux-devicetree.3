Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA56926CE1E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156450; cv=none; b=bqZUvbi2FRiF4V/w/SzrrZ5msD/nM7HrYPwtdgcxafbhkJC/YaRYhVHh+B6sBl5rxxhvkSxN/3tMIGjSyFCsWPScC8jlf/Bnvl25K+Q3P+PBt+DNsDZVWPkUR/oJVUMqkGoPUPobK8DJytEOtcdwShNuN1fKL9B18bUoWCPteM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156450; c=relaxed/simple;
	bh=N/iei3sTp6mfUPiYT0+v0133dG+WSkIRpT6Onh5HO5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DjRu3N5/YEaqfBsrW8jHJF+VtoAXKZrW0Ve0WKJ0QNDzzxQOEG2g9niATCw72s2m0qMJxZ03Nt5e3zVdK/qB/RO7pG1gBkbpQpWCIejsOVvQVckNV7oxLJgIc86HswU6IiulQXK/Gm+tKkpdMKwE46DFgUhOLDD5B7CatoPArD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzcIiAkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzcIiAkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0C71F00893;
	Thu, 11 Jun 2026 05:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781156449;
	bh=1ba6sGH59+yiLoGFczF02ySqyUblepit/Esj3DbPhBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzcIiAkBvvsD5tqXVV/YC4eY07oLl77Q3tVT/w/DpNgAROFTFTo6kCf3RyumRnR82
	 ApGL44SmVDKpgVUq2dJHmJvAMgAzzL0zNu1nfledlARzlmvvNkzUuqSoj/vMyDs+wm
	 PLssNFs9RMDmTd3BgEQFxi04mWY7RERum/ZUoyAOYl/H5DGUU/cEr8hMq/9kj034Y7
	 ltEVufr7qnjBMpyab674OxhB4eFZ2dskXfCKimbZ+T4LcSDdlQvndkQRzXwRAG0YyA
	 xvNjNHhKDBJhP2WEvxHIlCx8pCMJ1czv7dFoKdMiDx7imsix0FvqNckww4D/osdV2F
	 v+oaHR1O1ZGsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-upstream_i2c-v32-2-b66eba921d01@aspeedtech.com>
References: <20260611-upstream_i2c-v32-2-b66eba921d01@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:40:48 +0000
Message-Id: <20260611054049.0D0C71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C adapter is removed after asserting hardware reset, preventing =
I2C transfers during device unbind.
- [High] Zero value in `bus-frequency` DT property leads to a divide-by-zer=
o exception.
--

commit 92481335123f99873954906861adc75752062695
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: aspeed: Read clock-frequency via i2c_parse_fw_timings()

Use i2c_parse_fw_timings() to read the standard "clock-frequency"
property, and fall back to "bus-frequency" only when the standard
property is absent.

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
> +		if (ret < 0) {
> +			dev_err(&pdev->dev,
> +				"Could not read clock-frequency or bus-frequency property\n");
> +			bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +		}
>  	}

[Severity: High]
This is a pre-existing issue, but can this code cause a divide-by-zero
exception if the device tree sets "bus-frequency" to 0?

If the property is present and set to 0, of_property_read_u32() succeeds
and leaves bus->bus_frequency as 0. Later, in aspeed_i2c_init_clk(), it
is used as a divisor:

drivers/i2c/busses/i2c-aspeed.c:aspeed_i2c_init_clk() {
    ...
    divisor =3D DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
    ...
}

Does the driver need to validate that the read frequency is strictly
positive to prevent a kernel panic here?


[Severity: High]
This is a pre-existing issue, but does aspeed_i2c_remove_bus() prevent
I2C transfers during device unbind by asserting hardware reset too early?

In drivers/i2c/busses/i2c-aspeed.c:aspeed_i2c_remove_bus(), the code does:

    /* Disable everything. */
    writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
    writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);

    spin_unlock_irqrestore(&bus->lock, flags);

    reset_control_assert(bus->rst);

    i2c_del_adapter(&bus->adap);

When i2c_del_adapter() unregisters child I2C devices, their remove
callbacks may attempt I2C transfers to cleanly shut down the peripherals.

Because the hardware controller is already disabled and in reset, will these
transfers silently fail, timeout, or cause external aborts when the CPU
tries to access the registers?

Should i2c_del_adapter() be called before disabling the hardware and
asserting reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-upstream_i=
2c-v32-0-b66eba921d01@aspeedtech.com?part=3D2
