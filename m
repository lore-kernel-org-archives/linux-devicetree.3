Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56283C0A1A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870908; cv=none; b=bj1b0dX+GOF/N3KZllsD38VSOu/5jqldEQblsiHNIjiu04V+QrVNrxO0/3xe0mHtuxMTlwMh4F0bhFdc7I0cL9JhSI+sDBUYvkiiQMdfqz8LcDmx9bAN71C0VJsD5QW2R9065Jzno+JoNPI19dmCILh4lehbUfI9Wx/GoBcmHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870908; c=relaxed/simple;
	bh=Rl7JzBcUA7CcKOD1Ya5dblSO+fYB4H+ytigf6BhaObY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fOptK5c51DIUoJOg9JB9Osa5kWVXHIhSAx+SdMAo0B5FHat4V0WbkVtRp6SHG5tu6lwT++viFMwB0w/lu5p5+Uq8HWWdIaG2/V5SACpMMnp0axnTO3YHj2ovv5uzErTdI/0pfh/NlIql1lsgT21R9TM1sA5jzx+wUDBoFZ48bug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYx0G6aN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYx0G6aN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7651F000FF;
	Tue, 13 Oct 2026 05:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870907;
	bh=vw0QrOe+mueirmNdjvTXS/TszYJrljVgaZjpgBPd+Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYx0G6aNTVJHmRohwwdxSkzVqhy5OxrN+7WSZbF0e30sXuThxPBS+otztUGyH0Jt7
	 /mudVXdYIYK2HANrJn4u703MFUngybeAyBXS/CT5E7rPguP4dN/lTTGhJ11xD17P2w
	 nlfXw+0k9yRPFlFQt0Vh1dUlud/h2lvpIpstxusJaiLrTAb0RdRQTxRwsAX44eaGgv
	 Ia+/VQZp5PKHIoV+e8BbBkGNU2koLCz9TdUlNMA2NCmTK+FVQ5PwJdiOXe44s5JPky
	 +NFNEfO1IAs+xeL6wwHSaupYv1Wg7rrtdJTU/AuWgxv/WJfOt2VqPN+DMFI/DH0noJ
	 aneTqxCpLO4sg==
Message-ID: <sashiko-outbox-169018@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 2/9] tee: optee: allow RPMI transport builds on
 RISC-V
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-2-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
 <20261012-rpmi-tee-service-grp-dev-v3-2-975b574667e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:55:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kconfig: missing RISCV_RPMI_TEE_TRANSPORT definition
--

commit 1268be5496f8b09029f843bfb4ecaffba27bd25e
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: allow RPMI transport builds on RISC-V

This commit allows the TEE subsystem and OP-TEE driver to be built on RISC-=
V systems using the RPMI TEE transport. It also implements the memory type =
check for RISC-V to prevent unsupported architecture build errors.

> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
> index 98c3ad0839409..ad754b647a3c5 100644
> --- a/drivers/tee/Kconfig
> +++ b/drivers/tee/Kconfig
> @@ -2,7 +2,8 @@
>  # Generic Trusted Execution Environment Configuration
>  menuconfig TEE
>  	tristate "Trusted Execution Environment support"
> -	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
> +	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD || \
> +		   RISCV_RPMI_TEE_TRANSPORT

[Severity: High]
Is the RISCV_RPMI_TEE_TRANSPORT config defined in another patch in this
series?

Since RISCV_RPMI_TEE_TRANSPORT is not defined in this patch or the current
tree, this dependency evaluates to false. This makes it impossible to
enable TEE on RISC-V configurations, leaving the drivers disabled when
users expect them to be built.

[ ... ]

> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 891dac63cab85..cc057c76de622 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -2,10 +2,11 @@
>  # OP-TEE Trusted Execution Environment Configuration
>  config OPTEE
>  	tristate "OP-TEE"
> -	depends on HAVE_ARM_SMCCC
> +	depends on HAVE_ARM_SMCCC || RISCV_RPMI_TEE_TRANSPORT

[Severity: High]
Similar to the TEE config above, OPTEE depends on RISCV_RPMI_TEE_TRANSPORT
here.

Without a corresponding config RISCV_RPMI_TEE_TRANSPORT definition in the
tree, this condition can never be met for RISC-V systems. Does this rely
on a missing prerequisite patch?

>  	depends on MMU
>  	depends on RPMB || !RPMB
>  	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
> +	depends on RISCV_RPMI_TEE_TRANSPORT || !RISCV_RPMI_TEE_TRANSPORT
>  	help
>  	  This implements the OP-TEE Trusted Execution Environment (TEE)
>  	  driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-rpmi-tee-s=
ervice-grp-dev-v3-0-975b574667e2@oss.qualcomm.com?part=3D2
