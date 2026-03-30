Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1F3290C9;
	Mon, 30 Mar 2026 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882666; cv=none; b=BL84QZnDZFGb0J8nKolb/9qP46sBcFHqaqiqEZArpv5PNvgcyvofsiVbFWjK2oagCVGB884Pi2V/KP9fHi3SJTEWhvez+DFyHZ9CbHqsjm6xIVeNfs1K6UwWbD0fwQrtIL7FqInOutx2u19xIJSkncZxxZ6g3zg3SVzWSGShQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882666; c=relaxed/simple;
	bh=Q2Hr+64nfwabuubNoJofnM6anpOvBYwWKFrDN1Xn75Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVezmYUJr0ve+X/uvg2+SZsdtZewhNdXatXJCwUtlo+b93yl+YAafGdZbklNgMraEcpUWZxMzQoZwMmIPOGfkAeHvAF8cDXuRlQVnjg0ds9wVmpJ8IPeRwzLf7gWftBrAxriyVCP6yxwBkp/NPxTT+lgioFDNvLpSlvXG6uuvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCLCre4g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCLCre4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6689FC4CEF7;
	Mon, 30 Mar 2026 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882666;
	bh=Q2Hr+64nfwabuubNoJofnM6anpOvBYwWKFrDN1Xn75Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vCLCre4glN6/9bCO5naJn3+DITMtVO1G3x9GthcVlGGMHbfxJsH4nfRo/d2YPpUIx
	 3eK10kmIlBCYR7tZCH09wU80HITmeMtlirw0ak+N8x+SV0YxKRBdPUAltY8K+Av9Pr
	 vuCtNGGbcXhQgO34QoLaAJMKGsdbJ27SpKrLVdX1zkHV4e0Aofw4wkBhwMKl1gQ7g/
	 DaFzEicSedBZ3BxoZDQyCH3sTefEiSO2Ekbj1X98I9gwVUg06GOq4kxdYsBFIWDu8q
	 vYWGZqL2dLgEZig0xe/7vsrSahTB38yX7xUoP4Hrdms91KwTkMAP4wA/wlJki/4K3o
	 3RWFzbsDJWvvQ==
Message-ID: <7dd70ef5-f8d2-444c-9e42-2c6d8d976e90@kernel.org>
Date: Mon, 30 Mar 2026 16:57:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-2-nick.hawkins@hpe.com>
 <20260328-chirpy-sturdy-emu-9eb0cb@quoll>
 <DM4PR84MB192724F4949F614E3965E60A8852A@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DM4PR84MB192724F4949F614E3965E60A8852A@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2026 16:53, Hawkins, Nick wrote:
> Hi Krzysztof Kozlowski,
> 
>>>  maintainers:
>>>    - Nick Hawkins <nick.hawkins@hpe.com>
>>> @@ -18,6 +18,11 @@ properties:
>>>            - enum:
>>>                - hpe,gxp-dl360gen10
>>>            - const: hpe,gxp
>>> +      - description: GSC Based Boards
>>> +        items:
>>> +          - enum:
>>> +              - hpe,gsc-dl340gen12
>>> +          - const: hpe,gsc
> 
>> What sort of ordering are you going to use in this file? Usual choice is
>> the fallback compatible, but I see you have chosen something else. That
>> is fine, just keep that else sorting in the future instead of adding to
>> the end.
> 
> Thank you for the feedback, just to confirm are you looking for me
> to do something like this?:
> 
> - description: GSC Based Boards
>         items:
>           - enum:
>               - hpe,gsc-dl340gen12
>           - const: hpe,gsc
> - description: GXP Based Boards
>         items:
>           - enum:
>               - hpe,gxp-dl360gen10
>           - const: hpe,gxp

Yes, that's the typical/usual way.

> 
> That way we have the newest first and going forward if there is

Usual order is the alphanumerical.

> something newer we add it to the top of the list rather than
> the bottom?

If you want to order by date of release of the SoC, that's fine. I think
Allwinner does it. It's pretty non obvious because the chips are
upstreamed different time than released, so it is difficult for people
knot knowing the release dates. Just don't use the rule of "add at the
beginning" or "at the end".

Best regards,
Krzysztof
