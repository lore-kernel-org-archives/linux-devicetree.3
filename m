Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6429AB1A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677420; cv=none; b=nWVFbvMdIMG0oAA14tSGc1CaYs1w7/TgeFi2JihUjCnjJYMQe1vYfsPAiBiVZ4MIDnzyyCEVcsdFtPcxIyl8n0Vc4nZWVgPOFCitsKp4UMCIyGydJPh6QfwwdBx452R2SIb+6D4YPIL6N2i0VAQe5SJ4pYJImaG6EehMTuW71DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677420; c=relaxed/simple;
	bh=Szo+lyAGvwhsOYjn5xHsLmnKNIKBP0Tc5Wd6Q7/dn0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=giqmD457j7UhSzlpmEIeptu/KOZv5HmgbDB8t4fRj/TuULKE5db2K/zk7cAAi2EvA7yCbiqxqtxB/n90by0UqiaxnTDmhDlcQKOKvXj5q++EXMt0fsY8wAdbme21GJpEewKz33DcijWzTIhXVfMmiFFF7KAXs4mv1okuimAOL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh41ZPnY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh41ZPnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302D41F000E9;
	Sun, 28 Jun 2026 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677419;
	bh=7xvswjNeDS/Ij/+EKPvnDp14imFvowTqvcNWE4rKHMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dh41ZPnYfzQS72n+6b4CkzBgHPXmn4dg3IG0GXHFtXUCHffDTdPcAzVdJZzMNa/OH
	 4tHPZmCiPhkg/ZP7YwRunkqm01P6UQ/gpEXw+kUc3vLr5IUkAVei0Yrrx4T1uFlgDw
	 2LhuSaZbUocf6Eb4Ngf9xZxHvQOKEUwDrMehdMck1Rg3C41ku9lz5JaXcaKOOnUk4F
	 hXIgpnMN22Ly2p4j9IT0L7slBNdfYuF2xeExs3snt+bvdOM0AjxruP/Vaxz7G177rR
	 2tLW38/Kp6t7j4gTSQe+u95iYGSwFXaJfoDXJJ86MZT5arVyDZGPncmvm1dY+kIhiC
	 ep9Z0Dzi4vT1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:10:18 +0000
Message-Id: <20260628201019.302D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Double free of the auxiliary device structure on the `auxiliary_de=
vice_add()` error path.
- [Medium] Passing a valid pointer to `dev_err_probe` instead of the actual=
 error code on `clk_prepare_enable()` failure.
--

commit c7ef137ca7f89acf9208fa4b616fde3c0b54b8fc
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add Clock registration infrastructure.

This patch adds common clock registration infrastructure for ZTE SoCs,
implementing the registration and probe routines for various clock types
and preparing for the regmap clocks and PLL drivers.

> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
[ ... ]
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{
[ ... ]
> +		res =3D clk_prepare_enable(clk);
> +		if (res) {
> +			clk_put(clk);
> +			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s enable failure\=
n",
> +					     data->inputs_enable[i]);
> +		}

[Severity: Medium]
Should this pass the actual error code res to dev_err_probe instead of
PTR_ERR(clk)?

Since clk is a valid pointer here (having successfully returned from
of_clk_get_by_name earlier), PTR_ERR(clk) will return a casted kernel addre=
ss
rather than the actual error code.

[ ... ]
> +	res =3D auxiliary_device_add(adev);
> +	if (res) {
> +		dev_err_probe(dev, res, "Failed to add aux dev %s\n", adev->name);
> +		goto adev_uninit;
> +	}
> +
> +	return devm_add_action_or_reset(dev, zx_adev_unregister, adev);
> +
> +adev_uninit:
> +	auxiliary_device_uninit(adev);
> +adev_free:
> +	kfree(adev);
> +	return res;
> +}

[Severity: High]
Will this result in a double free if auxiliary_device_add fails?

When jumping to adev_uninit, auxiliary_device_uninit drops the reference
count to 0, which triggers the zx_adev_release callback:

static void zx_adev_release(struct device *dev)
{
	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);

	kfree(adev);
}

The code then falls through to the adev_free label and explicitly calls
kfree on the adev pointer again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D5
