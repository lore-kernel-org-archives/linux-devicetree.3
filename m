Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A012C21D9
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997415; cv=none; b=XaiI2QMCmiSu5fCA6BCZQVHxd2oRVx6AxN348+W8cgc2rqzAj3Rh6SWMH6TtKcArYunKuTs71Dqpk+ueEvNGj21qcE8Cxq/CPypUjTUJDLY2+6tVUhJYwsallj1M4gKXoednfFfcGnP1Hvb0gU5IJRN0WqSSf2ksXLMG7itXqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997415; c=relaxed/simple;
	bh=3VtTQNGofL2PttJenb5JRB8un2HYQ+AfQmAWPLZsIEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lVHXD/MpHK15t8iYn1zTo8z9UY5Lu2No8IjGLTjCDpad/TeHQeO9OAPRh9R1OlAXe5937en1WMLPSZS2xKhU9WctLjbjl4mWTJxSeoCMvnofO2Z6/8Xrp3QWqn2JvpO2WhQ/RTKkR/cpZ27asHzvoPsaIYgJSmKlEuJwQXhENAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkffTRQe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkffTRQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0111F000E9;
	Sat, 25 Jul 2026 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997413;
	bh=Bj/hHbncUMeNlKh8qRg+5IJHF6YE4P6/GLi+MUrGLVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UkffTRQehA4neYcYdiVCixtViIt88XCMECVYh3Z1PsSoqTcYRk+zFHYnFlsdNJnat
	 aND3lIHSfNNo+ce3ELPYogOot8DlWLO2rMRsiJgBdVzm7AIi8doMpyrb1gOoPWanJg
	 QwSrQH4Coka0xAEddBi/OPX75UIg7UvrkUD1UG2jmkGR0v2C42jfbe+58Hhg7GPm9t
	 EV+iL7DOeOxlCXptluVledvwcZ42B1I/IMS63DxIhH3rXjYQli2yvsiNR4QlpMhQhX
	 mbla/PMLzffkxYuyaq0LB94EEsqU4w0v1aXb/vbQ7ODL3qoWcPz6RrZ+L15TETQCsm
	 tW9HcjdrAoEpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-tipd-ace3-v1-3-73202d36138a@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-3-73202d36138a@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 16:36:52 +0000
Message-Id: <20260725163653.4C0111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:

New issues:
- [High] Massive code duplication caused by including a large source file a=
s a header.
- [High] Linking `trace.o` into multiple modules causes multiple definition=
 linker errors.
- [High] Missing `reinit_completion()` before `wait_for_completion_timeout(=
)` in suspend and resume paths.
- [High] Race condition causing NULL pointer dereference if regmap debugfs =
is accessed during probe.
- [High] The `while (1)` polling loop in `regmap_sn201202x_select_reg` lack=
s a timeout or retry limit, leading to an indefinite kernel thread hang.
- [High] Resume will always timeout and fail if a `reset-gpios` property is=
 present due to incorrect ordering.
- [High] If `sn201202x_suspend` fails to put the device to sleep, it return=
s an error without rolling back the state of the core `tps6598x` controller.
- [High] Failing to return on invalid `count` in `regmap_sn201202x_write` c=
auses a buffer underflow and out-of-bounds memory access.
- [Medium] Unmet direct Kconfig dependencies for REGMAP_SPMI and REGMAP_I2C.
- [Medium] Unnecessary latency overhead from using a threaded IRQ solely fo=
r `complete()`.
- [Medium] The SPMI device is woken up during probe but never put back to s=
leep on driver removal or probe failure.

Pre-existing issues:
- [High] Delayed works are left queued when `tps6598x_probe` fails, causing=
 Use-After-Free.
--

--- Patch [3]: [PATCH 3/3] usb: typec: tipd: Add sn201202x support ---
commit 69eff8a2ada62351102ded8bb2c3563aa5e66570
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support

Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

> diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kcon=
fig
> --- a/drivers/usb/typec/tipd/Kconfig
> +++ b/drivers/usb/typec/tipd/Kconfig
[ ... ]
> +config TYPEC_SN201202X
> +	tristate "TI SN201202x USB Power Delivery controller support"
> +	select POWER_SUPPLY
> +	select REGMAP_I2C
> +	select USB_ROLE_SWITCH
> +	select REGMAP_SPMI

[Severity: Medium]
Will this trigger Kconfig unmet direct dependency warnings and build failur=
es
if the underlying SPMI or I2C subsystems are disabled?

Kconfig rules mandate that when using select, the selector must also depend
on the selected item's dependencies. TYPEC_SN201202X selects REGMAP_SPMI
and REGMAP_I2C without inheriting their dependencies (depends on SPMI and
depends on I2C). Also, is REGMAP_I2C needed at all in the SPMI driver?

> diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Mak=
efile
> --- a/drivers/usb/typec/tipd/Makefile
> +++ b/drivers/usb/typec/tipd/Makefile
[ ... ]
> -obj-$(CONFIG_TYPEC_TPS6598X)	+=3D tps6598x.o
> -tps6598x-y			:=3D i2c.o
> -tps6598x-$(CONFIG_TRACING)	+=3D trace.o
> +obj-$(CONFIG_TYPEC_TPS6598X)			+=3D tps6598x.o
> +tps6598x-y					:=3D i2c.o
> +tps6598x-$(CONFIG_TRACING)			+=3D trace.o
> +
> +obj-$(CONFIG_TYPEC_SN201202X)			+=3D sn201202x.o
> +sn201202x-y					:=3D spmi.o

[Severity: High]
Does including core.h from multiple modules cause massive binary bloat?

Because core.h contains a large amount of driver logic as static functions,
compiling i2c.c and spmi.c into separate modules forces the compiler to bui=
ld
two independent copies of the entire driver logic (one for tps6598x.ko and
one for sn201202x.ko). Should shared core logic be placed in a common .c fi=
le
and exported instead?

> +sn201202x-$(CONFIG_TRACING)			+=3D trace.o

[Severity: High]
Does linking trace.o into both modules cause multiple definition errors?

The Makefile appends trace.o to both tps6598x-y and sn201202x-y. Because
trace.c defines CREATE_TRACE_POINTS, it instantiates global tracepoint symb=
ols.
If both CONFIG_TYPEC_TPS6598X=3Dy and CONFIG_TYPEC_SN201202X=3Dy are set, K=
build
will link trace.o into both composite objects, leading to multiple definiti=
on
errors for the tracepoint symbols during the vmlinux link.

> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static int regmap_sn201202x_select_reg(struct spmi_device *sdev, u8 reg)
> +{
> +	int err;
> +	u8 val;
> +	bool warned =3D false;
> +	struct tps6598x *tps =3D spmi_device_get_drvdata(sdev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +
> +	reinit_completion(&sn->select_completion);

[Severity: High]
Can this dereference a NULL pointer if a user accesses regmap debugfs early?

In sn201202x_probe(), devm_regmap_init_sn201202x() is called before the dev=
ice
drvdata is set with spmi_device_set_drvdata(). This makes the regmap debugfs
nodes immediately available.

If debugfs is read before probe finishes, regmap_sn201202x_read() will call
regmap_sn201202x_select_reg(), which fetches a NULL drvdata here and passes
it to tps_to_sn(). This will crash when accessing &sn->select_completion.

> +	err =3D spmi_register_zero_write(sdev, reg);
> +	if (err)
> +		return err;
> +
> +	if (!wait_for_completion_timeout(&sn->select_completion, msecs_to_jiffi=
es(100)))
> +		return -ETIMEDOUT;
> +
> +	while (1) {
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

[Severity: High]
Does this polling loop lack a timeout condition?

If the device repeatedly returns val =3D=3D (reg | 0x80) due to a hardware
malfunction, this loop will endlessly sleep for 20ms and retry without a
limit. This permanently hangs the calling kernel thread while holding the
regmap mutex.

> +		if (val =3D=3D reg)
> +			break;
> +		return -EIO;
> +	}
[ ... ]
> +static int regmap_sn201202x_write(void *context, const void *data,
> +				  size_t count)
> +{
> +	int err =3D 0;
> +	unsigned int offset =3D 0xa0;
> +	size_t len;
> +	u8 addr;
> +
> +	WARN_ON(count < 1);
> +
> +	addr =3D *(u8 *)data;
> +	data +=3D 1;
> +	count -=3D 1;

[Severity: High]
Does failing to return on an invalid count cause a massive out-of-bounds ac=
cess?

WARN_ON(count < 1) evaluates the condition but does not abort execution.
If count is 0 (e.g., via a regmap debugfs zero-length write), the operations
above execute on the invalid data pointer, and count -=3D 1 causes count to
underflow to SIZE_MAX.

The subsequent while (count) loop will execute up to SIZE_MAX bytes, floodi=
ng
the SPMI bus with out-of-bounds memory accesses.

> +
> +	WARN_ON(count > 0x40);
[ ... ]
> +static irqreturn_t sn201202x_irq(int irq, void *data)
> +{
> +	struct completion *c =3D data;
> +
> +	complete(c);
> +	return IRQ_HANDLED;
> +}
[ ... ]
> +static int sn201202x_probe(struct spmi_device *device)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(&device->dev, irq_select, NULL, sn201=
202x_irq,
> +					IRQF_ONESHOT, NULL, &sn->select_completion);

[Severity: Medium]
Does registering a threaded IRQ handler that only calls complete() add
unnecessary context-switch latency?

Because the primary handler is NULL, the kernel must wake up and schedule a
dedicated thread for every single SPMI register read/write transaction or
state transition. Could this be handled in a primary hardirq context using
devm_request_irq() instead?

> +	if (ret)
> +		return ret;
[ ... ]
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +
> +	spmi_device_set_drvdata(device, tps);
> +	return tps6598x_probe(tps);
> +}

[Severity: Medium]
If tps6598x_probe() fails, is the device left permanently awake?

This function wakes the SPMI device via spmi_command_wakeup(), but if
tps6598x_probe() returns an error, the function aborts without calling
spmi_command_sleep() to roll back the hardware state, leaking power.

[Severity: High]
This is a pre-existing issue, but does a failure in tps6598x_probe() leave
delayed works queued, causing a Use-After-Free?

In core.h, the tps6598x_probe() error paths jump to err_disconnect and
clean up, but fail to cancel scheduled delayed works (like cd321x->update_w=
ork).
When probe fails, devres frees the device structures, leaving the delayed
work queued to dereference freed memory later.

> +static void sn201202x_remove(struct spmi_device *device)
> +{
> +	struct tps6598x *tps =3D spmi_device_get_drvdata(device);
> +
> +	tps6598x_remove(tps);
> +}

[Severity: Medium]
Does removing the driver leave the hardware permanently awake?

sn201202x_probe() sends a wakeup command to the SPMI device, but this remove
function fails to issue an spmi_command_sleep() command to balance it.

> +static int __maybe_unused sn201202x_resume(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	err =3D spmi_command_wakeup(sn->sdev);
> +	if (err)
> +		return err;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;

[Severity: High]
Does this completion wait need a prior reinit_completion() call?

The completions for sleep and wake are never re-initialized. If a prior
wait timed out but the interrupt fired later, or a spurious interrupt
incremented the counter, this wait_for_completion_timeout() will observe
done > 0 and return immediately without waiting for the hardware transition.

[Severity: High]
Will this resume operation always timeout and fail if a reset-gpios property
is present?

This function sends an spmi_command_wakeup() and waits for the completion
BEFORE calling tps6598x_resume(). However, if a reset-gpios property is
present, tps6598x_suspend() asserts the hardware reset line.

Because tps6598x_resume() (which de-asserts the reset line) hasn't executed
yet, the device is physically held in hardware reset when the SPMI wake
command is sent, guaranteeing a timeout failure.

> +	return tps6598x_resume(dev);
> +}
> +
> +static int __maybe_unused sn201202x_suspend(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	err =3D tps6598x_suspend(dev);
> +	if (err)
> +		return err;
> +	err =3D spmi_command_sleep(sn->sdev);
> +	if (err)
> +		return err;

[Severity: High]
If spmi_command_sleep() fails, is the core tps6598x controller left
indefinitely disabled?

tps6598x_suspend() disables the main IRQ and cancels active workqueues.
If the subsequent sleep command fails, this function returns an error witho=
ut
calling tps6598x_resume(). The PM core will abort the system suspend, but it
will not call resume for devices that failed to suspend, leaving the hardwa=
re
inoperable.

> +	if (!wait_for_completion_timeout(&sn->sleep_completion, msecs_to_jiffie=
s(100)))
> +		return -ETIMEDOUT;

[Severity: High]
Does this completion wait need a prior reinit_completion() call?

Similar to the resume path, sn->sleep_completion is not re-initialized befo=
re
the wait, which could cause it to incorrectly return immediately if the
completion state is stale.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-tipd-ace3-=
v1-0-73202d36138a@chaosmail.tech?part=3D3
