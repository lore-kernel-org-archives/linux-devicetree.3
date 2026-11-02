Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614053;
	b=sph4MERkw1wPOwo7uwJnNzGkNLIac+vIKWgfUrBrJjSEKMlmS4oW4+HPQuJ7ktxXZc8G
	 2EGLz73U+UUK3ntpyPLwgR5VDhk5S15hCvjATfP+24wgljYBRhqa0t22cpcVGGG+h6ZEA
	 UYnRGFAhy5nHOc2OZTu9ay/7mTEI1MoRgluh32h1wYmszX6xZgn9q5B3j4Y47fYyvVNlI
	 QmY3AycyJsjTT9+nSXr7OW8rK43xHsEHXJUTF/hP60tGMlDGuwMf5/wUpx54s4p9Aj6zs
	 n6lcGpWMwWa6e1JYFR8Dh9VDIdL+eJb8AZ5prlQwK2QwQIezeQQuahfm3pzg3kzdgiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614053;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uhpnk/z4asSiXgQhDUPt4UHlpsK1EOkxbx+SraUCuCk=;
	b=sgg9hKVsKeOQI5Z1UUKTKBl3HKBkg28gAfWTsiFnxR4Y1WyL1THzqNOETD8MLbMj4UNx
	 VVBOSu/8DsG6nYdw3+TJoUDsNn3KVczz4flH/m+Swt7ORyLEc7m+YGZbx1A5FHVAenZL3
	 sXXHq9Z7zI0EDVUaIEivwV9hpMHtRAVrteiJ9uazjq+So9Z832NOv+am0+B/JIPVzGT2a
	 mcFxhIeuiLbspBVe634JeDQYRH5yvyavZ9w0O1km0w5NmXSV1UPmVscemjHQ64GxjXpGL
	 fE9O68LTFZXOgxKeI597h9DleFm5EivgsKoCmLCVotvtF4ofc8fvsxVNiAYc8QfioyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etNMV7m1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6D606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etNMV7m1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0060F1F000C1;
	Mon,  2 Nov 2026 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614052;
	bh=uhpnk/z4asSiXgQhDUPt4UHlpsK1EOkxbx+SraUCuCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=etNMV7m19kb55O9yZh9rWjdhPCGZl7Ce0l8q/0bb1uBEIRfFloYnxjcpTyHjGf4fE
	 cDxLuHmn36LksLjOr5a91ajHdd6mr4mETkIbP2m1JYf4oMkpG5UXBskru2Y2WOBaew
	 IYYsUaHLapuecWLSFv7pRVVQa3/+X+I7Mahv5O/1dvbEEatMtD1tVetTvMnxHvvadv
	 MS7ExcESO1/USUM7aDFTvg22chJxnWG8o7ZR/Iunhz4vuuu0SIEbDBI0YY1y2Zmu/x
	 V7osQP4sB3DPbpvM6SW1NdTc/ZscD0OlxHVZHdkUEq4mbUu7FEWpuULIeNU99GN3nh
	 JJczTn2DoBFpw==
Message-ID: <sashiko-outbox-193236@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-2-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
 <20261102-enable-byte-cntr-for-ctcu-v21-2-231e069b7853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:07:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] coresight: tmc-etr: sink disable race in tmc_create_etr_buf_list()
- [Medium] coresight: tmc-etr: incomplete ETR_MODE_RESRV check in tmc_creat=
e_etr_buf_list()
--

commit d6d5c00634b7362a8e8cc1b6d8b0dc4cadb55d89
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add create/clean functions for etr_buf_list

This commit introduces tmc_create_etr_buf_list() and
tmc_clean_etr_buf_list() to manage a list of etr_buf_node buffers on
TMC ETR devices for byte-cntr trace collection.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index 361a433e6f0c5..eee98a9269df4 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
[ ... ]
> @@ -1918,6 +1920,167 @@ const struct coresight_ops tmc_etr_cs_ops =3D {
>  	.panic_ops	=3D &tmc_etr_sync_ops,
>  };
> =20
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:	driver data of the TMC device.
> + *
> + * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
> + * If a node holds the live sysfs_buf and the sink is enabled in sysfs m=
ode, the
> + * node is removed but the buffer is not freed; ownership stays with
> + * drvdata->sysfs_buf.
> + *
> + * Locking: must not be called with @drvdata->spinlock held. The spinloc=
k is
> + * taken internally to serialise the @drvdata->sysfs_buf accesses and the
> + * removal of the nodes against the ETR sink enable/disable paths and the
> + * generic sysfs read. There must be only one owner of the list at a tim=
e.
> + * Must be called from process context: buffers are freed with the lock
> + * released.
> + */
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

[Severity: Medium]
As reported by Sashiko on v20 [1], can ETR_MODE_RESRV buffers still end up
in drvdata->etr_buf_list despite this check?

In tmc_create_etr_buf_list(), drvdata->etr_mode =3D=3D ETR_MODE_RESRV is
only checked once without holding drvdata->spinlock, and
drvdata->sysfs_buf->mode is not checked when wrapping the existing
drvdata->sysfs_buf into the list.

Because buf_mode_preferred_store() allows userspace to change
drvdata->etr_mode at any time via sysfs:
1. If the ETR sink was enabled while drvdata->etr_mode was
   ETR_MODE_RESRV (or reused a prior ETR_MODE_RESRV buffer in
   tmc_etr_get_sysfs_buffer()), drvdata->sysfs_buf->mode is
   ETR_MODE_RESRV. If buf_mode_preferred is then switched to another
   mode before tmc_create_etr_buf_list() runs, this check passes and
   the ETR_MODE_RESRV drvdata->sysfs_buf is wrapped into
   drvdata->etr_buf_list.
2. If buf_mode_preferred_store() -> buf_mode_set_resrv() changes
   drvdata->etr_mode to ETR_MODE_RESRV after this check while
   tmc_create_etr_buf_list() is in the unlocked allocation loop,
   tmc_alloc_etr_buf() re-reads drvdata->etr_mode and calls
   tmc_etr_alloc_resrv_buf(), mapping multiple nodes in
   drvdata->etr_buf_list to the same static drvdata->resrv_buf region.

Should tmc_create_etr_buf_list() also verify that
drvdata->sysfs_buf->mode !=3D ETR_MODE_RESRV and that newly allocated
buffers do not have sysfs_buf->mode =3D=3D ETR_MODE_RESRV?

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

[Severity: High]
As reported by Sashiko on v20 [2], what happens if the ETR sink is
disabled via sysfs while tmc_create_etr_buf_list() has dropped
drvdata->spinlock during the while (i < num_nodes) allocation loop?

Because drvdata->reading is not set and tmc_disable_etr_sink() only
checks drvdata->reading (not list_empty(&drvdata->etr_buf_list)), a
concurrent coresight_disable_sysfs() -> tmc_disable_etr_sink() can flush
and sync the hardware trace data into drvdata->sysfs_buf and set
drvdata->csdev mode to CS_MODE_DISABLED (after which
tmc_enable_etr_sink_perf() could also transition it to CS_MODE_PERF)
while drvdata->spinlock is released for kzalloc_obj() and
tmc_alloc_etr_buf():

1. If a subsequent allocation in the loop fails (ret !=3D 0),
   tmc_create_etr_buf_list() calls tmc_clean_etr_buf_list(drvdata).
   Because coresight_get_mode(drvdata->csdev) is no longer
   CS_MODE_SYSFS, tmc_clean_etr_buf_list() takes the else branch:

	if (nd->sysfs_buf =3D=3D drvdata->sysfs_buf) {
		if (coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_SYSFS)
			nd->sysfs_buf =3D NULL;
		else
			/* Free the buffer below through nd->sysfs_buf */
			drvdata->sysfs_buf =3D NULL;
	}

   and frees the pre-existing drvdata->sysfs_buf via
   tmc_etr_free_sysfs_buf(nd->sysfs_buf), discarding the synced sysfs
   trace data on an error rollback.

2. If all allocations in the loop succeed after the sink was
   concurrently disabled, the loop re-acquires drvdata->spinlock and
   adds the nodes to drvdata->etr_buf_list without re-checking
   coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_SYSFS, returning 0
   with a populated etr_buf_list on a sink that is no longer in
   CS_MODE_SYSFS.

Could tmc_create_etr_buf_list() re-check
coresight_get_mode(drvdata->csdev) =3D=3D CS_MODE_SYSFS under
drvdata->spinlock and ensure error cleanup does not free the
pre-existing drvdata->sysfs_buf?

[1] https://lore.kernel.org/r/20261030-enable-byte-cntr-for-ctcu-v20-2-bd5c=
3ac9f916@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261030-enable-byte-cntr-for-ctcu-v20-2-bd5c=
3ac9f916@oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-enable-byt=
e-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com?part=3D2
