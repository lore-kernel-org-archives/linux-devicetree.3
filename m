Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE2470111
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522222; cv=none; b=WjonbIzA1DFuNEk5o+uU/0MdQOXzEHONjwjxxn6gri9PG3iMVivOuWGY0udCTyBWdbS7ksZ5RcRDXUmY2mcDyVglAWJik9pVb5L6xqYTBbGR1q3njmV0woq229OuiwFEblvXguxbfAorql30Yn86LmWUA8r7d3+97OftToc8H5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522222; c=relaxed/simple;
	bh=iKMLodHRINdzlFCOQr0A1zDbIhfnad+oNBdPHPERlOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O8Pl6bii42NOuuhI3qnv/PNlwEhp1plXdmwZtkm/T5veSjwx+A9enq14emzG0502DB/D4a17skLxRocCAOASa1ezwoVMlQT998Xiodm8OXCSEHwG69t17YZA95jDHdW4og/b+k9v3eMGG2JG7QYiMPp2iQRHpOFazHLowDWqSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrDynFwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrDynFwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CA91F00AC4;
	Fri, 31 Jul 2026 18:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522220;
	bh=yXC4+I7IejAgLrWMOhTmsnN411z2sOvMMBag8Ojkhq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GrDynFwomSrmrgfTkIGDQAihBSeaqA03r6n5TNoSQ8llcBq+OO0VsF84gExLRz2aR
	 OHETTG5RYOVFuduJyZAaU3isUPh74/+yczJcNBTiuOay/agV5rgHrzmiFJJ89vTniu
	 ZEZZI2mcwESnpEEHTPSgxYGjdUZfT4dIXkrjYHxGH9xlswQv14FvYrRIAVgavPG+Oq
	 DBFeJfDho/DQzbuqy9sWOwXM99+gRIff/ebnskhx5bLA0qmBHO3V0C9MQGskK8yMMR
	 tnZiT+bSWiOSi3MYzHCiroSgXQwHRHbVia8osJ4XsMeSZKgM7R1K5/ZDLZlXBjylqG
	 juNNXoTdb1ePw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SM8475 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-sm8475-tlmm-v1-3-3007a8e4aa62@proton.me>
References: <20260731-sm8475-tlmm-v1-0-3007a8e4aa62@proton.me>
 <20260731-sm8475-tlmm-v1-3-3007a8e4aa62@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:23:40 +0000
Message-Id: <20260731182340.88CA91F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplicate element 'gpio81' in `prng_rosc_groups` array.
--

--- Patch [3]: [PATCH 3/3] pinctrl: qcom: Add SM8475 pinctrl driver ---
commit 69bbbdbf43f15e9fcc85a840c3553ca43e151ad0
Author: Esteban Urrutia <esteuwu@proton.me>

pinctrl: qcom: Add SM8475 pinctrl driver

This commit introduces a new pin controller driver for the Qualcomm SM8475
platform. It separates the SM8475 configurations from the SM8450 driver due
to differences in PLL clock groups.

> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8475.c b/drivers/pinctrl/qcom=
/pinctrl-sm8475.c
> new file mode 100644
> index 0000000000000..79e2fce11d36d
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8475.c

[ ... ]

> +static const char * const pri_mi2s_groups[] =3D {
> +	"gpio125",
> +};
> +
> +static const char * const prng_rosc_groups[] =3D {
> +	"gpio73", "gpio75", "gpio81", "gpio83",  "gpio81",
> +};

[Severity: Low]
This isn't a bug, but it looks like "gpio81" is listed twice in the
prng_rosc_groups array. Was this intentional, or a copy-paste error?

> +
> +static const char * const qdss_cti_groups[] =3D {
> +	"gpio2", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84", "gpio85", "g=
pio93",
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-sm8475-tlm=
m-v1-0-3007a8e4aa62@proton.me?part=3D3
