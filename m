Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269D3BCD32
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963865; cv=none; b=ef63wGyV0n7/IsmZIy++LsPCZgajzYOEEYVzY7CLI0PYuFfdhGwuFdONeE0xD0MyuwHhmw925IWxrIIME3V1h01BLfLm1/AM9QjVdHiB8/kK0JaKQhVxg136JvRPqjB0p7B9l5k9bCoIgSLXs5nIq/Yr+ctYh0IevT1zlGsODQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963865; c=relaxed/simple;
	bh=IJXjgFYQqMInlxEvSXFMcsvfTRiRrtavuLB1WL3vR4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EGH7wf5hA/aIRvovWb0JTARhObuenpcLlqRSBbMA35oH9Dwu30pccx3/Y+qBKTkyy0wyTyg/KfuLzidMzdwULdlq52aW6NQh6MwMxjQIa6LtP1jzTZWk7mR3zSDZjEtUWJib4u6E48DJ8ow5SZ9CNDVeUreYSD/AtLQtWOa9V1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhKXsu6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhKXsu6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462311F00A3D;
	Mon, 17 Aug 2026 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963860;
	bh=5NC9YnNpGWmZQbWDdLVRrlHPSwL81A7V+iNeNZFKwcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AhKXsu6NzIMooqa2UFtcFqSiqwMGo6xSu8qLfniZQAAYKDeGEwVYcbbSxpXOKbphJ
	 syz5ZZq8NFhU5mnbQuU38DECpb1G+kAHWkGlg712eYGNZQtnVMhedRDSFR7Gl4pIEw
	 7O8RebZrxfLaeZKtGqF7fDg6b9JrSnlxKXw1iSy7VJP1avWTaVCzaByBJQWSJavvuu
	 z0+chrmdnf7Vh6YWeWwOZd9OHYpRT1821EJjT3rSr13AF0wq3bR5hiwGRZZFtRlVOv
	 zXbciMPaKl971H2O6NDtjVqRKfySo7k1kEP8ZDOJs1MIDJ4/uQnQ8FRp3NBsGnFfHY
	 WCz4ZB0VPX5qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/8] i3c: master: Add controller-only device
 operation helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260817103844.2142802-3-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:50:59 +0000
Message-Id: <20260817105100.462311F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Incomplete refactoring: `i3c_master_handle_ibi()` bypasses the newl=
y introduced `i3c_dev_recycle_ibi_slot_controller()` helper.

Pre-existing issues:
- [High] Missing memory barrier in `i3c_dev_disable_ibi_locked` causes a lo=
st wakeup and indefinite hang.
- [High] Use-after-free on error path in `i3c_dev_free_ibi_locked` when wor=
kqueue is drained after resources are freed.
--

--- Patch [2]: [PATCH v15 2/8] i3c: master: Add controller-only device oper=
ation helpers ---
commit 85e9cb3ce264f7889b2b4406bc379307ad054a14
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: master: Add controller-only device operation helpers

The generic I3C device attach and IBI paths perform both core-level
bookkeeping and controller-specific operations. An I3C hub, however,
maintains a logical device descriptor on the virtual downstream bus and
a separate parent-facing descriptor used by the physical parent
controller.

>     Add helpers for:
>       - attaching, reattaching, and detaching a device from a controller;
>       - requesting and freeing controller IBI resources;
>       - enabling and disabling IBIs at the controller;
>       - recycling controller IBI slots.
>    =20
>     Refactor the existing generic core paths to use these helpers, keeping
>     the current behaviour unchanged for regular I3C devices.

[Severity: Low]
The commit message mentions refactoring the existing generic core paths to
use the new controller-only helpers, including the one for recycling IBI=20
slots.

However, looking at the code for i3c_master_handle_ibi(), it appears to
still bypass the newly introduced wrapper:

drivers/i3c/master.c:i3c_master_handle_ibi() {
        ...
        if (master->ops->recycle_ibi_slot)
                master->ops->recycle_ibi_slot(dev, slot);
        ...
}

Does this function need to be updated to use=20
i3c_dev_recycle_ibi_slot_controller() to ensure the virtual controllers
in the new I3C hub framework can properly intercept these operations?

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 03fb41f0786c5..7ae6b3aaa9b4c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -3534,14 +3632,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
>   */
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
> -	struct i3c_master_controller *master;
>  	int ret;
> =20
> -	if (!dev->ibi)
> -		return -EINVAL;
> -
> -	master =3D i3c_dev_get_master(dev);
> -	ret =3D master->ops->disable_ibi(dev);
> +	ret =3D i3c_dev_disable_ibi_controller_locked(dev);
>  	if (ret)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does this sequence lack a memory barrier
before checking the pending IBIs?

Right after this return, the code does:

drivers/i3c/master.c:i3c_dev_disable_ibi_locked() {
        ...
        reinit_completion(&dev->ibi->all_ibis_handled);
        if (atomic_read(&dev->ibi->pending_ibis))
                wait_for_completion(&dev->ibi->all_ibis_handled);
        ...
}

Since reinit_completion() performs a plain store that can be delayed or
reordered after the atomic_read(), could a concurrent IBI worker
decrementing the pending count and calling complete() race with this?

If the worker executes between the load of pending_ibis and the delayed
store, could the store overwrite the completion state back to 0, causing
wait_for_completion() to hang indefinitely?

[ ... ]

> @@ -3667,7 +3835,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *d=
ev)
>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>  	}
> =20
> -	master->ops->free_ibi(dev);
> +	i3c_dev_free_ibi_controller_locked(dev);
> =20
>  	if (dev->ibi->wq) {
>  		destroy_workqueue(dev->ibi->wq);

[Severity: High]
This is a pre-existing issue, but does this cleanup order create a
use-after-free risk during an error path?

If disabling the IBI fails (for example, due to a hardware timeout), the
error path continues and calls i3c_dev_free_ibi_controller_locked(),
which frees the underlying controller resources like the generic IBI pool.

Then destroy_workqueue() is called to drain the workqueue. If there are
pending or executing IBI works still in the workqueue, won't they try to
access the freed slot pool when they run, resulting in a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D2
