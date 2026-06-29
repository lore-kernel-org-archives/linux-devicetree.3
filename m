Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2CD3B19AE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716702; cv=none; b=bJkJG/XEDVznaYlzVUwyyJuwbYpnoJska9eh71iG8qXIIhLBwxqfYseE1lunXOyaIzdYchg+hp+tbw7jcK+qxNfhmS61w+TOBVT9Iw/Sa9Gfl83B130N7zRNcAWorLOhpKX2iP8Op/XdteMybk4J1Dj+hrG31flgzWN+ax5kvCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716702; c=relaxed/simple;
	bh=zOM6xUgD2AG71+GS/6gc6/l1E1/yXHuf5V1tKu4b+b0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hKbsUdxqDA6xGp14MiBV937UK+rjBuA51sOeEcBTjsKu9fU/nCXxvGSLql+gaYsdHAbJCNQFQJLPEcA6rCCcqjVOGLR98Vz4+lOk6si1j9okN0acTT7HW+cnf99voZPi4f7mlCiNgIv7rD9MQHsIrRXn8XHCgdf4pBNkLVEgtDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMI7VlU0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMI7VlU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A381F00A3A;
	Mon, 29 Jun 2026 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716700;
	bh=cYsLc7VeFnzHRlR+FRxD2eiYZMglrm3vgeqW8aFo4VU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FMI7VlU0jof+qSicGu/mxreS6kAUfopwWCBFIq/auuzh2il/9l70OJfLXyqM9yLe6
	 X7dkd/plODzB6/lbXAdcdOtR+fe/em0BTnye04PhZOA79sEEsoyv7235GxtGYsosmx
	 g24EGAEXmLTpxEqV74XVHn2FFpoOGLUPTJwzmiA97PFlOGLx/xKA4a6xZdRuV2xUrx
	 IUg7aT6ikrjZtH4PB22AYaL/8/E1Bu5dykU0i0nbqLkbp2AVt0PO8E4kp5fAinQpvL
	 JDB8WlIWrY/caB6zX0sZ/4lmVvkdC6IN2vAtt0trtvga0KcjH++tSv13VhejVzG+HW
	 rbvjn/U+Qagjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ipmi: bt-bmc: Track open state per device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Che Hsieh via B4 Relay" <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-2-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-2-fc23ee337f7a@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:04:55 +0000
Message-Id: <20260629070500.61A381F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The patch fails to achieve its stated goal of allowing multiple =
independent BT devices because it hardcodes the miscdevice name, causing a =
sysfs collision during probe.

Pre-existing issues:
- [High] A race condition between `bt_bmc_release` and `bt_bmc_open` can le=
ave the BT device hardware incorrectly marked as busy, permanently blocking=
 communication.
- [High] Unbinding the driver via sysfs while the miscdevice is held open l=
eads to a Use-After-Free (UAF) and kernel panic.
- [High] Hardware interrupts are not disabled during device removal, leadin=
g to a potential unhandled interrupt storm if the IRQ line is shared.
- [High] In `bt_bmc_read()`, passing a `count` of 0 causes an integer under=
flow that leads to an out-of-bounds `copy_to_user()`, silently corrupting u=
serspace memory.
--

commit a5620fa074169f5d84ab115271732484510fd6a0
Author: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

ipmi: bt-bmc: Track open state per device

The patch moves the open count from a global variable into the per-device
struct bt_bmc. This is intended to maintain the single-open restriction per
device while allowing multiple distinct BT devices to be opened independent=
ly.

> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index f3c67272502fb..486ecc0b68159 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c

[ ... ]

> @@ -152,12 +151,12 @@ static int bt_bmc_open(struct inode *inode, struct =
file *file)
>  {
>  	struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> =20
> -	if (atomic_inc_return(&open_count) =3D=3D 1) {
> +	if (atomic_inc_return(&bt_bmc->open_count) =3D=3D 1) {
>  		clr_b_busy(bt_bmc);
>  		return 0;
>  	}

[Severity: High]
This is a pre-existing issue, but is there a race condition between
bt_bmc_open() and bt_bmc_release()?

If process A closes the device and process B opens it concurrently, could
they interleave like this:

Process A in bt_bmc_release():
    atomic_dec(&bt_bmc->open_count);

Process B in bt_bmc_open():
    if (atomic_inc_return(&bt_bmc->open_count) =3D=3D 1) {
        clr_b_busy(bt_bmc);
        return 0;
    }

Process A continues in bt_bmc_release():
    set_b_busy(bt_bmc);

Could this sequence leave the newly opened device incorrectly marked as busy
in the hardware, permanently blocking communication?

[ ... ]

> @@ -313,7 +312,7 @@ static int bt_bmc_release(struct inode *inode, struct=
 file *file)
>  {
>  	struct bt_bmc *bt_bmc =3D file_bt_bmc(file);
> =20
> -	atomic_dec(&open_count);
> +	atomic_dec(&bt_bmc->open_count);
>  	set_b_busy(bt_bmc);
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does this function lead to a
use-after-free if the driver is unbound while the device is held open?

When bt_bmc_remove() unbinds the driver, it deregisters the misc device:

bt_bmc_remove() {
    struct bt_bmc *bt_bmc =3D dev_get_drvdata(&pdev->dev);
    ...
    misc_deregister(&bt_bmc->miscdev);
}

Because misc_deregister() does not instantly revoke open file descriptors,
the bt_bmc structure can be freed by devres while userspace still has the
file open.

When the file is eventually closed, won't bt_bmc_release() access the freed
bt_bmc pointer to decrement open_count and update the hardware?


[Severity: High]
This is a pre-existing issue, but do we need to disable hardware interrupts
during device removal?

When configuring the IRQ, hardware interrupts are enabled:

bt_bmc_config_irq() {
    ...
    reg |=3D BT_CR1_IRQ_EN_H2B | BT_CR1_IRQ_EN_HBUSY;
    writel(reg, bt_bmc->base + BT_CR1);
    ...
}

However, bt_bmc_remove() doesn't seem to clear these interrupt enable bits
before the IRQ handler is freed by devres.

If the hardware asserts an interrupt after removal, could this result in an
unhandled interrupt storm that forces the kernel to disable the shared IRQ
line?

[ ... ]

> @@ -425,6 +424,8 @@ static int bt_bmc_probe(struct platform_device *pdev)
>  	if (IS_ERR(bt_bmc->base))
>  		return PTR_ERR(bt_bmc->base);
> =20
> +	atomic_set(&bt_bmc->open_count, 0);
> +

[Severity: Medium]
Will this actually allow multiple independent BT devices to operate, as
intended by the commit message?

Later in bt_bmc_probe(), the misc device name is statically assigned:

bt_bmc_probe() {
    ...
    bt_bmc->miscdev.name =3D DEVICE_NAME;
    ...
    rc =3D misc_register(&bt_bmc->miscdev);
    ...
}

Because DEVICE_NAME is statically defined as "ipmi-bt-host", won't a second
device probe fail with an -EEXIST error from misc_register() due to sysfs
and /dev name collisions?


[Severity: High]
This isn't a bug introduced by this patch, but could passing a count of zero
to bt_bmc_read() result in an out-of-bounds copy?

Looking at bt_bmc_read():

bt_bmc_read() {
    ...
    if (len + 1 > count)
        len =3D count - 1;
    ...
}

If count is 0, len + 1 is 1, which is greater than 0, so len becomes 0 - 1.
Because len is an 8-bit unsigned integer, wouldn't this underflow to 255?

This could cause the loop to read 255 bytes from the hardware and copy 256
bytes to userspace using copy_to_user(), which might silently corrupt
memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-aspeed-bt-=
bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com?part=3D2
