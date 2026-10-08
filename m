Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D263B6C08
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431786; cv=none; b=IZccRsP69fjYviHVBO/nClo1xarAqqX+JyP1VBkddsp49VoM2/VhZHAF5z7mPVQ/ibcWAkc2STgq8xfn/rKmdh1KlZVInXRrO+aMBtKH6F214yJ+3Yxi3OASSXAV4XA/LuyDCdfzX7tRc3hImHnrqO0Hm7ue5EgxyBZqDNhblec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431786; c=relaxed/simple;
	bh=y2Q+YmjoJ6HSJJ4/e6xVC1cvRW5ZzjtwuhHkFgI9lKM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XaMEBcLs7FV93MF190YR1li68bHxjG5EkmkXuUf4WJffTVpPlGIhG7WYGQqy2TH0cQDsy7soJEc5KyO9FFrSu5HbGbpXWrK4C1RX1iXA3ts6lcQZwtKP2HiBAiUwMcfLG3sVhtBDlLcv4/1mrTEQSvniH13T3cbaj6IM3nCkU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcZl66HH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcZl66HH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020541F000FF;
	Thu,  8 Oct 2026 03:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791431785;
	bh=32dTXkUxoyraGhSdzYZkEylxhuL9b4BaCvbiogXetjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WcZl66HHtb4rD9nZhDBxVnJFYNxRn1rm16b2oaYJ1E/Jda3OLFIgKz05fsjo5suvI
	 qwZl99cps3Ex9YR9YU8KvOwWOXC1wm5+2rGAWuK/5G2BId2NjbYap+GmDC61wTFtE7
	 ZAoFzmNXtUkRT3QuoyF2areRzRurzVkKj0Ltome39uIPR8yCc0dwLOYFYvDplhonMz
	 rtOhpwAsARASc2Qny9CLED/ZLlPx2AirI4FdPV6ZotMfG1J45f7+wyedGm+i/aQcpg
	 tUqRak3V/JGoR9YosBnbnb6P5covLRnOE66QvgMAdC8Ebgng1WcnLnfRx2qbChUUAW
	 xpA7re5+8Ck0A==
Message-ID: <sashiko-outbox-163594@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 10/10] firmware: riscv: rpmi-tee: add signal bus
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-10-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
 <20261007-riscv-rpmi-tee-abi-v2-10-45939a13d223@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 03:56:24 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] rpmi_tee: use-after-free of client callback and data due to asynch=
ronous notify_relinquish
--

commit dfaa2e6e7e28252af1a3fba98317a99f0ae912d0
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

firmware: riscv: rpmi-tee: add signal bus support

Add signal buses for asynchronous notifications between Linux and TEE
endpoints. Allow service drivers to reserve, relinquish, and raise signals,
dispatching incoming notifications via client callbacks.

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/ri=
scv_rpmi_tee/driver.c
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c

[ ... ]

> +/* Invoke an active signal callback without holding the bus lock. */
> +static int rpmi_tee_dispatch_signal(struct rpmi_tee_signal_bus *bus,
> +				    u32 signal)
> +{
> +	struct rpmi_tee_signal_reservation *resv;
> +	rpmi_tee_notifier_cb cb =3D NULL;
> +	struct rpmi_tee_device *rdev =3D NULL;
> +	void *cb_data =3D NULL;
> +
> +	if (signal >=3D bus->tee_to_ree_count)
> +		return -EPROTO;
> +
> +	scoped_guard(mutex, &bus->lock) {
> +		resv =3D xa_load(&bus->reservations, signal);
> +		if (resv && resv->state =3D=3D RPMI_TEE_SIGNAL_ACTIVE) {
> +			cb =3D resv->cb;
> +			cb_data =3D resv->cb_data;
> +			rdev =3D resv->rdev;
> +		}
> +	}
> +
> +	if (cb)
> +		cb(rdev, signal, cb_data);

[Severity: High]
Is there a risk of a use-after-free or an execution of unmapped module memo=
ry
here if a client module unbinds concurrently?

> +
> +	return 0;
> +}

[ ... ]

> +/* Relinquish a previously reserved TEE-to-REE signal. */
> +static int rpmi_tee_op_notify_relinquish(struct rpmi_tee_device *rdev,
> +					 u32 signal)
> +{
> +	struct rpmi_tee_transport *priv =3D rpmi_tee_device_to_transport(rdev);
> +	struct rpmi_tee_signal_bus *bus;
> +
> +	guard(mutex)(&priv->notif.ops_lock);
> +	bus =3D rpmi_tee_find_signal_bus(priv, rdev->endpoint_id);
> +	if (!bus)
> +		return -EOPNOTSUPP;
> +
> +	if (signal >=3D bus->tee_to_ree_count)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &bus->lock) {
> +		struct rpmi_tee_signal_reservation *resv;
> +
> +		resv =3D xa_load(&bus->reservations, signal);
> +		if (!resv)
> +			return -ENOENT;
> +		/* Release only if @signal belongs to @rdev. */
> +		if (resv->rdev !=3D rdev)
> +			return -EPERM;
> +		if (resv->state =3D=3D RPMI_TEE_SIGNAL_RELEASING)
> +			return -EALREADY;
> +
> +		resv->state =3D RPMI_TEE_SIGNAL_RELEASING;
> +	}
> +
> +	queue_work(priv->notif.wq, &priv->notif.work);
> +
> +	return 0;
> +}

[Severity: High]
Because this returns immediately after queuing the release work, does this
leave clients without a way to wait for in-flight callbacks?

If a client driver calls rdev->ops->notifier_ops->notify_relinquish() during
its remove routine, frees its context, and finishes unloading, the worker
thread running rpmi_tee_dispatch_signal() may have already read the cb and
cb_data pointers.

Since there is no synchronous release API (such as one using flush_work()
or a wait mechanism) for clients to guarantee that no callbacks are executi=
ng
before module teardown, could this lead to executing a callback after the
client module is unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-riscv-rpmi=
-tee-abi-v2-0-45939a13d223@oss.qualcomm.com?part=3D10
