Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428328;
	b=wAnqm0c43tc+wbc44rAOImWu6Ob16ecoetblrQ/Vx4wm7LRecIb0Jo7paAFBuuwRkLe+
	 Ms1HQF7TXd7lenlgBg9a0JK0FLmlMC0MQEyhBeABILa3XDc7A8BjlCkZlTpdGAzOSupZT
	 obYm46rddEgXRXx3SaNDfDHgjjfG8QWPx4SNyNlvpXe1+Ct6pBV5jpo8uo7lnMlCzKgAI
	 W86bFgTmVv0E4g1Q3Hv8LdfLOequnCkCKO0c0vVk8ufPFshR3AyFqdvtZq3KjbLzc+97I
	 eb73ri5V2+BvDsxPByL2C0d35Fjv5OHUSkdmBOUStP8nny1vM0SfLYc3gkD2An2SQKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428328;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dRuT4N91hHE9iRqRCs95W/ga15XeLCIhv2rAxfMU6cg=;
	b=mwnRcmCQo8DVjMI9uh6YjRr35LuTk9UnRf/WoUQkbZxleBCYCEAc9y50BGLJHsh8FxR8
	 j3k/EOWmtuqp5Nqd5ezySrruGaC0PvshQMawchh21f5fCdv8o4YGuGJeis32dPd+Veac0
	 GOH1td9CdpuqXQaLJhWLto7immMa046RRKjDo6AwY6GyEbGp7kD9dW/G1D55RiJulCCt7
	 /Ck0pfRx8DDb/6vUH0gxcP98Ds0zfKmznPkugt+EIrlKgFjgRQiChY79Oao6nb0M+cTpx
	 8vywgFEhPJJ1JKFE/1yjgoBVNArtxZY05QtjCiMDHgwuT82v6wRBh9xXr37YgJTf1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fy4TrY6T;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7CB606A31A;
	Mon, 23 Nov 2026 10:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fy4TrY6T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795428326;
	bh=a1/XioPUQOk/Y+CGy7Ob4OJm/x2Pd/UgMyEWsylmoiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fy4TrY6TmXh/ljo+lsHC4WaWEu3NPgVkyxOLpm54IQha82S/0hNWaowDfWqbOZ9Q9
	 7c5OKwrgrF9RTFGykd3PuoR0dW/b/oI2aG0DtAEUJF63bU9wpv52bLBXd3/rGicn0O
	 FQHJVomaKIwGtUsxz83Kjhy4HYSMH+R3eCWU7TnpgKtkjnjYILzWyPnwh+g7+mkM5L
	 G+/HPAoTC+Rq3S31aumUL7381kXn3vNC7FnA9A4cbjMc1Ie9KfUdRLwedlyG5Ur1KD
	 xGqgkRIL3FlM+yXwz62bKtI566fz7CR5vWDQ1/VMFNvXud8H7pzlF/u5yTK7b5NPyV
	 J29BH1iSf8yFQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9C5517E007F;
	Mon, 23 Nov 2026 11:05:25 +0100 (CET)
Message-ID: <33cf13e4-6df0-45f8-b621-ffe3f43419c9@collabora.com>
Date: Mon, 23 Nov 2026 11:05:25 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/46] dt-bindings: display: mediatek: Introduce
 Digital Video Output HW
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 =?UTF-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-28-angelogioacchino.delregno@collabora.com>
 <98cde7319f539cab9f72ec370d309b26569889c9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <98cde7319f539cab9f72ec370d309b26569889c9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 03:17, CK Hu (胡俊光) wrote:
> On Tue, 2026-07-14 at 13:43 +0200, AngeloGioacchino Del Regno wrote:
>> Add documentation for the Digital Video Output (DVO) IP found in
>> the newer generation SoCs MT8196, MT8189 and their variants.
>>
>> This is effectively a more capable block replacing the DisplayPort
>> Interface (DPI/DP_INTF) one found in older SoCs.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../display/mediatek/mediatek,mt8196-dvo.yaml | 143 ++++++++++++++++++
>>   1 file changed, 143 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
>> new file mode 100644
>> index 000000000000..b38960327ca1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
> 
> This file would include multiple SoC dvo, so it's better to use mediatek,dvo.yaml.

Devicetree bindings maintainers will disagree with this statement ;-)

> 
>> @@ -0,0 +1,143 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-dvo.yaml*__;Iw!!CTRNKA9wMg0ARbw!n3pk94kKoN-7zfem5SHfJn_ixDmAleFOW2dJwmZ8W5gJz-iEQGAN6yOkpupaMXAvAlr3KfAndB5Fjy57tNXsxA_uvNy3$
>> +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!n3pk94kKoN-7zfem5SHfJn_ixDmAleFOW2dJwmZ8W5gJz-iEQGAN6yOkpupaMXAvAlr3KfAndB5Fjy57tNXsxNztWOiH$
>> +
>> +title: MediaTek Digital Video Output (DVO) Controller
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek Digital Video Output (DVO) hardware provides 120-bits (4P) data,
>> +  video timing and info data for the Embedded DisplayPort, hardware-abstracting
> 
>  From the compatible listed below, DVO not only for eDP, but also DP, right?
> 

Yeah, on MT8189 it's also for DP.

>> +  the previous generation Display Port Interface (DPI/DP_INTF) blocks, other
>> +  than providing new capabilities.
> 
> No new capability? But what you list below is new capability or the same as DPI/DP_INTF?
> 

The new capabilities include PSR and MSO, other than the 4T1R in output (as DP_INTF
did support that but only for very specific configurations).

>> +  This hardware block supports 1/2/4 pixels per iteration in both its input and
>> +  output and provides 8/10-bit RGB, YUV422 and YUV444 data formats in output,
>> +  other than supporting input/output video window cropping and padding.
>> +  Digital Video Output also provides Panel Self Refresh (PSR) and Multi-SST
>> +  Operation (MSO) features for eDP 1.3/1.4.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt8189-dp-dvo
>> +      - mediatek,mt8189-edp-dvo
> 
> This series is so large, so it's better to drop any thing that is not related to mt8196 and you could add them back later.

Are you sure you want me to drop that?

It's just 10 lines of code and some platform data really, I don't think it's all
that much to justify dropping it?

Cheers,
Angelo

> 
> Regards,
> CK
> 
>> +      - mediatek,mt8196-edp-dvo
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>>
> 
