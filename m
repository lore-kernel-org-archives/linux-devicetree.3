Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5E046EC84
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 19:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661561; cv=none; b=Wx0rs9ml3Khiyy6WKPtlHauh+DjrWVJkwzVEfDGaFKJz9Imig98ak9okk/zxAtCBGs1Yr9zuyKP3dbk9uqvit3CH78MlGz10H6FXr1WPOdRGrrzeumJgXBTtVmxoZBJ3eWlsk/8xa6NwliMbaismQj5cxmjB2+ZUzEwDva5YiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661561; c=relaxed/simple;
	bh=aQ7PPHsBvIItbagI72ESzcePLF/P6f7DXj8Ledzp56c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fyksM1iGo35IRwMrC7yuZIEwJ4Sg+qrX1s0zVgWs7dfMfif2oF9apmaxdui6JQa9y8zpIz2e0Xzoyd0wyPckX4lqgF2qjvN5q+R0EbQ7LzyjS3zn05rk4jeZQgNQ0+AvxMeDUufNTKFur9804906tkVV7X/O+8BqZ1xDOAtpcxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCrS8HFZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCrS8HFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225191F000E9;
	Tue, 21 Jul 2026 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661560;
	bh=227GNd+6SnU19dR3QS09OOQ4yiQRwycAM9eI7uVmS9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCrS8HFZzVtkNwWUQBPGDVguUKxSD+yNZIRhP12ARb1/XnkMEZDZOH8NZ2fY8VCmP
	 mO9Vg1i6ETiJGO8a8oMgRmNbYn+5zr7aMh2jMHIcrGsqKNYHWM2Na4lICbwvhPAHDz
	 +3w3mmn/oHtX3BZK/GaPIi54rTCmkDaNZnnTOUeacJSl5znVDz8Zan89PylCTHSa1Z
	 wKdolEW6w6L1DGvi5ODjVb6rjafDRayGd82NANFjPnz37QE6mwjT6MB8HkN72DIyGH
	 8UDHTDOk2mdrYVYcWBXknuFWX3mqxDlI3ZUjGQSmSRMdBHe2SIoW71Un1obsY3YnBD
	 Wl0k08gMTz//g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] power: supply: Add registration init callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721185904.40756-2-vincent.cloutier@icloud.com>
References: <20260721185904.40756-1-vincent.cloutier@icloud.com>
 <20260721185904.40756-2-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:19:19 +0000
Message-Id: <20260721191920.225191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `cancel_work_sync()` on the error path of `__power_supply_=
register` can lead to a Use-After-Free of `psy->changed_work` if `init()` o=
r a later registration step fails.
--

--- Patch [1]: [PATCH v3 1/4] power: supply: Add registration init callback=
 ---
commit c4ba9fcb2726959834e20c38014a9f7e6a27b6c5
Author: Vincent Cloutier <vincent@cloutier.co>

power: supply: Add registration init callback

This patch adds an optional init callback for power supply drivers to consu=
me
battery data before the power supply is visible. The callback runs during
registration after driver data is available but before the device is added.

> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
[ ... ]
> @@ -1624,6 +1624,14 @@ __power_supply_register(struct device *parent,
>  	init_rwsem(&psy->extensions_sem);
>  	INIT_LIST_HEAD(&psy->extensions);
> =20
> +	if (desc->init) {
> +		rc =3D desc->init(psy);
> +		if (WARN_ON_ONCE(rc > 0))
> +			rc =3D -EINVAL;
> +		if (rc)
> +			goto check_supplies_failed;

[Severity: High]
This is a pre-existing issue, but this new callback makes the error handling
flaw much easier to trigger.

If a driver requests an interrupt during this init callback, and the
interrupt fires immediately, its handler might call power_supply_changed(),
which queues psy->changed_work.

If the init callback subsequently returns an error, or a later registration
step fails, the function jumps to the check_supplies_failed label:

__power_supply_register() {
    ...
check_supplies_failed:
dev_set_name_failed:
        put_device(dev);
        return ERR_PTR(rc);
}

The put_device() call drops the reference count and frees the psy object via
power_supply_dev_release(). However, there is no call to cancel_work_sync()
for psy->changed_work in this error path.

Could this lead to a use-after-free when the system workqueue executes
psy->changed_work on the freed memory?

> +	}
> +
>  	rc =3D device_add(dev);
>  	if (rc)
>  		goto device_add_failed;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721185904.4075=
6-1-vincent.cloutier@icloud.com?part=3D1
