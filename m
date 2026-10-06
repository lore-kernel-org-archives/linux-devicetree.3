Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD82E06ED
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247967; cv=none; b=WaZ0DYw8ZYjzTo20MsnBeJ7t8+QSdNhlJKQh2Nb6xAHwYv9CEfENsd/su5gVwlo5AcyuvtNmSxMKfhsLFQK0Yg1uC7BXoyiLNylIU+YVI6iJrFrgjQ2zwpxeWv9mMArt6yMYOkRCXXs+8dbqBSL1i+XfYIX0DsPtPKs7FlykUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247967; c=relaxed/simple;
	bh=YgZDHRsn/BZhx+ZZ7yWTDfKRXhrq97QU4cPYrv2cFt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VlTJB3siepkAUSPqBSvSsd9h3PimED+N96S0Dj5mOkUGtMqTf2DOm1Sn2rX4XMvY9Y8AitHr9orymw1/xEO1iMWw4lvRgZ5G+tgUbojAgg/811nRyRw/pmJSbDZdH/4DvN+ZtW19KP77jydbQwf+BkmCPEwtPk4fIbqPe+dPV3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBNRkhWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBNRkhWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89A91F000FF;
	Tue,  6 Oct 2026 00:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791247966;
	bh=jvYO2ZaodRMS1466AvF0rZZtvtnYfex5GAknVbWIbzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBNRkhWCCfzRVwcReAMZa6OOCDD3VO/fs8O9ehIDntOXZQkjXedomB67zjwWssi6J
	 pogE5tjHYpAqFGdo03Pj3DWMqg5wxEJzs8z9JEkL6K3tJVRdQKXVUS0VfOPP7AdX5c
	 daT6PquILeVIcnx7iijk6kkQtgCOCScshknGtCc3TtSYJtJ+Ful8RCZ03otazsTaCW
	 boMG0dTeZDgkihUo358ipRAbZM/t0k+LGAoXQqJyArtMS5MLtsKcOzQCMAhA87M6jo
	 4GCtg6gzNolpMiqcbjUUsW2XJa457pdsL4Qp5o+S+jHEpGPk359Ls11IcFk9V1DI3O
	 kR1wQk14jQQwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 1/8] tee: optee: allow RPMI transport builds on
 RISC-V
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-1-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-1-72f222e23ec1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 00:52:45 +0000
Message-Id: <20261006005245.D89A91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kconfig: referencing undefined symbol RISCV_RPMI_TEE_TRANSPORT p=
revents RISC-V builds
--

commit f52e668fa2e0c3cbca87392857f87a81c088348f
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

tee: optee: allow RPMI transport builds on RISC-V

This commit updates the Kconfig files to allow the TEE subsystem and OP-TEE
driver to be selected on RISC-V systems using the RPMI transport. It also
implements RISC-V specific memory type checking when registering shared
memory.

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

[Severity: Medium]
Does the RISCV_RPMI_TEE_TRANSPORT config symbol exist? It appears this adds
a dependency on an undefined symbol, which evaluates to false and makes it
impossible to satisfy this dependency for the core TEE subsystem on RISC-V
platforms without SMCCC.

>  	select CRYPTO_LIB_SHA1
>  	select DMA_SHARED_BUFFER

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

[Severity: Medium]
Since RISCV_RPMI_TEE_TRANSPORT does not appear to be defined anywhere in the
kernel tree, won't this silently disable the OP-TEE driver on RISC-V because
the unfulfilled dependency always evaluates to false?

>  	depends on MMU
>  	depends on RPMB || !RPMB
>  	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
> +	depends on RISCV_RPMI_TEE_TRANSPORT || !RISCV_RPMI_TEE_TRANSPORT

[Severity: Medium]
Similar to the above, this relies on the undefined RISCV_RPMI_TEE_TRANSPORT
symbol to enforce module compilation. Could this be a typo, or is there a
missing patch in the series that introduces this transport config?

>  	help
>  	  This implements the OP-TEE Trusted Execution Environment (TEE)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-rpmi-tee-s=
ervice-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com?part=3D1
