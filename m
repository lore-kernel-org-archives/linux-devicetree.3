Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E51367F32
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813975; cv=none; b=h/GagQ/0G3DhIxIg3bVKGyBJXk+mp/lsOCarSqDq/sGT6rG+V6hMRMP8mvi3Zv0ost8oLNYE3oHlTpjN/Kas7DZE8Xf0Aqf/5jW0MaEvLzZR8pCeYxN+YF25rGQse5uWgZKj0F/1nNzP1A/Tk6GEi2HQdgCmKGOGBTK5x1iXRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813975; c=relaxed/simple;
	bh=pUTk3ydnIT5LntkJABWxPFqKPRtGtKpnosg/iGAwQVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VjlJTk29LUtsDUSjhXPJcaU/PK14YOxES52lxLB6TSjCKw7gNNeedyV48IaSf40nqZBvcTP2L0biekLs1xFtjltQvS38nvM5C+jbxR19EruCJ/ynsqxgFeYxaCF3PaFYlAFaw7c7IMV0++gqBAjIvIbtNo0zUhjLu1+t1alW0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhXdRhkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhXdRhkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F07C2BCB3;
	Fri, 15 May 2026 02:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778813975;
	bh=pUTk3ydnIT5LntkJABWxPFqKPRtGtKpnosg/iGAwQVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZhXdRhkAXQD+HYsTqiNa9aEF7V/LAFkdym/SyR/GYHA7nc9rpazo6HGSOe3tBJ87h
	 f+6W8oBfvkP/0Le2Na+Ig/UYQ5Fes6yECwMqPJ35YzPbhbtAb8FnJPfHP8bTsxHohe
	 aakhxiLxcOVOmz8YDekQLAm0NjdtZLwme/SAKAmBoccVztG/YKNhQJ8Xhdtojyrogu
	 2BQ8pkFzWXCDjQbfG7F0j90Nx1Xc4bKAOI7dZLqc90x6zVmLLK5ezvhPIzeMjkwcml
	 96QGDvrl1zFWKnQWI6gDD/a9QwyMMwhYI4UoNjatuD6EE8H9AI4CMS5QqpyRaeizic
	 4raf9wHCjK+CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] riscv: defconfig: enable ARCH_ULTRARISC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:59:34 +0000
Message-Id: <20260515025935.36F07C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Kconfig symbol `ARCH_ULTRARISC` is not defined anywhere in t=
he kernel tree.
--

commit c77ace3a44699f903221665a56d7714a8cd6cf21
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: defconfig: enable ARCH_ULTRARISC

This commit adds the CONFIG_ARCH_ULTRARISC symbol to the default RISC-V
defconfig file.

Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb=
5@ultrarisc.com/

> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c2c37327b9877..9fdc4d1831ed9 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -32,6 +32,7 @@ CONFIG_SOC_STARFIVE=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
>  CONFIG_ARCH_TENSTORRENT=3Dy
>  CONFIG_ARCH_THEAD=3Dy
> +CONFIG_ARCH_ULTRARISC=3Dy

Is ARCH_ULTRARISC defined anywhere in the kernel tree?

It appears that the Kconfig entry for ARCH_ULTRARISC is missing. Adding an
undefined symbol to a defconfig has no effect because the Kconfig system wi=
ll
silently discard it during .config generation, which would prevent the
intended components from being built.

Was a prerequisite patch that adds the ARCH_ULTRARISC definition accidental=
ly
left out of this patch series?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D9
