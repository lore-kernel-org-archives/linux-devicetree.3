Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6090DDA9
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779669021; cv=none; b=ffAqyDo+W+6KpZP7njvOv7dZ1eQ8k84z9TiuLdCqQr1MtwrxGApeSm6ZhhmwyI93ZxUDS/4FTbo0vSv+yBAa6rFZ1xlDHt9/qCinFF0OCtncVZ5barjWjMhIEI9P3SmU/3VYjd99HrEbu2yRei/Q4gFn5pieU99gla9/CeRRJZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779669021; c=relaxed/simple;
	bh=v38zaK051KXoiRKXvKpDLH8cmWECxYCtq8q0wqxT2pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VxrUbDh5ULBSS5ypjSoPNWi2eMGfk1cgZdnvV1U6J0Fv5qVB/NSzSjhoioa9K7hdKqUIFdgcTfDm8ATxF+DAI2xBpFYAqj6Ej9HetJsNDw7TNW+FwCntMbzsfy9KiTZbXyh/TzIXqThJflvW5vfp/I5GEkX1YRuWcV4UES//DXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMhHR+yO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMhHR+yO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5597A1F000E9;
	Mon, 25 May 2026 00:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779669019;
	bh=D3bZaGBztI3WQJhw/jFJkoIprCdeEHrKqgvXvNXSa2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMhHR+yOeTdA+n+HPqUy+fDavuxtpHCYjU6tuc4JgpfGU0AAkNtesCdIQf7RnUfL5
	 OKFXxfhiwhDdaov4JGKmxX9r5sw9oC1t2Zw8J+T52jNo1G5OABTab66ooDDLuIcKmY
	 0l3fXXF8GfiTDDQORCkz3l1uw0Fs+ghKiaPpaJHHpYLZV1GrkBWlSy/1KEbf2XUYR7
	 ZIN3rmHwtBxmVKMvzLZ+dDfRo37AZlc/8VcYCgvIGfUxIz5xkxHp9o0dlPwDPQm/lw
	 JmKsrYwEbejhtJCWKctFmbdJOMEZLffmYjf9pJcwE0qlhso6cFZZ21EI4s9bapCWJI
	 C3iFi3ptY6bWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 07/18] riscv_cbqri: Add capacity controller probe
 and allocation device ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-7-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-7-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:30:07 +0000
Message-Id: <20260525003019.5597A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Build failure due to undefined macro `CBQRI_MON_CTL_EVT_ID_MASK`.
- [High] Generic registration API unconditionally calls ACPI-specific funct=
ions, breaking DT support.
- [High] Synchronous `cache_size` resolution during early boot permanently =
disables occupancy monitoring.
- [High] Bitwise inversion of `GENMASK` 32-bit masks silently zeroes the up=
per 32 bits of 64-bit hardware registers.
- [Medium] Invalid bounds check for `rcid_count` uses a register bitmask in=
stead of a max count, and `mcid_count` is unchecked.
--

commit 13b45d9c450f72077987054f81435f84c681a8fe
Author: Drew Fustini <fustini@kernel.org>
Subject: riscv_cbqri: Add capacity controller probe and allocation device o=
ps

Add support for the RISC-V CBQRI capacity controller (CC). The firmware
discovery layer (ACPI or DT) is responsible for passing the
cbqri_controller_info descriptor to riscv_cbqri_register_controller().

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> new file mode 100644
> index 0000000000000..a97511825eedf
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_devices.c
> @@ -0,0 +1,564 @@

[ ... ]

> +static int cbqri_cc_alloc_op(struct cbqri_controller *ctrl, int operatio=
n,
> +			     int rcid, enum cbqri_at at)
> +{
> +	int reg_offset =3D CBQRI_CC_ALLOC_CTL_OFF;
> +	int status;
> +	u64 reg;
> +
> +	lockdep_assert_held(&ctrl->lock);
> +
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> +		pr_err_ratelimited("BUSY timeout before starting operation\n");
> +		return -EIO;
> +	}
> +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
> +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_RCID_MASK, &reg, rcid);
> +
> +	/*
> +	 * CBQRI Table 1: AT 0=3DData, 1=3DCode. Program AT on controllers
> +	 * that report supports_alloc_at_code. On controllers that don't,
> +	 * AT is reserved-zero and the op acts on both halves.
> +	 */
> +	reg &=3D ~CBQRI_CONTROL_REGISTERS_AT_MASK;

[Severity: High]
On 32-bit architectures, does bitwise inversion of a GENMASK macro (which
evaluates to unsigned long) silently zero the upper 32 bits of the 64-bit
register variable?

If the 32-bit inverted mask is zero-extended to 64 bits, this would truncate
bits 63:32, potentially clearing the STATUS and BUSY fields. Should
GENMASK_ULL be used for these masks instead?

> +	if (ctrl->cc.supports_alloc_at_code)
> +		reg |=3D FIELD_PREP(CBQRI_CONTROL_REGISTERS_AT_MASK, at);

[ ... ]

> +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_of=
fset,
> +			       int operation, int *status, bool *access_type_supported)
> +{
> +	const u64 active_mask =3D CBQRI_CONTROL_REGISTERS_OP_MASK |
> +				CBQRI_CONTROL_REGISTERS_AT_MASK |
> +				CBQRI_CONTROL_REGISTERS_RCID_MASK |
> +				CBQRI_MON_CTL_EVT_ID_MASK;

[Severity: High]
Is CBQRI_MON_CTL_EVT_ID_MASK defined in this patch? It seems to be missing,
which might cause a build failure due to an undeclared identifier.

> +	u64 reg, saved_reg;
> +	int at;

[ ... ]

> +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> +{
> +	int err, status;
> +	u64 reg;

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

[Severity: High]
Is this resolution actually lazy? cbqri_probe_cc() is called immediately
during registration by cbqri_probe_controller(), which happens at
acpi_arch_init time.

Since cacheinfo is unpopulated during early boot, won't
get_cpu_cacheinfo_level() return NULL and leave cache_size as 0 permanently,
disabling occupancy monitoring?

> +		}
> +	}
> +	cpus_read_unlock();

[ ... ]

> +int riscv_cbqri_register_controller(const struct cbqri_controller_info *=
info)
> +{
> +	struct cbqri_controller *ctrl;
> +	int err;

[ ... ]

> +	ctrl->addr =3D info->addr;
> +	ctrl->size =3D info->size;
> +	ctrl->type =3D info->type;
> +	ctrl->rcid_count =3D info->rcid_count;
> +	ctrl->mcid_count =3D info->mcid_count;
> +
> +	/*
> +	 * SRMCFG encodes RCID in 12 bits.  ACPI's acpi_parse_rqsc() already
> +	 * caps info->rcid_count at CBQRI_MAX_RCID (1024) so this is unreachable
> +	 * today, but a future DT discovery path or a malformed firmware table
> +	 * routed through a different validator could bypass that ceiling.
> +	 * Catch the violation here rather than silently truncating in every
> +	 * FIELD_PREP(SRMCFG_RCID_MASK, closid) on the schedule-in fast path.
> +	 */
> +	if (WARN_ON_ONCE(ctrl->rcid_count > SRMCFG_RCID_MASK)) {

[Severity: Medium]
Does this correctly validate the count limit? If SRMCFG_RCID_MASK is a
register bitmask (like 0xFFF), won't a hardware limit of 4096 IDs be
incorrectly rejected because 4096 is greater than 4095?

Also, should there be a similar bounds check for mcid_count?

> +		cbqri_controller_destroy(ctrl);
> +		return -EINVAL;
> +	}
> +
> +	switch (info->type) {
> +	case CBQRI_CONTROLLER_TYPE_CAPACITY: {
> +		int level;
> +
> +		ctrl->cache.cache_id =3D info->cache_id;
> +
> +		level =3D find_acpi_cache_level_from_id(info->cache_id);

[Severity: High]
Does this unconditional call to ACPI-specific functions break Device Tree
support?

If CONFIG_ACPI is disabled, these stubs return -ENOENT. For DT-based
platforms, these functions might fail to resolve DT cache IDs, potentially
causing registration to fail entirely.

> +		if (level < 0) {
> +			pr_warn("Failed to resolve cache level for cache id 0x%x (%d), skippi=
ng\n",
> +				info->cache_id, level);
> +			cbqri_controller_destroy(ctrl);
> +			return level;
> +		}
> +		ctrl->cache.cache_level =3D level;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D7
