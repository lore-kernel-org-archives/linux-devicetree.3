Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD61E7C2E
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782057291; cv=none; b=C0fB9OzEureNzKAu7ta1Dd7jxrz8OvtrPVMRREz465CYT9lZXU/mMjw9nav4Xl/vpmUO7uGHnDfLkWIl3MQEboySZy1KJrCIci6ZhNCwilwHZI6xqUCPjE+hG8AiEONRtsPHF3JLqB0D/dvhrxqT9KXAYDamN7ekCj+5YMrT40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782057291; c=relaxed/simple;
	bh=839Flzm6H9gj4/RGowhgfhM5L7vrjkJEUFT5mXNXU08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QL75DQVPVDKnaJ5Oc8vaVjuvRHmO28BFfWX/i/zrc0iw/9A4mzhBe6gJ2/Dm/KusfZT4uzBUOU9MP9AIBTZzB9vSWR0AlA1ASeTqWaDoBWEU92zZqzeCmV46Aflt+ckCYK8odNz0Pb1+2dm5AEJga1aHR10CZ6tSzyXkSXZ/rUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdx1GQV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdx1GQV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241751F000E9;
	Sun, 21 Jun 2026 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782057290;
	bh=M49/LdBV8Q4ZzB4MvzMEmkWWz5TM87UrX23t1UD1iNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gdx1GQV2pZiM7tFIafI4KNJ1nGCTapZ+6ItU9TwyvU4Paf1rLlP3BerXci7y2hUkN
	 P+fX0/z3zlk28dg63PxK5e1rCOAvaIjTG/98ja6GX/NtpO29GlF0ilEkJGwqG2zuI4
	 KlZmeHM1TSqRZA0vsKQtRjeduW5R5GmmkkEGPuP7q4Lyed0nmPagRbSkEHQZRbjypD
	 vCCoPXu4qQt9KKZBe6EY2tlmJrsCERwV9+naJKJ15i7hPG72sfVWybsmSfzuDubxDg
	 RMwg1qdCz264oXSKKI4dcuID0yh0ALfCwhqEu3WaNob7g4Ud/6xyB0Kc9mUVFhELN5
	 CU3DV6U1u1+ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: misc: add binding for Xilinx AXI-Stream
 FIFO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Chari" <adi25charis@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260621094312.53655-1-adi25charis@gmail.com>
References: <20260621085209.52651-1-adi25charis@gmail.com>
 <20260621094312.53655-1-adi25charis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jun 2026 15:54:49 +0000
Message-Id: <20260621155450.241751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing runtime bounds check for tx_fifo_depth causes integer unde=
rflow and potential DoS
- [High] Unvalidated hardware read can cause massive busy loop and CPU soft=
 lockup
- [High] Hardware interrupts enabled before IRQ handler registration
--

commit cd9dfa74e4b12151a534638f2622f83e05f40fee
Author: Aditya Chari <adi25charis@gmail.com>

dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO

This patch converts the free-form text binding for the Xilinx AXI-Stream
FIFO IP core into a YAML schema. It also enforces a minimum value of 4
for the xlnx,tx-fifo-depth property to match the driver's transmit bounds
check.

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 0000000000000..53bf52524e74d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,227 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

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
> +
> +  interrupts:
> +    maxItems: 1

[Severity: High]
This is a pre-existing issue, but does the driver enable interrupts before
registering the IRQ handler?

Looking at drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_probe():

    reset_ip_core(fifo);

    irq =3D platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

    rc =3D devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
                          DRIVER_NAME, fifo);

And in reset_ip_core():

    iowrite32(XLLF_INT_TC_MASK | XLLF_INT_RC_MASK | XLLF_INT_RPURE_MASK |
              XLLF_INT_RPORE_MASK | XLLF_INT_RPUE_MASK |
              XLLF_INT_TPOE_MASK | XLLF_INT_TSE_MASK,
              fifo->base_addr + XLLF_IER_OFFSET);

If the hardware immediately asserts an interrupt, could this trigger a spur=
ious
interrupt before devm_request_irq() completes, permanently disabling the IRQ
line?

[ ... ]

> +  xlnx,tx-fifo-depth:
> +    description:
> +      Depth in 32-bit words of the transmit FIFO, as configured in the
> +      IP core. Must be at least 4; the driver subtracts 4 from this
> +      value when bounds-checking transmit writes, and a smaller value
> +      underflows that check.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 4

[Severity: High]
This isn't a bug introduced by this patch, but since the binding enforces a
minimum of 4, what happens if a malformed device tree provides a smaller
value?

In drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_parse_dt():

    ret =3D of_property_read_u32(node, "xlnx,tx-fifo-depth",
                               &fifo->tx_fifo_depth);
    if (ret)
        return ret;

The value is parsed without enforcing the boundary constraint.  Could this
lead to an integer underflow later in axis_fifo_write()?

    if (!words_to_write || (len % sizeof(u32)) ||
        (words_to_write > (fifo->tx_fifo_depth - 4)))
        return -EINVAL;

If fifo->tx_fifo_depth is less than 4, this subtraction underflows, bypassi=
ng
the maximum packet size check.

[ ... ]

> +  xlnx,use-rx-data:
> +    description:
> +      Indicates whether the receive data path is present, as configured
> +      in the IP core. A value of 1 enables the receive path, 0 disables =
it.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]

[Severity: High]
This is a pre-existing issue, but does the driver handle hardware read erro=
rs
safely when processing received data?

In drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_read():

    bytes_available =3D ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
    words_available =3D bytes_available / sizeof(u32);
    ...
    if (bytes_available % sizeof(u32)) {
        /* this probably can't happen unless IP
         * registers were previously mishandled
         */
        dev_err(fifo->dt_device, "received a packet that isn't word-aligned=
\n");
        ret =3D -EIO;
        goto err_flush_rx;
    }

If the device is in an error state and ioread32() returns 0xFFFFFFFF,
words_available becomes 0x3FFFFFFF.  Would this cause the error recovery lo=
op
to stall the CPU?

    err_flush_rx:
        while (words_available--)
            ioread32(fifo->base_addr + XLLF_RDFD_OFFSET);

Executing over a billion memory-mapped reads sequentially could trigger the
kernel's soft lockup watchdog.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621094312.5365=
5-1-adi25charis@gmail.com?part=3D1
