Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416236494E;
	Fri, 17 Apr 2026 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448523; cv=none; b=JuqykQf5J+gmH58CNwZP6SEl5OIr/t7nQFG4eER4PdZPseD0j3PD4wnlANCa4oyr4gdOM3p7OPn3RiOkwubXyhEWjWEhSSZelfpEvkJJBy8ba0/s7ZYlIIHAYYrmOs+kot413mfiU/TxiX3j6pC3nZVLKRioa0JG1O37c/br1O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448523; c=relaxed/simple;
	bh=Q/GzuWIQEHuvkg9yZh9vcQC8AxPXoccLErnZodAciHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJL5iVp5aIUHV7gAnlHjNopKpilNTR91r3tHRj+djVazs345uNUBfGSZ6h6j0JX3Uy2F5HIrWg5QlAVdh3VXqC0nUsTIKHOo3PZWN4qdn/HIgVL0ld/NWol1A+El83amOUnj5tVe1hHNMBsiZBiMJLZaL/I6bmuAyAJ2HXaXQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ud7SICim; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ud7SICim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776448518;
	bh=Q/GzuWIQEHuvkg9yZh9vcQC8AxPXoccLErnZodAciHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ud7SICimNN1HnVxsVZ3WfMCv8BI5OB7UvQ9beJebQtQmpu+coTXWZz8u7N0GISF5O
	 Oxdrr9Eczp15S4lJpmFXUQU2OZ15f43hE3z/CvimwKyeySfmkLQAlYYlUvKC0RUUes
	 mu7PLc6arQL9Um1iQErLyMZke9U2PRElA9D9fddK792XireuYepTaVW+5EyUfTM7tf
	 2PYtNFlkW6fwEIOUWFstvW2mXmVXhfWZ4VYzPKTlGAYavKcM8RMrcNU0rruRYJT1X7
	 yjc5xpzNKjI5rGsHXqSnYgMXQ13OjkCSv/BDX096cBXQHqEizTRnGJ/zALBlESGop1
	 X6cTELVcasb0Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67BBC17E131F;
	Fri, 17 Apr 2026 19:55:18 +0200 (CEST)
Message-ID: <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
Date: Fri, 17 Apr 2026 20:55:17 +0300
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2297365.1BCLMh4Saa@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heiko,

On 4/17/26 2:34 PM, Heiko Stuebner wrote:
> Hi Cristan,
> 
> Am Freitag, 17. April 2026, 11:24:34 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
> 
> [...]
> 
>> Cristian Ciocaltea (40):
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dshanpi-a1
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
> 
> I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
> sense, because these patches really are mostly identical :-)

Yeah, apologies for the large number of patches, I went this way to allow
per-board reviews.  As previously noted, I tried to identify the GPIO pins from
multiple sources, so I'm not entirely sure about the accuracy in every case.

Would it be preferable to squash the patches per SoC and board vendor, instead?

Thanks,
Cristian
