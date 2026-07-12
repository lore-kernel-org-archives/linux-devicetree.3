Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09463655D4
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783880562; cv=none; b=uaRC7fhY5Q35efjSRoAXPIbCGUTPqx/n8iKIYNtVi+afJL6t6/AZbjy39va5kMJiZtqu+dNEPECAvO7D+x6YbvUPSTgiAkMaDFaM3VRTKD8FUtTjZw0GvI5HD3+RFSn68Fj92xAWYofjHUegPvRUg8gGodXM80Sh3c8S1Li7nqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783880562; c=relaxed/simple;
	bh=1N8vinaeSIBPIirtOCJprrAA0a7ufR5cnijKzmXSpiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGV9mQZH02nRvA7mrw8MjCsiZQyo3JZ8K6cC2weg0NnNEGepKYv2ke9PlQa9nfxefbwtH6jwDAPS3heARCVsJRDzz0dC8CTVcyLAvo15wAIBKLj8A8nY46ILnOYkK4ppk8sZg8xX9wM6tU29w7JGZDfg23Hs6Hwx0Ch61U5l4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=vI2ZSrDQ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="vI2ZSrDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783880554;
 bh=+qsE47EvROMF63oVGnhuZrejS0P7zQNL6G32ikfomhQ=;
 b=vI2ZSrDQ9kC5heg+T4BSmN0f9LtZabFF5qjR4YSd1h9CBlcTpixHkCfvqEckHT7eHXw1Ph6DJ
 F+SKoxxSfSrlP3tVDjEC3blNhYc8JzBY0JyAezHVfJsczbyh4/xHJTyFbCfAqI1d5FcJowlZ7HA
 MSBNWdpRPmoDAnrmGEW4w1kgomQkMbnaFEayavSsV/4SKs+vjp5CrW995vKpG6KGhLQVOX8Vl9d
 AdRM+bN8xkjngsPNhJslGCKVXBAJqowgd5lYcjs5qgto4H/hOcYHiLjh74wTjZTfGE5bDQA6qic
 FmiVPRBKpApIktDBobSdg0CiSbuFD4VZmN5N5g4BpueQ==
X-Forward-Email-ID: 6a53db6abaf216d73a5035fc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <50a8a36a-e7dc-43ec-80ce-904e6e7fbd3f@kwiboo.se>
Date: Sun, 12 Jul 2026 20:22:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
 <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
 <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joachim,

On 7/12/2026 8:00 PM, Joachim Eastwood wrote:
> Hi Jonas,
> 
> On Sat, 11 Jul 2026 at 01:24, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>>
>> Hi Joachim,
>>
>> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
>>> From: Joachim Eastwood <joachim.eastwood@gmail.com>
>>>
>>> Since the NPU is hooked up on these the always-on isn't needed anymore.
>>>
>>> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>>> index bcb2f5d63a61..463cfeddf270 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>>> @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
>>>               regulator-max-microvolt = <950000>;
>>>               regulator-ramp-delay = <2300>;
>>>               regulator-boot-on;
>>
>> Why is boot-on kept?, NPU is likely not needed until OS has started.
> 
> I am not really sure.
> Looking at the other rk3588(s) boards, they also kept the boot-on parameter
> when the always-on was removed.

Ahh, those board should likely also drop the boot-on prop. There should
really not be any need to force the PMIC to enable this regulator from
firmware. If it was left intentionally for other boards, maybe there is
a bug in software that need to be fixed.

> 
>> With PD domain-supply the regulator should be enabled automatically, or
>> is there some other issue that requires boot firmware to enable this
>> regulator before OS is started?
> 
> Maybe some Rockchip people can enlighten us?
> 
> I haven't had the time to actually test the NPU. I'll try to test it next week.
> So this patch is based on similar changes done to other RK3588 boards.

Yes, please drop the boot-on prop and test :-)

Regards,
Jonas

> 
> 
> best regards,
> Joachim Eastwood

