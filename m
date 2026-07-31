Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3C3B3BE7
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489735; cv=none; b=Oj6RB3+ArF1PLWxD17iCe5e2U7y89Jyqos0QjEfz8pHtdSglL1sJXcna+fF6WpIC4w3XRH+8r8VATkjXTvwGXr4rQ9bwcBqKN07hhLnvzFUxxLawpDRcPfqDETJdfdTdWDvXiN/Pvd8nIfR0i+XW+jbkcWVlIpMIWClmzXhOGmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489735; c=relaxed/simple;
	bh=oy5ANf398pgn23U+rslxwaaSgXWo31OwBx7fL/IxUwQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jy1ly/jrQfIfZSTOkzB4pEdSw/ESYJIXIH/h2XA0hYNWfkUUwZ0F6RGQ/7qdpRMkLJriznuZUgkyGhK/7pKKhqgWnxoxK+PBl9ea2/VPI3LD32QS22B/HfrXm06vcSewFgPtoC/PQ6P0mtJz6nobQSZsSzJyLs6yFryoov5FbTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ9wmZYZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ9wmZYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5E71F000E9;
	Fri, 31 Jul 2026 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489734;
	bh=buFpopr7n/hOL7T9hO29/5vNknhfH/3Ab58MQyljmVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PQ9wmZYZ0e3z53BIcWXL6Hv1m51zsk/tZWysVjrp8Tu1a60lwX54+WTeUgdEFvy3E
	 fHRv34OF0i2QBa5Lg/Hcza6gFkfcj2kggTCu1ozWnEwrtHaj9EE0+Dwphq2JFCni66
	 nM+Cie/vC/eQfJ77fmbcMkZHlPRY2jA0o5KONtU2mpHZt5osmAFZBCbaw/uS/yhHAP
	 5OhZgL11gUNdirAtWRKC/fdqrmXuolo25i5d7TzlEAWJqxL0tPi3r0BX21QTE4QBHh
	 ZiykYOivKEcuGP3NqEzsKuGJNN4kPPUYZrq64Fppw1gtlQ4t4VSPnQ+FQKA4T73dfR
	 Lf3yUc5QmDYIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] spi: amlogic: spisg: Fix transfer size limit and
 timeout handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-a9-spisg-v3-2-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
 <20260731-a9-spisg-v3-2-a15da3f70029@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:22:13 +0000
Message-Id: <20260731092213.9D5E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The newly added timeout abort path stops the controller but fails =
to synchronize or disable pending interrupts, causing a race condition wher=
e a late interrupt can falsely complete a subsequent transfer.

Pre-existing issues:
- [High] Transfers exceeding SPISG_BLOCK_MAX blocks are silently truncated =
by the driver because it caps the block count but fails to implement the ma=
x_transfer_size controller callback.
- [High] The driver incorrectly mixes `devm_clk_get_enabled()` with manual =
`clk_disable_unprepare()` calls, leading to unbalanced clock reference coun=
ting.
--

--- Patch [2]: [PATCH v3 2/4] spi: amlogic: spisg: Fix transfer size limit =
and timeout handling ---
commit f3597777f9b3ab326fe08698fcd9389c455e53d4
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

spi: amlogic: spisg: Fix transfer size limit and timeout handling

The commit reduces SPISG_BLOCK_MAX to avoid zero-length transfers and fixes
a 64-bit delay calculation. It also clears the descriptor list register on a
transfer timeout to stop the controller.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
> @@ -95,7 +95,7 @@
> =20
>  #define SPISG_MAX_REG			0x40
> =20
> -#define SPISG_BLOCK_MAX			0x100000
> +#define SPISG_BLOCK_MAX			0xFFFFF

[Severity: High]
This isn't a bug introduced by this patch, but does the driver silently
truncate large transfers?

In aml_spisg_probe(), the driver sets ctlr->max_dma_len =3D SPISG_BLOCK_MAX,
but it does not implement the max_transfer_size controller callback.

When a transfer is larger than SPISG_BLOCK_MAX, aml_spisg_setup_transfer()
silently caps it:

	blocks =3D min_t(int, blocks, SPISG_BLOCK_MAX);

Since the SPI core isn't aware of the maximum transfer size limit, it could
submit oversized transfers that get silently truncated. This could leave DMA
buffers partially uninitialized on RX. Should we implement the
ctlr->max_transfer_size callback to prevent this?

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
Could this timeout path race with a late interrupt?

By stopping the controller without synchronizing or masking the IRQ, a
delayed interrupt might still arrive. If it does, aml_spisg_irq()
unconditionally completes it:

	complete(&spisg->completion);

If the SPI core immediately enqueues the next message, could this late
interrupt prematurely complete the new transfer and prematurely unmap its
active DMA buffers?

[Severity: High]
This is a pre-existing issue, but does the driver have an unbalanced clock
reference count issue?

The driver acquires clocks using devm_clk_get_enabled(), but manually
disables them during error handling and removal. For example, in the error
path of aml_spisg_probe():

out_clk:
	if (spisg->core)
		clk_disable_unprepare(spisg->core);
	clk_disable_unprepare(spisg->pclk);

Since these are devm-managed clocks, the cleanup framework will also
disable them, which results in a double-disable. Should these manual
clk_disable_unprepare() calls be removed, or should the driver use the
non-devm clock getters?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-a9-spisg-v=
3-0-a15da3f70029@amlogic.com?part=3D2
