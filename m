Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539947;
	b=ZZHYVqknTUHuNFIc3rd6C5qVseonRAOzRK/DC56L/wqVKsU5VW0puHpFoJePT29gJ5dS
	 aidgIrPvGyQWqsvHEcQlx5dPba0N7a7l7D5Sr+nWKSZW16geUe0VGSBkoOViwV38eoggk
	 ZwLUoj00QwPRNRCcnNnb/aJPd0Mei87iClqRAJp0O0uskVZJrYHSkrTQ3WO2c3YQ6YnXg
	 PG5uhL5KlJUZNeRU04dT4BLvy62EIBA0ObZ6vd7E6cUovEVQvYAr6I87xK5gXt+OYsJhh
	 vkEQYu4U0IXIdFYdLEsUBZO5ybjSS3kLi4UKeVOBxa8PR4gHMY6DObg6YwsFwrnO+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539947;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sGN+vzHsTS9eameiillVOk0aHhR4m8YSfsCeWJTfQ6s=;
	b=Qi6YRxWDAyajSWkefYm6TGfbgbBxm9QN4rtAyYloU2vGtHYdl6BwieV1UexZeyDAfn9B
	 aZdO+jlEZOlIYYsmGJB9Hl7cA9qdinCxaRIOjl9oZqxyecwDpf7AaTpvCEFBDCpH3WmXw
	 4qNtnohC+ym8bw9h4uUTwCYnVTwHogAU96GX/Y4CCLevJ548/2B7vrGvxcnUJMFEXNz2K
	 5Ywwa8hLRY2tGQlXUr4S818/qTfk3EDRLlh35nEcOh6ZK1YwNnTWbMAHWsEksaMldK/oT
	 b3gjsW31yz4ffmE8i0Atb25N2Nag3WxrfA+B1YR+1ti7TIbzJar7d9lSFy+9EAZP6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SGJz1RB/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744D4606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGJz1RB/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AA51F000C4;
	Tue, 24 Nov 2026 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539947;
	bh=sGN+vzHsTS9eameiillVOk0aHhR4m8YSfsCeWJTfQ6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SGJz1RB/wFlcG5rzXB7oY+EXoZumM7Csnmwqtec2vSYby9ABOxSskqo8MoTVy5bD2
	 4c76Xikg5Is9fZwq9W/cVxihuSmepWSW0UlROwl0SX+fRyJd9SiauBXGGIMeJj4ymY
	 ldhSUyPD1tSTR6xqUYjbrvlInXd+TtKuGIhYcgMOmZ/EimdKxrGkLOJGag7CtQA6ss
	 RB4k+Ew80ODZTzmV9i19u66+vFr5DpAA+479GemDDCyPcfNOHNX0Gm9JEHOc1WOk1Z
	 rF/ZnOJ9GuS7HtgpzIm3yNabQyfo7xl0xYThUZudeymbcJQgBdVdjeDo0hw+rJEoFc
	 EW+Xkqjj2pJuw==
Message-ID: <sashiko-outbox-231653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/10] nvmem: stm32: add TAMP nvmem driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-upstream_nvram_reworked-v6-3-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
 <20261124-upstream_nvram_reworked-v6-3-ea0cfccc20b0@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:05:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] nvmem: stm32: missing HAS_IOMEM dependency on NVMEM_STM32_TAMP
--

commit a806b31692fd854346ba32a0d69cc117ecaf99c0
Author: Simeon Marijon <simeon.marijon@foss.st.com>

nvmem: stm32: add TAMP nvmem driver

This commit adds an NVMEM driver to expose STM32MP1 and STM32MP2 TAMP
backup registers as NVMEM cells.

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb236663f..a0675f89015c0 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -516,6 +516,17 @@ config NVMEM_STM32_ROMEM
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-stm32-romem.
> =20
> +config NVMEM_STM32_TAMP
> +	tristate "STMicroelectronics STM32 TAMP backup registers support"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	select MFD_SYSCON

[Severity: Low]
Should NVMEM_STM32_TAMP also depend on HAS_IOMEM?

MFD_SYSCON is defined inside an if HAS_IOMEM block in drivers/mfd/Kconfig
and selects REGMAP_MMIO.  On COMPILE_TEST builds without HAS_IOMEM (such as
ARCH=3Dum with CONFIG_NO_IOMEM=3Dy), selecting MFD_SYSCON triggers an unmet
direct dependencies warning and causes build failures in regmap-mmio and
syscon.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream_n=
vram_reworked-v6-0-ea0cfccc20b0@foss.st.com?part=3D3
