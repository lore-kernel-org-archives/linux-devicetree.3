Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107B2749C1
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870496; cv=none; b=KrxJ2gcqPP83QieSUxlMKhXSa0ZGofc1oR0zf+Yq6/drL63uNHJOYXliEJcnB1FEeIw+K2TKLLdr/sASmqXSm08Yz0ekBIYjwKJzJmceXjIjdhLhc09VU5fA0klUNuwnIO6Y+/UnbbZ2THRYO8tZ29H37XL8PQisO7nSLi7Dl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870496; c=relaxed/simple;
	bh=xm36sgpSu2bXj9dtVTt2F31mcs9c7B71mqkTGkSs8Xo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d7T1J9hFFcxrOYJ0AQWTY5LMFMvMy6EP+8t9VNhMN8ZJeYoXzHfrOIXd9AkUyvtTPsC976VKDhnuChM8nQyuIJw98c0CDIIGYACncDiWJlW6mT+Jc7RFjotHOEWqeHRLgGspPcZyMqJQnMx/4/pPImV6uyLKHWSsyVeucaXawO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngiVEaJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngiVEaJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2381F000FF;
	Tue, 13 Oct 2026 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870494;
	bh=fRVUcHD3u2hihhm5+bkEpRJL5lMMq7luy7d/Y++AEek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngiVEaJpC7t7hrTJU8caDlS3T1ndblUbjo5GtV0CTlgXuNOMKPkMpCe5Ypu3j6INr
	 CqTHGhHHADgcftw+83aoOGowlOi3ABhL6ft+YOGZSe5igK6naw6Jh4pE8PfxW70CmG
	 RKSA7H7Xb46cUl3LtL2+pbU27B2p11Lci2YNcZstsRZs26kaG+qqMiFGpHpZHGvIcZ
	 GUT4X7838mIBfccRWYDadE8ITcnx0YrHML5SNo9JyJB4GTUWU3K5KqkZPiZLnuAfM4
	 03EUcTmZtFKUz6HbttYKfRX9v204I2THjeXZnuq/rBImbNIU8D4Lutuy8Ot9ahXTEe
	 NRUQrOU4VtJIQ==
Message-ID: <sashiko-outbox-169011@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 9/9] tee: optee: support RPMI asynchronous
 notification doorbells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-9-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-9-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:48:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] tee: optee: race between async notif callback and teardown causes =
UAF/NULL deref
--

commit fbdb2da759a2fc5e6692fd4d211f0b6f63644339
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: support RPMI asynchronous notification doorbells

This commit introduces support for RPMI asynchronous notification doorbells
in OP-TEE. It allocates a TEE-to-REE RPMI signal, passes it to OP-TEE, and
queues bottom-half processing on a private workqueue. It also adds teardown
logic to stop asynchronous notifications and drain the workqueue upon
cleanup.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 0ed2de96758e2..6434767a22497 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c

[ ... ]

> +static void optee_rpmi_notif_callback(struct rpmi_tee_device *rdev, u32 =
signal,
> +				      void *cb_data)
> +{
> +	struct optee *optee =3D cb_data;
> +
> +	queue_work(optee->rpmi.notif_wq, &optee->rpmi.notif_work);
> +}
> +
> +/* Relinquish is not a barrier for an already-selected transport callbac=
k. */
> +static void optee_rpmi_async_notif_uninit(struct optee *optee)
> +{
> +	struct optee_rpmi *rpmi =3D &optee->rpmi;
> +	struct rpmi_tee_device *rdev =3D rpmi->rdev;
> +	int rc;
> +
> +	if (!rpmi->notif_wq)
> +		return;
> +
> +	rc =3D optee_stop_async_notif(optee->ctx);
> +	if (rc)
> +		dev_warn(&rdev->dev, "stop notifications failed: %d\n", rc);
> +
> +	rc =3D rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
> +	if (rc && rc !=3D -EOPNOTSUPP)
> +		dev_warn(&rdev->dev,
> +			 "relinquish notification failed: %d\n", rc);
> +
> +	destroy_workqueue(rpmi->notif_wq);
> +
> +	rpmi->notif_wq =3D NULL;
> +}

[Severity: High]
Can an in-flight RPMI notification invoke optee_rpmi_notif_callback()
concurrently with or after this teardown process?

As the comment mentions, notify_relinquish() is not a barrier for an
already-selected transport callback. If the callback runs concurrently,
queue_work() accesses the workqueue without locking. This can cause a
use-after-free if destroy_workqueue() is executing, or a NULL pointer
dereference if rpmi->notif_wq has already been set to NULL.

Furthermore, if the callback execution is delayed until after
optee_rpmi_remove() completes, the optee structure itself is freed
via kfree(optee), which would lead to a use-after-free when the callback
dereferences optee->rpmi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D9
