Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614125;
	b=0HC5bp6PDHWbZtGONxxb6ATF4/F6LCAm29mMlFl14xq4qbQ8EfQ+G+EdWgLDvYbZkNzL
	 myk3rp+SLYosNL9OTWD/YeQmQDgkJrr73yJGEu/r4PE6Ff4csAFj6oiECvcRVp3Ad/VzY
	 gfXezO4WVt1xN3n2QLCv/pHLWiUWqYZIyTlFp0PBycTIM+OMFPikyToTSAQ8XNMztI6bQ
	 afD5APX1IA8eclKr57RE4yVGU0I7ZeDyZdElvGRsdRyldehAtbgq64S2fztjbx4LlbnEu
	 nK/NlZbbOSp2EUA75m5bwXu8ZTvxJyVPkJdSZm/TnDfVtSbo5OZsMHshxCnKIKxH17g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614125;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qPSggzvKhbSO23e4JRepRUEf4S95L4Lv+VwrA9TC1oI=;
	b=bTHSTAByG656PgyAf0vXUNJ7RpqG6lvz+9Yk0uH+cmZlL48EBgDIn1PYNMoZAtJLNDpg
	 UxxQ0Pap1HLwiMNqqjfLFmUfWdPzmygvKWv5Oe5Fvl5gMJeademvWnAn203Gi1dC9hfuC
	 J2XyTeoO96z+hcFz3R5baVm3B8AvjyUXyxTSSOmLCXJe7x/ufdFhM3Z+2TZUkSe9AWl9p
	 pKvJId154HIivXQHd8Jbyomxx4javBEqa7UvttQRJY9rag4l1CWw72nhXlE7DtKGYI97l
	 f3CNDciHJFKqfyWCBwo81q2wi89w6PwdUwhsbE2px6x0yf8UwuKvJQNGp+4ebEWtlRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UjhO2nR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B1606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UjhO2nR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563DE1F000C1;
	Mon,  2 Nov 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614124;
	bh=qPSggzvKhbSO23e4JRepRUEf4S95L4Lv+VwrA9TC1oI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UjhO2nR5inWO4pHfxrRsQ3zL4KGIf+d7u9OCKxY/vuyjPUO6AlDERi39ntvMqTgzJ
	 Yd9mCcPuRTPMro7h/oEQYtQVPKFIa5cUF4ACcjAFYsn8m29ACo/FKDyXivTYiNPbHh
	 xRBrStqqarnWE74R9LA3LblAu++Yb6UwxURnTb0p2jy5ILvSRikpwvp4A8EZ9fp5k0
	 jMNWFJuxk2Tptz/fkrl+dpheMeyypUsNI5JcqxLz2MiWx6jtlV0Ux7XMHwlpFyjNbY
	 TeUSdtEvKaCh2pVypKGdID+6XkL4lMH+KIfsVz9Uah6hX6upaHG5lnrHa86nc48xa4
	 Q9lfYBKRKaKEw==
Message-ID: <sashiko-outbox-193237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 3/8] coresight: tmc: add a function to switch the
 ETR to a free etr_buf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-3-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
 <20261102-enable-byte-cntr-for-ctcu-v21-3-231e069b7853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:08:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] coresight: tmc: active read buffer reuse in tmc_etr_switch_buf_nod=
e()
--

commit edde9bcbd54db59cd64f7044e1302e2f89c8fc07
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: add a function to switch the ETR to a free etr_buf

This commit adds tmc_etr_switch_buf_node() to stop the ETR, switch to a
free etr_buf from etr_buf_list, and restart the ETR under drvdata->spinlock
while returning the switched-out buffer node for reading.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index eee98a9269df4..2de31d73a4b47 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdat=
a *drvdata)

[ ... ]

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

[Severity: High]
Can tmc_etr_switch_buf_node() re-select a buffer node while it is still
being read by userspace?

When curr_node is switched out for reading, curr_node->is_free is
immediately set to true alongside curr_node->reading =3D true, while the
selection loop above only checks nd->is_free and does not check
!nd->reading:

	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
		if (nd->sysfs_buf =3D=3D drvdata->sysfs_buf)
			curr_node =3D nd;
		else if (!picked_node && nd->is_free)
			picked_node =3D nd;
	}

In tmc_create_etr_buf_list(), all nodes other than the active
drvdata->sysfs_buf start with is_free =3D true, and in the caller added lat=
er
in the series (tmc_byte_cntr_get_data() in coresight-ctcu-byte-cntr.c),
finishing a buffer read only clears byte_cntr_data->buf_node->reading =3D
false without updating is_free.

Because every node other than the active drvdata->sysfs_buf always has
is_free =3D=3D true even while reading =3D=3D true, the documented NULL ret=
urn when
there is no free buffer cannot be reached. If tmc_etr_switch_buf_node() is
called again before the previous buffer has been fully read (for instance,
via concurrent read() calls on the same open descriptor since tmc_open()
uses nonseekable_open(), or when num_nodes > 2 and an earlier node in
etr_buf_list is still being read while a later node is idle), won't it pick
a node with reading =3D=3D true and restart ETR DMA into that buffer while =
it
is being read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-enable-byt=
e-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com?part=3D3
