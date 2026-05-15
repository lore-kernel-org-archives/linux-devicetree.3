Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ADC3FA5DF
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832448; cv=none; b=ND5B3jA9um6JupTizhWtaLc4xN5+QrQQxA1E4vCc4SkMHwmmB7gBc/8pIEpXDu0FDmFp8m//lSwncseR8bMDr9CzaS63pMSJguYCXWVaCcpTiFKku9iDLsBFclG6ArMTP+3l0vNmbLsakX0cTJoR4jJRQjHCwkoiphshPFZ2/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832448; c=relaxed/simple;
	bh=FWEZ6zmtCgVhUVIfIhpxRAe3MC0K98sdNAHniA2jUhE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hGDmW2/aRqQpSCEA3YjJ5j/EbkPu58+oVjrHpwzaUPlcAuMr0SGv7TvqEO7ux+YXVMuD15K2wYW5RjNOF79xpxY5pnK+koEkx9givozPCfsJpe/YMLArnLciI0hThHBWCIQQWPoHgZQ9kbTezv9rhgJ5c0tIN5re+lyINz7swFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPsx+p5m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPsx+p5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5CDC2BCB0;
	Fri, 15 May 2026 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832448;
	bh=FWEZ6zmtCgVhUVIfIhpxRAe3MC0K98sdNAHniA2jUhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jPsx+p5mUr0PSGW+7ywjb4k0MANtr6FYx3a3YeI4lATZzD+zCNApPSK1FLan8MZEu
	 PKFKiWtJ/XWBNJx60As3//NeP4/UiS/sw75GsR2yLvi9Cw8sfv0I1BIHW8hG3wzNkL
	 6JJhneDHzsoBvk+HWL9BWcjXWbDUrq5xLA/W4tq6VLK2abdP9ys8LYi4Cw7Hj33j8s
	 tsVwDXzmfexNkaEgVLGjDON/o6hP5/KW2cuYR5s2c3v33k16szIDbc7cafpizjpjWx
	 x49xrnYQzt/MkWMVPIjGtgm+4OurcVDcNTGbmqSa85jnc34I8VEevGPfWqIs+Zci6M
	 73wjVC05DPJKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: Convert xilinx-xadc
 bindings to YAML schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pramod Maurya" <pramod.nexgen@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515075736.172172-2-pramod.nexgen@gmail.com>
References: <20260515075736.172172-2-pramod.nexgen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 08:07:27 +0000
Message-Id: <20260515080727.BD5CDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The channel subnode 'reg' property is missing the 'items' constr=
aint block to restrict the valid channel numbers, contradicting the commit =
message.
--

commit fd4f54c07b6e4f122c96ac428cd51a740a0e5ca2
Author: Pramod Maurya <pramod.nexgen@gmail.com>

dt-bindings: iio: adc: Convert xilinx-xadc bindings to YAML schema

Convert the Xilinx XADC and UltraScale System Monitor device tree binding
from the legacy plain-text format to a YAML schema, enabling automated
validation with dt-schema.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..06a0ce4983523
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
[ ... ]
> +    patternProperties:
> +      "^channel@([0-9a-f]|10)$":
> +        type: object
> +        description:
> +          Represents an external channel connected to the ADC.
> +
> +        properties:
> +          reg:
> +            description: |
> +              Pair of pins the channel is connected to.
> +                0: VP/VN
> +                1: VAUXP[0]/VAUXN[0]
> +                2: VAUXP[1]/VAUXN[1]
> +                ...
> +                16: VAUXP[15]/VAUXN[15]
> +            maxItems: 1

The commit message states: "Fix reg constraints inside channel subnodes to =
use
maxItems and an items block rather than bare minimum/maximum keywords which
are silently ignored on array types."

Is the items block missing from this property? Without an items constraint
defining the minimum and maximum limits, the schema might accept invalid
out-of-range hardware pin mappings. Could an items block be included here to
enforce the 0 to 16 limits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515075736.1721=
72-1-pramod.nexgen@gmail.com?part=3D1
