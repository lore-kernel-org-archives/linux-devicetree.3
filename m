Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991239;
	b=XyR3bw8vr5U1LDZCZ/ty4RiykTZNZutTlRMtxYimAajOVFW1XgrC+nytliD+yYUKI0IE
	 95mFAbas4JV0t/U6CmKSfkiBNjU7us8yKf2NpfYBiHDWrLGQqCcbCSnaC5FMIEzlZn3Pd
	 Hr8hLBWf0+bfqihFGXxBGwXpfoqZVnFcqJT39pxAK1VssasIZZUapzUfDh0w68/JzivzU
	 e7xgl6xfZ+ze2+i1zCgx8q4Z8sx9hme/x/XKdcaKW79vQb94JC/q5ukWCVKmYMstWNfmv
	 RtRXahsjQdnK/L/5IcyC56SZQMYRQeGJ66uRQnBve/3fy7YY2mzxuGN3azFuHEmTLfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v71ZpFX2qcHVEO1BFFSl7dLI/TlM3X5W+2U652oh8ZE=;
	b=mKyN7zwHXZrAwdqvVoHRD04eLBRcMi1canfxxkDfGR7/hB9c6Xdz70YHrTDstwIGybaK
	 EvO29W0WgtqTtc+SHWI/PLKpXMhJQAiNPec3y5lYSmLsy7fNPPuxBiCNybWc84n+gDoIT
	 /OL/wq0pU8pib3bKap6e7wuLulXHGB8nLGYkjbs2TieXHbL6b/kgxKEEl4tN4b/s1tmXC
	 5jTj7Uyhc06/7CeMJGhHpCHRHtGfaFWijyi2zSKQj+XPCMuTp8dn81zIDWoTbWPWu5Dox
	 0qsn60tEBbbnSmO2Cl2EFNnU3rGUOfUJe6Pt274x9nWfKGLSfUoQESj/bvK59KGSC5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDuC2adf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC57606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDuC2adf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E7B1F000C6;
	Wed, 18 Nov 2026 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991238;
	bh=v71ZpFX2qcHVEO1BFFSl7dLI/TlM3X5W+2U652oh8ZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDuC2adftFFFNICm6rIDKdEHUBrb4oYgU2YmvaolTbNgXvjJMosxrzrvvoeEcFsTF
	 I4at0HX9iWSJqLRaYhq26MOmksakGFeBdm56c6WqAFCKiSNYnQGSBq/K87+zODG/zb
	 yWmzAMgFXO3TvzoLCDdzF7ULtuX5vKEImCroAsa4m8yWOe0pebkNaDSnsWsJ+8VsXF
	 MpD2Cp7yZ7rqWI9ay+HUqor5cbMzNNd4f7O8vHxLvY03lGE6G1FXdjSuhHF0WqF2V0
	 2TIaACwLE9GhPIiFd6lNx7/Tdv4HYwDvhCCPigg9rh0xmxWhd8YIBTCv5jVTl58Vkv
	 hh5p0ppFeXEcA==
Message-ID: <sashiko-outbox-220466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-7-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-7-67fd9db6bc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:40:38 +0000
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
- [Medium] coresight: ctcu: premature release of read_lock in
  tmc_byte_cntr_get_data()
- [Medium] coresight: ctcu: use-after-free on buf_node in
  tmc_byte_cntr_get_data()
- [Medium] coresight: ctcu: byte_cntr_data->enable leaked on generic
  read fallback
- [Medium] coresight: ctcu: unordered enable and removing stores in
  ctcu_platform_remove()
- [Medium] coresight: ctcu: UAF race between byte_cntr_sysfs_ops and
  CTCU teardown
- [Medium] coresight: tmc: tmc_read() converts byte-cntr negative errors
  into EOF
- [Low] coresight: ctcu: race in tmc_read_unprepare_byte_cntr() skips
  byte-cntr start
--

commit e2d99652345f219b25f03926606cfb55a2d0509a
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: ctcu: enable byte-cntr for TMC ETR devices

This commit enables the CTCU byte-counter interrupt mechanism to transfer
trace data from switched ETR buffers to userspace while the ETR continues
tracing.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..688fe6342c042
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,465 @@

[ ... ]

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
tmc_etr_update_buf_node_pos() unserialized in tmc_read()?

Because /dev/tmc_etrX is a character device opened with
nonseekable_open(), the VFS does not hold file->f_pos_lock across
vfs_read().  Once tmc_byte_cntr_get_data() returns, read_guard drops
byte_cntr_data->read_lock before tmc_read() copies from bufp or advances
buf_node->pos:

CPU0                                    CPU1
tmc_read()
  tmc_byte_cntr_get_data()
    lock(&byte_cntr_data->read_lock)
    pos =3D buf_node->pos
    tmc_etr_read_sysfs_buf(..., &bufp)
    unlock(&byte_cntr_data->read_lock)
  copy_to_user(data, bufp, actual)
                                        tmc_read()
                                          tmc_byte_cntr_get_data()
                                            ...
                                          tmc_etr_update_buf_node_pos()
                                            nd->pos +=3D actual
                                        tmc_read()
                                          tmc_byte_cntr_get_data()
                                            actual =3D=3D 0:
                                            buf_node->reading =3D false
                                            buf_node =3D NULL
                                            tmc_etr_switch_buf_node()
                                              <-- ETR DMAs into bufp while
                                                  CPU0 is in copy_to_user()
  tmc_etr_update_buf_node_pos()
    nd->pos +=3D actual  <-- advances the newly switched buf_node->pos

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
Can freeing etr_buf_list before clearing byte_cntr_data->buf_node and
byte_cntr_data->reading cause a use-after-free in
tmc_byte_cntr_get_data()?

If a byte-cntr read session closes while byte_cntr_data->buf_node still
points to a partially read buffer and the trace stops before
tmc_read_unprepare_byte_cntr() acquires byte_cntr_data->spin_lock, a
concurrent open() and read() on /dev/tmc_etrX can enter
tmc_byte_cntr_get_data() while byte_cntr_data->reading is still true:

CPU0                                    CPU1
tmc_read_unprepare_byte_cntr()
  tmc_clean_etr_buf_list()
    __tmc_clean_etr_buf_list()
      tmc_etr_free_sysfs_buf(buf_node->sysfs_buf)
      kfree(buf_node)
  disable_irq_wake()
                                        /* trace stops */
                                        tmc_open()
                                          tmc_read_prepare_etr()
                                            tmc_read_prepare_byte_cntr()
                                              mode !=3D CS_MODE_SYSFS -> -E=
INVAL
                                            /* falls back to generic read */
                                            drvdata->reading =3D true
                                        tmc_read()
                                          tmc_etr_get_sysfs_trace()
                                            tmc_byte_cntr_get_data()
                                              pos =3D buf_node->pos
                                                <-- use-after-free

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

[Severity: Low]
Can a trace path enabled while tmc_read_unprepare_byte_cntr() is running
start the ETR sink without starting byte-cntr?

The check on byte_cntr_data->reading assumes that enabling the ETR sink
will fail while the previous byte-cntr read session is still active.
However, tmc_etr_get_sysfs_buffer() only checks
!list_empty(&drvdata->etr_buf_list), and tmc_read_unprepare_byte_cntr()
empties etr_buf_list in tmc_clean_etr_buf_list() (and calls
disable_irq_wake()) before clearing byte_cntr_data->reading:

CPU0                                    CPU1
tmc_read_unprepare_byte_cntr()
  tmc_clean_etr_buf_list()
    /* etr_buf_list is now empty */
  disable_irq_wake()
                                        coresight_enable_path_from_to()
                                          ctcu_enable()
                                            ctcu_byte_cntr_start()
                                              byte_cntr_data->reading =3D=
=3D true
                                              return;  <-- skips byte-cntr
                                          tmc_enable_etr_sink()
                                            tmc_etr_get_sysfs_buffer()
                                              list_empty(&etr_buf_list) =3D=
=3D true
                                              /* sink enables */
  byte_cntr_data->reading =3D false

> +
> +	/*
> +	 * The etr_bufs of the reserved mode share one memory region, they
> +	 * can't be switched by byte-cntr.
> +	 */
> +	if (etr_drvdata->etr_mode =3D=3D ETR_MODE_RESRV)
> +		return;

[ ... ]

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
Can byte_cntr_data->enable remain stuck at true after the trace path is
released if a session falls back to generic read?

ctcu_byte_cntr_start() runs before the ETR sink is enabled and only checks
etr_drvdata->etr_mode =3D=3D ETR_MODE_RESRV.  However,
tmc_etr_get_sysfs_buffer() can reuse an existing drvdata->sysfs_buf whose
mode is still ETR_MODE_RESRV (after buf_mode_preferred was changed without
changing buffer_size), or buf_mode_preferred can be set to resrv after the
trace starts.  When /dev/tmc_etrX is then opened,
tmc_create_etr_buf_list() returns -EINVAL and tmc_read_prepare_etr() falls
back to generic read, setting drvdata->reading =3D true while
byte_cntr_data->enable remains true.

If the trace source is disabled while that generic read file descriptor is
open, tmc_disable_etr_sink() sees drvdata->reading =3D=3D true and returns
-EBUSY without clearing CS_MODE_SYSFS on the sink.  ctcu_byte_cntr_stop()
then sees coresight_get_mode(sink) =3D=3D CS_MODE_SYSFS and returns early
without zeroing irq_ctrl_offset or clearing byte_cntr_data->enable, right
before coresight_release_path() drops the CTCU runtime PM reference.  From
that point on, irq_enabled_store() permanently fails with -EBUSY and
ctcu_platform_remove() will write to the CTCU register while the CTCU is no
longer kept powered by an active path.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index 739105acb0a13..94283661f10d4 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c

[ ... ]

> @@ -244,10 +356,65 @@ static int ctcu_platform_probe(struct platform_devi=
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
> +		 * ctcu_byte_cntr_stop() won't touch the register once enable is
> +		 * cleared, so disable the IRQ here. The CTCU is powered as long as
> +		 * enable is set, which is cleared when the path is disabled.
> +		 */
> +		if (byte_cntr_data->enable)
> +			ctcu_program_register(drvdata, 0,
> +					      byte_cntr_data->irq_ctrl_offset);
> +		byte_cntr_data->enable =3D false;
> +		byte_cntr_data->removing =3D true;
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);

[Severity: Medium]
Can tmc_byte_cntr_get_data() observe byte_cntr_data->enable =3D=3D false be=
fore
byte_cntr_data->removing =3D=3D true and fall back to reading the unsynced =
live
ETR buffer?

tmc_byte_cntr_get_data() checks byte_cntr_data->enable and
READ_ONCE(byte_cntr_data->removing) without holding
byte_cntr_data->spin_lock:

CPU0                                    CPU1
ctcu_platform_remove()
  byte_cntr_data->enable =3D false
                                        tmc_etr_get_sysfs_trace()
                                          tmc_byte_cntr_get_data()
                                            wait_event_interruptible_timeou=
t()
                                              /* sees !enable */
                                            if (byte_cntr_data->enable) ...
                                            else {
                                              if (READ_ONCE(removing) && ..=
.)
                                                /* sees !removing */
                                              return 0;
                                            }
                                          /* ret =3D=3D 0 falls through */
                                          tmc_etr_read_sysfs_buf(sysfs_buf,=
 ...)
                                            <-- reads live unsynced ETR buf=
fer
  byte_cntr_data->removing =3D true

Setting byte_cntr_data->removing =3D true before clearing
byte_cntr_data->enable (with paired release/acquire or barrier ordering)
would ensure the reader sees removing set once it observes enable cleared.

> +
> +		/* Wake up the blocked reader, then wait for the session to end */
> +		wake_up_all(&byte_cntr_data->wq);
> +		wait_for_completion(&byte_cntr_data->session_done);
> +
> +		/*
> +		 * The ending session completes it with the lock held. Take the
> +		 * lock once more, to be sure that it has released the lock
> +		 * before byte_cntr_data is freed.
> +		 */
> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +	}
> +
> +	/*
> +	 * No byte-cntr session is left and a new one can't start now. Stop the
> +	 * tmc driver from calling the byte-cntr ops before the CTCU device is
> +	 * unregistered and freed.
> +	 */
> +	ctcu_byte_cntr_put_ops(drvdata);
> +
> +	ctcu_remove(pdev);

[Severity: Medium]
Can an in-flight byte_cntr_sysfs_ops call race with ctcu_platform_remove()
and cause a use-after-free on ctcu and drvdata?

byte_cntr_data->session_done is initialized as completed in
ctcu_byte_cntr_init() and is only reinitialized inside
tmc_read_prepare_byte_cntr() after tmc_etr_get_ctcu_device() and
ctcu_get_byte_cntr() have already run.  In addition,
tmc_read_prepare_etr(), tmc_etr_get_sysfs_trace(), and
tmc_read_unprepare_etr() read byte_cntr_sysfs_ops with READ_ONCE() and call
into it on every ETR open, read, and close (even during generic reads when
session_done is completed and THIS_MODULE is not pinned), while
ctcu_byte_cntr_put_ops() simply clears byte_cntr_sysfs_ops with
WRITE_ONCE() without waiting for in-flight callers:

CPU0                                    CPU1
tmc_read_prepare_etr()
  byte_cntr_ops =3D READ_ONCE(byte_cntr_sysfs_ops)
  tmc_read_prepare_byte_cntr()
    ctcu =3D tmc_etr_get_ctcu_device()
                                        ctcu_platform_remove()
                                          wait_for_completion(&session_done)
                                            /* already complete */
                                          ctcu_byte_cntr_put_ops()
                                          ctcu_remove()
                                            coresight_unregister(csdev)
                                          /* devres frees drvdata */
    ctcu_get_byte_cntr(ctcu, ...)
      dev_get_drvdata(ctcu->dev.parent)
      coresight_get_in_port(etr, ctcu)  <-- use-after-free

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

[ ... ]

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index cc341cdf8d8e5..d856f0a190f72 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1178,23 +1181,44 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *=
drvdata,

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
>  }

[Severity: Medium]
Does tmc_read() swallow the negative error codes returned by
tmc_byte_cntr_get_data() and turn them into EOF?

tmc_etr_get_sysfs_trace() propagates negative errors from
tmc_byte_cntr_get_data() such as -ERESTARTSYS (when
wait_event_interruptible_timeout() is interrupted by a signal), -EINTR,
-ENOMEM, and -ENODEV.  However, the caller in tmc_read() converts all
non-positive values to 0:

drivers/hwtracing/coresight/coresight-tmc-core.c:tmc_read() {
	actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
	if (actual <=3D 0)
		return 0;

When a signal arrives while userspace is blocked waiting for trace data,
read() returns 0 (EOF) instead of restarting or returning -EINTR, causing
the reader to terminate trace collection prematurely while the ETR sink is
still running.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-enable-byt=
e-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com?part=3D7
