Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF73E51EC
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647085; cv=none; b=PRstEeiY/LL8PY/Of2XnEHidwogzgPnNMWuwXiTA25STC4xZu161EroLC+3ybD9bD6k8KIjPOi5SoXmBrQij4NfsGE3eMK51ajztGpOrojnN89mA4WMASH4ca8lhnJD/NRvYmMBif5+kEs6n3mnwTSTnK2fsSEFNeQDiqOFEeJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647085; c=relaxed/simple;
	bh=6iGwC4biJppGYQXxot5SmJIscY8KkrzqhfvuB/XeDAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UIxUIt1Waewokwh5OhMrXUoUKsq+ufEsB/TXGGIEyhx2CvsTYumVhQEJG6YpuW6UqKCrIQ1Au9F2AwruRAsAPpZFaYp3SUwPK323lNOnD7b+fM/UhCzrdsMNi6FnP2QB2CXF7bcMpJP5Susn7BqG3OCyeP4+cg3IwwTyKxMNxsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7wMT6Zg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7wMT6Zg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D821F000E9;
	Tue, 25 Aug 2026 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647083;
	bh=7hPtKzAdXir2w4Yxrzdv0jDetKSqdY9uDw44Eh0ftIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f7wMT6Zg3S07cpDkVpNTqsCysqBz4cWJsysDq5FdohFh8QgmlF7Smhg5MCay5bOO3
	 fMOIHIqpqCHrYwZiKrzTxAGoHlljB4jTRtCeoKnB8T7SbGjJQ7zP2AHtNGM0cltJXk
	 26QtpPpx/M63meKAAq7TTUwIF7B/rMVOsTenxG/hDPLo3TH8cQNZS7MZSSmX83OihS
	 /+X7+oA0rCFasqoPduN8FBed4GopPN3qmUGJcZ9pVgKHClUdvGcp4Le/mPTzhuEb4K
	 q0vVuB2Vt/TkxGtnhxvxT47bpu/mwl0/hYf2zOx0GTv6uRECf5N5FF0AUacDlywUZw
	 L0sBO0u+4h0sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] iio: accel: mma8452: Reuse existing dev pointer
 in mma8452_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-6-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-6-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:38:02 +0000
Message-Id: <20260825083802.C3D821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Undocumented scope modification and suboptimal pointer dereferencin=
g.

Pre-existing issues:
- [High] Device teardown accesses powered-off hardware and causes unbalance=
d regulator disables.
- [Low] Unconditional assignment of PM callbacks causes dead code when PM i=
s disabled.
--

--- Patch [6]: [PATCH v6 6/9] iio: accel: mma8452: Reuse existing dev point=
er in mma8452_probe() ---
commit 04da87f5e80c506bb658d3dd5161087ce55fa6b0
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Reuse existing dev pointer in mma8452_probe()

This commit refactors mma8452_probe() to use a local 'dev' variable instead
of repeatedly referencing &client->dev. It aims to improve code readability.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index d1e8eb2a4ad3a..7ef1a9a91c31f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1801,7 +1799,8 @@ static void mma8452_remove(struct i2c_client *clien=
t)
>  #ifdef CONFIG_PM
>  static int mma8452_runtime_suspend(struct device *dev)
>  {
> -	struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(dev));
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>  	int ret;
> =20
> @@ -1809,7 +1808,7 @@ static int mma8452_runtime_suspend(struct device *d=
ev)
>  	ret =3D mma8452_standby(data);
>  	mutex_unlock(&data->lock);
>  	if (ret < 0) {
> -		dev_err(&data->client->dev, "powering off device failed\n");
> +		dev_err(&client->dev, "powering off device failed\n");

[Severity: Low]
The commit message states the changes are restricted to reusing the dev
pointer in mma8452_probe(), but this modifies mma8452_runtime_suspend().
Should the commit message be updated to reflect this scope change?

Also, since the function already receives a struct device *dev parameter,
and &client->dev evaluates to that exact same pointer, wouldn't it be=20
simpler to use dev directly here rather than dereferencing client?

>  		return -EAGAIN;
>  	}


As a related note, looking at the device teardown path in mma8452_remove():

static void mma8452_remove(struct i2c_client *client)
{
[ ... ]
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);
[ ... ]
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
}

[Severity: High]
This is a pre-existing issue, but does this teardown sequence access
potentially powered-off hardware?

If the device is in the RPM_SUSPENDED state when remove() is called, its
regulators have already been disabled by mma8452_runtime_suspend(). The
call to mma8452_standby() attempts an I2C write to the powered-off device,
which might hang the I2C bus or cause transaction timeouts.

Furthermore, unconditionally calling regulator_disable() drops the usage
counts below zero, triggering a kernel warning for unbalanced disables.

Should pm_runtime_get_sync(&client->dev) be called at the beginning of
mma8452_remove() to ensure the hardware is active before teardown?


Finally, regarding the PM ops assignment in the driver struct:

[Severity: Low]
This isn't a bug introduced by this patch, but does the unconditional
assignment of &mma8452_pm_ops to the .pm field in mma8452_driver produce
dead code when CONFIG_PM is disabled?

According to the power management subsystem guidelines, this pointer should
be wrapped in pm_ptr(&mma8452_pm_ops) to allow the compiler to eliminate
the dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D6
