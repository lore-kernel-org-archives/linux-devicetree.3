Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C713E9C1F;
	Tue,  7 Jul 2026 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423444; cv=none; b=R//CH5GFRN4l73BntC7XyRDlB9oosCBI5d+oWXRG/cxoPTLFXWxCPpGnGHGH9QF3fOhnPvmbbOfb+lHCndae2UmFuuKbya3Cz+VlZlE3NKb6fcI75JNbAsIZTua/b8GaKW2gZtyGJBolP2JopvJUo6aUmWw8pPgEg8cJaVFf2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423444; c=relaxed/simple;
	bh=MNq3g0GFVF/h1p5eOlO9D0oZO//Tjm7KBHuMFBBripA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQyUisPGnoh0HAi5J2PnMLzhPIVmqbEfkoIOt61/Xb7TaTqs8NpgePHDLhjlcOvX3RyBwsIvF3VbTx6P4bWiPw8SJ8ttkrS/j7CpkOvMkRyDTmw87gKuUn3qedq3Jdv2JiV63rloQJBVUcRMNc14+Q6BVhpydwpyfPtYqea4D5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a04izbRn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a04izbRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783423441;
	bh=MNq3g0GFVF/h1p5eOlO9D0oZO//Tjm7KBHuMFBBripA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a04izbRncf2krS+ydY9IR1ojtF7rMi1XhRyL3Ln0TWJNeR+DcmnBnMtZG9J89H8xx
	 2KrUVOeBGOGItQiQkbAmzRVQlbV9YSmaEHd8jV4Hbmr6R3UxwW8JZRZ2t5iQG69H98
	 ZFZFXSS6/qNSPEPalaJxztRc6y2vtA9HKxmRtXPeMEieukHkLaFt9iZ3eZvTN7JREt
	 CHaf5SXRfB0jhNIEvFU+DlhJJneyX4HK5ml5P5Bvbja3yl118+lnwqx1X6380Ab1qC
	 mYmtxYdVbTpbnhGVIaPDQkjYrZvVpXbMMGv6BfZSKRWJDmScfPCHHOFAJes3cwvhco
	 FbpVCAiypBGaA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8EEF17E0521;
	Tue, 07 Jul 2026 13:24:00 +0200 (CEST)
Message-ID: <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
Date: Tue, 7 Jul 2026 13:24:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707104427.3409290-1-wenst@chromium.org>
 <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/7/26 13:08, Chen-Yu Tsai wrote:
> On Tue, Jul 7, 2026 at 7:05 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On 7/7/26 12:44, Chen-Yu Tsai wrote:
>>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
>>> DRAM.
>>>
>>> Add a device node for it and hook up all the supplies.
>>>
>>> This change requires a firmware fix for the SPMI bus to read back
>>> correctly. The required firmware version is 15842.175.0. This is
>>> included in ChromeOS releases R150-16700.22.0 (available in Beta
>>> channel as of writing or stable channel in mid-July) or
>>> R151-16721.0.0 and later.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> This is a big problem then.
>>
>> I take it as if the firmware fix is not in place, probing the CPU power supplies
>> will fail, with all the consequences.
> 
> That's right.
> 
>> This means that with this, we're breaking all Geralt machines with older firmware,
>> which is not acceptable...
>>
>> ...so this needs a different solution, or strong reasons to make me understand that
>> I'm wrong, if I'm wrong.
> 
> We can drop the CPU supplies (they don't matter since cpufreq is hardware
> driven) and just add the regulators. How does that sound? If the firmware
> isn't updated, the PMIC will fail to probe, but since nothing is using it,
> the system will continue to work (with some annoying error messages).
> 

That'd be wrong, but less wrong than not having anything described...

...I wonder if, at this point, you could set the SPMI node to status = "fail" and
have the *new* firmware override that to "ok".

That's the only reasonable way to go forward, IMO.

Of course, avoid having the firmware adding the CPU supplies, because that would
be rather sketchy then. Just "if spmi status fail found, change to ok".

Cheers,
Angelo

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> ---
>>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
>>>    1 file changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> index f382f90c48f5..fea52c377d88 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> @@ -4,6 +4,8 @@
>>>     */
>>>    /dts-v1/;
>>>    #include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/spmi/spmi.h>
>>> +
>>>    #include "mt8188.dtsi"
>>>    #include "mt6359.dtsi"
>>>
>>> @@ -241,6 +243,14 @@ &cpu5 {
>>>        cpu-supply = <&mt6359_vcore_buck_reg>;
>>>    };
>>>
>>> +&cpu6 {
>>> +     cpu-supply = <&mt6319_buck1>;
>>> +};
>>> +
>>> +&cpu7 {
>>> +     cpu-supply = <&mt6319_buck1>;
>>> +};
>>> +
>>>    /*
>>>     * Geralt is the reference design and doesn't have target TDP.
>>>     * Ciri is (currently) the only device following Geralt, and its
>>> @@ -1156,6 +1166,14 @@ pins-bus {
>>>                };
>>>        };
>>>
>>> +     spmi_pins: spmi-pins {
>>> +             pins-bus {
>>> +                     pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
>>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
>>> +                     bias-disable;
>>> +             };
>>> +     };
>>> +
>>>        uart0_pins: uart0-pins {
>>>                pins-bus {
>>>                        pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
>>> @@ -1267,6 +1285,54 @@ &spi2 {
>>>        status = "okay";
>>>    };
>>>
>>> +&spmi {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spmi_pins>;
>>> +     #address-cells = <2>;
>>> +     #size-cells = <0>;
>>> +     status = "okay";
>>> +
>>> +     pmic@6 {
>>> +             compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
>>> +             reg = <0x6 SPMI_USID>;
>>> +             pvdd1-supply = <&pp4200_s5>;
>>> +             pvdd2-supply = <&pp4200_s5>;
>>> +             pvdd3-supply = <&pp4200_s5>;
>>> +             pvdd4-supply = <&pp4200_s5>;
>>> +
>>> +             regulators {
>>> +                     mt6319_buck1: vbuck1 {
>>> +                                     regulator-name = "ppvar_dvdd_proc_bc";
>>> +                                     regulator-min-microvolt = <520000>;
>>> +                                     regulator-max-microvolt = <1155000>;
>>> +                                     regulator-enable-ramp-delay = <256>;
>>> +                                     regulator-allowed-modes = <0 1 2>;
>>> +                                     regulator-always-on;
>>> +                     };
>>> +
>>> +                     /* vbuck2 is ganged with vbuck1 */
>>> +
>>> +                     mt6319_buck3: vbuck3 {
>>> +                                     regulator-name = "pp1125_emi_vdd2";
>>> +                                     regulator-min-microvolt = <1060000>;
>>> +                                     regulator-max-microvolt = <1170000>;
>>> +                                     regulator-enable-ramp-delay = <256>;
>>> +                                     regulator-allowed-modes = <0 1 2>;
>>> +                                     regulator-always-on;
>>> +                     };
>>> +
>>> +                     mt6319_buck4: vbuck4 {
>>> +                                     regulator-name = "pp0600_emi_vddq";
>>> +                                     regulator-min-microvolt = <570000>;
>>> +                                     regulator-max-microvolt = <650000>;
>>> +                                     regulator-enable-ramp-delay = <256>;
>>> +                                     regulator-allowed-modes = <0 1 2>;
>>> +                                     regulator-always-on;
>>> +                     };
>>> +             };
>>> +     };
>>> +};
>>> +
>>>    &uart0 {
>>>        pinctrl-names = "default";
>>>        pinctrl-0 = <&uart0_pins>;
>>
