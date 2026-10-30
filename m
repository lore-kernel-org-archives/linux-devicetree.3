Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341307;
	b=FdKJ1UVxcjcU/UUPkzC+I0YDFmtBY8vvLxb85/HY3YvOd66DERbSoqfoPRpoAyRjmj78
	 0AYshgojg5U6m+sbNEoxH9JBGJMzz2hzW4bkw1bIb9trSjhromr/VEwiHw1ckjuKJ4qNb
	 tuBmTPh35ODnrEmvgLPMFGGizfSShWeehZhEolS98C6mVGME1zHRqejkPNaTBYyMAfCGl
	 6kp/se5eMUlTUDO5OOaszlwvCLiwt2MEf6e0/y4O5qqgr7jdslmhds/UDVAL+lxkfsQ3G
	 oBQ9dLgY+3msjmfpTwbkyRwqPvHLcBkGmyhKySOIWIZESpcVnL8Tz6oEmby6/9Hw//g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zV9DWKFl9BH/doc6aAP765WpWny+pEhLti8M98KNIVo=;
	b=Cnzlowren/NiSCiEUccIU6Int4p0t+/yUmuwJvvaKIqIYZ5vFnz2blGH9Lc6Gkq4SXWW
	 9gQVEaftN1er1SYzar/3KTe+81hvxpjmUnnenJc2d62sNxd/61RhtTymjtms7B6Dw8YdU
	 Da2oE30aN4WrGnebUL7DW7QSAEaTV1XKOHFWvls8mh2tJcBqW5TvC4Vp4P712cHC4KZ8B
	 IRYSZmYGgd6zzRf2wJ5E3wzXI2ZOE3a5ppS5VhIt0wuNSVEghQ40ma0PgjRRnSZsgvdFM
	 x7CnQSMx/p5LGtOhOnNOFAjRYBHWGVlr6R74CS8XtE2I2WTn8uCLFCPJ2xUQCMheyvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olKCqNJs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4387606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olKCqNJs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35FF1F000C1;
	Fri, 30 Oct 2026 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341306;
	bh=zV9DWKFl9BH/doc6aAP765WpWny+pEhLti8M98KNIVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=olKCqNJsvbFz9oVWat6rOzxpzvmnl5XLEJCi/goYMVlf9vMfUwdxp1EZ3fH8Hhsg1
	 Mqz4fo1XHa6YI5XeK20UxkHDNpTd1B9A+vtTfc/YDVOJXRRMDYvAAQ77tXfPR7Ex9K
	 HAJ1Y4tLKBwIFere14VUMhB2rAyLMk5ivNplfPSANAHAql7RA2t4tKK318oVcf55ZI
	 CfdJ1lfTZcJtaJrL+jrDJbUqlD38iwwRYLSr8mgTVaQgK5KEXbkIi2O7XVh/zZ7Sv4
	 /QrnVDXEglaTY08bHGWI2oD7DtaarXDa4Ga54h8nflTP3bRUmsB6wVXnNk5V/9Mzi5
	 EhPPvfKhnA+eA==
Message-ID: <sashiko-outbox-190593@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-2-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
 <20261030-enable-byte-cntr-for-ctcu-v20-2-bd5c3ac9f916@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:21:45 +0000
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
- [High] coresight: tmc: missing synchronization between etr_buf_list and s=
ysfs read
- [High] coresight: tmc: race on sysfs_buf between enable_etr_sink_sysfs() =
and buf_list
- [Medium] coresight: tmc: tmc_create_etr_buf_list() frees live sysfs_buf o=
n error
- [Medium] coresight: tmc: tmc_clean_etr_buf_list() leaks sysfs_buf in CS_M=
ODE_PERF
- [Medium] coresight: tmc: etr_buf_list nodes alias same buffer in ETR_MODE=
_RESRV
- [Low] coresight: tmc: malformed kernel-doc comment on struct etr_buf_node
--

commit 55ef8c92705bdf84e1db45f929572fb3262ca0f1
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add create/clean functions for etr_buf_list

This commit introduces struct etr_buf_node, adds etr_buf_list to struct
tmc_drvdata, and provides tmc_create_etr_buf_list() and
tmc_clean_etr_buf_list() to manage ETR trace buffers for byte-cntr reading.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index 361a433e6f0c5..5981deb45d289 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(str=
uct coresight_device *csdev)
>  		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>  	}
> =20
> -	if (drvdata->reading || coresight_get_mode(csdev) =3D=3D CS_MODE_PERF) {
> +	/* The buffers in etr_buf_list are in use by the byte-cntr reading */
> +	if (drvdata->reading || coresight_get_mode(csdev) =3D=3D CS_MODE_PERF ||
> +	    !list_empty(&drvdata->etr_buf_list)) {
>  		ret =3D -EBUSY;
>  		goto out;
>  	}

[Severity: High]
Can tmc_enable_etr_sink_sysfs() race with tmc_create_etr_buf_list() and
tmc_clean_etr_buf_list() after tmc_etr_get_sysfs_buffer() drops
drvdata->spinlock?

In tmc_enable_etr_sink_sysfs(), tmc_etr_get_sysfs_buffer() checks
!list_empty(&drvdata->etr_buf_list) under drvdata->spinlock, sets or reuses
drvdata->sysfs_buf, and then releases drvdata->spinlock before returning
while coresight_get_mode(csdev) is still CS_MODE_DISABLED:

drivers/hwtracing/coresight/coresight-tmc-etr.c:tmc_enable_etr_sink_sysfs()=
 {
	struct etr_buf *sysfs_buf =3D tmc_etr_get_sysfs_buffer(csdev);

	if (IS_ERR(sysfs_buf))
		return PTR_ERR(sysfs_buf);

	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
}

If tmc_create_etr_buf_list() wraps drvdata->sysfs_buf into
drvdata->etr_buf_list during the unlocked window before
tmc_enable_etr_sink_sysfs() re-acquires drvdata->spinlock, and
tmc_clean_etr_buf_list() then runs (either because allocating the second
buffer node fails or the byte-cntr session closes), tmc_clean_etr_buf_list()
sees coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_DISABLED, sets
drvdata->sysfs_buf =3D NULL, and frees the buffer via tmc_etr_free_sysfs_bu=
f().
When tmc_enable_etr_sink_sysfs() subsequently acquires drvdata->spinlock, it
passes the dangling sysfs_buf pointer to tmc_etr_enable_hw(), programming
hardware DMA to the freed buffer.

Alternatively, if tmc_create_etr_buf_list() wraps drvdata->sysfs_buf during
that window and a concurrent perf session transitions csdev to CS_MODE_PERF
before tmc_enable_etr_sink_sysfs() re-acquires drvdata->spinlock,
tmc_enable_etr_sink_sysfs() sees CS_MODE_PERF, sets drvdata->sysfs_buf =3D =
NULL,
and frees sysfs_buf while drvdata->etr_buf_list still holds a node pointing=
 to
it, leading to a use-after-free and a double-free in tmc_clean_etr_buf_list=
().

> @@ -1918,6 +1920,138 @@ const struct coresight_ops tmc_etr_cs_ops =3D {
>  	.panic_ops	=3D &tmc_etr_sync_ops,
>  };
> =20
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:	driver data of the TMC device.
> + *
> + * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
> + * If a node holds the live sysfs_buf and the device is active, the node=
 is
> + * removed but the buffer is not freed; ownership stays with drvdata->sy=
sfs_buf.
> + *
> + * Locking: callers must guarantee exclusive access to @drvdata->etr_buf=
_list
> + * and must not hold @drvdata->spinlock. The spinlock is taken internall=
y only
> + * to serialise the @drvdata->sysfs_buf accesses against the ETR sink
> + * enable/disable paths. Must be called from process context: buffers ar=
e freed
> + * with the lock released.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +	struct etr_buf_node *nd, *next;
> +	unsigned long flags;
> +
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		if (nd->sysfs_buf =3D=3D drvdata->sysfs_buf) {
> +			if (coresight_get_mode(drvdata->csdev) !=3D CS_MODE_DISABLED)
> +				/*
> +				 * The device is still active. Keep the live
> +				 * buffer owned by drvdata->sysfs_buf and only
> +				 * drop the list's reference to it.
> +				 */
> +				nd->sysfs_buf =3D NULL;
> +			else
> +				/* Free the buffer below through nd->sysfs_buf */
> +				drvdata->sysfs_buf =3D NULL;
> +		}

[Severity: Medium]
As reported by Sashiko on v19 [1], does tmc_clean_etr_buf_list() leak
drvdata->sysfs_buf when the device is in CS_MODE_PERF?

Here tmc_clean_etr_buf_list() checks coresight_get_mode(drvdata->csdev) !=3D
CS_MODE_DISABLED to determine whether the hardware is still using
drvdata->sysfs_buf. However, in CS_MODE_PERF the ETR hardware uses
drvdata->perf_buf rather than drvdata->sysfs_buf (compare
tmc_read_unprepare_etr(), which checks coresight_get_mode(drvdata->csdev) =
=3D=3D
CS_MODE_SYSFS and frees drvdata->sysfs_buf in all other modes).

Because drvdata->reading is not set during a byte-cntr read session (or dur=
ing
the unlocked allocation loop in tmc_create_etr_buf_list()), the sysfs sessi=
on
can be disabled via tmc_disable_etr_sink() and a perf session can be enabled
via tmc_enable_etr_sink_perf(). When tmc_clean_etr_buf_list() then runs,
coresight_get_mode(drvdata->csdev) !=3D CS_MODE_DISABLED evaluates to true =
for
CS_MODE_PERF, so nd->sysfs_buf is cleared to NULL and drvdata->sysfs_buf is
left allocated without being freed by perf teardown. Should this check
coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_SYSFS instead?

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
> + * Locking: callers must guarantee exclusive access to @drvdata->etr_buf=
_list
> + * and must not hold @drvdata->spinlock. The spinlock is taken internall=
y only
> + * to serialise the @drvdata->sysfs_buf accesses against the ETR sink
> + * enable/disable paths. Must be called from process context: buffers an=
d nodes
> + * are allocated with the lock released.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */

[Severity: Low]
This isn't a bug, but the kernel-doc return section in
tmc_create_etr_buf_list() is missing the colon after Return ("Return:"), wh=
ich
triggers a kernel-doc warning when building with W=3D1.

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

[Severity: Medium]
What happens in tmc_create_etr_buf_list() when drvdata->etr_mode is set to
ETR_MODE_RESRV (via buf_mode_preferred =3D "resrv")?

In ETR_MODE_RESRV, tmc_alloc_etr_buf() calls tmc_etr_alloc_resrv_buf(), whi=
ch
maps the same static drvdata->resrv_buf.paddr and drvdata->resrv_buf.vaddr
into every allocated etr_buf:

drivers/hwtracing/coresight/coresight-tmc-etr.c:tmc_etr_alloc_resrv_buf() {
	...
	resrv_buf->daddr =3D dma_map_resource(real_dev, drvdata->resrv_buf.paddr,
					   drvdata->resrv_buf.size,
					   DMA_FROM_DEVICE, 0);
	...
	resrv_buf->vaddr =3D drvdata->resrv_buf.vaddr;
}

When tmc_create_etr_buf_list() wraps the existing drvdata->sysfs_buf into t=
he
first node and allocates the second node via tmc_alloc_etr_buf(), both nodes
in etr_buf_list alias the exact same physical reserved buffer. When byte-cn=
tr
switches to the second node and restarts ETR hardware capture, wouldn't the
hardware DMA overwrite the same buffer while userspace is reading from the
first node?

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
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);

[Severity: Medium]
As reported by Sashiko on v19 [1], if kzalloc_obj() or tmc_alloc_etr_buf()
fails in the while (i < num_nodes) loop, can the error path in
tmc_create_etr_buf_list() free the pre-existing drvdata->sysfs_buf and lose
captured trace data?

At the start of tmc_create_etr_buf_list(), the pre-existing drvdata->sysfs_=
buf
is wrapped into the first struct etr_buf_node on drvdata->etr_buf_list so t=
hat
its captured trace data is preserved. During the subsequent unlocked
allocation loop (or if the ETR was already disabled), the ETR sink can be
disabled via tmc_disable_etr_sink(), transitioning drvdata->csdev to
CS_MODE_DISABLED.

If a later node or buffer allocation fails, tmc_create_etr_buf_list() calls
tmc_clean_etr_buf_list(drvdata). When tmc_clean_etr_buf_list() visits the
first node where nd->sysfs_buf =3D=3D drvdata->sysfs_buf and sees
coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_DISABLED, it sets
drvdata->sysfs_buf =3D NULL and frees nd->sysfs_buf via
tmc_etr_free_sysfs_buf(), destroying the pre-existing buffer and its trace
data instead of only freeing the nodes and buffers allocated by
tmc_create_etr_buf_list().

> +
>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  {
>  	int ret =3D 0;

[Severity: High]
Should tmc_read_prepare_etr() check !list_empty(&drvdata->etr_buf_list), and
should tmc_create_etr_buf_list() and tmc_clean_etr_buf_list() check
drvdata->reading?

tmc_etr_get_sysfs_buffer() checks !list_empty(&drvdata->etr_buf_list)
alongside drvdata->reading because tmc_create_etr_buf_list() wraps
drvdata->sysfs_buf into drvdata->etr_buf_list while leaving drvdata->reading
false. However, tmc_read_prepare_etr() only checks drvdata->reading:

drivers/hwtracing/coresight/coresight-tmc-etr.c:tmc_read_prepare_etr() {
	...
	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
	if (drvdata->reading) {
		ret =3D -EBUSY;
		goto out;
	}
}

When the ETR sink is disabled during an open byte-cntr read session (which =
is
allowed because drvdata->reading is false), opening /dev/tmc_etrX a second
time causes tmc_read_prepare_byte_cntr() later in the series to return -EIN=
VAL
because coresight_get_mode(etr_drvdata->csdev) !=3D CS_MODE_SYSFS, falling
through in tmc_read_prepare_etr() to the generic sysfs read path. Because
tmc_read_prepare_etr() does not check !list_empty(&drvdata->etr_buf_list), =
it
sees drvdata->reading =3D=3D false and drvdata->sysfs_buf !=3D NULL, and se=
ts
drvdata->reading =3D true on the same buffer wrapped in drvdata->etr_buf_li=
st.

When the first file descriptor is closed, tmc_clean_etr_buf_list() sees
CS_MODE_DISABLED without checking drvdata->reading, sets drvdata->sysfs_buf=
 =3D
NULL, and frees nd->sysfs_buf while the second file descriptor still has
drvdata->reading =3D=3D true. A subsequent read() on the second file descri=
ptor
calls tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, ...), causing a
use-after-free or a NULL pointer dereference on sysfs_buf->len.

Conversely, if a generic sysfs read session already has drvdata->reading =
=3D=3D
true when a second open of /dev/tmc_etrX enters tmc_create_etr_buf_list(),
tmc_create_etr_buf_list() does not check drvdata->reading before wrapping t=
he
active drvdata->sysfs_buf into drvdata->etr_buf_list.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtrac=
ing/coresight/coresight-tmc.h
> index 319a354ede9fc..6e994678f9264 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>  	s64		len;
>  };
> =20
> +/**
> + * @sysfs_buf:	Allocated sysfs_buf.
> + * @is_free:	Indicates whether the buffer is free to choose.
> + * @pos:	Offset to the start of the buffer.
> + * @link:	list_head of the node.
> + */
> +struct etr_buf_node {

[Severity: Low]
This isn't a bug, but the kernel-doc comment above struct etr_buf_node star=
ts
with /** without the required "struct etr_buf_node - <short description>"
first line, which produces a kernel-doc warning.

[1] https://lore.kernel.org/r/20260625-enable-byte-cntr-for-ctcu-v19-2-8fbb=
f22e8381@oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-enable-byt=
e-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com?part=3D2
