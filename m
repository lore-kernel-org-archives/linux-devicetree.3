Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312353;
	b=tjj7ANNECHpwDAhP27UqV1qb/RtBdX6UF99P5sxIY8jikqh1rSp8bjWL1yL6EhbGitb5
	 ssv0QD5wZdHKDhoF5Q9A/gyFa3SAfRz+cKd1BmXyh7X0iBX/oa5PUSp5Q4Y1iGo/I5E8M
	 U7kcwX0xVWw6gj2tg0N6akijroEjDM2maO6Wkrf/ETeTf19TVWVtkmQPvEgliKLHBkQAN
	 7lAyu2G/GCIj56GgzgSNMtFur5+n5aMKJdCzmnJaREikam0uJoZcGmYGaQGTIC7rJMSpL
	 dgIlQvgC7TRmm0WFmk1LXeljSSZ/b+z7M0fAtRjvtiTkIGi/LEOpxw6SmhM2rBqKZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
	b=wfoFiLyPdNobHTtksZv4vcd2UlqphnBPwfZKtYAYh4/noW5LG69LE9MzyogLc+BuXMsJ
	 gsGqZ37sjNoAOrAhO0f9gFp1SyOUOCgPIZYi12tWA0ZR56X4PvdEKXplsTgB351FGeguN
	 ka6lAUeay2Uvsh4MZvs47eexTug+HgddJmjHy1nGSTSD0BJZrZ/AMdd0geD4gznnshtt8
	 psslIts5wRLCgmna/PPN+ehRHIGuSypSJ5LDvmnciZKlDJvCH0qRea4OadXYzke8s2sEg
	 3k0vtTdoqa8aSAVGxTV+QC1ZvdKDnxJSQjNu3DIylHZPUYL9NcCFCKwwjZom51qfewQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=LF4BFKzr;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F2606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=LF4BFKzr
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so281846f8f.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794312346; x=1794917146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
        b=LF4BFKzrTfKOrCuSfp4DCyhP5JXW6aLC8XDTOi3QC6I1vLZtLE95OOLLw8+PaO15OD
         Mqzsu8ibEbOPvk0C0LZpmcHuoWuVD46E4lCbRLNSR4rlywp/TUbyv5jDIrUHnqRKUN0+
         VgYmCiQFOWw3por3vt60eXOGS7VxhrTSAy2uD5KjqibIYZXvhF8xkBxmfq26pC90h+jz
         nKnTq6DPVdhiHAlRe3p9KUoVmEpDTiOAWO5AsRJkCiuO3TGigutjr1wKeh2R+kZU8E2o
         7B4YTnJAghxXdSsuvEnENaGO3330T8hm5HVDo0cO+QeGHXLRYcSbSeMAQmUnkuj/DUfe
         xkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312346; x=1794917146;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
        b=0NjbK9cBjWz9MkEPpqCX0LO2X7/d8rULfCT1eauJbmYt0AiRq9YF2oCnI2J6XCoh4z
         1SaPTzguHAK0feySbFcdp22DEqeWshJFYUbiX0ma3Ejmwx/z4aQRxdEo++spCf1lI3HX
         ZNjYiVz3xIYeBM7AWx6t96nnmH3t9xfKDRApLHxVmYHrag3pRRrqMqS+ZM2iQtxTkOt7
         qfvn3nOXl5JZDfun8BxaWHupFOO8JfFuHiBuGyQUz8QgdBl0YVj8A+UK9VEw4/qkzDAl
         aXoXRafUxCsu24L3dv7/HwBKnxUc5qiOofi+sWCW9EnS0p4NCLppHp1BUEUDskp2eCjz
         0d3A==
X-Forwarded-Encrypted: i=1; AL+hErG0j5pR968s+PXElRwYakVEUFqLHdD3zyLLXjgl8XEZ42TDo4aZerS7atlxEP/VpHc25FkUEt9fDMV6@vger.kernel.org
X-Gm-Message-State: APuU4Z+PH0XH5nfg3Ahry0YR1l78sjBiSQx+3/LYg2ZTf+/uUUQc5vFD
	n3cS1ck09kQEhVp04hDTe/C7yPTs12lPpweYo+BTMimVInBGDz2sdUf1NN4Vns3Btws=
X-Gm-Gg: AYBFou29TkZwaK4UqDVYFVCJFeJ8soS67Urh2rf0JjVRmfTQwDfRKMnJ3jOEVlmHp5z
	/YQ78dvCJm0PtpnWbrN3ovesxWvW+d/61dve0Nwp1bf3h2hqrLQp6UJDqmvBOlKeKRDYqYFboI2
	KywduZG0NR++gDHGaYws6x6+e0rSdKuhYMSNTcwEKcNVcKa7ZOPLswxJLLAzkx8H0uBnLk8NvX8
	3WNzttEoAkXl+jfAKldld/0VhbWCICLtfS515L8NuLL5ADILGSRGmVPr0B2a6NBTgf5tB2O7Bqv
	zZQyLvTxR8sjnXXgn8/3QcZoWyupQYhXNIFNnEbVkju45UE4ebUGk1cbDvz2BOj3V/Ob4Z5c0rh
	jEmSv7OcR1/+ZYZoUKxdv4ojaXTmGbroNeQLdDeJkxVh2aACRToVTI0p7SBkNRR3jpQWuF4+wGx
	H6VP7NPAaurH2j76qWdqzo/2OyYExztKG+kB7fugTY1kR4vIsiODy5sJ8jFMZLPl7y4dwMjj7A2
	PWRQYfV962bS8TX26m2Ol5OX03iyTwkuROsC6pYgsdWpBOeBaAWICtWI9vYvr8tjUxe7ZOCrhvR
	Pa9O3PesJWTpbY6Lkl8/J29ReYyTwDgyTPsQM7rZgaPH8PWlXASkz0up/eyouIatn58Clk4=
X-Received: by 2002:a05:600c:3b8e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4ba023367dbmr51948635e9.10.1794312345435;
        Tue, 10 Nov 2026 04:05:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm61119315e9.14.2026.11.10.04.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:05:43 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Message-ID: <dbeb92ed-4bce-4de7-9699-6a8eb6a07284@tuxon.dev>
Date: Tue, 10 Nov 2026 14:05:42 +0200
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
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
 <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
 <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
 <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all,

On 11/10/26 13:38, Geert Uytterhoeven wrote:
>>> Thanks, but six weeks later they are still not visible?
>>> Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
>>> resets in top-level"
>>> https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe- 
>>> mkl@pengutronix.de
>>>
>>> Am I looking at the wrong tree?
>> I tried to get stuff into the last merge window. For various reasons it
>> didn't happen. Anyways - I've pushed all queued Renesas related patches
>> to the can-next/testing branch. I hope I've collected all the latest
>> series. Can you have a look?
> Thanks, LGTM at first sight (I guess Biju or Claudiu will scream if
> something is still missing).

LGTM.

Thank you,
Claudiu
