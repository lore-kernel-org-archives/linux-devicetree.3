Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59D3D5226
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162043; cv=none; b=QiQvB/yptfhBiTaxw4U7vrevgDQ5501xBBPzYJFvDAfQ4GdfGXR/HXTwFZH0pwPk66mstx4m0T034yoE717ncKJAsA+XhZ3FNOZTmgQYbuZpPBCW3wM7aAd3cu+pq3mK+nQ7l75V57JbiePSXIrdSUjV1S2aP/+T5GHtiQSjkDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162043; c=relaxed/simple;
	bh=2l2un2dJbMhS4rHXZeYIIG4tWC1pBRspQ9Web4LJIGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyzV3Mof7N1Z4WtgsnUVLfsEbW+5aadRBg3wLhxrzMWX26iGj4QTLcx0tKlwdyc3ltVmLBEzWporyHDoQxYhsIEyeMYu23IC7pyxBrSgzXIS+rbvKc/HtXaWCKtKY1XPUCzwhw/VlllwF/gLjnoDsT237YclrfIiNyNyzalnlWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJkc4YdC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJkc4YdC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so1930847f8f.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776162037; x=1776766837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=;
        b=CJkc4YdCoQjH3GN88jmk+eLTvdY7mmpiML+zSvvz1oMgY8lgqrXGSUTb0E36hpjQiC
         L5bt+ugFfq1dsRkoOZDQ8pwovasweKdeTragSRq0d4Sxiu7erlwX9aN3sbQwPiMYImZd
         SYHLmJ81Ci6d+uC+zqJPITPmvO3HODAMBmNQ+J7Q/FQzesWANy9gFgu2m3TrMRJ4W8TZ
         N2/L1jBOuzbu3yRMaz/s+fcxh6sYHLxV8SHmpKVlxg1iHXRWAANr1NmJkYkHcQwrgti3
         a2iKjLlaHWYUSYhRxwwrDVjPFb+low5v+TQ7MpyMsA2FG/vPnzpFO6sSsk66pkbbDvvS
         V3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162037; x=1776766837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=;
        b=gLVj4OzikMreDqaim5VNAE4jU/veITRBYFbbxeOqO0ldT2VFNGkVMyBm5WCeab5iSd
         sRJ4AO8VVvN/QAfucKWewFbDVS7Us9wkEsag5w20UBDaT5LUcr+gfar2/6asWKAg27Ri
         36jxBwrL00Faogz7ea4chI55nIARcGkN1SPqtyRxFwqcvJjh01rFZ15p0bffRwqXwOxa
         iq0Uv5scH7f7eLL5z2Azeh+TijghLam5f7KKeGsbLbTnQ5F82TeOFr0mdaSdosfhLdJ3
         BHE5J37YLFTvKxvoMLN6fdnPm61WmOsAho+169hy4mfjLckWGnlF8ZgB+Dm7Z0VxwMX2
         svIg==
X-Forwarded-Encrypted: i=1; AFNElJ8avdi6SEkB/dhz1TerCHt5/5fY1Tl6xVgRuEe+2iuSDm9jt3IgglrvpPUwYN4jEBc8frKqNgLyukj7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4E9iMf6sciGiHquYM/IUlauLPPiVu2eAK2Diyrq2kyxYCpONS
	inYioZ7T4pYqEEqPfZ3mo7zHUhfo2wDwSDbTLIReViMVXJF86TBhSsP/N0Tc3b+I2Ts=
X-Gm-Gg: AeBDietlZD8pwCj5aptsw9+lAptKzQQnTbOCUfjYc+4JjX79uRpxFlmN9RRJ11mEMQ0
	QNroKToxQHW/QrjM3UxfmJ3c1rXoZhOiBDOyu3LzgUGvxHGunDNxEHU8Qy9B9l1j8a9KjdUEbAb
	AVmr4S+oBPTq1o3LUlPuuDEQHwpymxuusnwTd4dBmoGRIl44yFZWKstpXgLxKjE3lF2os40Norr
	ErDeiWY/5a0Hkg5F1tctmXCqsZDF5fd3IlFfTbdRwjFgUmkHVZHwlViS9suAGPDjqB+n+7StNxj
	+SxXn5bm0mXZC1vFF7NCm5njwjHe6AaQpckYVZnmHisHAYKOuTH8HlxLBiJza0n4geWtRPtDlzf
	8N4y2KAS+pbL93QTa8AzUwtYYTePuavLFnLGT4ongUs80kNPseF103PcBGnqf1nD/zLb7ngVEVh
	J00uUouOsScOUVN+zLhEEZ0RS0gYXjUMzGjC4D3cufHg==
X-Received: by 2002:a05:6000:1a8d:b0:43d:1bf6:30f3 with SMTP id ffacd0b85a97d-43d6424c4f6mr24710460f8f.14.1776162037022;
        Tue, 14 Apr 2026 03:20:37 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm20342473f8f.10.2026.04.14.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:20:36 -0700 (PDT)
Message-ID: <5797be19-8886-45a2-bfce-eb7d5f0df6c2@linaro.org>
Date: Tue, 14 Apr 2026 13:20:31 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Juan Yescas <jyescas@google.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 4/14/26 12:08 PM, Krzysztof Kozlowski wrote:
> On 14/04/2026 11:00, Alexey Klimov wrote:
>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>> information and configuration data. Add the SRAM node.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> index cb55015c8dce..cf4a6168846c 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	apm_sram: sram@2039000 {
>>>> +		compatible = "mmio-sram";
>>>> +		reg = <0x0 0x2039000 0x40000>;
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <1>;
>>>> +		ranges = <0x0 0x0 0x2039000 0x40000>;
>>>
>>> You miss here children.
>>
>> Thank you! I guess I should convert it to smth like this:
>>
>> apm_sram: sram@2039000 {
>> 		compatible = "mmio-sram";
>> 		reg = <0x0 0x2039000 0x40000>;
>> 		ranges = <0x0 0x0 0x2039000 0x40000>;
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>>
>> 		acpm_sram_region: sram-section@0 {
>> 			reg = <0x0 0x40000>;
> 
> This covers entire block, so feels pointless. Maybe requirement of
> children should be dropped. What's the point of having children? Why
> does the driver need them?
> 
>> 		};
>> 	};
>>
>> And then later reference shmem = &acpm_sram_region from acpm node.
>>
>>> Also, 'ranges' should be after 'reg'.
>>
>> Thanks, will fix this.
>>
>> FWIW this commit is a copy of commit 48e7821b26904
>> https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.org
> 
> 
> Huh, we should fix that one as well.
> 

On gs101, likely on e850 too, ACPM parses the SRAM and discovers at runtime where
the TX/RX queue offsets are in SRAM. So we can't define static partitions in DT.
I remember that I thought about extending the SRAM driver to add dynamic
partitions (clients to request the mmio-sram driver to create partitions at
runtime), but it was just ACPM that's using SRAM, so I didn't need it.

Cheers,
ta
