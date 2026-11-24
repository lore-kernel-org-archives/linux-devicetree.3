Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519827;
	b=16ig3r6oFEHd3X502/2bzqZscv/Ew4zMG/vv6wFy8iSk8bIXg3Tn1y3nJw7JGI4vgMc2
	 JabMDFdtGTkPZaVIKZ5HxLP3fqBkdCVMSzs6HmJplhytgWGyaqE7jm7uu5TFMVyW7llee
	 K3rzB5lMNdntByXPs3IwEbPHxPvz7twoywO63bgmAJ98tREK4qq9Tw8PGXYOqn36aUc8F
	 aU3uST3WIokrAxl5RxwjUw0w0+Wp7wA5pGMyAHbFooFp+RQlbrKNBVqxWCkIUTcy8zV+G
	 /H6TJsQM4Iu13e4aWXupOqPj/NNqT54F+xopCqW+ZxJfnSim/ElzZvx5PhSfYxq6vKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519827;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=x4iAMBhsUqAiaUCQj/SSCDJ/lo5qATWvSvv8yn5M/Yc=;
	b=lnbPs2ss+SjpP3ySoUNqzW3Vz+o25ylnzKeQOo2tmpgqrZs0MZeP8dnXXPPCRKa0xVAr
	 RwRjDAp52tw9I/kKCd+5mJPI9sR35soL3Ls/94UjOtt7yOhsscPM+BHTBWby0vJoTwxjQ
	 9Z2zGMuK+5TMjE1ls0phGUoeqI7MwhvSgP5WFkb3N8wYPmi/q3uqUsdOpYHutsysHXeaB
	 3rWcbeDAsG0cduNahnrZtD+Vo0zl+eCgGrvIAAFnWsikmtUPeX2wTXDDN+GovHj2Y3lYY
	 dX99yrtcfbTpiwkd01oVovDpuk6HFm4qBAHXgaWT+0LCDP4DQf1OM4qZAZ0maJGcZFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vwsy8IRY;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF235606A321;
	Tue, 24 Nov 2026 11:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF235606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Vwsy8IRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795519824;
	bh=8tQgckJyHzwBcIyuNBAxi4U/A6ePfJobteegYPxxY6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vwsy8IRY0BgH0NLhGJzFsARXKAW/OZOSc2UR1I7YTb39swVau6FG+iFAWiXFsFCAT
	 glS/+s6UF8gppkUh99mztcjrzEsLgKVAVfdySOuW8ynKaq8RCV3HqOG2xMYAZ/US5Y
	 S8kpIAhpIu8vHFk5CmzUBWITG2lPOqCx4m/STzuG1+NTmrBt6b156TN7cPjjtpFqE4
	 HU9BYdeIUSXcq+GWlgvGWa3J98ZoNvAO7XvTrTtbUW5uD0AOjkhBo1XtA3lGqTmdUs
	 x6F3HtXcT9ruEk+tCVjGlOailmTqMtzSQl37XAPy9FC69uTSSvo6kbJPlyLmxtD32d
	 aWLnBUx5/y4VA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 850F217E010E;
	Tue, 24 Nov 2026 12:30:23 +0100 (CET)
Message-ID: <dd19d7e8-456c-48f1-baf0-3494081e23ad@collabora.com>
Date: Tue, 24 Nov 2026 12:30:23 +0100
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
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 =?UTF-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-28-angelogioacchino.delregno@collabora.com>
 <98cde7319f539cab9f72ec370d309b26569889c9.camel@mediatek.com>
 <33cf13e4-6df0-45f8-b621-ffe3f43419c9@collabora.com>
 <3ab396c26424834e9fa591a86ba7ff8f5561f847.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3ab396c26424834e9fa591a86ba7ff8f5561f847.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 07:13, CK Hu (胡俊光) wrote:
> On Mon, 2026-11-23 at 11:05 +0100, AngeloGioacchino Del Regno wrote:
>> On 11/20/26 03:17, CK Hu (胡俊光) wrote:
>>> On Tue, 2026-07-14 at 13:43 +0200, AngeloGioacchino Del Regno wrote:
>>>> Add documentation for the Digital Video Output (DVO) IP found in
>>>> the newer generation SoCs MT8196, MT8189 and their variants.
>>>>
>>>> This is effectively a more capable block replacing the DisplayPort
>>>> Interface (DPI/DP_INTF) one found in older SoCs.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../display/mediatek/mediatek,mt8196-dvo.yaml | 143 ++++++++++++++++++
>>>>    1 file changed, 143 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
>>>> new file mode 100644
>>>> index 000000000000..b38960327ca1
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
>>>
>>> This file would include multiple SoC dvo, so it's better to use mediatek,dvo.yaml.
>>
>> Devicetree bindings maintainers will disagree with this statement ;-)
> 
> Oh, it seems many mediatek display binding document should change file name.
> 

Yeah, but changing file names should be an ABI breakage (is it?), so we just avoid
adding more "wrong" files :-)

>>
>>>
>>>> @@ -0,0 +1,143 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-dvo.yaml*__;Iw!!CTRNKA9wMg0ARbw!n3pk94kKoN-7zfem5SHfJn_ixDmAleFOW2dJwmZ8W5gJz-iEQGAN6yOkpupaMXAvAlr3KfAndB5Fjy57tNXsxA_uvNy3$
>>>> +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!n3pk94kKoN-7zfem5SHfJn_ixDmAleFOW2dJwmZ8W5gJz-iEQGAN6yOkpupaMXAvAlr3KfAndB5Fjy57tNXsxNztWOiH$
>>>> +
>>>> +title: MediaTek Digital Video Output (DVO) Controller
>>>> +
>>>> +maintainers:
>>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> +
>>>> +description:
>>>> +  The MediaTek Digital Video Output (DVO) hardware provides 120-bits (4P) data,
>>>> +  video timing and info data for the Embedded DisplayPort, hardware-abstracting
>>>
>>>   From the compatible listed below, DVO not only for eDP, but also DP, right?
>>>
>>
>> Yeah, on MT8189 it's also for DP.
> 
> So the description should be:
> 
> The MediaTek Digital Video Output (DVO) hardware provides 120-bits (4P) data,
> video timing and info data for the (Embedded) DisplayPort
> 
>>
>>>> +  the previous generation Display Port Interface (DPI/DP_INTF) blocks, other
>>>> +  than providing new capabilities.
>>>
>>> No new capability? But what you list below is new capability or the same as DPI/DP_INTF?
>>>
>>
>> The new capabilities include PSR and MSO, other than the 4T1R in output (as DP_INTF
>> did support that but only for very specific configurations).
> 
> My English is not good. I just thought 'other than' means 'not'.
> 

Haha, no worries!!

>>
>>>> +  This hardware block supports 1/2/4 pixels per iteration in both its input and
>>>> +  output and provides 8/10-bit RGB, YUV422 and YUV444 data formats in output,
>>>> +  other than supporting input/output video window cropping and padding.
>>>> +  Digital Video Output also provides Panel Self Refresh (PSR) and Multi-SST
>>>> +  Operation (MSO) features for eDP 1.3/1.4.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,mt8189-dp-dvo
>>>> +      - mediatek,mt8189-edp-dvo
>>>
>>> This series is so large, so it's better to drop any thing that is not related to mt8196 and you could add them back later.
>>
>> Are you sure you want me to drop that?
>>
>> It's just 10 lines of code and some platform data really, I don't think it's all
>> that much to justify dropping it?
> 
> If you keep mt8189 compatible here, you should describe what's the difference of these compatible.
> Maybe every reviewer see this would ask you again because this series is for mt8196.
> Remove them is much easier. If you keep them, introduce them.

I understand what you're trying to do here, thank you.

Adding a simple phrase in the commit description for this binding saying what is
the difference between 8196 and 8189 shouldn't be a big deal though...

Removing the MT8189 code takes more time compared to just adding a phrase here! :-)

Cheers,
Angelo

> 
> Regards,
> CK
> 
>>
>> Cheers,
>> Angelo
>>
>>>
>>> Regards,
>>> CK
>>>
>>>> +      - mediatek,mt8196-edp-dvo
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>>
>>>
> 
