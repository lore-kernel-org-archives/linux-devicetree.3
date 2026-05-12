Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24773EDE76
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778626610; cv=none; b=N+kx/wXsnRl4vyF+7EMi2lgeURSxlJaCi6XHaCXP3vNyMoS9hc2VVEZwpmyIn0csKXoCRDcLxujyMid2fdPHSXXEmffYmWzeE9sRoDkrHvNH8L4EKdgKHghspozNu6cRE14QCkrWiTPIydUNfPaVULywl52INl32M4gmAUg3Wbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778626610; c=relaxed/simple;
	bh=LFapFLNZdth0MBp/6u3ZravJrB2roUCC3WKE1+tO/Vs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jOebjycU8lB67UJUvr5A4eirBBqt08gKLrj/eYvV6yRXY4pKBX5x/K0CSuGIW5p5EJl9st/AZq4Zc+s21pnoJXO6teThBXnxutSzETSNYB/uGCSzwC2DDUsax/uk2J6sgYIA2nAJWvhO3NqruCwQjl2By0mnyaAeNQBlEPJDAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pe0su0F7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pe0su0F7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A949C2BCB0;
	Tue, 12 May 2026 22:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778626609;
	bh=LFapFLNZdth0MBp/6u3ZravJrB2roUCC3WKE1+tO/Vs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pe0su0F74R9GQHNspTfWxiZIARz+KyqWfqGCuTDsufbZErzvpIXhfolJf6+iLg6zx
	 usAduLc1/Mkin+YMRrYnlNLHCdfp4egBXMiohK6EZHxvo8FT4u1ZnelJEaY8ECzn8M
	 r7EaMvZymR8rBAm7l8a1RdNBF2jBziQx128JDNpkwG2ML0cO+VVvRJxtlj52+zXMJw
	 FFjp3xUTmRPDDcJCjOaoTk4cz1CWbMfK/Q8oz+u3eKWKJ4WLbDwesSF4sUxSQdnklZ
	 /dIUEj9mltMVXIRALDg7lSzCZlrMkMc/+l9rowGZQasV5TllDhP0T7hDn0TPa3cfR6
	 eTxheVWr1xWsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 18/18] riscv: enable resctrl filesystem for
 Ssqosid
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-18-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-18-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 22:56:48 +0000
Message-Id: <20260512225649.4A949C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims that `RISCV_CBQRI_DRIVER` =
depends on `RESCTRL_FS`, leading to an unnecessary conditional select.
--

commit 3be4f3cc4a28f5d85be10d99343a49ff875c6415
Author: Drew Fustini <fustini@kernel.org>

riscv: enable resctrl filesystem for Ssqosid

This commit updates the RISCV_ISA_SSQOSID Kconfig option to select
RISCV_CBQRI_DRIVER. It conditionally selects the driver only if
RESCTRL_FS is enabled, aiming to keep the filesystem as a user choice.

> RISCV_ISA_SSQOSID selects RISCV_CBQRI_DRIVER, which in turn depends
> on RESCTRL_FS. Enabling the resctrl filesystem itself stays a user

Is this description accurate?

The driver configuration shows that RISCV_CBQRI_DRIVER only depends on
RISCV && RISCV_ISA_SSQOSID. The filesystem integration is decoupled into
a separate silent config, so the driver does not actually depend on
the filesystem.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -596,6 +596,7 @@ config RISCV_ISA_SSQOSID
>  	depends on 64BIT
>  	default n
>  	select ARCH_HAS_CPU_RESCTRL
> +	select RISCV_CBQRI_DRIVER if RESCTRL_FS

Could this conditional selection lead to unexpected configurations?

Because the driver does not actually depend on the filesystem, if a user
enables the SSQOSID extension but leaves RESCTRL_FS disabled, the
underlying hardware driver will unexpectedly not be automatically
selected.=20

This differs from platforms like ARM64, where ARM64_MPAM unconditionally
selects ARM64_MPAM_DRIVER regardless of the filesystem configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D18
