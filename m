Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB662E974D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193132; cv=none; b=NMdcomlJLi0QW5mgL0eNE7pKWhbhbjUGfHZcqnhi6mHCyKR1YTTf7bfa2m6vkeoD7GJvQUNDikfuwOZuo3fKLnjMEHtyumbp+p8dUQAq1yQy13lFqzZBpg1p3gSZhUYT2FfGvsAzBa5tlOyST87yYpyp9qrhQGFklALoK0G5zyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193132; c=relaxed/simple;
	bh=9s2eANOn5/49c3EGLONMjjl4yiw8oZzccpgvc7B3zxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K09Sin1EdKu5DEIEpuiLeF09qOyrdEr+9tgJd+xx9R4urmxY4pTiUgtCLXBej4dUKii/DI2DTpMrnlwQtu/5iFh/oPfaypBLB/Q2DK8PRnnbTofJ6I4LXjsqqOL0xk5aqLWZZwm5DpU3aqcuLAV/RQmQPHzhJwP5/1NmqFs/kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRoEoDml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRoEoDml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9991F00893;
	Thu, 11 Jun 2026 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781193131;
	bh=5QuCETsjr525bA4c4GPp7vvBsUsP9dMsHpMsPZh9iWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XRoEoDml3ayo8Qb9ySJb+2O7ojb0vCbhaVKajQj4XI2k3GkagPPbvSQ0xhWXJrmOA
	 Gojsk5HRO7uEm/ppwT5wZ43nSMCrwX/f54fTNVBvEgSCtJp0fZlmBNGq2UZ9ciwGgw
	 eDitYyhw++YiuRPaxMI6af82Nbz2MJa8wjKGdCr3o0Ro4VEFvpO3xT8FctFtSW6l08
	 YLxx6R3Jr7Aa3YzSXvbKVz/YyzZ1ttj2jGMT8/VvScKB4BdMwNJH0lOAYVKLVVTwLg
	 Jq6gfxxS679dr1hzd5EZy9KqN+iVdvNnImSUFnmVizKlzgXyIq/+m3NREVrxinGRxu
	 Vzd7/FLifg45g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] misc: lis3lv02d: set default click detection
 thresholds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611154105.3727-2-shofiqtest@gmail.com>
References: <20260611154105.3727-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 15:52:10 +0000
Message-Id: <20260611155211.1F9991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The patch hardcodes a default click threshold instead of parsing t=
he documented legacy DT property `st,click-thresh-*`, incorrectly overridin=
g explicitly configured board values.

Pre-existing issues:
- [High] The dynamically allocated `struct lis3lv02d_platform_data` is leak=
ed on probe error paths and device unbind.
- [High] The return value of `lis3lv02d_add_fs` is ignored, leading to an i=
nvalid pointer address generation and a kernel crash if device creation fai=
ls.
- [High] Sysfs hardware access occurs with a runtime PM usage count of zero=
, risking a race condition with device suspend.
--

commit e23e0f8c271ea91f741e5d3559287f33c9596b0d
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

misc: lis3lv02d: set default click detection thresholds

This commit works around an issue where several upstream board DTS files
use an undocumented property name for click thresholds. It hardcodes a
default value of 10 during the driver's device tree initialization to
compensate for the driver reading a misspelled property name.

> diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/=
lis3lv02d.c
> index 6957091ab6dee..245bb6249033b 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d.c
> +++ b/drivers/misc/lis3lv02d/lis3lv02d.c
> @@ -958,6 +958,14 @@ int lis3lv02d_init_dt(struct lis3lv02d *lis3)
>  	if (!pdata)
>  		return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this code leak the allocated platform
data?

When pdata is dynamically allocated via kzalloc() earlier in
lis3lv02d_init_dt() and assigned to lis3_dev.pdata, there appears to be no
corresponding kfree() in the error teardown paths. For example, if the bus
probe fails in lis3lv02d_i2c_probe() due to -EPROBE_DEFER, the allocated
memory is never freed:

drivers/misc/lis3lv02d/lis3lv02d_i2c.c:lis3lv02d_i2c_probe() {
    ...
fail:
    if (pdata && pdata->release_resources)
        pdata->release_resources();
    return ret;
}

Since lis3_dev is a static global variable, repeatedly probing and deferring
or unbinding and rebinding the driver could continuously leak memory.

> =20
> +	/* Set sensible click threshold defaults. Several upstream board DTS
> +	 * files use the misspelled property "st,click-thresh-*" which the
> +	 * driver never reads, leaving these at zero. Default to 10 so those
> +	 * boards get working click detection without a DT change. */
> +	pdata->click_thresh_x =3D 10;
> +	pdata->click_thresh_y =3D 10;
> +	pdata->click_thresh_z =3D 10;

[Severity: High]
Can hardcoding these defaults override explicitly configured board values?

The device tree binding documents st,click-thresh-x/y/z, but the driver
erroneously parses st,click-threshold-x/y/z. Instead of updating the driver
to parse both properties to respect the DT ABI, this applies an arbitrary
default of 10.

If a board correctly configures a different threshold, such as
st,click-thresh-x =3D <8>, will this explicit configuration be ignored and
silently forced to 10?

[ ... ]

[Severity: High]
This is a pre-existing issue, but will the lack of a return value check cau=
se
a kernel crash if device creation fails?

In lis3lv02d_init_device(), lis3lv02d_add_fs() is called without checking
its return value:

drivers/misc/lis3lv02d/lis3lv02d.c:lis3lv02d_init_device() {
    ...
    lis3lv02d_add_fs(lis3);
    err =3D lis3lv02d_poweron(lis3);
    ...
}

If faux_device_create_with_groups() fails and returns NULL, lis3->fdev
remains NULL. When the code later calls lis3lv02d_joystick_enable(), it
computes &lis3->fdev->dev and assigns it to input_dev->dev.parent. The
offset calculation from a NULL pointer yields an invalid pointer, leading
to a NULL pointer dereference when the input subsystem accesses the parent
device.

[Severity: High]
This is a pre-existing issue, but is sysfs hardware accessed with a runtime
PM usage count of zero?

In sysfs attribute handlers like lis3lv02d_position_show(),
lis3lv02d_sysfs_poweron() is called before accessing the hardware:

drivers/misc/lis3lv02d/lis3lv02d.c:lis3lv02d_position_show() {
    ...
    lis3lv02d_sysfs_poweron(lis3);
    mutex_lock(&lis3->mutex);
    lis3lv02d_get_xyz(lis3, &x, &y, &z);
    ...
}

However, lis3lv02d_sysfs_poweron() calls pm_runtime_get_sync(), but then
immediately drops the usage count via pm_runtime_put_noidle():

drivers/misc/lis3lv02d/lis3lv02d.c:lis3lv02d_sysfs_poweron() {
    ...
    pm_runtime_put_noidle(lis3->pm_dev);
    pm_schedule_suspend(lis3->pm_dev, LIS3_SYSFS_POWERDOWN_DELAY);
}

This drops the runtime PM usage count to 0 while the I2C/SPI registers
are actively being read. Could a concurrent system sleep physically power
off the device while communication is occurring, leading to bus lockups
or a kernel oops?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611154105.3727=
-1-shofiqtest@gmail.com?part=3D1
