Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C437AA79
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741462; cv=none; b=biq5p3bqlMKs9cK6HwUB57GmNP80B3roYHR9VdGvc/01SjXdt5UV0PYaP9YSYqycyrSxki3mxxeTNfx4g+REOdShrEkl2eNmX/+EthD+5DwX1GDjpT8nRxlfXoosdidQu06MPtEwLu2HsnM2GijdcGHnYFgpPJ/h7afa8zYgxsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741462; c=relaxed/simple;
	bh=i/A6bdZ7KJmyziyRnpqMarB0JrRrD2m/3fAAiA7tzf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j/j4nM3dmTmyWO18zNPm+qkysKUYKzYxBR1brAgERbcwrCFwJAWaFi6Da/MNhWStR1nT8s5zGU/uiGVZv/qUGgt+tDn5ZHJYic8o4CLgQ5ppW6z33P0jLL1fSnAmkOHPWaEbYF1O1UHjBODW+tQy2TOUMoweGFcZPPgy6MIJtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNAScqSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNAScqSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DA21F000E9;
	Wed, 26 Aug 2026 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741446;
	bh=YtDaSLVh0eAnWe9c7pCY+O1a4NZv1iXPrGsIhLqFcAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RNAScqSzwiCffQ8dSN8nhNAxS4OcaeWh+jfYO82JrhBV1Ew/ofdriceaxl9vgcRFv
	 xzyRnBhkvlrUpDep8+rRrj7K0rn3uvabLBZML8NjMLSi0k4fyMOae/o5m4sIwYacT0
	 DzP20Kj1kuVu+GxAvLyFB6dRixUEc+kMrlH9OW6w0yDqO9yaPVi/fL++414GfoR7G0
	 6qXVNEu/MPTYXmF4gsHPwxgU3siNyO0T0/Ax7A2Gp/obpURTdmxMw+u+BB6qToZVYx
	 YGmogEAvgjTFQiwVaO0bCYutmF45uL52mm/kQ4DbWf2omm+Q5Ph94z2QTFMZhTA+9k
	 3rxA405UkUV1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/8] i3c: master: Add controller-only device
 operation helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826103819.1614843-3-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:50:45 +0000
Message-Id: <20260826105045.B3DA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Unnecessary heavy workqueue allocation and teardown when a contr=
oller does not support IBIs.

Pre-existing issues:
- [Critical] Potential use-after-free of generic IBI pool slots and `dev->i=
bi` when disabling an active IBI fails during teardown.
--

commit f38c11b5d94a35f5b99f6a1f23bbb449f122ded4
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: master: Add controller-only device operation helpers

The generic I3C device attach and IBI paths perform both core-level
bookkeeping and controller-specific operations. Add controller-only helpers
that invoke the controller callbacks without updating the bus device list,
address-slot state, or generic IBI lifecycle. Also release the generic IBI
workqueue and state when the controller request callback fails.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 03fb41f0786c5..88379b6809a64 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -3600,13 +3752,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req)
>  {
> -	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
>  	struct i3c_device_ibi_info *ibi;
>  	int ret;
> =20
> -	if (!master->ops->request_ibi)
> -		return -EOPNOTSUPP;
> -
>  	if (dev->ibi)
>  		return -EBUSY;
> =20
[ ... ]
> @@ -3627,8 +3775,15 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc=
 *dev,
>  	ibi->num_slots =3D req->num_slots;
> =20
>  	dev->ibi =3D ibi;
> -	ret =3D master->ops->request_ibi(dev, req);
> +	ret =3D i3c_dev_request_ibi_controller_locked(dev, req);
>  	if (ret) {
> +		/*
> +		 * The controller request callback failed, so tear down the
> +		 * workqueue allocated above before freeing the IBI object.
> +		 * This is the owner of the workqueue, so it must destroy it
> +		 * here to avoid leaking it on the error path.
> +		 */
> +		destroy_workqueue(ibi->wq);
>  		kfree(ibi);
>  		dev->ibi =3D NULL;
>  	}

[Severity: Medium]
Since the check for master->ops->request_ibi was moved into
i3c_dev_request_ibi_controller_locked(), this code now unconditionally
creates a new ordered workqueue during device probe even when the
underlying controller doesn't support IBIs.

Does this unnecessary allocation and destruction of a workqueue thread
(which involves sysfs registration and RCU synchronization) add a noticeable
performance delay for devices on controllers without IBI support?

[ ... ]
> @@ -3667,7 +3843,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *d=
ev)
>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>  	}
> =20
> -	master->ops->free_ibi(dev);
> +	i3c_dev_free_ibi_controller_locked(dev);
> =20
>  	if (dev->ibi->wq) {
>  		destroy_workqueue(dev->ibi->wq);

[Severity: Critical]
This is a pre-existing issue, but can calling
i3c_dev_free_ibi_controller_locked() before destroy_workqueue(dev->ibi->wq)
cause a use-after-free?

If i3c_dev_disable_ibi_locked() fails (e.g. due to a bus timeout), the
teardown continues and invokes the controller's free_ibi callback, which
immediately frees the generic IBI pool memory.

If there are still pending IBI work items because destroy_workqueue() hasn't
been called to drain them yet, will the workqueue process them and
dereference the freed generic IBI slots?

Additionally, could an active hardware interrupt still fire and race with
the controller's free_ibi callback, leading to memory corruption inside the
interrupt handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103819.1614=
843-1-lakshay.piplani@nxp.com?part=3D2
