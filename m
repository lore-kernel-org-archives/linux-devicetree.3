Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27933DC84C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990389; cv=none; b=HaJn5mXEQjwPC7tL9NrKqi+hhzRzkURu+AGCFL1wUe7NjvqoVsNDJwhGmZrQPFljQGDHPUlZoPa5QYBIUfQlqMn5ezosSSmRRhkUvyq7YZtarIwIsU9bDdUELHUlIJbAJYSQKrDIpwgJdwUAbV+eKsUKqIGX+QL+zrF0+2fnLp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990389; c=relaxed/simple;
	bh=lnRXYauZivJZYZKKpwfjuvGMGi/Kptw0SsII1kh49V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLSg1TEniVzJ9d0qmVkVaJsuQjvsQ+1omjJiYirYsrViCLRj29fbRM5H+c0yYzlw6IKzcTHUVN+E2tGoYh4iHmRD2qFSnYTKdVYWd9NTUNUrMPxvDMtMa7stJQHomK2Lba6ZtAloGjc4xJKSNkc5eittbbjthcoCoiehoe1UbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji+SRwM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ji+SRwM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DC71F00893;
	Tue,  9 Jun 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990388;
	bh=JUkrHSIawlDovwdqb3YkhtzZRBnNrrGbpK99tAgrPQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ji+SRwM/0W6UFN993aF/K3YBxh9rvTZzYPqcLYo+BFw05SL7Cqnz7UXbU54wQCRBc
	 JyQABtGt5j/QmoXRmrkFbvNkGG9Eede9p3ed1pLnotpdBhoQcGKK91iDAgWptfiQZm
	 Ir1ZZEsWrXjHTZ3E0pnBXaX6oJJOSmBG3vikl4S+zv9gdX6OjaIs6QjBKgLVxxnyqD
	 waKW0ar14+Aop9VVpAosMn3YkiO39bGg2tbjtTAVl2LYxcWnL2C2UmPbpHlALFJ8dY
	 vXV62glI12p4GxKu1QNxlEFTyl2o4lViEnyyuPW7dUXVGoFH3913Ssn4zqJ+oTrYh0
	 ASwlrE33Ucr3Q==
Date: Tue, 9 Jun 2026 09:33:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, 
	devicetree@vger.kernel.org, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF and
 clock
Message-ID: <20260609-vociferous-thick-lyrebird-d53eda@quoll>
References: <20260609030623.17404-1-zhangyi@everest-semi.com>
 <20260609030623.17404-8-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609030623.17404-8-zhangyi@everest-semi.com>

On Tue, Jun 09, 2026 at 11:06:23AM +0800, Zhang Yi wrote:
> Add members related to HPF and mclk_source

Please organize the patch documenting the ABI (DT bindings)
before the patch using that ABI.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  .../bindings/sound/everest,es8389.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> index 75ce0bc48..be92014c0 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -38,6 +38,27 @@ properties:
>      description:
>        Interface power supply.
>  
> +  everest,mclk-from-sclk:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that SCLK is used as the internal clock.

And what happens with mclk in such case? Is it still wired?

> +
> +  everest,hpfl:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      the HPF value of ADCL.

Is HPF value in dB? If so, use proper unit suffix and proper units.

> +    minimum: 0x00
> +    maximum: 0x0f
> +    default: 0x0a
> +
> +  everest,hpfr:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      the HPF value of ADCR.
> +    minimum: 0x00
> +    maximum: 0x0f
> +    default: 0x0a
> +
>  required:
>    - compatible
>    - reg
> @@ -58,5 +79,7 @@ examples:
>          #sound-dai-cells = <0>;
>          vddd-supply = <&vdd3v3>;
>          vdda-supply = <&vdd3v3>;
> +        everest,hpfl = [0a];

<0xa>? What did you want to say here?

Best regards,
Krzysztof

