Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1E2F39B8
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824211; cv=none; b=sVGObBIcGIFQGpsBEUz3U/0Bot2+gx4kv2woMW39NfWZW5SqN7/uMaw+g0LcTvZ+BKP/QcmORfRWsFi3vZWrEO02cKTmZIaN3VZq7nQ7jfZINEb7Lss+4WFNF2xghMY/Jk/YxCrmnhCJzhmhpU5pPWMom4YV/cpMJ1zDPJNzjIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824211; c=relaxed/simple;
	bh=oqu1ZjNxi0F3UXS+4RXdwI3lwSHWQEMDLX/P/O8dKSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JVZhhdV90FQOX7Jt/zc4h0W7qJsqvVwStl801nEJI6xBBNuqciYqXHS79jg8lSFt4t7+0WM0tKliNC8VNvXe1zqdt+oJidg7wD8e0vUGP4o3cJveix1FFdK36gu0BKhCHzst3ZJazq/SkvxMzhnlGX4yRafCzf02HIVZcYLZ8mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pKoIexRi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pKoIexRi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so889609f8f.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824206; x=1790429006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=;
        b=pKoIexRieimSr2isT9jR5N5g+Jq/8mugS7/5F6o75d3c15fMRhPJsCCnInPYowSY7Q
         hiCIRQdcHEmWJdJjrv/7SdlmGVAdO5USuTFKOZl79fO0q10YxY1OBrBH3uVkplD2AY6Q
         XtsU04fk9AaGRbw+bjaZEPWfGbAhieLALL0f13jL7f9yTQcRlR73Sopigvmpyd7J571p
         P17VoP+b1vE4vG/jYay1GKVJXk/3/5MUY/DU/M9unzi22AbQ0+NW+tyxnoe9tkNftbju
         Y1NK2TS51nsDJ7TlPXcT85rGL4Ux0RQ4G5nQjzo1/NyONm3sESoeRupmEQ58vG7cgFrG
         Vk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824206; x=1790429006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6FrOEEciDq9ZXU99OtyWWJL3jqDBzGG33W1ecDR5UQ=;
        b=ybCZauuop67I6i+BonuRx9tsPhoy8kOVIrOoatULviVdM0+Oo9lju+XtBmTnKWEOX6
         lZ/xaz9qN9W/iHtEmLGnIN94frpA+UvWlJprhDlaai/KVwKXBb3hqNrKgOeCzqrr8lIh
         vzl6e04nYW7e5fsP4k2gGr3vS7wkZFg+8qg1/BnnqZHGU+LhuigAagflTzMx9XIMzj8k
         cjat69A0yXuPW1/ZurBZMfL3dOSEz7KqAskspnoYulUnbmQvAXsEsWAa4ZMA9+X00xId
         h829xosju2qCBKjns010qC+czhda0WY5W3k9E+f0aHfj6T1rNpBawvWlleJJn/lyLFFv
         MrZw==
X-Forwarded-Encrypted: i=1; AKwUvBwTiRu75pJ7b6t+ZDrJcOjTjsmireLcuWb1yGq/IjJH/wqN3Eyus9t2QBakmZpdORTsJzF3wR0auWfD@vger.kernel.org
X-Gm-Message-State: AFuF++lpJz0277Nee5FdMqhXII50AJtmYP6HJkPf+6946xXAOrVfR5vf
	vGctZLUbtu6xZ+H/PNckruxwmwbmCoCmDAaEtFUkUihV93Q1/UPGl2lLY9RWG8fEsB0=
X-Gm-Gg: AYBFou1l9YIzez1YKxfEgwC71LMGbOpKVyz7Buhk6JFNlQoNKVvY132Iq8qFXfEWrP5
	fDMEhBYs7pUuiN9CgdbfNluvtdHtFlfJEk7jI+H70cMYt3L26bcgA6fZDDW199V/Y28WInjhRoM
	XOxTgj/bK34MVtgNpWnDwqdHn7r3ahJcueSztRMicDQLIlk5vQ1ZaSNUSHx1/SyXODSMD3nzuR5
	xw29w1Tzf4aRT8U45IRTfZHEtZEmAdU/yCBIlz2nNPOMIND/AYKAKH5TsDCVWVdd3VCAQwTXCVX
	4utjsUPqBfOl0w/MgUzsBBuyU+2MAXEtqRtn0yVMsJOWzvcptLEVk9Gn2phv8NbdIKRrOLzAkzl
	Nc7SIr1XQOIC2Y7G1UR/o3PMwMEe2omQCc2a58xAQwCY2PZJpROPhHefT9/X05DeBN5KeCHg/h1
	EolY7/uHvg/EyP46wiScsp81U3h66cwTnPcitoje6w9BxL4MBAaV3yidjrSEvw6rVodGycbv9CV
	ec5gB1fBGLaJWbSEHM5hX+OQkU+8lhP14WR96dDt45II5G8gzH9kwnf3amwXu3CVok=
X-Received: by 2002:a05:6000:41c7:b0:486:fcfd:45d4 with SMTP id ffacd0b85a97d-4871e216bcfmr8106032f8f.17.1789824205769;
        Sat, 19 Sep 2026 06:23:25 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245a869asm6815705f8f.37.2026.09.19.06.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:23:25 -0700 (PDT)
Message-ID: <ebbbf57b-9c2a-4b6b-b705-31cd4bd0a617@tuxon.dev>
Date: Sat, 19 Sep 2026 16:23:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/17] nvmem: microchip-otpc: nvmem: add emulation mode
 and OTP access validation
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add validation of OTP memory accessibility and emulation mode status
> during probe.
> 
> When the boot packet is not configured, emulation mode allows access to
> the other packets. When both are not available an informational message
> is logged to help with debugging.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
