Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E4229B12
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761617; cv=none; b=dCMDwSQ+DB9PtX4BeM/6sT54nx1v1wL+qS+mQnXLbQ0HAJxDug+2jNEFZZxX7UYyFtoFteU4j+dQxAlNU5axH1CjfEkvIaGiasJ0tUEAgH5skPzDnSn2UiMiJbeGY5W3cyW5zCmPVLaVU0QtXU+Nabuc+WLj+SyoKzdLUYFAiUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761617; c=relaxed/simple;
	bh=Ex/0vfO9OaCRI3ysqQmiG4sZ8WK67xzD9awnXqTAd6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qsFXSIoykaoZCVNUk58JV6qCQdZRr/MS5Qvr4bQZQ/nNZdZdeNwkXqc5Yfjrm2yFIVM14EGIC7jARGloAiw+ETHNVd8jQDvJZESTDcNROn1zAW8YffSpbKn2V+18FCiPH4bs5OmNll4/YpF1iYlte46bJR2o6X8YQpF7Y43Il5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQfFgcSC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQfFgcSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DF71F000E9;
	Mon,  3 Aug 2026 12:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785761616;
	bh=QjDi42mZn3s0yRlx4btV41bJQoCassrjCrfR6f2mTHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XQfFgcSCjBosyv6nM0ZSuPfwdLZBUHuBpRa3Q22ycg15ZZbI6Rk0HdtW9cjCz+NHj
	 jcyFZxZOwXJQIQM3hIukLZGuad1LzakP4GRtJBoituIRFyutVa8o0paU+oAJZRYilE
	 58ZlcXksxdOmjCVNUTa095U6uUwUr1BfFQLajg8qmPX8Yj9EuL0+W5fcE4ERRRVIWB
	 GaxwGoLa3HiO2e1ouP6dCPqeE6D4daRPxs1A4+yIl94uVnCO7gOWqbh2nfL3N30ihG
	 JTd1dpilLriMBtbK0M3DyFKBaIWQ1RXJuijDDgrozAfpaj+cOw7MeemfVu/T1VmPK7
	 GOmx2HZ7VZ4qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] spi: dw: add check for support of enhanced spi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803124044.156998-4-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-4-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 12:53:34 +0000
Message-Id: <20260803125335.B9DF71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Flawed buswidth validation erroneously rejects valid multi-bit ope=
rations (when phases are absent) and incorrectly accepts physically unsuppo=
rted operations.
--

--- Patch [3]: [PATCH v2 03/11] spi: dw: add check for support of enhanced =
spi ---
commit 0eaff4ea0f38f3c8901810547641176fba69f40c
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: add check for support of enhanced spi

This commit adds support for validating single/dual/quad/octal SPI memory
operations if the controller has the DW_SPI_CAP_EMODE capability.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
[ ... ]
> +static bool dw_spi_supports_enh_mem_op(struct spi_mem *mem,
> +				       const struct spi_mem_op *op)
> +{
> +	if (op->addr.nbytes !=3D 0 && op->addr.buswidth !=3D 1 &&
> +	    op->addr.buswidth !=3D op->data.buswidth)
> +		return false;

[Severity: High]
Will this erroneously reject valid multi-bit operations that do not have a
data phase (such as 1-4-0 or 4-4-0)?

If a multi-bit operation like an Erase command has no data phase,
op->data.nbytes is 0 and op->data.buswidth evaluates to 0. Since the
address buswidth (e.g., 4) does not equal the data buswidth (0), this check
evaluates to true and incorrectly returns false.

Should there be a check for op->data.nbytes !=3D 0 before comparing the bus
widths?

> +
> +	if (op->addr.nbytes >=3D 8)
> +		return false;
> +
> +	if (op->cmd.buswidth !=3D 1 && op->cmd.buswidth !=3D op->addr.buswidth =
&&
> +	    op->cmd.buswidth !=3D op->data.buswidth)
> +		return false;

[Severity: High]
Does this logic allow hardware-unsupported mixed-buswidth permutations?

For an invalid operation like 4-1-4, op->cmd.buswidth (4) does not equal
op->addr.buswidth (1), but it does equal op->data.buswidth (4). This makes
the final condition (op->cmd.buswidth !=3D op->data.buswidth) false, which
short-circuits the if statement and allows the operation.

Since the DW SPI controller's TRANS_TYPE cannot natively support such
permutations, should this logic be adjusted to prevent accepting operations
that will result in corrupted transfers on the SPI bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D3
