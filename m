Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59A7386C22
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458208; cv=none; b=Ob/ParFr9tA52c25dVtK1kC+fwf2xXkuuJJVpDnYDZbsrG4u0tiPYAc00RTDT1EIvY2Gi+NlwoHoBxxNmdP//qtErghwZyHJFEpfUugpfLaKOCUsbx64M718LouRUS3ThX+2kl6q/s7o4H7388Do7xkWX+L2Gd1S6nod2efXQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458208; c=relaxed/simple;
	bh=PAU0jDudZSlajEUPf46H1HY4xB4YF/MswuzF0Mf64hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOZ87d03jLtq3lTQKK8qIL9VuE9j+Ih5RqLzB97OMyeU+dkmU6XZfdfLJAO61biiA3phDMi3rmeWIzaTtkpBfU9h2U/7qxG63pozHvanYnEQtxGNa2f2iM+YkJZl0nU3wGQ1XbbsV/SaghVIv+kiLqDxInyEPh125c1xWkyu2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Q8vRBgjl; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Q8vRBgjl"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6acc88b9c5fso1457458eaf.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786458206; x=1787063006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XK0MtFgXJmx+qcjMc6j52NKS3ahH0gHbvfJVaAb2j8=;
        b=Q8vRBgjleUsQy4y/CP9UZ0/WMc3ATut60Qn6M/O1Eo4yoT7qJvMu2wqzGhXcChZRyY
         NxJEUNjSzkLvSA1D5oKUB+uh5R2HvtLnDMOm7rLS8cbadSLFTu9hUuXugHErxBgeQwNy
         1X88uhHSShO1I/3UqokR2kTN33YiBkzx+o1MzNx0rytiQuuXCdE9xK/CSK6Lz5gtJtMO
         O9XuUXAEY0DEk0NoskM7wGt2XMkf+jZmORjRsa+6XT7GvSiJrjOuak+0e3hXOplGuX75
         3HeyyWTn3dTx1mNUtVjEYjrQHGLphG2IHXVZsR8/C3iIQq9fTmc2POI3RemiN0BI9X1t
         8nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458206; x=1787063006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XK0MtFgXJmx+qcjMc6j52NKS3ahH0gHbvfJVaAb2j8=;
        b=iIDzDB9Ita7m3jdUX+ZIHEvzUU8XXd5QIkTGjNLCGUr5upw1YzpbflX9VQlaBP6Fsc
         ppuwkm7T0vKknQngzaHyeEwwPvLZv2tZpygXcKjeTVInLB2zh1p0vIadlV2689BHiXVD
         yzI7oHPAKATV/lybQ6Z0/Z2PRfl0LDVCr6IoxNIAXDOjB7D+4UbssBg1evP5wkMr+3si
         FbDTNoajtCrwnF2p7uFI1IDSzYqsjeON+oI6s4KxaJuuPn7OFCe10Gt+zIb6ws7yhfur
         7ZL6HrRt7eQ2XLoq5uZKB08lzn/HqpAjoUWN9cs19AJlCKOng9xb+bRSsahdFw2ZN3ae
         NsdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTwgSxivt+lAVlkTrJ8H/sHvPfxBqvSBYMHE1eIz0RS5cccB42EGRpkBT854sBSDF68RK2zY2Duksq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzyd0rQ1wF/GEwzPFOam4lbn6eHQRmuBB8CrcseMcAD04tJjID
	ca684/N880oQYU4N/r6CJ6Drce7h5+RdgzUeSjqU8Om3BiV/KudfSnxCqePGOAJMWJI=
X-Gm-Gg: AR+sD11e4e017Uyr7o/hCknSp3Ez5wxTocIU3rfSbDTw2uFxSzzYWa1NI2p+Dq0/kZ2
	DRnKwftgN5UGbJm0es7L6R11AH2cYIXnipTN9z/CCrolJV2QUv66bVQZf8flO0Ps2q74Xdm4UEo
	f2I4P2vGWXeBUvjr7eg+br83fcgmBFZ/u2dpjS+VI6QrEaxCLVqNpP78RGvv5bmlHNmFQ4mDP7l
	AcS79EIicPEyShYi8DGeVUJgXoRA96YQ6rAOwsXNQA9EV2rt72BJwixAoEjQLvZ1EkwMVkc7vzO
	NtWWnwfRxkk6DNDiG/sNWHsEew1ubrD6M7rapFadDmFZT+XXeipGZ2y8Q6pB+wUvwl3h3yMlOt6
	tr8Luryffaz64MoZKmxwzRScECiOW4suwu7P2+kXbBSl/sb2cpBZoigEmS4L4G7P5sGsfryk2AP
	pM8WhHaX67HMN0KFlnBOaYpAFijUUj46bN6l9bUZX3oagISa/hNwceXRCyrPUOVrbeuyJa7M0ca
	JLUb+8dDyp2wOOicATCIRrCqpDdleQzuUKD
X-Received: by 2002:a05:6820:2d43:b0:6b0:4ac8:3c59 with SMTP id 006d021491bc7-6b0a3126194mr2247681eaf.12.1786458205868;
        Tue, 11 Aug 2026 07:23:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7060:91df:60e9:76b? ([2600:8803:e7e4:500:7060:91df:60e9:76b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e1da21b95sm1313218fac.18.2026.08.11.07.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:23:24 -0700 (PDT)
Message-ID: <19f0113e-63b1-468a-a1b5-db6251612e9a@baylibre.com>
Date: Tue, 11 Aug 2026 09:23:24 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
 <20260811-ti-ads112c04-driver-v4-1-ae704ac17241@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260811-ti-ads112c04-driver-v4-1-ae704ac17241@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/10/26 9:48 PM, Kyle Hsieh wrote:
> Add device tree binding documentation for Texas Instruments ADS112C04
> I2C Analog-to-Digital Converters.
> 
> These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> interrupt output.
> 
> The binding uses child nodes to dynamically define the connected
> single-ended or differential channels.
> 
> Excitation current, burn-out current, and reference source properties
> are also included to fully describe the chip's hardware capabilities,
> aligned with the ti,ads112c14 binding conventions.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

