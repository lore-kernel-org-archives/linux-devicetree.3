Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656312;
	b=O6rxe8h8Jkp+APfvBr9lDl0ebag5+WPMU5OdvUe0RjvO8XYeiIQij5aN6TCNL0gJL7jo
	 l47qhEv2QsjTxEU94FG+dte3VA5Xs0lQJq+skdF8PnMsHaXZqlQBrMaI4dMfa4zy4Ra6W
	 ONooqpnNf9ftis7+nJha8MB8C6s/D0+y3Uu3T36Uod8m0hc46rcz/nqboXFxEhJwt7IQr
	 SEri88TiJppuoWrkwYbw/jelXkloMlIzScEElo6aMAe8nCRGOJaBUnzEwkDThUhTy6+xc
	 6PuVaXNanIKQ5Fap0ERGiLT431lzLMaI+epZVdd17mIYgMGnuG54Hq7broEzl45rvuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6vETnhFRgbr5N3P6H71MD/C/rWSkvJBPHq3abNue+/k=;
	b=BQukQLnslevIHwFXpOB48lfYfhOBk/aZjimr8KGnLdVEsV3hk9ly2V2Zr6Om/3TmAyeS
	 gfM5vTVYbbp9hLZ3BLB/dCxWNWC+yNE2EItTRMNaz4iIkU1W+wrWoF54TcbnVYns9NcD0
	 /ZVp0kcNKP5PH4r2wALuP4e626AkCZy8Y7smYy9NKPrf0LtUzX/UIeRl8rxvNhpad11cn
	 jkB6tnK6eGSNYdX8m6kJJS93ipQaWCsHcz8+GagvCBLiz9gwow84ugDVTqwEB00Rm9NZF
	 g/TOcMKmx1LaIRPN3C+orElDSFzWVfjyiuQoNO/QpE4I5yxO+xeO+yeVxk77TxAqrmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCNYvGdx;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D399606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D399606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCNYvGdx
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1305069a91.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792656311; x=1793261111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vETnhFRgbr5N3P6H71MD/C/rWSkvJBPHq3abNue+/k=;
        b=GCNYvGdx1xfqdkfN3PYylA1qFCOlW5X0i0yNFPzUzAdVvj51dZys43EOniuEZdigNd
         rKgfs9/hmzmEiVQaLPt0DLJ8iihzEAxWuXBGjCdV28arQHACX1hImglWJ8UXXcraQM8D
         C9ryU0Io2lt6PW5RqwZWllGjLmV2FpGuD+5pPxQZ4/1iX/3+5U7Ux+Ye3LLBsdNvjsQ4
         KpWx3Pok+BAemt2Lk0+TsptIGw4A8XXWOJqf0xm+az3xNexVx6Ub4IaCPLT0a6VN71RG
         XhQOyZVP1qzYjT8iWxwBg70EygVoa5WtlZpq0NYlNOgig4RDHjlHtv7pyOyfYLm0CECA
         ikEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656311; x=1793261111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vETnhFRgbr5N3P6H71MD/C/rWSkvJBPHq3abNue+/k=;
        b=Uqp5g5dxRWFfo4+T0N76+54T1oeZ1fB3gT3bGwNdkCjMBoDRYol7cf1zJvjM8UeRw5
         1NKYSXnmcQ0gJ13E+u4tTVDVx3QmwBlE3pWMnJ8c6Nb4euAC1tajo/r/gDfqspGBXqCm
         OHkopNvOEkuaBmfextE350etvdwIqOcECs3GyyKACfGARAe8saXppPDxAtcZu7B99kBY
         YgJ7tDkQOJMMgjeAhI4WsTenh3j34R9UQG5ynohY3gKsNmNDsl/fXHP+XdVO25+mtK3W
         fLI8xiCUu55lfrA3dxdwq0qm6aWZ8FY/KfcDujIM67jtpYKf4vr7y0MEbrx3p/s0IMRG
         IE9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzxT2cpiB26xNfNFlD62SyLaz3fsQBe9y3497sizBhsEtJPkX4TfK0faR4Reyk+YzClE8BFeMe6BBH@vger.kernel.org
X-Gm-Message-State: AFq9FYL8jTT9tZr03PcnlGMmod32ndBLOuazksuR+msui+dO4wdqxxJ0
	G5427rSqX1ub1MUJD4aiPGGFYCejNvTQO4P+9UhpGEWc2YnjvIJ8jpOhy39I75LFwu4=
X-Gm-Gg: AYBFou12LByTLB9i5v/+275zTX7pSqKdumZENzz6LoA4Neg34yFsj1q/IkbsAITE0Sa
	1o+fI7Nim4xxHYtRjGK4zRkcX5CH5WGClJkYXYhrY9E8CyTTjFEkh611s9kNWe2QRq8rSq7+Cu6
	cpqIC+S6IkWoaLkLtKAg+9cP1VWMbpVj4vL82bGThZUJvV8u002zT+1ygttncp8ac+weBr3RpQs
	31q9/4AGSFRSulM2QFcAqnoB4EJH+16+denOG5EAqJf5vPTqGG2hBrMp33Abu+qBERmQ4X1+RbY
	qXYFzM2c068zLepbInYLBYuWmQtB1xSDxliF7Ti5KLUC6xafHXe24Z/1HK6AZOm6KyEc8CYsBzU
	swzNd5qnR9nEAG0+tmTDFa/Nv0aC3O9qOpQuxFWtWl5V7JJ45JGqSVicBvKbKz4Olk5Blfqr9C+
	35HNZdngMMpBgHVKbSwWrnrRs1+nRDRKj1g8C19TCMJmcV5JhdMMA1azFppwB94pShvJfQIrBCr
	3ECl8RBpvQP+AC0OXzm20PpO1CXmaN20E2KVkJODinFtwLvWA5HnCFzRDaQF9slJVGm3TeKu3Dl
	eumjNdtxDJhWLCB7SKDfrkE=
X-Received: by 2002:a17:90b:4c49:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ad86f1bbfdmr3893053a91.12.1792656310889;
        Thu, 22 Oct 2026 01:05:10 -0700 (PDT)
Received: from [192.168.1.222] (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49544f1sm3092543a91.16.2026.10.22.01.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:05:10 -0700 (PDT)
Message-ID: <dee32e53-babf-4826-929b-f6afabf64d7d@gmail.com>
Date: Thu, 22 Oct 2026 02:05:07 -0600
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
Subject: Re: [PATCH] dt-bindings: soc: document Casio fx-9750GIII
To: Krzysztof Kozlowski <krzk@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org
References: <20261022063902.471383-1-artem122novak@gmail.com>
 <d6562416-05aa-452d-8fe5-a68cb8f50f01@kernel.org>
 <87fe0b0339e6f8763b9b385dbe8b8b5e587deebb.camel@physik.fu-berlin.de>
 <b8c7db3a-ad4d-4378-9e50-4c8591b93de8@kernel.org>
Content-Language: en-US
From: Artem Novak <artem122novak@gmail.com>
In-Reply-To: <b8c7db3a-ad4d-4378-9e50-4c8591b93de8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good morning,

The board Device Tree is at
arch/sh/boot/dts/fx9750giii.dts,
in separate patches though.

https://lore.kernel.org/all/20261022063936.472520-2-artem122novak@gmail.com/

https://lore.kernel.org/all/20261022063936.472520-3-artem122novak@gmail.com/

Thanks,
Artem

On 10/22/26 1:33 AM, Krzysztof Kozlowski wrote:
> On 22/10/2026 09:27, John Paul Adrian Glaubitz wrote:
>> On Thu, 2026-10-22 at 09:16 +0200, Krzysztof Kozlowski wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: casio,fx-9750giii
>>>> +      - const: renesas,sh7305
>>>
>>> Where is any user of this?
>>
>> There is a Casio calculator community out there that are users
>> for this.
> 
> Upstream user, so any known upstream open source project using Linux
> kernel DT bindings. We do not need bindings for non-upstream users.
> 
> Best regards,
> Krzysztof

