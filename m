Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589903;
	b=P38QeV/2pYthO00Ii+LyNn9hGi1UmwaTZ1T7+GaxWQlEyjzqB/SezIP1FC4NvnVdVA+x
	 pRKt3/6XrxW6sRKN4qJE959NW5IFcsZjdhMwBZ9vKpOStcLBh1Muu4e/rQIHbH6gi/TgK
	 OWwRRUOshyoNKYLBuLpFXB7ad/E55RmEXFXYN977aZXBdoyhzneGwU2Eboa+H/P8IVRB8
	 /3kwLJy/wpbrp2DOdorxM2kQYb7se6io2bU/V4725SrnO2GSV7vFlIWHFmfHndoRJ3X5p
	 bWqCmXspqcBsZKoLndLPWm2S+JQ5JwDat1eZdiexcoPrWxcimL+95LG7/YNkSZpQIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
	b=Myt47jhpQj6M+jIittC7zALJp6CLV+E29IHvkXF1pcx9ykYk1/oLsSv8Ltv5IxZV1moT
	 lCE9lzoPiE02/KpLeUwBa/a8SvPv+3ImDYg6S3rmwF7Q6c2AXaCu7DXjpn6Eqoc1Ipb9c
	 e29cAJb8J/MT8sdxYtR4Dn94ZlxIk9zqGjhdD+tqLljkRkqs4pJajWQzgeoXJgh0y0CPx
	 rfGMirAfk5S02JWy4hIM5OGaC+KZeBJKV84+koe4BXk0SerLddPuuOVO69yIRXSsK3yqZ
	 YG4E3M42QoPPkXuTHCjm2xOcMAj3dM5AyTspal+CWsPCXfAmsaOE3YKUDYzderZiV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUrMkkDg;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB3606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 03:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BB3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUrMkkDg
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6debc457754so1346277eaf.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 19:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589902; x=1794194702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=cUrMkkDgUhZ2oFqr/ht1C6GIkzL8jnOecTg0iysKs4K0V0mxwdwyXY3xWu98lZpSNJ
         Jnt2Ef2rl+7W51+MUtYfjfKGW83QauEE5mW42k7QWGOCmUVJch91o3ELG9oKSGA7S95u
         ALxRO73CswZIVDGpUX7qrCJ85V/7lapjCoChdK3be984hrVvQ/StzgimZbrTUpKQOfbK
         3SCKaRVR2MopzLBJSiozfI3ZYobPcxXpK9/M3SDTeeXMMKnfvdLBZMvTZfdKdV+7cpWc
         NrXXlzDVBH6n5L03Pq6fmOmZirWYuoUEVYULgrxD+sVDuTHBKcFzH+I6oPit4BX4rYXr
         Ozlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589902; x=1794194702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=qgBTbSs9WGoANu23dC27CYRgydlfev4Fwl2FJvGUGi5vXreXbA6g5fT+r9qo2EO5tm
         u6ytANq635KC7pagKo7Im4YV+EeoTUJGmeS42tAAylv6Zx0TSS/iSTOHxCanx10JbY6C
         eOiY+OvA4tg8AjTBKc3C2vzWKH+UTJ/0YusSciGBBE/EsMJgXBGCNUumukszv9+tJ1rJ
         WKwCyD+O3o53JULxgVNiLW3zAKJaZSRcmqXiPJ+MBzykr3VXCN7RZM2oRrphkd/PuCSE
         tpMXf5fono+uXWBB7rZu7MfN99soYVIyFQvm+XZisaworbSo7LN+CThyA2p6x6MvcHgj
         6dVw==
X-Forwarded-Encrypted: i=1; AKwUvBxTXFcm5/5S84lv/B3MKWagOwepQepuhb+TnRnU8EkIIWc/9L7mSGcwCQfw7iiWnNmxFM+hUSfpvwUK@vger.kernel.org
X-Gm-Message-State: AFq9FYLD+a4kZ7T0Bparkov6O+NBJupzXKPCTNb2MSTb0/enpXZekJHM
	9ShnLelHVjnvhKrwq8bS3B2LpHupy5TayL+NcXVPb87t26lZFm/7NczT
X-Gm-Gg: AYBFou3ZJKBHxNVQJJQ3xyo3lpxASuWNuIpUknV2fWaDWkWK2gAw0bwVmqzbnE5+yQO
	kKq1dkCGPUlKheGR0P7iclnp1kTkmkiSD6SU6qfp8NAN/E84FdsMHOEHWaOCRVGCReWBVmujefV
	2FgCbSXC5MRgWF/8SvM+sdMgy33UHv2gby+rWPSdQG7nIhep3+Er5CShVKK3HeT0ykc2/hhT//P
	oFY+QNNAeFXyCCTwBWhwX13H1oLPFpKYLNBTui/eBr9h5bO4pkqVLBWV1A8l4KNL29zXXZfL+v3
	MJ1cwlcir8c2csaHNUrnKV6t3UtMHS9MeOMRm24L0znen8O3HfDyWAUuV2DJuggKIe8CH3Zq7wQ
	EL9d5Sl46psI2c0ZrLT3TK7N9tijdYwnAr9ibTXvWb3yR7wfKt62WFEid3TlgscLNzE2Uh46TA0
	91rL4Yez7zJHbOTWWYrkt2E9m7Fgkh2ZE8g0yiG3hinfXp7afXnNuM+u6VF94Q2AFlles1C/3li
	jrd8O6KWL9G4zYJ7U74KFucT3Uw7npswe97TIoSWWkv+NB+V+p6CCFa/SMV+PFiNIRNnCzNRxIU
	O2LuAWe1UAy+oOO769I5tvS31KOd1cAmPslnV3Lr1zSv
X-Received: by 2002:a05:6820:168a:b0:6f3:6cf9:f182 with SMTP id 006d021491bc7-714f2480119mr5364303eaf.50.1793589901912;
        Sun, 01 Nov 2026 19:25:01 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d35499153sm8255830a34.9.2026.11.01.19.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:25:00 -0800 (PST)
Message-ID: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
Date: Sun, 1 Nov 2026 21:24:58 -0600
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
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Gentle ping on this one. It has an ack from Rob and reviews from Mattijr 
and AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) 
that I'm posting for 7.5 uses it for the volume keys. The patch should 
apply to input/next with a three-way merge. I can resend it rebased if 
that's easier.

Thank you, best regards,

Ryan Brue
