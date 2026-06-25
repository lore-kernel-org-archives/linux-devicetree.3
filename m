Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5905E383C83
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385569; cv=none; b=CWuhO9AqcrZfP/aTs8br9S9p4/MJyYR6iJoqdKVTUX/Y8Rpl08M/rPva7K6B0Y9xoFzF7j1MWTHo4rwYvHPj7LBQvxKPnSkYQZb/c28RBHKr2d+R//3hOAL9M6z0a64YwYJRWbXKXjpfxoz1LVSobkc6vaOlyj23CFnNaLXjdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385569; c=relaxed/simple;
	bh=FKE+a5OpeiR/K/K1eEOA1c7r5B3rjnb/OFz+wE1wGp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EsClqcx413qFXfoWVEcz0fLg28Amho9Wx2tnvd05ZoBDMdZ+nWzqPM6p9lao/wH5s7y8kkleTxsagG+D6ba4u3bRozYbuKIPV7kqML2O7NWIQetR/gFhKrG+rx7wPS64esWYkmNrF3BOzG2ZS7cpPpg9RN3C1mMkGv9xfRJlyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/mnk90T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/mnk90T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAD21F000E9;
	Thu, 25 Jun 2026 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385568;
	bh=1ridkATQuGARAH38b4ZlUfxDRPuaaToKaKhKzfRj4yI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/mnk90TW/tWPoM70vq1TfRUBiVxgJwti8oqDJEorhRoao2HxIvH0zQ8aDXKx7XN8
	 oDduN/YLy9vKuB2mz68kC+yx7Wrvt0pz5WGiWyC3rchjfbQZ2r9d4Ox65HcLMsdPB0
	 Z5rNTgQWCE8pT5SbyTJDAW78s3JorSP66ouX83zM/38cAQsEHJ8P8kbkKJ4Kpt4+Fx
	 T1o2zSIrnIkcQnmO4o+fz5jWbQ4fDdaYAS2tQ1KhxskTFGUDNNmtLWPpw7hJSg/OJt
	 4eUvXITR/N0Sfwk1QHfxeAcpWB78GPunDrJQuq536UnDYjuVtmajVgpvHrr7W1XKT2
	 a6cOnffSWyfDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-2-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
 <20260625-enable-byte-cntr-for-ctcu-v19-2-8fbbf22e8381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:06:07 +0000
Message-Id: <20260625110607.8CAD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Lockless read of `drvdata->sysfs_buf` in `tmc_create_etr_buf_list`=
 leads to a Time-of-Check to Time-of-Use race condition, resulting in a Dou=
ble-Free or Use-After-Free.
- [Medium] The error path in `tmc_create_etr_buf_list` destructively frees =
the pre-existing `drvdata->sysfs_buf` if the device becomes inactive, leadi=
ng to the irreversible loss of previously captured trace data.
- [Medium] `tmc_clean_etr_buf_list` leaks `drvdata->sysfs_buf` if called wh=
en the device is active in a non-SYSFS mode (e.g., `CS_MODE_PERF`).
--

commit efe04b42620438e6e268cf24ebf0538327ca8629
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add create/clean functions for etr_buf_list

This commit introduces functions for creating and cleaning a list of
etr_buf_node elements to manage etr_buf entries. It is intended to support
byte-counter functionality which requires multiple trace data buffers.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index 361a433e6f0c5..9b3ef73e9cf27 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c

[ ... ]

> @@ -1918,6 +1918,132 @@ const struct coresight_ops tmc_etr_cs_ops =3D {
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

[Severity: Medium]
Will this leak drvdata->sysfs_buf if the device mode is active in a non-SYS=
FS
mode (such as CS_MODE_PERF)?

If the mode changes to CS_MODE_PERF concurrently during the
tmc_create_etr_buf_list() error path, this condition evaluates to true and
abandons the pointer by setting nd->sysfs_buf to NULL.

Since PERF mode tracing exclusively manages drvdata->perf_buf, does its
teardown path ever free drvdata->sysfs_buf?

> +			else
> +				/* Free the buffer below through nd->sysfs_buf */
> +				drvdata->sysfs_buf =3D NULL;

[Severity: Medium]
If tmc_create_etr_buf_list() encounters an allocation failure and calls
tmc_clean_etr_buf_list() to roll back, and the device happens to be inactiv=
e,
will this unconditionally clear and free the pre-existing drvdata->sysfs_bu=
f?

Should an initialization error path only clean up the resources it allocate=
d,
rather than destroying a preserved external resource and losing previously
captured trace data?

> +		}
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +		/* Free the buffer (NULL is ignored) and the node out of the lock */
> +		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
> +		list_del(&nd->link);
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
> +	 * data is preserved. The list is owned by the caller, so no lock is
> +	 * needed to read sysfs_buf or to add the node here.
> +	 */
> +	if (drvdata->sysfs_buf) {
> +		new_node =3D kzalloc_obj(*new_node, GFP_KERNEL);
> +		if (!new_node)
> +			return -ENOMEM;
> +
> +		new_node->sysfs_buf =3D drvdata->sysfs_buf;

[Severity: High]
Does this lockless read of drvdata->sysfs_buf introduce a race condition?

If a concurrent hardware disable/enable path (like tmc_etr_get_sysfs_buffer=
())
clears and frees drvdata->sysfs_buf immediately after this lockless check,
wouldn't new_node->sysfs_buf be left as a dangling pointer, leading to a
use-after-free or double free?

> +		new_node->is_free =3D false;
> +		list_add(&new_node->link, &drvdata->etr_buf_list);
> +		i++;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-enable-byt=
e-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com?part=3D2
