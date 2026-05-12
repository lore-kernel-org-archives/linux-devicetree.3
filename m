Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A92DB7A9
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551483; cv=none; b=ncKRZaMSz8BdOPKGPeEZSm5ikPdA+Ps6Jpd5i75Zcv6e51Uk93Y2j3W6YCyGAY77CcRdwDYLD7b0zkIqGeOkqjhBnE2HbMpo8WIE66+X0grBxjwtCZ8rcd/Rx33tSxwW/+ne10DT4BHb3BPG7lYlA5fz1VIcUroH3h08TBlpmKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551483; c=relaxed/simple;
	bh=ec6VEpSWVsiAY5AoSdfOJH2i9lcV2HM7NpWsGt731Rk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vzz78NxBzzZHL+VdCJ3UzhfEkimHunSvSNBfk7JiZqm0qUhVDcnvCzHhV9+98cqyGRmaoy9tEFwzLZLRdqwANgsHfJPf2zIZcKLAtjYDm4KTmOxbaW9z7gWM+lM3vMjJCiVw3MZcYUeF5Ag/iuOiAGLecUphCWFqyibmJXTR1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXQ10ZE1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXQ10ZE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BA5C2BCB0;
	Tue, 12 May 2026 02:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551483;
	bh=ec6VEpSWVsiAY5AoSdfOJH2i9lcV2HM7NpWsGt731Rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KXQ10ZE1rJkCAAAWEy3FRFnchAfSl4jFatXL6VTIfl0RfQB8fd4WJL5fRBx7SSQaN
	 3cMkmzsC9h0wPCxScAIfpE7twQKei3Lyww7e8+PEhVwCol2GjRQINoYdIxJrpOGSVI
	 BIx4gM2tmiBgjk6en4oBpnPnKqlojrpbbZkmvG1YLq+X0q+Kknte3vEIeZT5szzRDt
	 L+EKBbbuo9GWyrD13lJj7eyvVrBmmKZpJiqLhQNJoUNifCg5Bh+Ho6dRiZamoI/v6X
	 Ypj5g+0hq8hG11zdUT3EPpWR70xJORNhjQqBYpcdsdOivWdbfz9F/kfaKiOjqdPdqh
	 LNbbipcEJiG3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/5] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Reply-To: sashiko@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511101355.122478-3-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:04:42 +0000
Message-Id: <20260512020443.23BA5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Global state mutation of `mt6373_regulators[]` array during probe.
- [High] Missing cancellation of delayed work (`info->oc_work`) on driver r=
emoval.
- [High] Out-of-bounds stack read in `mt6373_buck_unlock` due to incorrect =
`val_count`.
- [High] Typo in register definitions causes `VMCH_EINT` to corrupt `VMC` c=
alibration.
- [High] `VMCH_EINT` bypasses the regulator core and forcibly disables the =
`VMCH` parent regulator.
- [High] Duplicate IRQ mapping and double-free due to unconditionally mappi=
ng `hwirq` 0 and 25.
- [High] Double free of the IRQ mapping in the `devm_add_action_or_reset()`=
 error path.
- [High] NULL pointer dereference when retrieving `fwspec.fwnode`.
- [High] Concurrent mode transitions across different buck regulators inter=
leave and fail.
- [High] State machine logic error in `mt6373_regulator_set_mode()` traps r=
egulators in the wrong state.
- [Medium] Discrepancy between commit message claims and implemented regula=
tors.
--

commit 840d62ea908fb428a74ce6667830cc377258169f
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators

Add a driver for the regulators found on the MediaTek MT6373 PMIC, fully
controlled by SPMI interface.

> Similarly to MT6363, this PMIC regulates voltage with input range
> of 2.6-5.0V, and features 10 buck converters and 25 LDOs.

This isn't a bug, but the commit message states the PMIC features "25 LDOs",
yet the mt6373_regulators array only implements 23 LDOs.

> diff --git a/drivers/regulator/mt6373-regulator.c b/drivers/regulator/mt6=
373-regulator.c
> index 0000000000000..90672ae1eb80c
> --- /dev/null
> +++ b/drivers/regulator/mt6373-regulator.c

[ ... ]

> @@ -215,22 +215,16 @@ static unsigned int mt6373_map_mode(unsigned int mo=
de)
>  	}
>  }
> =20
>  static int mt6373_vmch_eint_disable(struct regulator_dev *rdev)
>  {
>  	const struct regulator_desc *rdesc =3D rdev->desc;
>  	int ret;
> =20
>  	ret =3D regmap_clear_bits(rdev->regmap,
>  				MT6373_PMIC_RG_LDO_VMCH_ADDR,
>  				rdesc->enable_mask);

If another consumer has legitimately enabled VMCH via the regulator core,
does clearing the enable mask of MT6373_PMIC_RG_LDO_VMCH_ADDR forcibly
turn off the underlying hardware and break the regulator framework's refere=
nce
counting?

[ ... ]

> @@ -267,11 +274,8 @@ static int mt6373_buck_unlock(struct regmap *map, bo=
ol unlock)
>  {
>  	u16 buf =3D unlock ? MT6373_BUCK_TOP_UNLOCK_VALUE : 0;
> =20
>  	return regmap_bulk_write(map, MT6373_BUCK_TOP_KEY_PROT_LO, &buf, sizeof=
(buf));
>  }

For a regmap configured with val_bits =3D 16, val_count represents the numb=
er
of 16-bit registers to write. Since sizeof(buf) is 2, does passing 2 instru=
ct
regmap to read 4 bytes starting from &buf, causing an out-of-bounds read of
the kernel stack and writing uninitialized stack data to the PMIC hardware
register?

>  static int mt6373_regulator_set_mode(struct regulator_dev *rdev,
>  				     unsigned int mode)
>  {

[ ... ]

>  	switch (mode) {
>  	case REGULATOR_MODE_FAST:
>  		ret =3D mt6373_buck_unlock(regmap, true);
>  		if (ret)
>  			break;
> =20
>  		ret =3D regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
> =20
>  		mt6373_buck_unlock(regmap, false);
>  		break;

Could concurrent mode transitions across different buck regulators interlea=
ve?

mt6373_buck_unlock writes to MT6373_BUCK_TOP_KEY_PROT_LO, which is a global
PMIC hardware lock. Since this function is only protected by the per-regula=
tor
rdev->mutex, could one thread silently fail to write its mode setting if
another thread locks the hardware prematurely?

>  	case REGULATOR_MODE_NORMAL:
>  		cur_mode =3D mt6373_regulator_get_mode(rdev);
>  		if (cur_mode < 0) {
>  			ret =3D cur_mode;
>  			break;
>  		}
> =20
>  		if (cur_mode =3D=3D REGULATOR_MODE_FAST) {
>  			ret =3D mt6373_buck_unlock(regmap, true);
>  			if (ret)
>  				break;
> =20
>  			ret =3D regmap_clear_bits(regmap, info->modeset_reg, info->modeset_ma=
sk);
> =20
>  			mt6373_buck_unlock(regmap, false);
>  			break;

If LP was previously set when returning from FAST to NORMAL mode, does the
regulator unexpectedly drop into IDLE mode because the LP bit is not cleare=
d?

>  		} else if (cur_mode =3D=3D REGULATOR_MODE_IDLE) {
>  			ret =3D regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_ma=
sk);
>  			if (ret =3D=3D 0)
>  				usleep_range(100, 200);
>  		} else {
>  			ret =3D 0;
>  		}
>  		break;
>  	case REGULATOR_MODE_IDLE:
>  		ret =3D regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
>  		break;

If transitioning to REGULATOR_MODE_IDLE, does the driver leave the FCCM (FA=
ST)
bit set, keeping the hardware stuck in FAST mode?

[ ... ]

> @@ -546,80 +541,75 @@ static int mt6373_regulator_probe(struct platform_d=
evice *pdev)
>  {

[ ... ]

>  	interrupt_parent =3D of_irq_find_parent(dev->of_node);
>  	if (!interrupt_parent)
>  		return -EINVAL;
> =20
>  	domain =3D irq_find_host(interrupt_parent);
>  	of_node_put(interrupt_parent);
>  	fwspec.fwnode =3D domain->fwnode;

If the interrupt controller has not yet probed and irq_find_host returns NU=
LL,
will this unconditionally dereference a NULL pointer for domain->fwnode
instead of gracefully handling the missing dependency with -EPROBE_DEFER?

[ ... ]

>  	for (i =3D 0; i < ARRAY_SIZE(mt6373_regulators); i++) {
>  		info =3D &mt6373_regulators[i];
> =20
>  		/* MT6373CW VBUCK4 constraints are different */
>  		if (info->desc.id =3D=3D MT6373_ID_VBUCK4) {
>  			unsigned int vbuck4_max_uV;
> =20
>  			/* VBUCK4 vreg software control not allowed in hw_ctrl mode */
>  			if (is_vbuck4_hw_ctrl)
>  				continue;
> =20
>  			if (is_cw_variant) {
>  				info->desc.uV_step =3D 6250;
>  				vbuck4_max_uV =3D 1193750;
>  			} else {
>  				info->desc.uV_step =3D 13875;
>  				vbuck4_max_uV =3D 2650125;
>  			}
>  			info->desc.n_voltages =3D vbuck4_max_uV / info->desc.uV_step + 1;
>  		}
> =20
>  		fwspec.param[0] =3D to_spmi_device(dev->parent)->usid;
>  		fwspec.param[1] =3D info->hwirq;
>  		info->virq =3D irq_create_fwspec_mapping(&fwspec);

Does this modify the globally shared mt6373_regulators array directly during
probe?

If multiple MT6373 PMIC instances are present or the driver is unbound and
rebound, would this overwrite shared state, potentially causing workqueue
corruption and devres double-freeing of overwritten IRQ mappings?

Furthermore, since several regulators in mt6373_regulators share the same
hwirq (such as 0 or 25), will irq_create_fwspec_mapping return the same virq
multiple times?

>  		if (!info->virq)
>  			return dev_err_probe(dev, -EINVAL,
>  					     "Failed to map IRQ%d\n", info->hwirq);
> =20
>  		ret =3D devm_add_action_or_reset(dev, mt6373_irq_remove, &info->virq);

Would registering mt6373_irq_remove via devm_add_action_or_reset for each
regulator cause irq_dispose_mapping to be called multiple times on the same
virq during teardown, resulting in a use-after-free of the IRQ descriptor?

>  		if (ret) {
>  			irq_dispose_mapping(info->virq);
>  			return ret;
>  		}

If devm_add_action_or_reset fails, it automatically executes the cleanup
action, which calls irq_dispose_mapping. Does calling irq_dispose_mapping
here result in a direct double-free?

[ ... ]

>  static struct platform_driver mt6373_regulator_driver =3D {
>  	.driver =3D {
>  		.name =3D "mt6373-regulator",
>  		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table =3D mt6373_regulator_match,
>  	},
>  	.probe =3D mt6373_regulator_probe,
>  	.shutdown =3D mt6373_regulator_shutdown
>  };

Is there a mechanism to cancel the info->oc_work delayed work on driver
removal?

If the device is unbound or the module is unloaded while the work is pendin=
g,
would the workqueue attempt to execute mt6373_oc_irq_enable_work after the
module's memory has been freed, causing a use-after-free?

> diff --git a/include/linux/regulator/mt6373-regulator.h b/include/linux/r=
egulator/mt6373-regulator.h
> index 0000000000000..dd791717d2a11
> --- /dev/null
> +++ b/include/linux/regulator/mt6373-regulator.h

[ ... ]

> @@ -118,6 +118,8 @@
>  #define MT6373_PMIC_RG_VCN33_3_VOSEL_ADDR	0x1de9
>  #define MT6373_PMIC_RG_VMCH_VOCAL_ADDR		0x1dec
>  #define MT6373_PMIC_RG_VMCH_VOSEL_ADDR		0x1ded
>  #define MT6373_PMIC_RG_VMCH_EINT_HIGH_VOSEL_ADDR MT6373_PMIC_RG_VMCH_VOS=
EL_ADDR
>  #define MT6373_PMIC_RG_VMCH_EINT_LOW_VOSEL_ADDR	MT6373_PMIC_RG_VMCH_VOSE=
L_ADDR
>  #define MT6373_PMIC_RG_VEFUSE_VOCAL_ADDR	0x1df0
>  #define MT6373_PMIC_RG_VEFUSE_VOSEL_ADDR	0x1df1
>  #define MT6373_PMIC_RG_VMC_VOCAL_ADDR		0x1df4
>  #define MT6373_PMIC_RG_VMCH_EINT_HIGH_VOCAL_ADDR MT6373_PMIC_RG_VMC_VOCA=
L_ADDR
>  #define MT6373_PMIC_RG_VMCH_EINT_LOW_VOCAL_ADDR	MT6373_PMIC_RG_VMC_VOCAL=
_ADDR

Is it intentional that these are defined as MT6373_PMIC_RG_VMC_VOCAL_ADDR
instead of MT6373_PMIC_RG_VMCH_VOCAL_ADDR? When voltage selection is updated
for vmch-eint-high or vmch-eint-low, does it inadvertently overwrite the
voltage calibration register of the entirely separate VMC regulator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511101355.1224=
78-1-angelogioacchino.delregno@collabora.com?part=3D2
