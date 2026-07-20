Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201B1DA23
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510813; cv=none; b=YHA9ZHZ6XZBJhVAngmHfspP9MWWy1djiNJCCoupNnkbUy7tibfuk73WzqG5h5qQ8hjfBKjiq+pTPIzJe2KBTLOYxd02SjQclTwqUeQOPk74/GNh+yT8RkHx6OHvY7sK8R+VyJf0uU+J484j5Xl4S0Z4l7djU0SsnD0dnY0lSgfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510813; c=relaxed/simple;
	bh=XTq+SQN9ITzxvHXFUzXS1ScboasspbyaAssi4k62B50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uW3RAf2Gw+aarNoE3kQT+0/LXwGXxo4Er36yDNkgEiOgdXrDhW2dvtcexdrDljKMjxCsTF0/0gwCR4lZ2O559yC/RHJ4xuFEp2i7BX6/d2/wgtXreE7gDJ8x3gn7730aQIA+uVAe9Gi7nBaV5iJwi/YKTYVH3ONliToyuMNGvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJtpuH9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJtpuH9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D0C1F000E9;
	Mon, 20 Jul 2026 01:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784510811;
	bh=XznSamwdGo73CC+77845LBbvDQOwV9BNBGOVTxGT7zI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJtpuH9sruh67IzPKvkDEECv3zqKbW8nsu5C9WmW4Xzih6I2wzn8ZIWFj2KJWofyQ
	 WKlZiwXv7wgr+i3lh1JMCxU84hNJQIQTw/Zsl2AkhjjM/8BBEZaHOGghBAN+M+zAvo
	 IWGu/OtZyktxwHdauHjdcm/lpvmVub8sXWeDIXgwb40WBcJ+PCkIsoqQwbpC75PArv
	 pclSTOsyi+Cy53plT+8UPNl0cVsJ3g+Nplvf/k9RClAWDMLdS1qIoG3O6BTzvFE7f5
	 8aQ2w5HKEvQuMYssihBwy9SRBWL+bdTQzqUCwhfYXzLmyzL3H5lnrq/XzWFX706IuZ
	 n0VPMjjJJ9tEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] power: supply: Add registration init callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720011144.1280219-2-vincent.cloutier@icloud.com>
References: <20260720011144.1280219-1-vincent.cloutier@icloud.com>
 <20260720011144.1280219-2-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:26:51 +0000
Message-Id: <20260720012651.82D0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Driver hardware resources tied to the parent device will outlive p=
sy on registration failure, causing dangling pointers.

Pre-existing issues:
- [High] Missing cancel_work_sync(&psy->changed_work) on the __power_supply=
_register error path leads to a Use-After-Free if changed_work is queued.
--

--- Patch [1]: [PATCH v2 1/4] power: supply: Add registration init callback=
 ---
commit 7157b5979312471cbd162dd14b7a0dbf059d5a5a
Author: Vincent Cloutier <vincent@cloutier.co>

power: supply: Add registration init callback
   =20
Some battery drivers need to consume monitored-battery data before their
power_supply is visible. That lets them prepare hardware configuration from
parsed battery information without racing userspace exposure.

> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
> @@ -1624,6 +1624,14 @@ __power_supply_register(struct device *parent,
>  	init_rwsem(&psy->extensions_sem);
>  	INIT_LIST_HEAD(&psy->extensions);
> =20
> +	if (desc->init) {
> +		rc =3D desc->init(psy);

[Severity: High]
If a driver implements desc->init() to configure hardware interrupts or
timers that receive the psy pointer as their context, how are those resourc=
es
cleaned up if a subsequent step like device_add() fails?

Because there is no desc->exit() or similar teardown callback, the driver
has no hook to synchronously stop its asynchronous resources before the core
subsystem frees psy via put_device() on the error path. If an interrupt
fires before the driver's probe error handling runs, will it dereference the
freed psy pointer?

[Severity: High]
This isn't a bug introduced by this patch, but this change might make it
reachable. If a driver's desc->init() triggers an interrupt that legitimate=
ly
calls power_supply_changed(psy), it queues psy->changed_work.

If a subsequent registration step such as device_add() fails,
__power_supply_register() jumps to the error path and unconditionally frees
psy:

__power_supply_register() {
    ...
    device_add_failed:
    check_supplies_failed:
    dev_set_name_failed:
        put_device(dev);
        return ERR_PTR(rc);
}

The error path doesn't cancel psy->changed_work. When the workqueue executes
the pending work, will it access the freed psy memory? Could a
cancel_work_sync(&psy->changed_work) be added to the error path?

> +		if (WARN_ON_ONCE(rc > 0))
> +			rc =3D -EINVAL;
> +		if (rc)
> +			goto check_supplies_failed;
> +	}
> +
>  	rc =3D device_add(dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720011144.1280=
219-1-vincent.cloutier@icloud.com?part=3D1
