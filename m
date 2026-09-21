Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067644FC346
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027503; cv=none; b=fEmsxosq5vSf9QM+Z5Dxcz7YZqf+n+REuqivOPubrlh+O5vdQ2baW4ZArYJtRe17v01XXfeQuOXO1OkNQtb/ygOTPGUpi2jMXKH7w6JwovCR8EFYEhDwL4mQ4klJi2Npfwlhn+juMHHgw1/OpcKcywtvPghDzhXPHUF3g94CPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027503; c=relaxed/simple;
	bh=3ClaDGJwRS/xZr78n8DU2uW+0pUP5hhp/Uo21DghqoQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jso03PaQcVInw0oGVf7uDTJ2ExjKKfpYltqFs9Ee347W4AYXdFeWE10SzRpM/34oizsMPlM5hU4C45XTlwSDp1XAxlKNGnWgOHL53FylPersqryo3y35f1DSc06RLEMGruyp3eswcGiaJ5mGbD18mrBXpAwz+8o+VfueSG565eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJAlQCT/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJAlQCT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3451F00893;
	Mon, 21 Sep 2026 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790027501;
	bh=YSM7YPFVAqQE5khMiM0zQ+k//cROwFYSMB+gXgqbY/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJAlQCT/ae6JjuHnhvZS8ZJ/+RSxQGXjEJB+Ke9mJotjknVCcq6MW4CwR+xIdk11j
	 1gWuW/1qjJnWj3ugM9T0O/HzwDT95/UXZPwdN1/zbknea1xIseMCTmTYnXejLi1Qa0
	 NGQ8VZKmyUlRMZ5F3yGvcnYM3QCoXR2XAnL1HYE+xrz3qsc2/j1cH8laVwLULvu1J4
	 JOw/MJED/rLxJplJ7m2AQZVofGo/MVkReiQ48Ypnn/ZWY1F0N0LOIL+D9Sbql1Ljd7
	 /2GaFhLUMIBY7lFpqs6XtsiXRc2BHHBMKW3PFnn97QaM4JagJUmovWSiV7al1mTpt4
	 5ooI9XCXdleUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260921214133.16519-2-rosenp@gmail.com>
References: <20260921214133.16519-1-rosenp@gmail.com>
 <20260921214133.16519-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 21:51:40 +0000
Message-Id: <20260921215141.5B3451F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: bcma: teardown ordering violation in bcma_hcd_remove()
--

commit cdbc43989b0d2d3446fd86aaaa77bbc9306cb391
Author: Rosen Penev <rosenp@gmail.com>

usb: bcma: add regulator support

This patch adds support for the standard regulator interface to provide
VBUS supply to the USB cores. It reference-counts the enable/disable
requests, allowing both controllers to drive one GPIO without conflicts.

> diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
> index 519386255886c..0d5a220b69880 100644
> --- a/drivers/usb/host/bcma-hcd.c
> +++ b/drivers/usb/host/bcma-hcd.c

[ ... ]

> @@ -442,6 +464,8 @@ static void bcma_hcd_remove(struct bcma_device *dev)
>  	struct platform_device *ohci_dev =3D usb_dev->ohci_dev;
>  	struct platform_device *ehci_dev =3D usb_dev->ehci_dev;
> =20
> +	regulator_disable(usb_dev->regulator);
> +

[Severity: High]
Does disabling the regulator before unregistering the platform devices cause
a teardown ordering violation?

In bcma_hcd_probe(), the initialization order is followed: the regulator
is enabled first, and then the child platform devices (ohci_dev and ehci_de=
v)
are registered.

During driver teardown in bcma_hcd_remove(), this order must be reversed to
ensure that dependent drivers are unbound while the hardware remains powere=
d.

When platform_device_unregister() runs, it invokes the child drivers' remove
routines (e.g., ehci_platform_remove()), which perform register accesses to
cleanly halt the controllers. Since the regulator (which may power the PHY
or controller logic) has already been disabled here, will these register
accesses target unpowered hardware and trigger synchronous bus errors?

Should the regulator be disabled after the child devices are unregistered?

>  	if (ohci_dev)
>  		platform_device_unregister(ohci_dev);
>  	if (ehci_dev)
>  		platform_device_unregister(ehci_dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921214133.1651=
9-2-rosenp@gmail.com?part=3D1
