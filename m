Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282636;
	b=s0sYivmWVB98YZslm4npJfo3XxfW7OjJjvQECqZji9xYjqT+B68q6cSOPtQofDltNJ1E
	 +GJENq+V4OLSVMfyStWG9pnm5xAcJ42CGijStNcj/MHsvjnizBLuMBHAdrA1Xh1ShB8Cl
	 RBUXfcUr8fQc1V2ZtxPfjrIRGsorMnCSKe8mfmFM927cZ6dZEfmiH+qoLutwhLiUlzbzD
	 xZuUdWVttKW05cJIMvh7oUeRFcWG0nXeaSnbjIvZTgBfBcGc9CSMmVsgG6kpK1oH+XveE
	 j/rvy36BVBMdhSaGbWls20xDL8BArE702q0HNfRyPKeJA652X9MynO1oyE6NOCdgOzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MV0OvgMSx7hxRRX3CY+g3um09nSxeAkINXsIoO3rsLY=;
	b=xrk/vf7dBUHHdeg4R0PZjxGOdh1wSukswp13U9NUbuc1PoBThPgXMoH4pscQBYJ2dfqm
	 Bvaatyrzw9AI68eDss6Z2MQirLpkjVy2O8xLlT/qQQcyabj2DRrW46CpPJxqPmlVuFXq0
	 UXxtFxttcKrTyAlp4oKyLJTif9hbnHOPfHXvCMmg78azIUbfma+p83ZeVwZeqtQPhDEqt
	 hy2oiyQrEENuBD8S0oIZj6lj1hEQwgCtd/brSFSydu0zWKQQpJ1U0fBUp9tCWX/hAILrg
	 QlTr+cCEA6tzEFwPj167Fw3t7vFIPOEGuMvjag/WyqGyRnfEWnagRLXL8tXuOcE/6lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oYtd8aI/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3D60A263D
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYtd8aI/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A321F008A2;
	Tue, 10 Nov 2026 03:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794282635;
	bh=MV0OvgMSx7hxRRX3CY+g3um09nSxeAkINXsIoO3rsLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYtd8aI/q4/XVY550Qa3UfEiP+OwQvASGO4dvqX0cuVtLoL/ogj8MjGbSGDY+/vNs
	 scALzo3xPP67xE1lxFgqWTZ0ZrK39tlD14wfZEGK7RO5LaN8uqhW+hz11IiPG0Pp6I
	 WNyFVu1AnKEItoBlHB6vME5AeIgy/yfY3BDFu/AUMZgRF1IN91HCjvmWETchq62hJR
	 wUi5P7h3Z4qqzZ3dSmldSk+N3OB+M2SQomFPU2NHZwmwPNZZHON7cMta4Wa+cYOQW+
	 Cv/LRAyy/YhVyLQpT7mdhZJcyLC90CT5pQcXuzRMkMk0YCAxgcnYeeD3aGXUgPzVxo
	 xw3+BsBZ4gj3g==
Message-ID: <sashiko-outbox-206151@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 3/8] coresight: tmc: add a function to switch the
 ETR to a free etr_buf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-3-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
 <20261110-enable-byte-cntr-for-ctcu-v22-3-05d48c0eb110@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:50:34 +0000
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

commit 5c5376ae2653b11790a1e4a68e0d311b9dacd681
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add a function to switch the ETR to a free etr_buf

This commit adds tmc_etr_switch_buf_node() to switch an active ETR sink to
a free buffer from etr_buf_list while returning the previous buffer node
for reading.

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
Is tmc_etr_reset_sysfs_buf() needed when tmc_etr_switch_buf_node() calls
__tmc_etr_enable_hw() immediately afterwards?

__tmc_etr_enable_hw() already resets TMC_RRP, TMC_RWP and TMC_STS_FULL
after waiting for tmc_wait_for_tmcready() and programming TMC_DBA, and
guards those writes with tmc_etr_has_cap(drvdata, TMC_ETR_SAVE_RESTORE).
Calling tmc_etr_reset_sysfs_buf() beforehand duplicates those MMIO writes
and writes TMC_RRP, TMC_RWP and TMC_STS unconditionally before TMCReady is
checked, including on SoC-400 devices without TMC_ETR_SAVE_RESTORE and in
ETR_MODE_ETR_SG where hwaddr is the scatter-gather table base address.

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
If __tmc_etr_enable_hw() fails because tmc_wait_for_tmcready() times out,
does leaving drvdata->sysfs_buf and drvdata->etr_buf pointing to
picked_node->sysfs_buf desynchronize the driver state from the hardware?

Because the sink remains in CS_MODE_SYSFS while the hardware still holds
the previous buffer's registers, a later tmc_disable_etr_sink() or
tmc_etr_switch_buf_node() call will run __tmc_etr_disable_hw() ->
tmc_etr_sync_sysfs_buf() on picked_node->sysfs_buf against stale TMC_RRP
and TMC_RWP values.  In ETR_MODE_FLAT, tmc_etr_sync_flat_buf() computes
etr_buf->offset =3D rrp - etr_buf->hwaddr using the old RRP, which can exce=
ed
etr_buf->size, underflow etr_buf->size - offset in tmc_etr_buf_get_data(),
and cause an out-of-bounds memory access when inserting the barrier packet
or reading the buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-enable-byt=
e-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com?part=3D3
