Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC37E105
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779669042; cv=none; b=OFz4ppdkSXmVdZ1nNQ2M32lY4g5ghRte0WppIDWUHBq3PdUcGls/7sUE2FAGRCDlrMbPQa7KKiwknY201Kq9T7fMO3SDBW4iFds3MuIPsjzFzNgtaLndtjo4y+RXCsTBeP/ekv7BFmxsE5fplQ9A/8vMbHcyFz4eC2LX7wOzbYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779669042; c=relaxed/simple;
	bh=b5cIXW9LwBG/VhH3g8YBpRK2SZUMRRyLkeAzM9tzxSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y9/GYCj38L9aOb2c44uT6pb467r7PBQd8oojyKcidf3kCpETl3wo1xeakskRPrKpE5Wb+1A0y8yQ0/sZM8iuNn3QmWmzS2TYJV/g9peuJIoHwvHUY6XUmRmL5UVM4WZYiVwaKiEFxOEy5eYCtFKrzg8uWazdM06n3q3Sc7KFwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aikIkwMW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aikIkwMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4E41F000E9;
	Mon, 25 May 2026 00:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779669040;
	bh=WwjLjzaAtpsQztqU8i8/xUEUkb70+JP7WPa9+m29DGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aikIkwMWLoAxVLj2Zv7EBxwWLfrkC+UdwGrvlrVkxDvrIJMfhhEfq6fUo8JSZgLpx
	 XZQUzlJ87frk6qHuyw3DX2PY2JcEM4sHCn9GiSXpArRE2IYuEZrIo+Bj45XwPSBJOx
	 axqWpLfqbzsr+Toh/0k5bGBh5xw6VA9zoEprhZfDlbzdXM9JzT1ZV+G1Plktqt6eg9
	 KEqRpdcIR/1CPq0CefFtiGG8rHJfbKIbMjzUAILsex6FcKtHqaeA4R8OrMDpELbKoA
	 oeO+G4nbOghDwcClCLCaJ3IX2aaB0ab5PyAQq+R9I1l4D9YEFSEnVLSUg0zSLdtIUc
	 hR80r+4PvHHzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 09/18] riscv_cbqri: Add bandwidth controller
 probe and allocation device ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-9-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-9-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:30:40 +0000
Message-Id: <20260525003040.9E4E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The standalone read functions (`cbqri_read_rbwb` and `cbqri_read_m=
weight`) are vulnerable to the silent READ_LIMIT no-op hardware bug describ=
ed in the commit message.
- [High] The bandwidth allocation operation inadvertently preserves the Acc=
ess Type (AT) field left by firmware or prior probe operations, potentially=
 applying limits to the wrong access type.
- [Medium] Modifying the hardware staging register before verifying the con=
troller is ready (BUSY=3D0) can cause silent corruption of the unmodified f=
ield.
--

commit 43b9fe0d5868fdc96ff8dc83b2e5d5819da5ef2e
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add bandwidth controller probe and allocation device ops

This commit adds support for CBQRI bandwidth controller discovery and
allocation control knobs (Rbwb and Mweight). It implements software caches
and pre-write sentinels to prevent stale data leakage caused by a silent
hardware bug during READ_LIMIT operations.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> index 90a95fd111909..2a80197764a9c 100644
> --- a/drivers/resctrl/cbqri_devices.c
> +++ b/drivers/resctrl/cbqri_devices.c

[ ... ]

> @@ -135,6 +193,41 @@ int cbqri_mon_op(struct cbqri_controller *ctrl, int =
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
> +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> +		pr_err_ratelimited("BUSY timeout before starting operation\n");
> +		return -EIO;
> +	}
> +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
> +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_RCID_MASK, &reg, rcid);
> +	iowrite64(reg, ctrl->base + reg_offset);

[Severity: High]
Does this operation inadvertently preserve the Access Type (AT) field left =
over
by firmware or prior probe operations?

Since this reads the control register and modifies only OP and RCID via
FIELD_MODIFY, the AT bits are left untouched. If the field was left set to
a specific type (such as CBQRI_CONTROL_REGISTERS_AT_CODE during probe),
would the limits applied here silently inherit that type, throttling only
Code bandwidth while leaving Data bandwidth unconstrained?

[ ... ]

> @@ -266,6 +359,152 @@ int cbqri_read_cache_config(struct cbqri_controller=
 *ctrl, u32 closid,
>  	return err;
>  }
> =20
> +/*
> + * Apply a per-RCID update to one field (Rbwb or Mweight) of bc_bw_alloc.
> + * bc_bw_alloc packs both fields, so both halves are seeded from the
> + * authoritative software caches before CONFIG_LIMIT. This avoids the
> + * silent READ_LIMIT no-op window where stale data from a prior op's
> + * RCID could leak into the unmodified field. The verify step uses an
> + * inverted-value sentinel to confirm hardware accepted the target field.
> + *
> + * Caller must hold ctrl->lock.
> + */
> +static int cbqri_apply_bc_field(struct cbqri_controller *ctrl, u32 closi=
d,
> +				enum cbqri_bc_field field, u64 val)
> +{
> +	u64 rbwb =3D ctrl->rbwb_cache[closid];
> +	u64 mweight =3D ctrl->mweight_cache[closid];
> +	u64 readback;
> +	int ret;
> +
> +	lockdep_assert_held(&ctrl->lock);
> +
> +	if (field =3D=3D CBQRI_BC_FIELD_RBWB)
> +		rbwb =3D val;
> +	else
> +		mweight =3D val;
> +
> +	cbqri_set_bc_bw_alloc(ctrl, rbwb, mweight);
> +
> +	ret =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_CONFIG_LIMIT, clo=
sid);

[Severity: Medium]
Could modifying the hardware staging register before verifying the controll=
er
is ready cause a silent corruption of the unmodified field?

If a previous operation timed out but is still executing, the BUSY flag wou=
ld
be 1, and the hardware might ignore the cbqri_set_bc_bw_alloc() write.

If that prior operation then completes while cbqri_bc_alloc_op() polls for
BUSY=3D0, the new CONFIG_LIMIT would be issued. Could the hardware then app=
ly
the stale staging register payload?

If the modified field in the stale payload happens to match the target valu=
e,
the post-write sentinel verification would falsely succeed, while the
unmodified field is silently corrupted.

[ ... ]

> +/*
> + * Read the Rbwb (reserved bandwidth blocks) for closid via READ_LIMIT.
> + */
> +int cbqri_read_rbwb(struct cbqri_controller *ctrl, u32 closid, u64 *rbwb=
_out)
> +{
> +	int err;
> +
> +	mutex_lock(&ctrl->lock);
> +	err =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closi=
d);
> +	if (err =3D=3D 0)
> +		*rbwb_out =3D cbqri_get_rbwb(ctrl);
> +	mutex_unlock(&ctrl->lock);
> +	return err;
> +}
> +
> +/*
> + * Read the Mweight (opportunistic weight) for closid via READ_LIMIT.
> + */
> +int cbqri_read_mweight(struct cbqri_controller *ctrl, u32 closid, u64 *m=
weight_out)
> +{
> +	int err;
> +
> +	mutex_lock(&ctrl->lock);
> +	err =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closi=
d);
> +	if (err =3D=3D 0)
> +		*mweight_out =3D cbqri_get_mweight(ctrl);
> +	mutex_unlock(&ctrl->lock);
> +	return err;
> +}

[Severity: High]
Are these standalone read functions vulnerable to the same silent READ_LIMIT
no-op hardware bug described in the commit message?

Since they execute a bare READ_LIMIT without the pre-write sentinel validat=
ion
used in cbqri_apply_bc_field(), could they return stale data from a prior
operation if the hardware bug triggers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D9
