Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BDC3E00AA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420727; cv=none; b=OV6Sz1HzwIsGqbxvwguc6jhcWkKSj63jicRUGdesXpuYCbtL6w5C2e28tekL6C31Y584AJvs+UmiKu6m8c6aS41gCJ/tZbgaqoMoudrnC4hS7f480PS2F9a3W+OJGYeyADuR/t1KDoWu1uyOZVHMRFwHd/31zEt8YxTEsEJQ9Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420727; c=relaxed/simple;
	bh=LM5FxsXy+2j94sg9iy52ApIkpuMhKMHVt/RY7BurKZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HLjg3zuHRsHZg6jdswtMzN39x8YKrWl08YoKxGQiU4cBfVSIrjYrWqeyVPahRBAlo2LUgcti81dTMMAySbThrjm33GF2HMpXTIIEbEm8ud5fC4K4HAKWvjasrXbLIcMbc2hDGs/yTIvK7F8gx9+8VG7Ulvfcb73Mh6HtL6Hzmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fefl/jn4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fefl/jn4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FF51F000E9;
	Thu,  3 Sep 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788420725;
	bh=unjdYpdNbIjkmO2l1kSqrflzUfV/ZXZX7I9YEQBi3g8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fefl/jn48uateB0OyTUFqwvmNgdYAysbhW6JhhkJnKHKfLZtk3+WwTfHBT2vgox8T
	 GeM6jtlrsgLKhB/HvjphqALyEVfXTLXI8GX20BXU3z7sUOstpE5ZY1f4sED9rMR6Lw
	 LzeuqGWl3znkBKrEGYSq48Ppx7BrgOmZA3ExvFEocbtOpQUx8yeoEy4HnEctgIgWkk
	 be4d/2oMc+Q+QrVs7c+QYy9QWco064vGTbOEYttFEAFID9+wuhM5U8xR0x/C6r/JYW
	 XBAeNwIzBUPD1nlLJgIOdSQhHU53iQqTCnvkzONTaiIZRm8uMXuMYsgjb92+AZ3FjE
	 SFXIQvDP+fJfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/4] phy: tegra: xusb: Use devm_clk_get_optional to
 fetch USB2 tracking clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260903071937.533646-3-waynec@nvidia.com>
References: <20260903071937.533646-1-waynec@nvidia.com>
 <20260903071937.533646-3-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:32:04 +0000
Message-Id: <20260903073204.D2FF51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double-free of the `usb2` pad structure when `tegra_xusb_pad_init(=
)` fails.
- [High] Invalid `device_unregister()` call on `device_add()` failure path.
- [High] NULL pointer dereference and memory leak in `tegra_xusb_port_init(=
)` error path.
--

commit cbc965ddabaa3e83cea8e6b268dbf34122daa3cd
Author: Sing-Han Chen <singhanc@nvidia.com>

phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking clock
   =20
The USB2 PAD tracking clock is an optional clock so use
devm_clk_get_optional() so a missing clock in devicetree is
represented as NULL and probe can continue. clk_prepare_enable()
and clk_disable_unprepare() already treat a NULL clock as a no-op.

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 60156aea27071..800be0cbb3f9f 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -1045,7 +1045,7 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *p=
adctl,
>  		goto out;
>  	}
> =20
> -	priv->usb2_trk_clk =3D devm_clk_get(&pad->dev, "trk");
> +	priv->usb2_trk_clk =3D devm_clk_get_optional(&pad->dev, "trk");
>  	if (IS_ERR(priv->usb2_trk_clk)) {

[Severity: High]
This isn't a bug introduced by this patch, but is there a double-free of the
usb2 pad structure if tegra_xusb_pad_init() fails?

Looking at tegra186_usb2_pad_probe() just above this change:

drivers/phy/tegra/xusb-tegra186.c:tegra186_usb2_pad_probe() {
	...
	err =3D tegra_xusb_pad_init(pad, padctl, np);
	if (err < 0) {
		kfree(usb2);
		goto out;
	}
	...
}

If device_add() fails inside tegra_xusb_pad_init(), it calls
device_unregister(), dropping the device reference count to zero and
triggering the release callback, which eventually calls
tegra186_usb2_pad_remove() and frees usb2. Does the explicit kfree(usb2)
here result in freeing the same pointer twice?

[Severity: High]
This is a pre-existing issue, but does tegra_xusb_pad_init() call
device_unregister() incorrectly on its failure path?

drivers/phy/tegra/xusb.c:tegra_xusb_pad_init() {
	...
	err =3D device_add(&pad->dev);
	if (err < 0)
		goto unregister;

	return 0;

unregister:
	device_unregister(&pad->dev);
	return err;
}

If device_add() fails, the device was never added to the system. Does
calling device_unregister() (which executes device_del() before
put_device()) attempt to tear down sysfs entries that were never created,
potentially leading to kernel warnings or crashes? Should it call
put_device() instead?

[Severity: High]
This is a pre-existing issue, but is there a NULL pointer dereference in the
error path for port initialization?

drivers/phy/tegra/xusb.c:tegra_xusb_add_usb2_port() {
	...
	err =3D tegra_xusb_port_init(&usb2->base, padctl, np, "usb2", index);
	if (err < 0)
		goto out;

	usb2->base.ops =3D padctl->soc->ports.usb2.ops;
	...
}

If tegra_xusb_port_init() fails (e.g., due to device_add() failing), it rol=
ls
back by dropping the device reference, triggering the port release callback:

drivers/phy/tegra/xusb.c:tegra_xusb_port_release() {
	struct tegra_xusb_port *port =3D to_tegra_xusb_port(dev);

	if (port->ops->release)
		port->ops->release(port);
}

Since port->ops is only assigned after tegra_xusb_port_init() returns
successfully, it will be NULL during the failure rollback. Does the
unconditional dereference of port->ops in tegra_xusb_port_release() lead to
a kernel panic?

>  		err =3D PTR_ERR(priv->usb2_trk_clk);
>  		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903071937.5336=
46-1-waynec@nvidia.com?part=3D2
