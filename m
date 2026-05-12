Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3A2222CC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549196; cv=none; b=SPaCi0oSdSgC1rJSuO+PS3L90uCiYfCu1VI+fX+pn8hldoDuKwYzT72aHuf5ZjleKXzKcjAZl8tEkL7NzY0OKUgv6kKa22z7+X3Kf/Vh40unXhQbvcfV0tFJSjhTEtV01lYxKOpc0zvy8btFl/FXnUitZEsOu4+H7cDNYUPKrII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549196; c=relaxed/simple;
	bh=pKl7pNR2TxbRTocLPdLkG6iHwPnreO73xSXXwLAQtIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+u7Kw0SUci+GWR6fNfd8bltMprfFRpDHgvAVtmYGKS8PAp1NMMjSasNDJ+nuj+iRIKi/L4DCdPHBWAfLXqYhQSxwovVuX7HzXwj8r35HfaxkpxywE9tZjZvTUURZIEMwJzrkYg/7emQhnASMiNE6koYCI0YBo+hpoJ1ZaCT37w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Veph+meK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Veph+meK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FCCC2BCB0;
	Tue, 12 May 2026 01:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549195;
	bh=pKl7pNR2TxbRTocLPdLkG6iHwPnreO73xSXXwLAQtIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Veph+meKXKdXKZPeQ7as40b4b2zUhtOzHR1H+hZbQgYXgpzKsV7fOcgMZsMWpfKoO
	 MjDIGEIK8BvR9npZHYjWL4WSxb9HwlkdotciD30+l/PbhoP/CVzcGJmK2tm6iJuM3u
	 m/Y6o2K63MNqsU54I5AQy3hvk+CPa23kXxaJ/juH/vZ5d5Fk6RBEgeIH2IpYN9/+sD
	 PE1MsfErP9AA6F1LeDpfxhNdSakpSBNi1vZoHvKScIGYAfIInoAo/oepIcXKB6gouB
	 Ri6drfQn0B+ypplDJMqqsxzotMtPD3nicbzdnMw/03IciEJAvTYeMwOcJR8t65vwyQ
	 we110Pg6kV7Hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 07/18] riscv_cbqri: Add capacity controller probe
 and allocation device ops
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-7-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-7-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:26:34 +0000
Message-Id: <20260512012635.84FCCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Resource leak in `cbqri_controller_destroy()` leaves I/O mappings =
and memory regions permanently reserved.
- [High] Stale RCID mask in `cbqri_probe_feature()` causes the AT=3DCODE pr=
obe to execute against an uninitialized, arbitrary RCID.
- [High] Missing pre-clear of `BLOCK_MASK` register allows capturing stale =
MMIO garbage, corrupting controller state upon revert.
- [High] Cache size initialization relies on offline CPUs during early boot=
, permanently disabling occupancy monitoring.
- [Medium] Failure to validate firmware-provided RCID and MCID counts again=
st defined safety caps allows boot-time soft lockups.
--

commit bb6b9ddd95867f863b5b7c53d6d572cc706cebd6
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add capacity controller probe and allocation device ops

Add support for the RISC-V CBQRI capacity controller (CC). The firmware
discovery layer (ACPI or DT) is responsible for passing the
cbqri_controller_info descriptor to riscv_cbqri_register_controller().
The driver resolves the cpumask so callers do not need the cacheinfo
topology.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> new file mode 100644
> index 0000000000000..dc76a146e34df
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_devices.c

[ ... ]

> +int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
> +			     const struct cbqri_cc_config *cfg)
> +{
> +	bool need_at_mirror;
> +	u64 saved_cbm =3D 0;
> +	int err =3D 0;
> +	u64 reg;
> +
> +	mutex_lock(&ctrl->lock);
> +
> +	need_at_mirror =3D ctrl->cc.supports_alloc_at_code && !cfg->cdp_enabled;
> +
> +	/*
> +	 * Capture the cfg->at half CBM before any write so a partial
> +	 * AT-mirror failure can revert and keep the two halves consistent.
> +	 */
> +	if (need_at_mirror) {
> +		err =3D cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,
> +					closid, cfg->at);
> +		if (err < 0)
> +			goto out;
> +		saved_cbm =3D ioread64(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> +	}

To mitigate silent firmware no-ops where the hardware returns success witho=
ut
updating the staging register, cbqri_read_cache_config() pre-clears
the register.

If a silent no-op occurs here during the READ_LIMIT operation, could
saved_cbm capture stale MMIO data? If a revert is later triggered, does
this risk writing garbage data back and corrupting the controller's capacity
allocation state?

[ ... ]

> +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_of=
fset,
> +			       int operation, int *status, bool *access_type_supported)
> +{

[ ... ]

> +	/* Execute the requested operation to find if the register is implement=
ed */
> +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
> +	reg &=3D ~CBQRI_CONTROL_REGISTERS_RCID_MASK;
> +	iowrite64(reg, ctrl->base + reg_offset);

[ ... ]

> +	/* Get the operation status */
> +	*status =3D FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
> +
> +	/*
> +	 * Check for the AT support if the register is implemented
> +	 * (if not, the status value will remain 0)
> +	 */
> +	if (*status !=3D 0) {
> +		/*
> +		 * Re-issue operation with AT=3DCODE so the controller
> +		 * latches AT=3DCODE on supported hardware (or resets it to 0
> +		 * on hardware that doesn't). OP must be a defined CBQRI op
> +		 * here. OP=3D0 is a no-op and would silently disable CDP.
> +		 */
> +		reg =3D saved_reg;
> +		FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
> +		FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_AT_MASK, &reg,
> +			     CBQRI_CONTROL_REGISTERS_AT_CODE);
> +		iowrite64(reg, ctrl->base + reg_offset);

When issuing the second probe to verify AT support, the code restores the r=
aw
boot-time register state via reg =3D saved_reg.

Does this execute the command against whatever uninitialized RCID value the
firmware originally left in the register, since the RCID mask is not cleared
again? If the RCID is out of bounds, could the hardware reject the operatio=
n,
causing the driver to falsely report that supports_alloc_at_code is false?

[ ... ]

> +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> +{

[ ... ]

> +	/*
> +	 * Resolve cache_size via cacheinfo. cpus_read_lock satisfies
> +	 * lockdep_assert_cpus_held() inside get_cpu_cacheinfo_level(). If
> +	 * every cpu_mask member is offline, cache_size stays 0 and the
> +	 * controller cannot back occupancy monitoring.
> +	 */
> +	cpus_read_lock();
> +	if (!ctrl->cache.cache_size) {
> +		int cpu =3D cpumask_first_and(&ctrl->cache.cpu_mask, cpu_online_mask);
> +
> +		if (cpu < nr_cpu_ids) {
> +			struct cacheinfo *ci;
> +
> +			ci =3D get_cpu_cacheinfo_level(cpu, ctrl->cache.cache_level);
> +			if (ci)
> +				ctrl->cache.cache_size =3D ci->size;
> +		}
> +	}
> +	cpus_read_unlock();

A comment in riscv_cbqri_register_controller() states that cache_size is
filled lazily during probe.

Since cbqri_probe_cc() is invoked synchronously during early boot
registration, wouldn't CPUs in other clusters still be offline? Because the=
re
is no lazy re-evaluation mechanism or CPU hotplug hook later on, does this
permanently leave ctrl->cache.cache_size at 0 and break occupancy monitoring
calculations for those controllers?

[ ... ]

> +void cbqri_controller_destroy(struct cbqri_controller *ctrl)
> +{
> +	kfree(ctrl);
> +}

When riscv_cbqri_unregister_last() is used to roll back a successful
registration, it calls this function to free the controller.

Does this leak the I/O mappings and memory regions, since it fails to call
iounmap(ctrl->base) and release_mem_region() for the resources successfully
allocated during cbqri_probe_controller()?

[ ... ]

> +int riscv_cbqri_register_controller(const struct cbqri_controller_info *=
info)
> +{
> +	struct cbqri_controller *ctrl;
> +	int err;
> +
> +	if (!info->addr) {
> +		pr_warn("skipping controller with invalid addr=3D0x0\n");
> +		return -EINVAL;
> +	}
> +
> +	ctrl =3D kzalloc(sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	mutex_init(&ctrl->lock);
> +
> +	ctrl->addr =3D info->addr;
> +	ctrl->size =3D info->size;
> +	ctrl->type =3D info->type;
> +	ctrl->rcid_count =3D info->rcid_count;
> +	ctrl->mcid_count =3D info->mcid_count;

The cbqri header explicitly defines CBQRI_MAX_RCID and CBQRI_MAX_MCID as 10=
24,
alongside documentation warning that a malformed firmware table claiming a
large number of IDs could trip the soft-lockup watchdog during per-id MMIO
init loops.

Is it safe to blindly assign these counts without validating them against t=
he
safety caps? Could a malformed ACPI or DT table bypass this protection and
trigger a soft lockup during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D7
