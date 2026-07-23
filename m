Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B03DAAC3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790159; cv=none; b=kg3neM6yM0wMzs0/NIupKMFbJUc1vzAjnw3ZKzYWBAewtzxEGdXzjkgWvGsDH85GZ0JMdF4RcBOUk82foc5Jxa5skRqlpI6MzM4/4jmM/BzjzTQpa2+yOmfRO/+jNV/tvSsOiYcOwNVJGQEoz6gKK+WLUFXsAKElkLbo3COm3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790159; c=relaxed/simple;
	bh=zqr3ZyB4sq8Ni46NIFTvmo6ZfTrWj7hFEpMK5FyebHA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PMet4Gj805M6kVfwK7oFrfrmNHOrDAN4CunTRnWiS9vm9d1FtmEWuyCbhZZM2R3Hdrz/GjExLX9SeEYqe5Eu171SeYfNI+oRTm+yLXGU3Hd4jw6Y34Xnjz0fgcQ3nL5dxUrdnWY3GFgvmuL0FKBM/qVU17rzbrC7M4PRLjGL/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JH7zrxdv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JH7zrxdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551EC1F000E9;
	Thu, 23 Jul 2026 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784790153;
	bh=X3ZSqVsKzk/nfIRxG+HiokLDDbf/h220FFGx5ibCgno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JH7zrxdvQqqsmUPXIF5CCcLXn3SzSLMaTjmNyTIZ2nnBX9Xvyc4uS/yPCtUHMN+E9
	 kNDIkNdBX6tkclQWTMygkNHX82IK0gb30EcNmrU8Zpcn/cQUL4vKZ8uqNDpDGLNxVC
	 HN10ZlTTvYNB+27SfvI7qyNGZsGcVC5pMQzoQvoDp3SuHf0Qci4ncPwOWnuUULn5Tb
	 NN5GSn5aDwWv/nV94iC9/wvHwHgf8e2xwtYLvUrPRRxgVqL7/AHuJCAsT2yPt8Iylq
	 0bSfVj/IrQEcaFGze7TfyzTO6FHiZrm0ExA5ni6PhIyclq+xAsPVhlLDd6O7WFZy1l
	 ZoZe8G9MRqXeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] spi: amlogic: spisg: Fix transfer size limit and
 timeout handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260723-a9-spisg-v2-2-9fc39106b7e2@amlogic.com>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-2-9fc39106b7e2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 07:02:33 +0000
Message-Id: <20260723070233.551EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing max_transfer_size callback leads to silent truncation of l=
arge transfers.
- [High] Incomplete timeout handling leaves interrupts unmasked, allowing a=
 delayed interrupt to prematurely complete a subsequent transfer.
- [High] Immediate DMA buffer unmapping on transfer timeout causes memory c=
orruption if the hardware DMA engine is still active.
--

--- Patch [2]: [PATCH v2 2/4] spi: amlogic: spisg: Fix transfer size limit =
and timeout handling ---
commit d149d3bcf81987c3bc95c5cc0053e984ee79e15e
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: spi: amlogic: spisg: Fix transfer size limit and timeout handling

This commit reduces SPISG_BLOCK_MAX to 0xfffff to avoid programming zero-le=
ngth
transfers because the CFG_BLOCK_NUM field can only encode 20 bits. It also
fixes a delay calculation overflow and attempts to stop the controller on
transfer timeout by clearing the descriptor list register.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")

> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
> @@ -95,7 +95,7 @@
> =20
>  #define SPISG_MAX_REG			0x40
> =20
> -#define SPISG_BLOCK_MAX			0x100000
> +#define SPISG_BLOCK_MAX			0xFFFFF

[Severity: High]
This isn't a bug introduced by this patch, but modifying SPISG_BLOCK_MAX
brings up a question about large transfers.

Are large I/O requests being silently truncated?

In aml_spisg_setup_transfer(), the hardware block count is dynamically clam=
ped:

    blocks =3D min_t(int, blocks, SPISG_BLOCK_MAX);

However, the driver does not provide a ctlr->max_transfer_size callback.
The SPI core assumes SIZE_MAX is supported and won't split large transfers.
The hardware will stop after transferring SPISG_BLOCK_MAX blocks.

Later in aml_spisg_transfer_one_message(), the driver unconditionally repor=
ts
success for the full length:

    msg->actual_length =3D msg->frame_length;

Could this cause silent data corruption for transfers larger than
SPISG_BLOCK_MAX * (bits_per_word / 8) bytes, since the caller is unaware the
transfer was truncated?

[ ... ]

> @@ -565,10 +565,13 @@ static int aml_spisg_transfer_one_message(struct sp=
i_controller *ctlr,
>  	aml_spisg_pending(spisg, descs_paddr, false, true);
>  	if (wait_for_completion_timeout(&spisg->completion,
>  					spi_controller_is_target(spisg->controller) ?
> -					MAX_SCHEDULE_TIMEOUT : msecs_to_jiffies(ms)))
> +					MAX_SCHEDULE_TIMEOUT : msecs_to_jiffies(ms))) {
>  		ret =3D spisg->status ? -EIO : 0;
> -	else
> +	} else {
> +		/* stop transfer */
> +		regmap_write(spisg->map, SPISG_REG_DESC_LIST_H, 0);
>  		ret =3D -ETIMEDOUT;
> +	}

[Severity: High]
This is a pre-existing issue, but does the timeout path safely halt the DMA
engine before unmapping memory?

After writing 0 to SPISG_REG_DESC_LIST_H to abort the transfer, the driver
immediately calls dma_unmap_single() and then aml_spisg_cleanup_transfer()
to unmap the data buffers.

If the hardware DMA engine requires time to flush outstanding AXI transacti=
ons
or if the register write is delayed, could the hardware access unmapped pag=
es
or memory reallocated to other components, resulting in memory corruption or
IOMMU faults? Is it necessary to poll the hardware to confirm it has halted
before proceeding?

[Severity: High]
This is also a pre-existing issue, but is there a race condition with
delayed interrupts on a timeout?

If a transfer times out, the driver issues the stop command but does not
mask the controller's interrupt (SPISG_REG_IRQ_ENABLE) or use synchronize_i=
rq()
to ensure the handler is not running.

The interrupt handler aml_spisg_irq() unconditionally calls:

    complete(&spisg->completion);

If a delayed interrupt fires concurrently with a subsequent transfer that h=
as
just called reinit_completion(&spisg->completion), might the new transfer's
wait_for_completion_timeout() return immediately as a false success? This c=
ould
cause the driver to unmap DMA buffers while the hardware is still actively
processing the new transfer.

> =20
>  	dma_unmap_single(dev, descs_paddr, descs_len, DMA_TO_DEVICE);
>  end:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-a9-spisg-v=
2-0-9fc39106b7e2@amlogic.com?part=3D2
