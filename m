Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7910383C67
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020083; cv=none; b=M2Qba94oa2XQMdkLyvhspZ4rmILs3lbVmWp73CMg7vf4GpvLjBGFiXSyWpiFKgYjjGxpiDsgZSRvVccDF2ACMvkrU/g2elEwN5Xy1iMhoCxsgW3pHqCtPPDTO36UFl12T3UiJlIt6q10D1EJOv+kbk0DKMTsEN9Tlx3r8n0OE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020083; c=relaxed/simple;
	bh=HcxKkVbjOd0RGNpxzWSMfvMXqAu0RIoYud2KifXOego=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QHxYL5GoAblHU6Af1XZPE8uj+IwyPB297yse8I4BnrPSwEAJKDZqanmJwqu3SzfU7c7d4pemSu4xGAe2EQVkPXkdBi/HDxHCr/Q1zq2/rnzTAG4S7kn5lqaBCA1dZJLHm+CQ7dNVYAEoDMqP53rkVGC99x01++vqHjKx0srzoHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBRVEPKL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBRVEPKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64F31F000E9;
	Thu,  2 Jul 2026 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783020082;
	bh=0tdWPLF2Nq6nLOO00ZhUPMOWALuknV+PWCUnP6NfGfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBRVEPKL1WeuF7XQZtMXa2NFfLcnAEmJlB8O7CP+5R0p9SECQHFHBFKVlUsJozQZr
	 swuorXDddwMcOsk5KBg+1TgCzyVCcjteMC4h6jBoaqe9usGTSdz336pZMhedjDxa2C
	 zHXhc6+AEUlCWEGjvA1LUtHnR5JAq5xVMM6FW2Kwbw89O9fZ6pKjPZOjVGHcJ74sXB
	 sef9tx7hJKJe57ZKtSjeBeHaUGghfunWCtvfdScu2o9bp9u0Oq4wHK9KAb/PzcWVpP
	 PDjr31VGVl2vskxnv8A/eamAdqIJYvH29BHVgNNRQI+wl7vtiOiiifGx+HG47mzgJc
	 a7tJsVCPag7hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: tipd: add TPS66993 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702190527.1820671-4-radhey.shyam.pandey@amd.com>
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
 <20260702190527.1820671-4-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 19:21:21 +0000
Message-Id: <20260702192121.E64F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] For TPS66993, the driver fails to update the synthesized power s=
tatus when a PD contract is established after the initial plug event.
- [Medium] Redundant I2C reads and potential dropping of plug events for le=
gacy TPS6598x devices in the shared interrupt handler.
- [Low] Use of undeclared identifiers 'TPS_POWER_STATUS_CONNECTION_MASK' an=
d 'TPS_POWER_STATUS_SOURCESINK_MASK' causes compilation failure.

Pre-existing issues:
- [High] The `tps->wq_poll` delayed work is queued but never canceled if th=
e probe fails, leading to a Use-After-Free.
- [High] The `cd321x->update_work` delayed work is leaked and runs after fr=
ee if probe fails after a successful connect.
- [High] The probe function exposes the Type-C port to userspace before it =
fully initializes the connection state, leading to a race condition with sy=
sfs.
--

commit f75143dbec357f0c1c49269aeab93ef676edfcef
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: usb: typec: tipd: add TPS66993 support

This patch adds support for the TPS66993 controller. It derives power status
from the STATUS register instead of the deprecated Power_Status register and
adds support for the APP1 mode string. The controller is configured in
polling mode.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index a6cb233a055da..d2394d23a2dc4 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -631,6 +633,35 @@ static bool tps6598x_read_power_status(struct tps659=
8x *tps)
>  	return true;
>  }
> =20
> +/*
> + * TPS66993 deprecated Power_Status register (0x3F). BC1.2 is not suppor=
ted
> + * and the remaining bits are redundant with STATUS register (0x1A).
> + * Synthesize pwr_status from the already-read STATUS register.
> + */
> +static bool tps66993_read_power_status(struct tps6598x *tps)
> +{
> +	u16 pwr_status =3D 0;
> +
> +	/* Same masks as TPS_POWER_STATUS_CONNECTION() / SOURCESINK() / PWROPMO=
DE() in tps6598x.h */
> +	if (tps->status & TPS_STATUS_PLUG_PRESENT)
> +		pwr_status |=3D FIELD_PREP(TPS_POWER_STATUS_CONNECTION_MASK, 1);
> +
> +	/* SOURCESINK: 1=3Dsink; STATUS.PortRole 1=3Dsource, opposite conventio=
n */
> +	if (!TPS_STATUS_TO_TYPEC_PORTROLE(tps->status))
> +		pwr_status |=3D FIELD_PREP(TPS_POWER_STATUS_SOURCESINK_MASK, 1);

[Severity: Low]
Does this code cause a compilation failure? The macros
TPS_POWER_STATUS_CONNECTION_MASK and TPS_POWER_STATUS_SOURCESINK_MASK appear
to be undeclared in the kernel tree.

[ ... ]

> @@ -1026,6 +1057,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void=
 *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
> =20
> +	tps->status =3D status;
> +
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
> @@ -1034,9 +1067,15 @@ static irqreturn_t tps6598x_interrupt(int irq, voi=
d *data)
>  		if (!tps->data->read_data_status(tps))
>  			goto err_unlock;
> =20
> -	/* Handle plug insert or removal */
> -	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
> +	/*
> +	 * Refresh power status before connect - needed for TPS66993 which
> +	 * synthesizes pwr_status from STATUS and never gets POWER_STATUS_UPDAT=
E.
> +	 */
> +	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT) {
> +		if (!tps->data->read_power_status(tps))
> +			goto err_unlock;

[Severity: Medium]
For legacy TPS6598x devices where both TPS_REG_INT_POWER_STATUS_UPDATE and
TPS_REG_INT_PLUG_EVENT can be set, does this cause redundant I2C reads since
read_power_status is called for both events?

If the second read fails, will it jump to err_unlock and silently drop the
plug event?

[Severity: Medium]
For the TPS66993, since read_power_status is now restricted to plug events =
in
this handler, does the driver fail to update the synthesized power status i=
f a
PD contract is established after the initial plug event?

> +		tps6598x_handle_plug_event(tps, status);
> +	}
> =20
>  err_unlock:

[ ... ]

> @@ -1810,6 +1850,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  		goto err_clear_mask;
>  	}
> =20
> +	tps->status =3D status;
> +

[Severity: High]
This is a pre-existing issue, but does exposing the Type-C port to userspace
via tps->data->register_port() later in this probe function create a race
condition?

Userspace sysfs writes could potentially race with the subsequent lockless
port mutations in read_power_status, read_data_status, and connect later in
this function.

[Severity: High]
This is a pre-existing issue, but if the device is probed in polling mode
and an earlier connect step fails, the delayed work tps->wq_poll is
initialized and queued:

tps6598x_probe() {
	...
	if (client->irq) {
		...
	} else {
		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
				   msecs_to_jiffies(POLL_INTERVAL));
	}

	if (ret)
		goto err_disconnect;
	...
}

When the code jumps to err_disconnect, tps->wq_poll is never canceled. Can
this lead to a use-after-free when the queued work executes on freed memory?

[Severity: High]
This is a pre-existing issue, but does the error path in this probe function
leak the cd321x->update_work delayed work?

If a CD321x device connects successfully during probe but a subsequent setup
step fails, the error teardown jumps to err_disconnect without calling
remove() or explicitly canceling update_work. Could this result in a
use-after-free?

>  	/*
>  	 * This fwnode has a "compatible" property, but is never populated as a
>  	 * struct device. Instead we simply parse it to read the properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702190527.1820=
671-1-radhey.shyam.pandey@amd.com?part=3D3
