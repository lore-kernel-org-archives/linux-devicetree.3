Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704A409108
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617062; cv=none; b=g2twpM76l7RvUpCoZ32H5K86xAsfHfDr1WKiO7FyGZDoMRO7Lkl8wtJZrSrmCqGcVxQS7V6iRm+9VYof8aY0uxLGMjGrIErbz+UUBn00veNCd9GeeomwJxPVfWxTeQmtBGq4yzNbVBX43aZi4FDnkBOyZf9Ja1GW2MZCw0lFFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617062; c=relaxed/simple;
	bh=9j7iuWkta+zBlp6bgKuUvRI7Hk6j65B+WFvVlA2G2RI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nJwgsVz6Olm8jUVBWoF4sPgGz/6dfgehuCjA2CjEeknq2jolTHCOfc4C6OhEvagNHK17jSohUlbwqbc8NvoXzGKy57C+nV3CNITXbQ32FhJXfAkIBpZi3MNww6RBuhmMMNKwSeJ3aHOKfGNK9zlV9n6voLuNaGCyGm67fbMxyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS4iDk09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS4iDk09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E7F1F000E9;
	Thu, 13 Aug 2026 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786617061;
	bh=FpdUJvQ8rxhhE36HR0Xdc1VZBE5Qzc1jyqVJ4kp0Tmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OS4iDk09bklf/9c0EJ8T7oHgcyOyXyCJ29s4M+/dbC7qflhLPZjlHqZ8EfXtB4TPu
	 7HpdvQGKeDSTR853w3m8H2nwVWtYGzKAn1YT6xTOL14fXYTm48sNeUBhJqXcXrfz3A
	 olHD+GQkOl4TMHjuZKGHfNU9x8KMpekW8UcmcZfsT9B1jgHoF7sh+wxDRy6t/DB2Gk
	 WMeXXevZdPgKsD0xKS312ACrPFHtELuAUsV385nWt+88CEjbgM+t9pAFYhiKhD9V2L
	 UVGyvBkfgTCgdtb96MPDzHVpjJmTgEdC5fwFDwfVOAKQiYTA5B+fxZXyRldW4Hk14g
	 1Z7rC8RmtNT9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] pinctrl: ambarella: add CV75 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-cv75-v3-b-v3-3-1d82e18da09b@ambarella.com>
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
 <20260813-cv75-v3-b-v3-3-1d82e18da09b@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:31:00 +0000
Message-Id: <20260813103100.C3E7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Signed integer overflow (shift out of bounds) when `offset` is 3=
1.
- [Low] Uninitialized stack variables are consumed if `regmap_read` fails i=
n `amb_pinconf_dbg_show`.
--

--- Patch [3]: [PATCH v3 3/3] pinctrl: ambarella: add CV75 pin controller -=
--
commit 92a200b443add22149b7a8c8a942fb503b5f5a04
Author: Long Zhao <longzhao@ambarella.com>

pinctrl: ambarella: add CV75 pin controller

Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
tables. GPIO is handled by the PL061 driver.

> diff --git a/drivers/pinctrl/pinctrl-ambarella.c b/drivers/pinctrl/pinctr=
l-ambarella.c
> index 0000000000000..fb79a8b02209a
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-ambarella.c

[ ... ]

> +static void amb_pinmux_set_altfunc(struct amb_pinctrl_soc_data *soc,
> +				   u32 bank, u32 offset, u32 altfunc)
> +{
> +	u32 i, data;
> +
> +	if (!amb_iomux_accessible(soc))
> +		return;
> +
> +	for (i =3D 0; i < 3; i++) {
> +		data =3D readl_relaxed(soc->iomux_base + IOMUX_OFFSET(bank, i));
> +		data &=3D (~(0x1 << offset));

[Severity: Medium]
Will this cause a signed integer overflow when offset is 31?

Since PINID_TO_OFFSET() masks with 0x1f, offset can be up to 31.
Using 0x1 (a signed 32-bit integer) and shifting it left by 31 results in
undefined behavior and may trigger a UBSAN shift-out-of-bounds splat.

Could this be changed to use 1U or the BIT() macro to avoid the overflow?

> +		data |=3D (((altfunc >> i) & 0x1) << offset);
> +		writel_relaxed(data, soc->iomux_base + IOMUX_OFFSET(bank, i));
> +	}
> +
> +	amb_iomux_commit(soc);
> +}

[ ... ]

> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static void amb_pinconf_dbg_show(struct pinctrl_dev *pctldev,
> +				 struct seq_file *s, unsigned int pin)
> +{
> +	struct amb_pinctrl_soc_data *soc =3D pinctrl_dev_get_drvdata(pctldev);
> +	u32 pull_en, pull_dir, ds0, ds1, ds2, ds;
> +	u32 bank, offset;
> +	int strength;
> +
> +	bank =3D PINID_TO_BANK(pin);
> +	if (bank >=3D soc->data->nr_banks) {
> +		seq_puts(s, " (no pinconf)");
> +		return;
> +	}
> +
> +	offset =3D PINID_TO_OFFSET(pin);
> +
> +	regmap_read(soc->pull_regmap, soc->data->pull_en[bank], &pull_en);
> +	pull_en =3D (pull_en >> offset) & 1;

[Severity: Low]
Does this code consume an uninitialized stack variable if regmap_read() fai=
ls?

If the register read fails, pull_en remains uninitialized, and its stack
memory will be consumed in the bitwise operation and eventually printed to
userspace via debugfs.

Should the return values of regmap_read() be checked here to prevent leaking
kernel stack data and triggering KMSAN warnings, similar to how they are
checked in amb_pinconf_get()?

> +	regmap_read(soc->pull_regmap, soc->data->pull_dir[bank], &pull_dir);
> +	pull_dir =3D (pull_dir >> offset) & 1;
> +	seq_printf(s, " pull: %s,",
> +		   pull_en ? (pull_dir ? "up" : "down") : "disable");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-b-=
v3-0-1d82e18da09b@ambarella.com?part=3D3
