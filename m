Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DED24113D
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783880040; cv=none; b=TQPf6yfStSvAcpQy46dXyK9D4YLyafcAlfiaJ7E1f6XzUhi1idAcrl9IAcTfyMD3NGuqNCWmETSRFpbhk/wVr4NOaO/8MHjt6NwuH7AHTotu8Kk+ZEnDwYg5Szmv8pAk5hAOobkx1Kx2JdXKmSTUZgsOjPIMC1rGWnXN/hKoBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783880040; c=relaxed/simple;
	bh=JFRblMxc+VM6wKttIp1LDRNJ0UCQ+2qzyrzL7OjKBXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQOKxC49Nw3HOOTXyUjBQTG6nRQWEUL7me+Arq2oan45l7/uGPJsV0ZaFdZc8qXI/LWa0IYWxxVpCHCPqqEFlY+LAsQMozA8vL825sUOGl+zgk1tGy0JHEcKsxXYhHWGk6Ft8w+Zttn/0q6oxtzLqSdzZkTWvQ6sPt8CCivywhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=q1X+W1QB; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="q1X+W1QB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783880038;
 bh=JvjkR40XVIjKCU8fvk6ZQ5E+1Jm3hNpLQMJ9KPp2Fqg=;
 b=q1X+W1QBEVz2gRqliAu/2nnsdnQjeO4dXIuJGZm+zFuRVnRPSn5A/Hced0Xv6ug+6VgaqeMen
 lYxP8QdFIniqnfSb+Cyy8acDHEJczQhIKrwvrFx3E2HIdaeFfh8SD3jgeblScZFM7lvtF+ZEUGo
 3uQEnfHbrEPTH7bc7IctkG25KE0TJ56eFw/7OU4IsC/ZiJdmGSoBI9IxN7lazynO+Pyk9q/egRZ
 T1nAq3UlsJnLamf+yHDzuApX7IDuv7fB0LfFvEPidJO3hHag61fYFAgxK+12VipUL6P1NolPPJF
 KN1r9jnNkVZyznmpKyycCSZFK5ECeEPGfAHN+K9TX4lQ==
X-Forward-Email-ID: 6a53d960d1fe0afac937d1ac
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7c114e4b-b2a0-4246-b2da-5f671984a1c0@kwiboo.se>
Date: Sun, 12 Jul 2026 20:13:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add
 missing sdmmc cd pinctrl
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
 <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
 <CAPSPb=t33bHfuEAMLWPM5=2fSyJXv5vjYD=_pSNRq6GcUz-X_w@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPSPb=t33bHfuEAMLWPM5=2fSyJXv5vjYD=_pSNRq6GcUz-X_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joachim,

On 7/12/2026 7:59 PM, Joachim Eastwood wrote:
> Hi Jonas,
> 
> On Sat, 11 Jul 2026 at 01:18, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>>
>> Hi Joachim,
>>
>> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
>>> From: Joachim Eastwood <joachim.eastwood@gmail.com>
>>>
>>> The cd (card detect) pin is used, but not reserved through pinctrl.
>>
>> Maybe this and some/most of the other DT changes that fixes some missing
>> bits should put first in this series and with Fixes tags?
> 
> I can of course put them first in the series. So we have the option to do so.
> 
> But what is the policy regarding "fixes"?
> I don't think they fix any critical issues, but they do make the DT
> more correct.
> So do we want to backport these to stable?
> 
> Maybe the following changes qualify:
> arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
> arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
> arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
> 
> But I don't any others should be considered fixes.

At least the pcie and sdmmc "fixes" is likely something we may want to
pick to U-Boot dts/upstream as soon as they are available in the
devicetree-rebasing tree.

Regards,
Jonas

> 
> 
> best regards,
> Joachim Eastwood

