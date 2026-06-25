Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542793921E6
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385766; cv=none; b=SQGYnoxaNu6qfC1fgksk2QyluFGKmYGq+OHjJ4LgPUaMVTtU7mYKbbcqKSNWvzjFHOXpbbg1m3qfKUwBOWU0X/skTogMc1B6xRj6+6rIJYH9a8v5EnZCY3q4bwUPQA2rEmZ7fY3/KTJ4a3lElukgcpwRzVzMkCMU+184MWYQU7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385766; c=relaxed/simple;
	bh=BxR8PEHaYOTssetGC7M06obE/oXPZ8m9YAkJ6U2vISA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rQ063RPI5hvscNCUvShdCdG94YNmhRW/iUkus0oRKWsM8kEWYtYVdu24x/xIyXZUQ8WOrIbJzhvJ7pWh+knEHSSv6mizya0eWPHw4luzkXI8cwXtY0dpPVIW9D4OAw0+JCzyjXW/FyM8CEixOq9D5ylaJ1cM5McHT4rMdqfwyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoHu1Qjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoHu1Qjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8EA1F000E9;
	Thu, 25 Jun 2026 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385765;
	bh=bV1zMwhZsY7pGY1X0r34LSdUD0ngwlrYQ+U8EOeLeBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WoHu1QjwxntLccBB88b6IeSGmuFG+L5dukb9gvel1UOJMjF+k5/2elg6ZilF5cwID
	 BuwI7KWSQg+ByzvwsHRYBJBcYjLGUDiIRySpEqPFX103e4K4Q5Jqb3hFacFxlvEwED
	 94Czd1QVH3+KHywtd9y/Fr+rVe8zboU7fSixhaeOnZoYFuXA0Sicj/5qyIxK+2cx/2
	 pswS+wwAW00fZ0l3a4NcgppC16P9zbfw1A8nfQB/klmbGGhvv+ri2TvHCQg/2k+FVH
	 2nlk9QM3h9gTSqtlKOL9Vxw2vf4n1bWcx1KK0QWQX+wCsndJR2czb8ktp0RwCjagq4
	 de+rEZPbYvmdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-6-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
 <20260625-enable-byte-cntr-for-ctcu-v19-6-8fbbf22e8381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:09:23 +0000
Message-Id: <20260625110924.BA8EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Global function pointer accessed locklessly leads to Use-After=
-Free on driver unload
- [Critical] Global sysfs ops pointer triggers NULL pointer dereference on =
ETR without CTCU
- [High] Driver remove/unbind blocks indefinitely waiting for userspace fil=
e closure
- [High] ctcu_byte_cntr_stop() skips setting enable=3Dfalse for SYSFS mode,=
 causing infinite read hangs
- [High] TOCTOU race re-enables ETR hardware after framework disables it
- [High] Missing wake_up() in error path deadlocks driver remove()
- [High] Unsynchronized checks of irq_enabled lead to resource leaks and dr=
iver unbind hangs
- [High] Data race on concurrent read() calls causes NULL pointer dereferen=
ce
- [Medium] Spurious Interrupt Handling due to missing hardware status check=
 in shared IRQ
- [Medium] Error codes (-ERESTARTSYS) from byte_cntr_ops are swallowed and =
convert to EOF
- [Medium] Masked error code breaks sysfs reading fallback on memory failure
--

commit 128ffef0065b7b8a8c73e5e3f9b0ce8bebea0593
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: ctcu: enable byte-cntr for TMC ETR devices

This patch introduces the byte-cntr function provided by the CTCU device to
transfer data from the ETR buffer to userspace. It sets up an interrupt
handler to track data size thresholds and switches buffers when full or on
timeout. It also integrates with the TMC ETR framework via sysfs ops.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..5ab97a71f02f6
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
[ ... ]
> +static irqreturn_t byte_cntr_handler(int irq, void *data)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data =3D data;
> +
> +	atomic_inc(&byte_cntr_data->irq_cnt);
> +	wake_up(&byte_cntr_data->wq);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Is this handler missing a hardware status check?

Since the IRQ is registered with IRQF_SHARED, another device sharing the li=
ne
could fire an interrupt. By unconditionally returning IRQ_HANDLED without
verifying the interrupt source, the kernel's spurious interrupt detection
might be suppressed, and the CTCU buffer switch logic could be triggered
prematurely.

[ ... ]
> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device=
 *ctcu,
> +						 struct coresight_device *etr)
> +{
> +	struct ctcu_drvdata *drvdata =3D dev_get_drvdata(ctcu->dev.parent);

[Severity: Critical]
Could this dereference a NULL pointer if an ETR without a connected CTCU
is used?

If the system has multiple ETRs and one lacks a CTCU, the globally register=
ed
byte_cntr_sysfs_ops might pass a NULL ctcu pointer here. This would cause a
panic when ctcu->dev.parent is accessed.

[ ... ]
> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
> +					 struct ctcu_byte_cntr *byte_cntr_data)
> +{
[ ... ]
> +	raw_spin_unlock_irqrestore(&etr_drvdata->spinlock, flags);
> +
> +	/* Restart the ETR once a free buffer is available */
> +	if (found_free_buf &&
> +	    coresight_get_mode(etr_drvdata->csdev) !=3D CS_MODE_DISABLED)
> +		tmc_etr_enable_disable_hw(etr_drvdata, true);
> +
> +	return found_free_buf;
> +}

[Severity: High]
Does this lockless check introduce a race condition?

If a concurrent operation disables the trace session and drops the lock bef=
ore
setting the mode to CS_MODE_DISABLED, this code might incorrectly re-enable
the hardware after the framework has explicitly disabled it.

[ ... ]
> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, l=
off_t pos,
> +				      size_t len, char **bufpp)
> +{
[ ... ]
> +	pos =3D byte_cntr_data->buf_node->pos;
> +	sysfs_buf =3D byte_cntr_data->buf_node->sysfs_buf;
> +	actual =3D tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
> +	if (actual <=3D 0) {
> +		/* Reset buf_node upon reading is finished or failed */
> +		byte_cntr_data->buf_node->reading =3D false;
> +		byte_cntr_data->buf_node =3D NULL;

[Severity: High]
Can concurrent read operations cause a NULL pointer dereference here?

If two threads read from the same ETR file descriptor, they could concurren=
tly
access and modify byte_cntr_data->buf_node without serialization, causing o=
ne
thread to clear the pointer while the other is still using it.

[ ... ]
> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu =3D tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	/* byte-cntr is operating with SYSFS mode being enabled only */
> +	if (coresight_get_mode(etr_drvdata->csdev) !=3D CS_MODE_SYSFS)
> +		return -EINVAL;
> +
> +	byte_cntr_data =3D ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
> +		return -EINVAL;
> +
> +	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);

[Severity: High]
Does checking irq_enabled outside the spinlock create a race?

A concurrent sysfs write could set irq_enabled to 0 immediately before the
lock is acquired. If reading is then set to true, read_unprepare() will lat=
er
abort early upon seeing irq_enabled is 0. This would leak the buffer list a=
nd
leave reading permanently true, causing the driver unbind to hang forever.

[ ... ]
> +	byte_cntr_data->reading =3D true;
> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret =3D tmc_create_etr_buf_list(etr_drvdata, 2);
> +	if (ret) {
> +		byte_cntr_data->reading =3D false;
> +		return ret;
> +	}

[Severity: High]
Is this error path missing a wake_up() call?

If this allocation fails, the reading flag is cleared, but concurrent reade=
rs
waiting in the driver's remove function won't be notified, potentially
deadlocking the unbind process.

[ ... ]
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresigh=
t_path *path)
> +{
> +	struct coresight_device *sink =3D coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	if (coresight_get_mode(sink) =3D=3D CS_MODE_SYSFS)
> +		return;

[Severity: High]
Should the enable flag be cleared for SYSFS mode here?

By returning early, enable remains true. Readers waiting in
tmc_byte_cntr_get_data() might never receive the EOF condition when the
trace is stopped, causing them to loop indefinitely.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index e8720026c9e3f..2da1a6f3d29f4 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
[ ... ]
> +static void ctcu_platform_remove(struct platform_device *pdev)
> +{
> +	struct ctcu_drvdata *drvdata =3D platform_get_drvdata(pdev);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int i;
> +
> +	if (WARN_ON(!drvdata))
> +		return;
> +
> +	/*
> +	 * Signal all active byte-cntr readers to exit, then wait for them to
> +	 * finish before resetting the ops pointer and freeing driver data.
> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
> +	 */
> +	for (i =3D 0; i < ETR_MAX_NUM; i++) {
> +		byte_cntr_data =3D &drvdata->byte_cntr_data[i];
> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> +		/* Set enable=3Dfalse for all ports to signal teardown to racing reade=
rs */
> +		byte_cntr_data->enable =3D false;
> +		if (!byte_cntr_data->reading) {
> +			raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +			continue;
> +		}
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		wake_up_all(&byte_cntr_data->wq);
> +		wait_event(byte_cntr_data->wq, !byte_cntr_data->reading);
> +	}

[Severity: High]
Could this wait indefinitely during driver remove?

The reading flag is only cleared when the userspace file is closed. A
userspace process leaving the file descriptor open could permanently block
module unload or device unbind.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index 2b26ce6455a7b..e78f8891f11e0 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
[ ... ]
> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
> +				loff_t pos, size_t len, char **bufpp)
> +{
> +	ssize_t ret;
> +	const struct tmc_sysfs_ops *byte_cntr_ops =3D READ_ONCE(byte_cntr_sysfs=
_ops);
> +
> +	if (byte_cntr_ops) {
> +		ret =3D byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
> +		/* Return the filled buffer */
> +		if (ret > 0 || ret =3D=3D -ENOMEM)
> +			return ret;
> +	}
> +
> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
> +}

[Severity: Medium]
Does this silently swallow -ERESTARTSYS?

If a signal interrupts the wait inside tmc_byte_cntr_get_data(), it returns
-ERESTARTSYS, which falls through here to a normal sysfs buffer read. This
might convert the signal into an EOF or return unsynced data instead of
letting userspace handle the signal cleanly.

[ ... ]
> +int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
> +{
> +	int ret =3D 0;
> +	unsigned long flags;
> +	const struct tmc_sysfs_ops *byte_cntr_ops;
> =20
>  	/* config types are set a boot time and never change */
>  	if (WARN_ON_ONCE(drvdata->config_type !=3D TMC_CONFIG_TYPE_ETR))
>  		return -EINVAL;
> =20
> +	byte_cntr_ops =3D READ_ONCE(byte_cntr_sysfs_ops);
> +	if (byte_cntr_ops) {
> +		ret =3D byte_cntr_ops->read_prepare(drvdata);

[Severity: Critical]
Is it safe to access this global function pointer locklessly?

If the trace file is opened and the CTCU module is concurrently unloaded, t=
he
memory backing byte_cntr_ops could be freed before read_prepare() executes,
leading to a use-after-free regression.

> +		if (!ret || ret =3D=3D -EBUSY)
> +			return ret;
> +
> +		ret =3D 0;
> +	}

[Severity: Medium]
Why are errors like -ENOMEM from read_prepare() masked here?

If the memory allocation fails inside tmc_read_prepare_byte_cntr(), hiding =
the
error breaks the fallback sysfs reading path, leading to delays and hanging
operations instead of propagating the failure properly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-enable-byt=
e-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com?part=3D6
