Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372431;
	b=c4kJXHLutBipFHDR5rb8tqHVOBwGiW9rwBFWVBq5+iyRyh/YYy3mVUrzcI94FQk6DMi4
	 nM9R+KSw9SXC6tW01GDdzp0rkeczpTaiLWzJaJ1P6D5Pc7RdFi8V+di0gIB4Y59/ORvpS
	 sEC3mgfKMOujogpxdriBrEtNtLMw8oxv0TMhi4yhtg3Atopk1oBaO0EezhoQRX5d+L4QO
	 zxvDr3/lpEVOg6VnG0M20WrnuAEMBqGBoFeftxYpVp64WLM+u20OlZY3vpX2dWyfpL4EQ
	 Ikxy9b+0xy3rbvDuyAfgcHeE65WIf/YztrUQR6wiBYu342Epm1dnBvGD5yaNAKggt1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372431;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RV/AYQf1Cs2Vbeh502DGdK+ET39JZJWniQWrBzm9aD8=;
	b=NvyjbmwoA7H2VpVqk5FrFfAaLPCXhb9xXKPFgfa0rSjGrQqGjQSpXJgwwE+cQAn1lq9i
	 MDAV7cbRvAPCMzpN0S3jqkIbS4PVMPFvi3nFXCCKwg7Qmav01rqYF/DH5KHb/n1DUTWE3
	 anmWke07diSOyqOK1CZqBWcEvraaXu8cTsabZkjk8C4SZy+4nfPtMDswXL+LTa4YkOdlC
	 EdS3xicvsVqJQ9qsoxz/DruxUIN9HLX+Ren3Oe1332lJx7f3Hahm/KcxXBLfRtE/F8RVU
	 UamI0XNgz1nLkJnbBQqPbbhL51Q5lAmlxpN3xmlWyWQjb5t/Qz10Kgal784JwQSVj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsKCe4n9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8D606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsKCe4n9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214081F000C1;
	Fri, 30 Oct 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372430;
	bh=RV/AYQf1Cs2Vbeh502DGdK+ET39JZJWniQWrBzm9aD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IsKCe4n9CKx/Z/ydhAI0cUlfnsLCXI89mKshKy57SzpXMtk90JwG8DkWeBloipD0Z
	 O308SSQqkg4SZpSariKkLp0o7YMnzJO+btlcYalvRtQWgGHcJapGLjl2ESR/HB8tbj
	 7TXFywm8eX6ru09vK6Vd0MiqcHJrFbjIqVfJQWNtGJTIShcpneoCLhAptcAuXD3//n
	 gbjKe+gOIA9B+KOeQaBXxFVS4Y67qy5UCHV/3jrJdzmF5GCdruIzF/yYBVBHmUOzxk
	 FkJGLJqOeGgiYn9kClDJmHgW+PGnfra0bI5jfbYlQjHdR0rPVzwF/Hy65gUO7hueao
	 f5vCNE9Wztpng==
Message-ID: <sashiko-outbox-191137@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] regulator: Add TI LM51772 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-paul-lm51772-v3-3-0de62c22f342@bootlin.com>
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
 <20261030-paul-lm51772-v3-3-0de62c22f342@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 15:00:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] regulator: lm51772: mark LM51772_REG_CLEAR_FAULTS as precious in=
 regmap_config
--

commit e3ae9ce00ffd3d8ace5d736bc8d42d9be1358656
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: Add TI LM51772 support

This commit adds a regulator driver for the TI LM51772 I2C buck-boost
voltage regulator and its auxiliary 5 V LDO output.

> diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/lm=
51772-regulator.c
> new file mode 100644
> index 0000000000000..a78a55c9da262
> --- /dev/null
> +++ b/drivers/regulator/lm51772-regulator.c

[ ... ]

> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid=
, unsigned long *dev_mask)
> +{
> +	struct regmap *regmap =3D rid->data;
> +	unsigned int status, reg, errors;
> +	size_t bit;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &status);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;

[ ... ]

> +static const struct regmap_range lm51772_readable_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS),
> +	regmap_reg_range(LM51772_REG_ILIM_THRESHOLD, LM51772_REG_ILIM_THRESHOLD=
),
> +	regmap_reg_range(LM51772_REG_VOUT_TARGET1_LSB, LM51772_REG_VOUT_TARGET1=
_MSB),
> +	regmap_reg_range(LM51772_REG_USB_PD_STATUS_0, LM51772_REG_USB_PD_STATUS=
_0),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
> +	regmap_reg_range(LM51772_REG_USB_PD_CONTROL_0, LM51772_REG_USB_PD_CONTR=
OL_0),
> +	regmap_reg_range(LM51772_REG_MFR_SPECIFIC_D0, LM51772_REG_IVP_VOLTAGE)
> +};
> +
> +static const struct regmap_access_table lm51772_readable_table =3D {
> +	.yes_ranges =3D lm51772_readable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_readable_ranges)
> +};
> +
> +static const struct regmap_range lm51772_writeable_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
> +	regmap_reg_range(LM51772_REG_ILIM_THRESHOLD, LM51772_REG_ILIM_THRESHOLD=
),
> +	regmap_reg_range(LM51772_REG_VOUT_TARGET1_LSB, LM51772_REG_VOUT_TARGET1=
_MSB),
> +	regmap_reg_range(LM51772_REG_USB_PD_CONTROL_0, LM51772_REG_USB_PD_CONTR=
OL_0),
> +	regmap_reg_range(LM51772_REG_MFR_SPECIFIC_D0, LM51772_REG_IVP_VOLTAGE)
> +};
> +
> +static const struct regmap_access_table lm51772_writeable_table =3D {
> +	.yes_ranges =3D lm51772_writeable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_writeable_ranges)
> +};
> +
> +static const struct regmap_range lm51772_volatile_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_USB_PD_STATUS_0, LM51772_REG_USB_PD_STATUS=
_0),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE),
> +	regmap_reg_range(LM51772_REG_CLEAR_FAULTS, LM51772_REG_CLEAR_FAULTS)
> +};
> +
> +static const struct regmap_access_table lm51772_volatile_table =3D {
> +	.yes_ranges =3D lm51772_volatile_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_volatile_ranges)
> +};
> +
> +static const struct regmap_config lm51772_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.rd_table =3D &lm51772_readable_table,
> +	.wr_table =3D &lm51772_writeable_table,
> +	.volatile_table =3D &lm51772_volatile_table,
> +	.max_register =3D LM51772_REG_IVP_VOLTAGE,
> +	.cache_type =3D REGCACHE_MAPLE
> +};

[Severity: Medium]
Should LM51772_REG_CLEAR_FAULTS be marked as precious in
lm51772_regmap_config?

As shown in lm51772_irq_map_event() and lm51772_irq_renable(), reading
LM51772_REG_CLEAR_FAULTS (0x03) clears latched fault status bits in
LM51772_REG_STATUS_BYTE (0x78) on the device.

Because LM51772_REG_CLEAR_FAULTS is included in lm51772_readable_ranges
without a precious_table or precious_reg in lm51772_regmap_config, reading
the regmap debugfs registers file causes regmap_read_debugfs() to read
LM51772_REG_CLEAR_FAULTS first, clearing active hardware fault flags and
deasserting the fault interrupt before LM51772_REG_STATUS_BYTE is read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-paul-lm517=
72-v3-0-0de62c22f342@bootlin.com?part=3D3
