Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28A383C8D
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674489; cv=none; b=cCbB8YrUtRhIUITM7O1Uz7FyGIxeDRsekGVnGUomHhrcSsoPru+OipmPAaPAmOzE60nFtw9evjvgLr3fZ4TjEItGadAr6TzYbTW2ZW8SuOpCK6oL4CNycSpHD6s5m7vZNS+xqOU3PQF1Bz721m1TYPoZwJTFO29y6OxvszVcoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674489; c=relaxed/simple;
	bh=+Zytpm9FXTTuYrQ6mlBrz/G+YKHNBxOZR5sKcsiQPHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMh7r6XHiJL1iwaSm4X1sg39YHJH0H7/L1IxKuRKSGoxnsg52yKEYT17A+uASRd++HhcmO1OO1pvJ1JNgeD7ulYr4Zp1PbLmkRhStFMdJSlZE4XU+/2f4f1FANl8+dOkTtI/UDNPNjw7BATFhAFM0mH7FE2qUA1Jr3CEEMVU02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RreD1ojS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RreD1ojS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1168795f8f.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780674486; x=1781279286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIe9PJTXxBHQ0XX31cWOxKtFhK/4Vta8bzAs10DDqbM=;
        b=RreD1ojSSvFRxLANmDwpf73LEaNmskuGnORFmXWq/K39Nqhn4H5NLwHHhyg/NGgwCE
         8kioymVffyFHJssUZVmaGG1B5gWHuvzdiOKfnk/wLXhib9QIxnnUAhVesvSGBbp32oiG
         jtMeDVlm91hQ8i0+wmoN5EtcqvDUcrmFHuMqEFP95HvHAY6g276aZPnIx/Kr47vICIss
         7kp5QPj/EndCJHfR3xtqWJw+1Y3GpoBouOXFHzG+p9sdklzt2V/696G8kso71WeziGvg
         +Vl0DfqTzA/8Mc7msouSI0Cgf0xs9YvFXoxlK3IlsjVQueewCOL8vnPGg13FS6DNu+kT
         wzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674486; x=1781279286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIe9PJTXxBHQ0XX31cWOxKtFhK/4Vta8bzAs10DDqbM=;
        b=SX43szxfmoH8zmt8b1oTPdcq5TiOqBN9SG8dZCIy88WDfdNtmk0muK27MB7wfjYftT
         ufAq09Q/nkpwTOBx8ZdC5rDXmuG06aLF7h5/nFwHyFAl3QzAUyuQorm0tiDQSklo8/sS
         rn/H9cOQVeLfEsj2CV472R0E6HnphB/PUa+LsLyynIyjA7U1xpKCDzPyBWztZ+DDKtEz
         l/BlbZQ6lMgR5KukBl9j10T0nKPRLSp4jWp+y/JspbEA3xm0cBI/6kdPMtoa3AjBpq6o
         GJ2tGDkzPuf57wJY1eUTsNAfqVPLT5Wr+hzpaThxXk5JA5O1HR4WnmFyuccGKjbgc9zs
         l7cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8JhIz2bfzjsSdgfde8q34iLl8o3YxSKr40iih/XQrdvkgkSCfJscydpb4yDsInFL+YnTDAxFb4Fvd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0khss+DNIOB/Ih+sSQdToJsjZ7/JBXQHXtbg/VSIAFuXbtpx
	xGU5ACTDPXcDzczgRWpngduLriCyXdhBCXcB4oxaEOrqcAQFIg2dtYxF
X-Gm-Gg: Acq92OHS2GPRVdxOb3E4js4jJva38PthODvYit14rWDxWS3NZN+hDCL5F2RZwvUSJdz
	BU1/1q5s6pCeWAieItjUKq3jmseddfYNOkI9qUmeG8Y9jLIAw8AlAxTEdwLsUmGzDPRjjmOWJBh
	OouW4PxyzrfSu7vhJtZtIVyhSv+uiW23qAJOQ9wANhWu+qqxfv9UjXmeOg7jI/hqWtDXSGShoI2
	jZHX5z6nLdr3Te3tyNyCcySvSOQS3KeWdfwHPl/v/hAuu4+XgMQsru7r1BfvHdvLQYZciOnEd74
	/ozW9wy3gf860syrQGfUyYUUB2nMFekqXV+4CG9Y1zQ2F/NIqMoLboK4v1WtrzWUYzl2VHolVfp
	UPF7Lz+WFanfmVcJrXJkxNcbiUxfH5De9qv4oaeJDN1+axP0kwqIA2wtvilUkOVbn+nvFNxmIqv
	Wo3al7ahqRd8PB479Hc1u0x/uEcpFLwWJriOc7A9GmletO5amdSwBzgYXKNDXoUFn/6wCWFrXX/
	+3szF4itdAGFVLqEk0cO/ChJkds63Fj/am9oKDUxyV0WvsTXZYh+ogTEYGvxd9i8wifBH61O7/z
X-Received: by 2002:adf:ef88:0:b0:460:1e9d:31a5 with SMTP id ffacd0b85a97d-46030631ba3mr5236539f8f.35.1780674485919;
        Fri, 05 Jun 2026 08:48:05 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f14:5400:d967:4840:e11f:4ad4? (p200300ea8f145400d9674840e11f4ad4.dip0.t-ipconnect.de. [2003:ea:8f14:5400:d967:4840:e11f:4ad4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm27730653f8f.4.2026.06.05.08.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:48:05 -0700 (PDT)
Message-ID: <b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com>
Date: Fri, 5 Jun 2026 17:48:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
To: ricardo@pardini.net, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
 <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
> 
> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
> 
> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
> compatibles documented in their own bindings (e.g. microchip,lan95xx)
> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
> these PCI function nodes can be validated.
> 

The of node seems to be created by of_pci_make_dev_node(). But this
function is called for bridges only in pci_bus_add_device().
So where is the node created in your case? Did you test node creation?

> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
>  .../devicetree/bindings/net/realtek,r8169.yaml     | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek,r8169.yaml b/Documentation/devicetree/bindings/net/realtek,r8169.yaml
> new file mode 100644
> index 0000000000000..6923211ff4c93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek,r8169.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/realtek,r8169.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek r8169 family PCIe Ethernet Controllers
> +
> +maintainers:
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +description:
> +  PCI function node properties for fixed/soldered Realtek Ethernet
> +  controllers driven by the r8169 driver.
> +
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci10ec,8125  # RTL8125 2.5GbE
> +      - pci10ec,8126  # RTL8126 5GbE
> +      - pci10ec,8127  # RTL8127
> +      - pci10ec,8161  # RTL8168 variant
> +      - pci10ec,8162  # RTL8168 variant
> +      - pci10ec,8168  # RTL8168/8111 GbE

This list reflects just some of the PCI id's handled by r8169.
Any specific reason for this exact selection?

> +
> +  reg:
> +    maxItems: 1
> +
> +  local-mac-address: true
> +  mac-address: true
> +  nvmem-cells: true
> +  nvmem-cell-names: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie {
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        ethernet@0,0 {
> +            compatible = "pci10ec,8125";
> +            reg = <0x10000 0 0 0 0>;
> +            local-mac-address = [00 00 00 00 00 00];
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b539be153f6a4..6341de4fadb6c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -134,6 +134,7 @@ M:	Heiner Kallweit <hkallweit1@gmail.com>
>  M:	nic_swsd@realtek.com
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/net/realtek,r8169.yaml
>  F:	drivers/net/ethernet/realtek/r8169*
>  
>  8250/16?50 (AND CLONE UARTS) SERIAL DRIVER
> 

