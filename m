Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC93A3C3F4D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182752; cv=none; b=skT50DqCDRD73rujQD3Uq6svOFGr9IhPw/SVOKmYOPxDNS74UxKrFCHLSRfSbw6R43oOPaqcZPyrFBok3whk27BX8Ih22mHe8C07rg7u6hOe22QPg7JRljJEL6jex3geC0XB6uU/uQcFTug/247Z1s+9GSNzm+j8HDm2iKjPEd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182752; c=relaxed/simple;
	bh=l0fyMC2SBur5U3Qh/dOAnUiQvkL2joWBa6r3CqBxMLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7J4O5go71IXCHhHHJQEDLblsTSenqXan4IgMb/NU50Tx3qp82iPECM/m9+m7yezFitvAJddxMAhFAM54qQvVENOTWKx3QmmsvnqePWE8VYD6MTL8xomQ119R8RA5jtEbszAM+TAD2DMy3Sx8oDi3FBmTQw69HQqwZAkTFKRDFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFL0YpFX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nyZBR8pI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFL0YpFX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nyZBR8pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785182749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lHAl5GzXFBvOzawjrxy+mgEHuifdBY8i61HHJ7qviQ8=;
	b=CFL0YpFXYkQujNiEyBLhVO4Xa9a9XruM5z5QJNUQ3ZYK4Yxlfd+5kEinqi8FJwcI78OkDA
	ZqzwYNcgE5arfAFgnbyOPAb/boOQTCoAp81ucmXjv4tdlA/wjV4DCIGwGzYvuk1EtIoIMd
	SAdfXvTgLT5/hVug6d5ke60n99D2cfo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-xFW1y2w2OVeWOhxcDGNSPw-1; Mon, 27 Jul 2026 16:05:48 -0400
X-MC-Unique: xFW1y2w2OVeWOhxcDGNSPw-1
X-Mimecast-MFC-AGG-ID: xFW1y2w2OVeWOhxcDGNSPw_1785182748
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e8004d60eso603890085a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785182748; x=1785787548; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lHAl5GzXFBvOzawjrxy+mgEHuifdBY8i61HHJ7qviQ8=;
        b=nyZBR8pI180POy4A1Ck+mVzmdDzqEArNCUGYhpiuaUqJJxu//JLaOYIBrlpPaAEf3t
         ZZbKNtcEJp/R/RVxReX0xVTnxxcafODsKzhJ7AiUHpdEiR5UhTi41Xs1wkUfaB/jUT+m
         FX725Wz7EYGkuMR1+euAqNvQbgNtNT0eDqr4uYrjMv29vXL4iXwN0TOj8pXy5DLcN3Gq
         Gdvd8nYlUBCwrYXW6CISs4EKvPrzXadKoVC9kD4gY0bbsHNm/YEQsllcJnQgfSQW8/22
         nBm9/DsVEX4P1u5g8BYEVddvHckb6uxKt5uJgL4oK6dpRs/smmuO7xK8mC/iw6G8YWUa
         dI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182748; x=1785787548;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHAl5GzXFBvOzawjrxy+mgEHuifdBY8i61HHJ7qviQ8=;
        b=IWVQeRDPgqLCfd0/yM+Zn/FcLRqpGFKCEkR+eiliz5zpDquHtmhlXg/FnavuZjjDCe
         52p9/hX5F8PNtZPkOcxRBsAbdUjkzjdzhZGAXQGusiKg78cc5XPbyDUV4kPItvw+9NXy
         xW4J5GP7yK+PFKDGUglmnr3FG/HJdOAeEzgHog/jpUfQUhUOPiwiXUx+PO4BKNj+H0s0
         pM2qqOIyAyYNkqb7Xe7Vktct0gyaYiHEL6UIl9WTMUFAFUedm+IC1R4mhc0WDojkW2fM
         qNbjKxNmiE9dbcPQWEMIDcI+fInSdOBlW0HMQ8DMTVz6QybgcLGh6tZp/LYx28QwZ4d4
         DyTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKjRpq7sGDwghCcBdSuKRYL0jBg8APgn3e/sShvI10T9+iJgzt3mS/tJMgP5loEC/244y92IwPVOGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzatLdfCG+7obc1P0Z5yWaGZpksd65wL6mcEktiTFtn20FW2KFP
	wKRpunGDbeHD9AsVPoYZO1Wx9FItrPKBPH91ZEwhbkL4hj5QSle2cjZF6cI3sBD/PFJvVB1e3by
	J55wlRUwLDlsNcLpliZtucdgrvzOlJCI3hXsiHVjwHgQfwhFjMgqbAibLZi/r0g0=
X-Gm-Gg: AR+sD13GPBcohlYJEp+h/qreZ3EpYoOkVue8/S2VUPgb1mwtCTeWHMsoJjZD4U8Ab/d
	1ZV2xnZIXLCP9xO+TDBbAN0DPkSrRtfcQXh5p1GuniTZdV8Mup8YcIEvUaUaOexh8/9Aw5lfzyH
	oSvFTUFZRQp3WAizOTIdtR6fDI2xVwKkNF4ykpQW+LU/QqhCwFWZXv3t6eSo76ItowYCAvQzJzc
	zmPzyu6o8Sa2JUPNcmPvmTGpKLkk32b77Y6HoQKx+s2mzLf6+QHtwoVcOCMQT4uSF8kg+BjYYua
	J/s6MkA25scFbRR9NsXe60VHl5NdWU2NmH5a3A95IImKmTwWvGCTgp2LJpi/7DRQA+r6rvGqNA=
	=
X-Received: by 2002:a05:620a:48d:b0:930:a74c:f1c5 with SMTP id af79cd13be357-932df72ff1fmr818068885a.59.1785182747594;
        Mon, 27 Jul 2026 13:05:47 -0700 (PDT)
X-Received: by 2002:a05:620a:48d:b0:930:a74c:f1c5 with SMTP id af79cd13be357-932df72ff1fmr818064685a.59.1785182747059;
        Mon, 27 Jul 2026 13:05:47 -0700 (PDT)
Received: from redhat.com ([2600:382:771a:ae2:b914:58a6:76d2:bfbb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86a1b62sm72216126d6.26.2026.07.27.13.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:05:46 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:05:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <ame6F0auneo1dGtq@redhat.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724184304.192962-2-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Christian,

On Fri, Jul 24, 2026 at 08:43:01PM +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> - PCIe1 Serdes can support PCIe or Ethernet mode.
> - PCIe2 Serdes can support PCIe or Ethernet mode.
> - USB1 Serdes can support USB3 or HSGMII mode.
> - USB2 Serdes can support USB3 or PCIe mode.
> 
> Add bindings to permit correct reference of the Serdes ports in DT.
> Values are just symbolic and enumerates the Serdes port with a specific
> number for precise reference.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
>  include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
>  2 files changed, 32 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index eb24a5687639..fc37786ac7ed 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -23,6 +23,7 @@ description: |
>  
>    All these identifiers can be found in:
>    [1]: <include/dt-bindings/clock/en7523-clk.h>.
> +  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
>  
>    The clocks are provided inside a system controller node.
>  
> @@ -50,6 +51,12 @@ properties:
>      description: ID of the controller reset line
>      const: 1
>  
> +  '#phy-cells':
> +    description:
> +      The first cell indicates the serdes phy number, see [2] for the
> +      available serdes port.
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -65,12 +72,23 @@ allOf:
>          reg:
>            minItems: 2
>  
> +        '#phy-cells': false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: econet,en751221-scu
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        '#phy-cells': false
> +
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - airoha,en7581-scu
> -            - econet,en751221-scu
> +          const: airoha,en7581-scu
>      then:
>        properties:
>          reg:

This chunk is new since the split out v10 series[1]. I see that you dropped
krzk's Reviewed-by presumably because of the new chunk. However I don't
see a changelog.

I'm collecting patches up for a clk pull to Stephen. (I'm not sure if
he's going to pull but I'm going to try.) I'm not going to include this
series until I see a Reviewed-by by one of the dt maintainers on the new
patch.

https://lore.kernel.org/all/20260702093812.15918-2-ansuelsmth@gmail.com/

Brian

