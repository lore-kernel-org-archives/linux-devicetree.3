Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70E3E451B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985039; cv=none; b=rva0+O5x14lr4oAFcZG9GDBz3VgziFC+THWFIX19v6C+R9Eag2pzKEITsIDmn81CsuHVvhIKnnaffUHMF3VR9v/mXYB/EWos64C1nR8ACCrhH7muHdyF4KmVZ54p/0QboDbF6aHGaewkngK7K1qsTUFrVFAy4bgfpTgmytbq4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985039; c=relaxed/simple;
	bh=JFFGMZU2a69jxy1Jmk4EqMHiAA0TpGKX+b+R3gZNpdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YB+aJ7WLFH0DQMjv/9Ct2KjzMZC8zNSQEFJTu2zUPF6zYAA3TTOvxeG1GD/jgnpt1IzOyiFAEYD+xe9vMRtS5CX2AIecMLhRZ8A4dwB5lABsUNsj3RZstqUTcI0R/bQJpcmFD88WNkrEytu/2lgOI9y5xS2wVIZWwnBqOXsfvsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJOkJ/8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJOkJ/8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C941F000FF;
	Mon, 21 Sep 2026 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985037;
	bh=WFYeTECLxec45XeDzuY6/UOvuIEpMtQigp3H1DplaJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJOkJ/8Io0Qj0YA6Oa0PBpXPg1j9rnybC225dmMXX0jhVfrggx6RnBmgCDubcuYKX
	 JVb509pshqmfw7/1Js5irOFCY2MGlngcGTTuigUP3J9VguHnkXWowy2anlF/SakDPP
	 8UpsZZmTmQwJrCTdRXwjRqXEPRdyIYL6gC2Q+dDmL4Ds3mAIWuAPl7UzuZssQ7ll2Q
	 iaMw/SwpsB7xswL5lv2qQmwPy6FFtZd6YqzrsjZDNtVAUJYMoKPesZowGKHoxhplmy
	 wBT8J0on0VRPAX08s/7V3tL/k3Lm8AG6bLHGdYZWFoqb02X0hGr0hPE604Afn2neCn
	 3ld9tHnjSDgJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] regulator: add regulator driver for the Nexperia
 NEX10000UB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-topic-sm8x50-nex10000ub-v2-3-eeeaf9b0c913@linaro.org>
References: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
 <20260921-topic-sm8x50-nex10000ub-v2-3-eeeaf9b0c913@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:03:56 +0000
Message-Id: <20260921100357.34C941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] regulator: nex10000ub: fatal error on missing optional enable-gpio=
s and unsafe flags
- [High] regulator: nex10000ub: bogus regmap enable operations due to missi=
ng descriptor fields
--

commit 0697e8f972779073ad47133056d9851d3d08dfc2
Author: Neil Armstrong <neil.armstrong@linaro.org>

regulator: add regulator driver for the Nexperia NEX10000UB

Add regulator support for the Nexperia NEX10000UB dual output LCD
bias power supply which provides programmable positive and negative
output voltages mainly for display panels applications.

[ ... ]

> --- /dev/null
> +++ b/drivers/regulator/nex10000ub-regulator.c

[ ... ]

> +static int nex10000ub_of_parse_cb(struct device_node *np,
> +				  const struct regulator_desc *desc,
> +				  struct regulator_config *config)
> +{
> +	struct gpio_desc *ena_gpiod;
> +
> +	ena_gpiod =3D fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
> +					   GPIOD_OUT_LOW, desc->name);
> +	if (IS_ERR(ena_gpiod))
> +		return PTR_ERR(ena_gpiod);

[Severity: High]
If the enable-gpios property is omitted in the device tree, does this cause
fwnode_gpiod_get_index() to return -ENOENT and cause DT initialization to f=
ail
entirely?

Also, does requesting the GPIO with GPIOD_OUT_LOW instead of GPIOD_ASIS for=
ce
the output low during boot, potentially disabling the display abruptly?

Finally, if the VPOS and VNEG regulators share the same physical enable pin
(which is common for dual-output PMICs), will omitting
GPIOD_FLAGS_BIT_NONEXCLUSIVE cause a failure with -EBUSY?

> +
> +	config->ena_gpiod =3D ena_gpiod;
> +
> +	return 0;
> +}
> +
> +#define NEX10000UB_REGULATOR_DESC(_id, _name)			\
> +	[NEX10000UB_REGULATOR_ID_##_id] =3D {			\
> +		.name =3D "nex10000ub-"#_name,			\
> +		.supply_name =3D "vin",				\
> +		.id =3D NEX10000UB_REGULATOR_ID_##_id,		\
> +		.of_match =3D of_match_ptr(#_name),		\
> +		.of_parse_cb =3D nex10000ub_of_parse_cb,		\
> +		.ops =3D &nex10000ub_regulator_ops,		\
> +		.n_voltages =3D NEX10000UB_VOUT_N_VOLTAGE,	\
> +		.min_uV =3D NEX10000UB_VOUT_VMIN,			\
> +		.uV_step =3D NEX10000UB_VOUT_STEP,		\
> +		.enable_time =3D 2000,				\
> +		.vsel_mask =3D NEX10000UB_VOUT_MASK,		\
> +		.vsel_reg =3D NEX10000UB_REG_##_id,		\
> +		.type =3D REGULATOR_VOLTAGE,			\
> +		.owner =3D THIS_MODULE,				\
> +	}

[Severity: High]
Since nex10000ub_regulator_ops uses regulator_enable_regmap and
regulator_is_enabled_regmap, will omitting enable_reg and enable_mask here
cause them to default to 0?

If so, won't regulator_is_enabled_regmap() erroneously read the VPOS voltage
setting register (0x00), mask it with 0, and incorrectly return disabled? It
also seems regulator_enable_regmap() would generate useless I2C traffic
to register 0x00.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-topic-sm8x=
50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org?part=3D3
