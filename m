Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5D279329
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264510; cv=none; b=BWm9IyfasGyKjgr+xD24PInCgNIZLansLKJZKjg1kLhUOR07WLl1NXAjaO3GDYmF2WvfzRnhRz9os6XDRcB2vgVIrKpfJuSwOdF2XrGneB/1EmrSxWdwd+H7vH6JZkDeug0sf/n7r+/QI1VtBGAJLkHRvezVUHNJpQ7P3KfMXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264510; c=relaxed/simple;
	bh=7Akrj0muqzGIC6QJDlN0eX342jhkkx2l9FNJCznmzcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qYqpgkz0qKPbkelG0n3zFWDQbGy89RzsdeSquNKISRFNKd0M604dSIfogqEjJQB7QC1/fn2yIRRiTZwetYIbpncOIp0wiOaww2u++TnBFoAMGYBfL3WEb99driaeSs7FaA4kGmwIMMHhYWJRYu6djaxuAGbC5enJwTOKbmQ1Xv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3h8NAg5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3h8NAg5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2CD1F000E9;
	Fri, 12 Jun 2026 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264509;
	bh=OE7WvBNDiP/2LSLBiDhPSfXypYLE0hhbi6/E7Obo7pE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3h8NAg551ldbPyexZAZjFdbwatMWdHJTf7hIvqIbZ2B7Qx6E6wZZiDZiJ/7vSiO0
	 gDxmq3SL9Z+HW2ZCNd6seup8vZDozKmukb8j9yita0uCyFmuZCINM0I0fL4JXt+WHh
	 4e8jf+wgbnR0hwVfxeFmFYOxNNEYDOw6y7aJEgLV8g5QTawJtzxUrdSR2va27rxWfx
	 JO7Bpk1XU0Y4joCvNGSvU1v+yBSutvQrsFWNIoVrH/2b+sAU91KAEyKmwnkPIOJ7/V
	 FucV8b95KzyjTkzsPrZ7nYN5lL0JM9P/fmRJ2cP9aAzxJyIdO4Pqb7Mv8c9O/P2ISa
	 EyfKBDK7hc8CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/9] i3c: master: rename
 i3c_master_reattach_i3c_dev() to *_locked
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260612111816.3688240-2-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:41:48 +0000
Message-Id: <20260612114149.2C2CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `i3c_master_reattach_i3c_dev_locked()` is igno=
red in `i3c_master_add_i3c_dev_locked()`, leading to bus state corruption i=
f reattachment fails.
- [High] Aggressive cleanup in `i3c_master_reattach_i3c_dev_locked()` sabot=
ages the caller's hardware rollback path (`RSTDAA`) in `i3c_master_early_i3=
c_dev_add()`.
- [High] `i3c_device_uevent()` accesses `i3cdev->desc` without acquiring `b=
us->lock`, leading to a Use-After-Free if a hot-join device replacement occ=
urs concurrently.
--

commit 8a7af37c292c3791d232cdb1c2f37ae5aba2ca10
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
   =20
Rename i3c_master_reattach_i3c_dev() to *_locked() to make the locking
requirement explicit and consistent with other I3C core helpers that
require the bus lock to be held by the caller.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 6b8df8089a357..c45b450af319d 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1742,7 +1742,7 @@ static int i3c_master_early_i3c_dev_add(struct i3c_=
master_controller *master,
>  		goto err_detach_dev;
> =20
>  	i3cdev->info.dyn_addr =3D i3cdev->boardinfo->init_dyn_addr;
> -	ret =3D i3c_master_reattach_i3c_dev(i3cdev, 0);
> +	ret =3D i3c_master_reattach_i3c_dev_locked(i3cdev, 0);

[Severity: High]
This isn't a bug introduced by this patch, but doesn't the error path
here break if the reattach fails?

If master->ops->reattach_i3c_dev() fails,
i3c_master_reattach_i3c_dev_locked() immediately marks the
dev->info.dyn_addr slot as I3C_ADDR_SLOT_FREE via i3c_master_put_i3c_addrs(=
).

This seems to sabotage the fallback path at err_rstdaa:

drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
    ...
    err_rstdaa:
        i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
    ...
}

Since the address slot is now marked free, i3c_master_rstdaa_locked()
will instantly abort with -EINVAL because the slot status is no longer
I3C_ADDR_SLOT_I3C_DEV. Will this leave the physical device retaining
the dynamic address while the master controller incorrectly considers it fr=
ee?

>  	if (ret)
>  		goto err_rstdaa;
> =20

[ ... ]

> @@ -2358,7 +2358,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master=
_controller *master,
>  		if (!ret) {
>  			old_dyn_addr =3D newdev->info.dyn_addr;
>  			newdev->info.dyn_addr =3D expected_dyn_addr;
> -			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
> +			i3c_master_reattach_i3c_dev_locked(newdev, old_dyn_addr);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return
value of i3c_master_reattach_i3c_dev_locked() here?

If the underlying master->ops->reattach_i3c_dev() fails, the reattach
function calls i3c_master_put_i3c_addrs(), marking the device's assigned
dynamic address slot as I3C_ADDR_SLOT_FREE in the bus bitmask.

Since this failure is completely ignored and the caller returns success,
the hardware remains configured to listen on the new dynamic address, but
the software allocator considers the slot free. Could a subsequent
hot-join or device addition be assigned this exact same dynamic address,
leading to unrecoverable bus collisions?

[Severity: High]
Additionally, this isn't a bug introduced by this patch, but does
i3c_master_add_i3c_dev_locked() race with userspace uevents during a
hot-join device replacement?

Later in this function, it identifies duplicate devices, migrates
the generic struct device from the old descriptor to the new one, and
eventually frees the old descriptor via i3c_master_free_i3c_dev(olddev).
This process is protected by the bus maintenance lock.

However, i3c_device_uevent() is triggered by sysfs and directly
dereferences i3cdev->desc without acquiring the bus lock or employing RCU:

drivers/i3c/master.c:i3c_device_uevent() {
    ...
    if (i3cdev->desc)
        devinfo =3D i3cdev->desc->info;
    manuf =3D I3C_PID_MANUF_ID(devinfo.pid);
    ...
}

If a thread executing i3c_device_uevent() evaluates i3cdev->desc, gets
preempted while i3c_master_add_i3c_dev_locked() frees olddev, and then
resumes, will this trigger a use-after-free during the structure copy?

>  		} else {
>  			dev_err(&master->dev,
>  				"Failed to assign reserved/old address to device %d%llx",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D1
