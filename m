Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C053F44E4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963954; cv=none; b=gUiXQ7x3LR4OzrVil+8oabXEWRBuUNXhxV3HSCH5yEuApXT2Dzxgvzx67YZPCAumY+tyuyRTUQKLwMfV46baojDOCig0XBiiJeHufLfYJeQ89ISDZxlrDPVt86hisX1y3OMh3hoLbBsmb/cmMSotVpDqigyM/dpSspKGQ5FWsDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963954; c=relaxed/simple;
	bh=xTsLFkIyjrNnuLbo+GJTlygAqgaMfHfvz0fzT2vVkfU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=COc/u4L6rrViptEx/HihyiYygmqC5WR9GEJnXJmsJ1M5Lz2/+nMU2TnjRMRi7ADFuEXr1ELMID2T8M2MxaSj5QmDhOvQRKAyGQ+JsJK6S0da/ryTOWSOO91/VYEJQ2u6DEIE/mQa8ixHzJP2U0Q40QEjIDg8r4v+yH7fZl2LkFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/QcQsyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/QcQsyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7C51F000E9;
	Mon, 17 Aug 2026 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963948;
	bh=bCSvz4f0qOkxbV7xpUB9QaAYzxqgTnFcQeCKESvCp+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/QcQsyGB09d9EFM+E7kOtP7/fIfsFnKcr4CEI0S0feV0NX5ekPN8WNmEu9AqtI4Q
	 mnhwG7hj4ivJniACfQ3+C2KISuDEOVOkQ4qGEQoALX5wLM28SKmL/cSsCA67o9SM0q
	 OMyI2VIiq414vF9rrUreeEDvF93Y+uA4piRrZNM9BzhUHAkFpWX5yS1q2VVlTprYUN
	 XR87+g3x5bt3Yb1ZAc2aMzzADWIgKnUNArKrpqFujiLhjdm1PUJkdpy51b+z/qqIpz
	 ZT4AURBMBr+XV9xIfIwAbBIzeo6PnqJiAvZgwzxwhbg0FtDAbiOZ8S2oR4WNrEdLtk
	 07+10cS5MXyxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260817103844.2142802-5-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:52:27 +0000
Message-Id: <20260817105228.4D7C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Driver-specific shared header `p3h2840.h` is improperly placed in t=
he global `include/linux/mfd/` directory instead of being local to `drivers=
/mfd/`.
- [Low] `struct i2c_device_id` array uses a positional initializer instead =
of a named initializer.
--

--- Patch [4]: [PATCH v15 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c=
 hub and on-die regulator ---
commit b12649d8bd1516b7d9cfa69f8a2a7bc8f4a10164
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport
I3C hub devices. It provides driver support using both I3C and I2C
communication interfaces, allowing sub-drivers to be enabled independently.

> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 0000000000000..6c497d84e2bda
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
[ ... ]
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] =3D {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> +
> +static const struct i2c_device_id p3h2x4x_i2c_id_table[] =3D {
> +	{ "nxp-i3c-hub" },

[Severity: Low]
Does this code use a positional initializer instead of a named initializer?

According to I2C subsystem guidelines, initialized arrays of type
struct i2c_device_id must use named initializers (e.g., .name =3D "nxp-i3c-=
hub").

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
[ ... ]
> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 0000000000000..eb4792de5440e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
[ ... ]
> +struct p3h2x4x_i3c_hub_dev;
> +
> +struct p3h2x4x {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;

[Severity: Low]
Is it necessary to place this driver-specific shared header in the global
include/linux/mfd/ directory?

The MFD subsystem guidelines recommend keeping driver-specific header files
local to drivers/mfd/ if they are only used by the parent and its immediate
children.

> +	/* Number of downstream target ports (4 or 8). */
> +	u8 num_target_ports;
> +	/* Serializes protected register unlock/lock sequences across MFD child=
ren. */
> +	struct mutex protected_reg_lock;
> +	/* Hub context for the IBI handler to reach hub state via the parent i3=
cdev. */
> +	struct p3h2x4x_i3c_hub_dev *i3c_hub_priv;
> +};
> +#endif /* _LINUX_MFD_P3H2840_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D4
