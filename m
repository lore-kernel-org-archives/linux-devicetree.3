Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD53D8127
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009913; cv=none; b=sm1x5SDG+/NxzfpJw9Jy+XShnYi6TQgvqjIbYoM3nUQfn6Q2956ijsfEllt3vRv7uwSnrf2qR4zT/mWk7ycOO3GEAAX/GbQKcHn1/Sn1Kt/tzihtPWebxiBjvRPdR96TI4Ciel3x7XaCaNZjys6a2/FsHfUrTQFItgX/foloYpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009913; c=relaxed/simple;
	bh=MMmAPCBTyEyY9w3T5QVpo1kwrZ/FpHpt9Y1Anf856DQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oxLULU/8vfME2HaQAwec+pXJ5aV7CPHPsfeSp8Fpsof4uR9wu+2Xxxv+kTfEjxu29vUDgfXQreIdOVCnvE3iaaFuOknuq1+4Bdtm3kKAEAarsfbLo0j63mHaukm9DMVwNZsi7S89wLaVfPEvCY4KIc+EGCe490IFqASwGe9yycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4bIjvQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4bIjvQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811981F000E9;
	Thu,  6 Aug 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009909;
	bh=nv72ZOaFrFSo8VzxCXPiLoQa8HJ0WDmnDl5ORiG85io=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4bIjvQGtPTcTbpZDl4bvZD1p46bArq+1PB+vJT78R+M0ZM5nysXEqkUYQWdlUtMb
	 BQMyLplVVo4g208Tbp2asNzfz96R2RYw1uUgblFEDpLuLzj3jV8+aECmGMTK4AAlyb
	 TpZHEumddC+zhndgt8Lzuu429Q7GcPV6qQk7XPoNkjAobWYncsiBt5WjokQtfLDf7Z
	 5PKD32DIFQPHuXiPdHhBQ7Jecs5jOtImdc2F0YYXOxZkezo+K2h/B7bkuQyj9ue5Ca
	 2hXPS67vqMLVkMDdUZJSiPUy5g8VVU5Mo7fnhuJ57SAG/yRISDmP/TukG2/g3kq1eW
	 JKqxZ0IHOnWIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/10] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-9-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-9-6b09707c5fe9@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:51:48 +0000
Message-Id: <20260806095149.811981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARCH_AMBARELLA selects non-existent 32-bit ARM Kconfig symbols (ARM=
_PSCI and HAVE_ARM_ARCH_TIMER) on an arm64 build.
--

--- Patch [9]: [PATCH v2 09/10] arm64: ambarella: add ARCH_AMBARELLA and CV=
75 EVK DT ---
commit 30d61a45a9c8eee14cc764b1f10b92bd0992454f
Author: Long Zhao <longzhao@ambarella.com>

arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT

Enable the Ambarella ARMv8 platform Kconfig, add the CV75 SoC and
EVK device trees, and select the Ambarella UART in the arm64
defconfig for console bring-up.

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..166430ddb3c93 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -26,6 +26,15 @@ config ARCH_SUNXI
>  	help
>  	  This enables support for Allwinner sunxi based SoCs like the A64.
> =20
> +config ARCH_AMBARELLA
> +	bool "Ambarella SoC family"
> +	select ARM_PSCI
> +	select HAVE_ARM_ARCH_TIMER

[Severity: Low]
Are these Kconfig selections intended?

The ARM_PSCI and HAVE_ARM_ARCH_TIMER symbols appear to be defined only in t=
he
32-bit arch/arm/Kconfig tree and do not exist in the arm64 Kconfig. Because
they do not exist here, selecting them has no effect.

The 64-bit equivalents (ARM_PSCI_FW and ARM_ARCH_TIMER) are already
unconditionally selected by the top-level config ARM64.

> +	select PINCTRL
> +	select PINCTRL_AMB
> +	help
> +	  This enables support for the ARM64 based Ambarella SoCs like CV75.
> +
>  config ARCH_ALPINE

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-longzhao-u=
pstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com?part=3D9
