Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469908;
	b=LryjLm+gd2bPwxU3M0jIUFoCOswYVomIaDZikDP5ZnH6VOJnvUjyP4AKv9ubRDD6saK2
	 21+soDcl453HFtNa8ybdbbwJTtNz3UE1usXTIZ7mNrrVntJNqi5Urt7u1D4fXhMHxHd6H
	 qkqIargK8lM7ujCJN3kn7IgUhjMeX58IbAuecCfUYFrQJjXRbaYbymKI1eYlQD8rTEh8M
	 kyEU2jk+hkoCMaqAczl7FPgLAATB0Zdl9J1eDJ54det397HEAdYBf7ZF6CgR6YXDHI4wE
	 DsmwIiY1ut9mNbK2ki8ABN8b9OyrPVvh3sxaLYLSaF//Kkf28RdIlofgLQvm1iC+3pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=;
	b=npIa+0t4QcYeBihJGEzEjvPVEJEELcN4llUMo4HJn4LPbfV/LuUsN8RE54R4/nMSy8K0
	 UdypNSDjfUAhg0dHYngAjUcRuKTGWPDVLE44RvujSBUCWfVY+5YGQHlmpu+9o+e7JzAPt
	 BlyCd3pzUpn5k472pMbBUqfbIz2aP5BqZfxsAId0hJlPLEWSTgWcf2NCqUEAtLY9OO1ag
	 1cd9pVXQw+HqfSLx2TNGYI+CrDQK704054C8JKRNyETilY/OWU8OqqYl0mWKGnbT00aKO
	 +ON5Q5EhywIs3KyDQRGnx0xxfUH9hyfYiV8YmyHPC7sKvwPH37NQUVl4djZ4mpREhQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FsuiRv9o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8oq38co;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F33606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F33606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FsuiRv9o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8oq38co
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuam82973604
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=; b=FsuiRv9o4rhbb/eZ
	HTPrneLisp2RJQ85EXK03rswce86Q4Be6kd1F4XCcmeT6DHwdJzB9XsWeecROHPx
	xmoLR/ZJHKGrq18HJmoQ/Vs+9oVt/3awl44teU4CR/k2NyAPkoXPhemZ97gziAcq
	ZfrsAtVicPbiX89pKR9eXpCZKlPNtodlTs1cs+LSPYpqg7N6+2kiHhKdpL5EoM0S
	oW0CCYnu0ki202EbslNhFb251Gpz4EI/bQGbXZtPhgv1T9hy2Hh4owtQ7M8bLJ6E
	eu76rb1r7Phzb5tf8XwxiP8w/rn9lwK8+38707ZLdwB8fWdWjIf3YWoAjeoa+z2/
	+IAT6A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03kpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:38:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211f05706bso50174036d6.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469906; x=1796074706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=;
        b=D8oq38coSHRufd1WNPxgFyTGlyy/6xCyRV18IKo3vJ3sYSAFK1X00+7+5SYsQaZgwE
         H5RPQZiNd0zW6mzELCX9l8cdWiHQqi61SscsV+DGWD2YFhyjHi+JxW0mUbj1/K4FsT9U
         reWqKgQRu8Xu+SvpaUoLQBWBvHr9UBqpN7aSlRce3ZQ1UuSQR+mmerht+iI8RyTfK+J3
         XhyvRfIwkvxR7ctQSd4sXczkbnAUA9tork/nz3IxAuWEmv7qVd5bCL4QxNwNGoKBh5aQ
         UKRmOVHX0CYJAP/gZtEtPOwSiSAvKcalQ9s+eKQ0We+qntgNHPSsSixiQBQX2g8tR4m5
         5t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469906; x=1796074706;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=;
        b=JRf3mKQC4YnXuj0ohJCwM2+pbSFGMEzzE7DS2/quAqVcPfrif84hjXeGKR2GIhpQ0P
         dkXWgLP+NPcmKNZDUNI/45y/Ia++QddXu2PudGgqhRzpozADsJ/V/v6yeNXspGuFQJNE
         hBtiSMdHScFcaA9k7SnBDy7CTvX7c60brSbxAjyNzkZpBVYjM8b4iMsiswOylAmToFZj
         ovnfnMOjxP4P1xyNX4HtZmi3JewRnk1UlEgpMtsiajLkmz2H4vy5RfLqy96SolfG1Rm8
         h6jBmy4qk8+AVnHPVgXShU+id7fQlgTZcmO1nii8sHSxYAstYc2FuuUKXKnbv4FGhOq/
         sG9A==
X-Forwarded-Encrypted: i=1; AL+hErGGTa+w0AP+8+iJXEuwkfAeWZPq4JJAKFK7XKv+fXllY4HO0bHFJRug5TPCe+4RXMDiqCcOQnAn9P73@vger.kernel.org
X-Gm-Message-State: APuU4Z9P6kTgSkdXKFCzDoYvPVa126EYD/grGDeVmi4FVSKZomV7yXLI
	8R6Z91OY1YEY1tV8mpjLvL9G9V1ggkuVDXb6yBf7LMGSo5uH+R7TBQ09hECyg2qJ4GSeoeSaqEV
	1aZBj8AfoGrnkYo/cIjl1N6/7tGK3dqiXxx0dOC6UGJrYg21k0E1SJ3KaNyaPjJPO
X-Gm-Gg: AZFdTZeP5+tYPaXma1YOTwy03ZDKI8tYTHN4ZjV8e6uCdOZh+2kmb4Pnv2usueCOqFF
	mQhy2exoXRHkC4BjpN3DyYAY3x+4Idu6xibfPooTiuALenq9+AD92znGwj3yZuEo6FD4OOgiQ4k
	RlppMxFnd110efeNG+Zodwu2IvSWjb7USWYYGHDfv87L9omi49edl/O0ETFwt+yRbDFY3yEZXkf
	aQOR21RrV/DhRWra5/63eNAIKhKN2UQXOLO7p3JsE6Z0ShIFQlFTqTw2Osme8J4wAL5ONmr4wEY
	CFLccoX/3gIjssSVwHR+LD8pmsCaPnjBwQcW7uRjyspwAvnMD3UHNRJQhBPLfTpX8/8MW8F0tDs
	cmqNWwehTy6YQZVH2Hspd1r/ZzfkT+Tf+K1d0JsOjN8W1oqdaiVQSWmjpG4gEjL5g+Koi7N5bFs
	XZ6A==
X-Received: by 2002:a05:620a:4714:b0:949:60f3:1cdc with SMTP id af79cd13be357-949ba8260e7mr2404867985a.10.1795469905891;
        Mon, 23 Nov 2026 13:38:25 -0800 (PST)
X-Received: by 2002:a05:620a:4714:b0:949:60f3:1cdc with SMTP id af79cd13be357-949ba8260e7mr2404861085a.10.1795469905307;
        Mon, 23 Nov 2026 13:38:25 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm25478791f8f.57.2026.11.23.13.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:38:24 -0800 (PST)
Message-ID: <f7de8841-1345-4360-838e-d2b67e9a4b6e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 21:38:23 +0000
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
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-3-srinivas.kandagatla@oss.qualcomm.com>
 <b3df76ad-e002-4ec0-a1a6-812d22b51432@linux.dev>
 <e10e701e-b478-4fe5-a62a-2365507e5d8c@oss.qualcomm.com>
 <062359fb-c169-4253-aade-07cba63a279e@linux.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <062359fb-c169-4253-aade-07cba63a279e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX3H87czwGIvIS
 kIHRt7PumcXiNGqKyH3xOli+uJ1tv0S9/qg2tIMcY0lhcpo9Lkci2ihqk9wiZEoEj7PDdJtkoWD
 8xbKqQxS91O1IgwZE2YRgekBg3DQ4PGgvMbTg4eLTlkx+MAkrmQJLoV6Hprxzr23sTMz63+QDf/
 QpbeCoDw7re3I/1C7fgLCJqwraj8QzkqK7HjN31RrwcXBcEscI/awBTz1x7XSFh4BdGRFCDJxsX
 yLssF89+t/th1LSFFmjxEKjrmcqrFJNgoGnx13IKxTYb/WDvZ1gKkSIvxJKMHvFRhnzl1WOX0Wl
 bGugdO8lbCXFtQTH3Mtb5jAUkU0+wTzggYSS/YHWzotx7ZApGNVabWXUU9WwLb3UDgDpEVCwNwf
 sFPZlWKJcOCX2zsADe4yHFu+62GppY2TzbxYQbnJxD5t8TiR3niFipKb75grDTtwyRP69xIO2de
 xFaSlhdcdTaFgp8Oukg==
X-Proofpoint-ORIG-GUID: -UuvCF12d4wsXOHAboOKJLh7qQyBh7U9
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04b252 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0Tsbpnv760q_-0Te3r8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: -UuvCF12d4wsXOHAboOKJLh7qQyBh7U9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX1xJxIuPoRCHt
 ZUqcU8XP5gQmLD4t9/QIovwY/OT1tB0f9D8UzzJ2xqHwlgCQceCoannyF5NUngwNnqIXdH62oeU
 /naDVfc6QXizFtKItFuh94oETb4nBc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086

On 11/23/26 1:58 PM, Pierre-Louis Bossart wrote:
> 
>>>> +Typical use case: a smart-amp speaker protection link where the CPU
>>>> +side is a playback-only DMA (e.g. ``WSA_CODEC_DMA_RX_0`` on Qualcomm
>>>> +AudioReach), but the codec side exposes both a playback SPKR DAI and a
>>>> +companion capture V/I-sense DAI on the same SoundWire bus.  Opening the
>>>> +playback FE should bring up both the amplifier output chain *and* its
>>>> +V/I feedback capture chain atomically, without userspace having to open
>>>> +a secondary PCM.
>>>
>>> This is a valid use case that has been problematic for some time on
>>> other platform as well.
>>>
>>> What puzzles me in your approach is that the codec-side will be
>>> configured/started, but *something* will need to grab/process the
>>> feedback IV data generated by the codec DAI. That part seems to be
>>> completely hidden in your approach, is this intentional? How would a
>>> capture DAI be configured on the CPU side so that the data is provided
>>
>> In this setup there is no capture codec cpu dai. The capture data is
>> never seen by the userspace. VI Feeback data is directly feed into
>> Speaker Protection module within the DSP using the codec-to-codec setup.
> 
> Humm, even if there's no user-space visibility, don't you have a
> SoundWire capture port? How would that be configured? At the very least
> it should be prepared and enabled.
> 
>> Host only drives the playback data and the VI feedback path is entirely
>> with-in the DSP.
>>
>>> to a DSP? Some of the patches, e.g. 11/24, mention a capture dai but I
>>> can't connect the dots with the suggested codec-dai changes.
>>>
>>> In addition the feedback loop can be made of not only I/V sense but may
>>> also carry an echo reference, and that may have to go all the way to
>>> userspace depending on where the processing is handled, possibly with a
>>> split between IV sense and echo reference making the topology even more
>>> complex.
>>
>> multi_direction_flag is really agnostic to driving data(VI or echo
>> reference)
>> All this flag is doing is setting up the codec which are configured in
>> opposite direction.
> 
> but the configuration of the capture part is missing entirely, no?
> 
>>> And last the SoundWire core exposes a concept of 'stream' that is single
>>> direction, and so far we've used a 1:1 mapping between dailinks and
>>> streams. If part of the dailink is dual-direction, don't we have a
>>> problem on the SoundWire side?
>>
>> 04 patch addresses this, we create two separate runtime streams per
>> direction instead of one.
> ok, that should be made clearer in the introduction, which mentions
> codec dais but omits the gory details of SoundWire management.
> 
> I have mixed feelings about having 2 streams. It 'works' but it's not
> optimal. Maybe it's time to revisit and extend this concept to deal with
> data that's closely related to the regular PCM data but flowing to
> another direction and used for a specific purpose.
> 
> There's the case of the IV sense, but also the companion amp which may
> require a device-to-device communication scheme. It would be much better
> if all the prepare was done in one shot for all the direction/ports used
> for a given use case, and likewise the enable should be done with a
> single bank switch. Not to mention that this sort of solution should be
> handled at the SoundWire core level, so that we don't have to implement
> this dual-stream implementation for every platform.
I agree, with the Idea, I can send some RFC this week. However this
series is already a 24 patch series and I do not want to keep adding
dependencies to it. This series can get reviewed as it is. In the mean
time I will send out some patches for this new soundwire multi stream
api for discussion which might need broader discussion.

--srini
