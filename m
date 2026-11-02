Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614293;
	b=Lq1f1jGx4BNS/d/JJpOPkpYYiZddd3+9zi6mmv92rQgIdzq2vJnPoS63Plv77mOE28jh
	 UEboAxaQ6f6nc4gDh6rJuBSAWCUOL2MQxiLQxoA5i9AjY4D2s0JwA+O1G404yn74kpj13
	 bmRRB+TINliRrXL0TBaOLWNW6xFfdJ/Z1Asp+s4ARUXNZwpwgSUqtoTfVkjAZ21KXo7xA
	 zwe2qB93yT60GdAmhgAsZKlkZh9KcndZb3IV5ClNXLJRlKiXSyc6bkQwd8uZUKqaGkQ0s
	 dql5oONOF1LU/ZBppDQTdkk4rTdZAnGMdEAy7E1e2qAb9iTDPRbGsNGtrAOqSGo46JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lz0EVjg0T9J8qFB4ufZ9Z/DxmYRMBMyI0qiXHXq7ERs=;
	b=BfsD1Kg2atkRhH3lhDiY0GltuUlYLnGaaBQQxKquhUY9cw90GCrLF3WhMJMvJoqyKAjx
	 cpK3bDVjfTPnWCNcLuUAjg3MB474DWejZu+cF3BQAfO0kiVVV29Kipf5Z4aa9ufKe2CFk
	 c8iAljEqr1Wnj0kzCd5am0wM2bCf23Wu2X2se3dBWetDBKsdiWuImQTLpoEdUrYQbVnG0
	 VoeTG+FuLv3ITqhY33o0KFBCcvfoWmW+id2PHBm9vZZ9vgLFlC3lUNC6huztDmrAyvr5q
	 IP5umkNulxFJzflfKqujIVvLQSHGwQQcFXzfUTmlxRpKNphxVFPPdY2r6dlOikFt69A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OH+X0f8U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A488606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OH+X0f8U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C371F000C1;
	Mon,  2 Nov 2026 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614293;
	bh=Lz0EVjg0T9J8qFB4ufZ9Z/DxmYRMBMyI0qiXHXq7ERs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OH+X0f8U8quOKl8QTjudtTwXuYt7DhqPNOLZy8vO4BCMaNNjpuKtcMUAmynnXB/qX
	 sl08UfR2oY6tyImKJIRa71/nRtUe1kGlows4kZBQbbEJ4aMjsh4q6uOX6BzKXpLFrw
	 xzpcNEoqG5XOoufgY1nTpEfp7jW3Q0S6R1oCt4XpBqiJ9fJGxpFUCw1EhDEt+JeQK+
	 5BJ3AGTkQuJn2DqxgTUJkxfmAf73wfREfpLx/NQV+ALjxOIQUK+DqqHZczGXu+6Hjn
	 DkGXj6ibqptBorxbQQ+5RLzans1eAGQrP8pvsgs6dMSGuRF354ktezG5+feJy3X61h
	 5IvIXzjHdxk9w==
Message-ID: <sashiko-outbox-193241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 8/8] arm64: dts: qcom: lemans: add interrupts to
 CTCU device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-8-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
 <20261102-enable-byte-cntr-for-ctcu-v21-8-231e069b7853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:11:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] coresight: tmc: negative error codes converted to EOF in tmc_rea=
d()
- [Medium] coresight: tmc-etr: unhandled errors in tmc_read_prepare_etr()
- [Medium] coresight: tmc-etr: buffer mismatch and data loss in tmc_create_=
etr_buf_list()
- [Medium] coresight: ctcu: active state not checked in irq_enabled_store()
- [Medium] coresight: tmc-etr: unsynced buffer read in tmc_etr_get_sysfs_tr=
ace()
- [Medium] coresight: ctcu: active session not checked in ctcu_byte_cntr_st=
art()
--

commit 2fcbfd8bf479b22e68a324c313723f1a742b7f24
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: lemans: add interrupts to CTCU device

This series enables the CTCU byte-cntr function for TMC ETR devices,
allowing userspace to read trace data from switched ETR buffers while
tracing continues, and wires up the CTCU interrupts on Lemans.

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/dri=
vers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 0000000000000..bff87e776a755
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
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
What happens in ctcu_byte_cntr_start() if a previous byte-cntr read session
still has the ETR device open to drain the final stopped buffer when a new
sysfs trace path is enabled?

In coresight_enable_path_from_to(), helpers are enabled before the sink:

  coresight_enable_path_from_to()
    coresight_enable_helpers()
      ctcu_enable()
        ctcu_byte_cntr_start()
    coresight_enable_sink()
      tmc_enable_etr_sink_sysfs()
        tmc_etr_get_sysfs_buffer() -> returns -EBUSY

Because ctcu_byte_cntr_start() does not check byte_cntr_data->reading, it
sets byte_cntr_data->enable =3D true, resets byte_cntr_data->irq_cnt to 0,
and reprograms the IRQCTRL register before tmc_etr_get_sysfs_buffer()
rejects the new path with -EBUSY (potentially after sleeping in
tmc_etr_setup_sysfs_buf()). During that window, a read by the existing
reader in tmc_byte_cntr_get_data() will see byte_cntr_data->enable =3D=3D t=
rue
and block in wait_event_interruptible_timeout() instead of returning 0 to
drain the final buffer.

Also, when a second path is enabled on an already-active ETR sink where
byte_cntr_data->enable is already true, ctcu_byte_cntr_start()
unconditionally reprograms the IRQCTRL register using etr_drvdata->size /
MAX_IRQ_CNT even if buffer_size was modified in sysfs after the active
sysfs_buf was allocated. Should ctcu_byte_cntr_start() bail out when
byte_cntr_data->reading or byte_cntr_data->enable is already set?

> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01e..cce4e4d76da0d 100644
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

[Severity: Medium]
Can toggling irq_enabled in irq_enabled_store() while a trace path is
already active (before /dev/tmc_etr* is opened) leave software state out of
sync with the CTCU hardware?

irq_enabled_store() only checks drvdata->byte_cntr_data[port].reading, not
drvdata->byte_cntr_data[port].enable or whether a trace path is active on
that port.

If irq_enabled is changed from 1 to 0 after ctcu_byte_cntr_start() has
already enabled hardware interrupts and set byte_cntr_data->enable =3D true,
opening the ETR device causes tmc_read_prepare_byte_cntr() to return
-EINVAL, and tmc_read_prepare_etr() falls back to generic sysfs read
preparation (stopping the ETR hardware and setting drvdata->reading =3D tru=
e)
while CTCU interrupts and byte_cntr_data->enable remain active. Conversely,
if irq_enabled is changed from 0 to 1 after the path was enabled without
starting byte-cntr, tmc_read_prepare_byte_cntr() sees irq_enabled =3D=3D tr=
ue
and enable =3D=3D false, returns -ENODEV, and tmc_read_prepare_etr() simila=
rly
falls through to stopping the ETR hardware.

Should irq_enabled_store() also reject updates when
drvdata->byte_cntr_data[port].enable is true or when the port has active
trace IDs?

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/h=
wtracing/coresight/coresight-tmc-core.c
> index bc5a133ada3e3..6ad09995ba87c 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
[ ... ]
> @@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file=
 *file)
>  static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t p=
os, size_t len,
>  				   char **bufpp)
>  {
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
> -	case TMC_CONFIG_TYPE_ETR:
> -		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> -	}
> -
> -	return -EINVAL;
> +	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
>  }
> =20
>  static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
> @@ -315,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __use=
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
Doesn't tmc_read() in drivers/hwtracing/coresight/coresight-tmc-core.c turn
negative error codes from byte-cntr reads into 0 (EOF)?

In tmc_byte_cntr_get_data(), wait_event_interruptible_timeout() returns
-ERESTARTSYS when interrupted by a signal, and a failed buffer switch while
the sink is still in CS_MODE_SYSFS returns -ENOMEM. Then
tmc_etr_get_sysfs_trace() propagates those negative error codes:

  if (ret !=3D -EINVAL && ret !=3D 0)
          return ret;

However, tmc_read() does:

  actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
  if (actual <=3D 0)
          return 0;

As a result, -ERESTARTSYS and -ENOMEM are returned to userspace as 0,
causing trace readers to treat a signal interruption or buffer switch error
as end-of-file. Should tmc_read() return actual when actual <=3D 0?

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index 361a433e6f0c5..20d6bc60a446e 100644
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
>  }
> =20
>  static struct etr_buf *
> @@ -1224,6 +1272,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdat=
a *drvdata)
> =20
>  }
> =20
> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
> +{
> +	u32 sts;
> +
> +	CS_UNLOCK(drvdata->base);
> +	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	sts =3D readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
> +	writel_relaxed(sts, drvdata->base + TMC_STS);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +/**
> + * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_=
buf_list.
> + * @drvdata:	drvdata of the TMC device.
> + *
> + * Stop the ETR, hand over the current buffer for reading, switch to a f=
ree
> + * buffer and restart the ETR. All of this is done with @drvdata->spinlo=
ck held,
> + * so it can't race with the sink disable path.
> + *
> + * Return: the node of the switched out buffer, or NULL if the sink isn'=
t in
> + * sysfs mode or there is no free buffer. The ETR is left untouched in b=
oth
> + * cases.
> + */
> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
> +{
> +	struct etr_buf_node *nd, *curr_node =3D NULL, *picked_node =3D NULL;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	if (coresight_get_mode(drvdata->csdev) !=3D CS_MODE_SYSFS)
> +		goto out;
> +
> +	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
> +		if (nd->sysfs_buf =3D=3D drvdata->sysfs_buf)
> +			curr_node =3D nd;
> +		else if (!picked_node && nd->is_free)
> +			picked_node =3D nd;
> +	}
> +
> +	if (!curr_node || !picked_node) {
> +		curr_node =3D NULL;
> +		goto out;
> +	}
> +
> +	__tmc_etr_disable_hw(drvdata);
> +
> +	/* The switched out buffer is free again once it has been read */
> +	curr_node->is_free =3D true;
> +	curr_node->pos =3D 0;
> +	curr_node->reading =3D true;
> +	picked_node->is_free =3D false;
> +	drvdata->sysfs_buf =3D picked_node->sysfs_buf;
> +	drvdata->etr_buf =3D picked_node->sysfs_buf;
> +
> +	tmc_etr_reset_sysfs_buf(drvdata);
> +	if (__tmc_etr_enable_hw(drvdata))
> +		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
> +out:
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +	return curr_node;
> +}

[Severity: Medium]
Could tmc_etr_get_sysfs_trace() end up reading an unsynced, live DMA buffer
if ctcu_platform_remove() runs while the ETR sink is still active in
CS_MODE_SYSFS?

In ctcu_platform_remove(), byte_cntr_data->enable is set to false and
byte_cntr_data->wq is woken while the ETR sink can still be running in
CS_MODE_SYSFS. In tmc_byte_cntr_get_data(), seeing !byte_cntr_data->enable
causes it to return 0:

  ctcu_platform_remove()
    byte_cntr_data->enable =3D false;
    wake_up_all(&byte_cntr_data->wq);

  tmc_etr_get_sysfs_trace()
    tmc_byte_cntr_get_data() -> returns 0
    tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp)

tmc_etr_get_sysfs_trace() treats 0 as meaning the sink has stopped and
immediately calls tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, ...). However,
if at least one buffer switch has already happened in
tmc_etr_switch_buf_node(), picked_node->sysfs_buf->len was never reset to 0
when switching to it, so drvdata->sysfs_buf->len still holds the non-zero
length from its previous fill while the ETR hardware is actively writing to
that DMA buffer without having been stopped or synced.

Should tmc_etr_switch_buf_node() reset picked_node->sysfs_buf->len (and
offset) to 0 before restarting the ETR, and should tmc_byte_cntr_get_data()
return an error (such as -ENODEV) instead of 0 when byte_cntr_data->removing
is set or when the sink is still in CS_MODE_SYSFS?

[ ... ]
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +	struct etr_buf_node *nd, *next;
> +	unsigned long flags;
> +
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		if (nd->sysfs_buf =3D=3D drvdata->sysfs_buf) {
> +			if (coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_SYSFS)
> +				/*
> +				 * The sink is still enabled in sysfs mode. Keep
> +				 * the live buffer owned by drvdata->sysfs_buf
> +				 * and only drop the list's reference to it.
> +				 */
> +				nd->sysfs_buf =3D NULL;
> +			else
> +				/* Free the buffer below through nd->sysfs_buf */
> +				drvdata->sysfs_buf =3D NULL;
> +		}
> +		list_del(&nd->link);
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +		/* Free the buffer (NULL is ignored) and the node out of the lock */
> +		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
> +		kfree(nd);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
> + * @drvdata:	driver data of the TMC device.
> + * @num_nodes:	number of nodes want to create with the list.
> + *
> + * Locking: must not be called with @drvdata->spinlock held. The spinloc=
k is
> + * taken internally to serialise the @drvdata->sysfs_buf accesses and ev=
ery
> + * update of @drvdata->etr_buf_list against the ETR sink enable/disable =
paths
> + * and the generic sysfs read. There must be only one owner of the list =
at a
> + * time. Must be called from process context: buffers and nodes are allo=
cated
> + * with the lock released.
> + *
> + * Return: 0 upon success, else the error number: -EBUSY if a generic sy=
sfs
> + * read is in progress, -EINVAL if the sink is not enabled in sysfs mode=
 or
> + * the ETR is in the reserved buffer mode, or the error of the allocatio=
n.
> + */
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> +{
> +	struct etr_buf_node *new_node;
> +	struct etr_buf *sysfs_buf;
> +	unsigned long flags;
> +	int i =3D 0, ret =3D 0;
> +
> +	/* We don't need a list if there is only one node */
> +	if (num_nodes < 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * All the etr_buf of the reserved mode are mapped to the same reserved
> +	 * region, so they can't be used as separate buffers of the list.
> +	 */
> +	if (drvdata->etr_mode =3D=3D ETR_MODE_RESRV)
> +		return -EINVAL;
> +
> +	/*
> +	 * We expect that sysfs_buf in drvdata has already been allocated.
> +	 * Wrap the live sysfs_buf into the first node so the captured trace
> +	 * data is preserved. Take the sysfs_buf and add the node under the
> +	 * lock, so that the ETR sink enable path sees a non-empty list and
> +	 * doesn't replace the buffer.
> +	 */
> +	new_node =3D kzalloc_obj(*new_node, GFP_KERNEL);
> +	if (!new_node)
> +		return -ENOMEM;
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	/* The sysfs_buf is in use by a sysfs read session */
> +	if (drvdata->reading) {
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +		kfree(new_node);
> +		return -EBUSY;
> +	}
> +
> +	/*
> +	 * The sink enable path reuses or frees the sysfs_buf of a sink which
> +	 * isn't enabled, so only wrap it while the sink is enabled in sysfs mo=
de.
> +	 */
> +	if (coresight_get_mode(drvdata->csdev) !=3D CS_MODE_SYSFS) {
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +		kfree(new_node);
> +		return -EINVAL;
> +	}
> +
> +	if (drvdata->sysfs_buf) {
> +		new_node->sysfs_buf =3D drvdata->sysfs_buf;
> +		new_node->is_free =3D false;
> +		list_add(&new_node->link, &drvdata->etr_buf_list);
> +		new_node =3D NULL;
> +		i++;
> +	}
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	/* Free the node if there is no live sysfs_buf to wrap */
> +	kfree(new_node);
> +
> +	while (i < num_nodes) {
> +		new_node =3D kzalloc_obj(*new_node, GFP_KERNEL);
> +		if (!new_node) {
> +			ret =3D -ENOMEM;
> +			break;
> +		}
> +
> +		/* Allocate the buffer with the lock released */
> +		sysfs_buf =3D tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node=
(0), NULL);
> +		if (IS_ERR(sysfs_buf)) {
> +			kfree(new_node);
> +			ret =3D PTR_ERR(sysfs_buf);
> +			break;
> +		}
> +
> +		new_node->sysfs_buf =3D sysfs_buf;
> +		/*
> +		 * The drvdata->sysfs_buf write and the list update need the
> +		 * spinlock, to serialise against the ETR sink enable/disable
> +		 * paths.
> +		 */
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		/* We don't have an available sysfs_buf in drvdata, set one up */
> +		if (!drvdata->sysfs_buf) {
> +			drvdata->sysfs_buf =3D sysfs_buf;
> +			new_node->is_free =3D false;
> +		} else {
> +			new_node->is_free =3D true;
> +		}
> +		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +		i++;
> +	}
> +
> +	/* Clean the list if there is an error */
> +	if (ret)
> +		tmc_clean_etr_buf_list(drvdata);
> +
> +	return ret;
> +}

[Severity: Medium]
Can tmc_create_etr_buf_list() free the pre-existing drvdata->sysfs_buf on
error, or allocate mismatched buffers if sysfs settings changed after the
sink was enabled?

First, tmc_create_etr_buf_list() wraps the live drvdata->sysfs_buf into the
first node and then drops drvdata->spinlock while allocating the second
buffer. If a concurrent tmc_disable_etr_sink() stops the sink during that
window (changing the mode to CS_MODE_DISABLED) and the second allocation
then fails, the error path calls tmc_clean_etr_buf_list(). Because
coresight_get_mode(drvdata->csdev) is no longer CS_MODE_SYSFS,
tmc_clean_etr_buf_list() sets drvdata->sysfs_buf =3D NULL and frees the
pre-existing drvdata->sysfs_buf, losing the captured trace data on a failed
open().

Second, tmc_create_etr_buf_list() checks drvdata->etr_mode =3D=3D ETR_MODE_=
RESRV
without holding drvdata->spinlock and allocates subsequent buffers using
drvdata->size rather than the wrapped drvdata->sysfs_buf->mode and
drvdata->sysfs_buf->size. If buf_mode_preferred or buffer_size was modified
in sysfs after the sink was enabled, tmc_create_etr_buf_list() can wrap an
existing ETR_MODE_RESRV buffer or allocate a second buffer whose size does
not match the first buffer and the programmed CTCU IRQ threshold.

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

[Severity: Medium]
In tmc_read_prepare_etr(), what happens when byte_cntr_ops->read_prepare()
fails with an error other than -EBUSY?

When byte-cntr is active on the trace path, tmc_read_prepare_byte_cntr() can
return -ENOMEM (if tmc_create_etr_buf_list() fails to allocate a node or
DMA buffer), -EINVAL (if tmc_create_etr_buf_list() rejects ETR_MODE_RESRV),
or -ENODEV (if try_module_get() fails or ctcu_platform_remove() cleared
byte_cntr_data->enable).

Because tmc_read_prepare_etr() only returns when !ret || ret =3D=3D -EBUSY =
and
otherwise resets ret =3D 0, any of those failures falls through to the gene=
ric
ETR read preparation path. When the sink is active in CS_MODE_SYSFS, that
fallback calls __tmc_etr_disable_hw(drvdata), stopping the ETR hardware in
the middle of an active byte-cntr trace session, and sets drvdata->reading =
=3D
true. If the trace path is later disabled while the file remains open,
tmc_disable_etr_sink() returns -EBUSY (leaving the sink mode as
CS_MODE_SYSFS), which causes ctcu_byte_cntr_stop() to return early without
clearing byte_cntr_data->enable or disabling the CTCU IRQCTRL register
before coresight_release_path() drops the CTCU runtime PM reference.

Should tmc_read_prepare_byte_cntr() use a distinct return code (or a boolean
out-parameter) when byte-cntr is not applicable, so that
tmc_read_prepare_etr() propagates real errors instead of falling back to
generic sysfs read preparation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-enable-byt=
e-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com?part=3D8
