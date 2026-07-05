Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EED27A107
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783291245; cv=none; b=ZGUiF233Va9u0CJJRXyIBa6XMT0q+OTZf0Etxui40kSnocsNFmBS8vdhSrQpE30epMOD70qFhACaNM73JaZrn2z9OlVotJ/PJLfkleak81szS/uBnrb8PuU33a3tGWPEE0EndbExQWqe/x0/VfWQnl+bi5aTIRo8mr99oSVzhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783291245; c=relaxed/simple;
	bh=o6tKcjSGL3hmAoOfrQ72FhjNH6OcQ99PKzW3pQ6hb58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzHlte4CccfTPczWh/pyJnY44JlR9Mc8gnDfvmVXKqsSuL/AbfaDpqTtWDfPFx1nZykLJMyeC6cUcWON3VEogMMrpW4hcOxsMdrTGA5T7HTZ/qrz2e5/kJV4kl0NdvOpi1IMj9vcozFjZkGBbt3aMGsl4EElqUs3/V0pdqRb7cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZzyVtOT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZzyVtOT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so21524035e9.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783291243; x=1783896043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veU2IZXpTiLRV+FUCeAbLnHfRb1mcReExg9kWOUDBqA=;
        b=IZzyVtOTFcv7PRBDHD9/w92l8TEWp9nBHTccefnzhmj9va1ldhieCIOA4T5vb27jRC
         0VeUky/pI8uCWNc817jEiSCSARdtbltKuTVdAPevc9pJMqZE82DnCmGDG2zIWOkED+3M
         33CT7zxRAOsUYKwLUJ4XSVBOHIPK9QqUctQRp0UmLSudRhuwPDl9+Kknt1CBUUl2J446
         4LiIhHZt7mMZJs5ivy7SMxRpoiiBmNXNU6W2cnCx05ADuomxMSstPwPoSaj5qpPIflBq
         sZSbcILeHpQu8bzaNzM+SWcLClgqrj6AIN9yTh/cY84Mf5UXEqirx5JU2HFRlys7g1xz
         xBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291243; x=1783896043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veU2IZXpTiLRV+FUCeAbLnHfRb1mcReExg9kWOUDBqA=;
        b=HHCY8jAiaCngro82mYvispahxRwCFKOgXhSWhrfHMuzDaodGT3Mk7imayWqTopcrvm
         L6k3w0J7f938SxgpG2HAHt4ftMxBMm47dYleucm5dQWP+Ke3SHdon2Zi3L8dBCJoJzHp
         N6CVa+K5EESSw/aUv2CCEbbMQynrTJbhN0DxsZyouX1RyMVyMG/Zlvowt6BqWgdNxZvf
         x57NOUYI5H6zpFs0EhyUuz29VbD8r+sDPRD0yXxgxD1keCOxhZ8M61h4M/Vuo5LgpyXv
         O7JTObZWuKpQfRnZYzIOJJul+IpDYHD5m+PQ3FTHkHX/pEQ7imt+IVgnS8Ud86sZe1xh
         NNgA==
X-Forwarded-Encrypted: i=1; AHgh+Rpwd8ujrU61Fhf60oFPnyH5n1Uo30bMgNe7S4bERrKeKhDbgBT3hYGk+4qnNK1IGjuxFpwCS422z5JK@vger.kernel.org
X-Gm-Message-State: AOJu0YwjjNuT4o2K779ZhiXdNFX+MywMRU98rHXkcYizlpwlfra8gy/y
	cjJcpGOztfvgHC9G83woEYnJYVY6ZyDAI/LDAaVSVipn1AZJIaF9a3Gf
X-Gm-Gg: AfdE7cn1+YJwFoEqYWfZMiVsuGTkQ9xzjHogqYO7FgWqtuLeCzsim8tZfbM4ahwW8Ko
	J1az3pBRnm3j/hR7/OJvuinEQQyKHlEGL23nimUqo16bV4MGYyP00Yq4GZRzdSX0oTQzKFAodjO
	dzkhHaZpPml7Q6WVUlMq1e4GvKK9IiQmqkQKCWeDC/sSNweA+jpKn++KnUg3golZcUluzcpDokW
	XzzHu9Gk4yQZX+TU9LwmyDIxCsNLlCjGHgLKHokN9kRaa2k1hzBmaizZwqrkcNNvQhE+bD88nvz
	VdhH+JYNTFwrV7g2HijiUHG8fLKZgF5TH2xHRpIc6b0rw1jVvrdA24Ww/hIthoqoHKfC3/P/qpt
	FX68KE6QOaRAOzNTMMbj+COb70J9xDNdSWxejn/xxj4ZNKFImpsdqdlOSAQTzi3OfIfwzDnNi34
	23PJilyExJnSgxqkuY2UL2dgDgaxpJ+IUpbVl1wBO+xshMN0KCEFiT0Q7PT8M=
X-Received: by 2002:a05:600c:314f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493d11cef20mr85595145e9.6.1783291242828;
        Sun, 05 Jul 2026 15:40:42 -0700 (PDT)
Received: from [192.168.1.109] (87-126-128-216.ip.btc-net.bg. [87.126.128.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef1807asm289906045e9.1.2026.07.05.15.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 15:40:41 -0700 (PDT)
Message-ID: <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
Date: Mon, 6 Jul 2026 01:40:40 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
 peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20260627171228.2687857-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/26 20:12, Alim Akhtar wrote:
> Add Samsung Exynos8855 smdk board to documentation
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..273464400477 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -235,6 +235,12 @@ properties:
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>  
> +      - description: Exynos8855 based boards
> +        items:
> +          - enum:
> +              - samsung,exynos8855-smdk         # Samsung SMDK
> +          - const: samsung,exynos8855

Is there any particular reason for using "exynos8855" rather than the commercial
name - exynos1580? We've already established using the latter naming scheme as a
convention (e.g. exynos3830 -> exynos850, exynos9830 -> exynos990) rather than
the development model numbers, so I don't think breaking that will help anyone
with the already painful model number confusion.

Best regards,
Ivaylo

> +
>        - description: Exynos8895 based boards
>          items:
>            - enum:

