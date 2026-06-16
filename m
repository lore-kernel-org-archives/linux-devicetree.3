Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC01393DDC
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642336; cv=none; b=UCo1/Di8+1yxsuXsqyJvH792+DeZL0+lqCVweC33SD3DmthtOhpSVj4EQqlyjO9D+9ulgdAap3p9AOpqABqOS0PRz6Hfj8u1QWX8XDLSUwoBtYCub1offjDc7TmbzWxRHwF/ge7CNpBAylATvdU5P/s9PgAv8YPGbw3/KEbEHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642336; c=relaxed/simple;
	bh=VBzf6EmJtL8KjkKbYrq/vExJJhGMTXmc0tjmzglG7tA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BlG3s+xS4yUM24IPmhwnmgBtK6WF8Vu/IWeq7WEQWji3UOSVnUtpXZ4Op12M7Agw50SWXxoWZLZ4Qwj0WZuANMXV+EvEGdMo39VYmtx2qPk2ZwECFiaplmlvUEC0BWhfbV06DzNcAg2bWfu6P7K4ftzf3RrNcMpkH2aC+mS4Fxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSoH1d1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSoH1d1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFD31F000E9;
	Tue, 16 Jun 2026 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642335;
	bh=b1yczRlQWZgn8/70aFleVrmjmbOIohRQCM3zjTldTrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RSoH1d1tbzedALjjXbToNE5p8qk3IKgKvlU/szfM7zAU6C8Yj6HK3vTfsDmtjFWwS
	 RuEpwHnSyxCVa1JorlwuTjNIw4oxgl0nRE9bJzr3gYHvQ9/tmhHgTn5S1NLlQt5dwV
	 bH8yZn0rAXnIqk+kGlw9qP432IjLhDeJPkt3hDG7toswXzOas5LVswor6GVKw9T6Nv
	 dPv7FJ9qft45SJKPJJzDaFoDIphW8HKp141UP23z+b8owjgjQwQUzrioZnpxh3BtuD
	 nHxav9l5vGF6YmKn3SUkGD6Uh4xCk+g0dTtCcO6DR2e1Al2wer2/xUwdoZneYDG8Fz
	 Vvc4nnnGoIRrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 04/12] clk: zte: Add Clock registration
 infrastructure.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616-zx29clk-v4-4-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-4-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:38:54 +0000
Message-Id: <20260616203855.1EFD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free Vulnerability due to tying `struct auxiliary_device=
` memory lifetime to devres.
- [High] Invalid pointer dereference due to incorrect error checking of `de=
vice_node_to_regmap()`.
--

commit d5b040629c9146bc0aaf0162d247a5520ba7ab60
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add Clock registration infrastructure.

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> new file mode 100644
> index 0000000000000..6e21c4a82a46c
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
> @@ -0,0 +1,157 @@
[ ... ]
> +static void zx_adev_release(struct device *dev)
> +{
> +	dev_info(dev, "Aux device released.\n");
> +}

[Severity: High]
Does this release callback need to free the memory for the auxiliary device?

If struct auxiliary_device is allocated with devres, its memory is freed
when devres triggers during unbind. This might happen before this callback
is invoked if other subsystems hold a reference to the device, potentially
causing a use-after-free.

> +
> +static void zx_adev_unregister(void *data)
> +{
> +	struct auxiliary_device *adev =3D data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}

[Severity: High]
While this devres action decreases the device reference count, does devres
unconditionally free the adev memory right after this action returns? This
could lead to a use-after-free if lingering references are held.

> +
> +int zx_clk_probe(struct platform_device *pdev)
> +{
> +	unsigned int public_clk_count =3D 1, highest_id =3D 0;
> +	struct clk_hw_onecell_data *clocks;
> +	struct device *dev =3D &pdev->dev;
> +	const struct zx_clk_data *data;
> +	struct auxiliary_device *adev;
> +	struct regmap *map;
> +	struct clk *clk;
> +	unsigned int i;
> +	int res;
> +
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
> +	map =3D device_node_to_regmap(dev->of_node);
> +	if (!map)

[Severity: High]
Since device_node_to_regmap() returns an ERR_PTR on failure rather than
NULL, should this check use IS_ERR(map)? Treating an error pointer as a
valid pointer could lead to a kernel panic when it is later dereferenced by
the clock framework.

> +		return -EINVAL;
> +
[ ... ]
> +	res =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clocks);
> +	if (res)
> +		return res;
> +
> +	adev =3D devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);

[Severity: High]
Does allocating adev with devm_kzalloc() improperly tie the lifetime of
the embedded struct device to devres?

Since struct device is reference counted, could an external reference
outlive the devres unbind phase, resulting in a use-after-free when
zx_adev_release() is finally called on the freed memory?

> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name =3D data->reset_auxdev_name;
> +	adev->dev.parent =3D dev;
> +	adev->dev.release =3D zx_adev_release;
> +	adev->dev.of_node =3D dev->of_node;
> +
> +	res =3D auxiliary_device_init(adev);
> +	if (res)
> +		return dev_err_probe(dev, res, "Failed to init aux dev %s\n", adev->na=
me);
> +
> +	res =3D auxiliary_device_add(adev);
> +	if (res) {
> +		auxiliary_device_uninit(adev);
> +		return dev_err_probe(dev, res, "Failed to add aux dev %s\n", adev->nam=
e);
> +	}
> +
> +	return devm_add_action_or_reset(dev, zx_adev_unregister, adev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D4
