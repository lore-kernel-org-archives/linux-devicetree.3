Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB83F58E9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883749; cv=none; b=Tb+LcLxAzdky2GtxeeiyIc20IZhQtmAw+XE/rsQ7o6ao100K+umKoa8xNbC3yVPmPsBaBZUgfmA+0tXhhZU8q/ruK9C/47MABKORs/Tm54EjMfa3zzZnnE9QsW66VRCU5GdYJ+rtk46+7OawOX5NijFm+/SM9kbJkF1qBrdavqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883749; c=relaxed/simple;
	bh=fn9GPwQQIg3XmwcD0t+Mafdvzd60f4TPXljYT6yjYAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uhh6WwJoeAgt5K6+eja4KJy1BOEYmd2/0rrfRPld8RlYPZjdKmKG/VvmrtQbjFYB1+xBEwObAbTBbqt8x3uWaNtOd0agA2n5/jUkXjiI/6uPWxA6SS6Y82SNxRZhyW22YpJjnj/9VS0duq+wNFs4HujHcuGPlAu6UKtgH/5Dv7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISO7d3U8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISO7d3U8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24AFC2BD00;
	Fri, 15 May 2026 22:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883749;
	bh=fn9GPwQQIg3XmwcD0t+Mafdvzd60f4TPXljYT6yjYAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ISO7d3U8CZhGQgcfDh1f9jDEmsT7pZlLOdcICRPbPLtpZbz03jJzxmHTFd3m/AFJd
	 UskJzU0ljQImwslXfLcSkNgTO/iSGCjpchwzCCqx6rS5OGjdzQT5QqgGVtMwFCYhRr
	 YfVbIXB7N1Wqj5iOqz6QPGQHhqWPHDdKYup04zvFcdf+c1yKiUZ/4XeQl2KtDhvwBB
	 hfnKx3kI3IyKgRly6llbqkofQxEDQ1XZvc1lBGe03kijyr/yiRwrvXyjPXSu35cJMD
	 wIuBG1MI4AaQHAqLNoW2gmZsA+sg5/irou3WuHfiM3TEJhew7smPR6nSUn6XCWm0JE
	 K7oiQdmrUI09Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/10] power: supply: add support for Samsung S2M
 series PMIC charger device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-s2mu005-pmic-v7-10-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-10-73f9702fb461@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:22:28 +0000
Message-Id: <20260515222228.C24AFC2BD00@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing initial configuration of hardware state on probe.
- [High] Race condition between devres cleanup and extcon notifier leads to=
 use-after-free.
- [High] Missing hardware disablement upon driver unbind leaves PMIC sourci=
ng power.
- [High] Dangling pointer to `extcon_dev` if the provider unbinds, leading =
to use-after-free.
- [Medium] Unconditional charger reset on every extcon notification disrupt=
s charging.
- [Low] Missing explicit header includes for `msleep()` and `FIELD_PREP()`.
--

commit 41ed08773e6f6eb12cab89eb389202b30e4d9e42
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

power: supply: add support for Samsung S2M series PMIC charger device

Add a driver for charger controllers found in certain Samsung S2M series
PMICs. The driver has very basic support for the device, with only
charger online reporting working, and USB 2.0 device negotiations
working.

> diff --git a/drivers/power/supply/s2m-charger.c b/drivers/power/supply/s2=
m-charger.c
> new file mode 100644
> index 0000000000000..4d1f2c2c71446
> --- /dev/null
> +++ b/drivers/power/supply/s2m-charger.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Battery Charger Driver for Samsung S2M series PMICs.
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd
> + * Copyright (c) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
> + * Copyright (c) 2026 =C5=81ukasz Lebiedzi=C5=84ski <kernel@lvkasz.us>
> + */
> +
> +#include <linux/devm-helpers.h>
> +#include <linux/extcon.h>
> +#include <linux/mfd/samsung/core.h>
> +#include <linux/mfd/samsung/s2mu005.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/regmap.h>

This isn't a bug, but is it possible to add explicit includes for
<linux/delay.h> (for msleep) and <linux/bitfield.h> (for FIELD_PREP)? It
appears the driver relies on implicit transitive inclusions.

[ ... ]
> +static void s2mu005_chgr_extcon_work(struct work_struct *work)
> +{
> +	struct s2m_chgr *priv =3D container_of(work, struct s2m_chgr, extcon_wo=
rk);
> +
> +	if (extcon_get_state(priv->extcon, EXTCON_USB_HOST) > 0)
> +		s2mu005_chgr_mode_set_host(priv);
> +	else if (extcon_get_state(priv->extcon, EXTCON_USB) > 0)
> +		s2mu005_chgr_mode_set_charger(priv);

Since the notifier is registered for all cables, a single physical USB
connection can generate multiple extcon notifications (e.g., EXTCON_USB
followed by EXTCON_CHG_USB_SDP after negotiation).

Does this unconditionally clear the OP_MODE register and interrupt charging
on every notification? It seems the driver should verify the current hardwa=
re
state and only reset if a state change is actually required.

[ ... ]
> +static int s2m_chgr_extcon_notifier(struct notifier_block *nb,
> +					unsigned long event, void *param)
> +{
> +	struct s2m_chgr *priv =3D container_of(nb, struct s2m_chgr, extcon_nb);
> +
> +	schedule_work(&priv->extcon_work);
> +
> +	return NOTIFY_OK;
> +}

If an extcon event fires concurrently during driver unbind, can the notifier
callback invoke schedule_work() after cancel_work_sync() has already return=
ed?

During devres cleanup, devm_extcon_unregister_notifier_all() runs first,
followed by cancel_work_sync() from devm_work_autocancel(). Extcon uses a
raw_notifier_chain, so unregistering the notifier unlinks it but does not w=
ait
for currently executing callbacks to finish.

Could this queue a freed work_struct into the system workqueue, resulting i=
n a
use-after-free when the work executes?

[ ... ]
> +	/* MUIC is mandatory. If unavailable, request probe deferral */
> +	extcon_node =3D of_get_child_by_name(dev->parent->of_node, "muic");
> +	if (!extcon_node)
> +		return dev_err_probe(dev, -ENODEV, "MUIC node required but not found\n=
");
> +
> +	priv->extcon =3D extcon_find_edev_by_node(extcon_node);
> +	if (IS_ERR(priv->extcon))
> +		return -EPROBE_DEFER;

If the extcon provider (e.g., the MUIC driver) is manually unbound via sysf=
s,
the extcon_dev structure is freed. Does the charger driver retain a dangling
pointer in priv->extcon?

Because extcon_find_edev_by_node() does not increment the reference count or
establish a device link, any subsequent power supply property query or dela=
yed
execution of s2mu005_chgr_extcon_work() will dereference this freed pointer
when calling extcon_get_state(), causing a use-after-free.

[ ... ]
> +	priv->extcon_nb.notifier_call =3D s2m_chgr_extcon_notifier;
> +	ret =3D devm_extcon_register_notifier_all(dev, priv->extcon, &priv->ext=
con_nb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register extcon notifier\n");
> +
> +	return 0;
> +}

Extcon notifiers only fire on state changes. If a USB cable is already
connected when the device boots and the driver loads, wouldn't the hardware
remain unconfigured in its default mode and not begin charging?

Should the driver explicitly schedule priv->extcon_work or manually synchro=
nize
the initial state at the end of s2m_chgr_probe()?

Also, if the driver is unbound via sysfs while operating in OTG mode (sourc=
ing
5V on the VBUS line), is the hardware left indefinitely sourcing power with=
 no
software managing it?

There doesn't appear to be a .remove callback or a dedicated devm teardown
action to transition the hardware to a safe state (e.g., calling
s2mu005_chgr_mode_unset()) during teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-s2mu005-pm=
ic-v7-0-73f9702fb461@disroot.org?part=3D10
