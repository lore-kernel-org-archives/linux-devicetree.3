Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B70457E61
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044827; cv=none; b=K2ohw8GDXtWnXBzUd1vViMBSRnPc6ylvW8zSJsYFbXGoUuRmm4QQ6FfcMnywHeilFv9o2Y9J1rkA0Qeh12BKsrj06qLd8Ca2/DaumaUtDByHP0ogcZ0UW6M8BBJ5l1E5/tamkNyQS7zr4ik1B0jVjNi3AMhpn92KZhBqi1mtwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044827; c=relaxed/simple;
	bh=DFowweBxe3OMuVstuaUGBBkFY8vOxNU+OC0TPZANZNs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QmcbNgodmjvVvJU4PXHZXijIF4u3PAvq6tB7vjdrohR5jbY2QSBzorFwL/hKVy0MkK1DFTBjoMPm4HKmVZE0QEuqC1FDWduBwSyV7zndzjhfWmJgX0Y8/oj+KRhHPed0UJ8yBWzgLmJBTrvhPAVudkqv1rZdOVGsIrZHeGuFdGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIy+LALO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIy+LALO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E341F000C4;
	Thu, 15 Oct 2026 06:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792044817;
	bh=WY0R7VraIS+2ZUpY/VXSl2f49yBiQJmYRFMue9RY0+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fIy+LALO3A6nqGT2feT8Hi22nS3n+ncn5DxViyj732n36vt4zgfrnbdJ5X13iUKDQ
	 CR5o4bDjNxg8awQ0O7lCagZ0Yic4ZBfQwHxfU2kpKX8w3Nz8NBwlxg9m7YFqXjNOTn
	 0XdXKVu2qTvKY54K+XxwP+TkQsez+HYcdUcFiq0P6FEnQG37KM3Vo2/KYGVnUoFOpW
	 ZO40Fs8GlYTgiJwQdBV9K5kUb0JubZc5MTixwuDSEVaEYN979wlbCiES/ttwKHty0O
	 2XbhS37fvjGVZNEvtx7QWSxcGPS28kgqLoV+TOCZXh2hxfrWJrCULhxGeZ2spHbosC
	 eoSouGz6UXJNA==
Message-ID: <sashiko-outbox-172332@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 06:13:36 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] remoteproc: qcom: coredump completely aborted if secondary memory =
map fails
- [High] mm: UAF of rproc in qcom_pas_probe() if rproc_add() fails
--

commit 78eeb93e0081fe18e5c14c65d05d13fbc15c17c8
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Add coredump support for secondary processors

Add coredump support for PAS remoteproc instances with a secondary
processor by registering fixed dump segments for both primary and
secondary carveouts at probe time and mapping them during collection.
The attached-state path is for debug dump collection and does not
provide operational device recovery.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 0bce2f0d5b4aa..374cafd04b625 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas =3D rproc->priv;
> =20
> -	pas->mem_region =3D qcom_pas_ctx_map(pas->pas_ctx);
> +	if (!pas->mem_region)
> +		pas->mem_region =3D qcom_pas_ctx_map(pas->pas_ctx);
>  	if (!pas->mem_region)
>  		return;
> =20
> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
> +		pas->secondary_mem_region =3D
> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
> +		if (!pas->secondary_mem_region) {
> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
> +			return;
> +		}
> +	}
> +
>  	rproc_coredump(rproc);

[Severity: High]
If the secondary memory mapping fails here, does the early return
unintentionally bypass the rproc_coredump() call completely?=20

Since the primary processor memory was successfully mapped just above,
and the remoteproc framework's segment copy gracefully handles unmapped
segments, should it log the error and still proceed to dump the primary
core's memory rather than aborting?

[ ... ]
> @@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *=
pdev)
>  	if (desc->early_boot)
>  		pas->rproc->state =3D RPROC_DETACHED;
> =20
> +	if (qcom_pas_has_secondary(pas)) {
> +		ret =3D qcom_pas_register_dump_segments(rproc, pas);
> +		if (ret)
> +			goto remove_ssr_sysmon;
> +	}
> +
>  	ret =3D rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> @@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *p=
dev)
>  	return 0;
> =20
>  remove_ssr_sysmon:
> +	rproc_coredump_cleanup(rproc);

[Severity: High]
Can this sequence cause a use-after-free if rproc_add() fails?

Looking at rproc_add(), if device_add() fails internally, it explicitly
calls put_device() which drops the initial reference created by
devm_rproc_alloc(), freeing the rproc structure:

rproc_add() {
    ...
    ret =3D device_add(dev);
    if (ret < 0) {
        put_device(dev);
        goto rproc_remove_cdev;
    }
    ...
}

If we jump to remove_ssr_sysmon on rproc_add() failure, doesn't
rproc_coredump_cleanup() then try to access the already freed
rproc structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-oob-suppor=
t-glymur-v2-0-715435f52dd7@oss.qualcomm.com?part=3D3
