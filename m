Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614663;
	b=NldEL6mssEUFpPfPI3rljZTpXhWHvY3cuSWa3/rfwGUKkGUbxuQO34xpK68iBIb1Oz8d
	 69OXgVzrslezDcF2aaGx11SZf240ezj9pR8Cl8/TJvY725DK4vQ4u6UVOtJtNH6rNb71y
	 QPzwf12cRHJ3Ph+tn+EWuMDi0GcyTFc19NmxYQiBqeeWUnfkHxEe08ufbM3eb3iTCw7rf
	 1x8UvJPxigvfRUy9UTTRMB7HkPAUypoq1CEcdIU5qTDWL2UnA/WIo56RzsmanqRHbbP9u
	 oqEZnavDwujyFYDpBA+M2xfhP2cp/i2YBqqm1W7a9sk7nO51QAVYdtSn2VciarG+6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=arO3upxUCj9QDCdQBxiPz2c/1Rob2pnDcPw12KG/vRE=;
	b=5rhJmBMSLhsf+6XoJmPISRTezNwyt+JeAYOvpYnP5NViAIJqpj0UPZ9JPbYtvNYRFwL5
	 qbwVf2G5A5rH4gyEYUH2AUHlCOZV9qOSqpEd+zoGVbIWJyTFv2cMD89dHy82R1DJ/4GCW
	 SobYA9V6dOrVy3K6ZlP14SuJgDHIRrOiS9udV7iBNvpxJjxg27t/dKYsGhTThiN0hWEwL
	 oj2s6VqYy3bQ1Nb8GXQNKaNeOmTQlY4qxmoIVdd/2wSP3roVWSx5hMkLOiqsBbDJspzcZ
	 xyoj5SL/Xusa0XJiZtoaxs65RjOKIe1zh5e7fpEYEHHpZx3uIEKhiw3zh1097sd6R/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bvxycy2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34C606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bvxycy2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75B51F000C1;
	Mon,  2 Nov 2026 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614662;
	bh=arO3upxUCj9QDCdQBxiPz2c/1Rob2pnDcPw12KG/vRE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bvxycy2ya6ArSO1R3s82gVIEv43q7HWDU3Hwz1lxqHIFdl9/zFe9iid0mT4H4teq4
	 KDE7RN1K5LAuw5XSUCQ/GzHPT+I3+o2lhbZ5ieXhCSmdQ7dS/iToimMdWy2QbjoE2C
	 w/Hc9TUybAHu13kwpD/bZ9clNOkDaCuWhP2sWQhAUYODNFNla2/HrkJEG+0qpQOqUS
	 oYnxAP8JtYYeJB2i885fSTcjY9ylsYDdzvTQFek3UD7I8eLn7LaBP1imZ/TDHvDGgJ
	 nVbxx2ATurA/MsUSHW9gJvdMzaqvu1/7z1zrd2bKZ+Wt7RH+gPtwOZIvJdb44+02dY
	 Wzc78RBwbGMhQ==
Message-ID: <sashiko-outbox-193245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-7-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
 <20261102-enable-byte-cntr-for-ctcu-v21-7-231e069b7853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:17:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] coresight: ctcu: race in tmc_read_unprepare_byte_cntr() during clo=
se
- [High] coresight: ctcu: zero-length read in tmc_byte_cntr_get_data() drop=
s buffers and loops
- [High] coresight: ctcu: unbind in ctcu_platform_remove() reads live DMA b=
uffer
- [High] coresight: ctcu: unsynchronized concurrent read() in tmc_byte_cntr=
_get_data()
- [High] coresight: ctcu: UAF race between byte_cntr_sysfs_ops and CTCU tea=
rdown
- [High] coresight: ctcu: unsynchronized state transitions in byte-cntr lif=
ecycle
- [High] coresight: tmc: broken fallback and race in tmc_read_prepare_etr()
- [Medium] coresight: ctcu: ctcu_byte_cntr_start() corrupts active read or =
trace state
- [Medium] coresight: ctcu: unhandled devm_add_action_or_reset() failure in=
 ctcu_byte_cntr_init()
- [Medium] coresight: tmc: tmc_read() converts negative errors into EOF
--

commit 21dfce27a3a23b8dd103a86f6d7455d0e9197bff
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: ctcu: enable byte-cntr for TMC ETR devices

This commit enables the CTCU byte-cntr functionality to transfer trace data
from TMC ETR buffers to userspace via interrupt-driven buffer switching in
sysfs mode.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..bff87e776a755
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

[Severity: High]
As reported by Sashiko on v19 [1], can concurrent /dev/tmc_etr* file
operations race with CTCU device removal or module unload and trigger a
use-after-free?

Because CONFIG_CORESIGHT_LINK_AND_SINK_TMC and CONFIG_CORESIGHT_CTCU are
separate modules, opening /dev/tmc_etr* pins coresight-tmc rather than
coresight-ctcu. In coresight-tmc-etr.c, tmc_read_prepare_etr(),
tmc_etr_get_sysfs_trace(), and tmc_read_unprepare_etr() load
READ_ONCE(byte_cntr_sysfs_ops) and invoke its callbacks without holding a
lock, coresight_mutex, or a module reference prior to the call:

1. In tmc_read_prepare_byte_cntr(), try_module_get(THIS_MODULE) and
reinit_completion(&byte_cntr_data->session_done) are only executed after
tmc_read_prepare_etr() has dereferenced byte_cntr_ops->read_prepare and
after tmc_read_prepare_byte_cntr() has called tmc_etr_get_ctcu_device(),
ctcu_get_byte_cntr(), and raw_spin_lock_irqsave(&byte_cntr_data->spin_lock,
flags). Similarly, in tmc_read_unprepare_byte_cntr(),
module_put(THIS_MODULE) and the function return execute after
complete_all(&byte_cntr_data->session_done).

2. For normal non-byte-cntr ETR sysfs read sessions (for instance when
reading /dev/tmc_etr* after stopping the trace path or when irq_enabled is
0), tmc_read_prepare_byte_cntr() returns -EINVAL without pinning
THIS_MODULE or reinitializing session_done, yet every subsequent read() via
tmc_etr_get_sysfs_trace() -> tmc_byte_cntr_get_data() and close() via
tmc_read_unprepare_etr() -> tmc_read_unprepare_byte_cntr() still invokes
byte_cntr_ops and calls tmc_etr_get_ctcu_device() and ctcu_get_byte_cntr()
while session_done is already completed and coresight-ctcu can have a
module refcount of 0.

3. When ctcu_platform_remove() runs concurrently,
wait_for_completion(&byte_cntr_data->session_done) returns immediately if
no byte-cntr session is active. ctcu_platform_remove() then calls
ctcu_remove() -> coresight_unregister(drvdata->csdev) before
devres_release_all() runs ctcu_byte_cntr_put_ops() to clear
byte_cntr_sysfs_ops (and on multi-CTCU systems, byte_cntr_sysfs_ops remains
set when one CTCU device is removed). Inside coresight_unregister(),
coresight_release_platform_data() frees ctcu->pdata->in_conns and
ctcu->pdata, and device_unregister() frees ctcu; devres_release_all() then
frees drvdata and clears dev->driver_data. Concurrent calls to
tmc_etr_get_ctcu_device() and ctcu_get_byte_cntr() can therefore
dereference freed ctcu, freed ctcu->pdata->in_conns in
coresight_get_in_port(), NULL or freed drvdata, or unmapped byte_cntr_ops.

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

[Severity: High]
As reported by Sashiko on v19 [2], what prevents concurrent read() calls on
the same open /dev/tmc_etr* file descriptor from racing on
byte_cntr_data->buf_node and nd->pos?

Because /dev/tmc_etr* is a character device opened with nonseekable_open(),
FMODE_ATOMIC_POS is not set and vfs_read() does not serialize concurrent
readers sharing an open file description via file->f_pos_lock. While
tmc_read_prepare_byte_cntr() prevents multiple concurrent open() calls via
byte_cntr_data->reading, multiple threads or processes sharing a single open
file descriptor can enter tmc_read() -> tmc_etr_get_sysfs_trace() ->
tmc_byte_cntr_get_data() and tmc_etr_update_buf_node_pos() simultaneously
without holding any lock:

1. When one thread reaches the end of the current buffer (actual =3D=3D 0 f=
rom
tmc_etr_read_sysfs_buf()), it sets byte_cntr_data->buf_node->reading =3D
false and byte_cntr_data->buf_node =3D NULL while a second thread that
already passed the !byte_cntr_data->buf_node check is about to dereference
byte_cntr_data->buf_node->pos and byte_cntr_data->buf_node->sysfs_buf,
causing a NULL pointer dereference.

2. If two threads both see !byte_cntr_data->buf_node and wake from
wait_event_interruptible_timeout(), both can call
tmc_etr_switch_buf_node(). Because tmc_etr_switch_buf_node() sets
curr_node->is_free =3D true at the same time as curr_node->reading =3D true,
the second call selects the first thread's curr_node as picked_node and
restarts ETR hardware DMA into that buffer while the first thread is
copying it to userspace.

3. In tmc_read(), tmc_etr_update_buf_node_pos() iterates
drvdata->etr_buf_list and updates nd->pos after copy_to_user() without
synchronization.

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

[Severity: High]
What happens here if userspace issues a zero-length read(fd, buf, 0) on
/dev/tmc_etr* during a byte-cntr read session?

vfs_read() invokes file->f_op->read() even when count is 0, passing len =3D=
=3D
0 down to tmc_read() -> tmc_get_sysfs_trace() -> tmc_etr_get_sysfs_trace()
-> tmc_byte_cntr_get_data(). In tmc_etr_read_sysfs_buf(), actual is
initialized to len (0), so the check:

	if (actual <=3D 0)
		return actual;

immediately returns 0 regardless of how much unread trace data remains in
sysfs_buf. tmc_byte_cntr_get_data() treats actual =3D=3D 0 as buffer
exhaustion, clears byte_cntr_data->buf_node->reading =3D false and
byte_cntr_data->buf_node =3D NULL (discarding all unread data in that
switched-out buffer), and jumps back to wait_buffer, where it loops
waiting for and discarding subsequent buffers until tracing stops or a
signal arrives.

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

[Severity: High]
Can tmc_read_unprepare_byte_cntr() race with a concurrent open() and close()
when the trace path is disabled during teardown?

In tmc_read_unprepare_byte_cntr(), byte_cntr_data->reading is checked
without holding byte_cntr_data->spin_lock and remains true while
tmc_clean_etr_buf_list(etr_drvdata) and the sleeping
disable_irq_wake(byte_cntr_data->irq) run.

If the ETR sink is in CS_MODE_SYSFS when tmc_clean_etr_buf_list() runs,
drvdata->etr_buf_list is emptied while drvdata->sysfs_buf is kept. If the
trace path is then disabled before byte_cntr_data->reading is cleared under
byte_cntr_data->spin_lock, coresight_get_mode(etr_drvdata->csdev) becomes
CS_MODE_DISABLED with an empty drvdata->etr_buf_list, drvdata->reading =3D=
=3D
false, drvdata->sysfs_buf !=3D NULL, and byte_cntr_data->reading =3D=3D tru=
e.

A second process opening /dev/tmc_etr* will call
tmc_read_prepare_byte_cntr(), which sees coresight_get_mode() !=3D
CS_MODE_SYSFS and returns -EINVAL before checking byte_cntr_data->reading.
tmc_read_prepare_etr() then falls through to generic ETR read preparation
and sets drvdata->reading =3D true. If that second process closes its file
descriptor before the first process clears byte_cntr_data->reading, the
second close() will also see byte_cntr_data->reading =3D=3D true in
tmc_read_unprepare_byte_cntr(), calling disable_irq_wake() and
module_put(THIS_MODULE) a second time and returning 0 without clearing
drvdata->reading or freeing drvdata->sysfs_buf.

[ ... ]
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
> +	 * the CTCU device is being removed.
> +	 */
> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing)
> +		return;
> +
> +	/*
> +	 * A new trace starts with an empty etr_buf. Don't reset the count if
> +	 * the byte-cntr is already started by another path of the same sink.
> +	 */
> +	if (!byte_cntr_data->enable)
> +		atomic_set(&byte_cntr_data->irq_cnt, 0);
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
Can ctcu_byte_cntr_start() corrupt an active read session or an already
running trace session here?

1. In coresight_enable_path_from_to(), helpers on the sink (ctcu_enable()
-> ctcu_byte_cntr_start()) are enabled before coresight_enable_sink() calls
tmc_enable_etr_sink_sysfs(). When a trace stops while /dev/tmc_etr* is still
open in byte-cntr mode, ctcu_byte_cntr_stop() sets byte_cntr_data->enable =
=3D
false while byte_cntr_data->reading remains true until the reader drains
the remaining data and closes the file. If another sysfs trace enable is
attempted on the same sink before the file is closed,
ctcu_byte_cntr_start() does not check byte_cntr_data->reading, so it resets
byte_cntr_data->irq_cnt to 0, reprograms IRQCTRL, and sets
byte_cntr_data->enable =3D true before tmc_enable_etr_sink_sysfs() rejects
the enable with -EBUSY. During that window, a concurrent read() in
tmc_byte_cntr_get_data() sees byte_cntr_data->enable =3D=3D true and blocks=
 in
wait_event_interruptible_timeout() instead of returning 0 to drain the
final buffer.

2. When a second source path is enabled on an already-running ETR sink
where byte_cntr_data->enable is already true, ctcu_byte_cntr_start() avoids
resetting irq_cnt, but still unconditionally reprograms the IRQCTRL
register using etr_drvdata->size / MAX_IRQ_CNT. Because buffer_size_store()
allows changing etr_drvdata->size while the ETR is running while
tmc_enable_etr_sink_sysfs() continues using the existing sysfs_buf of the
original size, reprogramming IRQCTRL when byte_cntr_data->enable is already
true can overwrite the threshold with a mismatched value (or 0 if
etr_drvdata->size < MAX_IRQ_CNT * 8, disabling interrupts while
byte_cntr_data->enable is true).

[ ... ]
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdat=
a, int etr_num)
> +{
[ ... ]
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
As reported by Sashiko on v20 [3], if devm_add_action_or_reset() fails in
ctcu_byte_cntr_init(), ctcu_byte_cntr_put_ops() is immediately called to
decrement byte_cntr_ops_users and reset byte_cntr_sysfs_ops to NULL, but
ctcu_byte_cntr_init() returns void without propagating the error to
ctcu_probe() or clearing byte_cntr_data[i].irq.

Doesn't this allow ctcu_probe() to succeed with the IRQs still registered
and the irq_enabled sysfs attributes exposed while byte_cntr_ops_users no
longer accounts for this device?

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index 739105acb0a13..cce4e4d76da0d 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
[ ... ]
> +static ssize_t irq_enabled_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf,
> +				 size_t size)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =3D
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +	u8 port =3D irq_attr->port;
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&drvdata->byte_cntr_data[port].spin_lock);
> +	if (drvdata->byte_cntr_data[port].reading)
> +		return -EBUSY;
> +	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		drvdata->byte_cntr_data[port].irq_enabled =3D !!val;
> +
> +	return size;
> +}

[Severity: High]
Can modifying irq_enabled while a trace path or generic ETR read session is
active desynchronize byte_cntr_data and ETR state?

1. irq_enabled_store() only checks drvdata->byte_cntr_data[port].reading,
not drvdata->byte_cntr_data[port].enable. If a sysfs trace path is enabled
with irq_enabled =3D=3D 1, ctcu_byte_cntr_start() programs the BYTECNTRVAL
register and sets byte_cntr_data->enable =3D true while
byte_cntr_data->reading remains false until /dev/tmc_etr* is opened. If
userspace writes 0 to irq_enabled before opening /dev/tmc_etr*,
tmc_read_prepare_byte_cntr() returns -EINVAL and tmc_read_prepare_etr()
falls back to generic ETR read (setting drvdata->reading =3D true while
byte_cntr_data->enable remains true and byte_cntr_data->reading is false).
If userspace then writes 1 to irq_enabled and a second process opens
/dev/tmc_etr*, tmc_read_prepare_byte_cntr() sets byte_cntr_data->reading =3D
true before tmc_create_etr_buf_list() fails with -EBUSY on
drvdata->reading. A concurrent close() of the first session during this
window will enter tmc_read_unprepare_byte_cntr() instead of generic
unprepare, calling disable_irq_wake() and module_put(THIS_MODULE) and
leaving drvdata->reading permanently stuck at true.

2. Similarly, if a generic sysfs read session is open (drvdata->reading =3D=
=3D
true) while byte_cntr_data->enable is true and the trace path is disabled,
tmc_disable_etr_sink() returns -EBUSY and leaves the sink mode as
CS_MODE_SYSFS. When ctcu_disable() -> ctcu_byte_cntr_stop() then runs, it
sees coresight_get_mode(sink) =3D=3D CS_MODE_SYSFS and returns early without
clearing the hardware IRQCTRL register or setting byte_cntr_data->enable =3D
false, even though the CTCU helper is being disabled.

[ ... ]
> @@ -244,10 +353,52 @@ static int ctcu_platform_probe(struct platform_devi=
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
> +
> +		/* Wake up the blocked reader, then wait for the session to end */
> +		wake_up_all(&byte_cntr_data->wq);
> +		wait_for_completion(&byte_cntr_data->session_done);

[Severity: High]
When ctcu_platform_remove() clears byte_cntr_data->enable and wakes a
blocked reader while the ETR sink is still actively tracing in
CS_MODE_SYSFS, won't this cause an unsynced read of the live DMA buffer and
leave the hardware IRQCTRL register enabled?

1. When woken in tmc_byte_cntr_get_data(), the reader sees
!byte_cntr_data->enable and returns 0. In tmc_etr_get_sysfs_trace(), a
return value of 0 is treated as meaning the sink has stopped and synced its
final buffer, so it falls through to
tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp). If at least
one buffer switch has already occurred via tmc_etr_switch_buf_node(), the
currently active drvdata->sysfs_buf still holds a non-zero stale
sysfs_buf->len from its previous fill cycle, so tmc_etr_read_sysfs_buf()
reads directly from the live drvdata->sysfs_buf while the ETR hardware is
actively DMA-writing to it (and without drvdata->reading synchronization
against a concurrent tmc_disable_etr_sink() -> tmc_etr_sync_sysfs_buf()).

2. Setting byte_cntr_data->enable =3D false here without clearing the
hardware BYTECNTRVAL register via ctcu_cfg_byte_cntr_reg() also causes
ctcu_byte_cntr_stop() to skip clearing the register when the path is later
disabled because byte_cntr_data->enable is already false.

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
As reported by Sashiko on v19 [4], in tmc_read(), negative error codes
returned by tmc_get_sysfs_trace() -> tmc_etr_get_sysfs_trace() ->
tmc_byte_cntr_get_data() (such as -ERESTARTSYS when
wait_event_interruptible_timeout() is interrupted by a signal, or -ENOMEM
when tmc_etr_switch_buf_node() fails) are caught by:

	actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
	if (actual <=3D 0)
		return 0;

Doesn't this convert -ERESTARTSYS and -ENOMEM into 0 (EOF) and terminate
the trace read session prematurely instead of propagating the error to
userspace?

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index bf4c1d8f7b2e0..20d6bc60a446e 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
[ ... ]
> @@ -2170,15 +2194,54 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *d=
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
errors other than -EBUSY (such as -ENOMEM or -ENODEV) from
byte_cntr_ops->read_prepare(drvdata) and fall through to the generic ETR
read path?

When byte-cntr is active in CS_MODE_SYSFS and tmc_read_prepare_byte_cntr()
fails (for example with -ENOMEM in tmc_create_etr_buf_list(), or -EINVAL
when drvdata->etr_mode =3D=3D ETR_MODE_RESRV), falling back to the generic =
ETR
read path halts the running ETR hardware via __tmc_etr_disable_hw() and
sets drvdata->reading =3D true while byte_cntr_data->reading remains false:

1. If a second process then calls open() on /dev/tmc_etr* while the first
process holds that fallback generic session open, tmc_read_prepare_etr()
calls tmc_read_prepare_byte_cntr() before checking drvdata->reading. The
second process sees byte_cntr_data->reading =3D=3D false, calls
try_module_get(THIS_MODULE), and sets byte_cntr_data->reading =3D true befo=
re
tmc_create_etr_buf_list() checks drvdata->reading under drvdata->spinlock
and fails with -EBUSY. If the first process calls close() during this
window, tmc_read_unprepare_etr() calls tmc_read_unprepare_byte_cntr(),
which sees byte_cntr_data->reading =3D=3D true and tears down the second
process's half-initialized state: it calls disable_irq_wake() before
enable_irq_wake() was called, clears byte_cntr_data->reading, calls
module_put(THIS_MODULE) (which the second process's err_reading path then
calls a second time, underflowing the module refcount), and returns 0 so
tmc_read_unprepare_etr() skips clearing drvdata->reading, permanently
wedging the ETR device.

2. Furthermore, in tmc_create_etr_buf_list(), if the sink is disabled while
drvdata->spinlock is dropped to allocate the second buffer and that
allocation fails, the error path calls tmc_clean_etr_buf_list(drvdata),
which frees the pre-existing drvdata->sysfs_buf and loses the captured
trace data.

[1] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[2] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[3] https://lore.kernel.org/r/20261030-enable-byte-cntr-for-ctcu-v20-6-bd5c=
3ac9f916@oss.qualcomm.com
[4] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org
[5] https://lore.kernel.org/r/20260625110924.BA8EA1F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-enable-byt=
e-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com?part=3D7
