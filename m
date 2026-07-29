Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D2C3AC0FF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360444; cv=none; b=dhsieQ57wDb00QNoNVDf5np+jrG+aq086JqrChminmAkc57F+EtKxuCik0tumluk4bdxy8n1Da3Gpqw1WhEsmf7ndEiVMb5rUnwS7lyWRErkWAC7dg7YUl25NOQFP1W8joXqEgSxnm8A35MrzYrAiPHw1u+UaN7H1x5uCA3v3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360444; c=relaxed/simple;
	bh=//SXKt9w9Gcbogu6OSXQ+LBVA60p0Og6LHU7IHE9c8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJUIIRfbSowpnwLrCWISO66D1s+K+OsUNZQDPzy/6GJ5A0USRqhC/WntmCu94N2J3Idn1q7yqprEjbRz5zrvCA7XBVrpV5CvjHBvqF/wqJ6ij/IBKxvHROeUklznlxSQN6GkHmqXi1VKPBtC45xINrpqrf8kptTUWRmLB8JZI2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=R5PrIS8U; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="R5PrIS8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1785360411;
	bh=qIeB7odIPYqV8wTIrHOpI6P/vGVIYxJtiGk+dolwf/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R5PrIS8UrT3OoxRFc88eOYa3p0BWuImXPSWlI7GxpU2i0ZaYtD7Ki+HzqTgssZKPm
	 grbRgQIixF21CyT8fN0C+kiUIGWwTQquolHJWW7Sg42yF2Z3PDvt7Af6cNh7+kjD3l
	 CvFyfYPeWfHlPgaMdIHpTNOiuEA9O1vCMMETCH9PIqnKAqlE6SsfA4z4Onn++ssPOw
	 Yk3IvO3d5QSLcyl37AXaStjHaFRPbdFZj+XWSBvy022z6f5H9mHTLlo9QN8lAF8rAG
	 wg6jYEw1ZTuDv2xdy9w0+F1DNCMUYiEMCjGXaGfkvGnaR1R8jKDbqyXUB5flb4sf5S
	 CjbDkf6Ddv4tw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 0BC81B220608;
	Wed, 29 Jul 2026 23:26:49 +0200 (CEST)
Message-ID: <d09431e5-37c0-4b92-ac93-d6f01a053b96@freeshell.de>
Date: Wed, 29 Jul 2026 14:26:47 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Conor Dooley <mail@conchuod.ie>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 Ilya Sorochan <k0tran@altlinux.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
 <bb94e760-c7c3-43be-a221-5a45f8ec2db2@canonical.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <bb94e760-c7c3-43be-a221-5a45f8ec2db2@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/29/26 04:21, Heinrich Schuchardt wrote:
> On 7/29/26 11:39, E Shattow wrote:
>>
>>
>> On 7/28/26 11:02, Conor Dooley wrote:
>>> From: Conor Dooley <mail@conchuod.ie>
>>>
>>> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>>>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>>>
>>>> U-Boot pruned their overrides recently in favor of Linux which broke
>>>> booting
>>>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>>>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-
>>>> common overrides")
>>>>
>>>> [1]  https://lore.kernel.org/all/
>>>> ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>>>
>>>> [...]
>>>
>>> Right, I am going to try this again. I don't think there's actually a
>>> valid technical argument against it, since it just affects the stage at
>>> which configuration is applied rather than configuration itself.
>>> If the configuration is wrong, and more devices don't use this
>>> configuration
>>> than do, people need to move the node to where they think should be.
>>> That
>>> shall be done separately.
>>>
>>> I don't want to hear about the politics about whether or not Starfive
>>> want
>>> to support it or reverse engineering of binaries etc. All that I care
>>> about
>>> is discussion of the hardware itself and which boards need this and
>>> which do
>>> not.
>>>
>>> Applied to riscv-dt-fixes, thanks!
>>>
>>> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from
>>> SD-card.
>>>        https://git.kernel.org/conor/c/42c57c049054
>>>
>>> Thanks,
>>> Conor.
>>
>> Second NAK to this being applied, again, do not apply as-is.
>>
>> As you're not interested in the technical discussion, then you won't
>> have one.
>>
>> -E
> 
> As E does not offer any reason for their NAK, I guess it can be safely
> ignored as invalid.
> 
> Best regards
> 
> Heinrich
> 
> 

Reason has not changed in 4+ months since the last attempt to shove this
patch through without technical merit. Please participate instead of
being like however this is toward me, I would greatly value your
analysis if you would just attempt to do so as Hal and myself have done.
It is unfortunate I find discrepancies in Hal's description that plainly
does not match what I find in the actual hardware. We should do some of
the work here not relying on Hal, and especially not relying on myself
(I'm not a career programmer obviously). Will you find time to
participate in review of the StarFive loader code and features that are
purported to be so desired for U-Boot compatibility?

https://web.archive.org/web/20260501210605/https://freeshell.de/e/riscv64/hrv-jhre-JH-7110%20BootROM%20analysis_2026_02_22.gar

-E
