Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111B378D95;
	Tue,  7 Apr 2026 05:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775541230; cv=none; b=bqtCWTJfqb94AXVb1ruyPuoi7BdH7tvNYa5rnhmqNk7dCUc4bCoZ81c9B/8lQAorqIqunNfheuSHHQBs3LdXy0URe/5T4hD8bMjy+C3K9s9eCBtkDLlsfmr+P7iZvwti6ZrmAnEaQSgVjk/ZA1BhjzxLNR1PP/bzwkeHbaykSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775541230; c=relaxed/simple;
	bh=doGvoPU+sXAQUCjtfGMhgrSg+5rPkM5MHTStao+BUgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goc6QB2xsE9S7uJkY9mNb8kjkevlc9AJEjgTn9gspmorSEOt7qgVOEzicjKnB1100ued6EGKgNsWzBE0HXLIBv2Fh+/nKln2VgD9SkIuWi9FA3KR3fGWXn+a40YHi4/jSZh+1iw2J/nPJeOOcS5Ksapo+WVzuIdUoEbQ4IjAO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqCASRnN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqCASRnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7F8C116C6;
	Tue,  7 Apr 2026 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775541230;
	bh=doGvoPU+sXAQUCjtfGMhgrSg+5rPkM5MHTStao+BUgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UqCASRnN4A2J44tXZ2iZb1BGqburHcHcRTnN6KLCw34b0fJTg5SgaOC2o/EOG8bHK
	 VKOOog6LNleLD0Og+6OvcWxUsncfsKy0I6HnDvcHmsq2frwwMjoZn+ksRVxvddZvFl
	 rFxQ9iHpsHEmcmXjmnW0V/PqdkAPRsOJ3U+S4+CmRYqnuLiYtF7p/dh7WkEuMAfEeF
	 7WMr2UDIZgQbKUg8dFzahJpQEasxP2GtiIadcUSulNAdf1As/bHgJ89VSqJyrdFppU
	 mGD6hJjqmyos+GURMbESh3Ny/hu1FGby3kF0KjpNonq529TrUu3/T8x0Vd16XI8RUS
	 8iWFrYpVddenQ==
Message-ID: <0c78744d-6bdb-4b0e-a0bc-039bb6527476@kernel.org>
Date: Tue, 7 Apr 2026 07:53:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ti,j721e-system-controller.yaml: Allow
 audio-refclk as clock-controller child
To: Moteen Shah <m-shah@ti.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-kumar1@ti.com, gehariprasath@ti.com, y-abhilashchandra@ti.com
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-2-m-shah@ti.com>
 <20260331-flashy-hilarious-whale-6e606c@quoll>
 <62dd6a7f-7a5b-4939-a18d-8b763f6e8f9b@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <62dd6a7f-7a5b-4939-a18d-8b763f6e8f9b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2026 07:46, Moteen Shah wrote:
> Hey Krzysztof,
> 
> On 31/03/26 12:39, Krzysztof Kozlowski wrote:
>> On Mon, Mar 30, 2026 at 03:14:58PM +0530, Moteen Shah wrote:
>>> The ti,j721e-system-controller binding currently only allows
>>> clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
>>> schema. However, the system controller on J721S2 also contains audio
>> J721S2 or AM62?
>>
>>> reference clock controllers (ti,am62-audio-refclk) that use the same
>>> clock-controller@XXXX naming pattern.
>>>
>>> Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
>>> or audio-refclk schemas using a oneOf constraint.
>>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>>   .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>>> index f3bd0be3b279..d5d84a8f1257 100644
>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>>> @@ -53,9 +53,11 @@ patternProperties:
>>>   
>>>     "^clock-controller@[0-9a-f]+$":
>>>       type: object
>>> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>>> +    oneOf:
>>> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>>> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
>> Alphanumerical order.
>>
>> There is no ti,am62 in the top level compatibles, so why am62 is here?
>> Top level has j721s2 but this ti,am62-audio-refclk.yaml only am62.
>>
>> Best regards,
>> Krzysztof
> 
> The "ti,am62-audio-refclk" compatible refers to a shared audio reference 
> clock IP block that was first introduced/named on AM62 but is present on 
> other TI K3 SoCs as well, including J721S2. The compatible string 
> identifies the IP block, not the SoC family.
> 
> This is already an established pattern — 
> k3-j784s4-j742s2-main-common.dtsi uses the same compatible for the 
> J784S4/J742S2 audio refclk node.

Please read carefully writing-bindings doc.


Best regards,
Krzysztof
