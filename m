Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC54343E1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010168; cv=none; b=lN5nuiamjv0at37jbVEnkAOUWiSBto5x55jBopwnRNnIhzpW2bgPftMvXlZ2m9Wr7BV5ojA7yK2qowNco23kErpFD2gpbX5cBhULrLrZL70a5XYW2iAUFK8QNqJ35JMLX+bUvEQXLyTeaOL4cbk39CDLkQpDYs+qIFg2GECDkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010168; c=relaxed/simple;
	bh=Vgyc1TQbWhgmrptluwH6PVVKXWUYwYmRD3Qm/7J4lo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HPYPVtjBmHHzaFIm71Y+W2S0wHiw8tGidfKt6HX46Cb7UD7WoAolrs3s9WmBC8rxcIc9Qx3y/IGCJEBC6Iqh183OY66REzcRQ+I1bsjs/fXlR3qtWClUp71LtIFXibL8wnLGeYALmq5VwunBkMFbI5ttWHJa9DmbLLbmJ+5tguI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFuxKNKm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFuxKNKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F2B1F000E9;
	Thu,  6 Aug 2026 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010164;
	bh=GuZqQhNINc+LCkKRvuLN2KY3G2bvK2e205BUU8yBISA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DFuxKNKmTrrLCU0XckgJ4IFyji4kRQN4gTg6auNbjJVw0XrZYe9wRB8+5MyYmRPHJ
	 x99aCmWdo45o9xxc53gI+hnMl9+rFaKqa1KVv87RkEjyVOtNKoK3PISoJkACtvxKKo
	 AtgJpDvQmJz8foGxsqiFKPpIwAFlTRA264iEKHDrVYlfaYO8ZlStMlm0QhDmu9O6xL
	 nI/elPB1x5/Zu9BBmKNolUuq9zUnx8U5boxvLyInfQpYIMG7BYG7pLy5epjsAJLD5F
	 CmlS2wdSmanzU4Rx93AA6fuJQMaSBu1Z9ENRl3jKz+6J6cLn/A1yc1epZxe6oCLeKl
	 9qAg/BNzrMYXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-tipd-ace3-v4-3-79855b150914@chaosmail.tech>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-3-79855b150914@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:56:03 +0000
Message-Id: <20260806095604.54F2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The suspend and resume handlers send SPMI sleep and wakeup command=
s directly to the hardware without acquiring `tps->lock` or the regmap lock=
, racing with concurrent I/O.
- [Low] The driver calls `devm_request_irq()` with a `NULL` `devname` param=
eter for the select, sleep, and wake interrupts, breaking interrupt debuggi=
ng.
- [Low] Missing `depends on POWER_SUPPLY` for `CONFIG_TYPEC_SN201202X` caus=
es a build failure.

Pre-existing issues:
- [High] Delayed works (`cd321x->update_work` and `tps->wq_poll`) are not c=
ancelled on the `tipd_init()` error paths, leading to a Use-After-Free.
--

--- Patch [3]: [PATCH v4 3/3] usb: typec: tipd: Add sn201202x support ---
commit bad42a3c130cfb056927239566528c115c728126
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support

This commit adds support for the sn201202x (ACE3) controller. It is a tipd
variant that exposes a logical register interface over the SPMI bus.

> diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kcon=
fig
> --- a/drivers/usb/typec/tipd/Kconfig
> +++ b/drivers/usb/typec/tipd/Kconfig
> @@ -14,3 +14,15 @@ config TYPEC_TPS6598X
> =20
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called tps6598x.ko.
> +
> +config TYPEC_SN201202X
> +	tristate "TI SN201202x USB Power Delivery controller support"
> +	depends on SPMI
> +	select TYPEC_TPS6598X_CORE

[Severity: Low]
Can this lead to a build failure when TYPEC_SN201202X is built into the ker=
nel
and POWER_SUPPLY is built as a module?

TYPEC_TPS6598X_CORE uses power supply APIs, so if this symbol selects
TYPEC_TPS6598X_CORE without also depending on POWER_SUPPLY, it could cause
unresolved symbols during linking.

[ ... ]
> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static int sn201202x_probe(struct spmi_device *device)
> +{
[ ... ]
> +	init_completion(&sn->select_completion);
> +	init_completion(&sn->sleep_completion);
> +	init_completion(&sn->wake_completion);
> +
> +	ret =3D devm_request_irq(&device->dev, irq_select, sn201202x_irq,
> +			       0, NULL, &sn->select_completion);

[Severity: Low]
Is it intentional to pass NULL as the devname parameter for the select, sle=
ep,
and wake interrupts here? Passing NULL causes these interrupts to be displa=
yed
as (null) in /proc/interrupts and tracepoints, which might break interrupt
debugging tools.

[ ... ]
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +
> +	ret =3D tipd_init(tps);
> +	if (ret)
> +		spmi_command_sleep(device);
> +	return ret;
> +}

[Severity: High]
This is a pre-existing issue, but does tipd_init() fail to cancel the delay=
ed
works on its error paths?

If the driver is in polling mode, tipd_init() queues tps->wq_poll:

	if (tps->irq) {
		...
	} else {
		...
		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
				   msecs_to_jiffies(POLL_INTERVAL));
	}

	if (ret)
		goto err_disconnect;

If connect() failed earlier and ret is set, or if another error occurs, it
jumps to err_disconnect and returns an error without cancelling the queued
delayed works. When probe fails, devres will free the tps structure,
potentially leaving a use-after-free when the work executes.

[ ... ]
> +static int __maybe_unused sn201202x_resume(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	reinit_completion(&sn->wake_completion);
> +	err =3D spmi_command_wakeup(sn->sdev);

[Severity: High]
Do the suspend and resume handlers race with concurrent regmap I/O?

Since the system workqueue is not freezable, cd321x->update_work can run
concurrently with sn201202x_suspend() and sn201202x_resume(). Sending SPMI
sleep or wakeup commands directly to the hardware without acquiring tps->lo=
ck
or the regmap lock could allow these commands to interleave with active
multi-register regmap transactions, potentially corrupting the bus state.

[ ... ]
> +static int __maybe_unused sn201202x_suspend(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	err =3D tipd_suspend(tps);
> +	if (err)
> +		return err;
> +	reinit_completion(&sn->sleep_completion);
> +	err =3D spmi_command_sleep(sn->sdev);

[Severity: High]
Could the SPMI sleep command here also interleave with an active regmap
transaction if the update work executes concurrently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-tipd-ace3-=
v4-0-79855b150914@chaosmail.tech?part=3D3
