Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE47649620
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652575; cv=none; b=r1B7IBGT19VRRjV68a8ctO2MojU/e+MYBCiL3RBkw1fxCxKD7E5pyReEWrDNKdA1ZeVFf/CnnmpGOx2jlCSITeVlHr29waPxDCZIHIo5UEaBUJTeB03TE5PWTj7ccvJeP1GBnpCUL0pAb5RW48oVS5r3G5QaE5O/DGh2B0A99+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652575; c=relaxed/simple;
	bh=kTEOKawOMaeHh53iWhfR+gWZukggNT1PECg/aPFXE3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J4ywyjILWftzC0Ta/wk206EfumC7xORHxlIymyQX6tR4pm5rcZFDx049oTX/5RzgUDY+FGd0ktUc6/16RktLzN3d7BPGRkG/R3G+YZR1yR4xsim0A7D2f1ZS8kHhB2EO746MD5+zoE0XSFe5cq7tk//J30EYS9/qv974BeQkDJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sj3KG4GC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sj3KG4GC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0CF1F00893;
	Tue, 29 Sep 2026 03:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652573;
	bh=RPI1ne2itX3G+uHV99UqjMSwXwy/7sfS0OG2hbFLWCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sj3KG4GCOYb4u6MoVSKlUC4jIlEFCTEoR7psZQ4kbu9BVy1CWvNS3ER/WcoXBWIeq
	 F6JX/bgmfIiPbTdJG+Ge+X0ZUOh/e/8APqLwxiK2qT/+oMwjnSOH+U9MlBtJCC3GMy
	 cTbgya0SksJjQL93rIZB3s9gdm6o8Qe4QgiEXybrvg8abMuNBEzJNTHUO/YCKS4ikR
	 /ielToR6AXWBuCZyumg7zfeXC1aKcAs7QXduqXLHCyxZbQ39iTX6uXxbMG2H/NFzNJ
	 nxg5AvT9G2i1JG3HOkLsvsooD2pOpXit17TNpft01A6IhGPRECOyJDiRyLjCIaBHgx
	 nWOfp5XFd4wSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/10] firmware: riscv: rpmi-tee: add signal bus
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-10-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-10-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:29:32 +0000
Message-Id: <20260929032933.2F0CF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] rpmi_tee: UAF in dispatch_signal() due to async relinquish
--

commit 65e73f5143f8eb36b1c247ca7810975eb375c7cf
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

    firmware: riscv: rpmi-tee: add signal bus support

This commit adds support for RPMI TEE signal buses, enabling bidirectional
asynchronous notifications between service devices and their TEE endpoints.
It introduces a new rpmi_tee_notifier_ops interface for clients to request,
relinquish, and raise signals.

> diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/=
riscv_rpmi_tee/driver.c
> index 0004f54c7d899..cc0a42d471e37 100644
> --- a/drivers/firmware/riscv_rpmi_tee/driver.c
> +++ b/drivers/firmware/riscv_rpmi_tee/driver.c
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
Does executing the callback without taking a module reference or holding a
lock that synchronizes with driver teardown leave us vulnerable to a race
condition?

If a client driver module is unloaded while a signal notification is being
dispatched, it appears the dispatch thread could read the callback pointer,
drop the bus lock, and be preempted. If the module unloads and frees its
text before the thread resumes, jumping to the freed callback address would
result in a use-after-free panic.

[ ... ]
> +/* Relinquish a previously reserved TEE-to-REE signal. */
> +static int rpmi_tee_op_notify_relinquish(struct rpmi_tee_device *rdev,
> +					 u32 signal)
> +{
> +	struct rpmi_tee_transport *priv =3D rpmi_tee_device_to_transport(rdev);
> +	struct rpmi_tee_signal_bus *bus;
[ ... ]
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

[Severity: High]
Because relinquishing a signal returns immediately without waiting for
in-flight callbacks to finish, can this allow the client module's remove
function to complete and the module to be unloaded while a callback is
still running or preempted in rpmi_tee_dispatch_signal()?

[ ... ]
> diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
> index c2dd992934813..5f4a0b19b0e12 100644
> --- a/include/linux/rpmi_tee.h
> +++ b/include/linux/rpmi_tee.h
[ ... ]
> +/* RPMI TEE signal notification operations. */
> +struct rpmi_tee_notifier_ops {
> +	/**
> +	 * @notify_request: Allocate a TEE-to-REE signal and associate it with
> +	 *	@cb and @cb_data. The allocated signal is returned through @signal.
> +	 */
> +	int (*notify_request)(struct rpmi_tee_device *rdev,
> +			      rpmi_tee_notifier_cb cb, void *cb_data, u32 *signal);
> +	/**
> +	 * @notify_relinquish: Stop dispatching a TEE-to-REE @signal previously
> +	 *	allocated for @rdev. The release is asynchronous and a callback may
> +	 *	relinquish its own signal.
> +	 */
> +	int (*notify_relinquish)(struct rpmi_tee_device *rdev, u32 signal);

[Severity: High]
The API seems to provide no flush or synchronize mechanism for clients to
safely unload. Is there a way for client drivers to guarantee that all
asynchronous callbacks have completely finished executing before they free
their resources or allow module unload?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D10
