Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BE3630B2
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282687; cv=none; b=uSbDd9UWJFMxRIhcSJ+p3yz8L83xx+oPFVe8KjqXVbSXWBlYo6HnQKwFXY33AQ00KKcPRqH0w7MQEJ4vfZIDIvaM44PPE8booxmxeA37AYZAETkcBfRWEGZrBjegK0/d5nKvgjzAPsgck0EtJw0iVSqk4RxWHqaCRHhk6nTeudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282687; c=relaxed/simple;
	bh=BQrhvAVGJjE46Z7kr1ki78p69X8fw1ElBsh+XciQBEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AFrfeWEoQq1mvlJ9z75QPSHW4LNOqk1QvKiqmtkMWaMJA7S9h2KQEMCPyAArH0TFUkghE0eF0BiEELcBXQThAtW7TN1yOX/vMe3rJxC2KpRUE1JiY/herD8vkWlpLYlnB1S7CKkFGvgLEthChPxWIG+ZMZxkWbnLjwgPYH+BfC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh4x9t+A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh4x9t+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C46C2BCB0;
	Fri,  8 May 2026 23:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282687;
	bh=BQrhvAVGJjE46Z7kr1ki78p69X8fw1ElBsh+XciQBEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lh4x9t+AyZFmBaxs/CEXeaKFJcgDGD6TjPiawkbcHNpjda1LgpvY9kPvAXSkmKx+0
	 QH3lQr0Ux2wsPh/b3IoXibbaFDDCDgcio3ebRE/ojz9p+khFByCsYoanHQt2S07x6p
	 CNIyCB74rsHZUeFrYRFHARsH6i0U06GPBcctBGDGHP4BG9E4ATr1ZHq8vIeBOU5aqz
	 18jkLV9sq+xTXjETXH6wtyuYAPXe1EXBf1rgxYood6NLOKPmhVnlBYq2iRIYSA+LKX
	 85+5U6A64sknGJGNsPDlOrNqdzeR4XlW3Nq0wbljYoBc/u4IC+HCYSYeykGeXr0ojE
	 NM0iseneynSaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/8] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
Reply-To: sashiko@lists.linux.dev
To: "Michael Riesch via B4 Relay" <devnull+michael.riesch.collabora.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508-rk3588-vicap-v4-3-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-3-6a6cd6f7c90b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:24:45 +0000
Message-Id: <20260508232446.F3C46C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unconditional overwrite of shared RKCIF_MIPI_CTRL register clears =
other bits and risks RK3568 regression.
- [High] Sleeping in atomic context due to mutex acquisition in the hardirq=
 handler.
- [High] Incorrect read-modify-write on a Write-1-to-Clear (W1C) interrupt =
status register leads to lost interrupts.
- [High] Unhandled hardware power state causes an asynchronous external abo=
rt (SError) in the shared IRQ handler.
--

commit 8bafc9e50c3973309c417c259fe6059984848b43
Author: Michael Riesch <michael.riesch@collabora.com>

media: rockchip: rkcif: add support for rk3588 vicap mipi capture

The RK3588 Video Capture (VICAP) unit features a Digital Video Port (DVP)
and six MIPI CSI-2 capture interfaces. Add initial support for this variant
to the rkcif driver and enable the MIPI CSI-2 capture interfaces.

> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b=
/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 9e67160a16e46..ad083dc9f5add 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c

[ ... ]

> @@ -481,6 +489,132 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vic=
ap_mipi_match_data =3D {
>  	},
>  };
> =20

[ ... ]

> +const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data =
=3D {
> +	.mipi_num =3D 6,

This patch activates the MIPI capture code path for 6 new RK3588 interfaces,
but does this expose an existing locking issue in the interrupt handler?

The interrupt handler rkcif_mipi_isr() runs in hardirq context and iterates
over active streams. If stream->stopping is true, it calls
rkcif_mipi_stop_streaming().

Inside that function, it calls v4l2_subdev_lock_and_get_active_state(),
which internally acquires a mutex.

Will acquiring a mutex within a hardirq context cause a sleeping in atomic
context panic when stopping a stream?

> +	.mipi_ctrl0 =3D rkcif_rk3588_mipi_ctrl0,
> +	.regs =3D {
> +		[RKCIF_MIPI_CTRL] =3D 0x20,
> +		[RKCIF_MIPI_INTEN] =3D 0x74,
> +		[RKCIF_MIPI_INTSTAT] =3D 0x78,

Since this patch adds support for the RK3588 MIPI INTSTAT registers, is it
safe to read them from the shared interrupt handler if the device is
suspended?

The driver requests its main interrupt line using IRQF_SHARED. If a shared
interrupt fires while the RKCIF device is runtime-suspended and its power
domains are disabled, the kernel will still invoke rkcif_mipi_isr().

The ISR then loops and reads the RKCIF_MIPI_INTSTAT registers across all
MIPI blocks.

Could reading from a power-gated or unclocked hardware block cause an
asynchronous external abort (SError) and a kernel panic? Should the ISR
verify the device's power state before accessing hardware registers?

Also related to these INTSTAT registers, does the current code handle
Write-1-to-Clear (W1C) bits correctly?

In rkcif_mipi_start_streaming(), the code attempts to clear stream-specific
interrupts using a read-modify-write sequence:

    int_temp =3D rkcif_mipi_read(..., RKCIF_MIPI_INTSTAT);
    int_temp &=3D ~int_mask;
    rkcif_mipi_write(..., RKCIF_MIPI_INTSTAT, int_temp);

By reading the register, clearing its own mask, and writing back the
remaining 1s, does this inadvertently write 1s to the pending interrupt bits
of other active streams?

Could this clear other streams' pending interrupts before the ISR can handle
them, while simultaneously failing to clear its own interrupt bits since it
writes 0 to them?

[ ... ]

> @@ -631,6 +765,13 @@ static int rkcif_mipi_start_streaming(struct rkcif_s=
tream *stream)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
> =20
> +	/*
> +	 * TODO: This bit has a different meaning on the RK3568, but it is
> +	 * set there by default anyway. While correct, this is not exactly
> +	 * nice and shall be reworked during the next refactoring.
> +	 */
> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RK3588_MIPI_CTRL_CAP_EN);

Could this unconditional write clear other configuration bits and cause a
regression on the RK3568?

Because rkcif_mipi_write() translates directly to writel(), this operation
blindly overwrites the entire 32-bit register with BIT(0). Since this code
path is shared with the RK3568 variant, does this destroy any default,
bootloader-initialized, or PHY-related configuration bits?

Additionally, RKCIF_MIPI_CTRL is an interface-level register shared across
up to 4 concurrent streams.

Would updating a single bit require a read-modify-write pattern to preserve
existing configurations from concurrently running streams?

Is this interface-level capture enable bit ever cleared in
rkcif_mipi_stop_streaming(), or does it leave the hardware perpetually
enabled?

> +
>  	ret =3D 0;
> =20
>  out:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-rk3588-vic=
ap-v4-0-6a6cd6f7c90b@collabora.com?part=3D3
