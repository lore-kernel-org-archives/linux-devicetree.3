Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5FD3890F1
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128085; cv=none; b=Pqzoizk0tf1dhPCuc0Tkn470ij1TBBp/0O/7wnpc7kIABoBEqXUAKSLiZbo6X06PvBp4ajPVHlzihUTck3WK3ZSzmVwazAYgiBiSjoum8yEBDV2LmYapyuYfZgh/Rx2Wo8+kwcrkxmSqhmcrx1J5yTZ2FrYLdygV1blMa78B6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128085; c=relaxed/simple;
	bh=hN++/kjn1DcE87NGUmQ6qeRZqph+9qFhO1yeRtSTbU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T867HAe6L9TjBFtU2JzkEzd7iiATjRh043+rQwajJMsoYwAGGWocMQzPtwbHsSobB8Meogs2ZgSmaamO0MvpC3PTFjjifEP5xRT5lef4XNp0ZRvzBEzVKiOIOJIH3Xyfzm90kQcgUt8UcWRR3Z+5i0un45YLe80qaRj/dVXxTmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ad9LeukB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ad9LeukB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A971F000E9;
	Wed, 19 Aug 2026 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787128084;
	bh=Na2OWT+pngk8rHxIi+lOqxxN8CRnQFK0BDckFOwKFG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ad9LeukB86DYqleaTK7POYt5WIfeWgoxDN0ZLGCOlX3wSaSJOeVRX1Nf+EXh06WPO
	 b4NrGbz1zLqdCZpSISX+D297+3tjUCtFcXrrMgs+tmqmjBnpW9JIRMYa1b38HV0lcY
	 jfb3qz6+jbmZkplxpZo9GVebz+CV1H/EvqwBEBD8moX/MaQmAq7N8Ml3QNhVynzGND
	 S7fo3XvT9o1+ZRm1YrYvG2fMWtrlMTWZccI/U8zmfw0XVPr6239y/gCQ8KxIcQxdrJ
	 olmWPkvz7fAoerqMkEpUc4DNFu0ebBybKnzLJUZMwHZ0wDptnU+/V59zC4YJo+ll5l
	 ECoicDP0eweCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5 6/6] iio: accel: mma8452: Reuse existing dev
 pointer in mma8452_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819-mma8452-open-drain-v5-6-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
 <20260819-mma8452-open-drain-v5-6-d8aa590d7c36@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:28:03 +0000
Message-Id: <20260819082804.22A971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Compilation Error in mma8452_runtime_suspend() due to undeclared id=
entifier 'client'.

Pre-existing issues:
- [High] Missing pm_runtime_disable() in mma8452_probe() error paths leads =
to a guaranteed NULL pointer dereference in the autosuspend callback.
--

--- Patch [6]: [PATCH RESEND v5 6/6] iio: accel: mma8452: Reuse existing de=
v pointer in mma8452_probe() ---
commit 004c22b83c7e1b63662958bd7b1a838d3015cf83
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Reuse existing dev pointer in mma8452_probe()

In commit 32a5c04d4575 ("iio: accel: mma8452: Use dev_err_probe()") the
struct device * pointer was assigned to local variable dev, so we can just
as well reuse that throughout the function for sligthly more readable code.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 060a6207e52d0..bf5cb1c4425a3 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1731,14 +1730,13 @@ static int mma8452_probe(struct i2c_client *clien=
t)
>  			goto buffer_cleanup;
>  	}
> =20
> -	ret =3D pm_runtime_set_active(&client->dev);
> +	ret =3D pm_runtime_set_active(dev);
>  	if (ret < 0)
>  		goto free_irq;
> =20
> -	pm_runtime_enable(&client->dev);
> -	pm_runtime_set_autosuspend_delay(&client->dev,
> -					 MMA8452_AUTO_SUSPEND_DELAY_MS);
> -	pm_runtime_use_autosuspend(&client->dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, MMA8452_AUTO_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> =20
>  	ret =3D iio_device_register(indio_dev);
>  	if (ret < 0)

[Severity: High]
This is a pre-existing issue, but if mma8452_probe() fails here, is there a
missing pm_runtime_disable() in the error paths?

If mma8452_probe() fails after enabling PM runtime (for example, during
iio_device_register()), it returns an error without disabling PM runtime or
autosuspend. The driver core cleans up the device and clears its driver data
via dev_set_drvdata(dev, NULL), and queues an idle notification.

Because PM runtime is still active, this triggers the autosuspend timer.
When the timer expires, the autosuspend callback executes:

drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
    struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(dev));
    struct mma8452_data *data =3D iio_priv(indio_dev);
    ...
}

Does this lead to a reliable NULL pointer dereference when iio_priv()
dereferences the cleared driver data?

[Severity: Low]
Also, looking at mma8452_runtime_suspend(), does the module fail to compile
when CONFIG_PM is enabled due to an undeclared identifier?

The code attempts to call synchronize_irq():

drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
    ...
    synchronize_irq(client->irq);
    ...
}

Since client is not declared in the scope of mma8452_runtime_suspend(),
should this access data->client->irq instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mma8452-op=
en-drain-v5-0-d8aa590d7c36@geanix.com?part=3D6
