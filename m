Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D93559C9
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530979; cv=none; b=UJhVooB3JIG/DjkorKaOOqsWjKyDF9/NeNM5TYslLNw4qRgwYu6E/ad3ujz3y+Y+OA0JK+lH3+uYN6g46dTtLNm80iQGGmOXZ5sqtXqrlD1BPwXWwX6jewIAYSR4c2gu7XgeUoGeGnLr52o8YTjFAEtEDgdXfPyyZVBNDLan8Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530979; c=relaxed/simple;
	bh=4CtHkp71LZFj5VQvk/DT1QEIUjw8Grwx/I4uTnmHnpA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Zb0p2sgSHH6zB5qsOva9NdCk9/EgK6Z/v3wFsa/LJm4GuV+/q9ZhVGDMOzfA9Xv6r8VzRWUKojP4HjgQNQemuRCd7THKNtgeW+l7bDUYqaQlqPvAuUufy1B26m+gifY7zAioNy45bbR2P+wda2Dn2eyDL3KJDNeHTQYSZJpuoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8EPIY5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8EPIY5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF7A1F000FF;
	Fri,  9 Oct 2026 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530978;
	bh=YAFZvTBNtgcDynCmTgSwqyR6MaPIUdCci0AXh6EIvfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j8EPIY5otTMo0Ai6wsxkqXPVvBHk4Ndb0N+2pzD3igb0jb2cQPxXHhCgUlsMIo662
	 Xbvukww1GwssokH70+pNTEB77A6xNzBvDLaeNPvvwVT2P5MrLKCW1anO5OENqBXtrG
	 B+bfXIIZXu6yb65BnIMswL7ZUrG12x2zRukDguET42nllkVoTyy28vBKH9GWB1PR9x
	 hkmKS+AUH2C/cx8Moo0apuRpt/IduLdJBk0ejl95jFisDSUAvu6PQMZRbUX8JMVw+D
	 +pl/FZwl7eF2mxmeacwIgPwOWiG8dYcTBcmts7jAHOU+2dYvK+tf2gYxJZED+bI4HA
	 OV3KbyGQQXz2Q==
Message-ID: <sashiko-outbox-165002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom: pas: Support secondary images
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009-oob-support-glymur-v1-2-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-2-96cc8ffcced3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:29:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] remoteproc: missing shutdown of auxiliary processors on start fail=
ure
- [Medium] remoteproc: TrustZone metadata leak on start error path
- [Low] remoteproc: unconditional PAS ID assignment breaks conditional logic
--

commit 3e8f99d1a610c4628e17e809412591bdc8f4873f
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Support secondary images

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts. This commit adds generic PAS
support for these secondary images.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ca8e61254c449..604dfa947340e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -326,7 +417,7 @@ static int qcom_pas_start(struct rproc *rproc)
>  	ret =3D qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
>  				&pas->mem_reloc);
>  	if (ret)
> -		goto release_pas_metadata;
> +		goto unmap_dtb_carveout;

[Severity: Medium]
Does this code leak TrustZone metadata if the primary firmware load fails?

In qcom_pas_start(), qcom_mdt_pas_load() allocates TrustZone metadata via
__qcom_mdt_pas_init(). If segment copying fails subsequently, this metadata
needs to be explicitly released.

By changing the jump from goto release_pas_metadata to goto unmap_dtb_carve=
out,
the release_pas_metadata cleanup label is bypassed, leaving the pas_ctx
metadata allocated.

If rproc_start() fails during a crash recovery (rproc_boot_recovery()), the
core does not automatically invoke the ops->unprepare() hook. Consequently,
can this cause the TrustZone memory to leak until the system is fully
rebooted?

> =20
>  	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
[ ... ]
> @@ -361,12 +456,27 @@ static int qcom_pas_start(struct rproc *rproc)
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>  	qcom_pas_metadata_release(pas->pas_ctx);
> -	if (pas->dtb_pas_id)
> -		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -
>  unmap_dtb_carveout:
>  	if (pas->dtb_pas_id)
> -		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
> +					pas->dtb_mem_size);
> +release_dtb_metadata:
> +	if (pas->dtb_pas_id)
> +		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +unmap_secondary_carveout:
> +	if (pas->secondary_pas_id)
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> +					pas->secondary_mem_size);

[Severity: High]
Does this error path rip away backing memory without halting the successful=
ly
started auxiliary processors?

In qcom_pas_start(), multiple PAS components are authenticated and booted
sequentially via qcom_pas_prepare_and_auth_reset(). If a later component
fails to load, the code jumps to these error labels to unmap the memory.

However, there is no call to qcom_pas_shutdown() on this error path before
unmapping the carveout. Since the remoteproc core does not call ops->stop()
if ops->start() fails, will the processors be left executing in TrustZone
while their backing memory is removed, potentially leading to fatal memory
translation faults?

> +release_secondary_metadata:
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +unmap_secondary_dtb_carveout:
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					pas->secondary_dtb_mem_size);
[ ... ]
> @@ -868,6 +1055,8 @@ static int qcom_pas_probe(struct platform_device *pd=
ev)
>  	pas->pas_id =3D desc->pas_id;
>  	pas->lite_pas_id =3D desc->lite_pas_id;
>  	pas->lite_dtb_pas_id =3D desc->lite_dtb_pas_id;
> +	pas->secondary_pas_id =3D desc->secondary_pas_id;
> +	pas->secondary_dtb_pas_id =3D desc->secondary_dtb_pas_id;

[Severity: Low]
Can this unconditional assignment break device probe if the firmware name
property is missing?

Here, pas->secondary_pas_id and secondary_dtb_pas_id are unconditionally
assigned from the descriptor. Later in qcom_pas_probe(), the exact same
assignments are duplicated inside conditional blocks:

    if (secondary_fw_name) {
        pas->secondary_firmware_name =3D secondary_fw_name;
        pas->secondary_pas_id =3D desc->secondary_pas_id;
    }

Because of the initial unconditional assignment, if a valid descriptor
provides an ID but the firmware name property is missing or NULL,
pas->secondary_firmware_name remains NULL while pas->secondary_pas_id is
non-zero.

Will this cause qcom_pas_load() to later call request_firmware() with a NULL
name, failing with -EINVAL and preventing boot instead of gracefully
disabling the absent secondary features?

>  	pas->info_name =3D desc->sysmon_name;
>  	pas->smem_host_id =3D desc->smem_host_id;
>  	pas->decrypt_shutdown =3D desc->decrypt_shutdown;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-oob-suppor=
t-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com?part=3D2
