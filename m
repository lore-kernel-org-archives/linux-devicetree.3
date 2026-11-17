Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969092;
	b=oBPTpIwcS2lwF/hyyBpj0xvY22/J1QtsrRD3k/kuW9nbPuFzMtL0eCPI19S6At547U44
	 jQ8VSNGIhGA4dCo8IggADv3JPt+7Y9B14PbkCcAtYssSB/VpBdZPptcMACg8/jsijPco1
	 ebxPc/Iw8wL+3gDBclyzRVxxjwy6lNx+uua37+b2lS3u2ZhdP/2eCY8IygrSDWGBj/JVb
	 /FkZmz0YJAwW+Ob1uSggXv88rDFTNU5c6hFswE48dcXaH6Xaiwr/9Au7bm2++MUv92PMU
	 SmWxCOwmTotDiyqv2SrmVZzckenVfgO8PWqOriYtimrirvq3SbkLdsTF5aRlXCOe6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969092;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=arhGKT4vqWM3pFfwqlJs9HcULxRZyX/HFPSkv4gVspE=;
	b=u+fGpvfeOp4X3DmXIAiprfuuKISdtBOSBvOPC8FFoFr30+mbAwZcAf7jAOFKDhFHEzuv
	 5Q+JBprFSs+TuJJnC105BLoInv1Jk+pGA/RbKQ+oUn/C1JK5ACgfoQARx5Ziw2/CbtFvl
	 UPtQQOrmP9n27/0smnaDGLrxKeyMFAI66TjuE7GQNKXnck6/d+3/Fj51En3lKeFEMUKY6
	 dzso2vdgzl1MaR0A+/NMi3/EiVO74998g7gc4xtN7IXVuCptPBnM0jnvXyL9g8bANDQb7
	 Sxd4CZuxKAL1fj8aRotXotnSfja2/d7qwvY4kDudxOw28W9Hg3dbudh8fMLLfXiHsrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=G4CQ1Nzw;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F94606A31C;
	Wed, 18 Nov 2026 02:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=G4CQ1Nzw
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25BED10F884;
	Wed, 18 Nov 2026 03:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794969089; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=arhGKT4vqWM3pFfwqlJs9HcULxRZyX/HFPSkv4gVspE=;
	b=G4CQ1NzwskCWEv+rGKnsUUbD3uvX1w83G12cEVIAQKyt3RxxMljAMQlJmZCUjWMfd+I2zH
	opgZk8hU8Zd/cBziwYJmL+ISphfBMkeKHJ5QhFX3/jfbZfrZkTA6jcH0cEpNlA29wNIc/X
	mXoyFJ8KHGCag4tjxn2cy/pq4MGVhdV39wMKNqzYmw5skocKh1GgKuzOKpMoEMKfh55xM+
	Y2ZfqAM4flyE3pV1LL6hDjnTCE9MGWOTftzN1M80Lxjs3/z7hxh+nrTOj1rqoqnLJiVBGX
	+f9kWh3L8fsCItBWXkOABbe11JlGUTftmdXsnzsrUuQJjWI0GmD3bNJ086++ng==
Message-ID: <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
Date: Tue, 17 Nov 2026 17:24:49 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 14:41, Marek Vasut wrote:
>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>> because it was never documented as actual ABI.  There is no in-kernel
>>> user of it, although there might be U-Boot.  External DTS users cannot
>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>
>>> No new custom aliases are allowed for years now.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>> index bcf63e2ea989..5795b352fccf 100644
>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>> @@ -10,7 +10,6 @@ aliases {
>>>    		serial0 = &usart6;
>>>    		serial1 = &uart8;
>>>    		eeprom0 = &eeprom0;
>>> -		eeprom0wl = &eeprom0wl;
>>>    		rtc0 = &rv3032;
>>>    		rtc1 = &rtc;
>>>    	};
>>
>> U-Boot depends on the alias, so please don't drop this one.
> 
> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
> user as understood in Linux kernel policy "we do not break users".
> Especially that U-Boot does not even consume that DTS! We do not break
> U-Boot as long as it is about documented ABI.
> 
> Here U-Boot won't be really affected, because updating DTB in the
> kernel, does not update the one in bootloader. It does not go that way.
> It could go opposite, so from bootloader -> kernel, but not the other
> way around.
U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .
