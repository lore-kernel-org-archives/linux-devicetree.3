Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0051365A03
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024428; cv=none; b=m/HVsE5tU5z950jB0RvlVmUPS17Jzns+D7mfOBDO/Jperq2+BMwSpVxXuXZLIYcGRdj3P4EuUuAnrzFztHX/u4pbdZLX4wKvTJacG2F8PsuLkxJ1TlQz7DX9zBOqLaoYBEMxpj/vha4hNIGoXChxRmiqyT8KXJhDjCrr6kW7SIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024428; c=relaxed/simple;
	bh=3+1nwTN8YOP3de9oonqsCDwxOdz0GnaNE6/DZBRFy14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lfRITu5bUbCG3CJiuNU/5m8KPYGH+btuBYd0k0ypnTEOZdc/fVdiOM+q9aqU8JJdHSoTz2LhqVq4siJP3TH0vDaa1uoXzDZMqdsMqXad5gRyHQ5Q0rAGz/gwTDA3DdzrUpf0XrxV9UAAkEM6cRI7IHGRrrO48bR3ne0G3I91OUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyheAOxJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyheAOxJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510E01F000E9;
	Tue, 14 Jul 2026 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784024426;
	bh=ZScVYZ8poWtq8BGB0ii8vZJEoswk2dbw3WrnJPdkMG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyheAOxJBZurZud2IyFgu8KQj4mcBPs/u2kQ/vtZqCNngePbypIA9hCsH7jXUUQ9B
	 q+y0YgtFl84czVDT2FageQ78ghJDjmG9NVk/fAbIA/XNTmRwFfa/MEPOwrYPXeqi6y
	 7UijBnFhPJ41M2ccDfaRflMX0noLFlKA+FZdmg5VCL/H4uEFMdOwRxo0IgCOlu/Zjj
	 B2ptrVBqxVMBIUabN8MZVzg/QWBkiF73vOr0A4PjUxt0dSHriZyVzEYuYbLYc8n3pO
	 1Dn8LEYcLJyFGmshY4d8y/VLh8YOq5SI0xGOD+kDcferr2e6JMpI1kRgCdEctKykoP
	 GK3/DUj41GDog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/8] i3c: master: Fix IBI request and free cleanup
 paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714092053.2461482-3-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 10:20:25 +0000
Message-Id: <20260714102026.510E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Bypassing the core cleanup paths when `dev->ibi` is cleared by a c=
ontroller callback causes a permanent leak of the IBI workqueue (including =
its rescuer kthread) and potentially the `ibi` object itself.

Pre-existing issues:
- [High] Potential use-after-free of IBI pool during workqueue destruction =
if IBI disable fails.
--

--- Patch [2]: [PATCH v14 2/8] i3c: master: Fix IBI request and free cleanu=
p paths ---
commit e0d1c57d2924f66898a40232f7e52ca0e1be0aea
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: master: Fix IBI request and free cleanup paths

This commit attempts to fix a workqueue leak in the IBI request failure path
by destroying the workqueue before freeing the IBI object. It also adds che=
cks
to avoid touching dev->ibi after controller callbacks if they have already
cleared it, aiming to prevent NULL pointer dereferences.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3b1c342be2bc5..ba37f71badac8 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -3702,8 +3702,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc=
 *dev,
> =20
>  	dev->ibi =3D ibi;
>  	ret =3D master->ops->request_ibi(dev, req);
> -	if (ret) {
> -		kfree(ibi);
> +
> +	/*
> +	 * The controller callback may have already released and cleared dev->i=
bi
> +	 * when the request is forwarded by a virtual controller. Only clean up=
 the
> +	 * IBI object if the callback left dev->ibi valid.
> +	 */
> +	if (ret && dev->ibi) {
> +		/* Avoid leaking the workqueue allocated for this IBI request. */
> +		if (dev->ibi->wq)
> +			destroy_workqueue(dev->ibi->wq);
> +
> +		kfree(dev->ibi);
>  		dev->ibi =3D NULL;
>  	}

[Severity: High]
Does this logic introduce a permanent leak of the IBI workqueue and the loc=
al
ibi object?

Since the core framework dynamically allocated ibi and ibi->wq earlier in
i3c_dev_request_ibi_locked(), if master->ops->request_ibi() fails and the
callback cleared dev->ibi, the check if (ret && dev->ibi) will be false.

Because the callback does not own these resources and cannot safely destroy
the framework's workqueue, the workqueue (including its rescuer kthread) and
the ibi object will be skipped during cleanup and leak permanently.

[ ... ]

> @@ -3743,6 +3753,13 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *=
dev)
> =20
>  	master->ops->free_ibi(dev);

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to a
use-after-free of the IBI pool memory if disabling the IBI fails?

Earlier in i3c_dev_free_ibi_locked(), if the IBI is still enabled, it tries
to disable it via i3c_dev_disable_ibi_locked(). If that disable fails
(e.g., due to a hardware timeout), it returns an error without waiting for
pending IBIs to finish, and we proceed directly to master->ops->free_ibi(de=
v).

This callback immediately frees the generic IBI pool. Subsequently,
destroy_workqueue() is called below, which synchronously drains
any executing IBI handler works. Since these pending work items reside insi=
de
the newly-freed pool, won't the rescuer thread dereference freed memory as
the workqueue drains?

> +	/*
> +	 * The controller callback may have already released dev->ibi, for exam=
ple
> +	 * when the request was forwarded by a virtual controller.
> +	 */
> +	if (!dev->ibi)
> +		return;

[Severity: High]
Similar to the request path above, does this early return bypass the
destruction of the workqueue and cause a resource leak?

If the controller callback cleared dev->ibi on the free path, we return
early and skip the destroy_workqueue(dev->ibi->wq) step, leaking the
workqueue and its rescuer thread.

> +
>  	if (dev->ibi->wq) {
>  		destroy_workqueue(dev->ibi->wq);
>  		dev->ibi->wq =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D2
