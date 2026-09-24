Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658814825BB
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252060; cv=none; b=X9jmSFrFrbVMHJqM4bcyaVL6JtCoL6VYxizL1e1eK+4xSYdWhndSc2ddhZHNsFPrC/1Mr+L1cXnL/J4E4bWc9Gvq8tvAd9468P73VNc1JQpGjYNvTBz0YanQ+UFYVtC5Hz6sJp07xsk1gv+3plghEOpu9rehXZyK79bY4buPzmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252060; c=relaxed/simple;
	bh=m/9HumjpNztVyn635gjXtycGC0yCTG5bum72hdq7W4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lUgklwaILGTSBgKvBfUmuvYjIeZQzkzb7zYujlcPzBiNxdA2gIulkQ6UoHH4ywjzJmQvKzREYMCdS1q2n2g7/9q6HF73DApbBQOKBpO4Q5h/5E6Qc0waO2djVXwkBfhvuxLVBYNYCSOAsP0jWXG0HQvpngI64iFM1rrx8q5NmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnrVXeAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnrVXeAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F6A1F000FF;
	Thu, 24 Sep 2026 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252059;
	bh=aNbCIx8oNQVN+ZThzLJmZ79DUS6p0U8bsFjTLHBUJdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DnrVXeACOlBE5xA8QhK9Nm9SA2tM7qFgisexIl/ObZqq8BNbg/qecN/RDOMSDQDEH
	 9CscDgrsssgkb5Al8OWmTUBLvpBpfhhyNXM6Dj0zF6cmZa8vlX5J2FPgY3bduqJRtQ
	 APqI3D29OQyqB9KsHfl2TBqi+oVbNHdBj2XfI2/0FtjfddhLTxXRq6bDxkD/wqj8v9
	 XIEvjpJMCyMwuPUNdoVl8bfroVUI8qjuArBH0muKmJRV3PMO/kUqJ7YOwN0n18/SO2
	 hPtl3leYMz5jWY05sFgcToyU+oRBGtrLxwBYZvWZYCOfr/FNHfZOoUR8TGGGrVU9lQ
	 pQcLh7IcyOMQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] media: v4l2-device: wait for notifications when
 unregistering a subdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-hdmirx-media-v2-7-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
 <20260924-hdmirx-media-v2-7-c12f641d8b0f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:14:18 +0000
Message-Id: <20260924121418.A2F6A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] v4l2: NULL pointer deref or UAF in v4l2_subdev_notify()
--

commit 6588945fb74790836c51288e07f21eed874e7fe8
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: v4l2-device: wait for notifications when unregistering a subdev

This commit introduces SRCU protection for v4l2_subdev_notify() to prevent
race conditions with subdevice unregistration. It adds a boolean flag and an
SRCU read-side critical section to ensure the callback doesn't run after the
bridge driver unbinds.

> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-c=
ore/v4l2-device.c
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
[ ... ]
> +/*
> + * Stop notifications to sd->v4l2_dev and wait for those in progress.
> + * Callbacks read sd->v4l2_dev, so it must stay set until this returns.
> + */
> +static void v4l2_subdev_disable_notify(struct v4l2_subdev *sd)
> +{
> +	WRITE_ONCE(sd->notify_enabled, false);
> +	if (sd->v4l2_dev->notify)
> +		synchronize_srcu(&v4l2_subdev_notify_srcu);
> +}
> +

[Severity: High]
If the bridge driver does not provide a notify callback, this skips the SRCU
grace period. Could this break synchronization for a concurrent
v4l2_subdev_notify() reader that just observed notify_enabled as true?

[ ... ]
> +void v4l2_subdev_notify(struct v4l2_subdev *sd, unsigned int notificatio=
n,
> +			void *arg)
> +{
> +	struct v4l2_device *v4l2_dev;
> +	int idx;
> +
> +	if (!sd)
> +		return;
> +
> +	idx =3D srcu_read_lock(&v4l2_subdev_notify_srcu);
> +	/* Pairs with smp_store_release() in __v4l2_device_register_subdev() */
> +	if (smp_load_acquire(&sd->notify_enabled)) {
> +		v4l2_dev =3D sd->v4l2_dev;
> +		if (v4l2_dev->notify)

[Severity: High]
Since the reader unconditionally dereferences v4l2_dev here regardless of
whether the callback is provided, could this lead to a NULL pointer=20
dereference or use-after-free?

If a concurrent call to v4l2_subdev_disable_notify() skips the
synchronize_srcu() call because notify is NULL, the unregistering thread
will proceed to clear sd->v4l2_dev and potentially free the v4l2_device.=20

If this reader is preempted right after checking notify_enabled, wouldn't
it wake up and dereference a NULL or dangling v4l2_dev pointer?

> +			v4l2_dev->notify(sd, notification, arg);
> +	}
> +	srcu_read_unlock(&v4l2_subdev_notify_srcu, idx);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_notify);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-hdmirx-med=
ia-v2-0-c12f641d8b0f@pengutronix.de?part=3D7
