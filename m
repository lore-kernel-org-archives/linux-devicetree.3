Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15889475
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555617; cv=none; b=DU/CqbVjUyWwjgxQnsZT2NWJD3qewIeCaMdVJvQom1h7dInz175OIc5ht2hjzNNw+zrbDtc6+Fq+YUk8XZJ/2tiNvkO/A3cum5AoOvjMedw4dyF34+G2HNACViADmMe3li/U/VnTiJg4Nr06DIFkwkLB5X3cuIy9oTw4AVrsb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555617; c=relaxed/simple;
	bh=li4r/tg4JMvrsuaKGLIE886SQt/s+ELqdNtju9gzeiM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IP94mxTpPJJhiBlDemPeHRAwjIAocZ+5puFFfSCwlLxiYsVkwQAZsXVMYV1RDDrKpfPRZMHhJadBlMlPhu4+fyPSMYX9yyadpKRY2AQgo5QoIg9bppi1VCOvMKPXBnDnXSlCu8H+pPeMyR+ji3IQVhki/igGyFP+DLu9PxT6N3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2DQueFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2DQueFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2455F1F00A3A;
	Mon, 20 Jul 2026 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555616;
	bh=+HRLJpWdJvMqicxywTFH8ps/eLO/SOD9TEHKB7F7MuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l2DQueFM64nnGq8VTlzn4eaxajnfGsjtT4JxMl4jBM0QEGXjovF8rZq2PFeTy5wIO
	 uEu4BdntVm2DuutDWsKuc+k931Bp9Q+mIN0CfACo/a9k+cnU/F3rokeX0PWy5ybsFE
	 gsdtXtx8pcYf2ciPbXWsKBUQdKtqDRRbl7BmbNHEL7F2+hthtMog/SodipqV23By4J
	 T2TgI8JUASDsi/r9piCakGkkff7GUdbz2lHnCga2JL8ikNQJpCs0/1RzLqW6Zux/L2
	 YNk9XlEzxucauJGLXwRxFFke2AqxykmaskxiOUlo+glogwQl2DJozu/cG2fv/FoXXS
	 Isz16yMSyG3nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 4/8] soc: fsl: guts: make it easier to
 determine on which SoC we are running
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260720133642.136324-5-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-5-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:53:35 +0000
Message-Id: <20260720135336.2455F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dereferencing a NULL pointer on the `soc_dev_attr` allocation erro=
r path in `fsl_guts_init()`.
--

--- Patch [4]: [PATCH v3 phy-next 4/8] soc: fsl: guts: make it easier to de=
termine on which SoC we are running ---
commit 27fff30cda7c763b92c9fd890450416b6a304140
Author: Ioana Ciornei <ioana.ciornei@nxp.com>

soc: fsl: guts: make it easier to determine on which SoC we are running

The guts driver will need to easily determine on which SoC it's running
when it will need to perform RCW override at runtime. The guts driver
knows this already because fsl_guts_init() reads the QorIQ/Layerscape
architectural System Version Register (SVR), but it doesn't save this
for later lookups.

> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index e1b3a054e681b..922560d987824 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
[ ... ]
> @@ -239,12 +274,12 @@ static int __init fsl_guts_init(void)
>  	if (!soc_dev_attr->family)
>  		goto err_nomem;
> =20
> -	soc_dev_attr->soc_id =3D kasprintf(GFP_KERNEL, "svr:0x%08x", svr);
> +	soc_dev_attr->soc_id =3D kasprintf(GFP_KERNEL, "svr:0x%08x", soc.svr);
>  	if (!soc_dev_attr->soc_id)
>  		goto err_nomem;

[Severity: High]
Does jumping to err_nomem when soc_dev_attr allocation fails cause a NULL
pointer dereference?

In an earlier commit in this series ("soc: fsl: guts: add a global structure
to hold state"), the error path in fsl_guts_init() was modified to unmap
soc.dcfg_ccsr, but it seems the cleanup assumes soc_dev_attr is valid:

fsl_guts_init()
	soc_dev_attr =3D kzalloc_obj(*soc_dev_attr);
	if (!soc_dev_attr)
		goto err_nomem;
    ...
err_nomem:
	ret =3D -ENOMEM;
err:
	kfree(soc_dev_attr->family);

If the dynamic allocation for soc_dev_attr fails, wouldn't we dereference
the NULL pointer when freeing its members in the err block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D4
