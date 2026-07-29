Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFC1FB1
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286249; cv=none; b=RcQ2mAcgvwDgLv1a2Uzo3OtTlQc6vAWwRgj4ULHK5J52NBWAj+xB3q3qfEe/NChVXpCu2avCxDVPW5IS/o+Nu01s7l3TEAZWirndN3g8CkioLR3QhlIromj8PJRZ5TR5CxCxXk7q0I///zkTe+1BQGbJ7z2c2GmHp2Ezvw/6gtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286249; c=relaxed/simple;
	bh=qIlD9mEOqJjAyAfl/7xBqlw6j2Y/ZuH9RAaBSHIXlqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSa+ahhWaCAJkYxYYY6/sl3pH7bdN2SeHCqfiMEkG4UxatR1mMldM40r7+ENq7C3WWRyoGLugRBXyNsZWZRTVx722eB94zru9KyIs7JrhPWQTJsSe/ZGFEUdSNs8Nju8XaSkxmITk6kVwJ3tLAOG/6Bvkf0tm6LVmoCrjbURJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5f6Ldnb; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5f6Ldnb"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848595b338cso520651b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785286247; x=1785891047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVZwS8jOvBUyjwgl3DDKvmTYA+QBde5QPL3dY7t7pMs=;
        b=i5f6Ldnb2WMZYMC5QxrGffH6fNvY2a21qjoYCkYEgwAyhp/WKwB+HJwkwQkF0k0FOr
         PtruWrFOyIIQZlkqZTIBSHV1cCOGETaCsruu/ysz4Y60oYwnNigRmy2tY1jkkhCHyawq
         udw/H5xASPPHnDX7zE6EkbTNIqIQqcj1Wr8TOSRNSAMkfFIq2w03km7HqH2hyLHMTkz5
         QMhbhf0hOtSLn12SNTEMEJoKn01D8knN9HKS8apGAkNE9XSGLR7JLz0nZVQCWT0EI5yE
         eNPaXbtt7tsPo7PRmBmw2a9PKPQosKOm/9D9VVFGXNFDmmfiVoJpoC3M4Plpr6h85vE8
         bjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286247; x=1785891047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVZwS8jOvBUyjwgl3DDKvmTYA+QBde5QPL3dY7t7pMs=;
        b=Ye5u+Yf4OVng+W2LI4v9YjWuKF2ZWhFLvzn0XKiZFueOEPSkXlUUGts6ID3TP77MDa
         JVIS6G4fjTYVlOKDdghYi0gDqvsOUzxFfBXz6j3GIbRkBuXOPLkpB0aaeMxj6dhj4UI2
         rIvdEvLAodDNryB628hV+JXItAPzAJ5LsLML3FD/zUSWlqLsU0hwzOmAXjneoT+JAk1o
         wpPgFEDG6dX+lwraxnAHO9yntOuv8CxVETYM7h9nP1Q+zMPfQmLyohSq7DnrPmEC3QiR
         ALIdzAVgNH1rBS1W1AviDLZbMKQJTWG3PxK2ef53MDGDThXRxUBDyTYeBFpvfNdUDChG
         bGtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrfxxvi5BI0P1eCyS2aRAUBwFqtVBWNiQHZNRohPsTfXYoQW1srcN03MsAu2B6ib0JfFlF9u1O/GzLN@vger.kernel.org
X-Gm-Message-State: AOJu0YzauKGj0Wro0nZ60+QJCZ7OuQUeht0aexz5N0UoLb4m7GeRvwkm
	S8tgExC/i8CERLCqOXAOWkcdJanHinJ4PnlQdCuCTYgyG36AgnAf7UFr
X-Gm-Gg: AR+sD1178S6aE3p4Ci9QSZHnAl4UCIdEKra8Bw7nK6bkSKDONAGTdCR3u0py9zOyJTS
	B+znDRXb+MFgHoycANvRio7nOBfg9SypiUR8QXQPtL3vYC0U04oYsaE9Z7pcKD+q1ef+DxAkNIj
	BjVnaYZOqQr6ig+UgfhqJPaPNQ7Aliyi6QRa3943CwATNtAjJBRx+JuGGeRBBiOOMsaTc4wptfb
	7SfSejDZdCzDMhAxW5mhzfbFV0OWwvxt/sryQ0QqnI7GLYTTb8Bs5YJQzTNgBwXKoe3TFw0cloP
	CnLXd3Xi+zpfCSErD5XrqV6WwM9E+2nksyoFDbNe9u5z8bBzM104aN/EvswJFM02Nu376AZbdbj
	LabMNn1RiYqF0ar67sBt2YnHfGErRBUk6EQgoYJwI0/5LmFEHW6qUvHO7rPwrXfxEYVvj1jeWHd
	kZExKzrwTptobZzsfSYh09Y6tC4aBtVKeW3p5BNp+nyIscnAJ4CCtVP8eKEaXEJdMny09gxV0YH
	FrKLVpG+fvoyvbbe5su6jE5MRcxYEss1mWam81kLRcL29k=
X-Received: by 2002:a05:6a00:32cf:b0:84e:1a34:2470 with SMTP id d2e1a72fcca58-84e9325c5e5mr5065072b3a.30.1785286247345;
        Tue, 28 Jul 2026 17:50:47 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe2153csm565718b3a.3.2026.07.28.17.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 17:50:46 -0700 (PDT)
Message-ID: <8c59c12a-3725-4f36-9e30-cbe0e2ef95ae@gmail.com>
Date: Wed, 29 Jul 2026 08:50:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260724091427.1689980-1-zychennvt@gmail.com>
 <20260724091427.1689980-2-zychennvt@gmail.com>
 <20260728-poetic-outstanding-salmon-6fabb3@quoll>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260728-poetic-outstanding-salmon-6fabb3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2026/7/28 下午 07:47 寫道:
> On Fri, Jul 24, 2026 at 05:14:25PM +0800, Zi-Yu Chen wrote:
>> Add device tree binding documentation for the watchdog timer (WDT)
>> controller found on Nuvoton MA35D1 SoC.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof, 

Thanks for the review and the Reviewed-by tag.
I'll drop the redundant "binding" from the subject in the next revision.

Thanks,
Zi-Yu Chen
