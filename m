Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367B2E7377
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677918; cv=none; b=lO4bIX12C3Hhrnrz5tjY9FGERna8zauKT3quSBQ9fr2dJrNrlBlr67Ul26XimoxoN3Co8asExxZWCqeqPK6LRphbUtddvXJuBAO3KJJYaBerEZo6V4zItjIpfk1e2Ly+fF+ZL0aGCifqF/vxUkczCMjtdB2SD09ioZYQXtBN7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677918; c=relaxed/simple;
	bh=SU+OBjmB9gHbO8jqhJ0GNDAUocOF5dSyQ52H82IfqRs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqEcXMlgxyBDwvO2FwhxUrjuJu3CZ2i1vnZqBT5mYhTTbqjEWSrC0mVoLFGfbzBBgNuSHTp+Q7hTBlQJ/mYSAkTT+K84jDqoK5RRHqx8mvnIqYzZAEBsyL6u0u3JuUdepM3Hllf8J8Up3giREGQDxLHCSml01veoDX5TozGpaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yjwgh4P7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yjwgh4P7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897EC1F000E9;
	Sun, 28 Jun 2026 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677916;
	bh=oCZ13vb1JYQfX4t/QjPbuNXlMbnCswUyPwLBB0ESNvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yjwgh4P7NUzxiwWM2yyQc2YN+4NXR9mH/7B2dN9R1qKSUmlSm9ACueh/v2BL98q0P
	 teXpPCikEVmp/VYFbek2ZiE5ai+EOyJ7fO1C659EoYO1qnm6pcF00UXKuQ7pOWNTJ9
	 nftBEk2PdpIIV5Fqtjf5f/7WqAb+Goq0APnLPHHWhQjkET0tAN8OP9CWirjuh9szeR
	 yEj5ctNt883vWSvx4IUTqKp/4/t1WVyUy8+Dq5MnbYBnJNdVuAdSB5fS9brYlS2Oi2
	 3dIA4S28BjvO5SGB3ESTcPODZkl3+FRXTee4zLbLq0mwtjWzdSlckX+XD/1Ubsl4Wt
	 ZKfx2XIPoyh9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 10/12] clk: zte: Introduce a driver for
 zx297520v3 LSP clocks and resets
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-zx29clk-v5-10-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-10-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:18:36 +0000
Message-Id: <20260628201836.897EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check on device_get_match_data() return value.

Pre-existing issues:
- [High] Double-free of 'adev' during the error path of 'auxiliary_device_a=
dd()' in 'zx_clk_common_probe()'.
--

commit 8049f2134eca9c93f09de3be7599856e5b1b9d3c
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets

This commit introduces a new driver for the ZTE zx297520v3 LSP clocks and
resets. It defines multiplexers, dividers, and gates for the subsystem. It
also registers the clock provider and optionally an auxiliary device for
the resets.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 17e1f741b48c9..f4ab065ee4969 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static const struct zx_clk_data zx297520v3_lsprm_data =3D {
> +	.inputs_enable =3D zx297520v3_lsp_inputs_enable,
> +	.num_inputs_enable =3D ARRAY_SIZE(zx297520v3_lsp_inputs_enable),
> +	.inputs =3D zx297520v3_lsp_inputs,
> +	.num_inputs =3D ARRAY_SIZE(zx297520v3_lsp_inputs),
> +	.muxes =3D zx297520v3_lsp_muxes,
> +	.num_muxes =3D ARRAY_SIZE(zx297520v3_lsp_muxes),
> +	.divs =3D zx297520v3_lsp_dividers,
> +	.num_divs =3D ARRAY_SIZE(zx297520v3_lsp_dividers),
> +	.gates =3D zx297520v3_lsp_gates,
> +	.num_gates =3D ARRAY_SIZE(zx297520v3_lsp_gates),
> +	.reset_auxdev_name =3D "zx297520v3_lsprst"
> +};

[Severity: High]
This isn't a bug introduced by this patch, but populating reset_auxdev_name
here exposes a double-free bug in the error handling path of
zx_clk_common_probe() in drivers/clk/zte/clk-zx.c.

If auxiliary_device_add() fails during probe, the code jumps to adev_uninit:

drivers/clk/zte/clk-zx.c:zx_clk_common_probe() {
    ...
adev_uninit:
	auxiliary_device_uninit(adev);
adev_free:
	kfree(adev);
	return res;
}

The call to auxiliary_device_uninit() triggers the release callback,
zx_adev_release(), which frees adev. Execution then falls through to adev_f=
ree
and calls kfree(adev) a second time.

Could this lead to memory corruption or a kernel panic if probe fails?

[ ... ]

> +static int zx297520v3_lspclk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +
> +	return zx_clk_common_probe(dev, dev->of_node, device_get_match_data(dev=
));
> +}

[Severity: High]
Could device_get_match_data() return NULL here and cause a NULL pointer
dereference?

If a user binds the driver via sysfs (using driver_override and bind) to a
device that does not match the driver's of_match_table, device_get_match_da=
ta()
will return NULL.

Since zx_clk_common_probe() assumes the data pointer is valid and dereferen=
ces
it unconditionally once device_node_to_regmap() succeeds (e.g., data->num_p=
lls),
would this lead to a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D10
