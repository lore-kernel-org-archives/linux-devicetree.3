Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF93C19D065
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780020171; cv=none; b=FdP6F+Ir6XM0IJ1CglnEG5+0aTbXcVlM9iLRzFLxif7UtrPJX0iYjNKAkwjfxlVO+OCV0KYh2b2LNta97bvJp4bypALf43a1dAhSTjmlIXxIDgDF0IhXBuDzG+iTdjgfdk+znMWf4+BOn/lskyYwdUxHo/hITvw/AzDe3L4wJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780020171; c=relaxed/simple;
	bh=8onlp06cGCwwVHG61NjrwG7y0Oz54xcAzGMdAI6p2QY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dx4TjkwhWqfwu0CYKhSlp+EvO+96LI9hlWPNT45oBXYnKivyfWo6mehyXfRGGAaWFQ15tjS4xyfLEhlFZsiOH1k+iXY72AZGkoQ51d5OKYLEMd86pnupya4sLWmyzcVp5xXLOQoQ4aXxZ3qeGdNCJL7m1ci6y4Eyh8EDrENRcNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+fCH3QU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+fCH3QU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830721F000E9;
	Fri, 29 May 2026 02:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780020170;
	bh=DnfuXXaZurMDm+t0QwVeV2NJtqqz/kbxsoMol8upQl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J+fCH3QUjHAu+8nlB2zWx+VI21qv52XXNjFURDB1YX4UQ/x0jsAjE+qwAE/NmV2Q6
	 LW8fkc6cu8sWokiNMh5aqHQVYyDgr6u8mVnlG+dA8Mt8h4WOIpAz/12ENojsc0j53S
	 cGLaVpeil/pxi5hZhWGCcrVQZOTFWdqgryyh1UBmACORrbnSqgGTV5v7ZAWSpPyzhh
	 r092BikC/Ojfoo/dllVXwijZVcKThq8G5wBy5xFgyZDQ4Lx3F1s6Hdqg4eO/flTZWO
	 hm88ldpZLt/79gk1PPVvE66spr7bMQzPUOXUNKxlHsjecGpwaGN8fE1J/WKUMtz48u
	 rstMjdso843lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] bus: add BCM6362 on-chip WLAN SHIM bridge driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessio Ferri" <alessio.ferri@mythread.it>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-add-bcm6362-wlan-v1-4-722242777f58@gmail.com>
References: <20260529-add-bcm6362-wlan-v1-4-722242777f58@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 02:02:50 +0000
Message-Id: <20260529020250.830721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `BCM6362_WLAN_SHIM` Kconfig entry selects `BCMA` and `BCMA_HOST=
_SOC` without inheriting their hardware dependencies (`HAS_IOMEM` and `HAS_=
DMA`), leading to unmet direct dependency warnings under `COMPILE_TEST`.
--

commit 1aef741e07978e7d0f4c1dd259cf899630d9e65e
Author: Alessio Ferri <alessio.ferri@mythread.it>

bus: add BCM6362 on-chip WLAN SHIM bridge driver

This commit adds a bridge driver to bring up the BCM6362 on-chip WLAN SHIM
block. It configures clocks and toggles resets, then creates a brcm,bus-axi
child platform device for the bcma driver to enumerate.

> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 3181d8aa32a3e..e992a34c52308 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -29,6 +29,19 @@ config ARM_INTEGRATOR_LM
>  	  Say y here to enable support for the ARM Logic Module bus
>  	  found on the ARM Integrator AP (Application Platform)
> =20
> +config BCM6362_WLAN_SHIM
> +	tristate "BCM6362 on-chip WLAN SHIM bridge"
> +	depends on BMIPS_GENERIC || COMPILE_TEST
> +	depends on OF
> +	select BCMA
> +	select BCMA_HOST_SOC

[Severity: Low]
Since BCMA depends on HAS_IOMEM and HAS_DMA (via BCMA_POSSIBLE), and
BCMA_HOST_SOC depends on HAS_IOMEM, will selecting them here without
inheriting those hardware dependencies cause unmet direct dependency
warnings?

When COMPILE_TEST is enabled on architectures lacking these capabilities
(such as UML), forcing these symbols on with select might trigger Kconfig
warnings or build failures.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-add-bcm636=
2-wlan-v1-0-722242777f58@gmail.com?part=3D4
