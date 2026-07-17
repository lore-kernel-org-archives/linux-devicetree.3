Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B103F3328FA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275267; cv=none; b=qU29iY+k7BnUkavifsurvzkp1CrV0el3RUy4L2AJthK8jWQ+7BunlkgjxKv6nefDf5nzTOhNpBU5cHBg21dOUcdbEGbix9AdLsDWO6MvCwnjsR3dydX0HORoYp+PVLYSVodIszVzg5wu+aZbu5KMukmbmNEVL58NZ9ixwjKL/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275267; c=relaxed/simple;
	bh=nQaWCPt1P7z1yRrFDCW/WImJ+ZcDX3SQQr4xMEW1bQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EeQLl3pP3kfc1u5b4B4gH+0n82QGniVs8qQ35gF5r+q3f7lVJLSCASX23gXsvlTTnPcLNaESRVk3rtDcYgZa2NeeH4KJJP4RQyNlR+YNYwokEGSc+8g1OxVQzxVs7CjYmBXAu2h9Yp9JCYWhfbvQM2c62zsGRqswSytv67El/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYz8vQ1E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYz8vQ1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9F51F000E9;
	Fri, 17 Jul 2026 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784275266;
	bh=Uu0wTGd+OyPGInm31ZdHqR2IOPXBZooPDxLPi8J3bTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MYz8vQ1ELp4H3leqvJQE2fVrTtze647R5VWnOmzIMj260HiJB7r83KFxNB7DqReej
	 IIOUJu6ZODqigChHf894NHWaOpB4Fx+zeKHlghcnnYq/9EifUKgekthv4tqtmleOc3
	 9UEUtPoStrZu48EH4e+2iEoQdf9OsvGbEjRXWQcw0/f2+kZukQDzf0WO8WoVHsX8Oy
	 920We/b8tPSeYN/9i9JzZLPIn4b0KTfbIzoQDvWIVB3z8L4WiNbz84jRAMEN5z3fzF
	 SmFJBFqgE+Jru4B5rQkFgwBMyswAtctrLOU+2DvPVIuG2ChJXsWIitfJXh38VNm14F
	 n96E93tnbx2Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] spi: amlogic: spisg: Fix the incorrect keep_ss of
 the last descriptor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260717-a9-spisg-v1-2-2eeea77be19f@amlogic.com>
References: <20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com>
 <20260717-a9-spisg-v1-2-2eeea77be19f@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:01:05 +0000
Message-Id: <20260717080105.EA9F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing hardware abort on SPI transfer timeout leads to DMA Us=
e-After-Free and memory corruption.
- [High] 32-bit integer overflow in `spi_delay_to_sclk` leads to severely t=
runcated SPI delays.
- [High] `SPISG_BLOCK_MAX` exceeds the hardware mask size, causing maximum-=
length transfers to be processed as zero-length.
- [High] Hardware limits for `cs_setup` and `cs_hold` delays are not clampe=
d before being packed into register fields, causing long delays to silently=
 wrap around to short values.
--

--- Patch [2]: [PATCH 2/3] spi: amlogic: spisg: Fix the incorrect keep_ss o=
f the last descriptor ---
commit 07f3c7893cd8bdd39413002b5f617a22e93e0842
Author: Sunny Luo <sunny.luo@amlogic.com>

spi: amlogic: spisg: Fix the incorrect keep_ss of the last descriptor

This patch fixes an issue where the CFG_KEEP_SS flag is unconditionally
cleared on the last SPI descriptor. It records the cs_change value of
the last transfer and properly programs CFG_KEEP_SS on the final descriptor.
When a null descriptor is used for cs-hold, the flag is kept on the
preceding descriptor and the recorded value is applied at the end.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index afc8af04638d3..0f026d3e43e0b 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
> @@ -529,9 +530,11 @@ static int aml_spisg_transfer_one_message(struct spi=
_controller *ctlr,
>  				spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_setup));

[Severity: High]
This isn't a bug introduced by this patch, but can the 32-bit multiplication
in spi_delay_to_sclk() overflow here?

If a requested delay in nanoseconds and the SPI clock frequency in Hz are
multiplied together, it evaluates as a 32-bit unsigned operation before bei=
ng
cast to 64-bit for the division:

drivers/spi/spi-amlogic-spisg.c:spi_delay_to_sclk() {
    ...
	return DIV_ROUND_UP_ULL(slck_speed_hz * ns, NSEC_PER_SEC);
}

For example, at a 100MHz clock, a delay greater than 42.9us will wrap aroun=
d,
causing hardware setup or hold delays to become extremely short or zero.

[Severity: High]
This is also a pre-existing issue, but are the hardware limits for cs_setup
and cs_hold delays clamped before being packed into the register fields?

CFG_CS_SETUP is a 4-bit field (max 15). If spi_delay_to_sclk() returns
a value greater than 15, FIELD_PREP() will silently truncate the upper
bits, resulting in an incorrect, drastically shorter delay.

>  		/* calculate cs-hold delay with the last xfer speed */
> -		if (list_is_last(&xfer->transfer_list, &msg->transfers))
> +		if (list_is_last(&xfer->transfer_list, &msg->transfers)) {
>  			cs_hold_in_sclk =3D
>  				spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_hold);
> +			last_xfer_keep_ss =3D xfer->cs_change;
> +		}

[ ... ]

[Severity: Critical]
This is a pre-existing issue, but does the error handling path for timeouts=
 in
aml_spisg_transfer_one_message() lack a hardware abort?

If a hardware transfer times out, the driver unmaps DMA buffers and frees t=
he
transfer descriptors without stopping the SPI controller hardware:

drivers/spi/spi-amlogic-spisg.c:aml_spisg_transfer_one_message() {
    ...
	if (wait_for_completion_timeout(&spisg->completion, ...))
		ret =3D spisg->status ? -EIO : 0;
	else
		ret =3D -ETIMEDOUT;

	dma_unmap_single(dev, descs_paddr, descs_len, DMA_TO_DEVICE);
end:
    ...
}

Could this lead to the hardware continuing to write to or read from freed m=
emory
pages (DMA Use-After-Free) since the hardware isn't stopped?

[Severity: High]
This is a pre-existing issue, but can the maximum blocks count exceed the
hardware mask size in aml_spisg_setup_transfer()?

The blocks count is capped at SPISG_BLOCK_MAX (0x100000):

drivers/spi/spi-amlogic-spisg.c:aml_spisg_setup_transfer() {
    ...
		blocks =3D min_t(int, blocks, SPISG_BLOCK_MAX);
		desc->cfg_start |=3D FIELD_PREP(CFG_BLOCK_SIZE, block_size & 0x7) |
				   FIELD_PREP(CFG_BLOCK_NUM, blocks);
    ...
}

Since CFG_BLOCK_NUM uses a 20-bit mask (GENMASK(19, 0)), a transfer bounded
exactly at SPISG_BLOCK_MAX (0x100000) will be silently zeroed out when mask=
ed,
causing it to be processed as a zero-length transfer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-a9-spisg-v=
1-0-2eeea77be19f@amlogic.com?part=3D2
