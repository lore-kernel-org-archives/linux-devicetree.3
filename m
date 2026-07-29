Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8AE48CD61
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332849; cv=none; b=hTgk8fJLJH1uUV/QUG01B9nQKwMKR99S3Rb48EGj+xwVRINAxXVAAe0AQF6r/RYGDhVckWZv7ulhJ2NIN7ukqGldJ9GvA1S5Ls1xr86rnW6SNNyYmshcZEnu7XUIcwYgfT8ogiDZvHDwuHwLDPviPLOnOf2GbmY4qdX2GRK94V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332849; c=relaxed/simple;
	bh=H7J76ETzBaqcts6RQAyXHdYyQ9IBmiLJ+rcQNcCE0CU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=btzw6mhiYgrBUthlajr7bI4+/WzegqWOW5avNVj31/CMtMxsCSPVx6onHgjQq6/a9DxdVVwT2WRWEoLPagp3WrakduF2Ga8dXS/9et3mD8lR5JQu8s+T7sNc60X1lv69Zu06Gto3mG983LrVvYzjnKVMZNZvJXdscF+XwOYYKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa7WdwiT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa7WdwiT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0101F00A3A;
	Wed, 29 Jul 2026 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785332847;
	bh=NQmbohLukp0LrrWgZ1UO3RuJ0KW0XvMECGMChAWYCaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aa7WdwiTyNXyY0kot5Z5A03MjJn0qptxEcqzgnvWX04imNN0yOG+GWkP8wO+Dx+46
	 9QJMLuWiof3QNO/MtXwV6eEEjY/l9SLPPgUsRtS8ypqr5i/EH6nApgxJoUmcj91I0x
	 CA/7NY24hLKUi647ydrFI/BseKPWGpoP4pQLHe2gBFrDrvlR4KRd6OuOr4cx51cUYf
	 Rw+tY9GxPzxzPLcbKRr50qdQtXjnTYFX1siyorB/yQf7qsu4FLecmxwhWQvUP5h5Zl
	 r/YhXDlHEpLAfWi9tI7bG6KDp6YtnfoQVHcvZ9TZiomCYR/2NjDUoUx5xWFIP+kDCF
	 b/7tfA6WhPKkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:47:26 +0000
Message-Id: <20260729134727.5D0101F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Hardware register aliasing in RV1106 Bank 0 due to incorrect pin c=
ount and missing bounds checks.

Pre-existing issues:
- [Critical] State corruption and out-of-bounds access due to static `rockc=
hip_pin_ctrl` mutation on probe deferral.
--

--- Patch [4]: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support=
 ---
commit 5db525b718839289847048c3ede5984a9fb138b8
Author: Simon Glass <sjg@chromium.org>

pinctrl: rockchip: Add RV1106 pinctrl support

Add pinctrl support for the Rockchip RV1106. Each GPIO bank has its own
IO control (IOC) register block, referenced by the rockchip,grf phandle
of the bank node; the register offsets are relative to the bank's own block.

Link: https://github.com/LuckfoxTECH/luckfox-pico

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index 08a46a04a8157..4e5e4434ba4e7 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c

[ ... ]

> @@ -4505,6 +4594,44 @@ static int rockchip_pinctrl_probe(struct platform_=
device *pdev)
>  	/* try to find the optional reference to the ioc1 syscon */
>  	info->regmap_ioc1 =3D syscon_regmap_lookup_by_phandle_optional(np, "roc=
kchip,ioc1");
> =20
> +	/*
> +	 * On SoCs where each GPIO bank has its own IOC block, the bank nodes
> +	 * carry a rockchip,grf phandle pointing at it. The bank number comes
> +	 * from the gpio alias, as used by the gpio driver, falling back to
> +	 * the node position for devicetrees without aliases. The fallback is
> +	 * wrong when an SoC variant omits a bank, so aliases are needed
> +	 * there.
> +	 */
> +	i =3D 0;
> +	for_each_child_of_node_scoped(np, child) {
> +		struct rockchip_pin_bank *bank =3D NULL;
> +		int id, j;

[ ... ]

> +		bank->regmap_ioc =3D syscon_regmap_lookup_by_phandle_optional(
> +							child, "rockchip,grf");
> +		if (IS_ERR(bank->regmap_ioc))
> +			return dev_err_probe(dev, PTR_ERR(bank->regmap_ioc),
> +					     "%pOFn: failed to look up bank ioc\n",
> +					     child);
> +	}

[Severity: Critical]
This is a pre-existing issue, but does this new syscon lookup reliably
trigger state corruption across probe deferrals?

Looking at rockchip_pinctrl_get_soc_data() called earlier in probe, it
mutates the static rockchip_pin_ctrl structure:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_pinctrl_get_soc_data() {
    ...
    bank->pin_base =3D ctrl->nr_pins;
    ctrl->nr_pins +=3D bank->nr_pins;
    ...
}

If syscon_regmap_lookup_by_phandle_optional() returns -EPROBE_DEFER, the
probe fails without resetting this static state. On subsequent probes,
ctrl->nr_pins accumulates, inflating bank->pin_base.

When a pin is later accessed, does this inflated pin_base cause
pin_to_bank() to return the wrong bank, leading to a large negative
integer for the pin?

drivers/pinctrl/pinctrl-rockchip.c:pin_to_bank() {
    ...
    while (pin >=3D (b->pin_base + b->nr_pins))
        b++;
    return b;
}

Would this negative pin value act as a negative array index for
bank->iomux[iomux_num], reading garbage offsets and corrupting arbitrary
registers?

> +
>  	ret =3D rockchip_pinctrl_register(pdev, info);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -4623,6 +4750,69 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl _=
_maybe_unused =3D {
>  	.schmitt_calc_reg	=3D rv1103b_calc_schmitt_reg_and_bit,
>  };
> =20
> +static struct rockchip_pin_bank rv1106_pin_banks[] =3D {
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(0, 32, "gpio0",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,

[Severity: High]
Since only pins 0-6 of GPIO0 have drive-strength registers, does declaring
bank 0 with 32 pins expose hardware register aliasing?

Without bounds checking for higher pins, if pin 16 is accessed, the offset
calculation in rv1106_calc_pull_reg_and_bit() evaluates to 0x40:

drivers/pinctrl/pinctrl-rockchip.c:rv1106_calc_pull_reg_and_bit() {
    ...
    *reg =3D rv1106_pull_offsets[bank->bank_num];
    *reg +=3D ((pin_num / RV1106_PULL_PINS_PER_REG) * 4);
    ...
}

Because rv1106_smt_offsets[0] is also 0x40, wouldn't setting the pull
configuration for pin 16 silently overwrite the schmitt trigger registers
for pins 0-7?

> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0, -1, -1, -1,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729132736.3807=
082-1-sjg@chromium.org?part=3D4
