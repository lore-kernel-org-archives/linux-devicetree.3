Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7E08472
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606418; cv=none; b=hxFAOWhsIqblY5stEdhBliiKRtVvEL0WkmohguGfOUo/Hbn6MWvfnPUyJ9/tE1ibfCLb3wQv8/UdfJ2ZrD49aePk4G2QIurAsykp70WL4xfm2UNjZ6jTOTl1JfNqJ+fnEsD5azAyhLYIrhHCJzhec47V4BQh7JMBOL1LQDAKhUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606418; c=relaxed/simple;
	bh=dbDsNv+n19JQI1JbSsf2XAuVrPO1GfcUrYj/1miquhc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=miwOi/K0AVdtPBQyGwZLrMdfULTA0JXm1GMFE/voSKEgtgDF3wG4LL3KF6N5untS78SYSHbC8iUWfBLZmCPWStK6mHp5s5pfGO35ux8HPrlWLuG9envplKJFctubYWxwunAEytUHtuxceAPPLVJBzKmbVSfP/GWbr0WqDeaClT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6aXcsX5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6aXcsX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E109C1F000E9;
	Thu,  9 Jul 2026 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606417;
	bh=8pr8+s1eZCmjmwtnyNhgVZk7gGB7asweetnb4RrMhoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6aXcsX5QkHv8Z5XHp4eabrvD/rJWCxBveUDgzL/KvawpfjipWeoKG+fe76WMujTS
	 c9hG0nUR6pwUGvosPpgpmEa6L0rwEVHzutlHlFBIfgL1piv1bGxKpGsUi5y5ZED4Zh
	 XYhm9ouTZy3Dxe2qhW/DKLyQhYjRT5y1gy7yI7f8sknAXX85X3BptMxL99LGFu+HaI
	 zj3NwExrt+JxllZR74vgkWKIthkaaKVBj4ghqRpI07e51ttGMfx8m0ENgPsPOp5D2Q
	 qlzrJti+9ZpaQmZQ/rz5AVBn/xTcwkfniIw2418DB7FFa+jkeS9xOURwjoCdC4Iesf
	 IK/pRnG+rWUig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 04/11] spi: dw: add check for support of enhanced spi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709055204.138168-5-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:13:36 +0000
Message-Id: <20260709141336.E109C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The dummy cycle check uses integer division incorrectly, allowing =
wait cycle configurations that silently overflow the 5-bit hardware wait cy=
cle register.
- [High] The buswidth validation logic incorrectly rejects valid NO_DATA op=
erations (e.g., QPI Erase) while accepting unsupported mixed-buswidth opera=
tions (e.g., 4-1-4).
--

--- Patch [4]: [PATCH v1 04/11] spi: dw: add check for support of enhanced =
spi ---
commit fe456b0bd9838cdf376b52d9ec69265dbf1ef090
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: add check for support of enhanced spi

This commit queries the spi controller for buswidths it supports before doi=
ng
a mem op. It adds dual/quad/octal mode checks if the controller has the
DW_SPI_CAP_EMODE capability.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 6befe47929b4c..010a665b17b76 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -521,6 +521,32 @@ static int dw_spi_adjust_mem_op_size(struct spi_mem =
*mem, struct spi_mem_op *op)
>  	return 0;
>  }
> =20
> +static bool dw_spi_supports_enh_mem_op(struct spi_mem *mem,
> +				       const struct spi_mem_op *op)
> +{
> +	if (op->addr.nbytes !=3D 0 && op->addr.buswidth !=3D 1 &&
> +	    op->addr.buswidth !=3D op->data.buswidth)
> +		return false;

[Severity: High]
Does this logic incorrectly reject valid operations that have no data phase,
like Quad SPI Erase?

If an operation has no data phase (op->data.nbytes =3D=3D 0), the SPI core
initializes op->data.buswidth to 0. For an erase command over QSPI
(e.g., 1-4-0), op->addr.buswidth !=3D op->data.buswidth evaluates to 4 !=3D=
 0,
which erroneously returns false.

> +
> +	if (op->addr.nbytes >=3D 8)
> +		return false;
> +
> +	if (op->cmd.buswidth !=3D 1 && op->cmd.buswidth !=3D op->addr.buswidth =
&&
> +	    op->cmd.buswidth !=3D op->data.buswidth)
> +		return false;

[Severity: High]
Can this logical AND chain accidentally accept unsupported configurations?

For an operation like 4-1-4, op->cmd.buswidth !=3D op->data.buswidth evalua=
tes
as 4 !=3D 4 (false), which short-circuits the AND chain and bypasses the
rejection.

> +
> +	if (op->dummy.nbytes && !op->dummy.buswidth)
> +		return false;
> +
> +	if (op->dummy.nbytes !=3D 0 && op->data.dir =3D=3D SPI_MEM_DATA_OUT)
> +		return false;
> +
> +	if (op->dummy.nbytes !=3D 0 && op->dummy.nbytes / op->dummy.buswidth > =
4)
> +		return false;

[Severity: High]
Does this integer division silently allow configurations that overflow the
5-bit hardware wait cycle register?

Due to truncation, a configuration with op->dummy.nbytes =3D 19 and
op->dummy.buswidth =3D 4 will evaluate as 4 > 4 (false) and be accepted.

This corresponds to 38 SPI clocks ((19 * 8) / 4). Since the hardware wait
cycle register (DW_SPI_ENH_CTRLR0_WAIT_CYCLE_MASK) has a maximum limit of
31 cycles, programming 38 will be bitwise-ANDed by FIELD_PREP() to 6 cycles.
This could result in sampling data out of sync and corrupting the read.

> +
> +	return spi_mem_default_supports_op(mem, op);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D4
