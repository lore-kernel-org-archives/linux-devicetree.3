Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77130DEB8
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778623951; cv=none; b=Ii3QEb2xCHLnrDFYaKZxoPt2a/7biBi3RD69AR6QLv+MK8xNLBU/5m27YUbAujoPltoqyb/+L6lJboLe33kJHQLPnpu9RHqdTB+BnQ/ZM3ch10NDl8PSNBBXQmLO4NlePWUjQh/ngfs8Xtq5+P88T/dv/I+F48K8BrOOKzUTcpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778623951; c=relaxed/simple;
	bh=iNMxP1s5c8IThpWR6iKe1vcSFSILY4KBvtW/467lg4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nzFAzBeZ/EmcasWXdI3S/6GtOO1gbUk/jBEuMAL+GVBa3+MYrmTp+JyUYUWmGEVCatj9DHCJ/uNCNt7hVsw0oVaaGW2qMTf2etdhc+z5qgy4VSjpnYxDqxEEsQLDdEQ8ZH8ppQUh26N4/oSy3kqPFb76iKi7+Acy3kEcs1zGtb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhETj8/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhETj8/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2876FC2BCB0;
	Tue, 12 May 2026 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778623951;
	bh=iNMxP1s5c8IThpWR6iKe1vcSFSILY4KBvtW/467lg4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RhETj8/Z8A9J5Yig6YC6yY8v0UAEBtrqh5E6ER4O8aORhD3CEtaz+eCXeUbIuPGi3
	 lopXfdVszU8OqemUPuttfXVkdCf5/8vtiXcWRvNAo/kNBlp4SdEgsJQzAVxI1GncOg
	 /kPoA45IwvDzzRSOUnDxht4GOfYZyhSnyfsX99SRYOVwBpSz62BE0zEF1S/aetyr6W
	 HGQj9N3AHdlyOIRvbIDeXzX2ILzxt3w8gwWKEf6jvwKVQrDXc2RPMQSzwqxRX/22Vc
	 776b52IcCFifE+OWSsvwCf5XKRgsZ0lmF3PWT12abl5pCYwejPG51N4fbWlWx2/LB+
	 fW3VbQmnf2vtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] bus: simple-pm-bus: Populate child nodes at
 probe
Reply-To: sashiko@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511155902.34534-3-herve.codina@bootlin.com>
References: <20260511155902.34534-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 22:12:30 +0000
Message-Id: <20260512221231.2876FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch resolves fw_devlink corruption for transparent buses mat=
ched via `of_match_table`, but fails to apply this fix to transparent buses=
 bound via `driver_override`, leaving devlinks broken in that path.
--

commit 428668c33cfe17b55dfc398a9e43567a082e1c3e
Author: Herve Codina <herve.codina@bootlin.com>

bus: simple-pm-bus: Populate child nodes at probe

This commit modifies the simple-pm-bus driver to populate child nodes
during probe for transparent buses matched via of_match_table. This prevents
wrong or missing devlinks when fw_devlink assumes a bound driver will
populate its child firmware nodes.

> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 4b2a793dfbd90..d969bf19a4e95 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -42,14 +42,15 @@ static int simple_pm_bus_probe(struct platform_device=
 *pdev)
>  	match =3D of_match_device(dev->driver->of_match_table, dev);
>  	/*
>  	 * These are transparent bus devices (not simple-pm-bus matches) that
[ ... ]
>  	if (match && match->data) {
>  		if (of_property_match_string(np, "compatible", match->compatible) =3D=
=3D 0)
> -			return 0;
> +			goto populate;
>  		else
>  			return -ENODEV;
>  	}

Does this leave fw_devlink corrupted when the driver is bound using
driver_override?

Looking at simple_pm_bus_probe(), there is an early exit for driver_override
just before this block:

	if (device_has_driver_override(&pdev->dev))
		return 0;

Since it still returns directly instead of jumping to the populate label,
transparent buses bound via the driver_override sysfs attribute will skip
populating their child nodes. This seems to trigger the same wrong
supplier assignments from fw_devlink that this patch intended to fix.

> @@ -78,7 +80,7 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
>  {
>  	const void *data =3D of_device_get_match_data(&pdev->dev);
> =20
> -	if (device_has_driver_override(&pdev->dev) || data)
> +	if (device_has_driver_override(&pdev->dev))
>  		return;
> =20
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
> @@ -86,7 +88,8 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
>  	if (pdev->dev.of_node)
>  		of_platform_depopulate(&pdev->dev);

If the driver_override path in probe() is updated to populate children,
should this remove() function also be updated to depopulate them?

Additionally, does checking device_has_driver_override() here risk unbalanc=
ed
cleanup? If userspace modifies the driver_override sysfs attribute after
probe() but before remove(), this check could evaluate differently during
removal. Since of_platform_depopulate() safely ignores unpopulated buses,
would it be better to call it unconditionally?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511155902.3453=
4-1-herve.codina@bootlin.com?part=3D2
