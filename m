Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352700;
	b=1VT4ihqSxVuYFQrkIUyyXUs7gzG5LLrJnxrAcNN/1duhkwGjPm3+5mfqfPN4HBbpmy5R
	 l6Of3A6FQMhZvNuw/CW/jM6bPETG/dAD3pljkN/Xrqj0MOEzLsR6d/7SY9t2cYfixIAAL
	 w3w3lQqcVWrDe8mvnFLKwqBSOJOx9plmXfcXcfo7WByIoCNuC4AaUR4kLA6mXNhGs5WMV
	 C6L+TjqhAWoFdH9kAUmNXcIo94OQPSwxsMUwFx6lIQzRfgfUyaWYSiND8LotWxyP6lFQb
	 kgyo9MwgMkDEH3EQG9Ae1r70lbl47aNwIXHFkvaphKjRjK3D1BcfvIL/QDJQsrKUexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=snlBWcVy04YTisOteEFLPCoa//+PZun4CMP+J+I1iyY=;
	b=Q+Fes8icGNx2Uex90/+/AUHrYR6xo2PQAaqQmiVvVrPh/PP5YCf2bxIPQ+xWKDWDWppF
	 Pmro2tp936nhCW+M6o7554kmskHery4Dk2RNCRx3oPgtAgvfAPZzYwahaofeooVu3Kf5d
	 xhcWrFJP54RtRB5Y7LhTrFUHBiHgHPduGQ6ZRi2C1KB2Hr9vrSjIwngbxdw+Oe8w17/MA
	 nuwTN4//AihI+ox4o667gGqtOk8thz9qHuxIOcjJg0pB0OoMNZX9YQI1+KqNHnhVlclvf
	 EFlzGiEGrBvLX5k/yh5OHW5ZbH3dPeF9Vy1t9lacKhhECNMEXR/5lO2pk/ZnnPwwYCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pY+ON2aT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD8E606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 13:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD8E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pY+ON2aT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1547245f8f.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 05:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795352698; x=1795957498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=snlBWcVy04YTisOteEFLPCoa//+PZun4CMP+J+I1iyY=;
        b=pY+ON2aTRkuYn+AWOf9YfeLO29KScfa5RyfufnYLPP/+IerMBEO3YZEyGRdeUcYoQ1
         u7d63Vs9B+AgCl1CIDs5xmFuHH7KSP//Twl43Z9gtbSMCQFLuWiBJmEOiTrMGmR5e1+L
         ok2Qgj79iGJEB7K6UO6pHbN21VQYbrMK/Eqjb1i1wuV/vGzscT/rp6ZiuednSzAF9COm
         Ij+THX81FMTeUYUwxbgMdiK+4iKV4VkthIN44KIjvic8WR/wnCQ/MLG8EDcvcPQ/Xe8B
         mgeBSQrfBQ5IkmN8jf3b1Wmxjqe/JsRCMqd8meNxKA5ur3zOGYxFcSVOOTdj8BhX5k4R
         68iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795352698; x=1795957498;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=snlBWcVy04YTisOteEFLPCoa//+PZun4CMP+J+I1iyY=;
        b=cHMkRCjIQXtr9itr/VuQ1VwEhj61SQiEc6i7qAo3ZOA6pIn99cnotfYUepSvVUxf+r
         pQMTfn96ZO5yCuExnJUgL8XavN5+S6Izf1DOgUIEinKVfEsaiQq+M+87ROQutWSQLp4F
         Y8oxeE218kwZJG9zuZPnGhOhQ85xcqa9EUbpUx7QfwShG2iKP3HTj8DoEwhS20F4QDXR
         MGkHcWYp4ibVS22CVbHe34Z6MVxfIo8Fj9xaVcpnCoH2gJ7OIjPeyeYO/YpRCj2Vhoag
         uiktUC8VUtvjnrFFZMs44yqFh77SHMBBjfq3m4/FzFI/OH2It3hpGFFN9k2lUUNHh+pE
         4IaA==
X-Gm-Message-State: APuU4Z/Ruckg5UaYBiI3ig/EnksyjouUJAi0nVjDMc1ESMW22n6arDMX
	ehKTSIjCW5t5Rq+NTHDyNjRedlXYY0npk+rlf4v5epJj1ctTvSJvEhXrdjPPL2Z1
X-Gm-Gg: AZFdTZeuVx7uRpIs3a4Jrc6QByJBXKARszdMa1NtchdpK3nygpFbeO3wdH8h4pyocdE
	yCgq38ZrktgnpFcdiY2eFnKrsTAAVV97OsihuH12sAl6F7p80IjByF/lqQ9TbfFv+ZHgJv02EAD
	RH4+TndlI8mo4WgSxHkgoSwnOraGgP+Rg973f5CztAhoWotfxP2T3lSnk2K4Nd6PV5hEIulBMsC
	0e7Jk33yZ+/+GMUSJpEVnxlvLpmvvUL4R+n53/3BsOYDH07ilSLYlu3z5sPo8nImhmjbOEJ4x7l
	XYUM2nxpasyWalds5/yKClNFur92+LLV2WUvnCdb2l0IFqjpFwRlsckB7EY62mLFl8zb3iWwY9u
	vExzzOzm6XNdqY8US69/UlkA+clTrHTUWnGSXqNUWa8GKdPvUiKfyjCSIm9/ML6Luf5hs0h9t/O
	bh/kPRHCoSzVyUM3UBLC/tjTCES+dEJd14wi6rwKnk9/jrwIDMv6MAKyOd5zJhbLxicoshBqCt/
	SGqs2tgaooteJpdwBz69nNvDIXH3KGe9EhqB8LWz9p+87bGWn2vgBlcGEEBElZ+EZi1f7cbnS+8
	T1XHuGTs32/e9bxBvqorLMUiI0UQo2Y=
X-Received: by 2002:a05:6000:2b93:b0:48e:412:3813 with SMTP id ffacd0b85a97d-4abb400bcc9mr9689267f8f.20.1795352698401;
        Sun, 22 Nov 2026 05:04:58 -0800 (PST)
Received: from [192.168.1.224] ([88.80.252.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm15637391f8f.22.2026.11.22.05.04.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 05:04:58 -0800 (PST)
Message-ID: <b2896e8d-a495-4e50-b44b-2ed8d09ae9dd@gmail.com>
Date: Sun, 22 Nov 2026 14:04:57 +0100
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
Subject: Re: Solution for rk3588 with suspending and wakeuping at Radxa
 rock5b+ through original power button.
From: =?UTF-8?Q?Attila_T=C3=B3th?= <tothsoft@gmail.com>
To: devicetree@vger.kernel.org
References: <3369e728-9af2-43a8-a25f-ff107ceb34de@gmail.com>
 <b5a72bc8-7c17-442a-a2fd-de33b467c358@gmail.com>
 <873c2658-dcd3-4a64-9306-01b3a501270d@gmail.com>
Content-Language: en-US
In-Reply-To: <873c2658-dcd3-4a64-9306-01b3a501270d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Link to TTL logs after using dtb from batocera in libreelec is here:
>
> https://forum.libreelec.tv/thread/29953-le13-testing-for-rk3288-rk3328-rk3399-rk3566-rk3568-rk3576-rk3588/?postID=209760#post209760

>
> Dňa 22. 11. 2026 o 11:16 Attila Tóth napísal(a):
>> Sorry, it was not thruth. Batocera is faking by uspend and wakeup. 
>> According to ttl was clear start and shutdown. But have their dtb 
>> lower frequencies of cpu and have support of mpeg2 of dvd under 
>> kernel 7.x
>>
>>
>>
>> Dňa 22. 11. 2026 o 9:37 Attila Tóth napísal(a):
>>>
>>> It is going at Linux batocera 44 with mainline *kernel 7.2.8. 
>>> (*There is also not going lan wakeup, isb wakeup, wakeup through 
>>> hdmi*),* DTB is in attachment of this email
>>>
