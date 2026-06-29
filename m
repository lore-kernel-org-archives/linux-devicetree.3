Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8354915746F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726397; cv=none; b=iMbGXxphoT0Kut8dKH4wwgvMyHk/6TJUU2lVRPvKMFadW3Qc76AP/StFRlZmt776T+Mhw3FbFcrKRkw/KRFdwKAw+ny8HpweO5I2YdxOJu+kLLqih+V9F1vxIPRFwmddzCXKHRpRVJhPHQD1T7pLZM5chlYucPZYMqDo+AbR8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726397; c=relaxed/simple;
	bh=LYTJC+vPGauKEpp4o54N5cxjuIvuLt2BeVICg5U8E5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CRceUqCvJUHlli1ywayekunECs49ikuJ7+C/Y30JHKVAYPqpNIIlLklSW3zvAeEcVhow3YawjOKzw/kCSvUXowIZoyBV44bgDPZUXk/nsjHTpZ0Y8sK8diudIe6Snb8Vi7kZRpCn7bSfpD7iTJK9Jq77JjTPGHq0/0MreUsTTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CI6Jp7BB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CI6Jp7BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C7C1F000E9;
	Mon, 29 Jun 2026 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726396;
	bh=vTfaRO0O+EoSSgx3wjKo0Drw4ZNRS7c0IZDEV4C2oW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CI6Jp7BBoh2pKc71ItdrOaspn8n+otgS2RoZqhqOVkVKVjRP9ZVFEX4ypwltESm73
	 SXValJYPV+7qdHZkBhg1T4n4Z3GpHaqOCVBeXlucdyRy8DVV4UjNgQPgO8ffXwDa1K
	 ko77fuLgsnFJ5PM4O75VD1JiYtG99ykqH5u8nRl2AoRA+FXNZBPxP97uJmahvO+Ypi
	 VUuJZdBCyDKWg2lxyO/aa77nduqXACXoTFGHXecun9d2m2//A+vk3Q6NYzo6L6qV90
	 4YUZ6OwfFO61FK0M40DZSeAYfuhVjk6n7AfkrCRu1bHalkETZR3oYM8vDRmaHbEk6c
	 02SdeW9nU1WGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] phy: tegra: xusb: Use devm_clk_get_optional to
 fetch USB2 tracking clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629093406.1118594-5-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
 <20260629093406.1118594-5-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:46:35 +0000
Message-Id: <20260629094635.B2C7C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free of pad allocations on `tegra_xusb_pad_init()` failure =
due to incorrect device cleanup.
- [High] Kernel panic due to NULL pointer dereference in `tegra_xusb_port_r=
elease()` when port initialization fails.
--

commit 9a7eb66c6206c1b8eab420ee00c7a1d273a708fe
Author: Sing-Han Chen <singhanc@nvidia.com>
Subject: phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking=
 clock

This patch switches the USB2 tracking clock retrieval to use
devm_clk_get_optional. This allows the probe sequence to proceed safely
when the clock is omitted from the devicetree.

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 60156aea27071..800be0cbb3f9f 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -1045,7 +1045,7 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *p=
adctl,
>  		goto out;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does the error path for
tegra_xusb_pad_init() just above this change cause a double free?

Looking at tegra186_usb2_pad_probe(), if tegra_xusb_pad_init() fails, it
calls kfree(usb2).

However, inside tegra_xusb_pad_init(), an error causes it to jump to the
unregister label and call device_unregister(&pad->dev). This drops the
device reference and invokes the release callback tegra_xusb_pad_release(),
which frees the pad object.

When tegra_xusb_pad_init() returns the error back to the probe function, the
explicit kfree(usb2) is executed. Could this lead to memory corruption when
initialization fails?

> =20
> -	priv->usb2_trk_clk =3D devm_clk_get(&pad->dev, "trk");
> +	priv->usb2_trk_clk =3D devm_clk_get_optional(&pad->dev, "trk");
>  	if (IS_ERR(priv->usb2_trk_clk)) {
>  		err =3D PTR_ERR(priv->usb2_trk_clk);
>  		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);

[ ... ]

[Severity: High]
This is another pre-existing issue in a related file, but does
tegra_xusb_port_release() trigger a NULL pointer dereference on
initialization failure?

In drivers/phy/tegra/xusb.c:tegra_xusb_add_usb2_port(), the port is
allocated via kzalloc() and then initialized:

    err =3D tegra_xusb_port_init(&usb2->base, padctl, np, "usb2", index);
    if (err < 0)
        goto out;

    usb2->base.ops =3D padctl->soc->ports.usb2.ops;

Notice that the ops pointer is assigned after initialization completes.

If tegra_xusb_port_init() fails, it drops the device refcount and calls
tegra_xusb_port_release(). That release function attempts to evaluate the
ops pointer:

    if (port->ops->release)
        port->ops->release(port);

Since port->ops is not yet assigned during the init error path, it will
still be NULL from the kzalloc() allocation. Could this cause a panic when
initialization fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629093406.1118=
594-1-waynec@nvidia.com?part=3D4
