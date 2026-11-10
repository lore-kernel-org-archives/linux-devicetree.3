Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283149;
	b=mYBZH4A//z/9YMtym1GOHFMKU/5ius5WOzf3yWoMkHTvgx3aI3htZCL1cKvEDTfbOfMh
	 5Jvy+xDuqlnYT8uQcJDDdey8xri9h0UKLq3WL5pdXNDva/RTfkvsUB2XCpKdjeGegU+wT
	 q7feCnwqdfKCMf0w1F1NojpYW/ZBDrr2H8cnoeA7GWjzjageF2SOdaRIBk604My7GRjUZ
	 wevnjncSLeSCNp+ztWY+zjPeuJhAYFBZIgipZg9ZHiZgX74xNCeuJCKwGTaXKdT74xDRd
	 cDzb9Y/psyb548iEq9ym9GhvMG/AD+m6DPtBmn9v3PnXjc15s7Ov84QU2tKL/BjCAcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283149;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6I0X8qpoGJlv5xV9tILt2wD6oGUibwN40AGl3TCX6tE=;
	b=uHZapv/kORT4wRz4n/WYjBJcL3kiaRDcN9UM5EDrh0WMlR3x2TdAf1gRN043KDIuklrJ
	 Ae1kquMh0hxG24k84XWGF/Bml+mqs2gtmVQH/TrNBAuS/OMIkNC5Nk8ihy1aVMVWAoro2
	 OxYFks9M1209L+uRhgZiFDSKS7/eqFb6eYz9iIItYy4lVJS9l1Re97Y+3cJj0ZNTm7Bj0
	 991t9ofwLrmEBoWIEloK1+VAXWs9G/7611lvGF9x2UfLxxbUgqG7DYTI5W2pJpJH7XiOZ
	 xdG3GzCsmD55g0A0jV2z1tgy5KSfvKG4o9xeZCY0FADRbmbyXQVXmHtqS4DznrO+7BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmsRQbhG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB227606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmsRQbhG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEA51F0089F;
	Tue, 10 Nov 2026 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794283148;
	bh=6I0X8qpoGJlv5xV9tILt2wD6oGUibwN40AGl3TCX6tE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TmsRQbhGiPRrK38kByAUrh+z5Gth8iRuCACLo7sKz6S32y+/jYW8JeFC9XHXcd3Sx
	 PaUw7rjcw7Ztcy0fZJKWIgsSzN1zgPYxlyj7506QTQpyh/3AVNlQ6zJIe1LewDNe1q
	 7X6OvdYK4REio39OuUQhFNRhzHIdvcACIBfSsSUzpayeKVvlCsK2udLhg6euMzg+2W
	 6UnAnylMz0DcikVoV4JURokOSOJ2KhcB37BD0N+vTiiNwrdYG/K+vrR1qUXtgjPu3y
	 HigdRYKeEJA8hGmXwOZ8BH7WGpaU/BM+5CL088BV0lMaoCQ6EUmSadSuijGL26AY7q
	 NdeFfd9fPfP9w==
Message-ID: <sashiko-outbox-206158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-7-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
 <20261110-enable-byte-cntr-for-ctcu-v22-7-05d48c0eb110@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:59:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Medium] coresight: ctcu: unsynchronized concurrent read() in
  tmc_byte_cntr_get_data()
- [Medium] coresight: ctcu: state desynchronization in
  ctcu_byte_cntr_start() and stop()
- [Medium] coresight: tmc: broken ETR_MODE_RESRV fallback in
  tmc_read_prepare_etr()
- [Medium] coresight: tmc: tmc_read() converts byte-cntr negative errors
  into EOF
- [Medium] coresight: ctcu: BYTECNTRVAL register not reset in
  ctcu_platform_remove()
- [Medium] coresight: ctcu: UAF race between byte_cntr_sysfs_ops and
  CTCU teardown
- [Medium] coresight: ctcu: byte-cntr state desync on generic read
  fallback and unprepare
--

commit a4fb3ce63a75e273453b0d77a16ba13d3f857042
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: ctcu: enable byte-cntr for TMC ETR devices

This commit adds CTCU byte-counter interrupt support for TMC ETR sinks so
trace data can be transferred from rotating ETR buffers to userspace while
tracing is active.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..56a9aa2f693ab
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
[ ... ]
> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device=
 *ctcu,
> +						 struct coresight_device *etr)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct ctcu_drvdata *drvdata;
> +	int port;
> +
> +	/* The ETR may not be connected to a CTCU device */
> +	if (!ctcu)
> +		return NULL;
> +
> +	drvdata =3D dev_get_drvdata(ctcu->dev.parent);
> +	port =3D coresight_get_in_port(etr, ctcu);
> +	if (port < 0 || port >=3D ETR_MAX_NUM)
> +		return NULL;
> +
> +	byte_cntr_data =3D &drvdata->byte_cntr_data[port];
> +	/* The port is not initialized by ctcu_byte_cntr_init() */
> +	if (!byte_cntr_data->ctcu_drvdata)
> +		return NULL;
> +
> +	return byte_cntr_data;
> +}

[Severity: Medium]
Can an in-flight byte_cntr_sysfs_ops call race with ctcu_platform_remove()
and cause a use-after-free of ctcu, ctcu->pdata, or drvdata?

tmc_read_prepare_etr(), tmc_etr_get_sysfs_trace(), and
tmc_read_unprepare_etr() load byte_cntr_sysfs_ops with READ_ONCE() and call
into coresight-ctcu without holding a lock or pinning the CTCU device.
Because session_done is initialized as completed and is only reinitialized
after tmc_read_prepare_byte_cntr() looks up ctcu and byte_cntr_data (and
remains completed throughout generic ETR sysfs reads), ctcu_platform_remove=
()
does not wait for callers that have already loaded byte_cntr_sysfs_ops:

CPU0                                  CPU1
tmc_read_prepare_etr()
  ops =3D READ_ONCE(byte_cntr_sysfs_ops)
  ops->read_prepare(drvdata)
    ctcu =3D tmc_etr_get_ctcu_device()
                                      ctcu_platform_remove()
                                        wait_for_completion(&session_done)
                                        ctcu_byte_cntr_put_ops(drvdata)
                                        ctcu_remove(pdev)
                                          coresight_unregister(csdev)
    ctcu_get_byte_cntr(ctcu, ...)
      coresight_get_in_port(etr, ctcu)  <-- use-after-free

If a second CTCU device is present, ctcu_byte_cntr_put_ops() does not clear
byte_cntr_sysfs_ops at all when the first CTCU is removed.

> +
> +/*
> + * ctcu_byte_cntr_get_data() - reads data from the deactivated and fille=
d buffer.
> + * The byte-cntr reading work reads data from the deactivated and filled=
 buffer.
> + * The read operation waits for a buffer to become available, either fil=
led or
> + * upon timeout, and then reads trace data from the synced buffer.
> + */
> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, l=
off_t pos,
> +				      size_t len, char **bufpp)
> +{
> +	struct coresight_device *ctcu =3D tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct device *dev =3D &etr_drvdata->csdev->dev;
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct etr_buf *sysfs_buf;
> +	atomic_t *irq_cnt;
> +	ssize_t actual;
> +	int ret;
> +
> +	/* No byte-cntr read session, let the caller use the generic read */
> +	byte_cntr_data =3D ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
> +	    !byte_cntr_data->reading)
> +		return -EINVAL;
> +
> +	/*
> +	 * A zero-length read must not be treated as the end of the buffer,
> +	 * otherwise the unread data of the current buffer would be dropped.
> +	 */
> +	if (!len)
> +		return 0;
> +
> +	irq_cnt =3D &byte_cntr_data->irq_cnt;
> +
> +wait_buffer:
> +	if (!byte_cntr_data->buf_node) {
> +		ret =3D wait_event_interruptible_timeout(byte_cntr_data->wq,
> +				(atomic_read(irq_cnt) >=3D MAX_IRQ_CNT - 1) ||
> +				!byte_cntr_data->enable,
> +				BYTE_CNTR_TIMEOUT);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * The current etr_buf is almost full or timeout is triggered,
> +		 * so switch the buffer and mark the switched buffer as reading.
> +		 */
> +		if (byte_cntr_data->enable) {
> +			byte_cntr_data->buf_node =3D
> +				tmc_etr_switch_buf_node(etr_drvdata);
> +			if (!byte_cntr_data->buf_node) {
> +				/*
> +				 * The sink has stopped, let the generic read
> +				 * handle the last etr_buf.
> +				 */
> +				if (coresight_get_mode(etr_drvdata->csdev) !=3D CS_MODE_SYSFS)
> +					return 0;
> +
> +				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
> +				return -ENOMEM;
> +			}
> +
> +			/*
> +			 * Get the interrupt count of the switched out etr_buf
> +			 * and reset it for the next etr_buf.
> +			 */
> +			if (atomic_xchg(irq_cnt, 0) >=3D MAX_IRQ_CNT)
> +				dev_warn(dev, "Data overwrite happened\n");
> +		} else {
> +			/*
> +			 * The CTCU device is removed while the sink is still
> +			 * running. The generic read can't be used then as the
> +			 * buffer in use is not synced yet, end the reading.
> +			 */
> +			if (READ_ONCE(byte_cntr_data->removing) &&
> +			    coresight_get_mode(etr_drvdata->csdev) =3D=3D CS_MODE_SYSFS)
> +				return -ENODEV;
> +
> +			/* Exit byte-cntr reading */
> +			return 0;
> +		}
> +	}
> +
> +	pos =3D byte_cntr_data->buf_node->pos;
> +	sysfs_buf =3D byte_cntr_data->buf_node->sysfs_buf;
> +	actual =3D tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
> +	if (actual <=3D 0) {
> +		/* Reset buf_node upon reading is finished or failed */
> +		byte_cntr_data->buf_node->reading =3D false;
> +		byte_cntr_data->buf_node =3D NULL;
> +
> +		/*
> +		 * Nothing in the buffer, waiting for the next buffer
> +		 * to be filled.
> +		 */
> +		if (actual =3D=3D 0)
> +			goto wait_buffer;
> +	}
> +
> +	return actual;
> +}

[Severity: Medium]
Can concurrent read() calls on the same open /dev/tmc_etrX file descriptor
race on byte_cntr_data->buf_node and cause a NULL pointer dereference?

/dev/tmc_etrX is a character device opened with nonseekable_open(), so VFS
does not serialize concurrent read() calls with file->f_pos_lock.  While
byte_cntr_data->reading prevents a second open(), two threads sharing one
open file descriptor can enter tmc_byte_cntr_get_data() concurrently:

CPU0                                  CPU1
tmc_byte_cntr_get_data()              tmc_byte_cntr_get_data()
  if (!byte_cntr_data->buf_node)        if (!byte_cntr_data->buf_node)
    wait_event_interruptible_timeout()    wait_event_interruptible_timeout()
    buf_node =3D tmc_etr_switch_buf_node()
                                          buf_node =3D tmc_etr_switch_buf_n=
ode()
                                          /* returns NULL: no free node */
                                          return -ENOMEM;
  pos =3D byte_cntr_data->buf_node->pos;  <-- NULL pointer dereference

Similarly, while one reader is in copy_to_user() in tmc_read() before
tmc_etr_update_buf_node_pos(), a second reader can reach the end of the
buffer, clear buf_node->reading, and call tmc_etr_switch_buf_node() to
restart ETR DMA into the buffer still being copied to userspace.

> +
> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu =3D tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int ret =3D 0;
[ ... ]
> +	reinit_completion(&byte_cntr_data->session_done);
> +	byte_cntr_data->reading =3D true;
> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +
> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret =3D tmc_create_etr_buf_list(etr_drvdata, 2);
> +	if (ret)
> +		goto err_reading;

[Severity: Medium]
What happens if the ETR is in ETR_MODE_RESRV when byte-cntr is enabled, or
if a second open() races with an active fallback read session?

ctcu_byte_cntr_start() does not reject ETR_MODE_RESRV, so
tmc_create_etr_buf_list() returns -EINVAL.  tmc_read_prepare_etr() treats
-EINVAL from read_prepare() as meaning byte-cntr is not configured and falls
back to the generic sysfs read path, calling __tmc_etr_disable_hw() and
setting drvdata->reading =3D true while byte_cntr_data->enable and
byte_cntr_data->irq_enabled remain true.

Because tmc_read_prepare_byte_cntr() sets byte_cntr_data->reading =3D true
before tmc_create_etr_buf_list() allocates a node and checks
drvdata->reading, a subsequent open() during that fallback read session
briefly sets byte_cntr_data->reading =3D true.  A concurrent read() in the
first session then enters tmc_byte_cntr_get_data() instead of reading
drvdata->sysfs_buf and fails with -ENOMEM because etr_buf_list is empty.

[ ... ]
> +static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu =3D tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	/*
> +	 * Do the unprepare operation only when the byte_cntr_data->reading
> +	 * is truly set
> +	 */
> +	byte_cntr_data =3D ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
> +	    !byte_cntr_data->reading)
> +		return -EINVAL;
> +
> +	tmc_clean_etr_buf_list(etr_drvdata);
> +
> +	/* disable_irq_wake() may sleep on slow-bus irqchips, call it unlocked =
*/
> +	disable_irq_wake(byte_cntr_data->irq);
> +
> +	/*
> +	 * The byte-cntr register is not accessed here: the trace path, which
> +	 * keeps the CTCU powered, may have been released already. It is reset
> +	 * when the path is disabled.
> +	 */
> +	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
> +		byte_cntr_data->buf_node =3D NULL;
> +		byte_cntr_data->reading =3D false;

[Severity: Medium]
Does clearing etr_buf_list before clearing byte_cntr_data->reading allow a
new trace session to start with byte-cntr skipped?

ctcu_byte_cntr_start() skips enabling byte-cntr when
byte_cntr_data->reading is set, relying on tmc_enable_etr_sink_sysfs() to
fail with -EBUSY while etr_buf_list is non-empty.  Because
tmc_read_unprepare_byte_cntr() empties etr_buf_list and calls
disable_irq_wake() before clearing byte_cntr_data->reading, a concurrent
trace enable in that window sees byte_cntr_data->reading =3D=3D true in
ctcu_byte_cntr_start() and an empty etr_buf_list in
tmc_enable_etr_sink_sysfs(), starting the trace without byte-cntr.

> +		/*
> +		 * Complete the session with reading cleared in one critical
> +		 * section, so that a new session can't start in between.
> +		 * ctcu_platform_remove() may free byte_cntr_data after this,
> +		 * don't use it anymore.
> +		 */
> +		complete_all(&byte_cntr_data->session_done);
> +	}
> +
> +	module_put(THIS_MODULE);
> +
> +	return 0;
> +}
> +
> +static const struct tmc_sysfs_ops byte_cntr_sysfs_ops =3D {
> +	.read_prepare	=3D tmc_read_prepare_byte_cntr,
> +	.read_unprepare	=3D tmc_read_unprepare_byte_cntr,
> +	.get_trace_data	=3D tmc_byte_cntr_get_data,
> +};
> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresig=
ht_path *path)
> +{
> +	struct coresight_device *sink =3D coresight_get_sink(path);
> +	struct tmc_drvdata *etr_drvdata;
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	byte_cntr_data =3D ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	etr_drvdata =3D dev_get_drvdata(sink->dev.parent);
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	/*
> +	 * Don't start byte-cntr function when irq_enabled is not set, when the
> +	 * CTCU device is being removed, or when the read of the previous trace
> +	 * is still in progress: the sink can't be enabled until it is finished.
> +	 */
> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing ||
> +	    byte_cntr_data->reading)
> +		return;
> +
> +	/*
> +	 * Don't touch the count and the threshold if the byte-cntr is already
> +	 * started by another path of the same sink, as the buffer_size may have
> +	 * been changed since then while the etr_buf in use is not.
> +	 */
> +	if (byte_cntr_data->enable)
> +		return;
> +
> +	/* A new trace starts with an empty etr_buf */
> +	atomic_set(&byte_cntr_data->irq_cnt, 0);
> +
> +	/*
> +	 * Configure the byte-cntr register to enable IRQ while the path is
> +	 * enabled, the CTCU is powered then. The configured size is 5% of the
> +	 * buffer_size.
> +	 */
> +	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
> +			       etr_drvdata->size / MAX_IRQ_CNT,
> +			       byte_cntr_data->irq_ctrl_offset);
> +	byte_cntr_data->enable =3D true;
> +}
> +
> +/* Stop the byte-cntr function when the path is disabled. */
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresigh=
t_path *path)
> +{
> +	struct coresight_device *sink =3D coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	if (coresight_get_mode(sink) =3D=3D CS_MODE_SYSFS)
> +		return;

[Severity: Medium]
Can byte_cntr_data->irq_enabled, byte_cntr_data->enable, and the ETR sink
state get out of sync across start, read prepare, and stop?

The ABI documentation states that changing irq_enabled while tracing does
not start or stop byte-cntr for the running trace, but irq_enabled_store()
only checks byte_cntr_data[port].reading:

1. If a trace is started with irq_enabled =3D=3D 1 and irq_enabled is set t=
o 0
   before opening /dev/tmc_etrX, tmc_read_prepare_byte_cntr() sees
   !byte_cntr_data->irq_enabled and returns -EINVAL.  tmc_read_prepare_etr()
   then falls back to the generic read and stops the ETR while
   byte_cntr_data->enable and the IRQCTRL register remain active.

2. If a first path starts tracing on the ETR with irq_enabled =3D=3D 0, and
   irq_enabled is then set to 1 before a second path to the same ETR is
   enabled, ctcu_byte_cntr_start() only checks byte_cntr_data->enable (not
   whether the sink is already active) and starts byte-cntr mid-trace using
   etr_drvdata->size.  If enabling a later component on that second path
   fails, ctcu_byte_cntr_stop() sees coresight_get_mode(sink) =3D=3D CS_MOD=
E_SYSFS
   from the first path and returns without undoing byte_cntr_data->enable or
   zeroing irq_ctrl_offset.

3. If a fallback generic read is open (etr_drvdata->reading =3D=3D true) wh=
en
   the trace path is disabled, tmc_disable_etr_sink() returns -EBUSY and
   leaves the sink mode as CS_MODE_SYSFS, so ctcu_byte_cntr_stop() returns
   early without disabling irq_ctrl_offset or clearing byte_cntr_data->enab=
le
   before the path is released.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index 739105acb0a13..564ecc5ad5153 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
[ ... ]
> @@ -244,10 +355,59 @@ static int ctcu_platform_probe(struct platform_devi=
ce *pdev)
>  static void ctcu_platform_remove(struct platform_device *pdev)
>  {
>  	struct ctcu_drvdata *drvdata =3D platform_get_drvdata(pdev);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int i;
> =20
>  	if (WARN_ON(!drvdata))
>  		return;
> =20
> +	/*
> +	 * Signal all active byte-cntr readers to exit, then wait for them to
> +	 * finish before resetting the ops pointer and freeing driver data.
> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
> +	 *
> +	 * The wait ends only when the userspace closes the tmc_etr file, so an
> +	 * unbind with the file left open blocks until then. Unloading the modu=
le
> +	 * is rejected with -EBUSY while a read session is open, so only a manu=
al
> +	 * unbind can block here.
> +	 */
> +	for (i =3D 0; i < ETR_MAX_NUM; i++) {
> +		byte_cntr_data =3D &drvdata->byte_cntr_data[i];
> +		/* The port was not initialized by ctcu_byte_cntr_init() */
> +		if (!byte_cntr_data->irq)
> +			continue;
> +
> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> +		/*
> +		 * Set enable=3Dfalse to signal teardown to racing readers, and
> +		 * removing=3Dtrue to keep a new path from enabling byte-cntr again.
> +		 */
> +		byte_cntr_data->enable =3D false;
> +		byte_cntr_data->removing =3D true;
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);

[Severity: Medium]
Should ctcu_platform_remove() clear the hardware irq_ctrl_offset register
when byte_cntr_data->enable is true?

Setting byte_cntr_data->enable =3D false here without writing 0 to
irq_ctrl_offset means ctcu_byte_cntr_stop() will see enable =3D=3D false and
skip clearing the register as well, leaving the CTCU hardware firing
byte-counter interrupts while wait_for_completion() waits for the file to be
closed and until the trace path is disabled.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index cc341cdf8d8e5..d856f0a190f72 100644
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
> +		/*
> +		 * -EINVAL means byte-cntr has no active read session. 0 means
> +		 * byte-cntr has no more data because the sink has stopped, the
> +		 * last etr_buf is read by the generic read. Anything else is
> +		 * the result of the byte-cntr session.
> +		 */
> +		if (ret !=3D -EINVAL && ret !=3D 0)
> +			return ret;
> +	}
> +
> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
> +}

[Severity: Medium]
Doesn't tmc_read() turn negative error codes from tmc_etr_get_sysfs_trace()
into 0 (EOF)?

tmc_byte_cntr_get_data() returns -ERESTARTSYS when interrupted by a signal
(as well as -ENOMEM and -ENODEV on failure), and tmc_etr_get_sysfs_trace()
propagates those negative values.  However, the caller in tmc_read() drops
all negative returns:

drivers/hwtracing/coresight/coresight-tmc-core.c:tmc_read() {
    ...
	actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
	if (actual <=3D 0)
		return 0;
    ...
}

Any signal delivered while waiting in wait_event_interruptible_timeout()
causes read() to return 0 (EOF) instead of -ERESTARTSYS, terminating trace
collection early while the ETR is still tracing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-enable-byt=
e-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com?part=3D7
