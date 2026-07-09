Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65333065C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609709; cv=none; b=Xj4P4hM0Qwpp0E9GN/Is5h77cewfuQ9U7qcKjmPEfnWODgNWlwWPOlBhCpDzQ30PINu6sQ7l3WTnqLEghW16as4OUHouv4gTU4qlI1Zz4wEIIErm5F6yqYrn8r6eKUeRXfmDU29To6jpiPef4XzlERPPOaD9HPNEVcoFo9HVbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609709; c=relaxed/simple;
	bh=RKF2jMK59JOlF3Nu54zbo6sTjUxLehK+w0K+QHOKw5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b5bSGobxWrazEWpiKMrIpVRm/LKqAnL3nIClx/haZiABT4kzpFuGkdIbI90Waxso6pgUXbj5raF/pV4NTFoDua9vhh85n6u4ecIXLu+bIAxVIqGZPjCtztAC2ozINklZNMZSBgVG+GS1zwj/mW4QMNRKRIwe9u+G57sfRkYmrc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmou7pFN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmou7pFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448801F000E9;
	Thu,  9 Jul 2026 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783609707;
	bh=AkPepD7CY0E39sM/DYdfh0I/Qc156x25r4kDFYfnGFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmou7pFN2ndm3dHkx7Msa9ICI9eaE3tA4dJ41avWxmE/AifTjfG2U5Hvl8DfrkMAw
	 DCT2lmWHKQXXbKs97w7rOCsQvwgJdhOzGy8X/6Y35Ke+HydwEFbjHNlrIfMrLfsViE
	 lqZYSV+HnzwAhL1ADshnYQMGrmYI6u2fQtveU2x8Z4Gd2lg9PfjJ9T77/7sDuiUlcf
	 dNT+AQCcWeLoFTPvNxePKhnwpwjjePo9lQb49OmqRrDajYbS+cch2gRHyk4/308VyU
	 aAoMwRVvTxcb65m46ZNtAvaT6MvV7Awsy1VMbruEuvyrOHBpWqee+3u8m5ISSB+b3t
	 DzHs+tOLNWqUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 08/11] spi: dw: adjust size of mem_op
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709055204.138168-9-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-9-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:08:26 +0000
Message-Id: <20260709150827.448801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] A guaranteed divide-by-zero exception occurs in `dw_spi_exec_e=
nh_mem_op()` when executing SPI operations that lack a dummy phase.
- [High] Clamping memory operation size to 65536 overflows the 16-bit NDF h=
ardware register for Transmit-Only operations in enhanced mode.
- [High] Enhanced SPI mem ops disable the controller before the hardware fi=
nishes transmitting, causing trailing data loss.
- [High] Incorrect dummy cycle bounds check in Enhanced SPI mode allows `wa=
it_c` overflow, leading to zero dummy cycles.
- [High] Incorrect FIFO write order for addresses larger than 32 bits in En=
hanced SPI mode causes endianness reversal.
- [High] A hardcoded 5=C2=B5s delay (`udelay(5)`) after asserting Chip Sele=
ct leaves the RX FIFO susceptible to unhandled overflow on high-speed SPI b=
uses.
--

--- Patch [8]: [PATCH v1 08/11] spi: dw: adjust size of mem_op ---
commit 1cc8ff7449ec8b3ec7ea070e7ac5dce9adb45f0c
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: adjust size of mem_op
   =20
This patch adjusts the size of the data that can be sent or received
in enhanced mode, utilizing the new bounds to set the NDF register
appropriately.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -576,6 +576,13 @@ static int dw_spi_target_abort(struct spi_controller=
 *ctlr)
>  	return 0;
>  }
> =20
> +static int dw_spi_adjust_enh_mem_op_size(struct spi_mem *mem, struct spi=
_mem_op *op)
> +{
> +	op->data.nbytes =3D clamp_val(op->data.nbytes, 0, DW_SPI_NDF_MASK + 1);

[Severity: High]
Does this clamp operation cause an overflow when written to the hardware?

If op->data.nbytes is exactly 65536 (DW_SPI_NDF_MASK + 1), writing this
value to the DW_SPI_CTRLR1 register, which is a 16-bit register, will set b=
its
15:0 to 0. This silently truncates maximum-length 65536-byte block transfers
down to 0 frames, which could cause data corruption on large writes.

> +
> +	return 0;
> +}
> +

[ ... ]

> @@ -1017,13 +1024,14 @@ static void dw_spi_init_mem_ops(struct dw_spi *dw=
s)
>  {
>  	if (!dws->mem_ops.exec_op && !(dws->caps & DW_SPI_CAP_CS_OVERRIDE) &&
>  	    !dws->set_cs) {
> -		dws->mem_ops.adjust_op_size =3D dw_spi_adjust_mem_op_size;
>  		if (dws->caps & DW_SPI_CAP_EMODE) {
>  			dws->mem_ops.exec_op =3D dw_spi_exec_enh_mem_op;

[Severity: Critical]
Does this execution path trigger a divide-by-zero exception when operations
lack a dummy phase?

In dw_spi_exec_enh_mem_op(), the dummy cycles are calculated like this:

drivers/spi/spi-dw-core.c:dw_spi_exec_enh_mem_op() {
    ...
    enh_cfg.wait_c =3D (op->dummy.nbytes * (BITS_PER_BYTE / op->dummy.buswi=
dth));
    ...
}

When an operation has no dummy cycles, the SPI core leaves op->dummy.buswid=
th
initialized to 0. Due to C operator precedence, the division happens before=
 the
multiplication, which triggers a divide-by-zero exception unconditionally on
basic commands like Read ID.


[Severity: High]
Can this sequence cause trailing data loss by disabling the controller
prematurely?

When the IRQ handler signals transfer completion:

drivers/spi/spi-dw-core.c:dw_spi_enh_handler() {
    ...
    spi_finalize_current_transfer(dws->ctlr);
    ...
}

The main thread wakes up and immediately stops the operation:

drivers/spi/spi-dw-core.c:dw_spi_exec_enh_mem_op() {
    ...
    dw_spi_stop_mem_op(dws, mem->spi);
    ...
}

This disables the controller (dw_spi_enable_chip(dws, 0)) without waiting
for the BUSY bit to clear. Doing so clears internal FIFOs and abruptly abor=
ts
ongoing transmissions on the wire.


[Severity: High]
Does the bounds check for dummy cycles allow an overflow that results in
zero dummy cycles being executed?

In dw_spi_supports_enh_mem_op(), the check allows up to 32 dummy cycles:

drivers/spi/spi-dw-core.c:dw_spi_supports_enh_mem_op() {
    ...
    if (op->dummy.nbytes !=3D 0 && op->dummy.nbytes / op->dummy.buswidth > =
4)
    ...
}

However, the WAIT_CYCLES field in SPI_CTRLR0 is 5 bits wide. Passing
wait_c =3D 32 to FIELD_PREP() in dw_spi_update_config() with a 5-bit
mask silently truncates the value to 0:

drivers/spi/spi-dw-core.c:dw_spi_update_config() {
    ...
    cr0 |=3D FIELD_PREP(DW_SPI_ENH_CTRLR0_WAIT_CYCLE_MASK, enh_cfg->wait_c);
    ...
}

This would cause the hardware to execute 0 dummy cycles instead of 32,
destroying data synchronization on subsequent reads.


[Severity: High]
Does the FIFO write order for addresses larger than 32 bits cause an
endianness reversal?

In dw_spi_enh_write_cmd_addr(), the lower 32 bits are written before the
upper 32 bits:

drivers/spi/spi-dw-core.c:dw_spi_enh_write_cmd_addr() {
    ...
    dw_write_io_reg(dws, DW_SPI_DR, lower_32_bits(op->addr.val));
    if (op->addr.nbytes > 4) {
        /* address more than 32bit */
        dw_write_io_reg(dws, DW_SPI_DR, upper_32_bits(op->addr.val));
    }
    ...
}

Since the controller transmits FIFO words in the order they are written, the
lower 32 bits are sent over the wire first. The SPI protocol mandates sendi=
ng
the highest byte first, which could result in accessing incorrect addresses=
 on
the flash device.


[Severity: High]
Can the hardcoded 5 microsecond delay leave the RX FIFO susceptible to
overflow on high-speed SPI buses?

In dw_spi_exec_enh_mem_op(), the CPU sleeps while the hardware is active:

drivers/spi/spi-dw-core.c:dw_spi_exec_enh_mem_op() {
    ...
    dw_spi_enh_write_cmd_addr(dws, op, mem);

    udelay(5);

    dw_spi_enh_irq_setup(dws);
    ...
}

Asserting the chip select inherently starts the clocking of SPI data. On a =
fast
SPI bus, the hardware will receive many bytes during this 5 microsecond del=
ay.
Because RX FIFO depths are limited, the FIFO could overflow while the CPU
sleeps before the interrupts are unmasked, failing the transfer.

>  			dws->mem_ops.supports_op =3D dw_spi_supports_enh_mem_op;
> +			dws->mem_ops.adjust_op_size =3D dw_spi_adjust_enh_mem_op_size;
>  		} else {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D8
