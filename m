Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820402E11C7;
	Mon, 20 Apr 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700409; cv=none; b=nMTeh/ZUPh3+6laf4tcuC7qCJKgozCfVu+S5nn56R0BxXvpwYQ4g8LXmn8sBQhL6C3cYW4YVtefbYX37pXkwesmAl0z6oY2fA98IrFuf+nLM8u/FVuQf8Jviwy4l3LfCrR+yYhf0J/F2JWY6T0EFwb+vuTSz62ePm1ujuw0+Ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700409; c=relaxed/simple;
	bh=AD5SU7VAHmOec5494xhlBBXbP87I8anCA//9QBwyto4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pT8wjGN6QZtexFIQ4a86LjzFjwE9zFFQeFBWTExAkyKfr/yMxGt/D8b+8w0b6VwAFHz4dCyUe0C/q9KHoncROmPCajeTjZHsPx7rhW7HHEESFDOoMMd2Buv2ndHzaFUXoY+AvjMohNz0UHZ65NDz+QP1uiTBvf3aNJgAuCHwJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DqsBU3cA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DqsBU3cA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776700406;
	bh=AD5SU7VAHmOec5494xhlBBXbP87I8anCA//9QBwyto4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DqsBU3cAZqitqjmVK+sLr4bmFIpQ0J6XbYpByue8a6Mbcc3TfQS1UPd9g9fZ0wS4L
	 2pmXCQHwczCr5cK9WTdkdbmG3PakX0/qnZnEl1vutxb6PLUYbOn4kZnpicMQtrGe7K
	 bQ4AbJ7yV0Td+uwv+qzpGNzR9V+MgL/ydHQ2imXC46kmQidtbLOMQAOq3ucEaoRK2l
	 /6Qv9yJzeadicJbQJSZoDDgDMODBTjzPqgKtE2Iesm3SYErdK7AHEr+lj26iBHecV6
	 0o0mY/7DcEF3VN+kZwl2mYqxrfXss8KIP4iUdw7918pAagajKHrEYYgZeIVcykIJqR
	 kHoRpmFhAvk+g==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9105517E137D;
	Mon, 20 Apr 2026 17:53:26 +0200 (CEST)
Message-ID: <693537c8-b7d9-40e9-9c53-284c1af78e06@collabora.com>
Date: Mon, 20 Apr 2026 18:53:26 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2282688.C4sosBPzcN@phil>
 <401a020f-ca5d-4c7d-941e-f0288e144357@collabora.com>
 <2480203.yKrmzQ4Hd0@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2480203.yKrmzQ4Hd0@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/20/26 6:18 PM, Heiko Stuebner wrote:
> Am Montag, 20. April 2026, 13:00:25 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> Hi Heiko,
>>
>> On 4/18/26 2:12 AM, Heiko Stuebner wrote:
>>> Hi Cristian,
>>>
>>> Am Freitag, 17. April 2026, 18:34:17 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
>>>>> the comments below apply sort of to all patches in that series.
>>>>>
>>>>> Am Freitag, 17. April 2026, 11:24:39 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>>>> The board exposes the GPIO4_C6 line to control the voltage bias on the
>>>>>> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
>>>>>> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
>>>>>>
>>>>>> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
>>>>>> property and drop the line from the vcc_5v0_hdmi regulator to allow
>>>>>> adjusting the bias when transitioning between TMDS and FRL operating
>>>>>> modes.
>>
>> [...]
>>
>>>>>
>>>>>
>>>>>> @@ -231,6 +228,8 @@ &gpu {
>>>>>>  };
>>>>>>  
>>>>>>  &hdmi {
>>>>>> +	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
>>>>>> +	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
>>>>>
>>>>> this should be sorted the other way around I think.
>>>>>
>>>>> Also please provide a pinctrl-names property too. If for whatever reason
>>>>> the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
>>>>> board DTs are staying in the "old" compatible mode until they are adapted.
>>>>
>>>> Just to make sure I fully understand, the convention is that 
>>>>
>>>>   pinctrl-names = "default";
>>>>
>>>> should be always provided, even when the node overrides an existing pinctrl-0
>>>> property?
>>>>
>>>> E.g. in rk3576.dtsi we have:
>>>>
>>>>   hdmi: hdmi@27da0000 {
>>>>     ...
>>>>     pinctrl-names = "default";
>>>>     pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
>>>>     ...
>>>>   }
>>>>
>>>> Hence I omitted pinctrl-names which doesn't change and just appended
>>>> &hdmi_frl_en to pinctrl-0's original value.
>>>
>>> correct, please always provide a pinctrl-names entry when setting a new
>>> pinctrl-0 .
>>>
>>> The background is, imagine you have a base:
>>>
>>> pinctrl-names = "default";
>>> pinstrl-0 = <....>;
>>>
>>> and override pinctrl-0 in a board.
>>>
>>> Now a newer binding introduces a 2nd pinctrl state "foo". Of course
>>> we're backwards compatible, and both are valid and the driver checks
>>> what states are defined.
>>>
>>> So the base sets:
>>> pinctrl-names = "default", "foo";
>>> pinctrl-0 = <...>;
>>> pinctrl-1 = <...>;
>>>
>>> in your (old) board you override pinctrl-0, but the driver still sees
>>> the new variant with 2 pinctrl states, where it should've stayed with
>>> the legacy 1-state, until the board-dts might get adapted in the future.
>>>
>>>
>>> And I know, we're likely not doing that everywhere, and also in most
>>> cases it won't really matter, but still it is safer and sets the better
>>> precedent :-) .
>>
>> Thanks for the detailed explanation, that clears things up!
>>
>> There are several other nodes (e.g. i2c, pwm, uart) that also lack
>> pinctrl-names despite providing pinctrl-0 - I can address those in a
>> separate patch.
> 
> As said above it is an ideal to aspire to (having -names together with
> defining states), but if you want to add the "missing" -names,
> go ahead :-) .
> 
> 
>> I also noticed an inconsistency in property ordering: some nodes place
>> pinctrl-names before pinctrl-<n> and others after.  I have always used
>> the former, but we should probably prefer the latter to stay consistent
>> with how clocks, resets, phys, etc. are ordered.
>>
>> Thoughts?
> 
> There is sort of a "conflict" between regular ordering and possibly
> better readability. I.e. the dt-writing guidelines propose alphabetical
> ordering which I guess puts numbers before letters.
> 
> On the other hand the semantic definition of list the states and then
> define them (names first, -0, -1, etc second) looks more sensible from
> a understanding standpoint.
> 
> 
> But there we'd end up with special rules, so just sticking to the
> base sorting will cause less friction in the long run I think.
> Aka, -0, -1 first; -names after, follows the main sorting suggestions
> so it's easy to explain to newcomers.

Yes, that seems like a good enough reason to go with this approach.

> But please don't re-sort existing entries :-)

Oh, no, it's just for the current changes. :-)

Thanks,
Cristian

