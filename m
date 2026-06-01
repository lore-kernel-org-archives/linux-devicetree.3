Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4AF3446C7
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347456; cv=none; b=B/q09lXI5UzQx3BxuWGLs2ot3ojFc/UOW1vkjpuHLMDRCdpNi1fBMCivF2wnk2iJCt208KGOUBTqiVMcbq/UnukAqYg7huLDvQ0uAiM42zsLG4eRU/Nz2M8npj5XZPs0U2dy4nSDE3fSjzn15JKQZigboDCDGcZYgV1vcH4a2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347456; c=relaxed/simple;
	bh=YDGQ1cnEeL7m4CxYzmmKj+7V6GIkBChOW9UH2LgxERM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4y+ukafnakwyoFH6znJpNrPdVS5U6j1nj1pgzT+HLImyhOX+KzlX8yIwKFm1h+T5A/E5StSkOJB6MZynxDMJROwXtAy/ZK92Z3xwoZcCRhbbUjqEvdm8+CSpOpit1VY7ylEyVGr2vkONWvhm0C/m/rOtDmw93eJg/IXhJkq1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnvN17V6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnvN17V6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D021F00893;
	Mon,  1 Jun 2026 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347454;
	bh=PItIEssMRJ+JJVA1vQbWkR5M3rzVYY6eW7QpHjAkMho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AnvN17V6P8NIcro+nXbMBOtf/LI4iIS2JJ2olwYGxC6E/YduGlM6Z5c/xgbuKldqr
	 4a08Z6ohsuHijEXfwMbidI+PcicAdOIgD+Yx3QOt0/wiuAlY8h1XGRQW6cXdCc5GDo
	 leeOjSkad6CKHJ4Z0ZXUVMruYBIs7X8H6KBDfCNZN0440i31zLOYl5fqmZ08dk9tJG
	 2VvJFIsVFfKB4oCFkAtIgd4/le2MXCbb3RUKYzMbV3IeZdGDQABCI8H0HeSvkc18RH
	 vgIWXkiG8igMT9a+9G3pImLdNYCnQgOzyEUqcnEuwgCNI03gzDA9Q0u4Cx4UeXXF7u
	 H9yjZDa4uyalA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 14/18] riscv_cbqri: resctrl: Add MB_WGHT
 bandwidth allocation via Mweight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-14-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-14-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:57:34 +0000
Message-Id: <20260601205734.76D021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] AB-BA deadlock between rdtgroup_mutex and cbqri_domain_list_lock i=
nvolving CPU hotplug and resctrl filesystem reads.
- [High] Unprotected list_del() and kfree() causes Use-After-Free on res->c=
trl_domains.
- [High] Staging registers are read and modified before ensuring the hardwa=
re is not busy, leading to data corruption.
--

commit 77c2c065054c1b30b97ae2ddd37b439f110e553b
Author: Drew Fustini <fustini@kernel.org>
riscv_cbqri: resctrl: Add MB_WGHT bandwidth allocation via Mweight

Add bandwidth allocation through Mweight (shared weight for unreserved
bandwidth) exposed as the MB_WGHT resource. Mweight is an integer in
[0, 255]. A value of 0 disables work-conserving sharing for the group,
capping its bandwidth at the MB_MIN reservation.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index 1d312004b07d9..14b955eb79491 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c
[ ... ]
> @@ -426,6 +428,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, =
struct rdt_ctrl_domain *d,
>  			val =3D (u32)rbwb;
>  		break;
>  	}
> +	case RDT_RESOURCE_MB_WGHT: {
> +		u64 mweight;
> +
> +		err =3D cbqri_read_mweight(ctrl, closid, &mweight);

[Severity: High]
This isn't a bug introduced by this patch, but the newly added
cbqri_read_mweight() called here duplicates a pre-existing flaw.

Can this corrupt data by writing to staging registers before ensuring the
hardware is not busy?

In cbqri_read_mweight(), the driver interacts with the hardware by writing =
to a
staging register, writing a control register, and waiting for the BUSY flag=
 to
clear.

If a previous operation times out (such as the 1ms limit in
cbqri_wait_busy_flag()), the driver returns -EIO and releases ctrl->lock, b=
ut
the hardware might still be processing.

The next caller acquires the lock and immediately calls cbqri_set_bc_bw_all=
oc()
to read-modify-write the staging register before cbqri_bc_alloc_op() verifi=
es
the BUSY flag is 0.

Would modifying the staging register of an in-flight hardware operation cau=
se
undefined behavior, misconfiguration, or WPRI field corruption?

> +		if (err =3D=3D 0)
> +			val =3D (u32)mweight;
> +		break;
> +	}
[ ... ]
> @@ -961,10 +1007,46 @@ static int cbqri_attach_cpu_to_one_bw_res(struct c=
bqri_controller *ctrl,
>  	return 0;
>  }
> =20
> +static void cbqri_detach_cpu_from_one_bw_res(struct cbqri_controller *ct=
rl,
> +					     enum resctrl_res_level rid,
> +					     unsigned int cpu)
> +{
> +	struct cbqri_resctrl_res *hw_res =3D &cbqri_resctrl_resources[rid];
> +	struct rdt_resource *res =3D &hw_res->resctrl_res;
> +	struct rdt_ctrl_domain *domain;
> +	int dom_id =3D ctrl->mem.prox_dom;
> +
> +	lockdep_assert_held(&cbqri_domain_list_lock);
> +
> +	if (!hw_res->ctrl)
> +		return;
> +
> +	domain =3D cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> +	if (!domain || !cpumask_test_cpu(cpu, &domain->hdr.cpu_mask))
> +		return;
> +
> +	cpumask_clear_cpu(cpu, &domain->hdr.cpu_mask);
> +	if (cpumask_empty(&domain->hdr.cpu_mask)) {
> +		resctrl_offline_ctrl_domain(res, domain);

[Severity: High]
This isn't a bug introduced by this patch, but the newly added
cbqri_detach_cpu_from_one_bw_res() replicates a broken lock ordering.

Could this lead to an AB-BA deadlock between rdtgroup_mutex and
cbqri_domain_list_lock?

If a user reading a monitor data file triggers rdtgroup_mondata_show(), it
acquires rdtgroup_mutex, then calls mon_event_read() ->
resctrl_arch_rmid_read(), which acquires cbqri_domain_list_lock.

Concurrently, when a CPU is taken offline, cbqri_resctrl_offline_cpu()
acquires cbqri_domain_list_lock, then calls cbqri_detach_cpu_from_all_ctrls=
()
-> cbqri_detach_cpu_from_one_bw_res(). If the domain becomes empty, it calls
resctrl_offline_ctrl_domain(), which attempts to acquire rdtgroup_mutex.

Would these two paths race and cause a permanent AB-BA deadlock?

> +		list_del(&domain->hdr.list);
> +		kfree(container_of(domain, struct cbqri_resctrl_dom,
> +				   resctrl_ctrl_dom));

[Severity: High]
This is a pre-existing issue, but the new cbqri_detach_cpu_from_one_bw_res()
replicates it here.

Can this result in a Use-After-Free on the res->ctrl_domains list?

VFS read paths in fs/resctrl (like rdtgroup_schemata_show()) traverse the
res->ctrl_domains list using list_for_each_entry while holding only
rdtgroup_mutex.

When the CPU mask becomes empty, resctrl_offline_ctrl_domain() is called ab=
ove,
which takes and releases rdtgroup_mutex. After it returns, list_del() and
kfree() are executed without holding rdtgroup_mutex or using RCU primitives.

Could a concurrent list traversal under rdtgroup_mutex dereference the freed
domain pointer and crash?

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D14
