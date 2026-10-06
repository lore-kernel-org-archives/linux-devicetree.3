Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4E547053
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247669; cv=none; b=fKIC4IWq/QvYLS+o43o/Zw3IoOuxfZtTXwAHIb3FCeoEN1mNS/tEIPv+9vxkAKhJwfBVaSEItKbfHbauGga5t9h5Qa/AG1T8hDF5Gfi6n+hzkcqTWob5CZu7q7jbIM4i+J2gDFeEOPo17C+wGBn8OIascjQdF74ZLuOfNTiIHds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247669; c=relaxed/simple;
	bh=ahGWK2kCsei6LBi6lvxk3iBVPvz82nLGGdYX0PYWz0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n3LE8uW58AQiRtttAi3uTrqk+Sf55pa+PEvpi8ar0whJ9QuvXiSwsXxvbejFRUi4k+8to/X40QEaBXRV/YionDQfR+EJfa/H9fqd2wKggthWGPH0/uTyjaemWoLqhd7WyO31o2eV81dMByDWzDotj+VHFZtazB/8TzhwNAzBSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc9wHzbj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc9wHzbj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBD71F000FF;
	Tue,  6 Oct 2026 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791247668;
	bh=oVww+kWjslVyZEZuYZQdIhNMpBH3zkXDbe9i12zOPuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tc9wHzbjNrWaQX6BlN9G48KCfB5eJQWJXSmimze2U+S0izyYDWMBbPKSdIcphpsPx
	 gpOqUTIaKFaujUlMw1VuS/oGTNjIRcJzKDeU+6IGCUs0VQC9M3zVoErof0AF/2U8Al
	 SFDBHpw7MwV2Z/KdQUFL5tyjaABTiijuM4F6nTqiBvRXVgEmKr+4ERyb/GdCgARIyN
	 U08hedxFQSh0tyg/6/dxA5ZdyDTo12AX1CQ3pNxpE78/fFBgQ9LCae6V/CVKKzEkhn
	 cP+51NIL9O8fCn1fpaO+GtAvVSulkvn0WUaULRmkI14ZQGr5BXy6JJ/HjTUzM/5GJ8
	 qloPeUPNdhMPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 8/8] tee: optee: support RPMI asynchronous
 notification doorbells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-8-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-8-72f222e23ec1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 00:47:47 +0000
Message-Id: <20261006004747.BDBD71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] tee: optee: UAF in optee_rpmi_notif_callback() due to unsynchroniz=
ed teardown
--

commit 78a8a655d3ae3b299cafbd7aaef4c7ef599402d8
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

    tee: optee: support RPMI asynchronous notification doorbells
   =20
This commit adds support for RPMI asynchronous notifications in OP-TEE. It
allocates an RPMI signal, sets up a callback to queue a bottom-half on a
private workqueue, and provides initialization and teardown routines.

> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index db541f3de4250..ffe44d81e8571 100644
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

[Severity: High]
Can this callback execute after the optee structure has been freed and the
workqueue destroyed?

If an RPMI notification is dispatched just prior to notify_relinquish(), it
appears this callback could run concurrently with or after the teardown
sequence in optee_rpmi_async_notif_uninit(). This would lead to a
use-after-free on the optee structure and a potential NULL pointer
dereference or crash when passing the destroyed workqueue to queue_work().

> +}
> +
> +/* Relinquish is not a barrier for an already-selected transport callbac=
k. */
> +static void optee_rpmi_async_notif_uninit(struct optee *optee)
> +{
> +	struct optee_rpmi *rpmi =3D &optee->rpmi;
> +	struct rpmi_tee_device *rdev =3D rpmi->rdev;
> +	int ret;
> +
> +	if (!rpmi->notif_wq)
> +		return;
> +
> +	ret =3D optee_stop_async_notif(optee->ctx);
> +	if (ret)
> +		dev_warn(&rdev->dev, "stop notifications failed: %d\n", ret);
> +
> +	ret =3D rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_warn(&rdev->dev,
> +			 "relinquish notification failed: %d\n", ret);
> +
> +	destroy_workqueue(rpmi->notif_wq);
> +
> +	rpmi->notif_wq =3D NULL;

[Severity: High]
Does this teardown sequence need to synchronize with in-flight callbacks
before destroying the workqueue and returning?

Because notify_relinquish() does not wait for already-selected callbacks to
finish, destroying the workqueue here and subsequently freeing the optee
structure in optee_rpmi_remove() could race with an executing callback.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-rpmi-tee-s=
ervice-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com?part=3D8
