Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080355;
	b=x8s6x65qpg+q3CFhEtJ+L6eC6GPAlDEKikt5Jkl1PI/IOU1+DF0r6bI9OONYxekwH0v6
	 f02J8+kAar0u8Pmb0LfeGD3L50A1A0hnzsX3R7PRrDw4gx/wjW3EgoH9RDuXDwrgrQp6F
	 ieMU+/RAKzPTRiNUbj5rvG30pOHE5kLX//0dW7Y5STfFwS29aRb5hG+7ZujL28r7TU9H2
	 5du+VMHHha0/g3GEoYfuwjFUEIxRvV7dVrKxfjl2D2Sj3pgcA0A0DSis4LBd9TcRDE9Rj
	 0AvGtQpVqo6VU9Gv5MXIPG4yKCb3c0JzDj1zc6xtLfWQm+uuqc0KY4uYBDD/wrgFknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080355;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7vX48x9+igzvKsPsxub541XWjibZRraLR64jpxC6QME=;
	b=TMEBeGauxPt6UywfKJr6FehPllimzn4/T5luNBzB9esScuKH7n0vIK/8oKD4JhX24+Kk
	 FzKmuVDxt9DqL9ilP5KPogcbDpg86SP6CV7NgRJu/Iz9hjlsoNcz2dolcKAu023qYBuZN
	 uojbiWyMZGQOCmqf7CbBD5hMyMdt9kJlCgpORwPMZ+n7MEtaxmBe87VLzxRXVpD6AlCsI
	 i8ndLKVdIou2cumL2wi+Hjm+yG8jKf3cIHeYUFRKJEcdLcxIMapDQEl0QbecO6LmCP+ya
	 SFeRAClAwXwp90jzGnXmsUQNpfaAfWLk+gAJ/RMDLleUwNlxTLrW80+PTWFHFg2jXAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtWJIjtZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32761606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtWJIjtZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAB81F000C4;
	Thu, 19 Nov 2026 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080354;
	bh=7vX48x9+igzvKsPsxub541XWjibZRraLR64jpxC6QME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AtWJIjtZ+8NSUd6DAyLrU7SGKaXYiEmLCGniGqeS3WFv4jozENSrcHO2XhKeIXjxc
	 fUlL10+ULfPDSVCGRlT9fhsFA58LIFNatJDSJyY4sk5y+ouWyNE8jSwK3OUR0pkaS1
	 78WV3aV497Ngqg5H3rBqAWXTtSor3kD4IbbL+IIq8LxHUQcvDZDe5KtQcZTDA1HeiH
	 i2mmV6xQO3ofcIrb+RHSchYLvtFrToFvFbEN5Fahjd9PWwvBWSr8UXt1drxm6qIVtn
	 ytwUuT94wlizmMyxByWhvglJMISs+MGzHu/gXIEGmtABv61agp5qsHCfYcJ6ImTozc
	 O2eeMzTGeCr7A==
Message-ID: <sashiko-outbox-222829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 6/6] coresight: tmc: add QDCP ETR sysfs support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-6-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-6-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:25:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] coresight: tmc: refcnt leak and stray DMA resume in
  tmc_disable_etr_sink_qdcp()
- [High] coresight: tmc: bogus sync and OOB offset in
  tmc_etr_qdcp_disable_hw()
- [Medium] coresight: tmc: leak of sysfs_buf in tmc_qdcp_etr_shutdown()
  on removal
- [Medium] coresight: tmc: stale buffer metadata left by
  tmc_etr_qdcp_enable_hw()
--

commit 4c2126e70bf6a901c5097e6430bf243717b9f97e
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add QDCP ETR sysfs support

This commit adds sysfs sink support for CoreSight TMC-ETR instances whose
control registers are managed by the Qualcomm Embedded Co-Processor
(QECP) over the Qualcomm Debug Control Protocol (QDCP).

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr-qdcp.c b/drive=
rs/hwtracing/coresight/coresight-tmc-etr-qdcp.c
> new file mode 100644
> index 0000000000000..db94bce76f15c
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr-qdcp.c
[ ... ]
> +static int tmc_etr_qdcp_enable_hw(struct tmc_drvdata *drvdata,
> +				  struct etr_buf *etr_buf)
> +{
> +	struct qdcp_tmc_cfg cfg =3D { 0 };
> +	int ret;
> +
> +	if (WARN_ON(!etr_buf))
> +		return -EINVAL;
> +
> +	if (etr_buf->mode =3D=3D ETR_MODE_ETR_SG &&
> +	    WARN_ON(!tmc_etr_has_cap(drvdata, TMC_ETR_SG)))
> +		return -EINVAL;
> +
> +	if (WARN_ON(drvdata->etr_buf))
> +		return -EBUSY;
> +
> +	cfg.tmc_id =3D drvdata->qdcp.id;
> +	tmc_etr_qdcp_get_buffer_addr(drvdata, etr_buf, &cfg.paddr, &cfg.iaddr);
> +	cfg.size =3D etr_buf->size;
> +	cfg.sg_mode =3D etr_buf->mode =3D=3D ETR_MODE_ETR_SG;
> +	cfg.ffcr =3D tmc_etr_default_ffcr(drvdata);
> +
> +	drvdata->etr_buf =3D etr_buf;
> +	ret =3D qdcp_tmc_etr_enable(drvdata->qdcp.provider, &cfg);
> +	/*
> +	 * A failed or timed-out request may still have been executed, so
> +	 * firmware may be writing into the buffer. Only release it once a
> +	 * stop is confirmed, else keep it pinned for a later retry.
> +	 */
> +	if (ret && !qdcp_tmc_etr_disable(drvdata->qdcp.provider, drvdata->qdcp.=
id))
> +		drvdata->etr_buf =3D NULL;
> +	return ret;
> +}

[Severity: Medium]
If qdcp_tmc_etr_enable() fails on a reused drvdata->sysfs_buf (for
instance when tmc_qdcp_etr_read_unprepare() resumes an active session)
and the recovery qdcp_tmc_etr_disable() succeeds, does clearing
drvdata->etr_buf leave stale etr_buf->len and etr_buf->full values from
the previous capture?

With drvdata->etr_buf set to NULL, a subsequent tmc_etr_qdcp_disable_hw()
returns 0 immediately without syncing or invalidating the buffer, so the
next read exposes the old len and offset over a failed or partially
overwritten buffer.

> +
> +/*
> + * drvdata->etr_buf is the buffer firmware may be writing into. It is on=
ly
> + * cleared once firmware has confirmed the stop, so a non-NULL etr_buf w=
ith the
> + * sink disabled means a stop is still pending and the buffer must not b=
e freed
> + * or replaced.
> + */
> +static int tmc_etr_qdcp_disable_hw(struct tmc_drvdata *drvdata)
> +{
> +	int ret;
> +
> +	if (!drvdata->etr_buf)
> +		return 0;
> +
> +	ret =3D qdcp_tmc_etr_disable(drvdata->qdcp.provider, drvdata->qdcp.id);
> +	if (ret) {
> +		dev_err(&drvdata->csdev->dev,
> +			"failed to stop QDCP ETR: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tmc_etr_sync_sysfs_buf(drvdata);
> +	drvdata->etr_buf =3D NULL;
> +	return 0;
> +}

[Severity: High]
Can tmc_etr_sync_sysfs_buf() compute an out-of-bounds etr_buf->offset
when tmc_etr_qdcp_disable_hw() retries a stop after a failed enable?

If qdcp_tmc_etr_enable() failed before assigning the buffer to firmware
and the immediate recovery disable also failed, drvdata->etr_buf stays
set while csdev remains in CS_MODE_DISABLED.  When a later
tmc_etr_qdcp_disable_hw() succeeds, it still calls
tmc_etr_sync_sysfs_buf() (unlike __tmc_etr_disable_hw(), which only syncs
when mode =3D=3D CS_MODE_SYSFS), reading RRP and RWP values from firmware
that are 0 or from an earlier buffer.

Neither tmc_etr_qdcp_get_state() nor tmc_etr_sync_flat_buf() checks that
rrp and rwp lie within [etr_buf->hwaddr, etr_buf->hwaddr + etr_buf->size):

drivers/hwtracing/coresight/coresight-tmc-etr.c:tmc_etr_sync_flat_buf() {
	etr_buf->offset =3D rrp - etr_buf->hwaddr;
	if (etr_buf->full)
		etr_buf->len =3D etr_buf->size;
	else
		etr_buf->len =3D rwp - rrp;
...
}

An out-of-bounds offset underflows etr_buf->size - offset in
tmc_etr_buf_get_data(), causing tmc_etr_buf_insert_barrier_packet() or
tmc_read() to write or read past flat_buf->vaddr.

[ ... ]

> +static int tmc_disable_etr_sink_qdcp(struct coresight_device *csdev)
> +{
> +	struct tmc_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent);
> +	int ret;
> +
> +	mutex_lock(&drvdata->qdcp.lock);
> +	if (drvdata->reading) {
> +		mutex_unlock(&drvdata->qdcp.lock);
> +		return -EBUSY;
> +	}
> +
> +	csdev->refcnt--;
> +	if (csdev->refcnt) {
> +		mutex_unlock(&drvdata->qdcp.lock);
> +		return -EBUSY;
> +	}
> +
> +	/*
> +	 * The core drops the path whatever is returned here, so nobody is left
> +	 * to retry. If the stop is not confirmed the buffer stays pinned and
> +	 * the next enable, read or removal retries it.
> +	 */
> +	ret =3D tmc_etr_qdcp_disable_hw(drvdata);
> +	drvdata->pid =3D -1;
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> +	mutex_unlock(&drvdata->qdcp.lock);
> +
> +	if (!ret)
> +		dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
> +	return ret;
> +}

[Severity: High]
What happens if a sysfs trace source is disabled while /dev/tmc_etrX is
open for reading (drvdata->reading is true)?

coresight_disable_sink() ignores the return value of sink_ops->disable()
and coresight_disable_sysfs() proceeds to tear down the path.  Returning
-EBUSY early here leaves csdev->refcnt elevated and csdev->mode set to
CS_MODE_SYSFS, so when the reader closes /dev/tmc_etrX,
tmc_qdcp_etr_read_unprepare() sees CS_MODE_SYSFS and calls
tmc_etr_qdcp_enable_hw() to restart firmware DMA with no active trace
path instead of freeing drvdata->sysfs_buf.

> +
> +void tmc_qdcp_etr_shutdown(struct tmc_drvdata *drvdata)
> +{
> +	mutex_lock(&drvdata->qdcp.lock);
> +	if (tmc_etr_qdcp_disable_hw(drvdata))
> +		dev_warn(&drvdata->csdev->dev,
> +			 "QDCP ETR did not stop, leaving trace buffer allocated\n");
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +	mutex_unlock(&drvdata->qdcp.lock);
> +}

[Severity: Medium]
Does tmc_qdcp_etr_shutdown() leak drvdata->sysfs_buf when
tmc_etr_qdcp_disable_hw() succeeds?

tmc_etr_qdcp_disable_hw() only syncs the buffer and clears
drvdata->etr_buf.  Because __tmc_remove() has already deregistered
drvdata->miscdev, nothing else will free drvdata->sysfs_buf after
tmc_qdcp_etr_shutdown() returns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-introduce-=
qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com?part=3D6
