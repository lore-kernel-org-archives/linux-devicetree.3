Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B1625
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833963; cv=none; b=QXzD/LnwLnsL4mAgeeD3myqCjzpin1pESitVxfsSZKfv7pgQm6ci6ubAG277mEuMnXGKhRGh1mlGWXEdEhkUn0ZVPndstqNyi9vdcUo+pAIWnb3jwgjOj98ZSRWi08Vd7+DhmMytEPWLIaHzrly3t0hmznWriDg8ggUv1B/JDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833963; c=relaxed/simple;
	bh=bSM9+6WSn5z6t5QHAAFpsO4drWG+tXJBnWa8qWcKqUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzoKk083Y6UNsZEuBzLHXONyRxtcHnmg/yiVPUhkh6jEdo1rTPdzgK+hl9fAg6NL97AIL7+epm8kA29TZPBwSg8sN8k31zvYr4ual4m8zirPy86W5yn4bD5lkBRpwhBTsZty2P/VEe/GMDZTJGn7faUY+nWthmFUMqcmGqF0JvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCSAcDp3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCSAcDp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8728C2BCB0;
	Fri, 15 May 2026 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833962;
	bh=bSM9+6WSn5z6t5QHAAFpsO4drWG+tXJBnWa8qWcKqUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QCSAcDp34YFwG9VMFKspJQmQaOuBdJPHkmab3nqhtM4oSPpWpShaYuY/g2N7S6jUx
	 ooxZZ+Tvzopc96DP1olSsGr0OO+mgANa+nEMibRC81OAB7bHGIJgHraw0PAWqm4/Jp
	 QbhYrKbqs/hDML2gAR5b4HrUgnrbonukAu+mLcLsJgA7aako7cBFBCb6E6v0E0F6Tf
	 wqhTw3LQ81wz2UKtmmYaKdNulEjaxJLNCWbwrulxxWT2ili8vyNAyuBZWwL1FtFROj
	 K3xHE5mo6WdUtu7fusY1BbgCldnAHjFoVXtjYQsDpNo8wxpLTELO75O0ltcHWRaV/D
	 ln9kziPZM0FBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: misc: Add binding for Xilinx
 AXI-Stream FIFO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pramod Maurya" <pramod.nexgen@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515075736.172172-4-pramod.nexgen@gmail.com>
References: <20260515075736.172172-4-pramod.nexgen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 08:32:42 +0000
Message-Id: <20260515083242.A8728C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The YAML schema incorrectly rejects valid hardware device trees by=
 defining software driver limits instead of hardware IP properties and usin=
g `additionalProperties: false`.
- [High] The axis-fifo driver incorrectly uses register I/O accessors for s=
tream FIFOs, causing data corruption on big-endian architectures.
- [Medium] Stale text binding documentation is not removed.
--

commit 26ea5f81e17b89c4409b6dcc57391cb51c42f3f2
Author: Pramod Maurya <pramod.nexgen@gmail.com>

dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO

This patch adds a YAML schema for the Xilinx AXI-Stream FIFO IP core to
resolve checkpatch warnings about undocumented compatible strings.

>     The binding documents the three supported compatible strings and the
>     vendor-specific properties that the axis-fifo staging driver reads fr=
om
>     the device tree.

Device tree bindings are generally meant to describe the hardware IP rather
than only what a specific software driver currently uses. By only including
properties the driver reads, are we missing fundamental hardware properties?

Also, since this introduces a formal YAML binding for these compatible
strings, should this patch also remove the obsolete text binding at
drivers/staging/axis-fifo/axis-fifo.txt to prevent conflicting documentatio=
n?

>     This resolves the following checkpatch.pl warnings in
>     drivers/staging/axis-fifo/axis-fifo.c:

While not introduced by this patch, the axis-fifo driver mentioned here
appears to use ioread32() and iowrite32() in loops for bulk data transfers
to the FIFO data registers.

Since register accessors perform implicit CPU-to-device byteswapping on
big-endian architectures, does this cause silent data corruption of the byte
stream? Would it be safer to use stream accessors like ioread32_rep() or
readsl() for the FIFO data transfers?

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 0000000000000..f4ef7c277cd7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

[ ... ]

> +  xlnx,axi-str-rxd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width of the receive AXI-Stream data bus in bits. Currently only 32
> +      is supported.
> +    const: 32

Is it appropriate to encode a temporary software driver limitation into the
permanent schema? By strictly constraining this to 32, does this artificial=
ly
reject valid hardware device trees that correctly model an IP configured wi=
th
a different data width?

> +
> +  xlnx,axi-str-txd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width of the transmit AXI-Stream data bus in bits. Currently only =
32
> +      is supported.
> +    const: 32

Similar to the above, does this const constraint improperly embed a driver
limitation into the hardware binding?

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

Since this sets additionalProperties to false but omits properties like
clocks (required for any synchronous AXI block), interrupt-names, and other
properties that were documented in the previous text binding, will valid
hardware device trees falsely fail dt_binding_check validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515075736.1721=
72-1-pramod.nexgen@gmail.com?part=3D3
