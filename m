Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C7A30675C
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011076; cv=none; b=kL4UhbxMxJwfkqLMLNwdRSWgoqf5jMOYJrGxUqg7zJfpSMpo4Bw1ab8wBFp6bQBHUrlRlH4kZOOkf7AiUKd6C8FwEItJlyp6yv24LQpfzWC9B0pBHMJpzq4oApITNjzzTFSMJCHHReO8VFnIes27g6QiNZnWtBfiac3w2838UiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011076; c=relaxed/simple;
	bh=fC8RzCkzQBlCaLXF8UcARumkmKd5GGnFplWTkAzDX6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVG4uGYTmxJrer406aKkc8VmHqwpwN0DKxjL6jtndT2nLJIgpgdRd6dXpdgBNIvx55l5/u9rkKLwAaJf8Jz/dZ/3k31SUB3OzVGbkdWmFqas3owz40BkqRw/u5Kq9dXC0z9wzi7npsr3X7kLq7IhaDl1AVvZPQFvyrgCbzHFcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBHPZsHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBHPZsHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47731F000E9;
	Tue, 14 Jul 2026 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784011074;
	bh=Ugs4E9BwthJF92Mg0Mhg9yimhNo6/x5wa3Wf4lbKbgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBHPZsHjUOKLjzfDRCohyDtSe0OpIx/XOhWXuezvnVcmsfrUIi3pVg/pTtsmQ2QMY
	 TH8ShxavRFdlobAWV3b9i6+JOH0OsqhNfDfeeoPuckbx7WvBGdN983QNW0CrXyAo8U
	 jYQhJDu18vu0cQ3mlYEuSKutJnTBbgIlb9hqKN3Dq27dB01kCNWCcOv+sdeECgDjz2
	 kccI3Q7YZB0SfSjNzHy7QilAO16kDbO75cxanR1kQitdj+DRGEJBu5cDRXQQvDkhY1
	 lAYOfuL+SY7CYR9xqNYb9b9YcSOtCxUHIzbT/JgGGe2M/jQGIFyBlYzngY7fFBTI9c
	 q0Xob8Vl4WX9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] usb: typec: tipd: add TPS66993 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714061820.537792-4-radhey.shyam.pandey@amd.com>
References: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
 <20260714061820.537792-4-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 06:37:54 +0000
Message-Id: <20260714063754.A47731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Redundant I2C read of the power status register for legacy TPS6598x=
 controllers on plug events.

Pre-existing issues:
- [High] Background work items (`wq_poll` and `cd321x->update_work`) are qu=
eued during `tps6598x_probe()` but are not cancelled if the probe function =
subsequently fails, leading to Use-After-Free.
--

--- Patch [3]: [PATCH v3 3/3] usb: typec: tipd: add TPS66993 support ---
commit 4f820239b3f04ea4ac3411ddf0ac69f6736b3b7b
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

usb: typec: tipd: add TPS66993 support

Derive power status from the STATUS register (0x1A) now that TPS66993
deprecates the Power_Status register (0x3F). Add support for the "APP1"
mode string. TPS66993 controller is configured in polling mode and only
type-c flip orientation feature is supported on AMD Versal AI Edge Gen 2
VEK385 Evaluation Kit.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 9097b0d40a71d..522f56742aa9b 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1026,6 +1056,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void=
 *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
> =20
> +	tps->status =3D status;
> +
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
> @@ -1034,9 +1066,15 @@ static irqreturn_t tps6598x_interrupt(int irq, voi=
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

[Severity: Low]
Does this cause a redundant I2C read for legacy controllers?

For legacy TPS6598x controllers, a plug event typically sets both
TPS_REG_INT_POWER_STATUS_UPDATE and TPS_REG_INT_PLUG_EVENT concurrently.

Since tps->data->read_power_status(tps) is already called earlier in this
function when TPS_REG_INT_POWER_STATUS_UPDATE is set, calling it again here
without checking if it was already read results in an unnecessary I2C block
read during physical plug events.

>  		tps6598x_handle_plug_event(tps, status);
> +	}
> =20
>  err_unlock:
>  	mutex_unlock(&tps->lock);
[ ... ]
> @@ -1813,6 +1852,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  		goto err_clear_mask;
>  	}
> =20
> +	tps->status =3D status;
> +
>  	/*
>  	 * This fwnode has a "compatible" property, but is never populated as a
>  	 * struct device. Instead we simply parse it to read the properties.

[Severity: High]
This is a pre-existing issue, but there appears to be a use-after-free in t=
he
probe error path when handling delayed work items.

If the device uses polling mode (client->irq =3D=3D 0), the probe function =
queues
wq_poll:

drivers/usb/typec/tipd/core.c:tps6598x_probe() {
    ...
    if (client->irq) {
        ...
    } else {
        dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
        INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
        queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
                           msecs_to_jiffies(POLL_INTERVAL));
    }

    if (ret)
        goto err_disconnect;
    ...
}

If connect() failed earlier, ret holds a negative error code, and the probe
jumps to the error path:

drivers/usb/typec/tipd/core.c:tps6598x_probe() {
    ...
err_disconnect:
    tps6598x_disconnect(tps, 0);
err_unregister_port:
    tps->data->unregister_port(tps);
    ...
}

The cleanup path fails to cancel the pending delayed work. The tps structure
is then freed by devres when the probe returns the error, causing the delay=
ed
work to dereference freed memory when it executes.

Does this same missing cleanup apply to cd321x->update_work if connect()
succeeds but devm_request_threaded_irq() subsequently fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714061820.5377=
92-1-radhey.shyam.pandey@amd.com?part=3D3
