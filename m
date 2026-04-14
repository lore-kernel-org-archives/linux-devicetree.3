Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D379282F3F
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171222; cv=none; b=D44yyPr01Mi+iWt7bANjDUkHiMg+ffmZIK1YkN4krKfeUVuaWEVcvSQ+Sso1HngwmO52hs0m67skNrWdtLje119jFAZjcaNqNMuQ+7QrOmD5vgJ8wbNrM+6csYBVDYO1p4ze2R3fAMZFxb6hQMH6hcZl65h/yupcqfuWhFHovmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171222; c=relaxed/simple;
	bh=qqTfbzCJb+zoF0M6GZZvJtDXIS9C58IcQDhX2CEZM00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZzDebgYIwNDyI16EfOisR3T3mGYpejy7QD2uJcehyLr+xFmZgCW1M6KCXQJeXPz+7rg7SkFAHJkIZdwTUJX7TYpfb5w4PFsHTNwPdWb2wapUakCzSACogAz5UHs9ZNV8CXfEfPDoUq6eeFBTAjjJzJQZ4cW2jSgIDJy77QFYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgLcN1R7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgLcN1R7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6050AC19425;
	Tue, 14 Apr 2026 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776171221;
	bh=qqTfbzCJb+zoF0M6GZZvJtDXIS9C58IcQDhX2CEZM00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rgLcN1R7iEbOn4of5JqhXWrPkcKlANV2JfSWPLuiLUTN6o1pWKAx3/4HD4vQdiqgs
	 AloI01rR3rLSzQnX8K6nUN/0I0nbHPC1snDYsuqKHkrGh4/5PZB+cidPsyb91VzRKY
	 kBFmTjMHnpSLCapXcedr/KWo5sJPk9LKcfQUi4tfFCXBcbn2FQN5x1V3FPf/dArj14
	 Kwi8lvO/lGoezy0nHCa2HjHAhHQ0qnlV5+d4U2EObtUZV060fzFvRcMESB6iftEu/5
	 qIgNV90fXCNpO3iJWEKu8Ueige7fqUxjF1ZJAtGulsqKw53dZ2SSQskP0vTywD5+3C
	 4YIoarF1csmmA==
Message-ID: <a2945037-d8c9-45b5-b161-ac55ac9b0835@kernel.org>
Date: Tue, 14 Apr 2026 07:53:39 -0500
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
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260414-certain-puffin-from-avalon-29ceeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/14/26 02:17, Krzysztof Kozlowski wrote:
> On Mon, Apr 13, 2026 at 09:45:52AM -0500, Dinh Nguyen wrote:
>> The Agilex7 is a series of devices from Altera that are derived from
>> the Agilex family.
>>
>> The Agilex7F device supports PCIE 4.0 and DDR4. The Agilex7I device supports
>> PCIE 5.0 and DDR4, while the Agilex7M device supports DDR4, DDR5, LPDDR5
>> and PCIE 5.0.
>>
>> All other peripherals from these devices are the same as the Agilex
>> device.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
>> index 206686f3eebc..5ee09f8d4698 100644
>> --- a/Documentation/devicetree/bindings/arm/altera.yaml
>> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
>> @@ -115,6 +115,16 @@ properties:
>>                 - intel,socfpga-agilex5-socdk-nand
>>             - const: intel,socfpga-agilex5
>>   
>> +      - description: Agilex7 series F, I and M boards
>> +        items:
>> +          - enum:
>> +              - intel,socfpga-agilex7m-socdk
>> +          - enum:
>> +              - intel,socfpga-agilex7f
>> +              - intel,socfpga-agilex7i
>> +              - intel,socfpga-agilex7m
>> +          - const: intel,socfpga-agilex
> 
> And separate question - why previous soc "agilex" is used as fallback?
> Even more confusing.
> 

You're right. Sorry for the confusion. The Agilex7M, I, F devices are 
basically "agilex" devices with some few additions (PCIE, DDR5). Maybe I 
should place the Agilex7M/I/F devices into the "agilex" boards area?

Thanks,
Dinh
