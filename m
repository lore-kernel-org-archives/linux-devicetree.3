Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B76344D83;
	Mon, 20 Apr 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682830; cv=none; b=LTYsC5fl1SAm3pizvSDUu5XCitnHDLnymfNQIOP6EHoLtqqoxaAmeNblxNXUuMxTNPm18Xm3mv0sJ/9x/UOdmvxaIb6J2u5+Gdx6hF7KTYtBueA+qyicZ3U/NdgxizWoY82jZJzPcv2fR39gA3ixmSlhmb/s8Fee9uYAKWGaZak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682830; c=relaxed/simple;
	bh=PLPNmgPAxeK5mYLQnnUXuoPE4aCHhmjsyDeuAgufwss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAb1+VEJiWrdFwlmlqpAZtfuuvr3515pWDhfsVvdfxz96QM/yV2INr3WIZOSHmExQAzmnYwuPdo86TJU1d9BB0i3ceBtzMO8YufFeUsF2O2eF+ywW5eudw5kbo780/VwYjouVcfpXmm37SyApTvPVEGuTqxZYeeboi7ZwcXlTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K0CY6tvZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K0CY6tvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776682826;
	bh=PLPNmgPAxeK5mYLQnnUXuoPE4aCHhmjsyDeuAgufwss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K0CY6tvZ839+ED5+JnvY8glBhKFO790KScWfvsNhZDE9pe4jF7PrB2Kic+moM9ZW3
	 BIMal4m2vnG6ohpyr2fQrSFew483858a5b26SmlEuJbPp8jlIBh/QdXrFNXi3g0oDj
	 kaJVEkPIdbGwNncdTi+RkrpomJ7ry+gwM7tTMx9SXcwFkTkzzH+boQ1JaWTRz0C2W2
	 dnmU7FH1m8muVP55ogcfnrHSzuaqVwNda+qefEMeGqYVIovbCSnv0q5ZFz8qr152qg
	 RXiseB/qzTH0cnFahf7JzeZ5WxXvPCJuXEiQs0d2OiOa7s1ayeC3o0y90v0ZCWapkC
	 4V3yepyJhcRCg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CAE617E1388;
	Mon, 20 Apr 2026 13:00:26 +0200 (CEST)
Message-ID: <401a020f-ca5d-4c7d-941e-f0288e144357@collabora.com>
Date: Mon, 20 Apr 2026 14:00:25 +0300
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
 <2000470.6tgchFWduM@phil>
 <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
 <2282688.C4sosBPzcN@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2282688.C4sosBPzcN@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heiko,

On 4/18/26 2:12 AM, Heiko Stuebner wrote:
> Hi Cristian,
> 
> Am Freitag, 17. April 2026, 18:34:17 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
>>> the comments below apply sort of to all patches in that series.
>>>
>>> Am Freitag, 17. April 2026, 11:24:39 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>> The board exposes the GPIO4_C6 line to control the voltage bias on the
>>>> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
>>>> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
>>>>
>>>> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
>>>> property and drop the line from the vcc_5v0_hdmi regulator to allow
>>>> adjusting the bias when transitioning between TMDS and FRL operating
>>>> modes.

[...]

>>>
>>>
>>>> @@ -231,6 +228,8 @@ &gpu {
>>>>  };
>>>>  
>>>>  &hdmi {
>>>> +	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
>>>> +	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
>>>
>>> this should be sorted the other way around I think.
>>>
>>> Also please provide a pinctrl-names property too. If for whatever reason
>>> the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
>>> board DTs are staying in the "old" compatible mode until they are adapted.
>>
>> Just to make sure I fully understand, the convention is that 
>>
>>   pinctrl-names = "default";
>>
>> should be always provided, even when the node overrides an existing pinctrl-0
>> property?
>>
>> E.g. in rk3576.dtsi we have:
>>
>>   hdmi: hdmi@27da0000 {
>>     ...
>>     pinctrl-names = "default";
>>     pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
>>     ...
>>   }
>>
>> Hence I omitted pinctrl-names which doesn't change and just appended
>> &hdmi_frl_en to pinctrl-0's original value.
> 
> correct, please always provide a pinctrl-names entry when setting a new
> pinctrl-0 .
> 
> The background is, imagine you have a base:
> 
> pinctrl-names = "default";
> pinstrl-0 = <....>;
> 
> and override pinctrl-0 in a board.
> 
> Now a newer binding introduces a 2nd pinctrl state "foo". Of course
> we're backwards compatible, and both are valid and the driver checks
> what states are defined.
> 
> So the base sets:
> pinctrl-names = "default", "foo";
> pinctrl-0 = <...>;
> pinctrl-1 = <...>;
> 
> in your (old) board you override pinctrl-0, but the driver still sees
> the new variant with 2 pinctrl states, where it should've stayed with
> the legacy 1-state, until the board-dts might get adapted in the future.
> 
> 
> And I know, we're likely not doing that everywhere, and also in most
> cases it won't really matter, but still it is safer and sets the better
> precedent :-) .

Thanks for the detailed explanation, that clears things up!

There are several other nodes (e.g. i2c, pwm, uart) that also lack
pinctrl-names despite providing pinctrl-0 - I can address those in a
separate patch.

I also noticed an inconsistency in property ordering: some nodes place
pinctrl-names before pinctrl-<n> and others after.  I have always used
the former, but we should probably prefer the latter to stay consistent
with how clocks, resets, phys, etc. are ordered.

Thoughts?

> 
>>>>  	status = "okay";
>>>>  };
>>>>  
>>>> @@ -655,7 +654,7 @@ &pcie0 {
>>>>  
>>>>  &pinctrl {
>>>>  	hdmi {
>>>> -		hdmi_con_en: hdmi-con-en {
>>>> +		hdmi_frl_en: hdmi-frl-en {
>>>
>>> pinctrl names should ideally match the naming in schematics, for example the
>>> "HDMI0_TX_ON_H" for jaguar and tiger. This makes it way easier to> go from DT
>>> to schematics and back.
>>
>> I opted for a more descriptive name that could be used consistently across all
>> boards, given that not all schematics are publicly available.
>>
>> You make a fair point though, we should probably stick with the pretty terrible
>> hdmi[N]_tx_on_h naming instead.
> 
> yep, we're doing that everywhere else already too, and sticking to the
> schematics naming, also prevents any discussions about how something
> should be named ;-) .

Indeed. :)
