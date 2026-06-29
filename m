Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F43BBFC8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717425; cv=none; b=hizIsUTtiiGCy76Eb5TmKaKw4oAw0vvByLyqnvOf1O4uhPl/KwD06J+mXmZ+9Lm2mjP1Yz8ty+uiaHbvYjS8P139ZMuxN0U/02IAAPOOcaj1oZDEiA8LJ8kqAlHO4Tai3JZcIcB1zVfgKWAgor6jqrED+aP42WX/gGBNWMtrS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717425; c=relaxed/simple;
	bh=Az+w12js3UM/C4nX/pFjWiSujPNtbITX0JumWWv9naA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fXcyWBWJ67G1dsypI5vNt6FxTFckztY90QshMgF/lSRAfqboSfy55qD8dpHUtyIb8Y/Wk/HrZQEstD8XgqH13Cw+rOfWKvc8p/X+DPHRC6jWGCuzBzC6df+odAZTR2QpnGAvd36lGYJJPXag+VBRz8iuvPYQGDbozJfBai8WQEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URyoocbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URyoocbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7431F000E9;
	Mon, 29 Jun 2026 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782717422;
	bh=GumMT+PHZJo9RKbX8S7HS6AFpr0qj3ijY9wXsnQyrJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URyoocbVkZjxWXa4TaP3kUo/RqW3PuKzY0meuOpqQN+jPSG8Cnwnszi0F5IcAm2uD
	 C9buNjM2nqZHHpNuw3VFBxIBbSaQkPpq6KDSx566cUVbdi27KBZvBbbVwpPPRmhk26
	 CWvJXfwB//tBgQbDNAIkPg1BTaLXUxDKR19gTG5IDenWbOOtY1aw6H258xisTsd3Wl
	 2sr7DKKG5vqxt4C5yQJ21O0rNNyzNqQai7SVngkgJlQ4s3AuK0Y7RLhff5Tc65a1V9
	 NamBPHtyO5L1Y684AZenA/xn6201l2U2Q6gbT1B7pHtu4drW1Y4aISA/KTsMm/UQLh
	 Lhq+s/HLmj9Yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ipmi: bt-bmc: Read LPC address and SerIRQ from
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Che Hsieh via B4 Relay" <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-4-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-4-fc23ee337f7a@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:16:52 +0000
Message-Id: <20260629071702.5B7431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of `bt_bmc` structure on driver unbind due to `devm=
` lifetime mismatch.
- [High] Integer underflow in `bt_bmc_read` when `count` is 0 leads to copy=
ing up to 256 bytes of kernel buffer into user space, potentially corruptin=
g user memory.
--

commit 8f320638f39284e640c5ee9882a67005b5620ea1
Author: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
ipmi: bt-bmc: Read LPC address and SerIRQ from device tree

This commit updates the driver to allow the host interface parameters, such
as the LPC IO address and SerIRQ number, to be described by firmware via the
device tree. It falls back to default values for these properties when they
are not present.

> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 486ecc0b68159..6e1f941e63db8 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -65,6 +65,12 @@ struct bt_bmc {
>  	struct timer_list	poll_timer;
>  	struct mutex		mutex;
>  	atomic_t		open_count;
> +	u32			io_addr;
> +
> +	struct {
> +		u32 id;
> +		u32 type;
> +	} sirq;
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does bt_bmc_read() have an
integer underflow when the read count is 0?

If a user space process calls read() with a count of 0, the size calculation
might underflow:

drivers/char/ipmi/bt-bmc.c:bt_bmc_read() {
    ...
	if (len + 1 > count)
		len =3D count - 1;
    ...
}

If count is 0, could len =3D count - 1 underflow and become 255 when cast to
u8, causing the subsequent code to perform a 256-byte out-of-bounds copy to
user space?

[ ... ]

> @@ -429,6 +435,33 @@ static int bt_bmc_probe(struct platform_device *pdev)
>  	mutex_init(&bt_bmc->mutex);
>  	init_waitqueue_head(&bt_bmc->queue);

[Severity: High]
This is a pre-existing issue, but could there be a use-after-free of the
bt_bmc structure on driver unbind?

The structure is allocated using devm_kzalloc() in bt_bmc_probe(), tying
its lifetime to the device instead of the file descriptor's lifetime.

When the driver is unbound, bt_bmc_remove() unregisters the misc device but
does not revoke existing file descriptors or wake up waitqueues before
returning:

drivers/char/ipmi/bt-bmc.c:bt_bmc_remove() {
	struct bt_bmc *bt_bmc =3D dev_get_drvdata(&pdev->dev);

	misc_deregister(&bt_bmc->miscdev);
    ...
}

After bt_bmc_remove() returns, the devres framework frees the bt_bmc
structure. If a reader is blocked in bt_bmc_read():

drivers/char/ipmi/bt-bmc.c:bt_bmc_read() {
    ...
	if (wait_event_interruptible(bt_bmc->queue,
				     bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN))
    ...
}

Will this blocked reader wake up and access the freed waitqueue and bt_bmc
structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-aspeed-bt-=
bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com?part=3D4
