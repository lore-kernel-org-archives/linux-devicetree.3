Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486EC2D5408
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783783442; cv=none; b=cTbs+xRQNQ/PhlUtZFBHevCEDS37UrkzmZv6tbqZwEC0Vg1JwYu/HLD4OtSYsIkoHCiR6RhplsavmN7+BsWpPr8xzYEC1YMecEk2P6JlDy287VD8TeJFp8rzHpsOkcosV9nncdliaiA3Xe7WB1nkWPM+bZBODvm8UfVYDbHkaA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783783442; c=relaxed/simple;
	bh=ytnfegl7Qybj0AzCwxpuF7iUfDDtBrbX3UJyTbFECFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IENOZdZ0hM/J86/0VbVj7eEOWU01qNJBHK3pwXjBhXWoFk8ris0cgcAKLJCbVv/VTgIBSzD0A8XlImUD7cxLaKb/200+3XmZsN4KU+VM1UKcS54SMjLkFGIE6JVtWi8a4nSU2BEt+9T0lWgoRU815RYTSXsWpn0f7pLZehP3NTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nqfb1Qyx; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nqfb1Qyx"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb4d532e65so883174a34.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783783439; x=1784388239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPASv6Zq6YY/gY0oEbRpb3fd8WBXtfv+ncRCm+l0SYU=;
        b=nqfb1Qyx+tiBLoFx4qCorjqcdUaW+NF5KZRAK33H7kZ7z9OBpT2CdoqglmKwIhr6tZ
         fSSoWlw24odf95XayfNIwzsX1U1xH0tXzESOMr8qO9pl9uaNC/ulEjUJq44DnauQr2/I
         XWa85atQ3G0w6JSAfHOwJrkEj3U33LN3ld5vQplda3aeDMUtlf6CRsr5QMI3AJzPlH/l
         hmeCwk8L7CN/6f8CaOE4kCes1iEsnXhtndLYInQAF0K2bSBO1rJReW4ZBe6RkoD9eAl/
         Q9vJLfwu/D0ErSDkZug7wsF2hWICLathL8uu3Jt+CPK0P3YFovq+GBVocVUMs8TF6ti7
         Emow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783783439; x=1784388239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPASv6Zq6YY/gY0oEbRpb3fd8WBXtfv+ncRCm+l0SYU=;
        b=Eb5al1kaICV3IDMpPe20JOeXrUMGKAPD24B+5vKN6t667HGQoCvSXxSpW0h/SFtXmC
         zxdoZKQhjOzdZ3MVnunwnjd5VlmlPRYoVnYXlCDw4ldQuER2J46zDFOj873iCsVZKHxf
         3dBMFKAGDz/OWGqXj+8EeNNIKv5Y/hU6K3xE6X1+ucFVTY62nB1Uubyq0wKCulZNeBUw
         GheUxT0Xg9rwTr5V+Z8ze2/Wp4aRIQ146hiei1yyAMqEQY6kzFCh/56Z/770m0ovSCDv
         S7ZzfuKa/g7XIZ70gMwEdiCH880FhqWc1trH8heB25wv0WBuUaeA1/mI7GzZ2DXqpOWN
         lOXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lTYflOdSrUtnDrrq5G5+gTEA0xofelBefVr8mOJCP3HBFEjCB+WgyM+F0SwY4MQMN46HM/hV++ChM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEQTdZwZeet3Vrnh+bOdefjQDG/405NzfGKWNm8TYJ8yyIeOJ
	R9iTapNyMv0mGGH+YNW0tSMgCtLXfkEvYNl3YlNP/NRwJ3ytre2JR7AG0iDEsuyQPHg=
X-Gm-Gg: AfdE7cl8+5Z5g49LU2wLvSgvFjNqUQmx8bCyC1fkV84/OPe7oWb97id+avCSzMQ5kzs
	8cRulMnnacTELwhgGAnxI3dcyAByT/4aftqzcKgiq3XJv68AnpH6j0JOmfkOgQuzIx0M3S/sGrF
	PEiky0+sm+3htyHHL2tYDebiF7n8+N02pNWmFBMKZWbBwhAisR96qDzVd3SxXsPzgaCByTSEWYl
	9Fgi7f/OQy3fU9opPyosvbsnWFVlpdDoQ0Bd13s4SSwj78b+JRSJ9hXbLlsP3ruGk5xPzLqU/pS
	BiA2QPQ+zkpyM6rg6pFoc7gbKalx3dWAhgLoB/lz1eRT85q8obilyTtPKd4AJKfmAdTlYOJaIqU
	/ty6VFmPDctgNgAMe16diF3hRrs/viTS2ji5TLasL7dSdqMWPupqHuWOj3ZSB+fDsdRECgnNXVJ
	jt/8AjmWxH4Gz5WA2nrKuNo773lD1CDsD8jhLg0xBzACdCpqhyLwDOOnTK7Q9trf4=
X-Received: by 2002:a05:6808:6903:b0:493:b6b8:c8b0 with SMTP id 5614622812f47-4a42ad7549dmr1908121b6e.14.1783783439274;
        Sat, 11 Jul 2026 08:23:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b01eefbbsm7974781b6e.13.2026.07.11.08.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:23:57 -0700 (PDT)
Message-ID: <adf66856-1cdc-4722-bc3e-549122a912bc@baylibre.com>
Date: Sat, 11 Jul 2026 10:23:56 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] New features for the AD5686 IIO driver
To: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 sashiko-bot@kernel.org, Maxwell Doose <m32285159@gmail.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>
References: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/26 6:20 AM, Rodrigo Alencar via B4 Relay wrote:
> This is the second series of three on updating the AD5686 driver.
> 
> Initially, a big patch series was sent:
> https://lore.kernel.org/r/20260422-ad5313r-iio-support-v1-0-ed7dca001d1b@analog.com
> 
> Then, the first patch series added fixes and cleanups:
> https://lore.kernel.org/linux-iio/20260524-ad5686-fixes-v7-0-b6bf395d08bd@analog.com/
> 
> This one is introducing new features:
> - Consume optional reset and correct power supplies;
> - LDAC GPIO handling (active-low, held low when unused);
> - SPI bus sync() implementation for batching multiple transfers;
> - Triggered buffer support, leveraging LDAC and sync() to flush
>   all channel writes atomically;
> - Gain control support through the scale property.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---

I made a few comments, but nothing critical, so...

Reviewed-by: David Lechner <dlechner@baylibre.com>

