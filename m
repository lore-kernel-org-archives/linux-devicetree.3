Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA25437EF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953455; cv=none; b=UVC3G5ugB7iQdRXYNDlUxAOsYskpANRq29UlbNQtWX5a77QjhW3Ock22G1owNipMRdFQiC5lwCLX6GLx1M4msXHg8lD7tRL7GYeUZInlTCIBUe3c7LRMXKS5Pk3/P7PpZ61KxE4fFD5f0zKPLk04+s20cxDdrRQHDLcCW+Mt1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953455; c=relaxed/simple;
	bh=DqLIQUWOHZrnI9JkTUTmwR3qMXdKyhTi5t9pnztXXU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUrvDE5NCYKy+jfE0p/1sT9od9JQBzFVYUeyrZKrNWBXg3d3of8i7fwEUava0QfhaSUA+iyIzJ4UUmzlUNpDX2GzqXMjKkQ05kdHABuD5TBNsgxte0yEkmMwHwgLAW65fdbasoJyUz2pEhNowSh2b+jWZFT/8Bym1Ph6UnzVrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTZZS4DX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTZZS4DX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549471F00A3E;
	Wed,  9 Sep 2026 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953453;
	bh=D/Z1y1JhGTYRrwJkoJOXn0dhIUDPrkgCDeyg4Ef4O5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTZZS4DX7i48HdOG+IDdpxqa7dgOOahpdAQJZyjCFRF3iKNeUTJgTaWm9j1uHBP9l
	 /dGkFlmiDvEfjm9JzotkTbcduGUS4bktYLpm0bk43mXZCirehDZ5Oe9B6HqwvqVJl1
	 yMEYbPseJk7xSMGXWINp29zE8uJ+xQTeIviKH1tmhTuQlv3bRtKwz5e4vaTtX+3HBI
	 TrPCY+m1iGZSfD50DAN3D+q82K0wi36kgDmyEalCuuaP5Xy01dPjaPI/zLshgMExt+
	 cLFCkN3rjlgFuS7DKI7yElWI0GUoLs6AattyNSFbMP5cO5YdXavShE479edaNH5MCp
	 00uEzakk3nc0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909105049.1317985-4-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 11:30:52 +0000
Message-Id: <20260909113053.549471F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Asynchronous Runtime PM put during device removal violates PM gu=
idelines by racing with device detachment.
--

commit d6d74f48a42727f6a3e8aba532064a1c4577b574
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP

The proxy power domain enable path requests INT_MAX performance state
for every proxy PD. This commit introduces a proxy_pd_performance_states
array in qcom_pas_data to allow per-PD RPMH levels to be declared
explicitly, and adds Hawi CDSP remoteproc support.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 42bcbe72f95bd..6b23e711f03dc 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -912,6 +922,14 @@ static int qcom_pas_probe(struct platform_device *pd=
ev)
>  		goto unassign_mem;
>  	pas->proxy_pd_count =3D ret;
> =20
> +	if (WARN(desc->proxy_pd_performance_states &&
> +		 desc->num_proxy_pd_performance_states !=3D pas->proxy_pd_count,
> +		 "proxy_pd_performance_states count %u !=3D pd count %d\n",
> +		 desc->num_proxy_pd_performance_states, pas->proxy_pd_count)) {
> +		ret =3D -EINVAL;
> +		goto detach_proxy_pds;
> +	}
> +
>  	ret =3D qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>  			     desc->load_state, qcom_pas_handover);

[Severity: Medium]
This isn't a bug introduced by this patch, but looking at the driver removal
path:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_pds_disable() {
    ...
    pm_runtime_put(pds[i]);
    ...
}

This asynchronous put queues suspend work that will be cancelled by the
subsequent detach during driver removal:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_remove() {
    ...
    rproc_del(...);
    qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
    ...
}

This detaches and deletes the virtual devices, triggering pm_runtime_disabl=
e()
before the asynchronous suspend is guaranteed to complete.

Does this violate the PM guideline which mandates using pm_runtime_put_sync=
()
instead of pm_runtime_put() when device removal follows immediately?

While GenPD happens to gracefully handle the domain cleanup during detach by
decrementing the device count and queueing power-off work, relying on this
internal fallback appears to violate the API contract and leaves the device=
's
Runtime PM state machine in an incorrect intermediate state.

Can this be triggered locally by unbinding the driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909105049.1317=
985-1-mukesh.ojha@oss.qualcomm.com?part=3D3
