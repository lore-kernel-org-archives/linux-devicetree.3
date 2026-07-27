Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342E5420499
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169350; cv=none; b=BFifHVw9p6sxAW7YBu4cwJzl3wacdGZMbuVacJ19I1NP2l1gj65NWlPGn1W4UN/dThvyJTbT3kSpnK+RfvYOTFy3WQnbhFL6bvHgOYjIh+b72euUapsh6RjgqKSJBv3fJ2O7MVESlb2hNK8Tk68fU/OLOXLLheLVQI2VsjF1XWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169350; c=relaxed/simple;
	bh=QQo0s1B8rQ69i04udvZoX+p9UsNDeot92MnRH/1oMTk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kdh81ZMhdmO4e0FQ3MDeDSP6rZwy9APGTAAM74nuVXLNEup0r6PQfyhr/C061OeKgYGJW+ep/YlR4GUXWuI4aKyhb3K6IA0lgXLzVSac5IRCfFeCN6RvQ/N+W11ttCYPowFEc8sII+0KtkhXcBLdnScS4Wpf2P4kkN14bUC9YrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aiun+WoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aiun+WoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7991F000E9;
	Mon, 27 Jul 2026 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785169346;
	bh=wy4ebTf5EFm4Ait6plzwaKX8abvHBrddMkaOsHuv43g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aiun+WoGspGPDxQoxLvWueTn9jYTj1xx/OdWQM20dQdVBHvyMvymcGMsrWsX3fAIu
	 +3kG44ZS5Rguyt+ySRk4h3hnNGANSWe4BCEciRJ82uVymYIQDeAAySSVv/8BFZ5Z8x
	 nhWgjtSqc+T0y8rM4t6keopz8YX2KnHAWhut5fYJDLi9Xnl0CiWnTU6kRWazH0q6fD
	 T9gg1kfiZlTn9KYLNQRkXQc84YSvm+81glHmFh17IkqhyQWA3pF9uO9DL3iFI+Bv9i
	 9Kg0RqIV+/+7rd4Gt5soQebfWU3xKf6yw2BcXO2Gr79gpXn8b/OKID1VCRHSjkyvhm
	 esyKeLJRuQp+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-tipd-ace3-v2-3-1345957bd635@chaosmail.tech>
References: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
 <20260727-tipd-ace3-v2-3-1345957bd635@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 16:22:26 +0000
Message-Id: <20260727162226.AC7991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] `sn201202x_suspend` fails to rollback state if the SPMI sleep comm=
and fails, permanently breaking the device.
- [Medium] Missing SPMI sleep command on probe error path leaks hardware po=
wer state.

Pre-existing issues:
- [High] Pending delayed work is not canceled when `tipd_init()` fails, lea=
ding to Use-After-Free.
--

--- Patch [3]: [PATCH v2 3/3] usb: typec: tipd: Add sn201202x support ---
commit 698268fd8b63e1a6de3f13213aca2f84b22da5ef
Author: Sasha Finkelstein <k@chaosmail.tech>
Subject: usb: typec: tipd: Add sn201202x support

Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index aadadfdc6ed12..6577bc2f1e0f9 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1889,6 +1889,26 @@ const struct tipd_data tipd_tps25750_data =3D {
>  };
>  EXPORT_SYMBOL_GPL(tipd_tps25750_data);
> =20
> +const struct tipd_data tipd_sn201202x_data =3D {
> +	.irq_handler =3D cd321x_interrupt,
> +	.irq_mask1 =3D APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_PLUG_EVENT,
> +	.tps_struct_size =3D sizeof(struct sn201202x),
> +	.remove =3D cd321x_remove,
> +	.register_port =3D cd321x_register_port,
> +	.unregister_port =3D cd321x_unregister_port,
> +	.trace_data_status =3D trace_cd321x_data_status,
> +	.trace_power_status =3D trace_tps6598x_power_status,
> +	.trace_status =3D trace_tps6598x_status,
> +	.init =3D cd321x_init,
> +	.read_data_status =3D cd321x_read_data_status,
> +	.reset =3D cd321x_reset,
> +	.switch_power_state =3D cd321x_switch_power_state,
> +	.connect =3D cd321x_connect,
> +};

[Severity: High]
This is a pre-existing issue, but does this error path leave delayed work
pending, potentially causing a use-after-free?

In tipd_init(), if a plug is present, tps->data->connect(tps, status)
is called. For this struct, that resolves to cd321x_connect(), which
schedules delayed work.

If a subsequent step in tipd_init() fails (like requesting the IRQ):

core.c:tipd_init() {
    ...
    if (tps->irq) {
        ret =3D devm_request_threaded_irq(...);
    }
    if (ret)
        goto err_disconnect;
    ...

The err_disconnect label does not cancel the delayed work before returning:

err_disconnect:
    tps6598x_disconnect(tps, 0);
err_unregister_port:
    tps->data->unregister_port(tps);
    ...

When devres frees the device structure memory on probe failure, won't the
workqueue execute the callback on the freed memory when the timer expires?

> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static int sn201202x_probe(struct spmi_device *device)
> +{
[ ... ]
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +
> +	return tipd_init(tps);
> +}

[Severity: Medium]
Does this leak the hardware power state if tipd_init() fails?

If tipd_init(tps) fails, the error is returned directly. Should this path=20
call spmi_command_sleep() to reverse the spmi_command_wakeup() called
earlier in this function?

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
> +	if (err)
> +		return err;
> +	if (!wait_for_completion_timeout(&sn->sleep_completion, msecs_to_jiffie=
s(100)))
> +		return -ETIMEDOUT;
> +	return 0;
> +}

[Severity: High]
If spmi_command_sleep() fails or times out, does the device state need to be
rolled back?

If this returns an error, the PM core aborts system suspend but does not
invoke the resume callback for the failing device. Should this path call
tipd_resume(tps) to undo the effects of tipd_suspend(tps) before returning,
so the device is not left permanently broken and unresponsive?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-tipd-ace3-=
v2-0-1345957bd635@chaosmail.tech?part=3D3
