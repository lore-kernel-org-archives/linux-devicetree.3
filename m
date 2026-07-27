Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124683F8259
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155338; cv=none; b=fU4KBDZhj4riwhb7VrzBFTLmQz5rOV3TVwTReX1txMQGSPTcZaPCtk/Z7xC0ZnbMESai1jQYDb6zfLh/3+AJcR3Qj0cGhUX31LohBLW8AEi9elw5gz9ue6UKP0OH4NP0N4VfS5ggJxlknO0NvyyG2PooCQzvaFjEcjplVl492Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155338; c=relaxed/simple;
	bh=oLOqVKG9UgKjxgeyZoIzdCt5yWA6kY2ND7SIK+hrPFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r0Pxvo7mBkvVJisWNeEKECTossd6PCGbIWwA9W50/KwYb33KBtPnXOMiX2ol/HTiuwuS9sGyG5jntpIwZI8NdY5mFmWTJctm49CZ1xHq0G2r2oD8zVRIOAJTaFEwnAs/TXXzpg95zd56FSnxSBRlratzFqlTAQPdkC9CFov7ThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFLuKU6l; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFLuKU6l"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso5549356a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785155335; x=1785760135; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=;
        b=GFLuKU6l1JTdvez+np70k/IQqjYo9i4C1Ya12pvf8RpRyLB/qHP40Ly1F84c29DyT3
         ajghf38Eionj5y2dOGz6AwY9D96hrbRmUg/QSRAcprdtC0N/SNCf3ElQ2eaZKMrYJY21
         3xGQ4QmHFudKk7+gDeBXonhpc4OSlCvjSmVlsGiezRpPp5TrjWc5r4cv7c+B6ffPvbo7
         Bdywd9jGEynyImkgaq4d4cXpn3vvQa3JHHZsU7ANEf5b5+G2do70q95zjcWES1AnVimS
         gmDnyeuNMSMAu+1koyXBCjmoHUd3wT3kM83nl1GW0J5JVKdRSi/rBGuCIvVfY+bX6Tmf
         5v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155335; x=1785760135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=;
        b=kSTajqfjbaCd6in58XWUIGgFTOk+G79I93JQYeivmjnwPlWoL6bX515dT6lcq7DN2f
         8NA7GcIdgZAFpO8FQxChfBcYuZY0v23YVxk297wKJePNjzyy5fGM2UpKDq3CkcKWEykg
         g7pSLH58JJDu7mmaIMlcs6fgt1x728L6mZZ2B9PhXksCXB3y5qVMbeSQ4kbSw1wHOeQx
         m9U66aqtlradcYZsqh65Q3IBTa4rC0i5H4EJ/Dki7GjMavnohGVgXrgUe662XdpqdzNF
         TvNvxqNMXWXcv0acFwf5RDBQfSKB9csJhsltb29hVjHN4CD+K95QZNxnyiY1JwyTMqFM
         8lBg==
X-Forwarded-Encrypted: i=1; AHgh+RrxcX0QumjsLxcQdbljpQXrb+Za6/VPqueBZLyJOk6v5eNXnHZmojMx1w/WhxJEPZOB5rXqX0cL4tg3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8IHHzM9JkjqHL8tjbPEkSlmPPxyGTL4I+RowvVQGPXCjPhA9C
	VwzEEyGXvnTDNJzHzRPJhMxhPtdvjs94Qtv696/toXOB5qOoOOUabkVtPfI51ctjqnk=
X-Gm-Gg: AR+sD11wuF3xmbY7UjfN1NwTYZxnZDEMQPDtnD1rVfh7jBoCgkXXf6Pfc0qY0JcoiYZ
	mB7TPg5zl4k+EWMvo6/kD2aiwD/6UdhGXX0UMwkmIutaaDOtnpDIJ4C00XfC/cC0DXtq3ijJnK7
	PWsDhIiacGjj7rCrTmzHkNDpnLRvMLrYNt8Ia7zkZZflfGkEIcsMez/jCbt2zLZ2QS3UXGIsVMM
	oPaphv5oxt8xFB/54Uyu4RRXKwFgq+YL6S1q+98ksxI0qEhobATeEC0a4n1nqEBO6I+Qni1y+8l
	ljlkJeJACeJEjcoS8qzuDMe9+/KAJM8PPEOnmBdUyo9sG3+7onHVAHkRJV98W5u9S6ktHo4SAnF
	fbofIW0ulGpStVBoDAwydZu9jXJ1jFYtdCNqP4ZEa9JMRb2N8gLfPwZbNzL99nJZLY9DKThxty8
	Dh9v5CSZpcpj/0emNITizz+DvUGie5xHJuk47Ycx/75RRjaYTocbuWVVx1bE7gzdQs
X-Received: by 2002:a17:907:3d10:b0:beb:d461:7b09 with SMTP id a640c23a62f3a-c1f1fc592a8mr419795266b.11.1785155335110;
        Mon, 27 Jul 2026 05:28:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:13d0:5c8:5900:a6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90b4dsm636270366b.35.2026.07.27.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:28:53 +0100
Message-Id: <DK9CR2QF1U9N.3UC55U0EM9EJJ@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
 <20260724-hissing-fascinating-terrier-6b754f@quoll>
In-Reply-To: <20260724-hissing-fascinating-terrier-6b754f@quoll>

On Fri Jul 24, 2026 at 9:38 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Jul 23, 2026 at 04:29:47PM +0100, Alexey Klimov wrote:
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..9a8d92aae9a8 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
>>  			};
>>  		};
>>  	};
>> +
>> +	apm_sram: sram@2039000 {
>
> Looks oddly placed, suggesting this is not part of SoC, but all MMIO
> nodes must be part of the SoC if this is SoC. Compatible says this is
> SoC.

Thanks! Yep, I'll move it to SoC section then, in the beginning of it
according to sorting order and address.

Best regards,
Alexey
