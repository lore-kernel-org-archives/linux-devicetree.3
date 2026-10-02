Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9C4746C0
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932444; cv=none; b=M9REB83ZwMuSKL0LztPkqY4CUMiJjokDBlnke/FZNoTSH1/p61DTjptpEyeJ+mIqOdV9u9mNUdNA5WSaEJ7uUsjF+odvnoNh1qTJWK9vtJye/IAP7yHqt3s8z/Kze+EqSEv5SqyQiBEVCmkTddC2erqMMLddb8BNiCBCg5ogHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932444; c=relaxed/simple;
	bh=J3ecA+mYsRb/vXUAUrKca6Y6+oLYb3QKsZ5AtYuc5YA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RO1pd18kdzOsA1DJn7LnUeoOO93Yv77jstsYgK5JBa9PIUyhHA1THfBY/Q4AvLGghGsK8THy1W3XqIQ7bdjG2uSjchpdb705GL8/YHSab5w8Hspy0JqAKcqGhlRqXfAmMaJS6OsygvDHQPnsmkL9UxTlHwrhlKxrdBMfHbaWUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLFqShis; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLFqShis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BF71F000FF;
	Fri,  2 Oct 2026 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932443;
	bh=Tb0KjPWuoEF/u5lX6DyV2x3jstRKhmGKWOwkelMdmgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLFqShis095SIO0ZFKKS8NWqGlWb2PtsnpMw7mVbeerKgf3Z5/AjkcMTMQTG3ByUB
	 MGdV50KiDsWZTauFF+Umo0BXWST2Jjl4pDdwYd3QclWFXopSx/OcTDICv5IGMSRn7a
	 ERtEvtSfYe+LIcqvtnShLhczJqDhrLKbyj0B1p0KtqoRprkozt/Zvdl8h3qMHHTvaB
	 Bf5fUHaTMBMz1O0TyfjEr6sZAkxAQBMjIdc4Cr+zsoEKsRZGmex8PfyMpDJCsJYLN+
	 qW5GN8vsz2ivFxBJsIlAM2BOK+3imvKND8b0lyxVKwlHrKoKJ2yXPTNAPsffRVv6FS
	 TU4UOkuOgTZEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:02 +0000
Message-Id: <20261002091403.61BF71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pmdomain: qcom: rpmpd: DT ABI break and log spam from removed doma=
ins
- [Low] dt-bindings: power: qcom-rpmpd: duplicate ID for RPMPD_VDDMD
--

commit 05d59e980f96866ae3745192a6b683fa44f5be8e
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

pmdomain: qcom: rpmpd: Split SDM632 pm domains from MSM8953

Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
is using mss-supply as regulator. Split SDM632 rpmpd from MSM8953 because
SDM632 MSS is using mss-supply as pm domain.

> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> index 5f55fc791131a..c37a79d6bc433 100644
> --- a/drivers/pmdomain/qcom/rpmpd.c
> +++ b/drivers/pmdomain/qcom/rpmpd.c

[ ... ]

> @@ -703,8 +692,6 @@ static const struct rpmpd_desc msm8917_desc =3D {
>  };
> =20
>  static struct rpmpd *msm8953_rpmpds[] =3D {
> -	[MSM8953_VDDMD] =3D	&md_s1a_lvl,
> -	[MSM8953_VDDMD_AO] =3D	&md_s1a_lvl_ao,

[Severity: High]
Does removing these entries break ABI compatibility for older device trees?

By removing MSM8953_VDDMD (0) and MSM8953_VDDMD_AO (1), these array indices
become NULL. When rpmpd_probe() iterates over the array, it will encounter
these empty entries and trigger a warning:

	if (!rpmpds[i]) {
		dev_warn(&pdev->dev, "rpmpds[] with empty entry at index=3D%d\n",
			 i);
		continue;
	}

Will this cause unconditional boot log warnings on MSM8953 systems?

Additionally, if older device trees still reference <&rpmpd MSM8953_VDDMD>,
would of_genpd_xlate_onecell() return an error and cause consumer drivers
to indefinitely defer probing?

>  	[MSM8953_VDDCX] =3D	&cx_s2a_lvl,
>  	[MSM8953_VDDCX_AO] =3D	&cx_s2a_lvl_ao,
>  	[MSM8953_VDDCX_VFL] =3D	&cx_s2a_vfl,

[ ... ]

> @@ -844,6 +831,21 @@ static const struct rpmpd_desc qm215_desc =3D {
>  	.max_state =3D RPM_SMD_LEVEL_TURBO,
>  };
> =20
> +static struct rpmpd *sdm632_rpmpds[] =3D {
> +	[RPMPD_VDDMD] =3D		&md_s1a_lvl,

[Severity: Low]
Is there a conflicting index assignment introduced by using RPMPD_VDDMD her=
e?

Looking at include/dt-bindings/power/qcom-rpmpd.h, RPMPD_VDDMD is defined
as 5, which is the exact same ID assigned to RPMPD_VDDMX_VFL:

#define RPMPD_VDDMX_VFL		5
#define RPMPD_VDDMD		5

While SDM632 does not use VDDMX_VFL, could having two distinct generic PM
domains share the same integer ID break the uniqueness guarantee of generic
bindings and cause silent overwrites if a future SoC initializes both?

> +	[RPMPD_VDDCX] =3D		&cx_s2a_lvl,
> +	[RPMPD_VDDCX_AO] =3D	&cx_s2a_lvl_ao,
> +	[RPMPD_VDDCX_VFL] =3D	&cx_s2a_vfl,
> +	[RPMPD_VDDMX] =3D		&mx_s7a_lvl,
> +	[RPMPD_VDDMX_AO] =3D	&mx_s7a_lvl_ao,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-sdm632-rpm=
pd-v3-0-95c47d0f26cf@mainlining.org?part=3D3
