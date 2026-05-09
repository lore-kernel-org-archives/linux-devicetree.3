Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775EC307AF0
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778349177; cv=none; b=J6Z4SezvHRIeMlg9Zy3JtwHSzwLg19NKFDxsbYo2WBLI3ZKp/9zy31SxZNPbetacEwyrl2yFmf4pVdreMSWHWR2OAkJDanFWOoXt36MC64nycfom/i29faauJE63V0Xbnr8W0gk4UTOsPueHneEmnDDKlqfyNPEqSY1I8qSolWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778349177; c=relaxed/simple;
	bh=Nl8eJnu/Res1qrZEdyUHK0JGc8zJ7t+HSR4o/pb+HGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sdR8ZSuUlXEDi1vguscF7aBLT5dEqPm4YKfBl/+l4D4WqhprFisaPR9aasFCfBWKESNSCdWvOEW3qROjFTVZp7B62EFJylKEyn550Qk41Nr3jZqWzAI+STr7I9+reTjbwdaaxcGIrg6qaxw5d1HPInJkhYcQacMnE1W0P4NfAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckTTcKcN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckTTcKcN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ABBC2BCB2;
	Sat,  9 May 2026 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778349177;
	bh=Nl8eJnu/Res1qrZEdyUHK0JGc8zJ7t+HSR4o/pb+HGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ckTTcKcNjbwpMX4clB2fxWTsO0JkOWGrC2BxJG2LEX38DWoFZf3w5bpWAvjn7QYvV
	 KBV2zbMijIMsaXh0Z7hKwCk0QuTjq76z4tK8yjDVco0jLkXQONIHSSvZ+qdzWd/sUV
	 qH1IF9glB6tp7Jo/l16iiC/4vclfXVp6FK86TeG+v/J4Cac/5cgQIQBDn7/fx0dm+v
	 lrRqpzgU49ifvkFxoAKGzO5XkQgTGdcqelINecTxS3VgUEuoajdlGcU1N+97yAkJ3H
	 rc5VQPpTxQRgxk7wsRjdIvBNgTtZz89CqrOWU/MQiIkMXCqQvRD0jO/V0eAsTn78rp
	 KMRa/sUXe4PPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: misc: Add binding for Xilinx AXI-Stream
 FIFO
Reply-To: sashiko@lists.linux.dev
To: "Pramod Maurya" <pramod.nexgen@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509171648.46933-1-pramod.nexgen@gmail.com>
References: <20260509171648.46933-1-pramod.nexgen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 17:52:56 +0000
Message-Id: <20260509175256.D9ABBC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] DT Binding ABI Breakage and Duplicate Documentation
- [High] IRQ Race Condition Dropping Unhandled Interrupts
- [High] Incorrect MMIO Accessor Semantics for FIFOs
- [High] Missing Clock Definition and Enablement
--

commit 31b86c7f3095299d0d2eedef1065b0b06442005b
Author: Pramod Maurya <pramod.nexgen@gmail.com>

dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO

Add a YAML schema for the Xilinx AXI-Stream FIFO IP core (PG080).
The binding documents the three supported compatible strings and all
vendor-specific properties that the axis-fifo driver reads from the
device tree.

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 0000000000000..1e07db9cd4565
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx AXI-Stream FIFO
> +
> +maintainers:
> +  - Jacob Feder <jacobsfeder@gmail.com>
> +
> +description:
> +  The Xilinx AXI-Stream FIFO (PG080) provides a memory-mapped interface =
to
> +  an AXI-Stream FIFO IP core. It allows a processor to transmit and rece=
ive
> +  AXI-Stream packets via simple MMIO register reads and writes.

Does the driver use the correct MMIO accessors for the FIFO data?

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_write() {
    ...
	for (int i =3D 0; i < words_to_write; ++i)
        // driver loops over the stream data offsets using iowrite32
    ...
}

According to the I/O Accessors subsystem guidelines, FIFOs and stream-orien=
ted
hardware must exclusively use stream accessors (e.g., ioread32_rep(), reads=
l())
to preserve memory-to-device byte order.

Since the driver loops over the stream data offsets using ioread32() and
iowrite32(), won't these accessors enforce CPU-to-device endianness convers=
ion
and cause data payloads to be incorrectly byte-swapped on big-endian
architectures?

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,axi-fifo-mm-s-4.1
> +      - xlnx,axi-fifo-mm-s-4.2
> +      - xlnx,axi-fifo-mm-s-4.3
> +
> +  reg:
> +    maxItems: 1

Does the binding need a clocks property to avoid a regression on power
management?

The Xilinx AXI-Stream FIFO is an AXI peripheral that requires an active AXI
clock (e.g., s_axi_aclk) to perform register transactions.

In the driver, axis_fifo_probe() maps the registers and performs MMIO writes
without requesting or enabling a clock via clk_prepare_enable().

If the clock is disabled by the bootloader or a power management unit, won't
these register accesses cause a synchronous external abort and crash or hang
the system?

> +
> +  interrupts:
> +    maxItems: 1

Does the driver's interrupt handler have a regression where unhandled
interrupts are dropped?

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_irq() {
    ...
	ier =3D ioread32(fifo->base_addr + XLLF_IER_OFFSET);
	isr =3D ioread32(fifo->base_addr + XLLF_ISR_OFFSET);
	intr =3D ier & isr;
    ...
	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);

	return IRQ_HANDLED;
}

Because XLLF_ISR_OFFSET is a Write-1-to-Clear register, unconditionally wri=
ting
0xFFFFFFFF (XLLF_INT_CLEAR_ALL) acknowledges and clears all interrupts, inc=
luding
any new ones that the hardware asserted between the read and the write.

If a TX or RX complete interrupt fires in this narrow window, won't it be c=
leared
without being handled, causing the wait_event_interruptible() threads to ha=
ng?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - xlnx,axi-str-rxd-tdata-width
> +  - xlnx,axi-str-txd-tdata-width
> +  - xlnx,rx-fifo-depth
> +  - xlnx,tx-fifo-depth
> +  - xlnx,use-rx-data
> +  - xlnx,use-tx-data
> +
> +additionalProperties: false

Will this cause a regression for existing device trees?

The original text binding in drivers/staging/axis-fifo/axis-fifo.txt requir=
ed
properties such as interrupt-names, xlnx,axi-str-rxd-protocol,
xlnx,has-axis-tkeep, and many others describing physical hardware parameters
generated by Xilinx synthesis tools.

By omitting these properties while setting additionalProperties to false, w=
on't
this cause spurious dtbs_check validation errors for existing, correctly fo=
rmed
device trees?

Additionally, since the legacy axis-fifo.txt file is not deleted in this
commit, does this create duplicate and conflicting sources of truth for the
hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509171648.4693=
3-1-pramod.nexgen@gmail.com?part=3D1
