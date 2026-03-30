Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68E3AC0F1;
	Mon, 30 Mar 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857868; cv=none; b=UESDU56Nhg5QR7+peH4C7vId8noC7EF6TnTvCu1tlPrIoMwfGiU9ld9yteC1WWg4mTje33CIOC96gTBDfETGFRh/la5A7ddV2yxyJFhJWdtG4udJHCK/55RhW3BghIZT9hTHA9eR6ld6v5qLphh7qDtX7X5lFA+WBB5tGcsUIto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857868; c=relaxed/simple;
	bh=YiDVacVWTR7QV0Z3LWZZDvKO3j+7kXqpLoj9VeVHTHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz7hqfJ7ashkI/clrbarPVsCM1vVeViyzrj/mYrMNejtzGtutnA7GqZ9PyyeeE6NXPfmqmbxZiNn1ik0tAHv+o/AAX+oeD4wCd+0y2aT9xjQdriFCKKHyXdH53VL5ATPz3znq1Qkf6Wk48qVZicPUi4Q962gEOeRuRODBFFfZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHZiV6Ma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHZiV6Ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D32C4CEF7;
	Mon, 30 Mar 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857868;
	bh=YiDVacVWTR7QV0Z3LWZZDvKO3j+7kXqpLoj9VeVHTHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AHZiV6Maae+Zyz70DUVCwmRVnqQUUx9YCRgxLOxE6h2gIyVxyzcZsQV4+fdXbe4xo
	 y7jvrSARcS7mDL0ulc1DPa1ZRPXDj8+DqDVxjgO492MIvOFskPKzc6LE2+HE8ANCWS
	 VrA1+6P0RnbuNyj1Fs7bN7nXehni53nFOxXU40tkJdxsQZo9yd+TybC6sSsLcGfIut
	 KT2QzqMQ6Yd1k8Owj96/QWlpWQWflTJke/Ba5Yps9Pw3fl9DxHGJmlKyoiqb4syRhR
	 HfPqz6MWvAqUl6e/DihD01UL427JeOsyfCRMOdTdx/sA9Wi5x5RW3D7oFDmiXbIBRJ
	 sdM5Nu/tcdPQw==
Message-ID: <4525cc8e-cb05-4126-ad91-c2e18b809b84@kernel.org>
Date: Mon, 30 Mar 2026 10:04:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
To: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@Red54.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 finley.xiao@rock-chips.com, heiko@sntech.de, kever.yang@rock-chips.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org
References: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
 <tencent_723DE3D68C7F44CF67ED583F558130B47208@qq.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <tencent_723DE3D68C7F44CF67ED583F558130B47208@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/03/2026 04:46, 谢致邦 (XIE Zhibang) wrote:
> On Sat, Mar 28, 2026 at 04:08:57PM +0100, Krzysztof Kozlowski wrote:
>> On 28/03/2026 14:05, 谢致邦 (XIE Zhibang) wrote:
>>> This fixes the stdout-path in rk3562-evb2-v10.dts.
>>>
>>> Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
>>> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>> index e4816aa3dae0..14e74e8ac7df 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>> @@ -26,6 +26,16 @@ aliases {
>>>  		gpio2 = &gpio2;
>>>  		gpio3 = &gpio3;
>>>  		gpio4 = &gpio4;
>>> +		serial0 = &uart0;
>>> +		serial1 = &uart1;
>>> +		serial2 = &uart2;
>>> +		serial3 = &uart3;
>>> +		serial4 = &uart4;
>>> +		serial5 = &uart5;
>>> +		serial6 = &uart6;
>>> +		serial7 = &uart7;
>>> +		serial8 = &uart8;
>>> +		serial9 = &uart9;
>>
>> UART aliases are properties of the boards, not SoC.
>>
>> Best regards,
>> Krzysztof
> 
> So are you saying that we need to remove the serial aliases from files
> like rk3308.dtsi, rk3328.dtsi, rk3368.dtsi, rk3399-base.dtsi,
> rk356x-base.dtsi, rk3576.dtsi, rk3588-base.dtsi, and so on?

Well, I tried once but people disagreed because of impact, so probably not.

Best regards,
Krzysztof
