Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0F6223323
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432492; cv=none; b=qsCWgArdgNRmAqYjHAAxr0rGOAGmkCKhwHNWRE01OVHHwUYZHSFKh3y4KSY1gYKWKsZZMZ5fp6ZyJaEknrg3r2KoyfU3ANkwoL/DgOYyd9iSvvcxJM5nkOXosdGnsE4/QsAcfuVp8Uh7iRl6vn1OneRUi7yd6pKbiSyZcT5KEWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432492; c=relaxed/simple;
	bh=vWzIfiNfCxxIcs6sbxjGi0QwSEMRtRQdhlZtYbOJmp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L5lMdHDPladUGqlmqoh2pECsBxMNuFS/SZFfO/G01+wdFOd3cBC/CCRFu/ZxUCVQCQs6/USs3Y8/2h7cmlxtonO49DlT68j3Oz77Q91IWXw9oVilsA9id0brDFGFnzUcawqiwy1Lsuf2jFpKVIvW2IfIO2RRwDrCD1kcjjnmSd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/tQy6OA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/tQy6OA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37981F000E9;
	Fri, 22 May 2026 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432490;
	bh=IiAkI3khKkmrBEFVL2qOX+ug5MYWajI6wuZ/hWQZvEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m/tQy6OApjlnB2TwlPDdF2sqO3jiSZt61jT7LfFWIDiyqi4O9CBx/Zx/Cuk1XGRfQ
	 YEQCnV23SYugj02xIrM3BY7IWI23bJtjpMCo0hokQ9IlzjK34pEosaHyPoRJ/LhhUe
	 RgapQktSTBi7vTBlAAR+6xSTjx5755iRAMtbBbdvjTQHHvYsSqRaMen18mb3iAm4Ky
	 CCdm1oRFB/Sl59jPtCdv+RAX+2fBvJSiqqEOfvpHmQob4Q1dgk8+6JiCiOJztwvXg3
	 IbqRT9bWxQV4ovnqNjYEfqXYoEI53vIvqrG8HTrQdGtucvp4+NjHQ3x5rLP7QQ7L7l
	 //dkXd5zkzpsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is
 managed by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3JhaGFtIE8nQ29ubm9y?= <graham.oconnor@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522060645.4399-2-graham.oconnor@gmail.com>
References: <20260522060645.4399-2-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 06:48:10 +0000
Message-Id: <20260522064810.A37981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Returning early from the probe function bypasses the initializ=
ation of critical locks, waitqueues, and list heads, leading to kernel pani=
cs when RPMh APIs are invoked.
- [High] The early return completely skips `devm_of_platform_populate()`, p=
reventing essential child devices from probing and permanently breaking the=
 system boot process.
--

commit 42c9f85b1ee98ffd687b17f97edf46cb0e222ced
Author: Graham O'Connor <graham.oconnor@gmail.com>

soc: qcom: rpmh-rsc: Skip TCS init when RSC is managed by firmware

This commit skips TCS initialization in the RPMh RSC driver when the hardwa=
re
solver is already active. This prevents security violations and system rese=
ts
caused by reinitializing a controller that is actively managed by firmware.

> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c

[ ... ]

> @@ -1074,6 +1074,20 @@ static int rpmh_rsc_probe(struct platform_device *=
pdev)
>  	else
>  		drv->regs =3D rpmh_rsc_reg_offset_ver_2_7;
> =20
> +	/*
> +	 * On some platforms the RSC is already managed by the firmware
> +	 * when the kernel boots. Calling rpmh_probe_tcs_config() in this
> +	 * state would reinitialize the controller and cause a security
> +	 * violation. Skip TCS initialization if the hardware solver is
> +	 * already active.
> +	 */
> +	if (readl_relaxed(drv->base + drv->regs[DRV_SOLVER_CONFIG]) &
> +	    (DRV_HW_SOLVER_MASK << DRV_HW_SOLVER_SHIFT)) {
> +		dev_dbg(&pdev->dev, "RSC already managed by firmware, skipping TCS ini=
t\n");
> +		platform_set_drvdata(pdev, drv);
> +		return 0;

[Severity: Critical]
Since drv is allocated with devm_kzalloc(), bypassing the rest of the probe
function leaves essential software structures uninitialized.

Specifically, spin_lock_init(&drv->client.cache_lock),
init_waitqueue_head(&drv->tcs_wait), and INIT_LIST_HEAD(&drv->client.cache)
are skipped.

Because platform_set_drvdata(pdev, drv) exposes this controller to other
drivers, will standard RPMh APIs like rpmh_write() crash with a NULL pointer
dereference when attempting to acquire the uninitialized spinlock or add to
the zero-initialized list head?

[Severity: High]
Does this early return also skip the instantiation of child devices?

The rpmh_rsc_probe() function normally relies on devm_of_platform_populate()
at the end of the function to instantiate its children. By returning early,
crucial child devices such as the clock controller (rpmhcc), power domain
controller (rpmhpd), and interconnect voters (bcm-voter) are never created.

Will this leave downstream peripheral drivers that depend on these clocks
or regulators permanently stuck in an -EPROBE_DEFER state, breaking the
system boot process?

> +	}
> +
>  	ret =3D rpmh_probe_tcs_config(pdev, drv);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522060645.4399=
-1-graham.oconnor@gmail.com?part=3D1
