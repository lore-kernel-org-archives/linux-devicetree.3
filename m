Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985584;
	b=eCoE7S4wjftol26YHeUv783hGg3nvTpgx31vVFi51/dYLt2LrHE4u0fR55Q0ubo0BzBh
	 2XOCR+nKIy9vWduL2H4Y/ai2eONtoAvIPChv1XbmRmdENvCHEch2dgbxHtqs46mvy83aX
	 oisy4foqbTDoFkZurNmjlzILDUC7VMCw7f3jUcg7pBFvcri8/e+RnWQF5hRqQSNLuVJrE
	 6ugIiT8ocuIG5FGV42iRrZ8Doa7Ex1GcaSZlB7lEfuqq4XSNd7LhJ8AnXR0qtFOO1MMN+
	 B0CrL7YcV9doo0kkt8tGGzi+4uKFFGwHB9rhqqM7Vy6LtjLinLtS9ednsDzy+GKA1fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985584;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2Ki9WbXI9WdqAjVBEc/hHwmzCYkFZHUJDhuGONhIyeE=;
	b=ZeVLTuWJTgFF/2dc3x7oHO3gTvu/hEsOF8+D6T11sxi7q8idVc8yNs0ilbwodwNkm9/0
	 m/Au7KQ7k5s5etP6Ud0AAV/MIK1YbSdkgJGl76ccLl7rYflMvocmtHsjYBxwM+ERveOHM
	 wmVJBVsj6rkmXR2NFQFEvhjmfrQV+E0Tksq/tM+2K0I6lRU5pyjH0mhF1uD99Y15wCQcM
	 WAvQO21hqL03tvBVIG3Of+WxObGqVDjtqA70Z0RE1ftWqwY8e7jjqVFUWDzQyMzh5JKod
	 YgCqfWrl/1z5zSI4eJ2f/c/qB92ISPTjroTaYIL03jUqL2qHJYAQuZ3FslGwKMLX1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpGWkcjE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482B606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpGWkcjE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A201F008A1;
	Fri,  6 Nov 2026 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985583;
	bh=2Ki9WbXI9WdqAjVBEc/hHwmzCYkFZHUJDhuGONhIyeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpGWkcjE1Vi2fwVu4fIZZTOJd9eSiaR0YIwXMNDl3axmtonT/TqWGtR6ddQwlAYRb
	 YF1CG4jPILViRurk7Gmm3vSrUoQoAQxI9/EeFJ/EHRGagpV9WRAnv+uImrJi4wbkEb
	 fnTXbzEsuNUfJT9lm2m0Org4ZqKJwYEvmNV+XUp2X9jvQFjOaDY4QMiq+yEjQ5lvmo
	 to4y1DN2g6JD4As3LUNocnHTq8GLhbl1M1zg4Ls3TNyO2sxt5TdPKmujw+rVzOH99D
	 bKOagYGVsGxezzqssOvHsaPsVgfkdO4wnxPd6osnQihcAF9tHxbLe7tLtvE55TYU3f
	 VDQb0ktRxF56g==
Message-ID: <sashiko-outbox-201909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] fbdev: xilinxfb: remove the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106170902.3656809-2-radhey.shyam.pandey@amd.com>
References: <20261106170902.3656809-1-radhey.shyam.pandey@amd.com>
 <20261106170902.3656809-2-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:19:42 +0000
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
- [Low] fbdev: xilinxfb: stale CONFIG_FB_XILINX in microblaze
  mmu_defconfig
--

commit dc9c5a7ca88a79ff63fa682655927a4c3e97e183
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

fbdev: xilinxfb: remove the driver

This commit removes the obsolete xilinxfb framebuffer driver along with its
Kconfig option and Makefile entry.

> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index e8cd8cb76874b..50673b83cb857 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1620,15 +1620,6 @@ config FB_PS3_DEFAULT_SIZE_M
>  	  The default value can be overridden on the kernel command line
>  	  using the "ps3fb" option (e.g. "ps3fb=3D9M");
> =20
> -config FB_XILINX
> -	tristate "Xilinx frame buffer support"
> -	depends on FB && (MICROBLAZE || ARCH_ZYNQ || ARCH_ZYNQMP)
> -	select FB_IOMEM_HELPERS
> -	help
> -	  Include support for the Xilinx ML300/ML403 reference design
> -	  framebuffer. ML300 carries a 640*480 LCD display on the board,
> -	  ML403 uses a standard DB15 VGA connector.
> -
>  config FB_GOLDFISH
>  	tristate "Goldfish Framebuffer"
>  	depends on FB

[Severity: Low]
Should CONFIG_FB_XILINX=3Dy also be removed from
arch/microblaze/configs/mmu_defconfig?  Leaving it there triggers an
unknown symbol warning when configuring mmu_defconfig with W=3Dc.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106170902.3656=
809-1-radhey.shyam.pandey@amd.com?part=3D1
