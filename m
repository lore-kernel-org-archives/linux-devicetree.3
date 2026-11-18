Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990042;
	b=tyYDz8Mm+F95KgHBHEEMJapuMBp3FDs/AC/TDBHMB5Et8W1wsjPkrdSy744LFXSGg2Bs
	 mYWUHmfY5H1Yvl8x8arZHe49GlnXKT5DMPtnSob/bQGBAUaccLv64vcj+2C48fIlMom6o
	 jUQKjHFyEu4J4i7gG9U+T0qmYf9qW1nFeoObW6PsmHee9Bz1PAgFX3FDxlfLRZw4Y3j0n
	 WxdXkHfvrILpT9HNj9Cyaxc4G2pIyg9glejVnx9aqFJyyVh0gNrxuDM4aySHjqu259VWD
	 TUGVlxc9NCNNCsiKE+isgistL4QUep5qJUdpsewiOEK4e26VhE1V6Sm/ojQehvyEKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990042;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8MyJeE7jEQBoCmRfqffK2sFweiGpDiddk2TOmES2R9Q=;
	b=hdpCluqs1ZMlQszm2efm0AYFutCaMN1O5yxzjkJAVWbwp6HGznAVqSBUKKtDV6tsDJ7M
	 IIWIECowGzxJvqn57pVxFR686c+pITn+7RmirI4sE909wJCcYZY2XMKRyaNC+ObkZ4ZO1
	 rWTqqHulTapAI/5D/jobUDV21p59QsMf7IdQba7SCWTPd9Yn0L8h6kJ9FYss3FC59Z7ae
	 a/xEFnpuCNGqSw9ywlGKUidqi1rx/ddENR8RiTlEJk9JzaEG3Rhjacd+sKfQ69yjpFnmn
	 h9O1CEn7Lw39gz/ubPjM6Owfhd6FjsugHRKnz090RqUfcwNFlwswREWYhYuIFqEEenA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ls1+Duge;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA79606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ls1+Duge
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC521F000C4;
	Wed, 18 Nov 2026 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990042;
	bh=8MyJeE7jEQBoCmRfqffK2sFweiGpDiddk2TOmES2R9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ls1+DugegXmymlgKE9a5C8F4B6duaYyu7vJSA/Qmv6DBuq7yalyMS21vdhKh3N9ha
	 sz6FKRg4/CxoMeVve7dGPnh5sHjeORy0MmMcTJ/qgXkXPeZV2bE29jEN7uB9Q5/FM2
	 9aqvnd4LYjvI1bNraoSndKrgeoq3NjQmeTK/XoEAbZMm5D75f6LwAmOkkbqfi80elO
	 rVX4aDYjSVi7xk7aptbOG59ODSTQrR78/CdA2EEH94zz2gv3OWaYX4EleQL7rhnWQ6
	 3nt3ocPg+BchR1LpwytCZbZ5SRKxkN2ob2MrS0DXc/giacoR2IqNOaeDKzBjyZHrAH
	 e4CitThhaE0ew==
Message-ID: <sashiko-outbox-220427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 3/8] coresight: tmc: add a function to switch the
 ETR to a free etr_buf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:20:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] coresight: tmc: unhandled enable failure in
  tmc_etr_switch_buf_node()
- [Low] coresight: tmc: redundant register writes in
  tmc_etr_reset_sysfs_buf()
--

commit 4182b8271c7f6d8ac88e30050f83e36bc405e320
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add a function to switch the ETR to a free etr_buf

This commit adds tmc_etr_switch_buf_node() to stop the ETR, switch
drvdata->sysfs_buf and drvdata->etr_buf to a free buffer node from
etr_buf_list, and restart the ETR under drvdata->spinlock.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index e9213f4568341..5032f5598e15b 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdat=
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

[Severity: Low]
Is tmc_etr_reset_sysfs_buf() needed when __tmc_etr_enable_hw() is called
immediately afterwards?

__tmc_etr_enable_hw() already resets TMC_RRP, TMC_RWP, and TMC_STS_FULL
after waiting for tmc_wait_for_tmcready() and updating TMC_DBA when the
device has TMC_ETR_SAVE_RESTORE:

drivers/hwtracing/coresight/coresight-tmc-etr.c:__tmc_etr_enable_hw() {
    ...
	if (tmc_etr_has_cap(drvdata, TMC_ETR_SAVE_RESTORE)) {
		tmc_write_rrp(drvdata, etr_buf->hwaddr);
		tmc_write_rwp(drvdata, etr_buf->hwaddr);
		sts =3D readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
		writel_relaxed(sts, drvdata->base + TMC_STS);
	}
    ...
}

Calling tmc_etr_reset_sysfs_buf() before __tmc_etr_enable_hw() duplicates
those writes without checking TMC_ETR_SAVE_RESTORE or waiting for
TMCReady.

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
> +		else if (!picked_node && nd->is_free && !nd->reading)
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

[Severity: Medium]
What happens if __tmc_etr_enable_hw() fails when tmc_wait_for_tmcready()
times out?

__tmc_etr_enable_hw() returns early before programming TMC_DBA or
re-enabling the ETR, but drvdata->sysfs_buf and drvdata->etr_buf are left
pointing to picked_node->sysfs_buf while the sink mode stays
CS_MODE_SYSFS.  A later tmc_disable_etr_sink() or
tmc_etr_switch_buf_node() call will run __tmc_etr_disable_hw() ->
tmc_etr_sync_sysfs_buf() and sync picked_node->sysfs_buf against stale
hardware registers from the previous session.  In flat buffer mode,
tmc_etr_sync_flat_buf() computes etr_buf->offset =3D rrp - etr_buf->hwaddr
using the old RRP, which can exceed etr_buf->size and underflow
etr_buf->size - offset in tmc_etr_buf_get_data(), leading to an
out-of-bounds memory access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-enable-byt=
e-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com?part=3D3
