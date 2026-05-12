Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B53C0607
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564562; cv=none; b=bs1ngIUwo5nsvuKxJHw2+/LTIURJy4cPgrd4NthoWt0xcBTUPKorVm2apY95Z1N9o1y2PTLL2dkC+mJ4icu+J0132OLXpsB/xqsg6bWk3T38sTmnZzD/9dMKc12ykGVGLBBSQ7hzqzo0wUZrTo7G6vYETarbkzX4VpRO8lBU30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564562; c=relaxed/simple;
	bh=RrG5OEx5xG6Gjk6Y3EzFLD1trNmBIXnw3il9ZlmOSAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gX/4t8iUpJb/ETxFB6QuqWCpdGvuokcGvISGKootunBN7fbb4Cw2uXSsw0A4y/jOjn6g3OoAT3Gs/73PQqJae/jJY+PsotelmXtqj4mIGkviwX/RjuOhmePh3H2EiT+53/vFa5Xiny5g3Vr5M4OtfPB4k6V4kzD9tgMKxOMdHvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqXSzmwu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqXSzmwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432A6C2BCB0;
	Tue, 12 May 2026 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778564560;
	bh=RrG5OEx5xG6Gjk6Y3EzFLD1trNmBIXnw3il9ZlmOSAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YqXSzmwugI4ZCS01Wl8qq94GpJ/KjlN7/vhsYDu3OUq5KScZiHEhp6eVlGTm1yklI
	 ZnHbq364RhfZ2OgCs3o6aeMDSuio1/rf3+yeMn3IM3rPzLis45AK5LBMqK5XZvFuR2
	 K5enlE7FEv50D0NucOsJFlx9Tb70R9m8DIf+BfOI1u5MsZwoF73tigUU25Wl54HUPT
	 1Z0bzdh7+lj15wl2Fb73lyt3+23fWzgArMt5O6rueQ/Zlk/kP+GbRTxaBmfa2qwb0N
	 dDtlLymu+AIVRpgx0pBOzH4rZ5oOtdlP7eOaQ0E0sVZ+YisbjLf6uC8FMZWBRYo5Zu
	 qPQVfDIrd/16w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 13/18] riscv_cbqri: resctrl: Add MB_MIN bandwidth
 allocation via Rbwb
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-13-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-13-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:42:39 +0000
Message-Id: <20260512054240.432A6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Removing a resctrl group leaks the MB_MIN (Rbwb) bandwidth allocat=
ion, permanently preventing future allocations.
- [High] Secondary memory bandwidth controllers in the same NUMA node are s=
ilently ignored, leaving their hardware unconstrained.
- [High] Missing MRBWB capability validation causes integer underflow and a=
ssignment of 0 bandwidth, violating the hardware specification.
- [Low] The code comment incorrectly states that intermediate sums transien=
tly exceed MRBWB during initialization.
--

commit e4a9c24653219ec74efc1b4f91aa0b08b1cfc5ac
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add MB_MIN bandwidth allocation via Rbwb

Add bandwidth allocation through Rbwb (reserved bandwidth blocks)
exposed as the MB_MIN resource. Rbwb's sum constraint does not fit MBA's
percentage cap, so MB_MIN lands as a new RDT_RESOURCE_* rather than
masquerading as MBA.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index d8fd9b06703fa..bcd9367e3555c 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c
> @@ -415,6 +415,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, s=
truct rdt_ctrl_domain *d,
>  	case RDT_RESOURCE_L2:
>  	case RDT_RESOURCE_L3:
>  		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
> +	case RDT_RESOURCE_MB_MIN:
> +		/* sum(Rbwb) <=3D MRBWB validation runs inside cbqri_apply_rbwb(). */
> +		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);

When a resctrl group is removed, does the framework invoke an architecture
hook to reset the hardware control values to a minimum default?

If the CLOSID is freed but the previously configured bandwidth value remains
pinned in the software cache (ctrl->rbwb_cache[closid]), will this abandoned
value falsely inflate the sum during subsequent cbqri_apply_rbwb() calls?

Could this cause new allocation attempts to fail with -EINVAL, effectively
creating a permanent denial of service for bandwidth allocations until the
leaked CLOSID is coincidentally re-allocated?

[ ... ]

> @@ -491,15 +503,42 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resour=
ce *r)
>  		return;
> =20
>  	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> -		for (i =3D 0; i < hw_res->ctrl->rcid_count; i++) {
> -			for (t =3D 0; t < CDP_NUM_TYPES; t++) {
> +		dom =3D container_of(d, struct cbqri_resctrl_dom,
> +				   resctrl_ctrl_dom);
> +
> +		switch (r->rid) {
> +		case RDT_RESOURCE_MB_MIN:
> +			/*
> +			 * CBQRI section 4.5: Rbwb >=3D 1, sum(Rbwb) <=3D MRBWB.
> +			 * Walk N-1..1 first so the final sum lands at
> +			 * MRBWB. Use the unchecked helper since the
> +			 * intermediate sum may exceed MRBWB.
> +			 */

This isn't a bug, but is this comment accurate?

Since the loop strictly reduces the allocations for RCIDs N-1 down to 1
before finally increasing RCID 0 to the remaining budget, doesn't the
running hardware sum strictly decrease until the final step?=20

Does the intermediate sum ever actually transiently exceed MRBWB?

> +			for (i =3D 0; i < hw_res->ctrl->rcid_count; i++) {
> +				u32 rcid =3D (i + 1) % hw_res->ctrl->rcid_count;
> +				u64 rbwb =3D (rcid =3D=3D 0) ?
> +					dom->hw_ctrl->bc.mrbwb - (hw_res->ctrl->rcid_count - 1) : 1;

If the hardware capability reports mrbwb =3D=3D rcid_count - 1, will this
calculation evaluate exactly to 0 for RCID 0?

If so, does cbqri_apply_rbwb() bypass the internal sum validation
(which checks if rbwb > 0) and blindly write 0 to the hardware, violating
the CBQRI section 4.5 requirement that Rbwb >=3D 1?

[ ... ]

> @@ -830,6 +954,37 @@ static int cbqri_attach_cpu_to_cap_ctrl(struct cbqri=
_controller *ctrl,
>  	return 0;
>  }
> =20
> +static int cbqri_attach_cpu_to_one_bw_res(struct cbqri_controller *ctrl,
> +					  enum resctrl_res_level rid,
> +					  unsigned int cpu)
> +{
> +	struct cbqri_resctrl_res *hw_res =3D &cbqri_resctrl_resources[rid];
> +	struct rdt_resource *res =3D &hw_res->resctrl_res;
> +	struct rdt_ctrl_domain *domain;
> +	int dom_id =3D ctrl->mem.prox_dom;
> +
> +	if (!hw_res->ctrl)
> +		return 0;
> +
> +	domain =3D cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> +	if (domain) {

If a system has multiple memory bandwidth controllers within the same NUMA
node, will the second controller match the existing domain via
cbqri_find_ctrl_domain() here?

Since struct cbqri_resctrl_dom only stores a single hw_ctrl pointer,
does this mean the secondary controller is never tracked by the domain and
its hardware limits will be silently ignored during subsequent configuratio=
ns?

> +		cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
> +		return 0;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D13
