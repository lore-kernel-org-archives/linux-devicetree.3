Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147187;
	b=OSUPj3Emt3ZVNzACY3noTKJvMVDAyEO/NX0DTusV4bSc9urEMbPJU+7whywUe4OM/d8b
	 b4Hg509++VfV5rHgdGsnRGbKXAcmkRkHPblTZZpInbACPbONXE3HH4bO2MqraoqxuRkB9
	 uAXo3mXiZzol9PksmbNMWN2Hqih+zwqnw2o0Rkl8hXVHQCThd0loxzGDQVyp9C9V2gfHR
	 AqpAqo0knNYv0chT0Y7RiOAH6hL8/LPAnU62LIbK+kkX4AYMSe1IBm89s3ZCj5FomRUc+
	 qqRdv9kZtdbCTyX0Ij7k9SoUJV/APbGH5NslayDqzi7hajAFWtwUWYVTMsRv7wJ/k5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5QrgIFIeyd+EZN7crOSuNaAvqvD642ffp3qteXtnVkQ=;
	b=zPqsa8t5wJPITGFbo6ZK9z3HHxR4T/CuV2+0088z6poSsXUSKTRMBIK2PP/IOXU1xGWQ
	 3dbM/pCCnkq6lgD9jNrSXC1QheRUWzK14St/RVaeJLPIOGeHzko/ynyC8mm7Z86rU4I/b
	 UIvg3ekRLbX6lCFXcxEdmKKfnw1GG0WgXAIo/B2M3xGnaUa7IGvGQpnaGAWROth6c15EK
	 iOOx/TItlksS3UeVXcHd8z+py+dqzIKMxQo+5gg90MmXKokqUwYUgLr/k4ipqQgImkzAW
	 rtfgf5674fWT6Nf23CaSTKs7mK5ZcoGAhoWCfxOzQvb3nqmVQ9pobFHErJiOCzaWNNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beMuKtRS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48240606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beMuKtRS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C49F1F000C6;
	Fri, 20 Nov 2026 03:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795147186;
	bh=5QrgIFIeyd+EZN7crOSuNaAvqvD642ffp3qteXtnVkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=beMuKtRSy3KUrfLdGtpAFI4p6GW2TfVmfRvBRYBbMkEdjrLii//B+Rvrhnw0Cr34a
	 HpmDoSihahNn4YoARhtTSi056ubSHa040I3JOjf4CxWFOh/oV8d8SEGQpcTVxGtpHb
	 4SRSMwdaJvtfvJzodzfhR+FEMdCs6/g8bWPury+6I9PrblnuHepEFmI48C+sxlViu5
	 0F4JXfjhzg6L4Rn9XWxtAaqrj0/1OffYWbJLJBo4peSKrVImRe+4xMkJQxAhpgEdWU
	 BkJ5kqKnah0kbFfQmfNJmKltCoiYNogXC6LC3hwXqhN9lz8+lBckXh1IeGP/inmJm3
	 jY2YBmKVbwhCw==
Message-ID: <sashiko-outbox-224427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-7-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
 <20261120-enable-byte-cntr-for-ctcu-v24-7-2d792c6b4819@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 03:59:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] coresight: ctcu: conflicting read sessions in
  tmc_read_prepare_byte_cntr()
- [Medium] coresight: ctcu: UAF race between byte_cntr_sysfs_ops and
  CTCU removal
- [Medium] coresight: ctcu: missing reading check in
  ctcu_byte_cntr_start()
- [Medium] coresight: tmc: tmc_read() converts negative byte-cntr errors
  into EOF
- [Medium] coresight: ctcu: premature release of read_lock in
  tmc_byte_cntr_get_data()
--

commit 4905b42ec0de51a04446a6ae0f775c313734d367
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: ctcu: enable byte-cntr for TMC ETR devices

This commit enables the CTCU byte-cntr interrupt mechanism to stream trace
data from switched TMC ETR buffers to userspace while tracing is active.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..f3dca66467817
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,484 @@

[ ... ]

> +/*
> + * Drop the ops user of the CTCU device, only once for each device. It's=
 called
> + * before the CTCU device is unregistered, so that the ops can't be used=
 with a
> + * device which is being freed, and again by the devres action.
> + */
> +void ctcu_byte_cntr_put_ops(struct ctcu_drvdata *drvdata)
> +{
> +	guard(mutex)(&byte_cntr_ops_lock);
> +	if (!drvdata->byte_cntr_ops_held)
> +		return;
> +
> +	drvdata->byte_cntr_ops_held =3D false;
> +	if (!--byte_cntr_ops_users)
> +		tmc_etr_reset_byte_cntr_sysfs_ops();
> +}

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
Can byte_cntr_sysfs_ops callbacks race with ctcu_platform_remove() and
cause a use-after-free on ctcu and drvdata?

tmc_read_prepare_etr(), tmc_etr_get_sysfs_trace(), and
tmc_read_unprepare_etr() read byte_cntr_sysfs_ops with READ_ONCE() and
call into the callbacks without holding a lock or device reference.
Because session_done is initialized as completed and is only reinitialized
midway through tmc_read_prepare_byte_cntr(), wait_for_completion() in
ctcu_platform_remove() returns immediately when no byte-cntr session has
armed it yet, and ctcu_byte_cntr_put_ops() does not wait for in-flight
callers (or clear byte_cntr_sysfs_ops if another CTCU instance exists):

CPU0                                  CPU1
tmc_read_prepare_etr()
  byte_cntr_ops =3D READ_ONCE(...)
  tmc_read_prepare_byte_cntr()
    ctcu =3D tmc_etr_get_ctcu_device()
                                      ctcu_platform_remove()
                                        wait_for_completion(&session_done)
                                        ctcu_byte_cntr_put_ops()
                                        ctcu_remove()
                                          coresight_unregister(csdev)
    ctcu_get_byte_cntr(ctcu, ...)
      dev_get_drvdata(ctcu->dev.parent)
      coresight_get_in_port(etr, ctcu)  <-- use-after-free

The same race occurs when a generic ETR sysfs read or close invokes
get_trace_data() or read_unprepare() while the CTCU device is being
unbound.

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

[ ... ]

> +	/*
> +	 * Multiple readers of one file descriptor can't get a meaningful trace
> +	 * sequence, serialize them to protect the buf_node.
> +	 */
> +	ACQUIRE(mutex_intr, read_guard)(&byte_cntr_data->read_lock);
> +	ret =3D ACQUIRE_ERR(mutex_intr, &read_guard);
> +	if (ret)
> +		return ret;

[ ... ]

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
Does releasing byte_cntr_data->read_lock on return from
tmc_byte_cntr_get_data() leave copy_to_user() and
tmc_etr_update_buf_node_pos() in tmc_read() unserialized against
concurrent readers sharing the file descriptor?

Because /dev/tmc_etrX is a character device opened with nonseekable_open(),
VFS does not hold file->f_pos_lock across tmc_read().  Once
tmc_byte_cntr_get_data() returns and drops read_lock, a second reader can
enter before the first reader updates buf_node->pos, drain the buffer, and
switch the node back to ETR DMA while the first reader is still in
copy_to_user():

CPU0 (Reader 1)                       CPU1 (Reader 2)
tmc_read()
  tmc_byte_cntr_get_data()
    lock(&byte_cntr_data->read_lock)
    pos =3D buf_node->pos
    unlock(&byte_cntr_data->read_lock)
                                      tmc_read()
                                        tmc_byte_cntr_get_data()
                                          lock(&byte_cntr_data->read_lock)
                                          /* reads same pos, drains buf */
                                          buf_node->reading =3D false
                                          buf_node =3D NULL
                                          tmc_etr_switch_buf_node()
  copy_to_user(data, bufp, actual)        /* ETR DMA reuses sysfs_buf */
  tmc_etr_update_buf_node_pos()       <-- advances new buf_node->pos or *pp=
os

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
> +	if (!byte_cntr_data)
> +		return -EINVAL;
> +
> +	/*
> +	 * A generic read session is in progress, don't mark byte-cntr as
> +	 * reading even temporarily as it misleads the reader of that session.
> +	 */
> +	if (READ_ONCE(etr_drvdata->reading))
> +		return -EBUSY;
> +
> +	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> +	/*
> +	 * irq_enabled can only be changed with the lock held and reading
> +	 * cleared, so check it here to keep it stable once reading is set.
> +	 */
> +	if (!byte_cntr_data->irq_enabled) {
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		return -EINVAL;
> +	}
> +
> +	if (byte_cntr_data->reading) {
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		return -EBUSY;
> +	}

[ ... ]

> +	reinit_completion(&byte_cntr_data->session_done);
> +	byte_cntr_data->reading =3D true;
> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +
> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret =3D tmc_create_etr_buf_list(etr_drvdata, 2);
> +	if (ret)
> +		goto err_reading;

[ ... ]

> +static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{

[ ... ]

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
> +		byte_cntr_data->reading =3D false;

[Severity: Medium]
Can tmc_read_prepare_byte_cntr() allow a generic read session to start
while byte_cntr_data->reading is still true?

tmc_read_prepare_byte_cntr() checks coresight_get_mode(etr_drvdata->csdev)
!=3D CS_MODE_SYSFS and returns -EINVAL before checking
byte_cntr_data->reading.  When tmc_read_prepare_etr() receives -EINVAL, it
falls back to generic read and only checks drvdata->reading and
!list_empty(&drvdata->etr_buf_list).  However, etr_buf_list is empty while
byte_cntr_data->reading is true in two sleeping windows: before
tmc_create_etr_buf_list() splices the list in
tmc_read_prepare_byte_cntr(), and after tmc_clean_etr_buf_list() empties
it in tmc_read_unprepare_byte_cntr():

CPU0                                  CPU1
tmc_read_prepare_byte_cntr()
  byte_cntr_data->reading =3D true
  tmc_create_etr_buf_list()
    tmc_alloc_etr_buf() /* sleeps */
                                      /* trace stops: mode !=3D CS_MODE_SYS=
FS */
                                      tmc_read_prepare_etr()
                                        tmc_read_prepare_byte_cntr()
                                          /* mode !=3D CS_MODE_SYSFS -> -EI=
NVAL */
                                        /* etr_buf_list is empty */
                                        etr_drvdata->reading =3D true
                                      tmc_read()
                                        tmc_etr_get_sysfs_trace()
                                          tmc_byte_cntr_get_data()
                                            /* sees byte_cntr_data->reading=
 */

Checking byte_cntr_data->reading before returning -EINVAL when the sink is
not in CS_MODE_SYSFS would reject the concurrent open() with -EBUSY.

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
> +	 * Don't start byte-cntr function when irq_enabled is not set, or when
> +	 * the CTCU device is being removed. A byte-cntr read of the previous
> +	 * trace still in progress doesn't matter: the sink can't be enabled wh=
ile
> +	 * its etr_buf_list exists, and ctcu_byte_cntr_stop() stops the byte-cn=
tr
> +	 * when the enabling of the path fails.
> +	 */
> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing)
> +		return;
> +
> +	/*
> +	 * The etr_bufs of the reserved mode share one memory region, they
> +	 * can't be switched by byte-cntr.
> +	 */
> +	if (etr_drvdata->etr_mode =3D=3D ETR_MODE_RESRV)
> +		return;
> +
> +	/*
> +	 * Don't start byte-cntr if the sink is already enabled by another path,
> +	 * the sink is enabled after the CTCU helper. The byte-cntr is started =
or
> +	 * not with the first path, and ctcu_byte_cntr_stop() does the same che=
ck.
> +	 * The buffer_size may also have been changed since then while the etr_=
buf
> +	 * in use is not.
> +	 */
> +	if (coresight_get_mode(sink) =3D=3D CS_MODE_SYSFS)
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

[Severity: Medium]
Should ctcu_byte_cntr_start() also bail out when byte_cntr_data->reading
is set or when coresight_get_mode(sink) !=3D CS_MODE_DISABLED?

coresight_enable_path_from_to() runs ctcu_enable() ->
ctcu_byte_cntr_start() before enabling the ETR sink.  If a byte-cntr
reader from a previous stopped trace is still open (or closing in
tmc_read_unprepare_byte_cntr() after tmc_clean_etr_buf_list() has emptied
etr_buf_list), ctcu_byte_cntr_start() resets irq_cnt to 0 and sets
byte_cntr_data->enable =3D true while byte_cntr_data->reading is still true:

CPU0                                  CPU1
/* previous trace stopped */
tmc_read()
  tmc_byte_cntr_get_data()
                                      coresight_enable_path_from_to()
                                        ctcu_byte_cntr_start()
                                          atomic_set(&irq_cnt, 0)
                                          byte_cntr_data->enable =3D true
    wait_event_interruptible_timeout()
      /* sees enable =3D=3D true, blocks instead of returning 0 for final b=
uf */

If the new path is enabled right after tmc_clean_etr_buf_list() in
tmc_read_unprepare_byte_cntr(), enabling the sink also succeeds while
byte_cntr_data->reading is still true, causing a subsequent open() for the
new trace to fail with -EBUSY.  In addition, checking only
coresight_get_mode(sink) =3D=3D CS_MODE_SYSFS allows a sysfs enable attempt
while the sink is in CS_MODE_PERF to transiently program IRQCTRL and enable
CTCU interrupts before the sink enable fails.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/h=
wtracing/coresight/coresight-tmc-core.c
> index 4b40b692be4d8..6ad09995ba87c 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __use=
r *data, size_t len,
>  		return -EFAULT;
>  	}
> =20
> -	*ppos +=3D actual;
> +	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
> +		*ppos +=3D actual;
>  	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
> =20
>  	return actual;

[Severity: Medium]
Does tmc_read() turn negative error codes from tmc_byte_cntr_get_data()
into EOF?

tmc_etr_get_sysfs_trace() forwards negative error codes other than -EINVAL
from byte_cntr_ops->get_trace_data() (such as -ERESTARTSYS or -EINTR when
a waiting reader is interrupted by a signal, -ENOMEM, or -ENODEV), but
tmc_read() discards them:

drivers/hwtracing/coresight/coresight-tmc-core.c:tmc_read() {
	actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
	if (actual <=3D 0)
		return 0;

Any signal delivered to a process blocked in
wait_event_interruptible_timeout() or mutex_lock_interruptible() inside
tmc_byte_cntr_get_data() will cause read() to return 0 (EOF) and terminate
trace collection prematurely instead of returning the error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-enable-byt=
e-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com?part=3D7
