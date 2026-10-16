Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51144236A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162106; cv=none; b=RMrSHM4dRNSEJOvFPoeuTmi1hIocdPVH5vwNedrgdHrqXK5vOvFfv6iX0uKKHNdX6lEpJ3RMz9sXBjmcsT3IJElVuSrM51+xHR7XmzvblBicV1Y7XHgVMIxqXNaFDavT4tFoNKS41efRmhHs/PR1uCa1WHwtPfFWCJpsN++0O+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162106; c=relaxed/simple;
	bh=nWSjMo+YKZolxlS7HJD3Wdvca8vbIyzP8It5wB9l74U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XM/O93Ww1DCKI5oj5OycEm3mpagAwnaQSeAYL44nY+2nyroP8mod7CsEPoXOTpFhvbZ4xUKXsvta6KSDxGNGfaGFic1Clb5DiP6jd6QUdqUMwGCwzVD9X8ppt3Obgixz0pXA3y3ttM/VmcPSbbQt+cASCFC+g3X/SXWmSG/0Utg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2UDl194; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2UDl194"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0941F000C5;
	Fri, 16 Oct 2026 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162104;
	bh=qvPVpdxs7gx4zX9RZ8b+mOezUHTztei8CM1Ax5WPFnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2UDl194R0mRsERU4aR6KqFDN3q+OcqjdqVW1suA8GxRfV5TZDZ4FeThPTWFoA4bC
	 S0vpZH3/dXizJa8hIizO/ATUgmO4SGhoCHMcjkRhYgDazMet6m5icG5byvWFgDXlxf
	 aJc02hS6YX0hWPjRbcI/Ft3pJR6eoNIq+xMlOq5P4zHGR2U5ZbWRuy8keEqlmV6hl2
	 5nwrPMoI4XnXPc6kPQjPYIBtvo0vQUusOyOnyWQoZ7gf81XiCDSzifpQPlbhGVLx1B
	 cbeL5Tx2yV2fc97Qs5+dSZ88oldFnyap52FDkTiDde+qDDrNNL47V9cud7Dek2hOTD
	 QJuoW6l/EwdzQ==
Message-ID: <sashiko-outbox-174487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] iio: light: gp2ap002: add led power supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christoph Rudorff" <chris@rudorff.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-iio-light-gp2ap002-v1-1-7c93312fa8d5@rudorff.com>
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-1-7c93312fa8d5@rudorff.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:48:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: light: gp2ap002: memory/resource leak of vled regulator in =
error paths
- [Medium] iio: light: gp2ap002: incorrect regulator disable order violates=
 hardware teardown sequencing
--

commit 377213d2096a5527d0fa1ddbd0a74bf96e0940f2
Author: Christoph Rudorff <chris@rudorff.com>

iio: light: gp2ap002: add led power supply

This commit adds a missing VLED power supply to the gp2ap002 driver.
It initializes the vled regulator and handles its enable and disable paths
in the probe, remove, suspend, and resume functions.

> diff --git a/drivers/iio/light/gp2ap002.c b/drivers/iio/light/gp2ap002.c
> index de29081fd3b20..c03eb0f1988bc 100644
> --- a/drivers/iio/light/gp2ap002.c
> +++ b/drivers/iio/light/gp2ap002.c
[ ... ]
> @@ -560,6 +570,11 @@ static int gp2ap002_probe(struct i2c_client *client)
>  		dev_err(dev, "failed to enable VIO regulator\n");
>  		goto out_disable_vdd;
>  	}
> +	ret =3D regulator_enable(gp2ap002->vled);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VLED regulator\n");
> +		goto out_disable_vio;
> +	}
> =20
>  	msleep(20);

[Severity: Medium]
When gp2ap002_init() or devm_request_threaded_irq() fail further down in
gp2ap002_probe(), the code jumps to out_disable_vio or out_put_pm. However,
the error handling block only disables the vio and vdd regulators.

For example, when initialization fails:

	ret =3D gp2ap002_init(gp2ap002);
	if (ret) {
		dev_err(dev, "initialization failed\n");
		goto out_disable_vio;
	}

Does this regression leave the newly added vled regulator permanently enabl=
ed,
leaking its enable count? Should we add an out_disable_vled label that
disables the vled regulator?

[ ... ]
> @@ -635,6 +650,7 @@ static void gp2ap002_remove(struct i2c_client *client)
>  	iio_device_unregister(indio_dev);
>  	regulator_disable(gp2ap002->vio);
>  	regulator_disable(gp2ap002->vdd);
> +	regulator_disable(gp2ap002->vled);

[Severity: Medium]
In gp2ap002_probe(), the regulators are enabled in the order: vdd -> vio ->
vled. To prevent powering peripherals while the core logic is unpowered
(which could lead to backpowering or leakage currents), should the teardown
occur in the exact reverse order?

Disabling them here as vio -> vdd -> vled seems to violate that sequence.

>  }
> =20
>  static int gp2ap002_runtime_suspend(struct device *dev)
> @@ -659,6 +675,7 @@ static int gp2ap002_runtime_suspend(struct device *de=
v)
>  	 */
>  	regulator_disable(gp2ap002->vio);
>  	regulator_disable(gp2ap002->vdd);
> +	regulator_disable(gp2ap002->vled);

[Severity: Medium]
As noted above in gp2ap002_remove(), does this disable sequence regression
also violate the hardware teardown ordering by disabling vled last instead
of first?

> =20
>  	return 0;
>  }
> @@ -679,6 +696,11 @@ static int gp2ap002_runtime_resume(struct device *de=
v)
>  		dev_err(dev, "failed to enable VIO regulator in resume path\n");
>  		goto out_disable_vdd;
>  	}
> +	ret =3D regulator_enable(gp2ap002->vled);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VLED regulator in resume path\n");
> +		goto out_disable_vio;
> +	}
> =20
>  	msleep(20);

[Severity: Medium]
If gp2ap002_init() fails later in gp2ap002_runtime_resume(), the code jumps
to out_disable_vio:

	ret =3D gp2ap002_init(gp2ap002);
	if (ret) {
		dev_err(dev, "re-initialization failed\n");
		goto out_disable_vio;
	}

Similar to the probe function, does this regression leak the enable count
for the vled regulator, since it is not disabled in the error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-iio-light-=
gp2ap002-v1-0-7c93312fa8d5@rudorff.com?part=3D1
