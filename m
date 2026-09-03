Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499504AD7FE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471681; cv=none; b=o8QtmLfbqtdCNUmKU+1YHtaGp1ZMbd9ayCUhxhKb0CYiTr86A5GIgiK0ypWypAb4p5R4xSxDXgIgHD3W8HQcGdxUAU9I7Uv4IK43KGoP2gtZRYIzV30+gowoApu/r4izhrBDEcQAjTTp0U962EyIEV3x6i4j/Pt6bjWCGnhIrHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471681; c=relaxed/simple;
	bh=A/QAFEAz9uU/xF653FtKqWXKWwlX1ut4lSJXC4g6bHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgvX5s0DdyEDNWr42ofKADzWqaFsq2RcmM+61ez1YJEM3VSNpgGL/w0y+HtcA1JMcPmoasoMWRuLJOkTZ4PHhssqAYWRK7K5QLIzl7llsT3CqKRj89z0pnNmpIfEmZYjdZDfB2vyUOeXtnuhoRCs0fc+L0PCXlnZeR53Fb7IlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asTg1Hnu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asTg1Hnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95C11F00A3E;
	Thu,  3 Sep 2026 21:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471680;
	bh=TVjd0QI8Sw8XxcLKVpwx88Te6iAlDcMOMznn3PZMbTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=asTg1HnuAne8quLouih+JzXSIrAqddNbL3djXKXNF7Nq1ERL895evztie1n5dypct
	 pEJfA677+pI076v4RAsujkROKnwidYZCBItbOLmbM9lCK/9eVGQiywiiWjRn4NQxbU
	 C7YHVk2s/az8jTLnGzgkPU0YucNfKbTNd8w5LSE5WqgoVeuJi/vN0Gv4pf124AY+gF
	 +H5mvofPXx5Brm0/qtbW+IGmyDI7SVPHLJo7B0b5bxLNFUKxm8AWp0ks3T9NEk4njc
	 VgBSC+0Zg/vwvie3rBYZqQsIbxuBO6v1RqEHOtqHJAYHr5u+FH+bY82BAGFZ7mi4Ct
	 mEfwhjiC4KsBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 10/15] dpll: sit9531x: add support to adjust
 output phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902214030.20955-11-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:19 +0000
Message-Id: <20260903214119.E95C11F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Positive phase adjustments bypass modulo folding and fail to fol=
d back into a single output period.
- [Medium] Phase adjust readback returns the cached requested value rather =
than computing the actual hardware register state.
--

commit 5bf72d790f8a4746d1529ab82b4bac47ba928371
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

Shift an output in time against the others driven by the same PLL.  The
device has a coarse delay counted in VCO cycles and a three-bit fine field
in fixed thirty-picosecond steps, so a requested offset is split between
the two and what the core reads back is what the registers hold rather
than what was asked for.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 0f886cfd14013..be033d7cfe7c3 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -1342,6 +1342,149 @@ int sit9531x_output_freq_get(struct sit9531x_dev =
*sitdev, u8 out_idx,
[ ... ]
> +	/*
> +	 * Convert to unsigned absolute delay.  Negative phase (advance)
> +	 * is rendered as T_out - |phase|, modulo the output period.
> +	 */
> +	if (phase_ps =3D=3D 0) {
> +		abs_ps =3D 0;
> +	} else if (phase_ps > 0) {
> +		abs_ps =3D (u64)phase_ps;

[Severity: Medium]
Will this assignment cause positive phase adjustments to bypass modulo fold=
ing
and fail to fold back into a single output period?

The commit message states that "an offset larger than one output period is
folded back into a single period". However, it seems a requested large posi=
tive
phase adjust directly sets abs_ps without applying the modulo by the output
period.

Could this result in asymmetrical and potentially very large hardware delays
(up to 34 bits of VCO cycles, pausing the output), whereas a negative phase
adjust is properly modulo-folded?

> +	} else {
> +		u64 t_out_ps =3D div64_u64(1000000000000ULL, freq);
> +		u64 advance =3D (u64)(-(s64)phase_ps);
[ ... ]
> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 6365a83e4c52b..c07fb22565107 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -736,12 +736,63 @@ sit9531x_dpll_output_pin_state_on_dpll_set(const st=
ruct dpll_pin *pin,
[ ... ]
> +static int
> +sit9531x_dpll_output_pin_phase_adjust_get(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv, s32 *phase_adjust,
> +					  struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +
> +	*phase_adjust =3D dpin->phase_adjust;

[Severity: Medium]
Does this readback intentionally return the cached requested value rather t=
han
computing the actual hardware register state?

The commit message documents that "what the core reads back is what the
registers hold rather than what was asked for." However, userspace reading =
this
will receive exactly what was requested, hiding any quantization errors or
register limits.

> +	return 0;
> +}
> +
> +/*
> + * sit9531x_dpll_output_pin_phase_adjust_set - set output phase adjustme=
nt
[ ... ]
> +static int
> +sit9531x_dpll_output_pin_phase_adjust_set(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv, s32 phase_adjust,
> +					  struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_output_phase_adjust_set(sitdev, dpin->id, phase_adjust);
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	if (rc) {
> +		NL_SET_ERR_MSG(extack, "Phase adjust failed");
> +		return rc;
> +	}
> +
> +	dpin->phase_adjust =3D phase_adjust;

[Severity: Medium]
Should this cache the requested value unconditionally, or should it determi=
ne
and store the actual hardware-configured phase achieved by the math?

This reinforces the issue above where readback returns the requested value
rather than the true quantized phase offset.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D10
