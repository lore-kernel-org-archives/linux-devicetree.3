Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7C3AEF55
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056380; cv=none; b=pfd4wDJ8pPrJqPz5e/+zovlM2UKrZWl4+bg5hUQCWNBlZr8tQORqsL15295rMsx6bGBwp9WnrEtNZtU62idYTSWdn07ZGMq9jNv4zfDw3hOXF/TtlQosqyPSFXxUOKJF2fXEepQViI6cZ5qVJs9t3tZhQ4wzs1xXiMLJq3hR784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056380; c=relaxed/simple;
	bh=IlRtRDl4+M5qv71rcxU6hSWFjP0pIP/wVw9GzAjtfxw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p9fiVuQw8f/B7JF46XSW41OK+PPX1m2IqNEaQwJzDdb1bg5qSWHvZOnTbMcEp/7x5CouvesJQOMoklTPCW63wd7TmDXDfwv5IV4BQGOm90u5E+zhTD6dBPEThcLmJyoyTdiVmOrc6A7kCPL3GruBejdMs0E5IO1F/BQysJyLiYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hz+Pu4Lc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hz+Pu4Lc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE291F000FF;
	Thu, 10 Sep 2026 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789056378;
	bh=0AtfxwHBE98zbAOm/Ne1MFL6Q7wrsabwhXz52xhn/cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hz+Pu4LcVzzm4NW4WOHgnjNSzIv7NxONsx81SZV0xQfued+QFB07FbZA1vHYI6lC+
	 OG05YsZdtb64hdsOEUETEl1yvRy9bdlZ4i1R6p/4kW16Pi1CI8YyIpqY79UcVaM0N7
	 vpGhuMCRwQJW/gl3XbbD4R3LVSBKLd+lKi/xJgODVQxk5texGaoJrVs03Y4DMvpbDP
	 gkaVRutxcav3KkrhrvoaqaydJJbnEtL8RwGppGfiR6hu4PilZg7nNR2jzP6DJ7zMid
	 grdxF4EbXutMzYobYfcke673TW9XQFcHzIB/ecwUlHnxrMcE6J1eTGEQ1ymcypAqnE
	 qaiYJQYV9Tezg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910155509.1425682-3-jm@ti.com>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 16:06:17 +0000
Message-Id: <20260910160618.5AE291F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Kconfig tristate allows module build, violating the "must be bui=
ltin" requirement
- [Medium] Initcall ordering mismatch defeats the early probe requirement
--

commit bf414bd455e78f29d0ed967ddc65ad76226003fc
Author: Judith Mendez <jm@ti.com>

nvmem: uniphier-efuse: Enable for K3 SoCs

This commit adds an ARCH_K3 dependency and sets the uniphier-efuse driver to
default to y for K3 architectures. It intends to ensure the driver is built=
-in
to support early probe of the k3-socinfo driver.

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 283134498fbc3..192e9617ec472 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -376,8 +376,9 @@ config NVMEM_U_BOOT_ENV
> =20
>  config NVMEM_UNIPHIER_EFUSE
>  	tristate "UniPhier SoCs eFuse support"
> -	depends on ARCH_UNIPHIER || COMPILE_TEST
> +	depends on ARCH_UNIPHIER || ARCH_K3 || COMPILE_TEST
>  	depends on HAS_IOMEM
> +	default y if ARCH_K3

[Severity: Medium]
The commit message states the uniphier-efuse driver must be builtin to supp=
ort
early probe of k3-socinfo during boot. Does default y actually prevent the
symbol from being configured as a module (m) when ARCH_K3 is selected?

If a user configures NVMEM_UNIPHIER_EFUSE=3Dm, the driver will not be avail=
able
during early boot. To enforce a built-in requirement for K3 while allowing
modules on other architectures, should this use a dependency like
depends on !(ARCH_K3 && m)?

[Severity: Medium]
Even if the driver is strictly built-in, will the uniphier-efuse provider p=
robe
early enough for the k3-socinfo consumer?

Looking at how the uniphier-efuse driver is registered:

drivers/nvmem/uniphier-efuse.c:
    module_platform_driver(uniphier_efuse_driver);

This expands to device_initcall.

However, the consumer registers earlier:

drivers/soc/ti/k3-socinfo.c:
    subsys_initcall(k3_chipinfo_init);

Since device_initcall executes after subsys_initcall when built-in, won't
this force the consumer to defer its probe? Should the uniphier-efuse driver
use an earlier initcall?

>  	help
>  	  This is a simple driver to dump specified values of UniPhier SoC
>  	  from eFuse.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910155509.1425=
682-1-jm@ti.com?part=3D2
