Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090872;
	b=DsJIndkQjut7W45YFCe6VQS3hhJ/ZVJQ42DnW33ZjlVEx1lK1P3LEHOyNmM3WSMeKlKI
	 h8R0maLSFVMmFO/NVaiyi3YQcxe4zH3mo3ilK8z+Ln+qd+gI6Va1KcMsYtonFquk4seJG
	 8uPyCMi9/i1Fp9SnCCKbd++bCNi0TXJIwz3P5WiRaoG7p9OH8UvwHOoP/74kyUk7SHE1t
	 9lYXrwjzJM60qf0FmFT8o90qXBUHO3eCBnmIP/DKmpb64A8VDaBqCdQ1gPwGMxyhJ6lh+
	 36al5jPDUn+BdaE1t/0boxAsbKiDE9Ijo3K8jYH9y9i+LLYyWZVHJR5SJn4VkZg2QiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
	b=Iv0vptglKFvgUDc1IOL+7GxjWs0HtbibwJVZXXcGvKJb/ZrePMo3fq+a0/BjnrtOXX1j
	 9fL7g2hNpfPyUkHCIrvMb53xy62jJCO2TvKNjFDjmrpnrW36xQIHtpmMyw5+AIzRs6EOM
	 faj8paKRQJWOtqCa+C8pDfi4dwln7i9OS+sjWIJi5nRoS5wsHswfvv/ZJuagqQj0Omflm
	 OO8fIyyzsq6nqBjBLCyyc2Jc22SVbsBSZ3oWYBUPl/6WjqU6tsof/hU0FNvIoe/c1liHJ
	 ilpkwmO6i54HndWOlFVtxGnoK1wqXPqdBeMtK1PBCO0CVqhuKA1knN2zjjKLHN3S22g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GIV4PbqH;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C498D606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C498D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GIV4PbqH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20860065e9.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795090870; x=1795695670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
        b=GIV4PbqHeGq4Gk/jo/EQNtTLPSTM4Fp7k84fqaHnbhCmEIzbs7mOqsfNB37GnNmQ62
         wn0+WlNIGQX5dUs/FapjFwGJ4grnw+WpaT9y8IBQQRuKT4LV+g1Y9xGisErJlNKtkftc
         tOJT9skopUObYECZQwswNuvQMSwgh3OQ1+SYEr98CS8/j+ST2RtOOKSm7WIgFZG1Bb/a
         W7LnplNGH3Cm+sW+u5uw5RSzvER+pbE9UDAEquN/wCe9s6AOz5YKGOEsDfHM1owkTiZE
         mB2n/VmUYqGbkuaKKkHAIpyvz1m5WRNti0LYA60sTZxRMg2cRjFuAgxgP+K6rBnLy8EI
         ObzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090870; x=1795695670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
        b=CyY8qG5xYFxbr06D30ozA3iHcPkY2xP84Mv1tSWhkEz8tnYYp6T0aytW5AThQaHPGe
         p18ehxv05tEwB2OZgumRoh2J3N03LyFhq99hGfa7Y9pQe8gFTywYbgkPR375bJYHWvhh
         QReWwQR5QpheOwH9EGwBhIjyJjTP0wBmodgGEciEw1B3Bkt1wqtwgmNaCk/bWy+kYZmF
         xOgJieGxMqRuQwpdIwcOwOpog1A6oXfwTn1EpieHfmlllVWiFYAsXkcQCvNaazsAvr/B
         bhjunNZFPkZpp0vkrzHIHC34lhKjP9VNf4VG6DnCf38udS9bMdbldpXlCMfVY9Xr+ZnW
         aLlw==
X-Forwarded-Encrypted: i=1; AL+hErHXRKOalV5wkmpG9cu78RbiojUr2toAbwK8RA7NuZZe18Ejc89Hp0qvukhH4y/pdkyaQWHI3d08EoaK@vger.kernel.org
X-Gm-Message-State: APuU4Z/zbXm9PmJZqocdgH2zXccob2AKPtKvDwpJTbIgQ5jL+06NYbmK
	Nt4fCwXpuHlx1tc2TxmJZzzngUFGTKwafAVr/Scgi8WqLVKfhYoubIVCFGUT3JRabyg=
X-Gm-Gg: AYBFou1BOyXrZZ3fjiG9f0/ojaD/Tq2jFZCoITnIgNMlf5DDne1ouF3asZih2ZYpOXK
	IjRxG2lWS2dw8BPKHZzefjtlIUYvbxZOJAAKrV8TCTS4Ls6uiU5rgFD8ALRp5sKMMI6YYQuw45g
	jQQU4OQXXEuDPcJweVctnpvkyDjWkvlb+ads7B8Vg6A5EcQSG20F3lXynbdbJJb13q9IucMozMK
	oW0k2WvMgdaGzA2Do1eBZC0RjXPUxeZnpvGUQ4wWYRmtsciZ0+1X4K2Xcathk2JEJfx6ExLOI38
	VyDHxDN77qXoGt/lWvIKbYSrt5+BQc31jY2N+H21wYGQM/qP0bpx+hUCUidc3At3x82DnXtP5bM
	cjlT58z8Ml2zibDsIpWpHLEg2/4S/IbdQRdR5P9k7X67XuJjk5Vq95cJbIFAZgxgYJ6XaWCBd8X
	V4CCij9+lwBCLr7zO/cBmoq0oPBc8yj0LiR2P9aSEllK8jD1SAva8RNBnYZraEpOg15i2J+eKJ2
	JQl25iMebQDkahcyWesld6I3cLO8cm9HaCVjpmOO7DF57GZYQSSdn5ehxxn6+7zwX8Ptk3lSAwZ
	mqPm5eGy1Qw4qCh4+28KNHoZO1LSjmtvfAv7exeW
X-Received: by 2002:a05:600c:4e45:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb7da267bamr102371215e9.22.1795090870232;
        Thu, 19 Nov 2026 04:21:10 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm31124375e9.3.2026.11.19.04.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:21:09 -0800 (PST)
Message-ID: <274849ed-4090-407b-bc3c-57caa029ef0b@linaro.org>
Date: Thu, 19 Nov 2026 14:21:08 +0200
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
Subject: Re: [PATCH v2 3/3] thermal: samsung: acpm-tmu: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:51 PM, Alexey Klimov wrote:

I'll review this after you address sashiko's feedback,
don't wait for me.

Cheers,
ta
