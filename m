Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4F4418DF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605616; cv=none; b=q7SomsC/JyCZkf9zZrB8j3/RBXBWjDDsxdCSpFHH9QMee06wJRmQfO1ZsAOIT5UTg2XBi5JftJ4UGXkJ9waIMyn+1N27GCAI2H1fTVP0gKKAMsbnniCRWxD0ncHqsA8UJbNtTRjHILYtUgJDyvZ85LedpAo3iqyZ73vMmGAKYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605616; c=relaxed/simple;
	bh=mE63ay4nSLPLfSnHSbkenKQSg9En6dp2o44ekKnlmWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xd+Z6ePkRskV6zKSjxl4ca8Y/DMKEdIcWFo960jVvVQF3Ee+UoFQpHIbWHgNwVcw8nm6wlWbiSbXeLeJE4SsN8I0V77RnlX/4xjCJvl0uxNTKCi6YaLhsxtlKzzotSEXE9CFPIz9Uq5dl2WKoc0FZCurZaOpL210p0LogDm5Cfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcu+oi0M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcu+oi0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D0F1F000E9;
	Thu,  9 Jul 2026 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605614;
	bh=AXc+U2NTX+WfNCK3szRtITB4pG4K/eausIBZdvDkBZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gcu+oi0MkysS7sXP2vYUTb/VHOp2MptzsdAkXMTCHIPLASrbB2mwe6Re8xLzfTJCD
	 s2HvdFb91XhDjQYd8qwcx9Kv5/IJeEXRdQoX/IsUs2EOEAHcYdfPOTklpOZYu1w1qX
	 T6tSTDgxGwEoGt1uhwRkxqtTxmcqICVLUAAaFAXAUcOxuMOtZQPrTQhpSmpmaCwmSA
	 qEZouCb0qT6eqZxnaFTobQ/4E34TMqaNN3kVhfZuqw13VHWW+a6YiA+fqlsVP4ohyt
	 /Mezse8HEXtHiKH9KUxwJ4fsiANu/Vi5wRPH5CpYEL9yNE4XDdmMVhL8HikF7YuIx7
	 qqn7U8MpDZkYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 03/11] spi: dw: update SPI_CTRLR0 register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709055204.138168-4-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-4-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:00:14 +0000
Message-Id: <20260709140014.A1D0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly introduced `enh_cfg` parameter in `dw_spi_update_confi=
g()` is never populated or passed by any caller, rendering the enhanced mod=
e configuration logic effectively dead code.
--

--- Patch [3]: [PATCH v1 03/11] spi: dw: update SPI_CTRLR0 register ---
commit b571b86cd59a7cddd50fbc1933264b4589cd6f16
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: update SPI_CTRLR0 register

This commit updates the SPI DesignWare driver to configure the SPI_CTRLR0
register for enhanced mode transfers. It introduces a new dw_spi_enh_cfg
structure and passes it to dw_spi_update_config() to set up instruction=20
lengths, address lengths, and wait cycles.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 8d4ad4035d7c9..6befe47929b4c 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
[ ... ]
> @@ -451,7 +460,7 @@ static int dw_spi_transfer_one(struct spi_controller =
*ctlr,
> =20
>  	dw_spi_enable_chip(dws, 0);
> =20
> -	dw_spi_update_config(dws, spi, &cfg);
> +	dw_spi_update_config(dws, spi, &cfg, NULL);

[Severity: Medium]
Is this intended to always be NULL here? By passing NULL unconditionally,=20
the new enhanced configuration block in dw_spi_update_config() will never=20
execute for this path.

[ ... ]
> @@ -718,7 +727,7 @@ static int dw_spi_exec_mem_op(struct spi_mem *mem, co=
nst struct spi_mem_op *op)
> =20
>  	dw_spi_enable_chip(dws, 0);
> =20
> -	dw_spi_update_config(dws, mem->spi, &cfg);
> +	dw_spi_update_config(dws, mem->spi, &cfg, NULL);

[Severity: Medium]
Similarly in dw_spi_exec_mem_op(), the enh_cfg parameter is also=20
unconditionally passed as NULL. Is there a missing piece that was supposed=
=20
to extract the enhanced mode configurations from the memory operation and=20
pass them along?=20

Since all current callers provide NULL, the newly added SPI_CTRLR0 register=
=20
update logic inside dw_spi_update_config() appears to be permanently=20
unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D3
