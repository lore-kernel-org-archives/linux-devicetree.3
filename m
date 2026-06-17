Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE22E7F3A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695498; cv=none; b=WsTC5v38F7Z2OFCE0X70IIjAFc5C4cMhDCveqLfrWW8kwbXoiuW6B33IUe8UUwUOX9ko4qjjfBGfragbxERwV8J4/9m9wZ/Lr5h2x145Wzjl76XZGpinJAMAEaROpKLpDh4PDmiC47J9k0qh+e18eBw/R78QH28nJvdjoZtUohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695498; c=relaxed/simple;
	bh=jX/8emOQp5xs4seA46C4NVqBAgm+8hcDgxoQT28DtsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TSLxqpcB6tNEQfGobxik80PRtdYhWB2j9YYN1oA+XOQWcKpUaWiKHIGR9PMkYj9d3PQgXj7Xxf7lLqwCStBocATtV1F7Dkinee4KoDcp2t6lJuJY9w37k5YXki9XRvuyGC4SXPsfK4U5atj5+EewXxGFm+K1rjvDL78eTAqOn+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0VfgQcG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0VfgQcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5773E1F000E9;
	Wed, 17 Jun 2026 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695497;
	bh=DrgRXswN9gowQ21ag0rmVRzpXIIR022S13w6JYDKPBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0VfgQcGtZMdAVQnYO5ByroW3Gmxu1X3++LCyAuxWklVUIoxmhhkMWKDMqyzaN5/U
	 AByVT93oSy7o84brkYznTum6Ktb+iAcCzzwtqJxlgs5j0qcQJb7qWFLKKujAEs9KCh
	 dGyYZxQwjQEE1ThxoMWc/y7t9pV7oE7pJ0KEOz8L7/s1ovHutHLWmNpXYB250C/xCH
	 X7I0dQr53AdETOnfekoOZcbUF+a0k7rSDVvmRikj+/KBlHTDMpsJBCUXWfMs48QhZL
	 CvSOhs2Yq/R4TteIqrKbDv7sdqGb0yeoNq+whpbBKmq+EVJmYimzQx99gemkQkNrp9
	 Hpnzkn4hYyyBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617110355.1591844-4-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:24:56 +0000
Message-Id: <20260617112457.5773E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The I3C driver incorrectly binds to any generic I3C Hub instead of=
 specifically to NXP P3H2x4x devices.
--

commit e3f8613aba897f64df36ad159bade0cf0e0c5cf1
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport
I3C hub devices. It registers the devices via I3C/I2C/SMBus and exposes
multiple downstream target ports and an on-die regulator.

> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 0000000000000..0a80992d6250a
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
[ ... ]
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] =3D {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),

[Severity: High]
Does this match table inappropriately bind the driver to any generic I3C Hub
instead of specifically NXP P3H2x4x devices?

Since p3h2x4x_device_probe_i3c() does not perform manufacturer or part ID
validation, could this claim non-NXP hubs and cause child drivers to send
proprietary NXP register sequences to them?

Should this use the I3C_DEVICE() macro with MIPI_VENDOR_ID_NXP instead?

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D3
