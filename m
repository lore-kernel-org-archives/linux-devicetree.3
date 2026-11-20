Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160509;
	b=JLk7CLo/0R/XtNVhBLHW2hpbv4h2AQA00ESunV6ImGTOewiyhY2ULJGEQDeL15AGcYL5
	 IMXSPMlChLM5t2VX4kob2CyPztVBabC/zH9s8bgMqS/ce8joZhORON7qEjfAOcpsYftQ7
	 eyh+3PEs6ft4x0HCGav4D8SVFPiEjFm6Pzy404XqvkkEYwmkYhioH1pEM+H5SdyJwmW95
	 qC/sHk2izYI6u4fUNOwb3uBzFqpls1j9hSnDkfCMF2gFUoJGttvyM5pjPaXwAWWHHt5jy
	 Q4v3PB6MoRs6uE2dvKjV17FK4jYP6Q7u2Dj9wJr0lKVtU4a7uWfxZs6B3ipaN1SetLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160509;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=cqjUXY2lS/ifY7N0hU3WutIFq+hkCUqoWWB4fNr8nFI=;
	b=W3xYMCLwt1Y68bnn9aLIK6vkVeLGyIru/XHn28dZZs8F1VCMBxJ+iyDdHkAbJMgIvHSp
	 g4+JePS3b50P/TnW0WcJt1YzAfgkWCzbRLPYs/VftWd0ByjLN3ypPR2ph7IrsIv8rRMuk
	 PHUkd58L/5tO9nG1lhM5ctAF4pjame5Qv5zH+WFDNOm1GmsYUgaylXBccuGnrkka1KnRA
	 ZJGRyPwcJopoZnyzBw0Lbg99OUAhZWaWnoDMJQe+PyoPzBB9weLI7gm0u7YNVHQBArsj5
	 wQ/ULQsOb5TGM5G856wJrNOuEC//vYujekxVKvmfPKMZ4p2j6IyUO/Ybvx4tKISrNdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UkpFrErN;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE3C606A320;
	Fri, 20 Nov 2026 07:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UkpFrErN
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2944410FEAE;
	Fri, 20 Nov 2026 08:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795160497; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cqjUXY2lS/ifY7N0hU3WutIFq+hkCUqoWWB4fNr8nFI=;
	b=UkpFrErN5qeJm8+O+gxMVUi+gYgtTmWk6xHNw/Z08CnjroEpkxTOvW1Z3JUjz4lkGakeTX
	QO6AmOShUtPlWSj5eMkhcWSN4VYORcaeruez71cCWMh2TbO4V33Y5imxL+wK8MMXUVn6pZ
	yOWT6oOwGsb7F0QnUkwl8k/1+42Vv3GxApfHL+KOknTnou91nlLbcF+mWha3Db8qaU29YK
	sLKG+PAyPhRr204h5XmfTKMnK583cLDUE3TVxlo3cbzqtQHv2jyzOM6w2hJVmoamUKimFg
	FwZ9Liyix+2/dR1zUVkT5OMBW1f13potj6VnFd8yKPxHQcrqJyCt+ES4WyOeZg==
Message-ID: <77bbefd5-3e05-45e4-9e0a-02063ebf3e06@nabladev.com>
Date: Fri, 20 Nov 2026 08:41:33 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
 <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
 <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
 <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/18/26 1:07 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 17:24, Marek Vasut wrote:
>> On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
>>> On 17/11/2026 14:41, Marek Vasut wrote:
>>>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>>>> because it was never documented as actual ABI.  There is no in-kernel
>>>>> user of it, although there might be U-Boot.  External DTS users cannot
>>>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>>>
>>>>> No new custom aliases are allowed for years now.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>>>     1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>>> index bcf63e2ea989..5795b352fccf 100644
>>>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>>> @@ -10,7 +10,6 @@ aliases {
>>>>>     		serial0 = &usart6;
>>>>>     		serial1 = &uart8;
>>>>>     		eeprom0 = &eeprom0;
>>>>> -		eeprom0wl = &eeprom0wl;
>>>>>     		rtc0 = &rv3032;
>>>>>     		rtc1 = &rtc;
>>>>>     	};
>>>>
>>>> U-Boot depends on the alias, so please don't drop this one.
>>>
>>> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
>>> user as understood in Linux kernel policy "we do not break users".
>>> Especially that U-Boot does not even consume that DTS! We do not break
>>> U-Boot as long as it is about documented ABI.
>>>
>>> Here U-Boot won't be really affected, because updating DTB in the
>>> kernel, does not update the one in bootloader. It does not go that way.
>>> It could go opposite, so from bootloader -> kernel, but not the other
>>> way around.
>> U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .
> 
> Cannot, otherwise it would have document that ABI. That is the
> requirement of using OF_UPSTREAM - you also use upstream ABI. You cannot
> use upstream DTS with downstream ABI.
What option do I have here that does not break existing use case ? (I 
can patch the U-Boot board code which depends on this, that is a non-issue)

Is there a schema which lists approved aliases now ?
