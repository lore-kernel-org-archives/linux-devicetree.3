Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AF138229A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621214; cv=none; b=mpFD2gQrKseVoGp0FBNttEhSoa3TdDelXcj8whYlS3OYp5qRPyIh8ZyorOeOAaJz4Mq+QZjBQneOZGURGd5pvgpGCoJNyMQFGvUL05IKQSxKbFdiGQvKS/NaoHF/F5+Xjf6yvI0psz0gA5Nn/3AwUXJHbmNEFQMqpLOCT7CrUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621214; c=relaxed/simple;
	bh=QfKx3dF9qemdTzXPcPkqswvh4N/LwXmmsn+SxitVgJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dFJnfBH9I1RNKq6Qa92QM3QTfR+Vw3xHd5gZ3zvHWeDh46VYa8DmRqKfcl/2fBavJ3PsfIqGTJaJz6gVAd5Y90FE5AbS4+DsThdgvdMbkFl4W84peIkF+CD5YMb5BhREeznA2VHi5pOW7Dh/4RwQOAo8sMyeB66pvPt+dMwZLGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AH8VV/8d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AH8VV/8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5715C2BCB8;
	Tue, 12 May 2026 21:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778621214;
	bh=QfKx3dF9qemdTzXPcPkqswvh4N/LwXmmsn+SxitVgJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AH8VV/8dcSg/XoJrxmXWof0P0FtDwfdNgRJPgM+p6lgUXDTX6VfKHA/KTEIJAskoF
	 gbd9lhZbjlR03DVA4+BtoPEsJY3rN4tKw9+IeQFnivpKF8O1F5e2ydpJSAy05hfxk2
	 lp8xvXzNXEWNAFcrBRU5Xf6XHCjc72ihC5FD1Q0a82O44IQ0/b0JeXFxoQU/BNP4KU
	 2q1KcP6TwBwCY3qKJLTmV4PWm/MdNOEuKSxSRbAJBzkIS21bByvXHKres/hs8RATuU
	 V8rxHCZnT+CITNOQWvAY9nZJ8GTj910Wm1Lp/hQTnvMek5WckEogkbtVeUs3W8xpvI
	 njmITMIimqNtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 15/18] riscv_cbqri: resctrl: Add mbm_total_bytes
 bandwidth monitoring
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-15-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-15-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 21:26:53 +0000
Message-Id: <20260512212653.B5715C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free / NULL pointer dereference due to premature domain =
exposure and TOCTOU race
- [High] List traversal race leading to Use-After-Free during CPU hotplug
- [Medium] Bandwidth monitoring is silently disabled if the L3 capacity con=
troller lacks occupancy monitoring
- [Medium] Severe bandwidth overcounting on platforms with multiple L3 doma=
ins due to lack of topology matching
--

commit 2e7334d7e901ad4eb3efafaf7a1b871bac0c83fe
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add mbm_total_bytes bandwidth monitoring

Expose CBQRI bandwidth controller's combined read+write counter as
the L3 mbm_total_bytes event. A software accumulator keeps the
64-bit byte total monotonic across the 62-bit hardware counter wrap.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index 71ee8e6107571..ccd48cac7ccde 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> @@ -308,6 +348,76 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, s=
truct rdt_domain_hdr *hdr,
>  		mutex_unlock(&ctrl->lock);
>  		return err;
> =20
> +	case QOS_L3_MBM_TOTAL_EVENT_ID: {
> +		struct cbqri_controller *bc;
> +
> +		/*
> +		 * The L3 monitoring domain's id is the L3 cache id. The
> +		 * matching ctrl domain's hw_dom->paired_bc was cached at
> +		 * add time to avoid walking cbqri_controllers on every read.
> +		 */
> +		d =3D cbqri_find_ctrl_domain(&r->ctrl_domains, hdr->id);

Is there a list traversal race here that could happen during CPU hotplug?

When offlining a CPU, the domain removal process uses list_del_rcu() and fr=
ees=20
domains after calling synchronize_rcu(). However, cbqri_find_ctrl_domain()=
=20
traverses the ctrl_domains list without holding an rcu_read_lock().=20

If synchronize_rcu() does not wait for this reader, could this lead to a=20
use-after-free when the freed domain struct is accessed?

[ ... ]

> @@ -730,6 +840,16 @@ static int cbqri_resctrl_control_init(struct cbqri_r=
esctrl_res *cbqri_res)
>  			res->mon.num_rmid =3D ctrl->mcid_count;
>  			resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
>  						 false, 0, NULL);
> +
> +			/*
> +			 * Expose BC bandwidth monitoring as the L3's
> +			 * mbm_total_bytes when a BC shares topology with this
> +			 * L3 (MPAM "MB on L3" mapping).
> +			 */
> +			if (cbqri_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID])
> +				resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID,
> +							 false, 0, NULL);
> +
>  			res->mon_capable =3D true;
>  		}
>  		break;

Is bandwidth monitoring inadvertently disabled if the L3 capacity controlle=
r=20
lacks occupancy monitoring?=20

Because this block is inside an if condition checking ctrl->mon_capable whe=
re=20
ctrl is the L3 capacity controller, it appears the bandwidth monitoring won=
't=20
be exposed even if a valid and monitoring-capable bandwidth controller is=20
present on the system.

[ ... ]

> @@ -949,6 +1072,29 @@ static int cbqri_attach_cpu_to_l3_mon(struct cbqri_=
controller *ctrl,
>  	if (err)
>  		goto err_offline;
> =20
> +	/*
> +	 * Pair this L3 domain with the system's mon-capable BC. The
> +	 * cached pointer is consulted by every rmid_read / reset_rmid.
> +	 * BC mon init is system-wide. Failure here means mbm_total_bytes
> +	 * is unusable for any domain, so fail the attach.
> +	 */
> +	{
> +		struct cbqri_resctrl_dom *hw_dom =3D container_of(ctrl_dom,
> +								struct cbqri_resctrl_dom,
> +								resctrl_ctrl_dom);
> +
> +		hw_dom->paired_bc =3D cbqri_find_only_mon_bc();
> +		if (hw_dom->paired_bc) {
> +			err =3D cbqri_init_bc_mon_counters(hw_dom->paired_bc);

Could this sequence result in a use-after-free or a null pointer dereferenc=
e?

By the time this block runs, resctrl_online_mon_domain() has already been=20
called earlier in the function, exposing the monitoring domain to user spac=
e.=20
If a concurrent sysfs read triggers resctrl_arch_rmid_read() at this moment=
,=20
it could pass the lockless check for bc->mbm_total_states and block waiting=
=20
for the hardware lock.

If cbqri_init_bc_mon_counters() fails, it drops the lock, frees=20
bc->mbm_total_states, and sets it to null.=20

When the sysfs read unblocks, will it dereference the freed pointer? Might =
it=20
be safer to defer domain onlining until after the hardware state is fully=20
initialized?

Furthermore, does this unconditional assignment of cbqri_find_only_mon_bc()=
=20
cause bandwidth overcounting on platforms with multiple L3 domains?

If the single system-wide bandwidth controller is paired with every L3=20
domain, standard user-space tools that calculate group bandwidth by summing=
=20
values across all L3 domains might overcount the true system bandwidth by=20
a factor equal to the number of active L3 domains.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D15
