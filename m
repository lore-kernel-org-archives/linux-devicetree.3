Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678542;
	b=1D+12s4PAjzg5/5dicdQUyOru8GoWAU9+bKEqe5ScpKJ7xor9seydpKy4N6k5v6JcY1a
	 /j7mE0qG1jQnD/H3P3YAO1mBim6L/Qy4bu4CVkxn5ve3QMcyHDY9JC/QOu5osFd0RDw02
	 LRWpd71wKrYuCCxAk4nyEQ4OFwV7uIJ6dQ0kMxbUEHaANURV5c26X5OgMXWA3GHefSOGp
	 P+HFXeOMnCenmxqaM3PlvhJqGgHMc4PCZ+f1AnhI9I4m1JbViiZT2eAAQB5WRzf3TDGUZ
	 uS2i1D+V5KNL6TsgpSGwbu/YiOrVPz3JmaL1Bb5BGJjq0x7SuvliEXJS4tg3V7qcCGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678542;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pObZkhlDQ4PcaI1MN+28pmTr0CCJt+oalaIvvB0M4LQ=;
	b=UlJZUWZRV9FUtWtVnefRWsfYWzBFzazEKVQXOs3Q37V736CvLMpfkRRbVz4mSdomnYk3
	 bxvcVIclvhAVgRklgzvO+tnXaW+u32BCaW356Ptr4RazJFU0MlGNe4C8VuHvB3QYCDB8X
	 +xAOh+5TTXQBPDTTUNe/Vwp0RRZWaEgoi4Kqr1V+kESCbxGssRsSqObrBC3L1+0HmnjuS
	 4RLCZiO9qYn/gUhBx1t/5fR1yTYRHrkaC/Vv7QJMNpHYICCEQVTfK+ZLFKICigYA/eAk1
	 P6NWVM9SO3ljDvGc7ObfcDqir5OJBOcpfg/WnAhKMOgPimbQf3f126yDkV+iih/s+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5su5LFq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADAA606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5su5LFq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36E31F000C1;
	Thu, 22 Oct 2026 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792678542;
	bh=pObZkhlDQ4PcaI1MN+28pmTr0CCJt+oalaIvvB0M4LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H5su5LFqyqqXsY0bNPL6LsGNm91WzIY4qXgmQbmvtgg8Z37AybGQK0+k796GQ7hlL
	 WC0h7tdPJ+cI6aQS1aFbOtJAi0z043q0ZnCjAemYF4LRNCZeq0bEvQy/WQRzCqkSRe
	 +Ol8SgrU38y0/rz/R/YgFZSxZHgm2v6qIJHlP3dmGYvRWTCSzCms7YyaDGDON+QnOC
	 d5dlvyLTMB1Ke5ZmIvKeZribYRJlr86VbuqQGMe1Lfb0mNAW3vEXJkv/I/GG0qBvdv
	 9L+Niv4P8jiEK8hL6O7KPvX7cMNs/K2Idzw5PCZKGnsBzokKTdbs7AAuHU6HMnGrdq
	 5X5E549YwCAPw==
Date: Thu, 22 Oct 2026 09:15:41 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
Message-ID: <20261022141541.GA1009304-robh@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
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
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>

On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> BCMBCA systems booted through CFE can release a secondary CPU by
> writing its ARM-state entry address to a 32-bit MMIO mailbox and
> sending a wakeup interrupt.
> 
> Document brcm,bca-smp and its single-cell cpu-release-addr property.
> The boot CPU does not need a mailbox; secondary CPUs do. Add a
> Cortex-A7 example showing both CPU nodes.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 5be89c584026..6771b85f757b 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -255,6 +255,7 @@ properties:
>            - amlogic,meson8b-smp
>            - arm,realview-smp
>            - aspeed,ast2600-smp
> +          - brcm,bca-smp
>            - brcm,bcm11351-cpu-method
>            - brcm,bcm23550
>            - brcm,bcm2836-smp
> @@ -471,6 +472,20 @@ allOf:
>      then:
>        required:
>          - secondary-boot-reg
> +  - if:
> +      properties:
> +        enable-method:
> +          const: brcm,bca-smp
> +      required:
> +        - enable-method
> +    then:
> +      properties:
> +        cpu-release-addr:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            Physical address of the 32-bit MMIO mailbox read by CFE after
> +            a wakeup interrupt. Required on secondary CPUs. The kernel
> +            writes the ARM-state entry address before sending the interrupt.

required:
  - cpu-release-addr

??? But cpu0 doesn't have an address. Is there really no address or you 
just omitted because you don't really need it. Should still be there in 
the latter case IMO.

Alternatively, add the enable-method value to the existing section that 
does this. Also, there might be other cases that are a 32-bit address 
and need this same constraint.

>    - if:
>        properties:
>          enable-method:
> @@ -712,4 +727,25 @@ examples:
>          cpu-release-addr = <0 0x20000000>;
>        };
>      };
> +  - |
> +    // Example 5 (Broadcom BCMBCA with CFE):
> +    cpus {
> +      #size-cells = <0>;
> +      #address-cells = <1>;
> +
> +      cpu@0 {
> +        device_type = "cpu";
> +        compatible = "arm,cortex-a7";
> +        reg = <0>;
> +        enable-method = "brcm,bca-smp";
> +      };
> +
> +      cpu@1 {
> +        device_type = "cpu";
> +        compatible = "arm,cortex-a7";
> +        reg = <1>;
> +        enable-method = "brcm,bca-smp";
> +        cpu-release-addr = <0xff800568>;
> +      };
> +    };
>  ...
> 
> -- 
> 2.56.0
> 
