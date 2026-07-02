Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE16B37A84D
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013789; cv=none; b=Rux35wR48EEkx3NWpUGyN8YSNEr1XsziOp4E5mOPa19+UeJvK7pI1mkHd+GLFRFdX2iaWC1Md4/f3b4ZrUVXYzknxdJZ/eiPZ2eFMr3WLzkquUcafVGgGv9YiWuT81yTkisOeMxCnfGdNdFAIxVdoi4uXQMmgK8ybRM3XbMOOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013789; c=relaxed/simple;
	bh=DzsJDXTEbIZ86VKBJ/JdH9Gsh2BjnVLf9Lc7y+Tk6ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rxdcuKAQ1oUaGdq8Ycdsj5pSFIJvLIB5zV6dHbBWKuE+olHxq6aava5cx+8dvQBK4FBqwfJaNZM8mc6cZRTUa5yrOOBJCKqkC54hhLVZzhJgZZs+39WaIjbkSkRzTST9Z9ACLE8uFtdUq4upK+Dwdc+PlZeN8uFQkfacmpecJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7x46v7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7x46v7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B611F000E9;
	Thu,  2 Jul 2026 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783013787;
	bh=AwMMsz/yDH0Itd5k8eeU3efLUdwfmXkR8FJkPrJC2I0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7x46v7i038e6PTSUIUbGj1bs04fJvjcGEG0lnxDA69PpipKxg5Ux3vPWLaWf66JO
	 LVRNiYlEH0mbWXVi8zzi5MzpkWIi4DtxxmKFj9iWB1dUckydT6eDGxB/Tnrwj8nIRz
	 1kWm4gtXYMxHzCLN9OtsQxTWB5ftHbVI8wiOZFWS0yDVsAm1s5tpbVyGaFydW8GC4/
	 GHZlkbTqf/4aYtnKq56s5RCXclnbRwHFYsCwpWmKSpApAmHcCWQy/R+vbWzKvJdzFk
	 ZmI8zu/quEwas0J/VHupOEGoSDDLk/EI2Ew0Zn5ESAhTxmdz8fCA8PI1K/OfJxOMTo
	 cN/UVVCYshENA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:36:27 +0000
Message-Id: <20260702173627.91B611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Calculation of `time_unit` can result in 0 due to integer truncati=
on, leading to a division-by-zero kernel panic on sysfs writes.
- [High] The `sp->domains` array containing `struct device` objects is free=
d prematurely when the SYS domain is unregistered, leading to a Use-After-F=
ree.
- [High] Double free of the `sp->domains` array occurs in the `spel_probe` =
error path.
- [Medium] Large user inputs for power limits or time windows can silently =
overflow during translation, bypassing bounds checks.
- [Low] The driver unconditionally exposes non-functional `POWER_LIMIT1` sy=
sfs attributes for domains that lack hardware constraints.
- [Low] Missing `mutex_destroy()` on initialized domain locks during the ea=
rly error path in `spel_probe()`.
--

commit a896bac2c899d892a5883e225ce50e98f4608e61
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

powercap: qcom: Add SPEL powercap driver
   =20
The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems.

> diff --git a/drivers/powercap/qcom_spel.c b/drivers/powercap/qcom_spel.c
> new file mode 100644
> index 0000000000000..e4ddf73903915
> --- /dev/null
> +++ b/drivers/powercap/qcom_spel.c

[ ... ]

> +static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
> +			   u64 value, int to_raw)
> +{
> +	struct spel_system *sp =3D sd->sp;
> +	u64 units, scale;
> +
> +	switch (type) {
> +	case POWER_UNIT:
> +		units =3D sp->power_unit;
> +		scale =3D 1;
> +		break;
> +	case ENERGY_UNIT:
> +		units =3D sp->energy_unit;
> +		scale =3D ENERGY_UNIT_SCALE;
> +		break;
> +	case TIME_UNIT:
> +		units =3D sp->time_unit;
> +		scale =3D 1;
> +		break;
> +	default:
> +		return value;
> +	}
> +
> +	if (to_raw)
> +		return DIV_ROUND_CLOSEST_ULL(value * scale, units);

[Severity: High]
Can the time_unit calculation result in 0?

If the hardware register provides a shift >=3D 10, the time_unit calculatio=
n in
spel_update_unit() evaluates to 0 due to integer truncation:

	sp->time_unit =3D 1000 / (1 << shift);

If units is 0, the DIV_ROUND_CLOSEST_ULL() macro here will perform a divisi=
on
by zero, triggering a kernel panic.

[ ... ]

> +static int spel_write_pl_data(struct spel_domain *sd, int pl,
> +			      enum pl_ops_type pl_op, unsigned long long value)
> +{
> +	struct spel_system *sp =3D sd->sp;
> +	void __iomem *reg_addr;
> +	u64 reg_val, new_val;
> +	int offset;
> +
> +	if (!is_pl_valid(sd, pl))
> +		return -EINVAL;
> +
> +	offset =3D get_pl_ops_offset(sd, pl, pl_op);
> +	if (offset < 0)
> +		return offset;
> +
> +	guard(mutex)(&sd->lock);
> +
> +	reg_addr =3D sp->constraint_base + offset;
> +	reg_val =3D readl(reg_addr);
> +
> +	switch (pl_op) {
> +	case PL_LIMIT:
> +		new_val =3D spel_unit_xlate(sd, POWER_UNIT, value, 1);
> +		if (new_val > FIELD_MAX(POWER_LIMIT_MASK))

[Severity: Medium]
Could large user inputs silently overflow during translation?

The user-provided 64-bit value via sysfs is passed to spel_unit_xlate(), wh=
ich
uses the DIV_ROUND_CLOSEST_ULL() macro. If the user provides a very large
value, the internal addition of units / 2 within the macro could overflow t=
he
64-bit unsigned integer, wrapping around to a small number.

This wrapped value would then pass the FIELD_MAX(POWER_LIMIT_MASK) check,
converting an intended boundary violation into a near-zero limit that could
aggressively throttle the hardware domain.

> +			return -EINVAL;

[ ... ]

> +static int spel_release_zone(struct powercap_zone *power_zone)
> +{
> +	struct spel_domain *sd =3D power_zone_to_spel_domain(power_zone);
> +
> +	/*
> +	 * Free the domains array when the last zone (SYS domain) is released.
> +	 * This ensures proper cleanup even if sysfs files are held open during=
 unbind.
> +	 */
> +	if (sd->id =3D=3D SPEL_DOMAIN_SYS) {
> +		struct spel_domain *domains =3D sd;
> +
> +		/* Destroy all mutexes before freeing the domains array */
> +		for (int i =3D 0; i < ARRAY_SIZE(spel_domain_names); i++)
> +			mutex_destroy(&domains[i].lock);
> +
> +		kfree(domains);

[Severity: High]
Does this prematurely free the sp->domains array?

The driver allocates all domain device objects in a single contiguous array=
 and
frees the entire array when the SYS domain's release callback fires. Howeve=
r,
during driver unbind in spel_remove(), unregistering a child domain calls
device_unregister(), which synchronously drops the child's reference to its
parent.

This could allow the SYS domain to reach a refcount of 0 and be released,
freeing the domains array while a child domain's device is still in use
(e.g., if a user is holding open a sysfs file). When the user later closes =
the
file, the core would dereference the freed memory.

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static void spel_init_domains(struct spel_system *sp)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(spel_domain_names); i++) {
> +		struct spel_domain *sd =3D &sp->domains[i];
> +
> +		sd->sp =3D sp;
> +		snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
> +			 spel_domain_names[i]);
> +		sd->id =3D i;
> +		sd->status_reg =3D sp->node_base + glymur_domain_offsets[i];
> +
> +		/* PL1 is always supported (required for powercap registration) */
> +		sp->limits[i] =3D BIT(POWER_LIMIT1);

[Severity: Low]
Does this unconditionally expose non-functional POWER_LIMIT1 sysfs attribut=
es
for domains that lack hardware constraints?

For domains like IGPU that have no constraint register offsets defined in t=
he
constraints array, reading or writing the exposed PL1 sysfs files will fall
through to get_pl_ops_offset() which returns -EOPNOTSUPP.

> +	}
> +}

[ ... ]

> +static int spel_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D spel_register_powercap(sp);
> +	if (ret) {
> +		dev_err(dev, "Failed to register powercap zones\n");
> +		/*
> +		 * If SYS zone was registered, err_cleanup inside spel_register_powerc=
ap
> +		 * already unregistered all zones and spel_release_zone freed sp->doma=
ins.
> +		 * If SYS was never registered (sp->power_zone =3D=3D NULL), free manu=
ally.
> +		 */
> +		if (!sp->power_zone)
> +			kfree(sp->domains);

[Severity: High]
Can this result in a double free of the domains array?

If powercap_register_zone() for the SYS domain fails deep within its execut=
ion
(such as during device_add()), it internally cleans up, triggering the
spel_release_zone() callback which executes kfree(domains).

The registration function would return an error and sp->power_zone remains =
NULL.
The error handler here checks if (!sp->power_zone) and calls kfree(sp->doma=
ins)
again, mistakenly double-freeing the array because it assumes NULL means the
release callback was never invoked.

[Severity: Low]
If we free sp->domains here before the devices are registered, do we leak
the debugging state of the mutexes?

spel_init_system() initializes a mutex for each of the 16 domains. If zone
registration fails early and we directly free the array, mutex_destroy() is
never called.

> +		kfree(sp);
> +		powercap_unregister_control_type(ct);
> +		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-qcom_spel_=
driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com?part=3D3
