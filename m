Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F555311C35
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111189; cv=none; b=e4Pgdz2CTzTgaiqPMXduyA2an5eMAN3S7lqKqPo+lnqOofLkbr/1X6sy28Iy3Az29SdZx63qATsgFmIvpLrf7DPmEUy+IotKY2mSgtD1+wjS577YLqeezuKo9eVOQlJCu/2veCrs2TkFcT1lC9d59FXHq6NBxr8YQRVkxSGoTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111189; c=relaxed/simple;
	bh=BEd35gZJ+lhW/n+YaH7VvlzZWiXmk3JVRvXBdLig7/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jk6pqKH3f8rEzjd7RIywQKfVKpcdXnFhVtz0GOyHSBcoxKtm4Qho2B+k4sHOXMqpznLC0Cfyi1F+wGGq/ns31LVBccDOhLQo7vdCX4Tge00H38lissyev/xJUR5Lacq0M2pI2GtoK2v53m+hF4qnk+U2vEyBCLlRnN3a4563kCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRWZVZpv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRWZVZpv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B11C2BCC6;
	Mon, 18 May 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779111189;
	bh=BEd35gZJ+lhW/n+YaH7VvlzZWiXmk3JVRvXBdLig7/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TRWZVZpvMzeNIIemDTj/faLVoUVucHFyukUqgELvrgBalXNERDqBIQnc1CXLaaXNl
	 +84TwADa/39azEphPo+rJa+hIM3AwsQe4ibgqUS6idEjjytM6dXiZJp/7HSxdz6U9d
	 VEuPQBjJuBmlm5puU3yruHQTTing89K1v0u+uu64tPxKPER7MwPdCaYIw8psfALk4/
	 zbDs+kd6m2RvRSxiubKlv+bmU2iG1XTqfFJmNNIn6u6zG+CIeQAt38fVEBEiO2VnUr
	 EuEiBEf2wRHvnWn01VCwsElH3jaUicoFOiCSTYwHQk11aX44AtNpfuFhOWSvW8a1se
	 7lHC/UTW5hz0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] memory: tegra264: Add full set of MC clients
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Gupta" <sumitg@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518124306.2071481-4-sumitg@nvidia.com>
References: <20260518124306.2071481-4-sumitg@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 13:33:08 +0000
Message-Id: <20260518133308.E8B11C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Newly added BPMP-managed memory clients are missing their `.bpmp_i=
d` and `.type` interconnect properties.
--

commit 1230942ec14ede13ea86a9f95a6ff94371903b6d
Author: Sumit Gupta <sumitg@nvidia.com>

memory: tegra264: Add full set of MC clients

This commit extends the tegra264_mc_clients table to include the full set of
memory clients exposed by the SoC. The commit message notes that clients
managed by the BPMP bandwidth manager additionally carry their bpmp_id and
type.

> diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra=
264.c
> index e628908417255..b8d6c4ce48369 100644
> --- a/drivers/memory/tegra/tegra264.c
> +++ b/drivers/memory/tegra/tegra264.c
[ ... ]
> @@ -21,45 +21,62 @@
>   */
>  static const struct tegra_mc_client tegra264_mc_clients[] =3D {
[ ... ]
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_MGBE2R,
> +		.name =3D "mgbe2r",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_OFAR2MC,
> +		.name =3D "ofar2mc",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_OFAW2MC,
> +		.name =3D "ofaw2mc",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_MGBE2W,
> +		.name =3D "mgbe2w",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_MGBE3R,
> +		.name =3D "mgbe3r",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_MGBE3W,
> +		.name =3D "mgbe3w",

Are the new MGBE2 and MGBE3 clients missing their interconnect properties?

Looking at the other EQOS clients like MGBE0R and MGBE1R, they correctly
initialize .bpmp_id =3D TEGRA264_BWMGR_EQOS and .type =3D TEGRA_ICC_NISO. If
these fields are omitted for MGBE2 and MGBE3, won't interconnect bandwidth
scaling requests for these blocks be silently ignored, potentially causing
hardware bandwidth starvation?

[ ... ]
> @@ -70,6 +87,15 @@ static const struct tegra_mc_client tegra264_mc_client=
s[] =3D {
>  		.name =3D "vicw",
>  		.bpmp_id =3D TEGRA264_BWMGR_VIC,
>  		.type =3D TEGRA_ICC_NISO,
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_VIW,
> +		.name =3D "viw",

Does this missing bpmp_id issue also apply to other BPMP-managed
subsystems added in this patch, such as VIW?

[ ... ]
> @@ -110,6 +208,12 @@ static const struct tegra_mc_client tegra264_mc_clie=
nts[] =3D {
>  		.name =3D "rcew",
>  		.bpmp_id =3D TEGRA264_BWMGR_RCE,
>  		.type =3D TEGRA_ICC_NISO,
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_NVENC1SRD2MC,
> +		.name =3D "nvenc1srd2mc",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_NVENC1SWR2MC,
> +		.name =3D "nvenc1swr2mc",

Are these newly added NVENC clients also missing their TEGRA264_BWMGR_NVENC
manager definitions?

Since the memory controller interconnect implementation skips bandwidth
scaling requests for clients without a bpmp_id, should these clients also
include their respective bpmp_id and type to ensure bandwidth requests
are processed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518124306.2071=
481-1-sumitg@nvidia.com?part=3D3
