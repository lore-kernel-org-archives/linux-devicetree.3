Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000257;
	b=0i59u1C9f6Uhoy1zUCY8+AXpLml7MRzjECbafXLM05ETjqt41Ntk6SdHO2EH361YRiDu
	 EkLjkFTEb3N3FdxKf69GN57Dau+Vk5tTa75YPYz1nOQ2wCr7ZDv8qMaqICjPbspfBjtId
	 oRvVQi+X2O1nYOkMkNFOL/bbaf/bqlyqbZBgMNgAYJoplBIf3LduA0nTwhKP3R17HV7oV
	 jQs03VPgOPZ3K7KpfyqWZtpcgiIwPCaNFLVMmr+wA+ATe5XBcBBtambjpOBI7MvImdohx
	 BYy5MBmpSoTYADz6UYglC0DaiCJWSvs6an/J3EvqouIXAK8ciEL4B6Wn48s/hz+r8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000257;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8bqfpbBHkizT5LV4unUjsrB2ytVrIgjNmcwUFqqZaG0=;
	b=BHuxyUXs7O8nM+4LDwuAlC/r+JBKYfoiOkBInJ6/IU++W/82sB8MXfTNYFvvpq5zjRGr
	 FWdi5pzI0RHC6CGX6dpzvFOY4gHuTnZGD2LWiAfzPCLPPL4pNav9dFR0ZTKMq7dLjVeT6
	 Unk06SO+shX7NdppVBt53F43vct5LfKvb4PLv5ElFBTklrgj0GlSr+Ozic+nbXzmJRaeg
	 yM+RiChA8X86jLmd0avUKxjuOwcgoNcg04YsNjgz6W+WahXPaUx3ay/NlqRu3sCMKoIS5
	 uI5TW2MXX/TjAoEzx36zC8ACvmdKWHPW8C8+GsbLE/50DeWKtvXOjpYanaLssqjNoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UkM6G1KM;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C6606A31C;
	Wed, 18 Nov 2026 11:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UkM6G1KM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795000249;
	bh=C6+HY4ClMrV2fwaShVwciggPOYGg14zJs95/gfFRXeU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UkM6G1KMQCte1V3ulm2JnI7GWk61W6NCccHcxfvacoXdy3DBDgySwYYbXTgr1zAaO
	 zQlhQ9XDFEHqknUNHUYQnocaHdLxWhmbM2qbfODwMKxNAlwP3CkwyGEn0aeY0MbQi4
	 Z5NCIhWhIVRjQwGc8L/dt8WtbK2KDO2K/PN85ZGkPJBMq1f2EC4w/3KOXbk+ZUJtA5
	 yoRuv0KYgMqnL0l1gnuVZdtfUhwx2Fz8wiei9ocHrTDnXIaP/TOR93AHvukBQhSBS+
	 4XuCsItFKgZ3deLFJ/TxSB3HjMqn/CAVfXhCxpWdW+6MBkjXWRZJWeu4WFFVn/tMEv
	 8DjZLR3oQgqPw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46C7617E07EC;
	Wed, 18 Nov 2026 12:10:48 +0100 (CET)
Message-ID: <779efc61-646d-4735-b54d-7bc7436385bd@collabora.com>
Date: Wed, 18 Nov 2026 12:10:47 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8167: Add DRM nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-5-l.scorcia@gmail.com>
 <bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org>
 <200ef6c1-eced-4c36-832d-3fb409aac866@collabora.com>
 <5715e9e5-857d-4104-aedd-9662da0fc0ab@kernel.org>
 <911e4163-8a2c-4ca2-8903-8d3ddb7266e8@collabora.com>
 <600165c4-eaa7-4b1e-806c-63d3b97d5064@kernel.org>
 <63da5790-984b-4760-8e92-85b5d2269b30@collabora.com>
 <94ed1340-94bd-49ee-ba31-9bb63164c89a@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <94ed1340-94bd-49ee-ba31-9bb63164c89a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 17:00, Krzysztof Kozlowski wrote:
> On 17/11/2026 15:21, AngeloGioacchino Del Regno wrote:
>>
>>>>
>>>> Any advice on how to possibly resolve this without rewriting the entire thing?
>>>>
>>>> Mapping that by mmio address in the driver seems too stupid/dirty/bad/etc.
>>>
>>> Driver needs that, so why exactly stupid?
>>
>> Really feels like going back to the days when devicetree was not a thing and all of
>> the MMIOs (on ARM at least) were added into a mach file.
> 
> Well, adding an alias just to tell that device node with MMIO address
> 0xdeadbeef is ID 0 is very similar, just placed differently. The
> "aliases" are the mapping between MMIO and ID. Driver code also can do
> the mapping between MMIO and ID.
> 
>>
>>   >
>>> You do not represent any
>>> actual hardware information in DT with these aliases.
>>
>> That depends on how you see it (as in, on the point of view), really, because well
>> technically the second ReadDMA IP is ... not the ... primary, as it's the secondary
>> one - as much as the third DPI is not the primary one (even though DRM can make it
>> so that it can be used as a primary output, but that's a software thing, not HW).
>>
>> So... well, with that point of view... those aliases *are* representing information
>> about the hardware.
>>
>> But I know that you're not complaining just about this, and this reply is not a way
>> to argue all that much, just a bit of thinking out loud.
> 
> Being simply "second" is not alone useful information. It's pointless,
> it does not matter neither to hardware nor to drivers.

Hmm... Sorry, but I disagree about this statement - it does matter in some cases.

The driver's POV is of course out of context here, as we're talking about DT//HW.

(I know that you know, this is to avoid misunderstanding from anyone else reading
this thread).

> If it matters,
> then probably that "second" has some other meaning and it maps to an
> actual hardware topology difference, then often it deserves its own
> compatible or property, depending on the difference.
> 

This is a bit more complicated than that: "second" may or may not have another
meaning, as in, it may or may not be topologically different in the whole context
of the controller.

Having different compatibles wouldn't do either, because having 10 compats for one
IP which is 99.9% compatible if not for very very very very (add as many "very" as
you wish here) small details that definitely don't deserve a new compatible... and
besides, a driver parsing more than 90 compatible strings would be... how can I
express that in professional words? :-)))

>>
>>   >
>>> You want to tell
>>> drivers how drivers should behave - that's not a job for DT,
>>
>> I want to tell drivers what is the first or the second or the third hardware
>> instance of the same IP, I don't want to tell drivers how drivers should behave
>> from devicetree.
>> The drivers are behaving differently with different hardware (read as: hardware
>> that is *physically* located in front of something else, or somewhere else anyway)
>> as in with different hardware instances.
> 
> Then alias is not the way to represent these differences.
> 

Are we opening a can of worms here?

There are a bunch of (generic, yes, and I think acceptable-because-generic, right?)
aliases for other devices like UART, I2C, SPI, etc which instance is actually
represented by an alias - and this is *not* for HW, but rather for drivers' device
node number consistency in the userspace (of course not just MTK, but all of them).

That makes things a bit weird then when we assert that devicetree describes the HW
and, compared to what we're analyzing in this specific MediaTek case (which does in
a way describe hardware, as in hw instance number), the LS busses aliases are just
software details in an inappropriate place (DT) at this point?

I wonder if there's anything that can be done for that case, because then now I'm
kind of sensing that there's something else that is fundamentally wrong and that
1. Leads to confusion (not in experienced people usually, but not granted)
2. May actually help resolving situations that are similar to this one

I'm well aware that whatever comes out of this won't be for this round, nor for the
next one, but rather something that may eventually take (a lot of) time to assess
and address, but still.

Mind you - I keep thinking out loud - but I believe sometimes this is what makes
good (hopefully) ideas come to mind.

>>
>>> that's job
>>> for driver data. Of course if there is smarter way than MMIO->ID, I am
>>> all in.
>>
>> You can't imagine how much I was hoping for you to say something about an
>> alternative solution to that.
>>
>> As I said, it feels a bit like pre-DT times, but what I get from you is that this
>> is cleaner than just adding information about the real hardware instance number in
>> devicetree (no that's not just MediaTek, qcom also had similar issues as you said).
> 
> Sure, I understand. This is an workaround and might be less applicable
> here. It might be possible that your hardware needs a dedicated
> property.

I didn't check the others - but from what I remember, Qualcomm also has this kind
of workaround somewhere (in some driver[s]) - so that pushes the count to two
vendors, let alone the number of SoCs affected which is .. well, more than two :-)

I wonder if someone (unfortunately not me or at least not in the next 6 months)
should do ... well, something ... to fix this situation in a good way.

Adding the same workaround to MediaTek would make the argument stronger when that
someone actually gets to resolving this situation somehow.

> Unfortunately, this cannot be a custom per-device alias.
> 

I will come up with some way (right now, I have no idea how) to get this situation
addressed in MediaTek DRM, maybe it's going to be that MMIO address workaround, or
maybe not, let's see what I can do here.

Surely though, either way, that's not good news - not just because it's going to
slow down the upstreaming by a whole lot - but mostly because it's all about
adding one more workaround for something that is "left in the future-decisions-box"
in the kernel.

Having to do this makes me sad, and this is mostly because I have no other choice.

I'm sure you know what I mean here, so I won't add any more words to this already
long reply.

P.S.: Luca, you don't need to add the aliases to your SoC, because there's only one
instance of the display controller IPs that you're adding; for DSI1/2 DPI1/2 and
those final outputs, I guess just leave them out for now and add just the first....

Cheers,
Angelo
