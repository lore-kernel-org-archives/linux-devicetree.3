Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79683FE66D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372549; cv=none; b=BMhO1EXxQuRW9RaCydrJNa4Fst76pZ6NACZOE7Lz+fI1Jt7tlxhgZYqEf10s4qp816ZUgFKsLEkJ19U2ekMeUd9rA3oxje3cXvsLOrju88N9BFVQFAMDDCG54JiMxklVSahyljz9R5aCF2xhWsL/3y2w0GUaM28FUrFCdAbYXk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372549; c=relaxed/simple;
	bh=UR1YF4dYe91p+3NsRuRe9m2Rxg9yVweQBgZyhCiwxls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4DAURroykm7S2CcJqbvO26MIivTuvCIG65Y1ppWChKuT6ub0lXaHbxwEf9OCJxtzyWaME6WRzxO8wjxrav3s6NzDBTfGrj8Gir2mRKxoWZyxDyx9rMMLeVUD0KL3LlExFthlnZrRPzgV+HnfOalkJuw+yIDEwgSIQ2yAkO+vt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kwiboo.xyz; spf=pass smtp.mailfrom=fe-bounces.kwiboo.xyz; dkim=pass (1024-bit key) header.d=kwiboo.xyz header.i=@kwiboo.xyz header.b=UZDsuVVz; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kwiboo.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kwiboo.xyz header.i=@kwiboo.xyz header.b="UZDsuVVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.xyz;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-58e3cb06d0; t=1774372542;
 bh=fvp7Cw7x/AnM/cgBnxrbRKiY//wCpYd0jLxzFo22pCk=;
 b=UZDsuVVzpbUEeD1QpsaBb3DTRoaFlfNHd/8sT6HuyjvB+ifyR+MMX5CfEu0i4amc3qP/Hk0Qi
 cd5pXpQqRZhbmIPNSGt8cmefcgXAdXnjhR8ke5qv2EPEe8WJZmuZlvlIcsXijyOnNsyTcXx/wG8
 v9AuHD/foe4JaX0m9+/IBVs=
X-Forward-Email-ID: 69c2c6bd0febbe50599c0a27
X-Forward-Email-Sender: rfc822; jonas@kwiboo.xyz, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.55
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz>
Date: Tue, 24 Mar 2026 18:15:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
To: Heiko Stuebner <heiko@sntech.de>, MidG971 <midgy971@gmail.com>
Cc: linux-rockchip@lists.infradead.org, shawn.lin@rock-chips.com,
 jonas@kwiboo.se, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260320094441.128263-1-midgy971@gmail.com>
 <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.xyz>
In-Reply-To: <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heiko,

On 3/24/2026 6:04 PM, Heiko Stuebner wrote:
> 
> On Fri, 20 Mar 2026 10:44:41 +0100, MidG971 wrote:
>> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
>> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
>> This chip is currently modeled only as a fixed regulator
>> (vcc3v3_pi6c_03), with no clock output representation.
>>
>> The PI6C20100 is a clock generator, not a power supply. Model it
>> properly as a gated-fixed-clock, following the pattern established
>> for the Rock 5 ITX and other boards with similar PCIe clock buffer
>> chips.
>>
>> [...]
> 
> Applied, thanks!

My comments from v3 [1] was not addressed in v4 och v5. E.g.
regulator-always-on/boot-on not being removed and redundant comments.

[1] https://lore.kernel.org/all/fec0f25d-733a-4b6c-aef1-2ac51bd15798@kwiboo.se/

Regards,
Jonas

> 
> [1/1] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
>       commit: b61f3c69c87b5f061194f413d810723698534b02
> 
> As I somehow expected, that AI messed up ;-) .
> 
> In the 2nd part of the patch the reported number of lines
> in the header (the 15 there) does not match the number of lines
> in the diff itself (14). I've fixed that up to not have another
> round.
> 
> Best regards,

