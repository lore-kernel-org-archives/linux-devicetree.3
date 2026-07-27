Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30275299A84
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115735; cv=none; b=loT12kbD1XnQ8mV1YqbjHBpmaVf64Q1rMtQnYaVshKfqbO9QF1IuHdb4FPDkudHLDwpPquC8MA4IDBovWV2rgNs44H+4rYvx4CycWoZI6CkOYc+mddYqMss199Wp4qMh/zcJnzH4zwDtjbvsnR2NERP6PyKHJ+y/bkrenzLlgfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115735; c=relaxed/simple;
	bh=H/bhwAaxesSmWbxz5mOJx9VttJgEdXEm0iZZosETtIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J4ciP8KRcfCO6gNr23iMRNIzLwca+1Aep479rfWAWIWAH5Y+s7s29dCp8CVW1hOXaBO0tSgZdSPAasSeCDLIjrf9bG2AcqsgR5n/LcLTHQZx9FnSnevbloCKGVHQMywbZ3IxfH0lLFkoPz5cBvK0kU76KWjelxH1WFbJL5Hw0rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT4+FyBQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT4+FyBQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8764C1F00A3A;
	Mon, 27 Jul 2026 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785115733;
	bh=M3Zr503fUyjiBJGpP2G3q3gIlXuXm0X6gsGOjjbO4A0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dT4+FyBQQwNY/TaWd2/tadkyxqBuyvGecBPreaF8VNW4sXZBn8zrNvAl/eJwecPaL
	 pxWk6oYV4zXvqp1Uj1fqIC0Q9DDfgyEZQAlszAgLRtrxosstcaB1pNSGEMMIBZfhfP
	 2KE7k+bAse5duEU7blznOSaJh8Tn10BRytbOA98LKdyA1dHpoq/6ENN/uSwT85Q8eP
	 uFLlGrBsrgG1/YndSob624x4WAkFz/W0OvMAOsx1P3CuWYbsQj3Bq3LoLcuPQX44lk
	 TLrOSLv20MjAhXOHGdW7ngrnoWQH50ZJjo0x7c+WZ0rSD98Iz8uRxyAh06cK7Ycvor
	 2641nbyZ7H8XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/11] power: supply: Add registration init callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727011319.621794-2-vincent.cloutier@icloud.com>
References: <20260727011319.621794-1-vincent.cloutier@icloud.com>
 <20260727011319.621794-2-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 01:28:53 +0000
Message-Id: <20260727012853.8764C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of `psy->changed_work` in `__power_supply_register(=
)` error path.
--

--- Patch [1]: [PATCH v4 01/11] power: supply: Add registration init callba=
ck ---
commit 91f996f8711a8d5770312f212add1d5d3cecfc83
Author: Vincent Cloutier <vincent@cloutier.co>

power: supply: Add registration init callback

This commit adds an optional registration init callback for battery drivers
to consume monitored-battery data before their power_supply is visible.

> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
> index 2532e221b2e19..3ed4c253706f3 100644
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
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
> +	}
> +
>  	rc =3D device_add(dev);

[Severity: High]
This is a pre-existing issue, but does the error path handling after this
device_add() call lead to a use-after-free of psy->changed_work?

If device_add() succeeds, the device is published to the power_supply class.
Another thread can then find the published device via
power_supply_get_by_name(), take a reference, and call power_supply_changed=
(),
which queues psy->changed_work on the system workqueue.

If a subsequent initialization step in __power_supply_register() fails
(such as psy_register_thermal), the code jumps to the error path:

register_thermal_failed:
wakeup_init_failed:
        device_del(dev);
device_add_failed:
check_supplies_failed:
dev_set_name_failed:
        put_device(dev);
        return ERR_PTR(rc);

This drops the local reference to the power supply structure via put_device=
()
but omits canceling any potentially queued work with
cancel_work_sync(&psy->changed_work).

Once the other thread drops its reference, psy is freed by
power_supply_dev_release(). The system workqueue will then dereference the
freed memory when it executes power_supply_changed_work().

>  	if (rc)
>  		goto device_add_failed;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727011319.6217=
94-1-vincent.cloutier@icloud.com?part=3D1
