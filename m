Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B83370AD5
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783880768; cv=none; b=p9mWLgzNdCMx4oV6aQCEAPtZrrbXKPbDPGvwzuK6psr1ytrO7oZ2M8jo0yBQMa/fngu/8dpUyyj85Dham4mcXsavamN5wIY3tlF+fqQbJKlsP2u5gmCS5zEIxNXwcPyuHtGgeGsEtZQGvNbox1QLIS9dzwNnolsW78/DT22YXvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783880768; c=relaxed/simple;
	bh=76bdYPgGEZ67vdNg65ErsTGRQP/zGsDenTv7vuK3atQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PctUhi1QftGvXrDVeogzGwh7T4ZWqaK2F4Gb0iI2JmjmlJ1asviweV3FtxmvncSEeMf2jL8SfiaueeXnwv1tfcku0QIEwbFBx/Y/Y0M/mKGnShGgg4Rj9bYyNb/KTP5GePMydTOYOTHqWZb2M9SAoTTTmRDDmpxYa0irwQbXCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Ze5aHuMK; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Ze5aHuMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783880763;
 bh=j/bPTGdNu/VCIF/C1HlSGIkuh1JalLVyfWkJt4YnQhM=;
 b=Ze5aHuMK/G7G0wZ0A0p7OMuWTowH1H0CU8/S7X6ri5xLbN516DRwC0lsxxN1A3wFykx/MEaqM
 Mqjrij6QFjAm0EmLBE4qyNk/rkzXl4n2ka4mg5tTNr8HxXIAiamabJvVYU7/EU1G+aEmpX40X2p
 Ro2+/DJRe3GRNLEmjEbgHmMhhr+6e6n4mJtLenXriXCqOYcXYq30nY5RKtF0o9amSWOE2FOOOkQ
 38ECxIMmw3hXhJ+vUpm+VTB4a+8tWLcAS9jNh6Nqe10FXaDDZzxTwxslTaYNVHB7Jzz5oWUwYEo
 4/dPlLcFo2+ZtrkaPcrL7cIQawId1ua4fVM6GEyiLaUw==
X-Forward-Email-ID: 6a53dc3854fefa5949cb32c4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <854bc3d0-2fb2-4e2b-ad08-0f5ee225d977@kwiboo.se>
Date: Sun, 12 Jul 2026 20:25:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <ce54c773-22cf-43d2-b831-1ea5355359ca@kwiboo.se>
 <CAPSPb=vyKK3ngm+d+nN7KM20ZyA10Hg5cb8EarRF6SE4hLOWFg@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPSPb=vyKK3ngm+d+nN7KM20ZyA10Hg5cb8EarRF6SE4hLOWFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joachim,

On 7/12/2026 8:00 PM, Joachim Eastwood wrote:
> Hi Jonas,
> 
> On Sat, 11 Jul 2026 at 01:36, Jonas Karlman <jonas@kwiboo.se> wrote:
>>
>> Hi Joachim,
>>
>> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
>>> This patch series add support for the NanoPi M6. This board is very
>>> similar to the NanoPi R6C and R6S boards which are already supported.
>>>
>>> Main differences:
>>> * M.2 M-key slot with PCIe (Also present on R6C)
>>> * M.2 E-key slot with PCIe and USB (from hub)
>>> * 1 additional USB 2.0 port from an on-board USB hub
>>> * RT5616 audio CODEC
>>>
>>> Patch 2 and 3 moves a bit code around. Please let me know if those two
>>> should be squashed together.
>>> Next few patches adds some missing bits the common nanopi dtsi file.
>>> While the final patch adds support for NanoPi M6. Support for M6 has
>>> been split into two files one dtsi and one dts file. This is to make
>>> it easier to add support to the new M6V2 board at a later stage.
>>
>> In my personal opinion I think it would make more sense to sort
>> patches in following order:
>> - adding/fixing missing bits to the common nanopi-r6 dtsi
>> - extract M6/R6 common parts from nanopi-r6 dtsi to nanopi dtsi,
>>   nanopi-r6 dtsi includes the nanopi dtsi and no changes to dts files
>> - final parts that adds the M6 board
>>
>> Should probably make it a little bit easier to cherry-pick and bisect.
> 
> If the additions/missing bits needs to backported I agree.

There are consumers of DTs outside of Linux, e.g. U-Boot, that may
need/want to cherry-pick patches/fixes, so such ordering should likely
help for such use-cases.

> I'll cook up a patch set with the order you suggest. Thanks for the feedback.

Sounds good, thanks!

Regards,
Jonas

> 
> 
> best regards,
> Joachim Eastwood

