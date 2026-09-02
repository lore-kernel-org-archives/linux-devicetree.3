Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC54AFE14
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388748; cv=none; b=NoZB5dR3t3MLYpfYS+e6y2uFTZqMj7NDZWoIGQE7yg8m0yEH6uNzHn7KQSdHwU0+gHGIgdzzQ0XhheJnWvd/uRM8VMemX41/0/BRVUFYGAGpvKFvtGFjZ2PmaX4MsjSGRKl2YcYdiedeDvj7thyjroP1ii35EjGvCBc+VW38GOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388748; c=relaxed/simple;
	bh=rRCeyym43vIQBGWZiSC8vSBDbFgjHQIdebBK3IZSF88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GYrmsCctEIFOTvBRS/hPY1XvA2NQl5fqX3bgOLVE+T473pNHts3bnVmghR0Dc0ZXGGUitxmZLr6V8+TsQ55D6c9yuXotyBLGsgW5xqBAM85jucljb/B99k6NrbeFnDkgLnZreIK8H1nnaBe0rNuRgL7hmp65tzXAWpefzffLuaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXrYrkxw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXrYrkxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426361F000E9;
	Wed,  2 Sep 2026 22:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788388737;
	bh=yuz4K3o7DquyNg6wVIBBhI2UgcUS9zue++7vN+1rxws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXrYrkxw3QPyl3VjGBsDOldH3K5yq08c7X6LLxIR0PjkINxlRQae+AOuFE0Jqr6LL
	 X+2MqMITq96/72ZCsCNpd6zKYH3/zNrJTluiVBQLvZQSg+A/UsuDxUKiijXMJzs1QG
	 8J8+rOGXpYllsw7sH2Cbk17RArq4WjC+iMvzmOoxLUfg46u+BvpAavlQIq3ol+Eo19
	 rxKSFX6hdsmiaGBTW7I69YQ0vrRJ/aA3g2KIfPwV+duko5349V4QKp5MDtw3U54Z7R
	 OQuibOpmCUuATqm6bpnEbh08qEo8qZ5zIuTu9OQdDsE6LCOyUIGQTbjOydAGFX6Doo
	 9Onq9xMxiWxGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902222759.736124-3-jm@ti.com>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 22:38:56 +0000
Message-Id: <20260902223857.426361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Kconfig change fails to enforce the 'must be builtin' requiremen=
t for K3 architecture.
--

commit 748ef11d98132dda0086b8cea5abfe1449a55b52
Author: Judith Mendez <jm@ti.com>

nvmem: uniphier-efuse: Enable for K3 SoCs

This commit adds ARCH_K3 as a dependency for the UniPhier eFuse driver and =
sets
it to default 'y'. The intention is to ensure it is built-in to support ear=
ly
probe of k3-socinfo during boot.

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
Does this configuration actually guarantee the driver is built-in?

The commit message notes that the uniphier-efuse driver must be built-in to
support early probe of k3-socinfo. However, because NVMEM_UNIPHIER_EFUSE is=
 a
tristate option, using `default y if ARCH_K3` only provides a default value.
It leaves the option vulnerable to being configured as a module
(CONFIG_NVMEM_UNIPHIER_EFUSE=3Dm) by users or automated CI builds like
allmodconfig, which would break the early boot probe dependency.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902222759.7361=
24-1-jm@ti.com?part=3D2
