Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5CB3603C9
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299287; cv=none; b=UPRm0TomdxujzNK67mRgKTYtnA4Y3BWgkpdfsYcALRmwXesTcwuB1YmFaQEmRo4fEuwhgWhnDEx0W8FjK8rWhU9GypMN5RANz8qCajjiSxeXNYEJsJK7qQI7JmaJnRtj+L6sWmlOYzGPOimf5V6I3ycR4W8BBtF796CvoKcdxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299287; c=relaxed/simple;
	bh=PJUxSUBymBoEGurI9MAiMlq4D4ndXtD6DO9I0SIhqCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UFC0xxJ0VyLDaMP+0RAksQdhjQnxoQ99NKxQb3tUG974xId+TWDhao2VLKCPyuG8PJIoANJ4Rf/cvrG/mc9IBjp3ELDe8sRFfKZCtnbJILTSTSWd8nGfX86jitPjNwkKAxq1gXFcFMoeAlTIpbbiWGXZc/FQyiJJ+v+FOK8m91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOFdOduA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOFdOduA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC1A1F000E9;
	Fri, 12 Jun 2026 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781299286;
	bh=xIOPdx0/bo1vXMdraBaUcQS/aCrDyVbwYBfVfqbqu34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOFdOduAhd2gmiGCufYrGjsSHCVHRLyG9dosDdrZWlo8jJmKqEhPiL9+Bc9jAtOl0
	 gsHf7WnwFuXMsvs8dTwwVXzo8jTPRTK6PSwwnXq37ZpSXITVCXNOxik3qKR4M9m78v
	 749ZosodVHl3OxcrZW2Po9g5n3XdFCUbcH+c5AvGUcj1p89zSRNjhWvYL9NpFDingY
	 j/9YfvTHfq85kZFrUdQZQJuP2mJXaz0NjvCtTMrP3nb6tYokKAoDeutnXFMMpLAzDs
	 uQu2XGX9wXTSOqv/Evr+jdB6rp14bX1C0NRt4wzC/IBKQGig8up9oSD/ty+WIE5X0B
	 bjKmRitQvSWrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 phy-next 5/8] soc: fsl: guts: make fsl_soc_data
 available after fsl_guts_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612210859.266759-6-vladimir.oltean@nxp.com>
References: <20260612210859.266759-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 21:21:25 +0000
Message-Id: <20260612212125.EDC1A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The iomem mappings `soc.dcfg_ccsr` and `soc.dcfg_dcsr` are leaked =
on multiple error paths during initialization.
- [High] The global `soc.data`, `soc.dcfg_ccsr` and `soc.dcfg_dcsr` pointer=
s are not cleared on error paths, leading to dangling pointers, Use-After-F=
ree, and uninitialized spinlock access.
--

commit 9f45015d702d2f4ca41d93015c23b3d9950743a7
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()

In a future change, struct fsl_soc_data will be extended with methods
for performing RCW override.

Since this will be performed from a calling context outside
fsl_guts_init(), we need to keep track of the soc_data that we determine
at fsl_guts_init() time, so we can reference it later.

> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 1494b545bbb47..9f2aff07a2744 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -243,7 +243,7 @@ static int __init fsl_guts_init(void)
>  	np =3D of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
>  	if (!np)
>  		return 0;
> -	soc_data =3D match->data;
> +	soc.data =3D match->data;
> =20
>  	soc.dcfg_ccsr =3D of_iomap(np, DCFG_CCSR);
>  	if (!soc.dcfg_ccsr) {

[Severity: High]
Does this code leak the soc.dcfg_ccsr and soc.dcfg_dcsr mappings on error p=
aths?

Looking at fsl_guts_init(), if the soc_dev_attr allocation fails, the funct=
ion
returns directly, leaking the mappings:

fsl_guts_init() {
    ...
	soc_dev_attr =3D kzalloc_obj(*soc_dev_attr);
	if (!soc_dev_attr)
		return -ENOMEM;
    ...
}

If soc_device_register() fails, the code jumps to the err label, which bypa=
sses
the err_nomem block where iounmap() is called, also leaking the mappings:

fsl_guts_init() {
    ...
	soc_dev =3D soc_device_register(soc_dev_attr);
	if (IS_ERR(soc_dev)) {
		ret =3D PTR_ERR(soc_dev);
		goto err;
	}
    ...
err_nomem:
	ret =3D -ENOMEM;

	iounmap(soc.dcfg_ccsr);
err:
    ...
}

Could the error paths be updated to ensure iounmap() is called when these
failures occur?

[Severity: High]
Are the global soc.data, soc.dcfg_ccsr, and soc.dcfg_dcsr pointers cleared =
on
error paths?

In fsl_guts_init(), global state is set early:

fsl_guts_init() {
    ...
	soc.data =3D match->data;

	soc.dcfg_ccsr =3D of_iomap(np, DCFG_CCSR);
    ...
}

If an error occurs later, the memory is unmapped but the global pointers are
not cleared to NULL:

fsl_guts_init() {
    ...
err_nomem:
	ret =3D -ENOMEM;
	if (soc.dcfg_dcsr)
		iounmap(soc.dcfg_dcsr);
	iounmap(soc.dcfg_ccsr);
    ...
}

External callers checking if the driver is initialized via if (!soc.data) or
if (!soc.dcfg_dcsr) could bypass the checks and access the unmapped IO memo=
ry
or an uninitialized spinlock:

fsl_guts_lane_set_mode() {
    ...
	spin_lock(&soc.rcwcr_lock);

	if (soc.data->serdes_init_rcwcr)
		soc.data->serdes_init_rcwcr(serdes_idx);

	fsl_guts_rmw(override.offset, override.val << __bf_shf(override.mask),
		     override.mask);
    ...
}

Could the error paths be updated to set these pointers to NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612210859.2667=
59-1-vladimir.oltean@nxp.com?part=3D5
