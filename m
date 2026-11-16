Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870405;
	b=ZApLXQaotDhqZBgcKNwmqpkc215TyGFLSN8I4orXEfRV0NvaOCvCLnRMiXNX1MV2wHnE
	 fnQB6UePUesYyM8EbQBmSWwqi002yOtXD/lDdOwsYVdVNOczMU06b9Q7C+KeZuisUaOV8
	 uLikr5AulhGv39RNLsRkaF6HV+OdxFKhWL4mpcVMjyNa0dcUf1n95eikxJDNTNUbkr38a
	 Dpu3RIRvhMcz6ZUVTMxrvQCb2DcWuWGFm2N7KSpUIly/NmL71zn8BlRCZqlYjDMJN2uMK
	 nOhpI4SmWTe0LSENfp1hT9hWL58wNwg0rJaxRuvgmEpRE517UZkJsiGqoW7wUnI4Ozg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
	b=hPpBZx9a+JRl2QV5uFCNT2k4mCIUDma61g/BZzGBz/ZxJfthFXe9Ls32D+VFHKO1yCQB
	 psLvBhqmis/OpRmoyZ7oH9GGzB38SsnsPyw+jDm3SUvjywB4+fNd0aiiJj10GENMTjVH0
	 2LaOWr74HljXF+0UbHjw3mRGR+O5nszKaq6s0dhF1hRH9/UT6Ktv6OcuoJ08+d4eITjGb
	 Q18FuuCka3N7hL3QCj3MCROZK93kNqGC8gALfKs4dUJP9JxW2Lv4eY4iVjvxcGRJ6Ty+G
	 CZs593I1hzzIoP/hm1goGwM+rLxSRPCt++OYCqDlcOiJb297MBPvWHXqSdkSWVM0FgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nUPwfzc0;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25971606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25971606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nUPwfzc0
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so325404f8f.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794870402; x=1795475202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=nUPwfzc0SJy2NglXAMZADWXP3O5XbEar5kuQ3ZaYgCEL9BAo9fYukYwP3StBnAf8AO
         zLsw2M5YP1aDg0Tm7JVz6VjqXm6NM7cJdngFa4ZpLYB7Gr8rv8yt9NBOWvIqBxn2BWgM
         ACXx/XnBEa6oBhTILZAPLYtCUBYhnVlNiKjdZct9HzpMg4wkDKQJdA7gWNc59NY/X0xE
         FOPLomTGmQdUgXh0st7q+ycak/5Xr+kiEofhqJrrex1EhPXFYwGcpaVFnx6jW5ul8Y5A
         t/LB127BgKZw6eSCvIbfCtvh19aubqbrjS6Fvb7pPKdZbjf3CuGwYi+LwoMX4RbQjlqj
         02Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870402; x=1795475202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=wHK9teQnYURuAkAniwqdyoy+n6eM3ODmCw64BL5YJjrUHLAGYrbkVUQMnApr1nR+tu
         rKqHPV4XkcAvnGN5+ulpsQriQvvGx7gEpdTirqdRYiqDbRRjjDPbF4BAG3q9jHIdn7UP
         Lhk3UArfKi88r/8Xx5ExthlzblOuTbA6RRv1qJQfaLJbDWPo+8IWZ9outSOTjHBkjYYD
         W2rQFuV1pMdzSSR3SRSPozg6Y02+9728zury5o3KVFadwiSsEZvVoqcmoDaCvdj3Oh+B
         5urLPW7eWRLQJmp44zFUX1mrLg2ntfvA6I32u7NFTuFLjm/2B5Wa1XvAJfjKNQZK2psG
         Zd9w==
X-Forwarded-Encrypted: i=1; AL+hErHbpDHksnAM9O1IwZQsfH9Eua5CilZSeQIJQH3VPPwqEY0lLkB5q1eULK8zXVFaZLkdVEKVBiOfq7xW@vger.kernel.org
X-Gm-Message-State: APuU4Z85v026ombqdiG3l04jWp0teNUeabLK7qhnlnVwhGwRNk7VVDyU
	CFDJNk401bpS5rX3mlXFdLjmK6ry/oEGPAUjhLffbkLRpZGsCtKtknHN4gpkZOrf1mg=
X-Gm-Gg: AZFdTZe9vEwCqWtih7DIcbYa5DyqXett3gffweqCrSXwl1ViMsEvCD7DzgUQ2c+n3Lz
	XSS4qO0Goj4UNERFcb8Ztc1nJ1tvjCJTMXptrHOMnf3QtnkLA3t/UHtq+OXbRXhaHCYKBD4lz5O
	OlgLPbFCjroXeWuRCncthN7mK1xx1mRk7hlPbj2qoChgYgPYcrAL9CILwHIoEtv5lUfiKNeILmg
	CinGSndPhoTbT7Q+g4yhiZdmBGJbrq7+k01ccgkjNu/QJERi/Ghe1S019E2HZyzO2uXm+eYnPNH
	q7YAjbk73YfmqaVHKIoKRFkls2UolftHLvZYgWc4yU/aXWJgAd1OcCslu0D9fAShSar1skCT99T
	awYAib/qUhJopbE6NxeNSi1h3Xke8ccuQMFnFcYKbwBe7NzvSg6pDmbeH++ZQJVZgFYTRZzUTrx
	0ChRUMiWOczq/vZUiVcpMVrhDFZ1bmOmXioElZUdpaDv02bPeAZ3ea/gb3ZkFhw0EWuR/DFsGHu
	Vld0NIKt6tuKNm9PiwE6A3P77VcnBUqfZ8QKlDKkXjl+QrC0oGbROPN94IAUtMXP00g44c/Z2Ng
	5rbyDJKrqPBqhnMoUHccmlrW9C8O51ua
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr27070236f8f.9.1794870402452;
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm24359908f8f.18.2026.11.16.15.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Message-ID: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
Date: Tue, 17 Nov 2026 00:06:40 +0100
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
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>> +               return meson_card_set_fe_link(card, dai_link, np, false);
> I suggest using the "audin" prefix. AIU / audin seem close enough on
> all supported SoCs that we don't need a SoC generation prefix  in
> there to handle this differently.

Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the 
compatible?
If so I'm not sure this is allowed nowadays. As far as I understood 
"meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says

   "DO use a SoC-specific compatible for all SoC devices [...]"

-- 
Valerio

