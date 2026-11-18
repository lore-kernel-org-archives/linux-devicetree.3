Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019329;
	b=qrjfDQmH02NqBOmN6Ge5sNLdjiOTSYI02wQioGrucrLNsGJAMuXkSh3mQ83g+4PQUrAy
	 ULoSx3N+DkuE3iX/tG2kZ3HFvYd4r1hAVD0DudahljCykbTNL4qkjo5Z/y9oor3MhZVk7
	 pLQ/E9+aBtTYDIG5FxboMzxeFn8C3H7w+gEzrC5Am3rqTHEthz6H9+ZvlmN9ofvV6L17V
	 nXAkRMSNEpw1PnLBw9gNUnbhEQHGP9LfruesUNen9FI0TSVBP0YfPCa+EheNsjVFOCtKB
	 Bl5TdXTyTddXDDnsBS5VmJ+8/O/7lTZxqiEPEMDAKq5100Pu1traqqoIsQSjOser7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019329;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xMfIcPgaVZTBupxAWvjD3tsTuymj4i3EzJ8xT6VI/p4=;
	b=xCQOhIaUNqGBQxk6Nz4hoMFrM/4AOq+ajn9LsN5cppaRoeUEOCukPvH/RIJpIzlKFp6R
	 8+1PDV383HXG344P8hdPVIdxxuYyPghAFKwDLGZdCcAnt8O5vyAtJLzfbpFSWNXkSxJoz
	 ktu3KBYSMJg3lFUf/eN8kUtLWg8e9PFM6+CIdr3x2LYlrmIE9+QWAXwwFoQVtKERwXeOl
	 JHVJ2MdI8/FmtYg0jUDCabl9OKO0/6mzK9WD8kZYruge0cPZwGEPHu18Gp59EaLi1sjOF
	 4ti7h5RmT1AJ2/xR0GSwPphwUXDzzHrwjabAClFyZr9/iHJ6LaTeAYadEqH8zgPbk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PklrzH67;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B7560A260E;
	Wed, 18 Nov 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PklrzH67
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323E21F000C5;
	Wed, 18 Nov 2026 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019329;
	bh=xMfIcPgaVZTBupxAWvjD3tsTuymj4i3EzJ8xT6VI/p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PklrzH67Sm6BG0wMKCibEmN0wipTMtwuYNQTaO0oROI/MLEYX0dxwEq7Fj3dAYGUg
	 TvWFvjHfnOQiSSOvCF1kUX+UY6tAJEhmaD+DQWkLhKK1W3qnSryXdhQdL5K7qQSOXF
	 k7qH+KNrTQzKAPN6dA1Nr9AcJn2fwH+T7WbtolbXXCpzX2gd0LaBQ6TDQY3QsO9ixu
	 9RsmTdVwvaG/ieur/RamGcDyW6ka7+v27m98sRaj7BY9gEuZZcG+buikf1nifjRadX
	 i8bBa7Ql+jkMlAizPEMkCES303wwSlANuqatezeo05bDhkSsBVyx7q+mA6/wI4XbXn
	 oogAb2VkVQaMw==
Date: Wed, 18 Nov 2026 10:28:47 -0600
From: Rob Herring <robh@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
Message-ID: <20261118162847.GA2433918-robh@kernel.org>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
 <20261114182947.2908628-3-suraj.gupta2@amd.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114182947.2908628-3-suraj.gupta2@amd.com>

On Sat, Nov 14, 2026 at 11:59:43PM +0530, Suraj Gupta wrote:
> The XXV Ethernet IP integrates a 10G/25G Ethernet MAC with an in-core
> PCS/PMA driving a high-speed serial transceiver. Its payload is moved by
> an external AXI DMA (or multichannel DMA) controller referenced through
> the dmas/dma-names properties. Document the IP in a dedicated schema
> file.
> 
> Add the "xlnx,xxv-ethernet-1.0" compatible with the 10gbase-r and
> 25gbase-r phy-modes, the rx_core/drp/s_axi clocks and the AXI DMA
> channel properties. The GT transceiver reference clock is described as
> an optional fourth "ref" clock, for boards where it is supplied by a
> Linux-managed clock provider rather than a fixed oscillator.
> 
> Add "xlnx,has-statistics-counters" as well. The statistics counters are
> an optional part of the IP, selected by the "Include Statistics Counters"
> build option (PG210), and unlike the 1G MAC the subsystem has no ability
> register that reports whether they were included, so the devicetree has
> to describe it.
> 
> Require "xlnx,rxmem". The driver reads it unconditionally at probe time
> and fails if it is absent, and the value is what bounds the largest frame
> the device accepts, both when validating a new MTU and when deciding
> whether jumbo frames can be enabled.
> 
> Disallow phy-handle, its deprecated phy and phy-device spellings, and
> pcs-handle. All are inherited from ethernet-controller.yaml, so
> unevaluatedProperties does not reject them, but the subsystem has no MDIO
> bus master and its PCS is in-core, so neither an external PHY nor an
> external PCS can be attached. Constrain managed to in-band-status for the
> same reason; it stays optional, as the link is always managed in-band.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  .../bindings/net/xlnx,xxv-ethernet.yaml       | 146 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
> new file mode 100644
> index 000000000000..caf582c72a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/xlnx,xxv-ethernet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx XXV 10G/25G Ethernet Subsystem
> +
> +maintainers:
> +  - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> +  - Suraj Gupta <suraj.gupta2@amd.com>
> +
> +description:
> +  The Xilinx XXV Ethernet Subsystem implements a 10G/25G Ethernet MAC with an
> +  in-core PCS/PMA driving a high-speed serial transceiver. It supports the
> +  10GBASE-R and 25GBASE-R line rates, with 25G operation following the 25G
> +  Ethernet Consortium specification. Because the PCS/PMA is integrated into
> +  the IP, the subsystem has no MDIO bus master and is not managed through an
> +  external MDIO PHY; link state is read from the MAC's own status registers.
> +  As there is no PHY to manage, the link is always managed in-band.
> +  Any SFP module management (e.g. I2C) is handled by separate IP outside this
> +  binding. Its payload is moved by an external AXI DMA (or multichannel DMA)
> +  controller referenced through the "dmas" property.
> +
> +properties:
> +  compatible:
> +    const: xlnx,xxv-ethernet-1.0

I hope you based 1.0 on something? Looks made up to me.

From here[1], looks like you are missing some versions:

The offset of user configuration registers in the IP was updated (and 
removed in case of USER_REG_1) which breaks backward compatibility of 
any custom user config application code with newer versions of the IP. 
Please make sure to use the correct offset as per the IP version as 
specific below and ignore "XXE_USR0_OFFSET". Please note that this has 
NO impact on the example as this definition is not used.

    Upto IP Version 2.2 https://docs.xilinx.com/v/u/2.2-English/pg210-25g-ethernet, USER_REG_0 is at offset 0x184 and USER_REG_1 is at offset 0x188

    IP Version 2.3 and above https://docs.xilinx.com/v/u/2.3-English/pg210-25g-ethernet, USER_REG_0 is at offset 0x134 and USER_REG_1 is removed

Rob

[1] https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842542/Baremetal+XXV+Ethernet+driver
