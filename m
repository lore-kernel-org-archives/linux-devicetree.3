Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651903;
	b=fy/+chBP5VJ4MnYhbZlWbM4jKWtsbIGuYYlZ/5pp1iY34GVRDu8UZfDlAErsw0FEE7Ek
	 ov//zFRNUyXS99wTlonFWU3EwKtGeBXnXyczOAXUuADfTDKbj/5dD/dXdEYZUhFydYG/n
	 v3Uz9yP8srGtRkFuNN2B2D8hKi3/O50/Kk32P3n731QsnP1wUvCVbx9rJv4i+QJJVvgzv
	 bQzRV0rFoOvRupDgOweSoczxh9p8SRz4Sy+03KVrWPnyEjn/G83V9xTILa8RNBB5xU9xY
	 Bgl0uZZ/+IXMwIrY7VlbFkDkAXmWSlVaW3IsrVw+nzhOqS6yxGDAHVIdafrLYTna5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
	b=5Uq30DFgeKIxqlcx8X7T969vVk7f9hZqlmgPY5Qu9zDUiD7LXoarbYlg2gxzJ1xPd5b6
	 qDcVeE4K8F9LTEbMd/VUfCFnmaRJhueglalgyGYSg5YlFdjphlY85Xp0l0PspZoYuKxSA
	 bLuyBk1NcFhCMJ56nTT3+tKzvmUBP1g7hctJ3L196thFlGsdtrZhhyjgael4oxYmvOCbI
	 3tLFfUNYUpoeSP6wSnpLX18Mqw5qZ4kXToHKY96gEKDf+gMI3Ke6egpghwtzkfsOK2hXZ
	 nSFrWpCxfiCZnALsuxZ6pjy1tcAfvHZ4cqrqM5hH1IJzvFTETBYKQeDzN8E8UraX0hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR0lW1VF;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86069606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86069606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR0lW1VF
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c162febb9so41371206d6.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793651901; x=1794256701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
        b=RR0lW1VFKizrAZ287W1z5EGkksIw6Qk9fnOOVuPipp5gYg8D3KBYAQBS5R6sPJVLfa
         mk05b5NHBPOkX4xozdkvRe87h06j0eFQpgzL9HakSjRx5wirQ1OUegry5AIGBeoEPUCU
         QqJ511y3CgLuCw4oljTBoj2B1SI/+xBpKBJ2/imJH2RN01EwAmRhaEa0uj7e03J4ZFVR
         34FeNhTm6dgLfIZFYhsyRSgCLDs/PmMghZjDz+QBl3dL2gdbQkaxtPSpWrgW0X4Tmhar
         /Ejwnjxii8kgC/nO4JvSbqgUWn30yhJUmSJfhOcMfqt6pvP28OKSNI4ebkNyFzRgXih8
         W2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651901; x=1794256701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
        b=J9L1IU3NCsy1prZvXt8w9KNXX5KRYtoOuxUE2KgAJ7Dmq9vaQSxboBG4vrBY6D22nq
         us5B4U/lBCYT4J3Iu8jKX+lt8bXEU6szUZGJfnRSgigC5O7Q/z7s46COnSU/PjdmwoK4
         TiPGkgYJUTRKeeIVdVDTmN5MjB3/QzSiFu1OkQwsk5xQSBAWIjDiuakBv7JE6+wBzeni
         5j8amj/yK8gZXPYSOvslj3WUuaweOer7x2EL9RtHT1Zpfsl+EUnpDOgWVUFZa50C/bXl
         FJENgihR5j/cWsCXkaRUsuXCp4RMVHqHTkxiGvwyG2hXsYYC6v01p6cHvk/KwRLJSt4g
         nyHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWFGVQlHAewetBbhQ1kr/AGycHCz/GHNZzRisYTX6OpRDwgmzugCikb6ph5ufiUL/LSvE/mOBxoNK3@vger.kernel.org
X-Gm-Message-State: APuU4Z+gLXo4zWoYtxHxLWsvAw3H+s5iQYWLMnGr/MTx+K1eeISAlVKx
	i9hEaxciAwLgNeoGBPPJIOWvIhIvQ1jzOWcIwJr0jAruyrAQ3AhPYuug
X-Gm-Gg: AYBFou2gDfsFhLa86VCbgdLJN0bTq2NOGHp6vvvw/C0oG4zWfS0yMzMZKHgjSHqygWj
	pJPmZJNkerqGzgOGUsCv8HNRaVqL2OTh+13jvDaZ5ATsEVod9QGRyACXLOL8veK/xOs2ZpOt/cV
	/1Ao1WATvMQl0iZdwGf4cmfn5kGLXS5YM2RbfoPKVOC6OJo5RJWG0sO8r3ohff8zI36Bc41Ts3h
	q5te8OxqU0iPOVikOHx6hZCFwn08sbqwEBfjVIzJ/ZhFpDbENkQSsrwFZo6oaf6zcCVzdYxl1ao
	p8llPjOCeVrIfkq+87ThIyEsPZxXzr0IhZZy/uvTVm2DC/Rbv+Zch3yFSlwZUYKbG9rhOz3T9Ni
	P4OP5k8mz2QQ0dGZfgnD1Sek7Nr18G+sbJqmmAZOtkWIQmIvdqBHbM+JhrIavuDelShw2SWRAcB
	z+LPn7+GJcL9OFVKO4H25DwUVul/q8vRrbvYMHYstRvRAW/zjT1npNy2/nswPQesi5T2L9begoT
	XYI8uujQvXoltISxVaAACFf5qe1gZzMtvpkd6UntINyM/b7w0erb61RCvSGtsWe6yo89XLU8c+s
	YF2/bMApxo30hJdUc0FfV4Uk1oIovNxLFl46jidbg33O77yMEwB2qt4=
X-Received: by 2002:a05:6214:21e5:b0:91b:5d3a:f136 with SMTP id 6a1803df08f44-91ca4b8303emr172551426d6.53.1793651901295;
        Mon, 02 Nov 2026 12:38:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f26f1esm100674086d6.13.2026.11.02.12.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:38:20 -0800 (PST)
Message-ID: <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
Date: Mon, 2 Nov 2026 12:38:15 -0800
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
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and
 BCM2712
To: Peter Robinson <pbrobinson@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
 <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 12:18, Peter Robinson wrote:
> On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
>>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
>>> described by a separate node covering channels 11-14, and for the
>>> BCM2712 DMA controllers. The register address of a node identifies its
>>> first channel, allowing a controller to be split across nodes.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>
>>> ---
>>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
>>>   1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> index c9b9a5490826c..31d97a10a0ea9 100644
>>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
>>>   maintainers:
>>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
>>>
>>> -description:
>>> +description: |
>>>     The BCM2835 DMA controller has 16 channels in total. Only the lower
>>>     13 channels have an associated IRQ. Some arbitrary channels are used by the
>>>     VideoCore firmware (1,3,6,7 in the current firmware version). The channels
>>>     0, 2 and 3 have special functionality and should not be used by the driver.
>>>
>>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
>>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
>>> +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
>>> +  split across several nodes, the register address identifies the first
>>> +  channel of a node.
>>
>> Uh no, a device should not be split across different nodes. This should
>> not be needed, why can't your driver handle the upper channels having
>> different capabilities?
> 
> This is the way it's done in the downstream kernel, unfortunately
> Broadcom doesn't publish the HW details so either they'd need to
> contribute the support (which they've not done since the RPi4 was
> available) or I'm not sure what the other options would be. Open to
> suggestions.

Neither here nor there, IMHO, yes it would be nice if documentation was 
published (and a customer like Raspberry Pi is probably one of the few 
that can get the needle to move there).

You have the bcm2711 and bcm2712 compatible strings which should be 
enough for you to know which channels are 40-bit capable and which are 
not, yet keep the same Device Tree node.
-- 
Florian
