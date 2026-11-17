Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936924;
	b=K+CY1LH68nSfT3632VF3sSZDE+7sJWoJ4bE/i4fS8Ay37QndsmVb0tcoBOYC2QokfTVX
	 MZ7La5BFwnASyNSj5glEJdQO4OHNpxDmjyrtJZCl9PZ6/aqmghr278PGVxU6u+uIYCqYx
	 NY3/rqiYt9xWS3l9jbKQbgi/u7Vca7IbkMJBJmGaVNowoZhf1NOcgoBgzGhfDdb/lFfLw
	 qRi/ytPXszNgLFibmiQKGbqy9HlkaV/289UiVxhSKpizi3deFZ+PZmli1MQk5XvMGZ6RO
	 FM40NC5wfYoulWSsV5L+aF3fHfCzlzXpUxJFg+nZJ1wv1InmxMXvFxI+/eNr5aM0Ecg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
	b=XDitWduOI0EXlKSrkJ2cE+18XP8AvPCDRS2h0rOnOeXNgjJ9ArV87XK4L/3Djo1F8dGF
	 11ha1DrqxhuZdUXcSg3wutto4hEpJ/xYzXIHR2qm/aBOX4pH07CCnO8j6X5U6QjnKrL75
	 XGs/L1QJxHmhtvNyEcoEr6432VZh8LvBtKb2JImoTtfDKAd6zs3kgarhTtsIwVXfmSmj/
	 1DqSabHoN3V3owVnEK9wZBZ2tMTV7kQ14BUm1xS0nKprpF90yqghOQEjrzBaPkyYFQlm8
	 P5vxj9qKriZqddy/xQATQOB5vsND3lK599heKtKgHZL9DN2kKfDYueum8GTs2OrsmhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYwZY+rj;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753E60A2623
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A753E60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYwZY+rj
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-862aa241d77so6283a34.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936922; x=1795541722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=NYwZY+rjroQjkCW+S+pwjlaO1RVFDDHzNFUYWfiPpc2ZZOOV+GLWgZS5C4tNtKgcTj
         R7+XKsaXt5IZE3jX+ON0+nMrNozdjYFfqWixuKZONperUFZzoSwB4v3eI02n8a9iyl6d
         clwKBwSDL1EJf9jFrwZM+AUBNcW1GKM98Uleij51X8ZRZRvx9PRTOovTfIWHtMxZHIsI
         ssNA0bcVyUQE9Nr+usc3Gharui1AwC64uf2TGdAVLHQOte88iJkOL+pIQ09CM5oiZJ1D
         e2nBTUhrdkHfhieASi/MxHGdZp6qU2uW8WbDKDwUjJ0mfwYZ/HAdXDMc4D8bUZsBU/6C
         qYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936922; x=1795541722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=1eD0PyevITgTY50pwcmWDeYjAfOWYvIIUBVKmyuYH0yVHlg9AEi8tq+O2EE2/zoFe+
         eF2Ha2N0TgokJoiuWkOjUZqys+LbZLSZopFIRUgV60rGkcSnmbPKwhvqhoO/+bqi/3sO
         DuKak1h4xfCLhXzjpKNsBz+A/4MZmtdtDl8tJ6M0eI1VrQRtNuZCIceet02gNl0aFbzv
         QZo+NnDVfDMFtJLg5THo6LOnuU6gfdNx6iGhKVn5ZFg4LsdU39PVyKFWQDm9ZTN4Skv7
         fkv2PsUcPIhYrq4ebk28sc8YYUKlX5owhmw2zs8lHK6VJaO1bPz/JPnT5Vqifna8btx2
         /m6g==
X-Forwarded-Encrypted: i=1; AL+hErHO+b5EilBVk0089/rmjkp3X01ok5IZKKUus92itSuXJpo2s+md+QH49v/9p4a9nIknq4cnanoBembI@vger.kernel.org
X-Gm-Message-State: APuU4Z96XUqA3ErAw4wN60WCVUdbCeo4IOYaF54dUONrt5eyKJTGROHT
	2YepA7aczJ+nX0o9OBRQ7jxjLMuNHS5aBwH/BhKRWfC2mriC0SFYTOwk
X-Gm-Gg: AYBFou0+EHUswv0nsNYLiWrsS0+4+BWsYsrEd2c0pi98JRTBvcn8/Ccb/fDHosEwBEV
	aP9lW084hiyLaxhnRkI8eKRVxWs0J3gbKKTsu6+J5QaPZXudMFgDYAg5TKPffrmWVvgHvoIaElx
	6/sOy4NIdyZZIKQwt4Od1rlW/DA+qism8ztgd/QX2X+C3m246ixjQLUTd4cKM9/73MlNVktkbMs
	Hs4vRDfR3LmW1QfvDEFmBLN3o1GX08uFkaFWwpVB2oxwHSFZuihjeLjUBtI28jAw185BPR8biep
	pMg2DgxrtIM0VZTUMtWSjTeLB9Qah9pZXfwFRLtJ17pRVp/B/NpIU+HZisFtOWCDPUdMz7WGIGR
	b0upixLsdckOiz3ahu5AnPmOSLvFo1a2hxRapFy3Y4fOuA19KRmXzEqn9pSEcYKZKZdmG+dsrhS
	fQKFf8RqlBGHBjFruxiraObEPXq9kaDXFTfOUiBX3xtpueGfgvi6DUva/LCipT13Qqv3ULg6cbK
	w/7R1LC1wEPYS1gxNFzvPpWmZB9UXu3fyYT6b/K1PjZJ7XsJM3S/K08P1uxppDq0Vr1CXJxJ0L6
	VIcm9tDnPwEEjXlc28wuaS+i/Q8FzjRUO8qs5dY1+B3Acw==
X-Received: by 2002:a05:6808:1925:b0:55c:888:30ff with SMTP id 5614622812f47-5774240c0a2mr429178b6e.45.1794936922568;
        Tue, 17 Nov 2026 09:35:22 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70bfeddffsm190834fac.4.2026.11.17.09.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:35:21 -0800 (PST)
Message-ID: <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
Date: Tue, 17 Nov 2026 11:35:20 -0600
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
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 11/17/26 5:02 AM, AngeloGioacchino Del Regno wrote:
> I reiterate - I couldn't pick the series because, of course, that one 
> depends
> on the binding being merged, otherwise the header won't be there and 
> the build
> fails.
>
> So I can't pick the DTS until the next cycle (granted that this series 
> lands).
>
> Cheers,
> Angelo 

Thanks for the reviews, and for picking the binding and keypad patches.

The AUXADC series has already landed. Jonathan applied it to iio togreg 
on 11-02 (the binding with the header is 8f809aa84698), and it's in 
next-20261116, so it will be in 7.5-rc1 along with your tree.

The board only uses the header once, for MT6397_AUXADC_BAT_TEMP (1). If 
it helps, I can send a v3 of the board patch that uses the plain channel 
number and drops the include - it builds on your v7.4-next/dts64, with 
only the binding warnings you mentioned until the trees meet. I would 
then switch it to the macro after 7.5-rc1.

Just let me know if that sounds reasonable :)

Best Regards,
Ryan Brue
