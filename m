Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1D939D6D0;
	Mon, 20 Apr 2026 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776683436; cv=none; b=UJ2V1xTFDt8BBwOfZDT1uOYXwFq+t3We/tqbqseKbYPwmNgvSbF6Q1JZiHDsCXz0FJ0LV8o2zAKg3tYhsjqJAkZJc4m8TxgrV1vJUqfUhcp4cCIYbBsLpfKP9uIGhdWe4nhmSLnmJRLqxotDP7gz46eLk0tFZth7DDmvxwzfdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776683436; c=relaxed/simple;
	bh=Z8VXFLlJoWE07bJb3Qbu/RqEB+C1PaoPjkKJ6JTdIvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOyKrxYcOIH6DXfkKa0yxDMqvKqe2koaQUN3PyUVrkZqf7QWAPcJCvD9OONrlIXqho37IiT4XJNZSg6J6pxxhX/BfUX97WhSmvkS5x2bKEFvGSZmpLMWmEVVZ53oKOvuPEhNL0BpeyASuxS2oTj+ywcpN8MUS8y/JB2uOqd4IkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bHtv37oh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bHtv37oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776683428;
	bh=Z8VXFLlJoWE07bJb3Qbu/RqEB+C1PaoPjkKJ6JTdIvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHtv37ohJyNm91PWYAMTHaClPZy0Qbjyc490uOLIh7JS8wl3Yc6BxKPNc0krtv8qZ
	 Zk9qpjPqQR0TnN/DqiuN3J+Xmc4i3TOn+1ncLIbOWgHdHtSI2LXu8pBwrzrhCFeLYr
	 J2m5jpvmkc1+2AfOITp4QpNIFxAJ4auOSV7eygJ5XDeVU7aN4SeLq2oZBU8h8KzsWM
	 ArngXbRl2wX523SOe/Zl/8e2SY9CK6farGUHT2ufeQLQKthCp2u+VM4UEcq5J/ho8I
	 P+zGZ6zwYm2CEi6csbsynPhj1DiOIuLioC5tFDS6YTZT2XYjjlYqi9z1adIDZhZoEi
	 OsN4R+x0R1RJg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01A9C17E0595;
	Mon, 20 Apr 2026 13:10:27 +0200 (CEST)
Message-ID: <66f9574c-8dff-4de2-bf54-20f1c1e64c24@collabora.com>
Date: Mon, 20 Apr 2026 14:10:27 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2297365.1BCLMh4Saa@phil>
 <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
 <2435759.n0HT0TaD9V@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2435759.n0HT0TaD9V@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/18/26 2:18 AM, Heiko Stuebner wrote:
> Hi Cristan,
> 
> Am Freitag, 17. April 2026, 19:55:17 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> On 4/17/26 2:34 PM, Heiko Stuebner wrote:
>>> Am Freitag, 17. April 2026, 11:24:34 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>
>>> [...]
>>>
>>>> Cristian Ciocaltea (40):
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dshanpi-a1
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
>>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
>>>
>>> I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
>>> sense, because these patches really are mostly identical :-)
>>
>> Yeah, apologies for the large number of patches, I went this way to allow
>> per-board reviews.  As previously noted, I tried to identify the GPIO pins from
>> multiple sources, so I'm not entirely sure about the accuracy in every case.
>>
>> Would it be preferable to squash the patches per SoC and board vendor, instead?
> 
> I really would just do it per soc .. so 3 patches. That is a size that is
> still reviewable for people, who can then check for their board.
> 
> If the patch is labeled "Add frl-enable-gpios for all RK3588s boards", I
> do expect people to notice it the same as "oh _my_ board gets changed".
> ("all" could also be "most" :-) ).

Ack.  

I would still keep the more invasive changes — such as those touching
the regulator hacks — in separate patches, though.

Thanks,
Cristian
