Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67C3932DC
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500957; cv=none; b=mrIwjVERnsIULY6dtVNnEKDyoRoNsZbTzFrVI6fdg0nrT0cEHHhhqM74dE+jUq01gphwfsCC4gc/q32pNEUfQIx+FA62z8t2zF2SzX+44DWx2qP3qyiVQERCVWQu8rAKaQrS7f52e1hX7l/00P29b5CDX7hHunGvRzzdY5SXpSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500957; c=relaxed/simple;
	bh=SLZYUd1GQ2vSSwaE8yqpvHIlLGm41bqfHGlzVMFJnLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oo7Fzpcs2qjwK1teC+GKJx6+F9KnX9U1nYZ4DWGQgUZxejv/2ypZJCN9mAb28R5tSGPjjjS5iiWRdt+XhQixBCBXs1tF5rMEjVddJnHX2nj0MW27LMDVGN+D+Ugq43qau9DhTSVQA+E5lG98C3Fuj/qrdI26fJsN7VOALEaEvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R875jDan; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R875jDan"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194381F00893;
	Wed,  3 Jun 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500956;
	bh=Usd5TqPq1Z0ZNN2YYf7nDHlQfCbTXIKf+xjffJhIC3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R875jDanQMxj0HU+Nx5KW4TCA7AX1pXPkMTiUMHGoAlUMagixgk04YM+qrd4gmmIS
	 jqo0V6wSbKC3yHb4U/uHh0mr9KYdY/bhRmQ3Ak7z/fI/TAifRZzb6wKaz5KxjPpbcy
	 w4Det5Y4eFBXp8XdwPeJp36x6SD/PPESuu3TL8YqSsdrKBxBm8mH1mYiZ8MYnDBgu/
	 bxPN4RZSBujZNO9jMcYrbgxuvhJrQnxbjVcntaHWiYpfdaTYZ9YHFb84xtwKqHRTQs
	 GQfebWB2jZJzFmXSifYnlGe+X/ccxcvyQHtuvO3SgyCHM+zHDZwBUjVv68jyUj6UTn
	 qb46P5elK8UBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm
 SMMU client tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:35:54 +0000
Message-Id: <20260603153555.194381F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The entries for `qcom,shikra-mdss` are inserted out of alphabetical=
 order in the device match tables.
--

commit c3b00b57dda4a11308898354c0f31b116dd3d96c
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables
   =20
Register the Shikra MDSS display subsystem in both the SMMU ACTLR
client table and the SMMU client match table.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index e2c914fccd6fc..3dfee947e2c9f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -45,6 +45,8 @@ static const struct of_device_id qcom_smmu_actlr_client=
_of_match[] =3D {
>  			.data =3D (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ .compatible =3D "qcom,qcm2290-mdss",
>  			.data =3D (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible =3D "qcom,shikra-mdss",
> +			.data =3D (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },

[Severity: Low]
This isn't a bug, but should this entry be placed in alphabetical order?

It looks like it was inserted right after qcm2290-mdss because it mirrors t=
he
hardware prefetch settings. However, it seems these match tables are usually
kept in strict alphabetical order to prevent merge conflicts and duplicates.
Would it be better placed between sc8280xp-mdss and sm6115-mdss?

>  	{ .compatible =3D "qcom,sa8775p-mdss",
>  			.data =3D (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ .compatible =3D "qcom,sc7280-mdss",

[ ... ]

> @@ -410,6 +412,7 @@ static const struct of_device_id qcom_smmu_client_of_=
match[] __maybe_unused =3D {
>  	{ .compatible =3D "qcom,mdp4" },
>  	{ .compatible =3D "qcom,mdss" },
>  	{ .compatible =3D "qcom,qcm2290-mdss" },
> +	{ .compatible =3D "qcom,shikra-mdss" },

[Severity: Low]
Similarly, should this be placed alphabetically between sdm845-mss-pil and
sm6115-mdss to maintain the list ordering?

>  	{ .compatible =3D "qcom,sar2130p-mdss" },
>  	{ .compatible =3D "qcom,sc7180-mdss" },
>  	{ .compatible =3D "qcom,sc7180-mss-pil" },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-shikra-dis=
play-v1-0-aeac1b94faa7@oss.qualcomm.com?part=3D5
