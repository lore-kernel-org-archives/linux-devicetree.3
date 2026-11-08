Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175590;
	b=NQg8ciRnchyVA3DgRba4C8zTdMOGfyLxKiIB5WlQim47iMOTj9Uz7h6GnOKgeySgtyqM
	 uZGHvY78DcNEQ6XzMlTGTOPtqFlm8nGvJBdo9CYJMG8wyFZrhlSRm8YbskbROOcNzW2lQ
	 r5cxfW/D62irhpR1xVEZac5UuyKz2GHuuQMvVLMs0QmHPUcJU2FTbW7/qt8cLfgpPAzvR
	 KUnrDgngI2Ff59SkmRVO+TOhEv5yUqA5FpSY9hVOikhjSKJ3WQRAGZHKj6aHUbQESqaX4
	 EgRl7MK8agR4RtAPXrFrX19klaaTg/2K+OhIKuUpftuQI4E9ju6TaldmaGU0jenuQHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175590;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v+T181MDNN1iBq6H0VhIHrJPTEvbTgHtlnvga6WuJCQ=;
	b=NsLXkizeUwCz0UEB7nDQ2VeSXvg6p4xZhYWL02J/v2zF4+kr3bn+P7YTyrpLh3cysPMO
	 rv31t43lVDBy7K1j9LlFVjqATjk1IPgHE9Kh6U81LjU3E2XiCtry4tqGuaFNsUjVS/cJx
	 LsIvCa0i75BOhyW9ruCJmEkRG7oTU8I0moAc76MIkwAKZZLS4jSpYdrY9DNJVe6WsYcMz
	 ixP0APlpjHNtoTFmiS83IikX9rZcdf4TN2w6DCfuJMQCZ2a/q6/rMEncrD2413NEzwoHj
	 sNW+3D2JTX4g5wUV+JDTZvEaqjdXG5RT+K4ahJPdPIsdoxwNrb1ItJKremLZC8AgKpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=UVaNACGE;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D2606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 22:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=UVaNACGE
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TPWjkjB/iqSgnkr/uZ6p6HisufPl8VRbziOoj8jL4Gs=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794175585; v=1; x=1794780385;
 b=UVaNACGEbPJ69djQNqEHUHLwaFoHIFm81mxbhqrNeDJ3rVT8Jr4jqabvQRSurk/dzHo7NFAa
 spWT8wevxpGphyRbno3mMR9VlIGlM11WQU7DRNQkKqNEs1ictsuCmQ0kpNxIeAJ2wnk9nW3yiaC
 g/XZddhpNdpS2h8URp4t+T0N3j4D5poRJp2ImInZO2D7VBa2TUWcQ7fW4Mdc5perpi92Jvzrjmv
 XMRpvHcFBN040ScUd9VECYlcFMOyn3VrN6RNNxkNSLd8ghGrI/vGeTuHIEy1iKxP1Z63hUzuqm0
 kznFzbSj6ryGTsgCn5z7Qw52M6yX+wdu8H6Au5YmqOXnw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb3952d11ac63f6b;
	Sun, 08 Nov 2026 22:06:24 +0000
X-Mizu-Trace-ID: cb3952d11ac63f6b
X-Migadu-Flow: FLOW_OUT
Message-ID: <df867081-9681-4b68-bcfd-9f7657942942@postmarketos.org>
Date: Sun, 8 Nov 2026 15:06:22 -0700
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
Subject: Re: [PATCH v4 4/4] leds: aw2013: Move assignment of chip->num_leds
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-4-826529beeb52@postmarketos.org>
 <sashiko-outbox-204102@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <sashiko-outbox-204102@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-08 3:00 p.m., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] leds: aw2013: commit message rationale does not match driver
>    locking or code
> --
> 
> commit 1ce6b90ecf6b0a7b5d8097b414e8e137a3fe0609
> Author: Paul Sajna <sajattack@postmarketos.org>
> 
>> leds: aw2013: Move assignment of chip->num_leds
>>
>> devm_led_classdev_register_ext() executes default triggers
>> synchronously, which call aw20xx_brightness_set().
>> aw20xx_chip_in_use() silently returns false, skipping chip enablement and
>> causing unbalanced regulator disables while probe is still running.
>>
>> Increment chip->num_leds inside the loop, so that each call gets the
>> correct value for it's default trigger.
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> 
> [Severity: Medium]
> Does this commit message match the locking and execution flow in
> leds-aw2013?
> 
> aw2013_probe_dt() sets brightness_set_blocking to aw2013_brightness_set()
> and leaves brightness_set NULL, so default triggers activated during
> devm_led_classdev_register_ext() queue set_brightness_work instead of
> calling aw2013_brightness_set() synchronously.
> 
> Furthermore, aw2013_probe() holds chip->mutex across aw2013_probe_dt(), and
> aw2013_brightness_set() locks chip->mutex before calling
> aw2013_chip_in_use().  Any queued work therefore waits until
> aw2013_probe_dt() has finished and chip->num_leds is already set.
> 
> Also, aw2013_chip_disable() returns early when !chip->enabled, preventing
> an unbalanced regulator_bulk_disable() if aw2013_chip_enable() was skipped,
> and the driver functions are named aw2013_brightness_set() and
> aw2013_chip_in_use() rather than aw20xx_*.
> 

The robot is internally inconsistent and incoherent.
Feel free to drop this patch if you don't find it necessary.
See the robot's prior review here:
https://lore.kernel.org/linux-leds/20260908000128.B92201F00A3A@smtp.kernel.org/

 > [ ... ]

 > -		led->cdev.brightness_set_blocking = aw2013_brightness_set;
 > -		led->cdev.blink_set = aw2013_blink_set;
 > +		led->cdev.brightness_set_blocking = aw20xx_brightness_set;
 > +		led->cdev.blink_set = aw20xx_blink_set;
 >
 >  		ret = devm_led_classdev_register_ext(&chip->client->dev,
 >  						     &led->cdev, &init_data);

 > [Severity: High]
 > This is a pre-existing issue, but does assigning chip->num_leds after
 > registering the LED class devices cause initialization problems?
 > Looking at aw20xx_probe_dt(), chip->num_leds is set to i after the loop
 > completes. However, devm_led_classdev_register_ext() executes default 
triggers
 > synchronously, which call aw20xx_brightness_set(). If num_leds is 
still 0,
 > aw20xx_chip_in_use() silently returns false, skipping chip enablement 
 > and causing unbalanced regulator disables while probe is still
 > running.


-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
