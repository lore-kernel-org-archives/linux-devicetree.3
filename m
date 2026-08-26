Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC19D3D647F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740738; cv=none; b=FdIh/QUz76U352GaWn7U4/N4fs04matbZY2IeajXgXX0+zQfDQKncPT+VcYA3O6fZeLMiCmIUaIKn64tEmPFJbaeCNGq8dJHdU4JkcoVMtoVfyMIS71hwtxhLUxDagZ3mmns8tP7DUJzgUzE1isXgRiHlciWyKJS3RlsJaQlxgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740738; c=relaxed/simple;
	bh=rkb9Gy9q2sKAfzpw13Z7QzQV7iT5GcdHLhjCjm0cpgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/O82Btm4cnvzwvwPWgaEbSA35ogW+lkjDpNEHVdDHDX6WNIX16sf9Le0z5KUb6OOKMhsh8xM5V53uzfKD3mw80Pjh9c/d7gFPBI8/JgrP9YLIfhVCAh1gAmevvuD6O0AfrlAsGbYQe8TIF/JvXvIvV1b0GiemsxtwFtMxUdqW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5Mpz+nf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5Mpz+nf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC8A1F000E9;
	Wed, 26 Aug 2026 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740732;
	bh=N2qK7dAuQKhqPzXIvsZTNDSBWIN93k9f2rVoXf8qoxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D5Mpz+nf6UpA/baXWpClzg/a7E6SSpmmtIZzg7TV2S93pLO7Fbj3J5c6pkMBwSaQl
	 ShRbH4qSrY7bcd1940LYYfQvzFhwV+dmeTw2DZkkfAWdUBbiUqgBgCZN3GonJuUsVr
	 sxrBv4fUt2shnNAJpP0WVgNsGl1pDXiiwSQqRXoSTi0uJTWyHWQ2NogDt/EXrcZEyU
	 3oFMcjwngFMNv3i9Q4VzWFE8AV1DORKX7mhnVKz8nIdI4BsJoLHRjpPiGk5mRsIzs0
	 Fm+SCW9NpP/XoVzt+xV67Q4b8inHBSmoo7mXJw7/pW6VtpIFqviVmjv4qNr/eLWPEf
	 gU75q/tzVMEzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:38:51 +0000
Message-Id: <20260826103852.1BC8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of previously initialized genpds on error paths in=
 rpmhpd_probe() leading to Use-After-Free list corruption.
--

commit fffeb8f7d724849238dff1efcb31a1c3a8c540a4
Author: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
   =20
Add the nmxc.lvl RPMh resource and register it in the Nord power domain
table. Nord supplies the NSP memory rail from this dedicated resource
rather than from the shared MX rail, so consumers need it exposed as its
own power domain.

> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index 90743275942db..28cc8825eee45 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao =3D {
>  	.res_name =3D "mxc.lvl",
>  };
> =20
> +static struct rpmhpd nmxc =3D {
> +	.pd =3D { .name =3D "nmxc", },
> +	.res_name =3D "nmxc.lvl",
> +};
> +
>  static struct rpmhpd nsp =3D {
>  	.pd =3D { .name =3D "nsp", },
>  	.res_name =3D "nsp.lvl",
> @@ -327,6 +332,7 @@ static struct rpmhpd *nord_rpmhpds[] =3D {
>  	[RPMHPD_MX_AO] =3D &mx_ao,
>  	[RPMHPD_MXC] =3D &mxc,
>  	[RPMHPD_MXC_AO] =3D &mxc_ao,
> +	[RPMHPD_NMXC] =3D &nmxc,

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free issue
in the error paths of rpmhpd_probe() when adding new power domains.

If rpmhpd_probe() fails midway during its initialization loop:

rpmhpd_probe() {
    for (i =3D 0; i < num_pds; i++) {
        ...
        ret =3D rpmhpd_update_level_mapping(rpmhpds[i]);
        if (ret)
            return ret;
        ...
        pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
        ...
    }
}

Or if it fails at the very end when registering the provider:

    return of_genpd_add_provider_onecell(pdev->dev.of_node, data);

The function directly returns an error without calling pm_genpd_remove() for
the previously initialized domains. Because pm_genpd_init() links the
statically allocated domain structures into the global genpd list, does this
leave dangling pointers?

Since this driver can be built as a module, if the module is unloaded after=
 a
probe failure, its data section is freed. Could this result in the global
list pointing to freed memory, causing a crash the next time the list is
traversed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826102746.6330=
76-1-shengchao.guo@oss.qualcomm.com?part=3D2
