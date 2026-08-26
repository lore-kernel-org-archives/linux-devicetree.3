Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69B3EC807
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741808; cv=none; b=f5qQywCxIAIERo5f0NxG3UGD0G5zj2bj4YCaPIqF68jfsq52LihbKL5GGjP0YmmxNirbbZVp8ZEV181r0lOYrycfFSjZgE4HQ0rjLjPlEvPVp+CcqbuCY0AEm1rY07LKDIkqwD9sSQuIUKxPAlqFDLX3r2JxX3BFXlkAtCqL6MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741808; c=relaxed/simple;
	bh=JuaVJEQdNojl2HKzVQF6AC2N9r8zI5AL3IgpgtxRLC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oa8geosSxIyEHkgkFKcXqmqvN6qYWe5I10sD+0wHk8KA1UxLUSiVu2BAZgF/Q73XWBeHfuRxmdZfv+e3zSNNXS6aDH+fxpf9doNbBUbDlVmHlrOtN24pHSpuGrv4E1rURHKgv/0ZkAYXQ4zPVJxYQr1NpTPhcwqVycwpHdCeeTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgRab2mg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgRab2mg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99381F000E9;
	Wed, 26 Aug 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741799;
	bh=v0uWvgSlqSWeY0k6fpcMY3AbmnpmWz9lYTAw8yuXkYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NgRab2mgTOk65X168APvCM6M57YpvVnV/eA7GjNZW28K7E2fwMBCuBCd/XWN6L18P
	 tVi+9g9/PWcSinB/7QNK4gkQi0jhEiS/rjZx+w0KZX92fz7+O4Zx0Sh219zb+8QGOX
	 5pjflpAQXpINfym5Ua5RfcaZl7ggPwMDMHCefmOPvqbaMz4I5m8fbHY2EJhlOIQTJm
	 zpode+AL/N4+dvdo6K+3OEaYSN5my8Pq8wiV0DQV4S6/qxOiYG/ABjRVS78V2KRPCy
	 BPhPgbv+lSB2pzLki+RCwJHE2IVITTay/3qKdlL+3VLAQ4I3W9Q+v2G9NrKNXuiju5
	 WV21cNClo0ESw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826103819.1614843-5-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:56:38 +0000
Message-Id: <20260826105638.D99381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] MFD Architecture Violation: Global header placement and bespoke int=
ermediate parent structure.
--

commit f74680421e4c370330ed051f68115c488cc48933
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
family of multiport I3C hub devices. These devices connect to a host via
I3C/I2C/SMBus and expose multiple downstream target ports.

> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> index 0000000000000..f8cef54ce7062
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,168 @@
[ ... ]
> +/* Read port count from the device capability register (4- or 8-port var=
iant). */
> +static int p3h2x4x_read_num_target_ports(struct device *dev,
> +					 struct p3h2x4x *ddata)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(ddata->regmap, P3H2X4X_DEV_CAPAB, &val);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to read device capability\n");
> +
> +	ddata->num_target_ports =3D (val & P3H2X4X_TARGET_PORT_COUNT) ?
> +		P3H2X4X_TARGET_PORTS_8 : P3H2X4X_TARGET_PORTS_4;

[Severity: Low]
Does p3h2x4x_read_num_target_ports() violate the MFD subsystem guidelines by
initializing child-specific resources in the parent driver? Private resourc=
es
should be initialized directly in the child driver that consumes them.

> +
> +	return 0;
> +}
[ ... ]
> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 0000000000000..eb4792de5440e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025-2026 NXP
> + */
> +
> +#ifndef _LINUX_MFD_P3H2840_H
> +#define _LINUX_MFD_P3H2840_H

[Severity: Low]
Is this driver-specific header file inappropriately placed in the global
MFD include path? Driver-specific headers only used by the parent and its
immediate children should remain local to the drivers/mfd/ directory.

> +
> +#include <linux/bits.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
[ ... ]
> +struct p3h2x4x_i3c_hub_dev;
> +
> +struct p3h2x4x {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +	/* Number of downstream target ports (4 or 8). */
> +	u8 num_target_ports;
> +	/* Serializes protected register unlock/lock sequences across MFD child=
ren. */
> +	struct mutex protected_reg_lock;
> +	/* Hub context for the IBI handler to reach hub state via the parent i3=
cdev. */
> +	struct p3h2x4x_i3c_hub_dev *i3c_hub_priv;
> +};

[Severity: Low]
Does struct p3h2x4x aggregate child-specific data and create a bespoke
intermediate parent structure? This creates bidirectional coupling and bypa=
sses
MFD isolation boundaries. Child drivers should directly access parent data =
using
standard APIs rather than relying on custom parent-initialized private
resources.

> +#endif /* _LINUX_MFD_P3H2840_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103819.1614=
843-1-lakshay.piplani@nxp.com?part=3D4
