Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F15F2853F3
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278539; cv=none; b=X5BBcrzX9JZxHDHZe4WkDLPiqcxf8DydiFxA4j/JFcN6Qo0fQkATF765tkh3Zayp2E0mcgDufP58HQbpbEoiyg10/CAP6ErFX2CmpocDwSjf+3lXVA3zIVwoYrS1fmR9/HtkNN8mEUJKA9uIodyqzb4BXcALJXQuiQmnyNasxrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278539; c=relaxed/simple;
	bh=V6bbj130oQlutGuyq12ItMdXRLHCfnb0ZpDM2wz7c+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ac/A3qaCGz/ItGDXVd3lyeJOH7kZglZyBQiN7bd3dFSq7csxg5U+phC2UIq8AFEyPUzKotk+BzuTdQPQscSobwpwbvgTteCBDXfU7sd8oEEleTcUqMFhqFVz3qWx3Kd5zKdaUGS6eM7HiLVuxTFVWN3MJ71Fc3tJ3Y7bh8Kb9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjvvaHIA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjvvaHIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571311F000E9;
	Sun,  9 Aug 2026 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786278537;
	bh=ZsFgZreYUzm2ZJAW77XVXRfwUcwLBXjg1jqqD4hRe70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LjvvaHIAMSuDDXOqwNCvVBmjbc65FaurQ3cuK15IAWCiK3hncGi6wV7FulNXkzdLd
	 SShgXuqTJBrfi9Lbe4mM8Ew6y8pHSZdhrI0KxHbODVhOZpEZ+JLraeb9sGj28Ck+bU
	 rl5C+fmawph4y2Nu/f8mQMR3UuuXasvP+W95v96Lei/O5908cjEXpfCU11IYnbM70z
	 nSiYkCrGL4Tv54LUpryH3wDgI5Ytv4z9Uk29MDpBt0dPAMAS+mpk98ToYQh09VxGrI
	 FpmWriOhAFyjowOYz9VBVhMbojMOOfnjc7riyyJ163ujeFNr31NIy4Bm3fpuRmp+yG
	 fPxByruWbgQEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:28:56 +0000
Message-Id: <20260809122857.571311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Race condition in `t6000_cio_deassert()` polling logic allows prem=
ature success before hardware busy assertion.
- [Medium] Unchecked return value of `of_device_get_match_data()` leads to =
NULL pointer dereference on manual sysfs bind.
- [Medium] Shared register overwrite in `t6000_cio_deassert()` via `regmap_=
write()`.
--

--- Patch [2]: [PATCH 2/3] reset: Add Apple SoC CIO reset driver ---
commit b460799e8ebb76e6526aa8a4370ed4331dbda4b0
Author: Sven Peter <sven@kernel.org>

reset: Add Apple SoC CIO reset driver

Adds a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
Apple Silicon SoCs which has to be deasserted before their co-processor
can be booted.

> --- /dev/null
> +++ b/drivers/reset/reset-apple-cio.c

[ ... ]

> +static int t6000_cio_deassert(struct apple_cio_reset *priv, unsigned lon=
g id)
> +{
> +	u32 val;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret =3D regmap_write(priv->regmap, priv->offset, T6000_CIO_CTRL_INIT_RE=
Q(id));

[Severity: Medium]
Will this regmap_write() overwrite the state bits of all sibling ports?

Because the t600x variant uses a single shared register for all ports,=20
writing the entire 32-bit register might write 0 to the INIT_REQ bits
of previously initialized ports. Should this use regmap_update_bits()=20
instead to preserve active state?

> +	if (ret)
> +		return ret;
> +
> +	return regmap_read_poll_timeout(priv->regmap, priv->offset, val,
> +					!(val & T6000_CIO_CTRL_INIT_BUSY(id)),
> +					APPLE_CIO_RESET_POLL_US,
> +					APPLE_CIO_RESET_TIMEOUT_US);
> +}

[Severity: High]
Could this polling loop exit prematurely before the hardware begins=20
initialization?

Since regmap_read_poll_timeout() (without sleep_before_read) performs=20
its first read instantly, any hardware synchronization delay might cause=20
the first read to see the INIT_BUSY bit as 0 (its pre-assertion state).=20

This would cause the driver to report success before the hardware actually=
=20
starts the reset process. Is it possible to ensure the BUSY bit is=20
asserted first, or add a preliminary read delay?

[ ... ]

> +static int apple_cio_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct apple_cio_reset *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->variant =3D of_device_get_match_data(dev);
> +
> +	ret =3D devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (priv->variant->pmgr_child) {

[Severity: Medium]
Can priv->variant be NULL here if the driver is bound manually via sysfs?

If a user writes "apple-cio-reset" to the driver's bind file without an
associated Device Tree node, of_device_get_match_data() will return NULL.=20
The probe function then immediately dereferences it for pmgr_child, causing=
=20
a kernel oops. Should we add a check for !priv->variant before continuing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-b4-cio-res=
et-v1-0-4f33777d9b4b@kernel.org?part=3D2
