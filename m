Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35E3D0927
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785620709; cv=none; b=SR+zvPuA83vStK/LWKGJmhDhfz2/UkeAOZetVcRFmWNpJ3xJFlAnADGhSik8DM98ygDqIiSiab+Fon0GdY5lGO/tluBuhkgSeHe3kKr8eGH7yobXQ7wbQDFFb/YosnsYlBJCDKkH06iVaVghKep59VoTvVrze93Urqze0kNPR9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785620709; c=relaxed/simple;
	bh=dXBnhth2V+OZKzmobqb4QxzX7zHd4dlwWyRTRxG0o6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FlO76+RdB1bqK/s5Z0CGtUoX8QFHEL6CpTMOZY6lyllqmonc640uttmpP2UdHxOCPpO7fwpVvTAkvoIiaiFC9DGkGudEebP0NBz68xkG1UfaowFI/rXKDJUHuokGuJV2oWFchcHDt6sTVBjgw1JzLCd6/eKL1JrUdu6JmjHceBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WygT+Ctw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WygT+Ctw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBB21F00AC4;
	Sat,  1 Aug 2026 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785620707;
	bh=WZ//gl3P7CnKRXwkp7KigzvHj2VVcHUNjBy6A6rqGwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WygT+CtwFSkIrAjWwNebT/XZRIrAyXAEqCuKdoHw0nqx+pzLOtj/r68Xs5HbTwc7B
	 py/D8puo2XmJY6pLR0Z7/C0FMnJK4KsbTQVIEzc4zp2hiBYNBIagZ/U0IkfbaaDkPO
	 L2oe31kUhuQ1/+DBFbzPd+8beQy75zCkfeALYrQ+Yb/Hh7JR6vF5Z3pSd8jJW06J9a
	 jfTEnHV2/umvth3W4HT1qRFF2hW32UbqoX4QLMWro9mNCKP4kflPgTogZXRlX6fFzP
	 xqWY2KUY9FVvecs/dTwvqvPMWskIl5Ruo75va0mc+o0stQvCK9Ne69LdX6LDQHJT/P
	 y1DbjTr/UFWVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801-tipd-ace3-v3-3-8332f2eca4fc@chaosmail.tech>
References: <20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech>
 <20260801-tipd-ace3-v3-3-8332f2eca4fc@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 21:45:06 +0000
Message-Id: <20260801214507.4CBB21F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] sn201202x_suspend fails to wake up the device if the sleep complet=
ion times out, leaving the device in an unresponsive state during error rec=
overy.
- [High] Passing NULL as the devname parameter to devm_request_irq causes a=
 kernel panic during procfs directory creation.
- [Medium] Missing reinit_completion() before spmi_command_wakeup() in prob=
e can cause premature timeout completion due to a spurious or pending inter=
rupt.
- [Medium] The busy-wait check `val =3D=3D (reg | 0x80)` incorrectly handle=
s register addresses >=3D 0x80, leading to an infinite polling loop.

Pre-existing issues:
- [High] If wakeup-source is present in DT but irq is missing, tipd_suspend=
 and tipd_resume will erroneously operate on IRQ 0.
- [High] If connect() fails and no IRQ is present, tipd_init leaks the init=
ialized delayed work queue, leading to a Use-After-Free.
--

--- Patch [3]: [PATCH v3 3/3] usb: typec: tipd: Add sn201202x support ---
commit a0251ef6ede2e8ce60700056a8add92aa7a36382
Author: Sasha Finkelstein <k@chaosmail.tech>
Subject: usb: typec: tipd: Add sn201202x support

This patch adds support for the sn201202x (ACE3) controller, which is a tipd
variant utilizing the SPMI bus. It provides the SPMI regmap implementation
along with probe and PM routines.

> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> index 0000000000000..73575a854bde1
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static int regmap_sn201202x_select_reg(struct spmi_device *sdev, u8 reg)
> +{
[ ... ]
> +	while (--attempts) {
> +		err =3D spmi_register_read(sdev, 0, &val);
> +		if (err)
> +			return err;
> +		if (val =3D=3D (reg | 0x80)) {
> +			if (!warned) {
> +				dev_warn(tps->dev,
> +					 "Got interrupt but selection not complete?\n");
> +				warned =3D true;
> +			}
> +			msleep(20);
> +			continue;
> +		}
> +		if (val =3D=3D reg)
> +			return 0;
> +		return -EIO;
> +	}
> +
> +	return -EIO;
> +}

[Severity: Medium]
Does this logic work correctly for register addresses >=3D 0x80? If reg is
0x85, for example, then (reg | 0x80) evaluates to just reg. This would make
the busy condition val =3D=3D (reg | 0x80) identical to the success conditi=
on=20
val =3D=3D reg. Since the busy condition is checked first, it will falsely =
match,
trigger the warning, and eventually timeout returning -EIO.

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
> +	if (ret)
> +		return ret;
> +	ret =3D devm_request_irq(&device->dev, irq_sleep, sn201202x_irq,
> +			       0, NULL, &sn->sleep_completion);
> +	if (ret)
> +		return ret;
> +	ret =3D devm_request_irq(&device->dev, irq_wake, sn201202x_irq,
> +			       0, NULL, &sn->wake_completion);

[Severity: High]
Can passing NULL as the devname parameter to devm_request_irq() cause a ker=
nel
panic during boot? The IRQ subsystem passes the devname to proc_mkdir() to=
=20
create an entry in /proc/irq/, and calling strlen() on a NULL name will fau=
lt.

> +	if (ret)
> +		return ret;
> +
> +	spmi_device_set_drvdata(device, tps);
> +	tps->regmap =3D devm_regmap_init_sn201202x(device, &tps6598x_regmap_con=
fig);
> +	if (IS_ERR(tps->regmap))
> +		return PTR_ERR(tps->regmap);
> +
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;

[Severity: Medium]
Should there be a call to reinit_completion(&sn->wake_completion) right=20
before sending the wakeup command? If a pending or spurious interrupt fires=
=20
immediately after the IRQ is registered above, wait_for_completion_timeout()
might consume the stale completion and return immediately without waiting f=
or
the actual hardware wakeup sequence to finish.

[ ... ]
> +static int __maybe_unused sn201202x_suspend(struct device *dev)
> +{
[ ... ]
> +	err =3D spmi_command_sleep(sn->sdev);
> +	if (err)
> +		goto out_resume;
> +	if (!wait_for_completion_timeout(&sn->sleep_completion, msecs_to_jiffie=
s(100))) {
> +		err =3D -ETIMEDOUT;
> +		goto out_resume;
> +	}
> +	return 0;
> +
> +out_resume:
> +	tipd_resume(tps);
> +	return err;
> +}

[Severity: High]
Does this error path leave the device in an unresponsive state? If the slee=
p=20
command succeeds but wait_for_completion_timeout() times out (perhaps due t=
o=20
a lost interrupt), we jump to out_resume and call tipd_resume(). Since the
device was commanded to sleep and no spmi_command_wakeup() is issued in this
error path, the regmap reads inside tipd_resume() could fail or hang.


I also noticed a couple of pre-existing issues in the core code that might =
be
worth addressing:

[Severity: High]
This is a pre-existing issue, but does tipd_suspend() correctly handle cases
where the wakeup-source property is present in the device tree but the irq
property is missing?

drivers/usb/typec/tipd/core.c:tipd_suspend() {
    if (tps->wakeup) {
        disable_irq(tps->irq);
        enable_irq_wake(tps->irq);
    } else if (tps->reset) {
...

In tipd_init(), tps->wakeup can be set to true even if tps->irq is 0. If th=
at
happens, calling disable_irq() and enable_irq_wake() here will operate on
IRQ 0, which might disable a core system interrupt like the timer.


[Severity: High]
This isn't a regression introduced by this patch, but could tipd_init() lea=
k=20
the delayed work queue if connect() fails?

drivers/usb/typec/tipd/core.c:tipd_init() {
...
    if (status & TPS_STATUS_PLUG_PRESENT) {
        ret =3D -EINVAL;
        ...
        ret =3D tps->data->connect(tps, status);
        if (ret)
            dev_err(tps->dev, "failed to register partner\n");
    }

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
...

If tps->data->connect() fails, ret holds an error code. If the device has no
IRQ, we queue the polling work. Since ret isn't cleared, the subsequent
if (ret) check triggers a jump to err_disconnect, freeing the tps structure
without cancelling the delayed work queue. This could lead to a
use-after-free when the timer fires.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-tipd-ace3-=
v3-0-8332f2eca4fc@chaosmail.tech?part=3D3
