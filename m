Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD89C15B971
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782049431; cv=none; b=C9yATNknz8agJZz4CAPZvlUeIKQ/BqAPo8n57HR/I2yFJn+b2fhpN6buEr9lu1dSpZMVlo0ZnRVwe6uHqTdBdQ3lwhs+V/9zdJaYoQCQbdXHe9KAXVPB4efSOF/mA3MNqtScg4Cg5hlfmAfRJMmJmMsYXyYtuYjzBxVbTDnCisU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782049431; c=relaxed/simple;
	bh=8ysIgUom6C6o9latYDC+aiw57uHdl4sgAscggbKjr0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZLt1H7pH0PpbESLSWryES3iB/NLLNY1thRMtU4zsV+6KxxrMi5GUCHOL7hc0dC+HKmbvdVt2AQs5FeBdaU+24H4ibNH+FnGAQDfWBuMixvhcf8z00FM/SjEcAcF4ZNxUO7Fi6CHYjRXMk1fVx8K/3p/aWrZP4jDQh+JViY7jPVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy153fBx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy153fBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2B21F000E9;
	Sun, 21 Jun 2026 13:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782049429;
	bh=d0rqveRGH2A0Njj4Hz3XOvgIHSf0GCfoxNNh4jOq/zM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gy153fBxb8vKabUM0TADgB1j44FLmln9B5xpHJ3B3XZf8bXKRav/fmUpn0pTa1v0j
	 bmRmTBsyZg850kiCCsxTl7x9xUtD7EZX0a9NJR8RJrtKQyPW8BVQOkWxf+4z0egZ+6
	 ItB1x8jt/a2ln+ubyN8Lt6K7N2TgbF1hCu7rV6ZOoP4nd7y4nWz+jUkQ4P3D1Ql47z
	 X3dkcoKHvNteXqdMDmVUbdNAlZBVBCCwQ8oxM+Sgc3mHrM2dcBVEV1edeQLURPi8Fq
	 cUyZ+aspS2tngzeDKIw9mgdnq5OuvLU9xFknXu/V3elscCiPYOY3k644hufZAbuUO2
	 TXxWRSjwfmdVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: misc: add binding for Xilinx AXI-Stream
 FIFO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Chari" <adi25charis@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260621085209.52651-1-adi25charis@gmail.com>
References: <20260621085209.52651-1-adi25charis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jun 2026 13:43:48 +0000
Message-Id: <20260621134349.1B2B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The YAML binding incorrectly documents the FIFO depth properties a=
s being in 'bytes', while the driver and hardware expect them in 'words'.
- [Medium] The schema omits valid hardware properties while enforcing `addi=
tionalProperties: false`, falsely restricting the device tree to only the p=
roperties the current driver implementation reads and causing valid hardwar=
e device trees to fail schema validation.
- [Medium] Hardware data width properties are artificially constrained to `=
const: 32` based on driver support rather than hardware capabilities.
- [Low] The previous text-based binding document was not removed.

Pre-existing issues:
- [Critical] A pre-existing use-after-free vulnerability occurs if the devi=
ce is unbound while userspace holds an open file descriptor.
--

commit 1499d3b34c3ed26799e82ed6630ba1f50a8aec04
Author: Aditya Chari <adi25charis@gmail.com>

dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO

The axis-fifo driver's compatible strings were undocumented, flagged
by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a devicetree
binding document describing the required properties
for drivers/staging/axis-fifo, derived from the properties
the driver reads via of_property_read_u32()
in axis_fifo_parse_dt().

> dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO

[Severity: Low]
Should the previous text-based binding document be removed in this patch?

It looks like the legacy drivers/staging/axis-fifo/axis-fifo.txt binding
was left in the tree, leaving two conflicting sources of truth for the
same hardware compatible string.

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 0000000000000..8ef0adde32ad8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

[ ... ]

> +  xlnx,axi-str-rxd-tdata-width:
> +    description:
> +      Width in bits of the AXI4-Stream receive data interface. Only a
> +      width of 32 is currently supported by the driver.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 32
> +
> +  xlnx,axi-str-txd-tdata-width:
> +    description:
> +      Width in bits of the AXI4-Stream transmit data interface. Only a
> +      width of 32 is currently supported by the driver.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 32

[Severity: Medium]
Should this schema describe the hardware capabilities rather than the softw=
are
limitations?

Over-constraining the schema to const: 32 based on current driver support
might cause validation errors for device trees that accurately represent
hardware synthesized with different bus widths.

> +  xlnx,rx-fifo-depth:
> +    description:
> +      Depth in bytes of the receive FIFO, as configured in the IP core.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  xlnx,tx-fifo-depth:
> +    description:
> +      Depth in bytes of the transmit FIFO, as configured in the IP core.
> +    $ref: /schemas/types.yaml#/definitions/uint32

[Severity: High]
Is it correct to document these properties as being in bytes?

Looking at the driver code, it evaluates the depth as word counts when chec=
king
for overflow:

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_write() {
    ...
    if (words_to_write > (fifo->tx_fifo_depth - 4)) {
        ...
    }
    ...
}

If a devicetree author specifies the depth in bytes per the new YAML
documentation, could the driver load a value four times too large, allowing
out-of-bounds writes that might trigger a hardware transmit overrun error?

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

[Severity: Medium]
Does this schema artificially restrict the devicetree by omitting valid
hardware properties?

The original text binding allowed properties such as xlnx,has-axis-tkeep
and interrupt-names. Because the schema enforces additionalProperties: fals=
e,
will running dt_binding_check on existing, valid device trees generated for
this IP result in false-positive validation errors?

[Severity: Critical]
This is a pre-existing issue, but does the driver have a use-after-free
vulnerability if the device is unbound while a userspace process holds an
open file descriptor?

In the driver, the axis_fifo structure is allocated with devm_kzalloc() and
I/O memory mapped with devm_platform_get_and_ioremap_resource():

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_probe() {
    ...
    fifo =3D devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
    ...
}

However, axis_fifo_remove() unregisters the character device without tracki=
ng
or waiting for active file descriptors to close:

drivers/staging/axis-fifo/axis-fifo.c:axis_fifo_remove() {
    ...
    misc_deregister(&fifo->miscdev);
    ...
}

If the device is unbound via sysfs while a userspace process keeps the char
device open, the driver core's devres cleanup automatically frees the fifo
structure and unmaps base_addr. Would subsequent read(), write(), or poll()
calls via the active file descriptor then access the freed fifo pointer and
unmapped I/O memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621085209.5265=
1-1-adi25charis@gmail.com?part=3D1
