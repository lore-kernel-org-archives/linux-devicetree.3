Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442405;
	b=SH1n0O9iX7q/NSzpg3g9ju2LJSkjuH3Rsa8Ujl8+/rZIblx+QhXO6zDo6BRCSkCKhC2h
	 uLpB0erdur+QcdqFtBYcvE34Lq8qON5y5prUVYcU1mFZwQrvscg2XLjso1+E3g1z/tArk
	 dL5pfAAy7UKlZBmprFk4L/LwnGTcXMQAnIo6WBMPonJCTlVuqVOIw8WzWdKX5VGUeL0wI
	 Ggv8p2qzDmPjU8elmLBqsymS5r8Jo6pItg6B4iNDDA4s8mzEoO+s7wMAp0tlntpspOXgk
	 mw6t8y96nenqRzebLDzMpQEJI/cbW3wZuQv9N/mjHHHG6RuRgfIUmd3L+xVyZkz6IBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442405;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KTNFFpQ3kER92nljtjnxslEg2HatMNO3Pm/4eF+/uVo=;
	b=XX59QD4dVyHOhxw7j2URj3Xr/C8hIYfrim1V74CnBLYdvycfn/G1KQYKMwmRezUHluI1
	 e9mZL+dtsz8Brh6FI2/q/Rn7kG9eL9RlREtZZZbQBEWRg026XORG2720ESFr8deJ3rXhG
	 MftUqknZ/Qx+5K/c0UegSsTq+qFgCB0GF0uHKE7lHP+FgAbX0lwb97DEKv8yPKByThHfw
	 fvSgoF9vkEVTmlsOzUxt0Nv1qT6VTDZTjAcNqF69xY4ur4SodSqIMLnkPD64q6ntyomq3
	 APDVqFv9FzB8KysZ94oX4lkj3q2/Ekdn+iVZwNYHWjrFAcS6k0SiFIIty53dCErhZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HSaCR1P4;
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11025606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11025606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HSaCR1P4
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q+a6mEtr7v7r3AOnn5SeGdS5lSXCWUahw75AjJpOxjY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795442403; v=1; x=1796047203;
 b=HSaCR1P4legPkF6kIb5xXNUX70+TzNIKQiy91SGabZEsMrUkIJDPKchokqE2YZdH2OIu8tMe
 nf40zv1YulwKl+13ksCphNkK2UZI3JfcIMS203PCxciZzTg6WV+IOyro/yK90jcTKw5WJvJlmdi
 DgLethbld3AEN4cUFrJ9KvO8=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e58aebc7aa3e4872;
	Mon, 23 Nov 2026 14:00:01 +0000
X-Mizu-Trace-ID: e58aebc7aa3e4872
X-Migadu-Flow: FLOW_OUT
Message-ID: <062359fb-c169-4253-aade-07cba63a279e@linux.dev>
Date: Mon, 23 Nov 2026 14:58:23 +0100
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
Subject: Re: [PATCH v2 02/24] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-3-srinivas.kandagatla@oss.qualcomm.com>
 <b3df76ad-e002-4ec0-a1a6-812d22b51432@linux.dev>
 <e10e701e-b478-4fe5-a62a-2365507e5d8c@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <e10e701e-b478-4fe5-a62a-2365507e5d8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> +Typical use case: a smart-amp speaker protection link where the CPU
>>> +side is a playback-only DMA (e.g. ``WSA_CODEC_DMA_RX_0`` on Qualcomm
>>> +AudioReach), but the codec side exposes both a playback SPKR DAI and a
>>> +companion capture V/I-sense DAI on the same SoundWire bus.  Opening the
>>> +playback FE should bring up both the amplifier output chain *and* its
>>> +V/I feedback capture chain atomically, without userspace having to open
>>> +a secondary PCM.
>>
>> This is a valid use case that has been problematic for some time on
>> other platform as well.
>>
>> What puzzles me in your approach is that the codec-side will be
>> configured/started, but *something* will need to grab/process the
>> feedback IV data generated by the codec DAI. That part seems to be
>> completely hidden in your approach, is this intentional? How would a
>> capture DAI be configured on the CPU side so that the data is provided
> 
> In this setup there is no capture codec cpu dai. The capture data is
> never seen by the userspace. VI Feeback data is directly feed into
> Speaker Protection module within the DSP using the codec-to-codec setup.

Humm, even if there's no user-space visibility, don't you have a
SoundWire capture port? How would that be configured? At the very least
it should be prepared and enabled.

> Host only drives the playback data and the VI feedback path is entirely
> with-in the DSP.
> 
>> to a DSP? Some of the patches, e.g. 11/24, mention a capture dai but I
>> can't connect the dots with the suggested codec-dai changes.
>>
>> In addition the feedback loop can be made of not only I/V sense but may
>> also carry an echo reference, and that may have to go all the way to
>> userspace depending on where the processing is handled, possibly with a
>> split between IV sense and echo reference making the topology even more
>> complex.
> 
> multi_direction_flag is really agnostic to driving data(VI or echo
> reference)
> All this flag is doing is setting up the codec which are configured in
> opposite direction.

but the configuration of the capture part is missing entirely, no?

>> And last the SoundWire core exposes a concept of 'stream' that is single
>> direction, and so far we've used a 1:1 mapping between dailinks and
>> streams. If part of the dailink is dual-direction, don't we have a
>> problem on the SoundWire side?
> 
> 04 patch addresses this, we create two separate runtime streams per
> direction instead of one.
ok, that should be made clearer in the introduction, which mentions
codec dais but omits the gory details of SoundWire management.

I have mixed feelings about having 2 streams. It 'works' but it's not
optimal. Maybe it's time to revisit and extend this concept to deal with
data that's closely related to the regular PCM data but flowing to
another direction and used for a specific purpose.

There's the case of the IV sense, but also the companion amp which may
require a device-to-device communication scheme. It would be much better
if all the prepare was done in one shot for all the direction/ports used
for a given use case, and likewise the enable should be done with a
single bank switch. Not to mention that this sort of solution should be
handled at the SoundWire core level, so that we don't have to implement
this dual-stream implementation for every platform.
