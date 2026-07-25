Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89C38D414
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997364; cv=none; b=MqiJO0jbKp59hRy2ZqS7ulE0xkN6VNx/Oq7lFelTcbGtLIqn3536g4/W23DWp+19QlGUBHDmIAk/kS71DDi11EXau1IuetUtWQAOyZDOMFxgCbji9MVcixk8E/iFIwE2tfRbUraYLKQEqLUZS6QaWQWnQjw81jUzYiOHUIYiv+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997364; c=relaxed/simple;
	bh=DYifX5RX3ZZFs/7nNQy0qD0w1KfAyXObyI6AlkDz4KM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y4WcXkXD9nf33QHyxWgR8PYdps94mw5BJ1QT6wj8vNgTGJsPGv79G6Fz8haRdhEJ1XXsUhJj4wbI+HHSpmnTmCKZ4sCgBj230pHp5/eD6KYAIp4Zi2/s+tO+LKlXCWxmI0k07m3bNZfCwu6Om+6DHtDozP7ZEpkI6y50nlXqSI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAUQ0mxH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAUQ0mxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C2D1F000E9;
	Sat, 25 Jul 2026 16:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997362;
	bh=YDdNnLZSXNGiS9N8br1HyGiLzHyctVK9cTItaqWec3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nAUQ0mxHbz3sjGTdbAksu6D30ihWtqEXmKB1mPclnxlsTadOrRUQIV6n8iWrzSJmP
	 Sl2hnzuV8rl2DRlqdF+CY6+utt5hRaJs3bZs2jAczUmhJxQjIDqdkzdY69ldvYHu23
	 J2yrCS3uPlGQheAGqrN94bfDzZc1VepcYHgD9oAmOJzX7Ei2Un0cPKuDXs8GDsIdZP
	 WHgYP4DnFwFRoQaIORXkwCgDZrj56zpozq8F1P1UNMeYG1EQjxnucpMigdjAE9H2bB
	 Zxrlj9wHM3Jw9LdmIrYI1mmS5F7pa34zOT9WoPeKK0yk+IqyFfJm42hWuRP9BCI270
	 gHb4AZO2BYY8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 16:36:01 +0000
Message-Id: <20260725163602.70C2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] Moving the entire driver implementation into a header file (`cor=
e.h`) and including it directly causes code bloat and violates C best pract=
ices.
- [Medium] The module license string was changed from strict 'GPL v2' to 'G=
PL', broadening the license terms and conflicting with the SPDX tag.

Pre-existing issues:
- [High] Delayed works (`wq_poll` and `update_work`) are not cancelled on t=
he probe error path, leading to a use-after-free.
- [High] Suspend/resume functions blindly modify IRQ 0 if `wakeup-source` i=
s set but no interrupt is provided, and the IRQ wake count is unbalanced.
- [High] The device is accessed via I2C before its reset line is deasserted=
 during resume.
--

--- Patch [2]: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics ---
commit 6db23dbbea249ebf73709095210ec56e8a1e7da9
Author: Alyssa Milburn <amilburn@zall.org>

usb: typec: tipd: Factor out i2c specifics

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.h
> similarity index 95%
> rename from drivers/usb/typec/tipd/core.c
> rename to drivers/usb/typec/tipd/core.h
> index d5ee0af9058b9..1ba29e439e01c 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.h

[Severity: Medium]
Is it intentional to move the entire core driver implementation into a head=
er
file?=20

If this file is included from multiple bus variant C files, won't it
result in duplicate copies of all these static functions in every object fi=
le,
causing significant kernel binary bloat?=20

Would it be better to leave the core logic in a separate C file and export
the necessary functions?

[ ... ]
> @@ -1860,13 +1842,12 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  	if (ret)
>  		goto err_disconnect;

[Severity: High]
This is a pre-existing issue, but does this error path cause a use-after-fr=
ee?

In tps6598x_probe(), if a plug is present, tps->data->connect() may queue
cd321x->update_work, or if tps->irq =3D=3D 0, wq_poll is queued.=20

If a subsequent step fails (like devm_request_threaded_irq) or connect()
itself fails when there is no interrupt, the code jumps to err_disconnect:

err_disconnect:
	tps6598x_disconnect(tps, 0);
err_unregister_port:
	...

This error path does not appear to cancel wq_poll or update_work, meaning
they could execute after the tps structure is freed by devres.

[ ... ]
> @@ -1913,17 +1892,16 @@ static void tps6598x_remove(struct i2c_client *cl=
ient)
> =20
>  static int __maybe_unused tps6598x_suspend(struct device *dev)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
> +	struct tps6598x *tps =3D tps6598x_from_device(dev);
> =20
>  	if (tps->wakeup) {
> -		disable_irq(client->irq);
> -		enable_irq_wake(client->irq);

[Severity: High]
This isn't a bug introduced by this patch, but what happens here if a device
tree specifies "wakeup-source" but does not provide an interrupt line?

During tps6598x_probe(), tps->wakeup would be set to true. Then in
tps6598x_suspend(), this check unconditionally calls disable_irq() and
enable_irq_wake() even if tps->irq is 0.=20

Could modifying irq 0 disable critical system timers and hang the system
during suspend?

Also, enable_irq_wake() is called during probe when tps->wakeup and
tps->irq are set, but there appears to be no corresponding disable_irq_wake=
()
in tps6598x_remove(), which might leak the wake count.

>  	} else if (tps->reset) {
>  		gpiod_set_value_cansleep(tps->reset, 1);
>  	}

[ ... ]
> @@ -1931,8 +1909,7 @@ static int __maybe_unused tps6598x_suspend(struct d=
evice *dev)
> =20
>  static int __maybe_unused tps6598x_resume(struct device *dev)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
> +	struct tps6598x *tps =3D tps6598x_from_device(dev);
>  	int ret;
> =20
>  	ret =3D tps6598x_check_mode(tps);

[Severity: High]
This is a pre-existing issue, but does this i2c transaction happen too earl=
y?

If this is a non-wakeup device with a configured reset gpio, system suspend
asserts the hardware reset by setting the gpio to 1.=20

During system resume, tps6598x_resume() attempts to communicate with the
device via tps6598x_check_mode() here, before the reset gpio is deasserted
later in the function.=20

Will this cause the i2c read to fail and leave the device unusable?

>  	if (ret < 0)
>  		return ret;

[ ... ]
> diff --git a/drivers/usb/typec/tipd/i2c.c b/drivers/usb/typec/tipd/i2c.c
> new file mode 100644
> index 0000000000000..0233e19290ea2
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/i2c.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for TI TPS6598x USB Power Delivery controller family
> + *
> + * Copyright (C) 2017, Intel Corporation
> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> + */
> +
> +#include <linux/module.h>
> +
> +#include "core.h"

[Severity: Medium]
By including "core.h" directly instead of linking object files, aren't we
embedding the entire core driver implementation directly into this
compilation unit?

[ ... ]
> +MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
Is it intentional to change the module license string from "GPL v2" to "GPL=
"?

In the kernel, "GPL" implies "GPL v2 or later", which broadens the license
terms and seems to conflict with the SPDX tag at the top of the file.

> +MODULE_DESCRIPTION("TI TPS6598x USB Power Delivery Controller Driver");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-tipd-ace3-=
v1-0-73202d36138a@chaosmail.tech?part=3D2
