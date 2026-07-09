Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442E9409621
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596984; cv=none; b=O/qfhzQbZi4Hh+oEdSfafe6CiZmwguykB0ljsocZYu0iv+gY++wtiI7z5t0wkse73gkRZtosvKKDG6iLdEuFX79If3yJr9Rh67GiTl2LhakAhh0zN4Yr8KgM6tPdUgBmfBPi16GEtrVGujWGYO9TghKrw5KT1+iwTYHFbZ3lajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596984; c=relaxed/simple;
	bh=xKZEmyZu9Y9cpo74ospJLtmKHPQOp+wUnutK1heavQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FU8riBkHaRKltfawEmuNzeGgXE6r1Lg/vmmVf4AdT/VDrC534avip/eqWFRrGQkjHBQxO9I6rfcczxJ7rvX9EKMcZ8/rV4jivzTNGPtYH1wVOdBRz0Av5awvQ6Hjo0DfAjmbxMKc/NKCJzSvsPiG+GGonKcI8Sn1n2JRnsQqcTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byGOcZpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byGOcZpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A711F000E9;
	Thu,  9 Jul 2026 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596982;
	bh=Xwavw6H9srfS4F1wLwUniKgklr1yuXy+Jz6u9OEBiWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=byGOcZpj4hTAnO8N+LPpdlaPAMyrVi3waET3LVDSqCHelGIlOxuM9f1TvMPlkQ5Um
	 4ovOnG5tMf/ArBc4+QRK5Y0trSsCFKjevaelPntkrr9Qx9ZVSoXCPgzAc1Woiw7nGL
	 uF5k0xxozQD/eKSwmsnhZCZ4AM4aWyA7y0pRrEyfU9NRFmU8Z40jGvVCIj0ki2HZUv
	 Sf5DdxcdGnyvdWBYddDsLyTktJfz81Pj1jMCJF8G0sKsWt1YwCSQe7R0IJR8b5u5QJ
	 USctbgWLYzDf/im28VJ5ps9Jre7wC60L6fqNMWrTl89D8moxOcTOp2iJ58EEQGRWVb
	 YALgq//Uc2wGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Add ITE IT885x Type-C PD
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-ucsi-itepd-feature-v3-2-8523e1e1c47a@ite.com.tw>
References: <20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw>
 <20260710-ucsi-itepd-feature-v3-2-8523e1e1c47a@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:36:22 +0000
Message-Id: <20260709113622.89A711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The I2C read buffer uses an unaligned pointer `buf + 1`, which vio=
lates DMA API constraints and can cause warnings or memory corruption if th=
e I2C master uses DMA.
- [Medium] Un-ratelimited dev_err() in I2C accessors defeats the rate-limit=
ing strategy in the IRQ handler, leading to a log storm during persistent I=
2C failures.
--

--- Patch [2]: [PATCH v3 2/2] usb: typec: ucsi: Add ITE IT885x Type-C PD co=
ntroller driver ---
commit 1c3b27c040c8a8858b0730cebf73ad5bfc62f517
Author: Amber Kao <amber.kao@ite.com.tw>

usb: typec: ucsi: Add ITE IT885x Type-C PD controller driver

This patch adds core UCSI support for the ITE IT885x USB Type-C Power Deliv=
ery
controller over I2C.

Link: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v2-0-41943fd5=
df38@ite.com.tw/
Link: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0=
df6a@ite.com.tw/

> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi=
/ucsi_itepd.c
> new file mode 100644
> index 0000000000000..539818869ab73
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c

[ ... ]

> +static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 l=
en)
> +{
> +	struct i2c_client *client =3D itepd->client;
> +	struct i2c_msg msg[2];
> +	u8 *buf;
> +	int ret;
> +
> +	/* I2C buffers must be DMA-safe, so no stack memory here. */
> +	buf =3D kzalloc(len + 1, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	buf[0] =3D reg;
> +
> +	msg[0].addr     =3D client->addr;
> +	msg[0].flags    =3D 0;
> +	msg[0].len      =3D 1;
> +	msg[0].buf      =3D buf;
> +
> +	msg[1].addr     =3D client->addr;
> +	msg[1].flags    =3D I2C_M_RD;
> +	msg[1].len      =3D len;
> +	msg[1].buf      =3D buf + 1;
                        ^^^^^^^

[Severity: High]
Does this violate DMA alignment requirements?

Since buf is allocated with kzalloc(), it is aligned by the slab allocator,
but buf + 1 is unaligned. If the I2C host controller uses DMA for transfers,
mapping an unaligned address can cause memory corruption, data shifts, or
trigger warnings in dma_map_single() on architectures with strict DMA
alignment requirements.

> +
> +	mutex_lock(&itepd->i2c_lock);
> +	ret =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	mutex_unlock(&itepd->i2c_lock);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "reg 0x%02x read failed: %d\n", reg, ret);

[Severity: Medium]
Can this cause a log storm during an I2C failure?

If the I2C bus fails and the IRQ line remains asserted, itepd_irq_process()
will repeatedly call this function. Because this error print is not
rate-limited, it defeats the dev_err_ratelimited() check in the caller and
will spam the console before the core IRQ subsystem has a chance to disable
the spurious interrupt.

> +		goto out_free;
> +	}

[ ... ]

> +static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data=
, u32 len)
> +{

[ ... ]

> +	mutex_lock(&itepd->i2c_lock);
> +	ret =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	mutex_unlock(&itepd->i2c_lock);
> +
> +	if (ret < 0) {
> +		dev_err(&client->dev, "reg 0x%02x write failed: %d\n", reg, ret);

[Severity: Medium]
Similarly, can this also cause a log storm if the I2C bus fails during the
write in the out_clear path of itepd_irq_process()?

> +		goto out_free;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ucsi-itepd=
-feature-v3-0-8523e1e1c47a@ite.com.tw?part=3D2
