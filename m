Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F323438B2
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689609; cv=none; b=B+615YPdHJz1xgOA1zU99g1P4MMuRfYowOJh9LZ/956+UnQeiifNmb/UsVEgp97nfa8GOkxxmR3g0hKODIP9ZUpS1EEZOzsnFv8YRcz3woZpYqN6+eAkIHlvoU2g5eedU/RLFzneOHnTuYx3MWrpWxxiBNYgWBsdFUI9cSC8oP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689609; c=relaxed/simple;
	bh=qsaRYW820GXRareYLbARRrkKxmCPpmUZETPVDz++U0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K58lJhhbVy93DrDEpH45lyW0zfZboLNryIRXO/bl/at61osfS3cauKwAGyah/vjIua3RcS1BTt3kCVum5zX6YggxbxGN26/SLIEGMpOO3Bj743kKNcazoKyByDuYpR4D+Kezbm1W0vBWeQdQU5NDXmxRd2Y/N4Ih/tINnQJfDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmRgJJSx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmRgJJSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9D31F000E9;
	Fri, 14 Aug 2026 06:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786689608;
	bh=e34W4cKVeKB6kw/gZRmGBI57AOw45X0H3YsBxQPlJhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BmRgJJSxc88R5ErCJmj6k6CXod7LmOwGpqEItjuowruX9/8w2Y8qiCYXn+B0HWm5G
	 T4j4hHHh2RbcHSy1oQICqtDRDrWA3SYjTO2Ow6GAPdJwrTVO7UmvOb1E2if/gFHPiY
	 vqCmavvger4QSOkUaPJVZaE/Qbl21g/Gy73M/ug2o3685jm9qA/6rOJhVMGLlrAcKM
	 x7yqT4mK1z6yVIvqWYV0rgKD6lYTChiUjgRCdUwlK0e23RX4RB9V8s0y0iMaDWZKs3
	 sbdcOAfN9D6TVCCikcnNRFvViQDLmCHvfwZISVR2pkpK36I6xR5ZKTnITXvQoTQu4s
	 DkbhlWFNBsfgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] pinctrl: ambarella: add CV75 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814-cv75-v4-b-v4-4-ef2e83ec0eac@ambarella.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-4-ef2e83ec0eac@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 06:40:02 +0000
Message-Id: <20260814064008.0D9D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] PINCTRL_AMB depends on an undefined Kconfig symbol (ARCH_AMBARELLA=
) and lacks HAS_IOMEM dependency.
- [High] Atomic IOMUX commit mechanism is defeated by executing commits per=
-pin, exposing partial hardware states.
- [Medium] Kernel stack information leak via uninitialized stack variables =
in amb_pinconf_dbg_show().
--

--- Patch [4]: [PATCH v4 4/4] pinctrl: ambarella: add CV75 pin controller -=
--
commit 839ad92b1e2074392112c76fcb7c264408262830
Author: Long Zhao <longzhao@ambarella.com>

pinctrl: ambarella: add CV75 pin controller
   =20
Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
tables. GPIO is handled by the PL061 driver.

> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index eda54aa5fde6f..8436815bf816c 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -37,6 +37,19 @@ config DEBUG_PINCTRL
>  	help
>  	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
> =20
> +config PINCTRL_AMB
> +	bool "Ambarella pin controller support"
> +	depends on ARCH_AMBARELLA || COMPILE_TEST

[Severity: High]
Does ARCH_AMBARELLA exist in the Kconfig tree? If not, this driver can only
be enabled when COMPILE_TEST is set, making it inaccessible to production
configurations.

Also, since this driver selects GPIO_PL061 and MFD_SYSCON and uses IOMEM op=
s,
would it cause unmet dependency warnings and build failures on architectures
lacking IOMEM (like UML) under COMPILE_TEST without a HAS_IOMEM dependency?

> +	select GENERIC_PINCONF

[ ... ]

> diff --git a/drivers/pinctrl/pinctrl-ambarella.c b/drivers/pinctrl/pinctr=
l-ambarella.c
> new file mode 100644
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
> +		data |=3D (((altfunc >> i) & 0x1) << offset);
> +		writel_relaxed(data, soc->iomux_base + IOMUX_OFFSET(bank, i));
> +	}
> +
> +	amb_iomux_commit(soc);

[Severity: High]
Does calling amb_iomux_commit() here defeat the hardware's atomic commit
mechanism when configuring a group of pins?

Looking at amb_pinmux_set_mux(), it iteratively configures each pin:

static int amb_pinmux_set_mux(...) {
    ...
    for (i =3D 0; i < grp->num_pins; i++) {
        ...
        amb_pinmux_set_altfunc(soc, bank, offset, alt);
    }
}

Committing after each individual pin exposes intermediate electrical states
for multi-pin interfaces (like Ethernet RGMII), which could cause bus
contention or interface glitching. Would it be safer to commit once after
all pins in the group are configured?

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

[Severity: Medium]
If regmap_read() fails (e.g. due to a syscon read error), won't pull_en
and other variables remain uninitialized?

The uninitialized stack values are then masked and later printed via
seq_printf(), which leaks kernel stack memory to userspace. Should the
return values of these regmap_read() calls be checked before using the
variables?

> +	regmap_read(soc->pull_regmap, soc->data->pull_dir[bank], &pull_dir);
> +	pull_dir =3D (pull_dir >> offset) & 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-cv75-v4-b-=
v4-0-ef2e83ec0eac@ambarella.com?part=3D4
