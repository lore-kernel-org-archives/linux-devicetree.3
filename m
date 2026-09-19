Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1E175A95
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824281; cv=none; b=fBrYdjL07fw5c/IR0gtej0Qwt0bjxmcxzfviRf+lQhNMBGXZEOnFH5TK2y8TKjljB75caS8O7qB1zV3S8pWckuTPmYMFOVxUiThz2Vey6KnsjF7wl4HTapAKPy+f1luUcQ7EUcJakSU5jbhc9B7cv8Bz46vss0JolW96H7eZMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824281; c=relaxed/simple;
	bh=We4kQ3+PMqzSMpklzI6gmAx2TCZtf539gHKv2s/cemw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KuBmj+Dq89DE9/9LE6HUfGucGP7HBEZ7thNMV2LRojdaZV64ExS8dUd4lDUrP9MI3cxY+dqOorf3ZfBXahwFWvF6PhEQ6KOkRrARPUkV3biePOBg3tKeY3dvIRhmMLGIce4OmTSmOJkYEr4hTqvm0oCRdsunMR0e4fsp9rQHp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a4Fq4ZSF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a4Fq4ZSF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so6256305e9.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824278; x=1790429078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=;
        b=a4Fq4ZSF6lWD7ysroqrS9FCd7HJwRGaolwn+ULT2RcwllXYo7DfEwZEOPn5uYs3HqW
         A8UemQ0mm594wz9kW/Zf6My71ZXBd/HUXIjU7s3uFazt4vIhoCKCIz3bBri7GVAQOh6q
         kBTbv56v/rFCOTolH97Z4dSYIulIcw5xBEDCCP9LixHNEkiB/VSx6SrJwzMAhlfQb7QY
         zzbnnFiA+oOoD4n9yG4z63o0wKiS+M2vHj/sxE8YWwH7oHNJQgt/tEmt6gFVqcQh1dQl
         9MJvY7oRXaytOvaL79djt3YGKkm0HakSf27j7KiXNwaNwZbm/IROoozITJAL1CfXUuRT
         1Isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824278; x=1790429078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=;
        b=xoQ/vK8TbCzNOEd0bYq7TmstyUuokmNXlVw2caZnaygM/CHP2iT4rs4yLut1W5/znG
         aORMBA4vekD6nUlcJSF8DSK9PqBlIl1mfIJV6LUXl+PXKIDnuH8A1Bvj9TwBBm7IEq6z
         vkcaAWHZoR6NsPsTpfnSRZDyn5uVSCCKlJaxrvK/bu5hRl6m2rfPADI9XaDaN05o72oo
         VM5LryPZMw+kazoZGEtoToJtuaF7GSIi+LXO0YW9n7dXf+YJvTcquvCJP2XBFtzuZMLK
         v2VvCZw9sh/boQ5nunaFE90QoayQU07T63UAik0ewUFZqv8BlCXPLIqznNUb05pVRjf7
         k1vg==
X-Forwarded-Encrypted: i=1; AKwUvByE5z+0iErnVNZSXEPlCx22V9MK3D1IK/27MCMM3TBp6YwojfjgDGB1XpfPapr1+g773RTox5qbqhat@vger.kernel.org
X-Gm-Message-State: AFuF++nDWHgUIwsAoGJLOPMjQGlsfqBboAEkl9cRtixp+l5LqQ/n2yIX
	4JGviCZPPT2N9HQqgDekK8aCbURI9burIh2A32NC1FvBcI9QUjBOElCD8jTDSWl2ao4=
X-Gm-Gg: AYBFou3uDSrXXeH5rXE67Hl/0Hj/7SWDKiQJlt/IUR9H1FED+2beTxv5h5umzHLzcBw
	PpqqYK8jgCUFzG1fuvI3Er6nEouM2dFTCK345+f43xOOXlshV2qiO28JfaBmCjG9GKu+dgcXwLp
	lBvILjp0nGhPjON3otQqVHJPqZUTtJWqyrdwzHkTrE02SYfcMEk9F2uj7r2H810vSBhJOs1r0fl
	KGZO95+FBY1t9RON71B+DWw4L4jyjOJvjryGL9UiTtZ+KE52pRrxPS7UnrZTpwVsLSTdJgZK7hD
	FpIZcS7yGstMehlH+7txqazrZ/i2Ey15Ujjn1hI+zymUjxC5ZMS5IaszRSpUE0HtuCBUbBVI5gM
	QTllUGFrcyKjT96WAOrWqA4iG5B82y7wVBizh69W0m9mHw7r/ij4xkNqgbaSNWxzctVVRYyBogh
	/tEle/CE6RNK2fT3MehgeYQfzB6ec2YI4XhysyUpv1qxTUXVtaFTgCxZZbfPwbly8/0JN8kCDiR
	qH/LPynPhW4UYAeJbo9cAB5CPenn47Itw3qegERB/x6HBEgG9z0bIeI
X-Received: by 2002:a05:600c:4e89:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fc4ff40a9mr87364545e9.9.1789824278440;
        Sat, 19 Sep 2026 06:24:38 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm303117955e9.4.2026.09.19.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:24:37 -0700 (PDT)
Message-ID: <e23712ef-1515-43a1-8cb0-e88e26505b05@tuxon.dev>
Date: Sat, 19 Sep 2026 16:24:35 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/17] ARM: dts: microchip: sama7d65: add cpu opps
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
 <20260806074024.531259-12-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-12-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add CPU OPPs table for SAMA7D65.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
