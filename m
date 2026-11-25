Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645581;
	b=rCUwrKm/H7iIeEIbaO2Xb+XBdYddiat3WgCRQ7s+/ekC1Ohmj9vkVSPlASAmlE65gqrQ
	 bshdSxiGWCtwleti6j4yDCo8rngW5m9zv5qzDQBDck5UFDphhCBV7lnX45zdEVHyMo2Ya
	 FDFo2eU8LsoAh8n65DWc9uOWlqtPZFziQQWqzWpSFvLiZYoieQUJfPlCOWdc1aKZ6cWEV
	 2Nf0n4dEMs77/yakhHuJtkuoPcTLZSTFDuql0ZZ8tnhSXUtjBVI0mKRiyKWo2gfq7FayZ
	 PBAYQmaDV2u8YGxH5QuQtltdBHKFIfgjdbU2x9lvaZwhos7Kzn6KjKx7aOHoamxLs4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
	b=lPhc+Eku90FbWqP5QRkuDc+ALW+EEAprDaZD/BB2rwHPgZJ+zRP8Wb7pjsfQL3TYlAN+
	 aDc0fYnVAnXRFJ9Xf9MXXerVQ/sgOy1fNB/dNy9CT9GVgPr1JWAe8Dd1t5f3IGKhdbdj0
	 QFVgdIbqnVN/Ry4z0JbVPZ0QtZ7n4MKYCCasC9OFKcRJr8r38yEoKuOJMsDYZ0pLmjCnx
	 dM6r0nX6GsONN2gXWAb51GRP9sJY+F33voUK3a6huLWfOoZtek1845cm12tUyvy5XEQPW
	 QJYjpp6nCeJjkKpaGcQzelOVv6sCofkjXs0fum6VwHROm0QzQxVEQObjFxR4HgZCOpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fQ8M0RhK;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A907606A337
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A907606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fQ8M0RhK
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49465892f7bso4601902f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795645579; x=1796250379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=fQ8M0RhKyNOOnGhbnCuZJSsdvS2ywplR+VJH77h36xzfLAoT3Sb1fcj39NGzdN7SOz
         sHINKC+II5V6KVhG5xSsQJ+Q8cQ0XKfaWd2nsThoPDyslc8HBUSckEQtbdCd/PwLHJ3Z
         eoY4Ake1MX3eat1bX1YMIQouIi5ote4mChiP52hP9yjC+4/zKuXTCiFvosNAwEzpKd1I
         2SLuDdt8vTCG0NePsvFu/VNnU7BI9lO2NHQwIh5qixP9Smnv7rWosZSCrIcBVpOXS6rc
         NHCTmFN+St5noQPvtCFeT7chk3Lwp8CMF4+QvhFsJ+CKCJbwaLZ72oft7IRQZdbdsBry
         CXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645579; x=1796250379;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=kiV6RSeMQJXh6Hiu5oXuC/FP+ZzjuiGV9aYXTcxDWg5mkr5P4jKcmZUOgxbVKZpTsV
         anIgwdZ+MaM+DtidKlIS0JGcdMmmIAbxypwE2hDJDa/L2Z3HzjXuNXqvHlovlc9Btgo5
         wJqlh2nCgme64MPoxKt0M5mK99rMGg8IoMygH2EbO5zx6k5q4ukQB44AGccoSEk7CrVx
         qIIRbNZ1kKZpyuLSaMAiAaT/rHh+HEH923gVm4N0TcUzxQJytFE8UuoVMRb6bVt46Uti
         h7MAS2HiYL5Bg5bE7b7Api7aNLpxn9kBXuLfTWIy9328vAUEM4iPSbMnzN2SPEfH6+BE
         2eJA==
X-Forwarded-Encrypted: i=1; AL+hErF455+iKl+Dbwovsjg8CtjeqCBZS3gYME3ID1CWP63/NQtEPcDDe73LtIqzAsRwpAcbtXVLwqXuYzfV@vger.kernel.org
X-Gm-Message-State: APuU4Z+i5YOM7iAoOp5RUnptnmu5tcxLpRT52P3ceO6yDQ0aic8JwpSZ
	wULheQne3dGzMpLfwLG4jTibDLcHR/K6AqSIZXLpwNJTHG9DQ7ECCEgix2lZx92r87M=
X-Gm-Gg: AZFdTZeH2hm9+PPsbwJGRR9DwlmPY1V+Qd5apebJCNLsHVr5uhgHL4eTJ+Yih+lPlQ2
	Ac75HhbNubirjXZe3q1k5P1xripx0ZCghckCJg1YmLoGA7kDNekhrUvYBfBF/MnGqLHHd7fZ+Nr
	3k86fHaBb3MVV33tkRJybRxcLP9LHw4dFObkkTBT++kwEM0GeXFk0HbVI8+1nlvzivaoxNooqF2
	76wXCaUTLmtZWjDS12hInp6RkJDx9p0MIWyW7KjyXR9jASZHNYzZ6lC/xPwgijnw/7Jrghsl7fP
	1xTNg6SltJuvXTbCBDXlsGjaG6sYwQhVnwhM4uUl4zltACazMXh42TTVr/oKB6I2CTCsphdrugh
	DFhPYZuM/frsRQsmRTJTsxkyQToQ0AoP4nSRxpGDr6Mer20qldA8/pGVtNvp3Onz6QV4fjmJLoA
	rZHV3r99NLKxIN7XKR5XnqitA7UJ9+cP/KPgOqtfB7P0G0+dsw0dC2BCbDgdcZC7YcHpE4qJhEn
	NlqcP/L19oLnYoasRgqKaamwLfh1v9S3sPDbYUCBQ9hXvbgTz7L72TSfrNE0wJypK0ZPlDQ7sqR
	b9zgOjyLH4icb1V5D1UoPSoNlPw4J/E=
X-Received: by 2002:a05:6000:4616:b0:4a8:714:7ae2 with SMTP id ffacd0b85a97d-4abb32a3f61mr37314572f8f.29.1795645578997;
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Received: from [192.168.3.100] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm35684687f8f.40.2026.11.25.14.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Message-ID: <baef27e7-93fb-4e6c-8df0-8cd74b9aa533@baylibre.com>
Date: Wed, 25 Nov 2026 23:26:17 +0100
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
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
 <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 10:21 PM, Martin Blumenstingl wrote:
> On Tue, Nov 17, 2026 at 12:06 AM Valerio Setti <vsetti@baylibre.com> wrote:
>>
>> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
>>> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
>>> [...]
>>>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>>>> +               return meson_card_set_fe_link(card, dai_link, np, false);
>>> I suggest using the "audin" prefix. AIU / audin seem close enough on
>>> all supported SoCs that we don't need a SoC generation prefix  in
>>> there to handle this differently.
>>
>> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
>> compatible?
>> If so I'm not sure this is allowed nowadays. As far as I understood
>> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>>
>>     "DO use a SoC-specific compatible for all SoC devices [...]"
> Let me use an example as I realize that I wasn't very clear:
>    compatible = "amlogic,gxbb-audin", "amlogic,audin";
> Does fulfill the criteria (as far as I understand it).
> What doesn't work is "amlogic,audin" alone.

This is the thing I'm not sure about: "amlogic,audin" does not seem to 
include SoC-specific details (in my opinion).

> 
> The GXL example then would be:
>    compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin";
> 
> And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
>    compatible = "amlogic,meson8-audin", "amlogic,audin";
>    compatible = "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,audin";
> 

Ok, so if I understand correctly you would like "amlogic,audin" to 
become a sort of alternative fallback so that:
- meson8 and meson8b do not need to have an "amlogic,gxbb..." compatible 
as fallback
- the change in 'gx-card.c' is more aligned with what's currently being 
done for AIU.

Is my understanding correct?

Krzysztof, since you already approved the dt-bindings change in this 
series (1st commit), what do you think about Martin proposal?
If you don't have anything against it, I will add it.

Best regards,

-- 
Valerio

