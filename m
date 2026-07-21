Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521CA417D9B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616341; cv=none; b=T+VTQjWIQ/4JLqF1UYeyaw2kHQsvCH0NvFmME64hIgOhi6P2r+20NcEyOZkQVCT94SXVlKjYEmB1AaOhZDxmuOA3vanhs5UMliLJAzZGKNCsfxp9OF+CzW6eYXjGNeft0R56KZVTg+pmhGLGYKNu+ddR3MGaOY+1aDO3xCSZrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616341; c=relaxed/simple;
	bh=aeis1+/wO99vuMJaztIia2EtzuqK/e5Pt8pqAq30YqQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nn9ZIBxwFFJ8oAFMsA1BI+oHi06nfqZsw4pGPRorIZmBMRFpsHF2A4xZMbQQziLlslmt+vXvAjZhhFqXgIeyIHLxaJQQQ76pqSIiKqtdTXCDW9Rvv3XSj2Fu1tbGd+8wEjTSTBaA8lghErPfx44u8Tii/Pl/BVzRxXIe638g/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hh3Jk2vx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hh3Jk2vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20FE1F00A3A;
	Tue, 21 Jul 2026 06:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616339;
	bh=sgyNH4L85fiSWptni/JJ6u/XskzcrksB4b5bxu5LUTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hh3Jk2vxZGQPzO6GoRw6axyoTvpsStW8mR1izKR3tqUqy+sYHSk4gYh5ldXcarhnP
	 l7I/Sr5Q3OJVtzdKkWvd4nHBhDANCll1XZP/Q6roaaUMBPegdvKyqpUDtIeE6LGqhd
	 unF9lm0Oh/12felM7qfgAkcmBSUsmkEbtUIQmB9nN8H5AtJTMHeyg/ZF0FRFhNOLZi
	 wFgMAUAuSel8rA7N8CeEZiJ3L6xI1OR2sJEkon/tKmltIrcrZ2YEcsdKAJ8PH+pAeB
	 rtYN+LMvgE8pDvltV+WabGdlqefxg3FVWI5VtrprRqjm93StpdrAUHY+X8w/GeF1jG
	 dV40bbkNNtyzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/9] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-b4-qmi-tmd-v5-3-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-3-99620e07f505@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:45:39 +0000
Message-Id: <20260721064539.A20FE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Kconfig symbol QCOM_Q6V5_PAS unconditionally selects QCOM_QMI_T=
MD without inheriting its NET dependency, leading to unmet dependency warni=
ngs and potential build failures.
--

--- Patch [3]: [PATCH v5 3/9] remoteproc: qcom: pas: add support for TMD th=
ermal cooling devices ---
commit 55e78a265d3400a946df10d192ba5fdd761cbe31
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
remoteproc: qcom: pas: add support for TMD thermal cooling devices

This commit registers Thermal Mitigation Devices (TMDs) for PAS-managed
remote processors to enable thermal throttling through QMI. It updates
Kconfig to select the necessary QMI TMD support and adds the device tree
parsing and initialization logic.

> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 65befdbfa5f7d..f7c02edf395fe 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -229,6 +229,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
> +	select QCOM_QMI_TMD

[Severity: Low]
Does selecting QCOM_QMI_TMD here without inheriting its dependency on NET
cause Kconfig unmet dependency warnings and potential build failures when
CONFIG_NET=3Dn?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-b4-qmi-tmd=
-v5-0-99620e07f505@oss.qualcomm.com?part=3D3
