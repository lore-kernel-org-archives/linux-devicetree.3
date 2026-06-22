Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304C3314D9
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782158520; cv=none; b=JT1va+KbpH8My0NOFWpUqwlqz3Cl2PxBju66NDbTV/mcaRyrVCvXwHfs2XK1kjz+WgV737Lor1MhyRfbWWT2bOKJ3OJbLkkmIU4w7MDP/0IqMEHMJ6GbxTo0zxicDGYGMvhaPVPipZzRf7PUart1adSLaJjyIUtwH+I3K97LRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782158520; c=relaxed/simple;
	bh=UKtfdIrcMYETIGulf7UVXywwHDak7s/n/29XrjgQKFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jf9NzxsbOE2lqFV99dMWyCAp/tk8vvSVW6OzeSyTznrYB9JXeNv51Ed9miEYN59UkzgqHZJahRyaQ8ws4ebE8HNfu+qoTY5vTLlwtmKBjA5hTtPxrcl5Kil8umXow4uL7yGOE3fFfX8P+CCCJWq/9Q9QGIjjnoxeSARrNefE8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WoiMpnou; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WoiMpnou"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-447046c980aso2464180fac.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782158518; x=1782763318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvvm5e3nrHM0bXJJtu1afhtiroq3ETCS6aL42YyUaBM=;
        b=WoiMpnouSLKCKdA/sJl0EfLM3F4ZYKXrbDaLzUnp3svYimvRlxlK4SkvatHXoOEf6Y
         ftatG/+FP19fyU0IlFaYHRAi3HO62IvX0MTIZEE3zkuPPWyOxwqo7EzWJ5GbU6OfcXFU
         bj8ySfkRDOsACgGS7wtCrsDoOOoNck273wXRbLqDwpJMTSjvDpq2pc3hjwV3ccJ4cROr
         1CuVRCWylOxVeRb5tpM6FuR54a+Jryb95Y+o1voPI0qgEumukVi24cvGQeVOlXynq8qb
         4kIYay28pIak+tFWen0s3rpgNvmFFSrjHQgIBbvSrDo8Ikdmx0kSYdPv+vJpQuhMR+TS
         fhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782158518; x=1782763318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvvm5e3nrHM0bXJJtu1afhtiroq3ETCS6aL42YyUaBM=;
        b=L3oW2uJmO2SLFuvtqi1jKkbgMp17n26vO2Q+UittZizLfmnyfrY0JlXClIaNlYVLPi
         sTfdUGs7d8r+geRtf3cKwNjzS5LN8Mwt4ZBf+DkvCPZ5UODEMu55dFY0eXpznxwEpBno
         oxEsnHfx7fbR5DR8DlJW1gPS3zECJGWozCJ1ma7LsWkea6cSV7yul+q5RiOQjjViZamY
         i+YbY58quJOE9Qvknza8WpjKSaFSiYAqgaSW/thg2l/zKV9QO0Xx3ROxVtVV3J9h/snG
         GejTS4SVhJa563SM8wnkDX6lqZy+y3pxTGdDF3GtplrrW08dL1lWh8haQQVWR/gTapPO
         jS8w==
X-Forwarded-Encrypted: i=1; AFNElJ8jL+cqVVIv72/utNDkGeIRzkcn8vgNe8g0bxO+WEXydGAeO3YcFsODH7N/c6nQlZPe3qQC4TdqqdiE@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeEIkyoX2dReRNN6B9Rz0dulD9Txfo757F8g00Vnj7Efh7NhB
	qP3gi6Y447f2ry1YS8OGXizRbX/Dz59Yv/Joq2o9W5x4GG7BW3LvXUTucyhf7y5T5X4=
X-Gm-Gg: AfdE7cl1Rmu7/UO/fa6oGyQ6mAtZUUP0Q3l7J1lbfLW/ACiYalZwofPYEay8EVqtsoS
	wufwZa/95PNboOKzLSkI86GDp6dn/mdOuuG50RQTFgw/8ayV9ZKIZ4lOLPFxwxsTiUWn12wn9vk
	5mDJM0kb6UxD2Sg7tUF/g9u5uFkJoZV9n7ON8iBNuPo0r4g4k4qN9TYpCV2KmtCvhfuSZdD+Sr6
	mwtZB+LLHf3zNCZjnCLz5cudguQF9A3HzcFbbVrQZxVY1eAfk/d1jtnn5r1nAREYglSMCW1+Naa
	vMhgx1TGcQOnasuRUHIYfLjf4TDxDf0yN8u2jN2OjveIDsIsgosQEldg5bhDTAzT4ggDujad0sm
	UI4XRa+hAI0QmdeWs0dUl4A8s6cRInC9z/m1QMe/uUGgfIz1dFP0c6t0ptWqKF3ZBPhlQsbih4w
	s29sb5eRUSvy/WodQRUivLAAemR8OCcRh0qqEyQtlt445UDamMAZGxbiEh/JlS5UB6WxWI9SoNc
	Q==
X-Received: by 2002:a05:6870:1f06:b0:43d:2452:c014 with SMTP id 586e51a60fabf-44707b8032dmr11879983fac.9.1782158518063;
        Mon, 22 Jun 2026 13:01:58 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6526:8577:6be9:cb7b? ([2600:8803:e7e4:500:6526:8577:6be9:cb7b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472e79af8fsm6024665fac.0.2026.06.22.13.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 13:01:57 -0700 (PDT)
Message-ID: <f7aae511-0e23-41cf-a5b0-27782caac30b@baylibre.com>
Date: Mon, 22 Jun 2026 15:01:57 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] dt-bindings: iio: adc: Add reference,
 excitation and burn-out properties
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
 <42e544b8-f2da-450b-92bb-99c41f1c72fe@baylibre.com>
 <DJFUE81GZEEG.35TP4FFBVE63B@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DJFUE81GZEEG.35TP4FFBVE63B@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/26 2:58 PM, Kurt Borja wrote:
> On Mon Jun 22, 2026 at 2:38 PM -05, David Lechner wrote:
>> On 6/22/26 2:30 PM, Kurt Borja wrote:
>>> Hi all,
>>>
>>> After submitting a patch series adding support for TI ADS126X ADCs [1],
>>> I was made aware by David [2] that at least two more chip families,
>>> ads1220 [3] and ads1x2c14, share very similar features (though these
>>> chips are not really compatible between them). After that, I found one
>>> more chip with the same features which is already upstream, the
>>> AD4170-4.
>>>
>>> As David explained in [2], these chips are intended to be used with
>>> RTDs, thermocouples or other resistive sensors so they share the
>>> following per-channel features:
>>>
>>>   - Configurable reference selection
>>>   - Burn-out Current Sources (BOCS) for diagnostic purpuses
>>>   - Excitation current sources (usually called IDACs TI) for sensor
>>>     current biasing
>>>
>>> Given that these three features are present in all four devices and
>>> three of these drivers are still under review, my proposal is to have
>>> these features be described in adc.yaml and have this series merged
>>> before the three others [1] [2] [3].
>>>
>>> This series is sent as RFC because I still don't have much experience
>>> with dt-bindings and I don't know if this approach or the properties are
>>> general enough to be described like this.
>>
>> It will probably be easier if I just include these patches when I do
>> v2 of my series (if you don't mind me tweaking them a bit).
> 
> Sure, that's fine by me. I'll add a dependency to your series with b4.
> 
> Want me to send one more version addressing your comments before you
> take it in?
> 

No need. I don't mind fixing it up.
