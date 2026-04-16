Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D763E2767
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352827; cv=none; b=PZfYV3huX0V5qO38eUjXP1HxEpWgEnBBkcNITPX79llx81bo27PG71FPoh9jLrjKGDrYpVCWXyF7KbUJRxXeo1XWn+pJA/APDpx8IKZC6d3QJc35x0Vf5JPrmeAade8U8trNHfzUX0eHvM6ZM9ki9/GUTcdAxp7d9jI4vRmV87g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352827; c=relaxed/simple;
	bh=Y+7adi48i7KQ7SXTfziVMt+UYCy2wBb4MwPhXwiL2HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAF/l578/8PYnQwDDJJ3H98JnOB2t04+jndT06Gl5P9m8LvH21GT59uWg4n4nhcalKXhh94pqaPfGDRPB8SX2aUHhFAc/RP0YaL3wcjYq4zWTFDXBnyLLV/QGXKRs3+9WqMCUM8jHnxIU9g1wMdiHuTvvMkFZTp2U96RrgRlkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m82ZEl+M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m82ZEl+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EE4C2BCB7;
	Thu, 16 Apr 2026 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776352827;
	bh=Y+7adi48i7KQ7SXTfziVMt+UYCy2wBb4MwPhXwiL2HE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m82ZEl+M73dpf2PXA4djdWd4TMLB5vN0QzQx7EQm6WHbMVHF3c3dzWbYd7++IsQps
	 QFaER+Rd6rdsXiqxzyxdtMm6BNWJ7U61SaiD2qbuAPpdyO9jp4EGgZzIE6ba2HKtnz
	 TkbcYjFYyrcEGuZAuL/Tb7sNdumWiXIHNm3X8HmwD7F7HSQjQtDeUabiNkUHtplcYH
	 pFzeO2U4rsPx6mAiLZMQjMWv6G5V8/Ev1aj5ifkR/7iQrFwzFSlHcqfiZRBIkJs3cb
	 kkljdJGhSH6DyGm4WANO4EqVOAcLwbMFf3n7O8C1ti+qnkFlcDZlud9l4RJwiQwBVO
	 WTAcylWiRYb1g==
Message-ID: <a75e4553-3db3-491c-a5af-a539e9c8da82@kernel.org>
Date: Thu, 16 Apr 2026 10:20:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: socfpga: Add the Agilex7 series SoC's
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260413144553.132737-1-dinguyen@kernel.org>
 <20260414-certain-puffin-from-avalon-29ceeb@quoll>
 <a2945037-d8c9-45b5-b161-ac55ac9b0835@kernel.org>
 <321be4a9-2633-403b-ac44-4ec9102f7d14@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <321be4a9-2633-403b-ac44-4ec9102f7d14@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/14/26 07:55, Krzysztof Kozlowski wrote:
> On 14/04/2026 14:53, Dinh Nguyen wrote:
>>
>>
>> On 4/14/26 02:17, Krzysztof Kozlowski wrote:
>>> On Mon, Apr 13, 2026 at 09:45:52AM -0500, Dinh Nguyen wrote:
>>>> The Agilex7 is a series of devices from Altera that are derived from
>>>> the Agilex family.
>>>>
>>>> The Agilex7F device supports PCIE 4.0 and DDR4. The Agilex7I device supports
>>>> PCIE 5.0 and DDR4, while the Agilex7M device supports DDR4, DDR5, LPDDR5
>>>> and PCIE 5.0.
>>>>
>>>> All other peripherals from these devices are the same as the Agilex
>>>> device.
>>>>
>>>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
>>>> index 206686f3eebc..5ee09f8d4698 100644
>>>> --- a/Documentation/devicetree/bindings/arm/altera.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
>>>> @@ -115,6 +115,16 @@ properties:
>>>>                  - intel,socfpga-agilex5-socdk-nand
>>>>              - const: intel,socfpga-agilex5
>>>>    
>>>> +      - description: Agilex7 series F, I and M boards
>>>> +        items:
>>>> +          - enum:
>>>> +              - intel,socfpga-agilex7m-socdk
>>>> +          - enum:
>>>> +              - intel,socfpga-agilex7f
>>>> +              - intel,socfpga-agilex7i
>>>> +              - intel,socfpga-agilex7m
>>>> +          - const: intel,socfpga-agilex
>>>
>>> And separate question - why previous soc "agilex" is used as fallback?
>>> Even more confusing.
>>>
>>
>> You're right. Sorry for the confusion. The Agilex7M, I, F devices are
>> basically "agilex" devices with some few additions (PCIE, DDR5). Maybe I
>> should place the Agilex7M/I/F devices into the "agilex" boards area?
> 
> Compatibles should be specific and not based on families, thus what is
> "intel,socfpga-agilex"? SoC, right?
> 
> Then "intel,socfpgaa-agilex7f" is a new SoC, no?
> 

The Agilex7 is re-branded name for the original Agilex soc,
"intel, socfga-agilex". From a software perspective, they are the same 
device. I looked over the commits to see how I could handle a 
rebranding, but couldn't come up with a conclusion.

I could create a new SoC like you've suggested:

+      - description: Agilex7m boards
+        items:
+          - enum:
+              - altr,socfpga-agilex7m-socdk
+          - const: altr,socfpga-agilex7m
+          - const: altr,socfpga-agilex7

Or I can use the original "intel,socfpga-agilex"?

+      - description: Agilex7m boards
+        items:
+          - enum:
+              - altr,socfpga-agilex7m-socdk
+          - const: altr,socfpga-agilex7m
+          - const: altr,socfpga-agilex

If I create a new "altr,socfpga-agilex7" binding, then I would have to 
add the new binding to a few drivers. But if I use the original
"intel,socfpga-agilex", then no drivers will need to be updated.


Thanks,
Dinh



