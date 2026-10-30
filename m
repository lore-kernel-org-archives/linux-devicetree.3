Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341806;
	b=VrZN13wAjUb7o9fda6M+rafRj6UwGztopm3tzhKXCmq9MYTDmmA5aAuQKkjTQd2s2OQe
	 v0ewjo7UCDMraqpEt2lScvkHH8x2RlQr12lDdlAJfXzyYaJZTiS1cWeLhH532Xo7uPPHE
	 bbp5tQH3G+NgbB8Unx+rLaiw9NpSo5sB8m0I5mAbTMkXPVBsTONompRag+Sz8CTBXZeO0
	 zBRqz3+vISmGEstG0/9y95DEmDXGVGCS/J9lUseS3KGjKiVVSnAN/f0owQHQsghhUjus0
	 Api76wHk5SU0Iv/MipY7TbmQKD/9jFNwYsGh8jJiMLN7tVMPsuMoedZTfmFJooR9vWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KYi5BUwAw9zvqZ1l+HbkUJLPP+GnLNhzVtRdLlJsnVQ=;
	b=sFez0gUyLcTjifbp10lsQR2vf8PNgspAoHfkW77yYcmSoNldUFzsm3YGamU1GDljObpx
	 A90htiOZ2jhoiaisTmMc4j+gJw9cz6+YD+Dn2I3rX9/ZtWOyIhdeR7NtMRD14f/yx2sjv
	 LQSPnG0J1fYGKPvAo6zoC9ODSupOgwHgwSe0/Hafrja2ocBL/MrUlz2TY2e/vzubfcC0E
	 u0l0jMi8jONBbsSyjxGvKcNV5RVjv98MrYj/GFHk1orhg3shp1XLtN0l8o5dhCMxxUeeH
	 moE3n0Z7dy+SPWVKW48gK2XFqA+u1OfsTQOWOguWIPUnl1rPxfmr6xZz86O6L4LAjGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fnjSIHSZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BF606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fnjSIHSZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D0B1F000C1;
	Fri, 30 Oct 2026 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341805;
	bh=KYi5BUwAw9zvqZ1l+HbkUJLPP+GnLNhzVtRdLlJsnVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnjSIHSZODpmS0+pFAdO95MZMNXww65vUg08evoPkQjZpmxvGObz5v8bfbSxOtGKH
	 QTn+rVkSMt3LNwUrkww/6WmXzLsbFuvzcPG4iUukPz32ANNZZrOhfSCeqGxj9SrOVZ
	 GNrDbjJiFOBJ1v1a09fAQH9YEQVjBz7Lyjh8N2RIcdCX6Nz7lre/k55vLUHUdnE7ER
	 4HjHJwFwNGaFf3SxJqK2P2wWzjpv14udt5KWxNNBfEX+49DwoCdQcoc/DhBV2iyMJa
	 aV5+/cnlqOpiv7pqykGpVT8nz5ZCfJ7N50uFHlyPDZzNKNmQW929wutuBl/nCc8p+1
	 tb1BNcLLeJjtw==
Message-ID: <sashiko-outbox-190601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-6-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
 <20261030-enable-byte-cntr-for-ctcu-v20-6-bd5c3ac9f916@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:30:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 17 potential issue=
(s) to consider:
- [Critical] coresight: ctcu: race in ctcu_byte_cntr_switch_buffer() corrup=
ts ETR state
- [Critical] coresight: tmc-etr: missing mutual exclusion between byte-cntr=
 and sysfs read
- [High] coresight: ctcu: lost final buffer and missing wakeup on trace stop
- [High] coresight: ctcu: unclocked MMIO access in tmc_read_unprepare_byte_=
cntr()
- [High] coresight: ctcu: use-after-free and unbind hang in ctcu_platform_r=
emove()
- [High] coresight: ctcu: missing mode check, rollback, and lock in ctcu_en=
able()
- [High] coresight: ctcu: missing wakeup, tail drain, and NULL check on stop
- [High] coresight: ctcu: unlocked CS_UNLOCK/CS_LOCK in ctcu_program_regist=
er()
- [High] coresight: ctcu: unsynchronized concurrent read() in tmc_byte_cntr=
_get_data()
- [High] coresight: tmc: unhandled errors in tmc_read_prepare_etr() fallback
- [High] coresight: ctcu: race between byte_cntr_sysfs_ops calls and module=
 unload
- [Medium] coresight: ctcu: irq_cnt reset in ctcu_byte_cntr_switch_buffer()=
 breaks check
- [Medium] coresight: ctcu: broken error handling in ctcu_byte_cntr_init()
- [Medium] coresight: ctcu: ctcu_enable() leaves byte-cntr enabled on trace=
id error
- [Medium] coresight: tmc: tmc_read() swallows negative error codes as EOF
- [Low] coresight: ctcu: missing static qualifier on byte_cntr_sysfs_ops
- [Low] coresight: ctcu: malformed kernel-doc comments in header files
--

commit 26e4ba44ef37715b3346e217c2c24bdd79df2479
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: ctcu: enable byte-cntr for TMC ETR devices

This patch adds byte-cntr support to the CTCU driver to transfer trace data
from TMC ETR buffers to userspace using threshold interrupts and buffer
switching.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..f10f8897d280e
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,392 @@

[ ... ]

> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
> +					 struct ctcu_byte_cntr *byte_cntr_data)
> +{
> +	struct etr_buf_node *nd, *next, *curr_node =3D NULL, *picked_node =3D N=
ULL;
> +	struct etr_buf *curr_buf;
> +	bool found_free_buf =3D false;
> +	unsigned long flags;
> +
> +	if (WARN_ON(!etr_drvdata || !byte_cntr_data))
> +		return false;
> +
> +	/* Stop the ETR before initiating the switch */
> +	tmc_etr_enable_disable_hw(etr_drvdata, false);
> +
> +	/*
> +	 * Serialise the sysfs_buf/etr_buf swap against the ETR sink
> +	 * enable/disable paths which also touch these fields under the
> +	 * spinlock. tmc_etr_enable_disable_hw() takes the same lock, so it
> +	 * must be called outside this critical section.
> +	 */
> +	raw_spin_lock_irqsave(&etr_drvdata->spinlock, flags);
> +	curr_buf =3D etr_drvdata->sysfs_buf;
> +	list_for_each_entry_safe(nd, next, &etr_drvdata->etr_buf_list, link) {
> +		/* curr_buf is free for next round */
> +		if (nd->sysfs_buf =3D=3D curr_buf) {
> +			nd->is_free =3D true;
> +			curr_node =3D nd;
> +		} else if (!found_free_buf && nd->is_free) {
> +			picked_node =3D nd;
> +			found_free_buf =3D true;
> +		}
> +	}
> +
> +	/* The live buffer has to be in the list to be switched out */
> +	if (!curr_node)
> +		found_free_buf =3D false;
> +
> +	if (found_free_buf) {
> +		curr_node->pos =3D 0;
> +		curr_node->reading =3D true;
> +		byte_cntr_data->buf_node =3D curr_node;
> +		etr_drvdata->sysfs_buf =3D picked_node->sysfs_buf;
> +		etr_drvdata->etr_buf =3D picked_node->sysfs_buf;
> +		picked_node->is_free =3D false;
> +		/* Reset irq_cnt for next etr_buf */
> +		atomic_set(&byte_cntr_data->irq_cnt, 0);
> +	}
> +	raw_spin_unlock_irqrestore(&etr_drvdata->spinlock, flags);
> +
> +	/* Restart the ETR once a free buffer is available */
> +	if (found_free_buf)
> +		tmc_etr_enable_disable_hw(etr_drvdata, true);
> +
> +	return found_free_buf;
> +}

[Severity: Critical]
As reported by Sashiko on v19 [1], can splitting the hardware stop, buffer
pointer swap, and hardware restart across three separate
etr_drvdata->spinlock critical sections in ctcu_byte_cntr_switch_buffer()
race with tmc_disable_etr_sink() and corrupt ETR state?

During a byte-cntr read session, etr_drvdata->reading is false, and in
coresight_disable_path_from_to(), tmc_disable_etr_sink() runs before
coresight_disable_helpers() calls ctcu_byte_cntr_stop().

If tmc_disable_etr_sink() runs before the second critical section in
ctcu_byte_cntr_switch_buffer() (after tmc_etr_enable_disable_hw(etr_drvdata,
false) drops etr_drvdata->spinlock), tmc_disable_etr_sink() disables the ET=
R,
sets etr_drvdata->etr_buf =3D NULL, and sets the sink mode to CS_MODE_DISAB=
LED.

The second critical section in ctcu_byte_cntr_switch_buffer() does not check
whether coresight_get_mode(etr_drvdata->csdev) =3D=3D CS_MODE_SYSFS and
unconditionally assigns etr_drvdata->etr_buf =3D picked_node->sysfs_buf. Th=
en
tmc_etr_enable_disable_hw(etr_drvdata, true) sees mode !=3D CS_MODE_SYSFS a=
nd
returns early. When the file is closed, tmc_clean_etr_buf_list() frees
picked_node->sysfs_buf and clears etr_drvdata->sysfs_buf, leaving
etr_drvdata->etr_buf pointing to freed memory (which can cause a
use-after-free in tmc_panic_sync_etr() and causes WARN_ON(drvdata->etr_buf)
in tmc_etr_enable_hw() to reject all future ETR sessions with -EBUSY).

Conversely, if tmc_disable_etr_sink() runs between the second and third
critical sections, etr_drvdata->sysfs_buf and etr_drvdata->etr_buf already
point to picked_node->sysfs_buf while hardware registers TMC_RRP, TMC_RWP,
and TMC_STS still hold the DMA addresses and full status of the old buffer
curr_node->sysfs_buf. When tmc_disable_etr_sink() calls
__tmc_etr_disable_hw() -> tmc_etr_sync_sysfs_buf(), it computes
etr_buf->offset =3D rrp - etr_buf->hwaddr across the two distinct buffers,
performing an out-of-bounds DMA sync and, if TMC_STS_FULL was set on the old
buffer, writing a 16-byte barrier packet out of bounds in
tmc_etr_buf_insert_barrier_packet().

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
> +			if (!ctcu_byte_cntr_switch_buffer(etr_drvdata, byte_cntr_data)) {
> +				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
> +				return -ENOMEM;
> +			}
> +		} else {
> +			/* Exit byte-cntr reading */
> +			return 0;
> +		}
> +	}

[Severity: High]
Does returning 0 immediately when byte_cntr_data->enable is false in
tmc_byte_cntr_get_data() discard the final flushed ETR buffer when a trace
session stops?

When tracing is stopped via coresight_disable_sysfs() ->
coresight_disable_path(), tmc_disable_etr_sink() flushes the ETR hardware a=
nd
syncs the final trace data into etr_drvdata->sysfs_buf, and ctcu_disable()
calls ctcu_byte_cntr_stop() which sets byte_cntr_data->enable =3D false.

When wait_event_interruptible_timeout() returns with
byte_cntr_data->buf_node =3D=3D NULL, tmc_byte_cntr_get_data() sees
!byte_cntr_data->enable and returns 0 (EOF) without switching or draining
etr_drvdata->sysfs_buf. When the file is later closed,
tmc_read_unprepare_byte_cntr() calls tmc_clean_etr_buf_list(), freeing that
final buffer unread.

> +
> +	/* Check the status of current etr_buf */
> +	if (atomic_read(irq_cnt) >=3D MAX_IRQ_CNT)
> +		dev_warn(dev, "Data overwrite happened\n");

[Severity: Medium]
Can this overwrite check in tmc_byte_cntr_get_data() ever trigger for the
switched-out buffer after ctcu_byte_cntr_switch_buffer() has already reset
byte_cntr_data->irq_cnt to 0?

In ctcu_byte_cntr_switch_buffer():

	if (found_free_buf) {
		...
		/* Reset irq_cnt for next etr_buf */
		atomic_set(&byte_cntr_data->irq_cnt, 0);
	}

Because irq_cnt is reset to 0 before ctcu_byte_cntr_switch_buffer() returns,
any overwrite on the buffer that was just switched out is cleared before
tmc_byte_cntr_get_data() checks atomic_read(irq_cnt) >=3D MAX_IRQ_CNT, and
subsequent partial reads of byte_cntr_data->buf_node end up checking the
interrupt count of the newly active hardware buffer instead.

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

[Severity: High]
As reported by Sashiko on v19 [2], what prevents concurrent read() calls on
the same open /dev/tmc_etrX file descriptor from racing on
byte_cntr_data->buf_node in tmc_byte_cntr_get_data()?

Because /dev/tmc_etrX is a character device opened with nonseekable_open(),
FMODE_ATOMIC_POS is not set and the VFS does not serialize concurrent read()
calls with file->f_pos_lock. Multiple threads or processes sharing the open
file description can enter tmc_byte_cntr_get_data() and
tmc_etr_update_buf_node_pos() simultaneously without any lock:

1. If Thread A reaches the end of the buffer (actual =3D=3D 0) and sets
   byte_cntr_data->buf_node =3D NULL while Thread B has just passed the
   if (!byte_cntr_data->buf_node) check, Thread B will dereference a NULL
   byte_cntr_data->buf_node at byte_cntr_data->buf_node->pos.

2. If two threads both see !byte_cntr_data->buf_node and call
   ctcu_byte_cntr_switch_buffer(), the first switch marks curr_node->is_fre=
e =3D
   true while also setting curr_node->reading =3D true, allowing the second
   switch to pick that same curr_node as picked_node and restart ETR DMA in=
to
   the buffer while the first thread is copying it to userspace.

> +
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

[Severity: Critical]
Can a byte-cntr read session and a generic ETR sysfs read session be opened
concurrently on the same /dev/tmc_etrX device?

When a byte-cntr read session is opened via tmc_read_prepare_byte_cntr(),
byte_cntr_data->reading is set to true, but tmc_read_prepare_etr() returns
early without setting drvdata->reading =3D true. Conversely,
tmc_read_prepare_byte_cntr() never checks etr_drvdata->reading.

In addition, tmc_read_prepare_byte_cntr() checks
coresight_get_mode(etr_drvdata->csdev) !=3D CS_MODE_SYSFS and returns -EINV=
AL
before checking if (byte_cntr_data->reading) return -EBUSY. If a user opens
/dev/tmc_etrX in byte-cntr mode, stops tracing (so the sink mode becomes
CS_MODE_DISABLED), and opens /dev/tmc_etrX a second time,
tmc_read_prepare_byte_cntr() returns -EINVAL and tmc_read_prepare_etr() fal=
ls
through to the generic read prepare path, which succeeds because
drvdata->reading is false and drvdata->sysfs_buf is non-NULL.

Similarly, if /dev/tmc_etrX is first opened in generic mode (setting
drvdata->reading =3D true) while CS_MODE_SYSFS is active, enabling irq_enab=
led
and opening /dev/tmc_etrX a second time succeeds in
tmc_read_prepare_byte_cntr() because it never checks etr_drvdata->reading.

When either open file descriptor is then closed, tmc_read_unprepare_etr()
calls tmc_read_unprepare_byte_cntr(), which runs
tmc_clean_etr_buf_list(etr_drvdata) and frees all buffers in etr_buf_list a=
nd
sets drvdata->sysfs_buf =3D NULL while the other file descriptor is still o=
pen
and reading, leading to a use-after-free or a NULL pointer dereference in
tmc_etr_read_sysfs_buf().

> +
> +	/* byte_cntr_data->enable may race with ctcu_platform_remove() */
> +	if (!byte_cntr_data->enable) {
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Pin the module for the whole read session, so that rmmod fails with
> +	 * -EBUSY instead of blocking in ctcu_platform_remove() until the file
> +	 * is closed.
> +	 */
> +	if (!try_module_get(THIS_MODULE)) {
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		return -ENODEV;
> +	}
> +
> +	byte_cntr_data->reading =3D true;
> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret =3D tmc_create_etr_buf_list(etr_drvdata, 2);
> +	if (ret) {
> +		scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock)
> +			byte_cntr_data->reading =3D false;
> +
> +		module_put(THIS_MODULE);
> +		/* ctcu_platform_remove() may be waiting for reading to be cleared */
> +		wake_up(&byte_cntr_data->wq);
> +		return ret;
> +	}
> +
> +	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
> +		atomic_set(&byte_cntr_data->irq_cnt, 0);
> +		/*
> +		 * Configure the byte-cntr register to enable IRQ. The
> +		 * configured size is 5% of the buffer_size.
> +		 */
> +		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
> +				       etr_drvdata->size / MAX_IRQ_CNT,
> +				       byte_cntr_data->irq_ctrl_offset);
> +		byte_cntr_data->buf_node =3D NULL;
> +	}
> +	/* enable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
> +	enable_irq_wake(byte_cntr_data->irq);
> +
> +	return 0;
> +}
> +
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
> +	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
> +		/* Configure the byte-cntr register to disable IRQ */
> +		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
> +				       byte_cntr_data->irq_ctrl_offset);
> +		byte_cntr_data->buf_node =3D NULL;
> +		byte_cntr_data->reading =3D false;
> +	}

[Severity: High]
Does tmc_read_unprepare_byte_cntr() (and tmc_read_prepare_byte_cntr() if
racing with path disable) write to CTCU MMIO registers while drvdata->apb_c=
lk
is disabled?

A runtime PM reference on the CTCU device is only held while a CoreSight pa=
th
is active (_coresight_build_path() -> coresight_grab_device(), released in
coresight_release_path() -> coresight_drop_device()). When the user stops
tracing via coresight_disable_sysfs(), coresight_release_path() drops the
CTCU runtime PM reference and ctcu_runtime_suspend() disables
drvdata->apb_clk while /dev/tmc_etrX is still open.

When userspace subsequently closes /dev/tmc_etrX (matching the workflow in
the commit message where tmc_disable_etr_sink and ctcu_disable precede
tmc_read_unprepare_etr), tmc_read_unprepare_byte_cntr() calls
ctcu_cfg_byte_cntr_reg() -> ctcu_program_register() without holding a runti=
me
PM reference on the CTCU device, performing unclocked MMIO writes to
drvdata->base. The same unclocked access can happen in
tmc_read_prepare_byte_cntr() if the path is disabled while the spinlock is
dropped across tmc_create_etr_buf_list().

> +	/*
> +	 * The threshold IRQ is already disabled by the register write above,
> +	 * so no wake event can arrive here. disable_irq_wake() may sleep on
> +	 * slow-bus irqchips, so call it outside the spin_lock.
> +	 */
> +	disable_irq_wake(byte_cntr_data->irq);
> +	wake_up(&byte_cntr_data->wq);
> +	module_put(THIS_MODULE);
> +
> +	return 0;
> +}
> +
> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops =3D {
> +	.read_prepare	=3D tmc_read_prepare_byte_cntr,
> +	.read_unprepare	=3D tmc_read_unprepare_byte_cntr,
> +	.get_trace_data	=3D tmc_byte_cntr_get_data,
> +};

[Severity: Low]
Should byte_cntr_sysfs_ops in coresight-ctcu-byte-cntr.c be declared static,
since it is only referenced within this file?

> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresig=
ht_path *path)
> +{
> +	struct coresight_device *sink =3D coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	byte_cntr_data =3D ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	/* Don't start byte-cntr function when irq_enabled is not set. */
> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->enable)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
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
> +
> +	byte_cntr_data =3D ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable =3D false;
> +}

[Severity: High]
In ctcu_byte_cntr_stop(), could sink be NULL when passed to
coresight_get_mode(sink) (whereas ctcu_set_etr_traceid() checks sink =3D=3D=
 NULL
first), and shouldn't ctcu_byte_cntr_stop() also call
wake_up(&byte_cntr_data->wq) after clearing byte_cntr_data->enable so a
reader blocked in wait_event_interruptible_timeout() in
tmc_byte_cntr_get_data() wakes up immediately instead of stalling until
BYTE_CNTR_TIMEOUT expires?

> +
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdat=
a, int etr_num)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct device_node *nd =3D dev->of_node;
> +	int irq_num, ret, i, irq_registered =3D 0;
> +
> +	for (i =3D 0; i < etr_num; i++) {
> +		byte_cntr_data =3D &drvdata->byte_cntr_data[i];
> +		/*
> +		 * Initialize the lock and the waitqueue before requesting the
> +		 * IRQ, and for every port as ctcu_platform_remove() uses them
> +		 * even if the IRQ of the port is not registered.
> +		 */
> +		byte_cntr_data->ctcu_drvdata =3D drvdata;
> +		init_waitqueue_head(&byte_cntr_data->wq);
> +		raw_spin_lock_init(&byte_cntr_data->spin_lock);
> +
> +		irq_num =3D of_irq_get(nd, i);
> +		if (irq_num < 0) {
> +			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
> +			continue;
> +		}
> +
> +		ret =3D devm_request_irq(dev, irq_num, byte_cntr_handler,
> +				       IRQF_TRIGGER_RISING,
> +				       dev_name(dev), byte_cntr_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register IRQ for port%d\n", i);
> +			continue;
> +		}
> +
> +		byte_cntr_data->irq =3D irq_num;
> +		irq_registered++;
> +	}
> +
> +	if (!irq_registered)
> +		return;
> +
> +	scoped_guard(mutex, &byte_cntr_ops_lock) {
> +		tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
> +		byte_cntr_ops_users++;
> +	}
> +
> +	/* Drop the ops user when the CTCU device is removed or probe fails */
> +	if (devm_add_action_or_reset(dev, ctcu_byte_cntr_put_ops, NULL))
> +		dev_err(dev, "Failed to add the byte-cntr devm action\n");
> +}

[Severity: Medium]
In ctcu_byte_cntr_init(), of_irq_get() returns 0 on IRQ mapping failure as
well as negative error codes on lookup failure. Should the check be
if (irq_num <=3D 0) so that IRQ 0 is not passed to devm_request_irq()?

Also, if devm_add_action_or_reset() fails at the end of
ctcu_byte_cntr_init(), ctcu_byte_cntr_put_ops() resets byte_cntr_sysfs_ops,
but ctcu_byte_cntr_init() returns void without propagating the error or
clearing byte_cntr_data[i].irq, leaving the IRQs and sysfs attributes active
without registered ops.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01e..7738ae4fbf14c 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c

[ ... ]

> @@ -62,6 +68,87 @@ static const struct ctcu_config sa8775p_cfgs =3D {
>  	.num_etr_config	=3D ARRAY_SIZE(sa8775p_etr_cfgs),
>  };
> =20
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 of=
fset)
> +{
> +	CS_UNLOCK(drvdata->base);
> +	ctcu_writel(drvdata, val, offset);
> +	CS_LOCK(drvdata->base);
> +}

[Severity: High]
Can calling ctcu_program_register() under the per-port
byte_cntr_data->spin_lock instead of the device-wide drvdata->spin_lock race
on the shared CORESIGHT_LAR lock register?

In coresight-ctcu-core.c, __ctcu_set_etr_traceid() acquires
drvdata->spin_lock before calling ctcu_program_atid_register() (which also
does CS_UNLOCK(drvdata->base) and CS_LOCK(drvdata->base)). However,
tmc_read_prepare_byte_cntr() and tmc_read_unprepare_byte_cntr() call
ctcu_cfg_byte_cntr_reg() -> ctcu_program_register() while holding only
byte_cntr_data->spin_lock.

If ctcu_program_register() runs concurrently with __ctcu_set_etr_traceid() =
or
with ctcu_program_register() on the other ETR port, one thread can execute
CS_LOCK(drvdata->base) right after the other thread's
CS_UNLOCK(drvdata->base) and before its ctcu_writel(), causing the write to
IRQCTRL or ATID to be ignored by hardware.

[ ... ]

> @@ -157,11 +227,15 @@ static int ctcu_set_etr_traceid(struct coresight_de=
vice *csdev, struct coresight
>  static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		       struct coresight_path *path)
>  {
> +	ctcu_byte_cntr_start(csdev, path);
> +
>  	return ctcu_set_etr_traceid(csdev, path, true);
>  }

[Severity: Medium]
If ctcu_set_etr_traceid() fails in ctcu_enable(), does byte_cntr_data->enab=
le
remain leaked as true?

When a helper's enable callback returns an error in
coresight_enable_helpers(), the core only calls coresight_disable_helper() =
on
the previously enabled helpers in the path, so ctcu_disable() ->
ctcu_byte_cntr_stop() is not called for the failing CTCU device.

[Severity: High]
Furthermore, in ctcu_enable() and ctcu_byte_cntr_start(), what prevents
byte_cntr_data->enable from being set during CS_MODE_PERF sessions or racing
with irq_enabled_store() and ctcu_platform_remove()?

1. ctcu_enable() calls ctcu_byte_cntr_start(csdev, path) without checking
   whether mode =3D=3D CS_MODE_SYSFS, so starting a perf session while
   irq_enabled is set will set byte_cntr_data->enable =3D true.

2. ctcu_byte_cntr_start() checks !byte_cntr_data->irq_enabled and
   byte_cntr_data->enable outside byte_cntr_data->spin_lock before acquiring
   the lock to set byte_cntr_data->enable =3D true, which can race with
   irq_enabled_store() or ctcu_platform_remove().

[ ... ]

> @@ -261,10 +339,42 @@ static int ctcu_platform_probe(struct platform_devi=
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
> +
>  	ctcu_remove(pdev);
>  	pm_runtime_disable(&pdev->dev);
>  }

[Severity: High]
As reported by Sashiko on v19 [3], can ctcu_platform_remove() still trigger=
 a
use-after-free or hang indefinitely on device unbind?

1. In tmc_read_unprepare_byte_cntr(), byte_cntr_data->reading =3D false is =
set
   inside the spinlock, and the lock is released before calling
   disable_irq_wake(byte_cntr_data->irq) and wake_up(&byte_cntr_data->wq)
   (and similarly before wake_up(&byte_cntr_data->wq) in the error path of
   tmc_read_prepare_byte_cntr()). As soon as byte_cntr_data->reading becomes
   false, ctcu_platform_remove() can finish and devres can free drvdata whi=
le
   tmc_read_unprepare_byte_cntr() or tmc_read_prepare_byte_cntr() is still
   accessing byte_cntr_data->irq and byte_cntr_data->wq.

2. Because this teardown loop runs before ctcu_remove(pdev) unregisters the
   CoreSight helper device, a concurrent coresight_enable_sysfs() ->
   ctcu_enable() -> ctcu_byte_cntr_start() can set byte_cntr_data->enable =
=3D
   true again and start a new read session on a port that the loop has
   already checked.

3. Waiting in wait_event(byte_cntr_data->wq, !byte_cntr_data->reading) puts
   the unbind task into TASK_UNINTERRUPTIBLE until userspace closes
   /dev/tmc_etrX, which will trigger hung-task warnings if a process keeps
   the file descriptor open.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtra=
cing/coresight/coresight-ctcu.h
> index e9594c38dd91c..a2ae0a0d91d0f 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -1,23 +1,31 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
> =20
>  #ifndef _CORESIGHT_CTCU_H
>  #define _CORESIGHT_CTCU_H
> +
> +#include <linux/time.h>
>  #include "coresight-trace-id.h"
> =20
>  /* Maximum number of supported ETR devices for a single CTCU. */
>  #define ETR_MAX_NUM	2
> =20
> +#define BYTE_CNTR_TIMEOUT	(3 * HZ)
> +#define MAX_IRQ_CNT		20
> +
>  /**
>   * struct ctcu_etr_config
>   * @atid_offset:	offset to the ATID0 Register.
> - * @port_num:		in-port number of CTCU device that connected to ETR.
> + * @port_num:		in-port number of the CTCU device that connected to ETR.
> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>   */
>  struct ctcu_etr_config {
>  	const u32 atid_offset;
>  	const u32 port_num;
> +	const u32 irq_ctrl_offset;
>  };
> =20
>  struct ctcu_config {
> @@ -25,15 +33,68 @@ struct ctcu_config {
>  	int num_etr_config;
>  };
> =20
> -struct ctcu_drvdata {
> -	void __iomem		*base;
> -	struct clk		*apb_clk;
> -	struct device		*dev;
> -	struct coresight_device	*csdev;
> +/**
> + * struct ctcu_byte_cntr
> + * @enable:		indicates that byte_cntr function is enabled or not.

[ ... ]

> +/**
> + * struct ctcu_byte_cntr_irq_attribute
> + * @attr:	The device attribute.
> + * @port:	port number.
> + */

[Severity: Low]
This isn't a bug, but the kernel-doc comments for struct ctcu_etr_config,
struct ctcu_byte_cntr, and struct ctcu_byte_cntr_irq_attribute in
coresight-ctcu.h are missing the "- short description" on the struct line,
and struct etr_buf_node in coresight-tmc.h is missing the
"struct etr_buf_node - short description" line, which triggers kernel-doc
warnings under W=3D1 builds.

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
As reported by Sashiko on v19 [4], doesn't tmc_read() still swallow negative
error codes such as -ERESTARTSYS and -ENOMEM returned by
tmc_etr_get_sysfs_trace() and convert them into 0 (EOF)?

In tmc_etr_get_sysfs_trace(), any return value from
byte_cntr_ops->get_trace_data() other than -EINVAL (including -ERESTARTSYS =
on
signal interruption and -ENOMEM on buffer switch failure) is returned to
tmc_get_sysfs_trace(). However, tmc_read() has:

	actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
	if (actual <=3D 0)
		return 0;

So any signal delivered to a process waiting in tmc_byte_cntr_get_data()
causes read() to return 0 (EOF) instead of -ERESTARTSYS.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index 7d41fdf83c5bb..253fe8eb6cbe1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c

[ ... ]

> @@ -2076,15 +2142,54 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *d=
rvdata, int num_nodes)

[ ... ]

>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  {
>  	int ret =3D 0;
>  	unsigned long flags;
> +	const struct tmc_sysfs_ops *byte_cntr_ops;
> =20
>  	/* config types are set a boot time and never change */
>  	if (WARN_ON_ONCE(drvdata->config_type !=3D TMC_CONFIG_TYPE_ETR))
>  		return -EINVAL;
> =20
> +	byte_cntr_ops =3D READ_ONCE(byte_cntr_sysfs_ops);
> +	if (byte_cntr_ops) {
> +		ret =3D byte_cntr_ops->read_prepare(drvdata);
> +		if (!ret || ret =3D=3D -EBUSY)
> +			return ret;
> +
> +		ret =3D 0;
> +	}

[Severity: High]
As reported by Sashiko on v19 [5], why does tmc_read_prepare_etr() ignore
errors like -ENOMEM and -ENODEV from byte_cntr_ops->read_prepare(drvdata) a=
nd
fall through to the generic ETR read path?

Unlike tmc_etr_get_sysfs_trace(), which only falls back when ret =3D=3D -EI=
NVAL,
tmc_read_prepare_etr() masks -ENOMEM (when tmc_create_etr_buf_list() fails)
and -ENODEV (when !byte_cntr_data->enable or try_module_get() fails) by
resetting ret =3D 0 and continuing into the generic ETR read path. During an
active CS_MODE_SYSFS session, falling through calls __tmc_etr_disable_hw(),
which halts the running ETR hardware capture and sets drvdata->reading =3D =
true
while byte_cntr_data->reading remains false.

> +
>  	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>  	if (drvdata->reading) {
>  		ret =3D -EBUSY;
> @@ -2116,11 +2221,17 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *dr=
vdata)
>  {
>  	unsigned long flags;
>  	struct etr_buf *sysfs_buf =3D NULL;
> +	const struct tmc_sysfs_ops *byte_cntr_ops;
> =20
>  	/* config types are set a boot time and never change */
>  	if (WARN_ON_ONCE(drvdata->config_type !=3D TMC_CONFIG_TYPE_ETR))
>  		return -EINVAL;
> =20
> +	byte_cntr_ops =3D READ_ONCE(byte_cntr_sysfs_ops);
> +	if (byte_cntr_ops)
> +		if (!byte_cntr_ops->read_unprepare(drvdata))
> +			return 0;

[Severity: High]
As reported by Sashiko on v19 [6], can reading byte_cntr_sysfs_ops lockless=
ly
in tmc_read_prepare_etr(), tmc_etr_get_sysfs_trace(), and
tmc_read_unprepare_etr() still race with unloading the coresight-ctcu modul=
e?

CONFIG_CORESIGHT_LINK_AND_SINK_TMC and CONFIG_CORESIGHT_CTCU can be built as
separate modules. Although tmc_read_prepare_byte_cntr() calls
try_module_get(THIS_MODULE), that happens only after tmc_read_prepare_etr()
has already loaded byte_cntr_ops, dereferenced byte_cntr_ops->read_prepare,
and entered coresight-ctcu code.

Furthermore, for normal (non-byte-cntr) ETR sysfs read sessions where
tmc_read_prepare_byte_cntr() returns -EINVAL without pinning THIS_MODULE,
every subsequent tmc_etr_get_sysfs_trace() and tmc_read_unprepare_etr() call
still loads and dereferences byte_cntr_sysfs_ops and calls into
coresight-ctcu while its module refcount is 0. If rmmod coresight_ctcu runs
concurrently, byte_cntr_sysfs_ops and the module text can be unmapped after
READ_ONCE(byte_cntr_sysfs_ops) and before or during the callback execution.

[1] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[2] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[3] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[4] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[5] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[6] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-enable-byt=
e-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com?part=3D6
