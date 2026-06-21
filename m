Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12627224F3
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782056048; cv=none; b=AzzKVa/821Hvnv1xalKihAkyUlfC/TX42SZFU12flJDdFiOWoqJAYzDUyjQ5b1L7WuCIYrgVA3P2vqsk2bks1RhfvNFPPrD4yNlDPRw9/xtaDT+V2LhEA7uJyGW2gDTqHmyS96tWo7g0+aIx86l0Jiuzc6mceX7WnlbeVxw1mrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782056048; c=relaxed/simple;
	bh=pKFWflkKD3e/9kroo1CgZu7WYpM/zMCO7/zVUjmYO/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f2H1vfT9geJ5v8X1QnY0mf4EBeS7ZVz2/3xWRw4vgIYg9qiGm+iPzowvljYD+YVekqdTvcdpuqaXDSkqcjYRltw7WrTgEAzmlO6V5/ZAJtgVTeoFreWQSNMJxgaMM+k9Ulz/99dpbSS4nnsNhORcuT+oj7fGIM3vdRtsJJeRGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d318P30C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d318P30C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E4A1F00A3A;
	Sun, 21 Jun 2026 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782056046;
	bh=tN5SKMF+ylOxwoiNM5ZTTLUdXHeyVihmDnOx44NdGtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d318P30CU98+YXE/KKjNoDgcX8FFuvsD/S3kmg1CMb9/MrnQ3F51ptHN/h9hHNmLH
	 PZWWeXPLFDV6PKZC1bY/FWxRrXk3ERPXPDQusxGGmj2j2zwwD4nQBbIftvmgYvTDkO
	 50bmg86AqsYbDpNKX0zU1sAzxavSKlLKrBOqvyXy2iDuvCiBMktiOU5Ng08U9RZDlD
	 nJopn9N6kA8TvArESggIoN8f6Rq48FoZXiSUiILt720sEgoKDpGmC5bjA4mqyMaLgF
	 lFcFYPrxHXljZybfxWg0IhNxIvE2R3CEd5O8ifIotBasyMLssKXx+jgsEjjFJ4ENJL
	 FGVOZycyT0b4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: misc: add binding for Xilinx AXI-Stream
 FIFO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Chari" <adi25charis@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260621091953.53281-1-adi25charis@gmail.com>
References: <20260621085209.52651-1-adi25charis@gmail.com>
 <20260621091953.53281-1-adi25charis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jun 2026 15:34:06 +0000
Message-Id: <20260621153406.81E4A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Missing `$ref` type definition for custom string properties in DT b=
inding.

Pre-existing issues:
- [Critical] Use-After-Free on device unbind due to lack of synchronization=
 with open file descriptors.
- [High] Integer underflow in bounds check allows bypassing transmit packet=
 size restriction.
--

commit 97e86b437f0cf66fc60eec47c4742a54db8053f8
Author: Aditya Chari <adi25charis@gmail.com>

dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO

The axis-fifo driver's compatible strings were undocumented, flagged
by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a YAML devicetree
binding document for drivers/staging/axis-fifo, converted from and
replacing the existing free-form text binding (axis-fifo.txt), which
this patch removes.

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,221 @@
[ ... ]
> +  xlnx,axi-str-rxd-protocol:
> +    description: AXI-Stream receive data protocol. Ignored by the driver.
> +    enum: [ XIL_AXI_STREAM_ETH_DATA ]
> +
> +  xlnx,axi-str-txd-protocol:
> +    description: AXI-Stream transmit data protocol. Ignored by the drive=
r.
> +    enum: [ XIL_AXI_STREAM_ETH_DATA ]
> +
> +  xlnx,axi-str-txc-protocol:
> +    description: AXI-Stream transmit control protocol. Ignored by the dr=
iver.
> +    enum: [ XIL_AXI_STREAM_ETH_CTRL ]

[Severity: Low]
Do these custom string properties need a $ref to types.yaml?

Device tree schema validation (dt_binding_check) requires custom properties
to explicitly specify their type. Providing an enum of strings might not be
sufficient for dt-schema to infer the type, which could cause type missing
or unknown schema validation errors.

Should these properties include a $ref: /schemas/types.yaml#/definitions/st=
ring
constraint?

[ ... ]
> +  xlnx,tx-fifo-depth:
> +    description:
> +      Depth in 32-bit words of the transmit FIFO, as configured in the
> +      IP core.
> +    $ref: /schemas/types.yaml#/definitions/uint32

[Severity: High]
This isn't a bug introduced by this patch, but should we add a minimum: 4
constraint here to protect against an integer underflow in the driver?

In drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_write(), the bounds check
assumes tx_fifo_depth is at least 4:

    if (!words_to_write || (len % sizeof(u32)) ||
        (words_to_write > (fifo->tx_fifo_depth - 4)))
        return -EINVAL;

If the device tree configures xlnx,tx-fifo-depth to a value less than 4, th=
is
subtraction underflows to a massive unsigned integer, bypassing the bounds
check. This could allow an oversized packet to trigger a Transmit Packet
Overrun Error in the hardware.

[ ... ]

[Severity: Critical]
This is a pre-existing issue in the driver documented by this binding, but =
is
there a use-after-free vulnerability during device unbind?

The driver allocates its core state using devm_kzalloc():

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_probe() {
    ...
    fifo =3D devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
    ...
}

During removal, it deregisters the misc device but doesn't wait for active
VFS file references to be dropped:

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_remove() {
    ...
    misc_deregister(&fifo->miscdev);
    ...
}

When axis_fifo_remove() returns, the devres layer automatically frees the
axis_fifo structure. If a user process holds an open file descriptor and
subsequently calls write() or read(), it will dereference the freed pointer:

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_write() {
    struct axis_fifo *fifo =3D f->private_data;
    ...
}

Should the driver use a different allocation and reference counting strategy
to ensure the memory remains valid as long as the file descriptor is open?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621091953.5328=
1-1-adi25charis@gmail.com?part=3D1
