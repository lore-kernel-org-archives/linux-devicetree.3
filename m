Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE153AEB49
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377794; cv=none; b=Ti3+K0LaJK6XnzhpHdeAVijg/KUTVTSqwo1L+e6heeG3WnWnR6zNgkCvzbiAbI6Wr2o2P2TXbAELN2kN0uHaAJvzLYxFmIJ1y6rAeCAo1py70lRiNu4vuddzVguLDeZ8IhEGP2IRiAWRW+6I0BdseS8tiDgi2UgWDEl65wGGbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377794; c=relaxed/simple;
	bh=AHyHme6FVdKxcl3BQoSR6JvF8zwWF8sayU1lfAZFgs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jcmu8ElIJkQe20gR/uz/M9orueBN3Fp1mFIhISfV3ynL9zudEYrluxS4tO8Vc5Y7kb8sxfTh+p+/1MmzG6adpqlG2tg9k9qHgcBZjqaazAUC51CwU9xb2c8aFwPZCKFRNrMeep5SSEhggbkod3W7QNpofgMCKNrKJ8QG8+SXLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Giyh+1ej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Giyh+1ej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E5C1F000E9;
	Wed,  2 Sep 2026 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788377777;
	bh=6KR4I6kMMWyTagRoN5cFtHa/cLvqgussu/DjX7VsnyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Giyh+1ejQNd01IhRzsIrFYocJ2BnSCgM+ir82ZTK34MvlRqnc2Mxb2FYef0iTBqPr
	 vGncw+fPSFGDJp60nqShCa0mh8K2zGLrZpTMu1TWm0daZYtax46AiZymQqe0+AoGKp
	 3yEmKWD9bUauNOTfNNjOGDhAiSFHsz5CHg7rxnmCHSiehU4O4IXJcwwR5wS1SdnegZ
	 MnfyGd27mFgiUFvieYHk4SE/UX+olnhLefeDQRzCGGgYmY87OPugUm+jd3fE0PNBd+
	 wHBPjcsdFkzDkTi+w4WJkY19Luj9L5Y+Uw2Ku5YORDwJRhHtZ80pWM41MfNvf2wdNq
	 mnRHi1zaZtzAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iommu: apple-dart: Support specifying the DMA
 aperture in the DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-iommu-apple-dart-aperture-v3-2-252ce55b7001@jannau.net>
References: <20260902-iommu-apple-dart-aperture-v3-0-252ce55b7001@jannau.net>
 <20260902-iommu-apple-dart-aperture-v3-2-252ce55b7001@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 19:36:17 +0000
Message-Id: <20260902193617.B2E5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing domain compatibility check allows devices with differing D=
MA windows to silently inherit incompatible aperture geometries.
--

commit e83dc2864fbb95e2dcc7b7e8d91aaff785a779a1
Author: Janne Grunau <j@jannau.net>

iommu: apple-dart: Support specifying the DMA aperture in the DT

Apple DARTs are often connected directly to devices that expect only a
portion of their address space to be used for DMA (for example, because
other ranges are mapped directly to something else). Devices can specify
the start and end of the aperture via "iommus" args if the DART device
node specifies "#iommu-cells =3D <5>.

[ ... ]

> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index b160fb464c5fb..ebf4547d32b41 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -590,6 +600,7 @@ static int apple_dart_finalize_domain(struct apple_da=
rt_domain *dart_domain,
>  {
>  	struct apple_dart *dart =3D cfg->stream_maps[0].dart;
>  	struct io_pgtable_cfg pgtbl_cfg;
> +	u32 ias =3D min_t(u32, dart->ias, fls64(cfg->dma_max));
>  	int ret =3D 0;
>  	int i, j;
> =20

[Severity: High]
Does this missing domain compatibility check allow devices with differing D=
MA
windows to silently inherit incompatible aperture geometries?

If a domain is attached to a device with a large DMA window (e.g., 8GB),
setting the domain's geometry, and later a second device with a smaller
window (e.g., 4GB) is attached to the same domain,
apple_dart_finalize_domain() in drivers/iommu/apple-dart.c will skip
validation due to this early exit:

	if (dart_domain->finalized)
		goto done;

This allows the second device to join the domain unchallenged. The IOMMU
driver then silently accepts the attachment, which could allow the DMA API
or VFIO to allocate IOVAs outside the second device's hardware capabilities.

This could potentially be triggered by unprivileged userspace via VFIO by
grouping devices with different constraints into the same container. If the
hardware truncates the address, will it silently write to unintended
physical memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-iommu-appl=
e-dart-aperture-v3-0-252ce55b7001@jannau.net?part=3D2
