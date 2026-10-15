Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128A46C851
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044325; cv=none; b=j6MGXRT0jRoTAnqiE38peViy+m0ZCoZbBTOcGpUwlZHsPr75+44aZCz/D+ONfHvpCOWiuJKDD0OxCxZclgDR2KLgsdEli8wNsOvUUD7Ij0LncIWPtdbGMGkamL+JJOQCMxyoDHglczzRuAU/PCV65uatVxUBH4jSforKayZm/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044325; c=relaxed/simple;
	bh=VrqbsEepoE6VEzJ56SIMrL1tzdftYHnoD7uJ/JNeY8U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RwcQPnsS6Nv2vy3W6wMWT3k5wU9XgP2+st8/LELMHItf8UvTBn9N6CTdQbtBxp/Ss2iQ8bRdmewsw9TNzrorLRNweAzIJD+uFqfi6p5wz2rkap1zE1FWgExsCFnQmv4kO0/2HN+l1T0zKdi0krTCnaIY2uro7lP9Hrd3sYyct5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxvWrUOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxvWrUOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC981F000C4;
	Thu, 15 Oct 2026 06:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792044321;
	bh=PfPAOWhUZCTtsQa4Ty9dqd2srDgLERz1ywinAPd/0yI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxvWrUOmfPj6jjo3V/8hcY1w2R9mT8TSvtt/g/5xQJMizQDbYG3fZ+TGqWOXNmMUk
	 OOo/4JGtanfZ1LjzoukG+fzmq17t84xk4YD+GYkqpGs+v8JFq4FM7V2u4yHPa3dABl
	 gHJNeMn5zphzdLKJU527cKT1FAvCUE9pbxlI3b8oWxzZF9/nlJ4n3k3l7PHT7LIedE
	 GeRNJSUNC08sMArpj02822aiG02NyRDJC06T32hlZFm/MGiXYlHqaGSAwpdmjVHj4e
	 0cB3AGjNBThAUr2MJX7mtfftw8lmJAdKR9P7llypDoDs7aq9Ca4YW2M8W+7SzXJ4f4
	 ksQRyrrQETg7A==
Message-ID: <sashiko-outbox-172329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 06:05:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] qcom_q6v5_pas: NULL pointer dereference due to early returns bypas=
sing context allocations
- [Medium] qcom_q6v5_pas: Memory leak of firmware objects on successful load
--

commit 3f3270df945541b7e62ff38a77d04e462e6bf823
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Support secondary images

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ca8e61254c449..0bce2f0d5b4aa 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const=
 struct firmware *fw)
>  	if (pas->lite_dtb_pas_id)
>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
> =20
> -	if (pas->dtb_pas_id) {
> -		ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, p=
as->dev);
> +	if (pas->secondary_dtb_pas_id) {
> +		ret =3D request_firmware(&pas->secondary_dtb_firmware,
> +				       pas->secondary_dtb_firmware_name, pas->dev);
> +		if (ret) {
> +			qcom_pas_release_firmware(pas);
> +			return ret;
> +		}
> +	}
> +
> +	if (pas->secondary_pas_id) {
> +		ret =3D request_firmware(&pas->secondary_firmware,
> +				       pas->secondary_firmware_name, pas->dev);
>  		if (ret) {
> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> -				pas->dtb_firmware_name, ret);
> +			qcom_pas_release_firmware(pas);
>  			return ret;
>  		}
> +	}
> =20
> -		ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
> +	if (pas->dtb_pas_id) {
> +		ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
> +				       pas->dev);
>  		if (ret) {
> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -			release_firmware(pas->dtb_firmware);
> +			qcom_pas_release_firmware(pas);
>  			return ret;
>  		}
>  	}

[Severity: Medium]
When qcom_pas_load() completes successfully, it returns 0 without calling
release_firmware() or qcom_pas_release_firmware(). Could this leak the
firmware objects and their underlying buffers?

[ ... ]

> @@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
>  	ret =3D qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>  	if (ret =3D=3D -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
> -		qcom_pas_shutdown(pas->pas_id);
>  		goto unmap_carveout;
>  	}
> =20
>  	qcom_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
> =20
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it no=
w */
>  	pas->firmware =3D NULL;
> @@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
>  	return 0;

[Severity: Medium]
Similarly, in the success path of qcom_pas_start(), should there be a call
to release the secondary_dtb_firmware, secondary_firmware, and dtb_firmware
objects before returning 0?

[ ... ]

> @@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_=
pas *pas)
>  	if (IS_ERR(pas->dtb_pas_ctx))
>  		return PTR_ERR(pas->dtb_pas_ctx);
> =20
> +	if (!pas->secondary_pas_id)
> +		return 0;

[Severity: High]
In qcom_pas_alloc_memory_region() (just before this diff hunk), there is an
early return:

	if (!pas->dtb_pas_id)
		return 0;

If a platform defines a secondary_pas_id but lacks a primary dtb_pas_id, wi=
ll
this early return prevent the allocation of the secondary contexts?

> +
> +	ret =3D of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
> +	if (ret)
> +		return ret;
> +
> +	pas->secondary_mem_phys =3D res.start;
> +	pas->secondary_mem_reloc =3D res.start;
> +	pas->secondary_mem_size =3D resource_size(&res);
> +
> +	pas->secondary_pas_ctx =3D
> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
> +					    pas->secondary_mem_phys,
> +					    pas->secondary_mem_size);
> +	if (IS_ERR(pas->secondary_pas_ctx))
> +		return PTR_ERR(pas->secondary_pas_ctx);

[ ... ]

> @@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *p=
dev)
>  	pas->pas_ctx->use_tzmem =3D desc->needs_tzmem || rproc->has_iommu;
>  	if (pas->dtb_pas_id)
>  		pas->dtb_pas_ctx->use_tzmem =3D desc->needs_tzmem || rproc->has_iommu;
> +	if (pas->secondary_pas_id)
> +		pas->secondary_pas_ctx->use_tzmem =3D desc->needs_tzmem || rproc->has_=
iommu;

[Severity: High]
If qcom_pas_alloc_memory_region() returned early because dtb_pas_id was
missing, could pas->secondary_pas_ctx be NULL here, leading to a NULL point=
er
dereference when setting use_tzmem?

> +	if (pas->secondary_dtb_pas_id)
> +		pas->secondary_dtb_pas_ctx->use_tzmem =3D desc->needs_tzmem || rproc->=
has_iommu;
> =20
>  	if (desc->early_boot)
>  		pas->rproc->state =3D RPROC_DETACHED;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-oob-suppor=
t-glymur-v2-0-715435f52dd7@oss.qualcomm.com?part=3D2
