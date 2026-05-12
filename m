Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1807383323
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552980; cv=none; b=rto/6tcuEa2280dIqoTumIHxGPRHYk6GlUAcwKGjlSXCsj1i8Hf46z7ait6C3FL1onhgPSEyOlk5iMnOY+qsa5Nb9vLanYQauCn/sK3O/zLhrSlHqo0EJU/0lKWbTviPyZscOOFPp8nDZL6kWyy67iIekiXd5PZ0rHkTCqErhTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552980; c=relaxed/simple;
	bh=TZ/vRu6DvQKbZqDBKJ9OxPmgAMm+3YKlQ4ghqRuCcy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M8x8ny61YkkLS27YrjHdK4Ml8NG9Qw3oc9MeIdoLJMciovuBlaYLoOoazR6KYsVT8CPJcYVYKY6aQbI6LpfrXr5NcOx8sFddUgA5vvSM5/zIz2NU+HLzQ+7tsThvm0nkI3rEHo15RFmjwYHj2KSBzKQWTqWExIQJOyxExow+o6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcSTSIv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcSTSIv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683A1C2BCB0;
	Tue, 12 May 2026 02:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552979;
	bh=TZ/vRu6DvQKbZqDBKJ9OxPmgAMm+3YKlQ4ghqRuCcy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AcSTSIv93B/XrvooOI6fiqwY31OS0U6CR9jPX8z9bjp0LH5QFAgiJMIE+R7BkV8iI
	 k1Z5oub6Hm4wUw2O6BHEyjCD9JkG3h8BaGtBv1b1mxOnxFJEaci3YnzJQKrb3J3STA
	 u3TVG/BZAAYZyWXjNU/0OzUXwYZvWx92iU2sU5pMkJ1JLdk+7QofRZVn73G4pljEdg
	 Bu5wIJDq8cby2vzwHw8a7f+pbeSr/G2wTYq/zTd5FKo883QqayLRRUwDNyKHNr1dZI
	 S/YZwFHOVCPsXPilrSSpZQvOu3QoofXqNsqy798o9u1JccaeyE3NaBaUBJbqaVwQ4l
	 RJplWIShks6jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 09/18] riscv_cbqri: Add bandwidth controller
 probe and allocation device ops
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-9-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-9-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:29:38 +0000
Message-Id: <20260512022939.683A1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] State divergence on hardware verification failure breaks capacity =
invariants.
- [High] Unprotected initial `READ_LIMIT` is vulnerable to silent hardware =
failure and causes cross-RCID state corruption.
- [High] A single transient hardware timeout permanently disables the contr=
oller due to a latched `faulted` flag.
- [Medium] Feature probing fails to clear `EVT_ID`, risking false-negative =
feature detection.
- [Medium] Missing bounds check on `mweight` causes silent truncation and f=
alse I/O errors.
--

commit 40fea10bc5e942138ec126160ec0621edcc9673f
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add bandwidth controller probe and allocation device ops

Add support for CBQRI bandwidth controller (BC) discovery and the two BC
allocation control knobs. Both fields share the bc_bw_alloc register, so
each write needs READ_LIMIT-modify-CONFIG_LIMIT-verify with a sentinel.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> index e46b02d2c50d7..7e5decd7a6b2e 100644
> --- a/drivers/resctrl/cbqri_devices.c
> +++ b/drivers/resctrl/cbqri_devices.c
> @@ -145,6 +184,44 @@ int cbqri_mon_op(struct cbqri_controller *ctrl, int =
reg_offset,
>  	return 0;
>  }
> =20
> +/*
> + * Perform bandwidth allocation control operation on bandwidth controlle=
r.
> + * Caller must hold ctrl->lock.
> + */
> +static int cbqri_bc_alloc_op(struct cbqri_controller *ctrl, int operatio=
n, int rcid)
> +{
> +	int reg_offset =3D CBQRI_BC_ALLOC_CTL_OFF;
> +	int status;
> +	u64 reg;
> +
> +	lockdep_assert_held(&ctrl->lock);
> +
> +	if (ctrl->faulted)
> +		return -EIO;
> +
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {

If a timeout in cbqri_wait_busy_flag() sets ctrl->faulted =3D true, will
runtime operations like cbqri_bc_alloc_op() ever execute again? Because
it returns early here when ctrl->faulted is true, the polling function
is never called again to clear the flag, which seems to permanently
disable the controller after a single timeout.

[ ... ]

> +static int cbqri_apply_bc_field(struct cbqri_controller *ctrl, u32 closi=
d,
> +				void (*set)(struct cbqri_controller *, u64),
> +				u64 (*get)(struct cbqri_controller *),
> +				u64 val, bool *committed)
> +{
> +	int ret;
> +	u64 reg;
> +
> +	lockdep_assert_held(&ctrl->lock);
> +
> +	/* Load current RCID state so the unmodified field is preserved */
> +	ret =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closi=
d);
> +	if (ret < 0)
> +		return ret;

Does this initial read need the same sentinel protection as the
verification read? If this READ_LIMIT silently fails, the staging
register might retain data from a previous operation (like a different
RCID). Since set() only modifies the target field, CONFIG_LIMIT could
commit the stale data in the unmodified field, causing cross-RCID state
corruption.

> +
> +	set(ctrl, val);
> +
> +	ret =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_CONFIG_LIMIT, clo=
sid);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * CONFIG_LIMIT committed. The per-CLOSID software cache must
> +	 * track hardware regardless of whether the verify below passes.
> +	 */
> +	if (committed)
> +		*committed =3D true;

[ ... ]

> +	reg =3D get(ctrl);
> +	if (reg !=3D val) {
> +		pr_err_ratelimited("BC field verify mismatch (reg=3D0x%llx !=3D val=3D=
%llu)\n",
> +				   reg, val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

If the verification fails here and returns -EIO, *committed remains
true. When called from cbqri_apply_rbwb(), this causes the rejected
value to be cached in ctrl->rbwb_cache[closid]. If the requested value
was smaller than the previous one, could this cause the software cache
to underestimate the reserved capacity and allow future allocations to
exceed the MRBWB hardware limit?

[ ... ]

> +int cbqri_apply_mweight_config(struct cbqri_controller *ctrl, u32 closid,
> +			       u64 mweight)
> +{
> +	int ret;
> +
> +	mutex_lock(&ctrl->lock);
> +	ret =3D cbqri_apply_bc_field(ctrl, closid,
> +				   cbqri_set_mweight, cbqri_get_mweight,
> +				   mweight, NULL);
> +	mutex_unlock(&ctrl->lock);
> +	return ret;
> +}

What happens if an arbitrarily large mweight is passed in? FIELD_MODIFY
silently truncates values larger than the 8-bit MWEIGHT_MASK. The
verification step in cbqri_apply_bc_field() will then compare the
truncated hardware value against the original untruncated val and
always fail, returning -EIO and logging a hardware failure instead of
returning -EINVAL. Should this have bounds checking similar to
cbqri_apply_rbwb()?

[ ... ]

> @@ -437,6 +664,83 @@ static int cbqri_probe_cc(struct cbqri_controller *c=
trl)
>  	return 0;
>  }
> =20
> +static int cbqri_probe_bc(struct cbqri_controller *ctrl)
> +{
> +	bool has_mon_at_code =3D false;
> +	int err, status;
> +	u64 reg;

[ ... ]

> +	/* Probe monitoring features */
> +	err =3D cbqri_probe_feature(ctrl, CBQRI_BC_MON_CTL_OFF,
> +				  CBQRI_BC_MON_CTL_OP_READ_COUNTER, &status,
> +				  &has_mon_at_code);

When probing features, cbqri_probe_feature() modifies the OP mask and
clears RCID_MASK, but it doesn't appear to clear EVT_ID_MASK:

drivers/resctrl/cbqri_devices.c:cbqri_probe_feature() {
    ...
    FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
    reg &=3D ~CBQRI_CONTROL_REGISTERS_RCID_MASK;
    iowrite64(reg, ctrl->base + reg_offset);
    ...
}

If the hardware or firmware left an unsupported Event ID in those bits,
could the hardware reject the READ_COUNTER operation, causing the probe
to see STATUS !=3D SUCCESS and incorrectly assume monitoring is not
supported?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D9
