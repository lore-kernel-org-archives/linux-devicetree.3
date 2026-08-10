Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8235343F4CF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389722; cv=none; b=IRo4OMsc2OO3xdjW18Dfw1kwrB+b5kuAd0pTtw3DBwRg8nYnGnqPT6gzKarQhPWaeTEchwH76THKcGUvrDBRKvcg0AHQBNYrn4DuuBswrSfZQgO4ws4x0hJNhwAgxEGKDd2nJNX5TXD4enRallGXf2uMmU6u9uFTVWJj6YK6GPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389722; c=relaxed/simple;
	bh=byp/DGoBmK0QSy7inRGYoZ+tVgEDH9/VqoouG77P4Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtWAglWunpg4jmYOWXFr+usysdFMUUehLrQvV7f0wnXFb7UKuhiQaLes2fpXEZTtZR/HxkC6+qV9IKZHm47CNdJQ2ep+Ilwl1EPQj2SyJgmVHOtyw5TgYNr/mgCakGTZZlTDEgZfsYBBQtUTuxbwYXx3lqy96EFJt8/JADsYHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bq0JnlIt; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bq0JnlIt"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2151033a91.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389720; x=1786994520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6dsTj9bVR22kgCOopy9QSe5LsU/US12529STCamM+18=;
        b=sIxoCX7wJ8GBP+DghKXNM0/Do86noSoHDhiELff0CZhMZSS1PJXAJYkgiivYczet1d
         dvKGVjNRQBOt4oalrHyk8Lk6vqBAuJ5zO7BuJdv7oPUy86fEX4mSy0e0IjlP1sP7wMAx
         Bh0h0161fuH3PX6y6LJ5PRmoBigU5QozxYQXXhk/ZxKGHyLB+dwhfBNMcVbTmE3bL4W5
         kdorjpRrERhjyOzwher1pL+qeXb/uEv7f4axIY/SxZT1vn0xt357VXNyYngZElvQSRkh
         C+eunsV0ibhgJvd4ApoaHThd4feKiPJUgTl1krDQH+SNkVGzRy/kNOSryU/bYrmPmxol
         q5Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4iGYjEkFMMw74X9x/PCXiSde2LPEQOPcW+q2u7YDh/MH+Sw6yQMiwe2s6BbzG+xJJQ8VkKhLvsMFy@vger.kernel.org
X-Gm-Message-State: AOJu0YwepWPLCW9bKNStqACgeSlO1t+4DXuX993onlRLyDCASglmKaA4
	PRcqmVXkoDsq124rzyX7djuLnGc0bka6yzfFN0EM6VvV1aU7tATmCOHotaIfuaCUWtEPzl+BOdS
	c+i2PrTUtV7ZvkHEBaKudj/kT/uwfcuCP6sEV7MH8hUQWSONt2Dnf6fippNvK8myndkGIVJ0xFm
	hMoU2CBOic6S6gdtnqdNoswQUb93MCWeT5CrgCZvUbf9EotPygcHT5EDZOER14dGB3yADg61rPa
	OkwReph3jzjaQPbwGRu
X-Gm-Gg: AR+sD13dZ79kIr0tq4pShRD36QeIsvO7k4OPiLVkvKBkTVRAoPDd8WCUWqSJmF/lKh9
	q9ANMeYcGd4TEYfewe/sRH+/FvzbZ+07HT/9www4Yaz+lmGc1icEGmkNJhAwEF1JmEqvgFmVdXW
	fvkwcoRkxCJ01CCLqZIUWQ8vZuEzuXulU3WpAFy++adjugFXlGIAZrU+jnvvxwTCJzpCJk0nrcP
	+K8Bz0axm2DQbOa1Xoss97bVunP23C0e7PaG3ZWCHGmek6EYe7ka/xLczofqJpJWyeVnaqhfpdj
	0vK/qS0VTICcDzexMU2mvAfovYKY2yRE1VfxnGe2j1sqCcwt8dz+TCMr123Trov4XqhsDDuV+3h
	nOh/VvP/68v/hrgsEnYbXhtmuqQuqEyc0S1smglEnbN8nCzkvetknRjydHxlLugUMwTxk+IJF0+
	l1F9rS5JyTMX74YPJmZWoyi95bhY3u8oRrplkN0tS0iA==
X-Received: by 2002:a17:90b:4a51:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-392cca91c03mr3501001a91.17.1786389719699;
        Mon, 10 Aug 2026 12:21:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-392d47ff5ebsm249897a91.3.2026.08.10.12.21.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:21:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so25400741cf.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786389718; x=1786994518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dsTj9bVR22kgCOopy9QSe5LsU/US12529STCamM+18=;
        b=bq0JnlIt0S3HmE9MjcRDZNLHAOGz9EUChaV/k/4cprgeuAjLtZeSxxit2GF7i0vQ7r
         B6YtqKe5mz45ItUIxswo1jXZzV9HVKIksuaEbc0jlT/oU//ZSse9vk+0GE7jYr0b2onA
         4us/y4o+Z2nI6Dduk0XH0nRVMS8vWIpbzDOfo=
X-Forwarded-Encrypted: i=1; AHgh+RpHrUO2DBPQ6WGb6KqvEE/Z43+lFePDCLzMaTXdEtIL16j28d2zfQAnjon18UnWj14BfvVVfPQtElpp@vger.kernel.org
X-Received: by 2002:ac8:7f41:0:b0:519:ef86:127d with SMTP id d75a77b69052e-52d4bb91b9fmr47670291cf.18.1786389718324;
        Mon, 10 Aug 2026 12:21:58 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:519:ef86:127d with SMTP id d75a77b69052e-52d4bb91b9fmr47669641cf.18.1786389717837;
        Mon, 10 Aug 2026 12:21:57 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1659c1d8sm79841321cf.16.2026.08.10.12.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:21:57 -0700 (PDT)
Message-ID: <d8a54746-b8ba-438f-ac45-5d30492e85ba@broadcom.com>
Date: Mon, 10 Aug 2026 21:21:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: wireless: brcm,bcm4329-fmac: add
 nvmem-consumer reference
To: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260727225311.266596-1-rosenp@gmail.com>
 <20260802083905.3819981-7-arend.vanspriel@broadcom.com>
 <20260810173040.GA2218158-robh@kernel.org>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260810173040.GA2218158-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/08/2026 19:30, Rob Herring wrote:
> On Sun, Aug 02, 2026 at 10:39:04AM +0200, Arend van Spriel wrote:
>> On Mon, 27 Jul 2026 15:53:11 -0700, Rosen Penev <rosenp@gmail.com> wrote:
>>> The brcm,bcm4329-fmac binding has unevaluatedProperties set to false
>>> but does not allow nvmem-cells or nvmem-cell-names, which are used by
>>> DTS files (e.g. bcm4709-linksys-ea9200.dts) to supply MAC addresses.
>>>
>>> The driver already supports nvmem-based MAC address retrieval via
>>> of_get_mac_address(), so add the nvmem-consumer schema reference to
>>> document and allow these properties.
>>> ---
>>>   .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml | 1 +
>>
>> The problem is real but I think the fix belongs in network-class.yaml rather
>> than the brcmfmac binding specifically. ethernet-controller.yaml already
>> defines nvmem-cells and nvmem-cell-names for wired NICs, but the wireless
>> binding hierarchy (wireless-controller.yaml -> network-class.yaml) is missing
>> them. Fixing it in network-class.yaml would cover all network nodes at once
>> instead of requiring each wireless driver to add the same reference
>> individually.
> 
> It is wrong because nvmem-consumer.yaml does not define how many entries
> and what they are. IOW, the valid names in nvmem-cell-names must be
> defined.
> 
> However, expecting all network class devices to use the same
> nvmem-cells/nvmem-cell-names will probably not work long term. Some
> device may use it, but not use "mac-address" entry. Unfortunately,
> there's not a way to override a default in json-schema. So we'll
> probably have to just define this in every user rather than centrally.
> 
> So this should just add the definitions to the brcm,bcm4329-fmac
> binding:
> 
> nvmem-cells:
>    maxItems: 1
> 
> nvmem-cell-names:
>    const: mac-address
Hi, Rob

I try to stay away from devicetree bindings so I am not well-aware of 
the limitations to express things. Just applying my aim-for-reuse mantra ;-)

Thanks for your guidance.

Regards,
Arend
