Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C432F39C7;
	Thu, 26 Mar 2026 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774558583; cv=none; b=EVKogCtIX5/7FmUHHF2dMIRR921tyuWRI1EAbjMKZ3SLd7zdMc2kfw4v/CIAFaieIc2v9CD/kw4N6RwYdKlUobzgW2edq7zTXk7aIY5FnuqM06ewCA1FiF38e5eLJPS3imsXT84X1zTbr88p+5bf5cAT2hwHOEzS2NM/1T2qOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774558583; c=relaxed/simple;
	bh=IfxOVsM11TzZ/YACGR8y36aBZMsODwPB8T/Tobcg3Ng=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtikLGS9NEdGWrPskz6ZMwiQgz/UOm90ZqRw4IZBylweMGVTchyHcZpPTeFIW2uV74m/8kRLFgff2VP9tLbqlyGLWz23MIC27ntTb0PQQ3yFpQm+D0ifat9EOzVKPnu8jyRqJ2hDuUp8vd98aeqrc6PDhQ04wZDwLdhpqUN5s2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=IUXxhv5/; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IUXxhv5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1774558582; x=1806094582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IfxOVsM11TzZ/YACGR8y36aBZMsODwPB8T/Tobcg3Ng=;
  b=IUXxhv5/Ei1Gw+b6fpxqnR/hJCkHlLQFje77PwX8i1FsAoDaUdx5VpWb
   H0InObJNqqVKlMR/Eow8yG1zUcWiQ4SExTr0JgE0wnKiBmkE3XAx74EN5
   V2hbO4lxHyiSKmzfY8NDMB7DefqtTMouyNaW+rZpWXCpOY7jPJ5DMR+GX
   3GxZZU6ZMXTtiPC5oBw4FSLLlPqlQ8nRlClXtXJJIA8E/cGmYNW7rs4zH
   pCdXVHKfVky78XZ8ehctQ6qZ9PE0qz7o6AzX+INdajRXDElXFniy5qoya
   ZFBrrOS4mvZBUu5fW7mNFwl4f1vJhzSDhS4EWCTIxzg9B1q19DioTFvom
   A==;
X-CSE-ConnectionGUID: ryYn0vU3TMizFWwq7hZdbQ==
X-CSE-MsgGUID: XDZ+QS/ZQoGlOIovaEEMOw==
X-IronPort-AV: E=Sophos;i="6.23,142,1770620400"; 
   d="scan'208";a="55691398"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2026 13:56:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Mar 2026 13:55:41 -0700
Received: from bby-cbu-swbuild03.eng.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58 via Frontend Transport; Thu, 26 Mar 2026 13:55:40 -0700
Date: Thu, 26 Mar 2026 13:55:38 -0700
From: Charles Perry <charles.perry@microchip.com>
To: Nick Hu <nick.hu@sifive.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <charles.perry@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
References: <20250321083507.25298-1-nick.hu@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250321083507.25298-1-nick.hu@sifive.com>

On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> Add compatible string and property for the SiFive CLINT v2. The SiFive
> CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> in their control methods.

Hello Nick,

Can you help me understand what is this different control method? I've
found that both OpenSBI [1] and U-Boot [2] use the same match data in their
clint driver which would indicate that they are compatible.

Also, do you know if there's an easy way to tell if a sifive clint is a v0
or v2?

Thanks,
Charles

[1]: https://elixir.bootlin.com/opensbi/v1.8.1/source/lib/utils/timer/fdt_timer_mtimer.c#L163
[2]: https://elixir.bootlin.com/u-boot/v2026.01/source/drivers/timer/riscv_aclint_timer.c#L86

> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> - v3 changes:
>   - Add the reason for the incompatibility between sifive,clint2 and
>     sifive,clint0.
> - v2 changes:
>   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
>   - Mark the sifive,fine-ctr-bits as the required property when
>     the compatible includes the sifive,clint2
> 
>  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 76d83aea4e2b..34684cda8b15 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,12 @@ properties:
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>            - const: sifive,clint0        # SiFive CLINT v0 IP block
> +      - items:
> +          - {}
> +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> +        description:
> +          SiFive CLINT v2 is the HRT that supports the Zicntr. The control of sifive,clint2
> +          differs from that of sifive,clint0, making them incompatible.
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -62,6 +68,22 @@ properties:
>      minItems: 1
>      maxItems: 4095
>  
> +  sifive,fine-ctr-bits:
> +    maximum: 15
> +    description: The width in bits of the fine counter.
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,clint2
> +then:
> +  required:
> +    - sifive,fine-ctr-bits
> +else:
> +  properties:
> +    sifive,fine-ctr-bits: false
> +
>  additionalProperties: false
>  
>  required:
> -- 
> 2.17.1
> 
> 
