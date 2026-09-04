Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3D37F01C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 03:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491840; cv=none; b=YCQi4hY9sf4g+ZL9kCw9497sgBshj2HyMcS1i0pxe1ja2I/clCvzQJ17yQQdFpEIXYvrIJBxHPOmxkfIas9YTe/ERbl9IS9gTBerao4cZF5poJC2Rz0ONZJGMWm1akR42ir/R9Ctc9dtXboI6pjlRA9tEJs1+K1x/0RS9x7SNZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491840; c=relaxed/simple;
	bh=9qPB2b2CnawieF56VJmjpdZoRnYhdha+Cd54dHnHbkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l0ghzOdF4LXbzLiI7U3pkpuAxnpTW7WLw5E7QELLmXSR5DGEHbXImjx+2kUkRQ0GNqoUvvQbrRTqfxDBtzmrXYyE+0eE8MFRHbI+J1JvPVDzbDWiTM61y6MRB2sQqrlAS+OEBuhhlEmxbnfqQ69AA8Z2R8pAuJ0vSxSIGGh8egU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiIMK7jq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiIMK7jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B69D1F00A3E;
	Fri,  4 Sep 2026 03:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788491838;
	bh=dlD/WMDgT0yX/Q/R5RMQcLdDwCn/ESeK0UF0E0yV3ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SiIMK7jqLYwaWlVzfzC/NBMvc77S3GFNcqh59fgS5xZKjHVm7Lgi3px9Ac71ysHNZ
	 r02UXKnLF0K5yER1xSYpjPuyVYic9wi3GXNXYSdS/7qoG50ezfSDu9nS/FpnyeFDCz
	 52QCGne6EpNtuJXBDPdRwTGQlNEo03gavIWkSdOjo5Fox4loAdbTjf6m6mAXQHVApx
	 psdQuugWEYZULLrYKl1XyhxgCXAjnAGYG/9qWL+BBX8xnifrkjmRSZfmES/t971GAT
	 tnMd4QOrRovAlmapKkfRKevCs+djHYVmxDlJNkUuMPRCCM4R0kvSpTyrkYTZOzf48+
	 GBzG4cD6ug+Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 4/5] net: dsa: motorcomm: Add LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903031630.356840-5-mmyangfl@gmail.com>
References: <20260903031630.356840-1-mmyangfl@gmail.com>
 <20260903031630.356840-5-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 03:17:17 +0000
Message-Id: <20260904031718.5B69D1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing mutex unlock on error path causes permanent deadlock
- [Low] Build failure due to dynamic array index in `container_of_const`
--

commit 6e291330945ad21e3fadada5285deeff7e1563e6
Author: David Yang <mmyangfl@gmail.com>
Subject: net: dsa: motorcomm: Add LED support

This patch adds LED support for the Motorcomm YT9215 ethernet switch chips.
It introduces standard LED class devices for each port, supporting parallel
mode and mapping to the hardware default state.

> diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm=
/leds.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/dsa/motorcomm/leds.c
> @@ -0,0 +1,666 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2026 David Yang
> + */
> +
> +#include <linux/uleds.h>
> +
> +#include "chip.h"
> +#include "leds.h"
> +#include "smi.h"
> +
> +#define to_yt921x_led(led_cdev) \
> +	container_of_const((led_cdev), struct yt921x_led, cdev)
> +#define to_yt921x_port(led) ((led)->port)
> +#define to_yt921x_priv(pp) \
> +	container_of_const((pp), struct yt921x_priv, ports[(pp)->index])

[Severity: Low]
Does this macro definition cause a build failure? `container_of_const` uses
`offsetof()`, which requires array indices to be integer constant expressio=
ns.
Since `(pp)->index` is evaluated at runtime, this might result in a
"non-constant integer expression in offsetof" compiler error when compiling
with CONFIG_NET_DSA_YT921X_LEDS enabled.

[ ... ]

> +static int
> +yt921x_led_setup(struct yt921x_priv *priv, int port,
> +		 struct fwnode_handle *fwnode)
> +{
[ ... ]
> +	state =3D led_init_default_state_get(fwnode);
> +
> +	mutex_lock(&priv->reg_lock);
> +
> +	/* Inversion is internal - force on will give low logic.
> +	 * In the rest of the file, treat LEDs as if active-low.
> +	 */
> +	polarity_orig =3D 0;
> +	if (polarity) {
> +		res =3D yt921x_reg_read(priv, YT921X_LED_PAR_INV, &val);
> +		if (res)
> +			goto err_inv;
> +
> +		mask =3D YT921X_LED_PAR_INV_INVnm(group, port);
> +		ctrl =3D polarity > 0 ? val | mask : val & ~mask;
> +		if (ctrl !=3D val) {
> +			res =3D yt921x_reg_write(priv, YT921X_LED_PAR_INV, ctrl);
> +			if (res)
> +				goto err_inv;
> +
> +			polarity_orig =3D -polarity;
> +		}
> +	}

[ ... ]

> +err_led2:
> +	if (polarity_orig) {
> +		ret =3D yt921x_reg_toggle_bits(priv, YT921X_LED_PAR_INV,
> +					     YT921X_LED_PAR_INV_INVnm(group, port),
> +					     polarity_orig > 0);
> +		if (ret)
> +			dev_err(dev,
> +				"Failed to restore %s for LED %02d:%02u: %d\n",
> +				"LED_PAR_INV", port, group, ret);
> +	}
> +	mutex_unlock(&priv->reg_lock);
> +
> +err_inv:
> +	pp->leds[group] =3D NULL;
> +	devm_kfree(dev, led);

[Severity: High]
Can jumping to `err_inv` cause a permanent deadlock? The lock
`priv->reg_lock` is acquired earlier in `yt921x_led_setup()`. If the read
or write to `YT921X_LED_PAR_INV` fails, the code jumps to the `err_inv`
label, which is located after the `mutex_unlock(&priv->reg_lock)` call.
This bypasses the unlock entirely and leaves the lock permanently acquired,
potentially hanging the device's control path on subsequent operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903031630.3568=
40-1-mmyangfl@gmail.com?part=3D4
