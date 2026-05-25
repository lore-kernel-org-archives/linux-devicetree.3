Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781A211A14
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779670526; cv=none; b=fXe4P74i6zfnrH6CxZdlgJu1ZVMMLz1s6LmwmZHvWczLeMjJgy1yhFIG1WAYrb8b4wG/bkoot0tzTFpAIVOBuyk7k/lXylGR1FGn3Q+Y86e04D/jl2La23pAMiZV5ReujkYrQGMtr0IjTJ0N0o7zUwUZSo/54tHwYec0OL/ixQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779670526; c=relaxed/simple;
	bh=dBmGxJd7EKUgaJc8NNdN+bZCtPjutvrnWx6z2JjYmMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gsCXs8f6zM8u6bdVi3IyT25FB/Bi5Nfupt2iWlLiGuhBdoqVOaErzidHhrnM3XNhQQYZHb3W6N3q5/VrYMARX664Dx6Pz1al9PXHjfpu/17o2ul6c68OdRsOIyhx7grKeNR2CCApy/LQ7gDR7scahibXmhc6dwdW/JNccBkYaJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDtoWqOO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDtoWqOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D677A1F000E9;
	Mon, 25 May 2026 00:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779670524;
	bh=wcpQIrw2kbTWI7v6byoALZmtAyhaVhlHFSGPjHhyfCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDtoWqOOrzxN6+sN1PaLkefVrUdp/RWsiTSnkAKKjCFj3iAXShx3xzaOq2KSjT3/b
	 J6Ta+BcfEwlqJUkdO8MMG/bNhqhKhYnqxA5/5k5xdKQhtRBU/msjQ76Z8aM7OPCPWA
	 odJJ+tACYYHq2sENzLn4T4Smsp+aFbXHf9JFf4m2f1MXsubhELGkDQ0AtX4ih2+Dq1
	 QZx0p4+Sonp9Q2IsiYrKfr40/bWVEf9wWYxQEgNYfY5d9N2tmezL3FAq8SBGxWKX1k
	 jJI6mJ+sFixcamNo27v6mQ57tPqJBIPX7ujU2NWygYcyWmQzM5AM2qKzEOE1+AJmTT
	 XNJFnyCN9+H1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 13/18] riscv_cbqri: resctrl: Add MB_MIN bandwidth
 allocation via Rbwb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-13-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-13-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:55:23 +0000
Message-Id: <20260525005523.D677A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Deleted resctrl groups leak MB_MIN bandwidth because rmdir does no=
t reset the hardware limit, preventing other groups from using the freed ba=
ndwidth due to the strict sum constraint.
- [High] Using `prox_dom` as `dom_id` for bandwidth controllers aliases mul=
tiple memory controllers within the same NUMA node to a single resctrl doma=
in, leaving some unmanaged.

Pre-existing issues:
- [High] If attaching a CPU to a controller fails inside `cbqri_resctrl_onl=
ine_cpu()`, the loop breaks and returns the error without rolling back prev=
iously successful attachments, leading to a permanent domain state leak.
--

commit c8ab4b9082ddd1241fd1636c42cf108a5428c02c
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add MB_MIN bandwidth allocation via Rbwb

This patch adds bandwidth allocation through reserved bandwidth blocks (Rbw=
b),
exposed as the MB_MIN resource. The CBQRI sum constraint is enforced at
schemata-write time using a software cache. RCID 0 is assigned the remaining
MRBWB budget on reset.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> @@ -411,6 +411,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, s=
truct rdt_ctrl_domain *d,
>  	case RDT_RESOURCE_L2:
>  	case RDT_RESOURCE_L3:
>  		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
> +	case RDT_RESOURCE_MB_MIN:
> +		/* sum(Rbwb) <=3D MRBWB validation runs inside cbqri_apply_rbwb(). */
> +		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);

[Severity: High]
Does this validation approach leak bandwidth when groups are deleted?

When a resctrl group is deleted via rmdir, the CLOSID is returned to the fr=
ee
pool, but standard resctrl flows do not trigger an architecture-specific
callback to reset the resource's value.=20

Because cbqri_apply_rbwb() iterates over all RCIDs (including inactive ones)
to enforce sum(Rbwb) <=3D MRBWB, the bandwidth assigned to deleted groups r=
emains
permanently accounted against the global MRBWB budget.

If a user deletes a group to free up bandwidth and tries to assign it to an
active group, could it be falsely rejected with -EINVAL, effectively leaking
that capacity until the exact CLOSID is randomly reused?

[ ... ]

> @@ -860,6 +991,37 @@ static int cbqri_attach_cpu_to_cap_ctrl(struct cbqri=
_controller *ctrl,
>  	return err;
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
> +		cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
> +		return 0;
> +	}

[Severity: High]
Can this alias multiple memory controllers to a single domain?

A single NUMA node (proximity domain) can contain multiple memory controlle=
rs.
If multiple bandwidth controllers share the same proximity domain, the firs=
t one
processed will create a domain and assign its hw_ctrl pointer to it.

When the second controller is processed, cbqri_find_ctrl_domain() will match
the existing dom_id, and simply add its CPUs to the cpu_mask without saving
the second controller's hw_ctrl pointer.

Will subsequent schemata writes to this domain exclusively program the first
bandwidth controller, leaving the second unmanaged by resctrl?

[ ... ]

> @@ -983,14 +1149,24 @@ static int cbqri_resctrl_online_cpu(unsigned int c=
pu)
>  	mutex_lock(&cbqri_domain_list_lock);
> =20
>  	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> -		if (ctrl->type !=3D CBQRI_CONTROLLER_TYPE_CAPACITY)
> -			continue;
> -		if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> -			continue;
> -		if (!ctrl->alloc_capable)
> +		switch (ctrl->type) {
> +		case CBQRI_CONTROLLER_TYPE_CAPACITY:
> +			if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> +				continue;
> +			if (!ctrl->alloc_capable)
> +				continue;
> +			err =3D cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> +			break;
> +		case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
> +			if (!cpumask_test_cpu(cpu, &ctrl->mem.cpu_mask))
> +				continue;
> +			if (!ctrl->alloc_capable)
> +				continue;
> +			err =3D cbqri_attach_cpu_to_bw_ctrl(ctrl, cpu);
> +			break;
> +		default:
>  			continue;
> -
> -		err =3D cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> +		}
>  		if (err)
>  			break;
>  	}

[Severity: High]
This is a pre-existing issue, but does this leak domain state if an error
occurs here?

If an attachment fails, the loop breaks and returns the error immediately. =
The
CPU hotplug core catches the error and aborts the online state transition.
However, it does not invoke the corresponding offline teardown callback bec=
ause
this state failed during its startup sequence.

Since cbqri_resctrl_online_cpu() fails to manually roll back the domain sta=
te
for the controllers that successfully processed the CPU in earlier iteratio=
ns,
will the CPU remain permanently set in their cpu_mask?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D13
