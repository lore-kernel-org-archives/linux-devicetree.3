Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C8376BF2
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789781071; cv=none; b=YodoLiES4NvayOpWsOfHW5Y4iegfJG/CAL9yxa7J2WhzkPx0TA2bfxmTX0Pk785+EL12/VdF9rQ5v8ecygkze0vlm3MFKmshBOiUx0NdXdUUvqgRYEHNgSv2CRJU8V/MEQop16jKUoEmHqfjE+ZcRAWeUe5lKojyoho20Srzefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789781071; c=relaxed/simple;
	bh=PROzRhaajEBvEfAtghHYUIdx0vU9DHjkp/Tz/P0qqvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O1Al8fLTV7JA0mB+7BItUVLs6HN8Cd5A2p6fJycBZn6KOvZVRhxfgNiSu5NwT2tRL+i4hFAlsKzGfcPvoe0rc4zy6rQidJHHj5lYMTfiaiTYc0+VotgJZkqJlM5zdG/GPooMH+WztZ+ypwiU8jnuibux0rgmjO+5J6G/ldhTU3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/oT9zsN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/oT9zsN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59101F000FF;
	Sat, 19 Sep 2026 01:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789781069;
	bh=a+Mh+MkLF52XrdhKnlGyXIaAWqVwOU5PQXUpbO2DycQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/oT9zsNO6dDdc3iM84GTCP+uBGTnWzl66nCj92E6Qf+X8sb/q8tV9B+Qv1P3c9pB
	 VZRPaNTdTD6ngcDv+uI11f0vHnFcxxagvKnh+MTBz20Rzd5rNbG63XD9I2RTiOxMrf
	 bXXKdjDY3pq3no50KSCubEwufvD2o3YkDj2MHUnEsjtNCgeepMTtu85rRzp5M985kE
	 J5SWySD/izgWRSUagzavWMYUcNZbGSrTcv1RoDXGxeXkKzMzo47HygtxR6egEYXr1i
	 ZLGyb2cA9Sb/zodwm+DOtOhcmjQqq1IVl64qPhyXFIGXcVloIyvDDonKDUtisvUYVe
	 fqjpBMjDFPbNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: misc: add binding for Xilinx AXI4-Stream
 FIFO MM S
Reply-To: sashiko-reviews@lists.linux.dev
To: Daniel28972897 <danyboy28sep@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260919011417.156828-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 01:24:28 +0000
Message-Id: <20260919012428.A59101F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dt-bindings: misc: tx-fifo-depth documented in bytes instead of wo=
rds
- [Medium] dt-bindings: misc: additionalProperties false rejects valid prop=
erties
- [Low] dt-bindings: misc: incomplete migration leaves orphaned text binding
--

commit b044052b8807822a68aa39048ff207a8df629e04
Author: Daniel28972897 <danyboy28sep@gmail.com>

dt-bindings: misc: add binding for Xilinx AXI4-Stream FIFO MM S

This commit adds a YAML binding schema for the Xilinx AXI4-Stream FIFO MM S=
 IP
core, which is supported by the axis-fifo driver. It documents the compatib=
le
strings and six properties required by the driver.

>     The axis-fifo driver (drivers/staging/axis-fifo/axis-fifo.c) has
>     supported the "xlnx,axi-fifo-mm-s-4.1", "xlnx,axi-fifo-mm-s-4.2" and
>     "xlnx,axi-fifo-mm-s-4.3" compatible strings since it was added, but no
>     devicetree binding schema exists for them, which checkpatch.pl flags:

[Severity: Low]
Is the claim that no binding schema exists accurate?

The original text binding in drivers/staging/axis-fifo/axis-fifo.txt already
documents this hardware. This commit creates a new YAML binding but fails to
remove or update the existing comprehensive text binding, leaving split and
conflicting documentation in the tree.

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 0000000000000..56d58b37b71ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

[ ... ]

> +  xlnx,rx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Depth, in bytes, of the receive FIFO.
> +
> +  xlnx,tx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Depth, in bytes, of the transmit FIFO.

[Severity: High]
Does the driver expect these depths in words rather than bytes?

If a user follows this YAML and specifies a depth in bytes (e.g. 2048 for a
512-word hardware FIFO), the driver will erroneously permit writes up to 20=
44
words.

The driver enforces maximum write sizes via
words_to_write > (fifo->tx_fifo_depth - 4) and calls
wait_event_interruptible() waiting for hardware FIFO vacancy to reach the
requested amount. Since the physical FIFO only has 512 words, this condition
will never be met, causing an infinite wait when a user writes data larger
than the actual hardware capacity.

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
Does setting this to false reject valid device trees?

Xilinx generation tools produce numerous hardware properties like
xlnx,axis-tdest-width and xlnx,axi-str-rxd-protocol which are explicitly
defined in the original axis-fifo.txt.

This new schema omits those valid properties, causing dtbs_check to wrongly
reject existing hardware configurations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919011417.1568=
28-1-danyboy28sep@gmail.com?part=3D1
