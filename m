Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E09E271464
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408203; cv=none; b=RQT/1jCdcqnAkZ4ASieYq6sD/s2WglANnNXEOnugDed7mFa7bXStj6YBSK+DN1X+w/GQrEATsrvSEseKCIzKP9F/89cq6L83cnes7xTCsyMQ8HzFH2BXgErHz78oaD8ffrWEmcLyDsWiAFsp7pPjtn8ZI4/ddTxdLKYkUTtH4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408203; c=relaxed/simple;
	bh=fDR+R4qxJB+NhHoxzC23BZDERVb8Pw/hPpfz3Gxjkl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2zxSn5rnx4I75JTpI1U/T7t3Tq6omGKhwTnqve5YQjVLGhtTEHyvSjkVxSKjEIqdH/sRH8GyRppZBn38d5hA6WhSGT0Az778q/omzKlM0PuVqSnpO3ks8X3E95c8cxWsY+lADGoSChz4eLyOBag9IjRHnU0UraBvMq0VGIEU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR21bKo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR21bKo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD053C19425;
	Fri, 17 Apr 2026 06:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776408203;
	bh=fDR+R4qxJB+NhHoxzC23BZDERVb8Pw/hPpfz3Gxjkl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AR21bKo44ZfQ8O1l4+Rp9HHIoJi7dIu8XudUgx5LGR2PkJWJYEI+OVDLv+ckM4nEb
	 FErAop8AmvPihJr20tw/pCrbbU0lZ0upqyVN61Tk5/LFqNjyUpAFuvraW9oeS/O1kz
	 fMYnddJvCWhTXN90SWSl/MKXjpJQhRTKbzru+YRMICHxyfxiBs9YbzLEuULg93GGhl
	 fc7N+0WORlI5Y36O0jp9h86e2erBm0SfOnQKLWCUnyzQL/O6N0aWpBVdPr6Pt4LmGA
	 HDWn50AkA5bAC6Sm5tF3QP4+hIectq+2kDjB+wWlDnDc1lviM97yc0Oc3j6+VgIChM
	 eWwNtHORYK+4w==
Message-ID: <99e204be-bc25-40c2-a996-c61e04267c8b@kernel.org>
Date: Fri, 17 Apr 2026 08:43:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: socfpga: Add the Agilex7 series SoC's
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260413144553.132737-1-dinguyen@kernel.org>
 <20260414-certain-puffin-from-avalon-29ceeb@quoll>
 <a2945037-d8c9-45b5-b161-ac55ac9b0835@kernel.org>
 <321be4a9-2633-403b-ac44-4ec9102f7d14@kernel.org>
 <a75e4553-3db3-491c-a5af-a539e9c8da82@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a75e4553-3db3-491c-a5af-a539e9c8da82@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2026 17:20, Dinh Nguyen wrote:
> 
> 
> On 4/14/26 07:55, Krzysztof Kozlowski wrote:
>> On 14/04/2026 14:53, Dinh Nguyen wrote:
>>>
>>>
>>> On 4/14/26 02:17, Krzysztof Kozlowski wrote:
>>>> On Mon, Apr 13, 2026 at 09:45:52AM -0500, Dinh Nguyen wrote:
>>>>> The Agilex7 is a series of devices from Altera that are derived from
>>>>> the Agilex family.
>>>>>
>>>>> The Agilex7F device supports PCIE 4.0 and DDR4. The Agilex7I device supports
>>>>> PCIE 5.0 and DDR4, while the Agilex7M device supports DDR4, DDR5, LPDDR5
>>>>> and PCIE 5.0.
>>>>>
>>>>> All other peripherals from these devices are the same as the Agilex
>>>>> device.
>>>>>
>>>>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
>>>>>    1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
>>>>> index 206686f3eebc..5ee09f8d4698 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/altera.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
>>>>> @@ -115,6 +115,16 @@ properties:
>>>>>                  - intel,socfpga-agilex5-socdk-nand
>>>>>              - const: intel,socfpga-agilex5
>>>>>    
>>>>> +      - description: Agilex7 series F, I and M boards
>>>>> +        items:
>>>>> +          - enum:
>>>>> +              - intel,socfpga-agilex7m-socdk
>>>>> +          - enum:
>>>>> +              - intel,socfpga-agilex7f
>>>>> +              - intel,socfpga-agilex7i
>>>>> +              - intel,socfpga-agilex7m
>>>>> +          - const: intel,socfpga-agilex
>>>>
>>>> And separate question - why previous soc "agilex" is used as fallback?
>>>> Even more confusing.
>>>>
>>>
>>> You're right. Sorry for the confusion. The Agilex7M, I, F devices are
>>> basically "agilex" devices with some few additions (PCIE, DDR5). Maybe I
>>> should place the Agilex7M/I/F devices into the "agilex" boards area?
>>
>> Compatibles should be specific and not based on families, thus what is
>> "intel,socfpga-agilex"? SoC, right?
>>
>> Then "intel,socfpgaa-agilex7f" is a new SoC, no?
>>
> 
> The Agilex7 is re-branded name for the original Agilex soc,
> "intel, socfga-agilex". From a software perspective, they are the same 
> device. I looked over the commits to see how I could handle a 
> rebranding, but couldn't come up with a conclusion.

The family does not matter. What is "socfga-agilex"? One given soc. Not
a family.

> 
> I could create a new SoC like you've suggested:
> 
> +      - description: Agilex7m boards
> +        items:
> +          - enum:
> +              - altr,socfpga-agilex7m-socdk
> +          - const: altr,socfpga-agilex7m
> +          - const: altr,socfpga-agilex7

So what is "altr,socfpga-agilex7"? Why SoC has two compatibles?

> 
> Or I can use the original "intel,socfpga-agilex"?
> 
> +      - description: Agilex7m boards
> +        items:
> +          - enum:
> +              - altr,socfpga-agilex7m-socdk
> +          - const: altr,socfpga-agilex7m
> +          - const: altr,socfpga-agilex

But why? Why are you using one SoC compatible in other context? It's
really no different than all other SoCs.

> 
> If I create a new "altr,socfpga-agilex7" binding, then I would have to 
> add the new binding to a few drivers. But if I use the original
> "intel,socfpga-agilex", then no drivers will need to be updated.


You anyway MUST have new binding for each device. Please carefully
follow writing bindings and DTS 101.


Best regards,
Krzysztof
