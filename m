Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF5F3557F3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093768; cv=none; b=o2aQVuowlMOlcwVJ6xjVBtmklnGRsg7o2bihXg9eFqU7ImVGp89Ce+839mh/GwemXg7tIleP9639u2iza0hA7dy1f4kZSqeGhWLow4GbxMZzsQdhnJRtVCmreopqNZX8zU4XeQoFqfaonb79iMgY0aEcAyiJTtZYeDHCFMSpMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093768; c=relaxed/simple;
	bh=xDP4B7mw892dNXuydjebaSYfnUlxKAVOxXrrMcSSew8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeBCIG5+Zli+nk17uWpEpviA1KgbL1qYctpZAuaLacok8Bs+RJvEUOjct3mdb3mdogAUdyUzkPQT/igdcb9eW/uTk7ObJI7NiybTRSbLEo+8DYtre7ytGMFVYBcFGIVjl0KsF8rw782iZsAqrCB9xHWo3QD3r5szX8ycRDbKZ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKN0T13m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKN0T13m"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso15232715e9.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786093765; x=1786698565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjSX3DSji4nKkqVPKbNZg/lqBAxi+8jNL2xKHv5aM18=;
        b=NKN0T13mvBeL6SHKhh95L1vyzJONd4/yguQzbpAIQAhaMPvuAG88vzPNRlhKGNArjF
         SWC7b+CF0GrS5wkap3vC5lrWacIIn4HNElxdfdi5r9uptV0t9JWK6pwIQOIDzXGzzkyM
         qJZaeVCMm85VU+aHpSHXZ9OW8x8ixs26GWwxVIYESgHy+keIzFx0XxE49AXXKL4yHz+6
         k3O64khCV525KKXMjf449cOISAdV1NFQ4dGO+eDP4UzqmjnF4Tb1MZ9GXXiWR+ya9vPS
         uEUua3NE9YqoD3DPor8p5ClTVh376cD6xqn3Oa7gTvmHJcDgysvpilPoB7d7RP5RiPUN
         +Dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093765; x=1786698565;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjSX3DSji4nKkqVPKbNZg/lqBAxi+8jNL2xKHv5aM18=;
        b=ZC+3z/jnBohp2u/T1+LkQF4gsZEtvQp8RRwN4ENRBBByLBRhSkonJOK7PITnL/KkuH
         uAdc+jwpnOIcWZ1ovDmqfJWg4GIkwgw31Ize5Om0VuLzV3O8NfZT+CwQosCsngaeXpjC
         nq/gHo2iOyM4NyJfhKwuFFQsVrCnK9S48unI3dTaEIYXz2Zjr8hVPyNeYoIEgABVuLnR
         p3RrtVPfI1J05uIAULSIlewI6tcZiMxud3PX0DaZqt6cS+23aEND56x+8QlRehq9L4D9
         afI+RdxaFO8MPCBzkA0pQzHCHzOgPoD5NZFsFf1dQrCQ4Yg87e37oGh2u2obnZW7541O
         5ZrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFcJmCD5OrZkdPcSfqurT7CaQ5Z+DM4fgDYG1UUCcR/trzdkLoxBtsxDX+/gQMCnTLQNOLciq3pN2I@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvgL8RNB+kcHv6XmQUOjoEeAzsc/epsR+Mf3tOkRfz6FLQ1Qa
	Kx/uDazbncteiAvm3be3b3ifwJs8/Ma9Ej88/TO9RFfv7W71gPqCWT1OZfckebQ7Eh0=
X-Gm-Gg: AR+sD11SrkUYGHuaQ0DtmV9UKDDDaA/cjYle65cBeM4x6B/DvvmboK5vWkUgJ8NH9Sj
	3xbI0JvwVd/HTbUdkjVmtcbwROy9epgKiYBKf6rHYCmuoa8oTA7NUbfsO8u11mKvQfZlKH6hygE
	8yBvHdvrlCZJKGsC0CLrHIgS/tque+FeBdS3FVs10aGD1vwbVfgCPtmmugdzy8aWpSmon6hFOdF
	5+vvkdnuIwtJqRRUeP8voFCRAhbfaOcY/NJ5NOphxEufM9ahCSk/7QDObyI9XxZYrhlrnAHLZgz
	YOSjRzyYoKsjvkxmS/b4Di8wB5djEvUL+26gCUwspse1MwWbJkSHg6CnR60YV6QubjQqAv6Dajq
	xqK8Rxu0Pz58H5Ke4Xv5W1262/OjsUGWBIfld2TOzLiJw8zmle5NM7jgiwLGinK0XDP8cZv8pz9
	etQa3btu8h7xxXVasXSomzccYVEhEDm4pIb8Br8FH8FlSKxksWGmDK9/Y7k3c4JyV0PMmuRBr2
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr282890995e9.11.1786093765114;
        Fri, 07 Aug 2026 02:09:25 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.30.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145966sm3871692f8f.5.2026.08.07.02.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:09:24 -0700 (PDT)
Message-ID: <c3cbebcf-19f5-4944-9e20-04dbb442c4d9@linaro.org>
Date: Fri, 7 Aug 2026 10:09:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <Ji-6adk9LJbP87Y7X6SfOcAyVnGpO4dbHk0lBikX3NGAPz3dynWpvL8QjkVM3G3jEnwTrTV0p7nOqBxPRaH0MQ==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
 <43327fb2-0085-4d86-b408-8723d852c258@linaro.org> <anTgZiqnol4226Le@venus>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <anTgZiqnol4226Le@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/08/2026 20:31, Sebastian Reichel wrote:
>> This looks a bit funny.
>>
>> Do you have an int method() {} with a final path that returns no value ?
>>
>> Tooling/compilers will definitely and rightly complain about that.
> int function() {
>      ...
> 
>      switch(foo) {
>      case 42:
>          return 1;
>      default:
>          return 0;
>      }
>      /* cannot be reached */
> }
> 
> Greetings,
> 
> -- Sebastian

Hmm.

The LLM tells me there is no compiler version that will generate a 
warning for this.

Entertaining overdone too

"Across compilers that will ever see this code: yes, and I can now show 
it rather than assert it — I installed the spread. gcc 12, 13, 14 and 
clang 18, from -Wall -Wextra -Wpedantic upward: clean. Then the decisive 
one: clang -Weverything — every diagnostic clang possesses, a strict 
superset of any CI configuration that can exist — on Sebastian's exact 
function: zero output."

Meh

---
bod
