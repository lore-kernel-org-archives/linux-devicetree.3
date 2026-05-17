Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A182309AA
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028313; cv=none; b=J2AYVmSA7DHGWFEbP4FxUglJUPewfkjSOy8i38ULtBxLu7/dggrt8EI84k12W4gOIf3Y3THQx9wJYo5NSVan+czcP6kxKEUBhX1/R86bO1vucxYuilCc2/VOjZXn/cgL2AC8A7A49agE/ZdppApSCXKOd0umd7d5X9i4Vts70M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028313; c=relaxed/simple;
	bh=SKR2MDyGDa3EkCtr2B4DnFjna0oNOBS2u1fro1MX8pg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uIBMjDUOVsIITYd6F20OBx3nlLbO/NXfVmte82KJ7KJggEINij0seo5YUAo8oTgAPkJunmYJGbP+MLa/hlV12dcQsWLuzwQBM7b8VpzZAEoMBs3qSAtKKUF7AKMprNi+wE1WbzIzrmHzUIQ2L2IVHt0qhjFwqTg+zXG395TY+pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wg+uxRMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wg+uxRMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3318C2BCB0;
	Sun, 17 May 2026 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779028313;
	bh=SKR2MDyGDa3EkCtr2B4DnFjna0oNOBS2u1fro1MX8pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Wg+uxRMRvBNEkd8RNb3+mdLkHQYCEEu/RsPgFar5hb/MbDEaAPqoGLeOwZypMzXgu
	 eFyLIDLnZ/OQsYuaTNoTglzemdEeajXASyBV5Fm0Q+C3qK5I/cpO4DAXGg2gzYx4dE
	 2TZXwq6MmDdH9yu/atn4YiwBT/TiTlR2uha8UuTS7vmBOpKsBOfq9F0o08CQ3KdXRz
	 sUlxkajv+9qVdH6gC9h/fl1LpQpasRBzFSMXdwHAmvlL8m0+K6BiFelRLAgTawyrZx
	 XtIbnqOcatvbGTTiDPdMNtcrxh+rK/FULCXNZMD2OJAC6q7QP2OVUfERa5o8GFsgpp
	 vxjdHLAU/2gpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] riscv: add Siflower RISC-V SoC family Kconfig
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chuanhong Guo" <gch981213@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 14:31:52 +0000
Message-Id: <20260517143152.C3318C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Conditionally selecting the `ARM_AMBA` hardware bus based on the=
 `TTY` software subsystem.
--

commit 49824e33ae15603df7f899c7df0a4ab9b5f20eed
Author: Chuanhong Guo <gch981213@gmail.com>

riscv: add Siflower RISC-V SoC family Kconfig support

This adds Kconfig support for the Siflower RISC-V SoCs, including the
SF21A6826 and SF21H8898 chips. It defines ARCH_SIFLOWER, selects the
relevant T-Head errata, and conditionally selects ARM_AMBA for the UART.

> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index c174ac0ec46b4..9996591cd9dbf 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
[ ... ]
> @@ -37,6 +37,13 @@ config ARCH_SIFIVE
>  	help
>  	  This enables support for SiFive SoC platform hardware.
> =20
> +config ARCH_SIFLOWER
> +	bool "Siflower RISC-V SoCs"
> +	select ARM_AMBA if TTY

Should ARM_AMBA be selected conditionally based on TTY?

ARM_AMBA models the presence of a physical hardware bus, which exists
regardless of whether the TTY software subsystem is enabled. Even if the
PL011 UART is currently the only AMBA device on this platform, tying the
hardware bus infrastructure to a software abstraction might cause issues if
other AMBA devices are added later and TTY is disabled.

Would it be better to select ARM_AMBA unconditionally, similar to how other
architectures handle it?

> +	select ERRATA_THEAD
> +	help
> +	  This enables support for Siflower RISC-V SoC platform hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-sf21-topcr=
m-v1-0-438f2e0513ff@gmail.com?part=3D1
