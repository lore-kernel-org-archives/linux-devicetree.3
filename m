Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA321D3E8
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784249952; cv=none; b=DLGFBlyKgK28Dfju1rzqfkGP9rQkffO+3yKo4bltr7zcUdi8fRfvo+DtjbPyvaCe8+pfPnZJI0gA9XEBfAfc07pydHCoj8AJwYiUbYS1OmQXlFDfTnNXosWfTVhwGb/hc8Ftru/FNeOQaEV1eaL3kPQCJi6LTIQ1JS8zm2uA4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784249952; c=relaxed/simple;
	bh=wOMUXoxvykC4/rWvGhc8fYAEJsaFuo0l6LI0NYyXnn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcmZ7Ib8aBz0V/JRRd0bsBKjLfYPMWlfhSL3zi3AR4d9M4dIzUmoZJ0AvPE/ulBaYZ0qRYPvvj5CEwiWz9Q7SY/eXG1ruDG4ydb8iGu8WYkxJyFZmmXFRynSRvMGHJcE7qr+LFanOT9YXPFU4DzgzQmMgTz6nO3cl2P7d53IA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omyb8VtS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omyb8VtS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4348611a91.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784249950; x=1784854750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOMUXoxvykC4/rWvGhc8fYAEJsaFuo0l6LI0NYyXnn8=;
        b=Omyb8VtStTBvzvltIMRUt7BGujcurkImwEf+/8tOCN4BQC/Fn/CCFTAwV1wzj332tY
         YKIfnbAKebFtvzpQYkeu301DkG/xiF7uRtYo/carlZXq/+hu6c916CkeIv4Z0aXQyjNk
         IXjoq5HRBsix7A6sUAA2rWnkuikkWzhav16VfaR2SdM8Iky6AM4c5jX0bPyv4QhU6Zl+
         vEC5yH+x1S9xnsrfwriKRVIzgdvfhuPLzhwxm5ScnEJ+OsczC5Um6H3Vb2LatqsiIwWi
         5qUWqA0QGaX/HnmTrzBJ+nVQOyPF0q67Oyt5gGgfxD2A8Bqim3Qdalbbf8H/EXtu8UIQ
         V42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249950; x=1784854750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOMUXoxvykC4/rWvGhc8fYAEJsaFuo0l6LI0NYyXnn8=;
        b=cUFJIUt/ay3yHaW7aV8/C39V8aapkmew6foXe/PZ77qPBkz7Cvvx3dcr8DqMZ+WnbD
         sTdPorWYCVc6kA7HqHpgm4GHfpeWht/WXO4K219Ml8OZXyviwOJTJ+9yibe0rj/SzlJX
         rCERl/x9or8+R+giX6orIMZ55SJQXz7LT0mJ+CNEykxSDYu8FFLYXhB+oOCe+N/atP7w
         /Gz5bsKf1qZjEih5DnHN2WvIr/FDBm40OG8Dtoc8vM2SjuWLSwcMNysjQwGVr2cafPDV
         GYhaAAt/ou36RXhWQ9PsHiFqQkyag8s2y5mbXhVhY/UVDYUsbN4li/3Jxs4D4CfGjS4r
         RIkw==
X-Forwarded-Encrypted: i=1; AHgh+RpaeDrHuMwKP6FEaRsLDYci00rhFZIag2k5TRCyRGyovBaugVP4BdR8uDjVko8HB26D6a0pb9Q6py9I@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRh3SDx2vZHGb1SS4vIkZJn0b1m6jgUclcJ49/fLW4K7HAGrK
	rZopXVqF2w55nHtc/uEBOnAZujhSD8tDfTexCHND0qBwIlQ+wR64FdGo
X-Gm-Gg: AfdE7clJ9lVn0v+D4ePaEHxHbrlFvb2C+qaUUiu3n+XyLHNaHehUcomwqnZg8b0rSyD
	EXM3GGtWDAKpL2B7dCm0sguURT77yvenLjmDdq/FH8TVIvaqWSA+IVb++BSdjGSygJ4Zh0cAMTL
	kUUa3/jrUetWdtlbcpKTY3iB+zeyFNG1VpBJ3FTu7pKSrLt1at5pcGDA+/YXJ18v0Px2wz1gR99
	XQVCfByFTIva3egYrcDSKu59TwlAwAAa28tdaudKF1annbQqOZRzAgFJ/eEPYey5QHw0sEbug5B
	JBVpaVKRxEJ6kAnjFpo8JkjADvfsPFUZDd1fHNFL9dyp8Be5C2clgOslKtKBYg6zY0l9u0S32j+
	4UR4ZKPaogbtbwO49i5d9YFAeOJ1jxF5X74JN+bzOddRslpYlXC4shNkdrEEDM2OlVQr5C6Ujf9
	ytGcpEoBzmlllUHvF6soYMohzZpxzcH3fsJWoFYSxNolKh0TwZN2vCZw==
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr346658a91.31.1784249950264;
        Thu, 16 Jul 2026 17:59:10 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff1545sm151892a91.5.2026.07.16.17.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:59:09 -0700 (PDT)
Message-ID: <8d757505-ea93-4dd4-a374-79f143f6f949@gmail.com>
Date: Fri, 17 Jul 2026 08:59:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-2-cwweng.linux@gmail.com>
 <20260716174237.00004b79@oss.qualcomm.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260716174237.00004b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jonathan,

Thank you for the review.

 > Not sure this doc helps. What are these interrupts for?
 > The driver only uses one of them so why are there 4?
 >
 > May well need interrupt-names to allow gaps in the list to
 > work but hard to tell without more information.

The hardware has four EADC interrupt outputs, ADINT0 to ADINT3. The
conversion-complete source for each interrupt can be selected through
the EADC interrupt source registers.

However, this initial driver only uses sample module 0 and routes its
end-of-conversion event to ADINT0. So the binding does not need to
describe the unused interrupt outputs at this stage.

I will simplify this in v3 and document only one interrupt entry for
ADINT0. If support for the other ADINT lines is added later, the binding
can be extended with interrupt-names at that point.

I will also drop the redundant maxItems from the interrupts property, as
reported by Rob's bot.

 > Do you need that explicitly. I think adc.yaml already brings that in.

No, it is not needed. I will drop the explicit diff-channels property
from the binding.

 > For these take a look at the description of diff-channels.
 > It states that where the pairs are hard wired you can just use reg
 > and not specify diff-channels.  Seems to apply here and will greatly
 > simplify this binding.

Yes, the differential pairs are fixed in hardware. The valid pairs are
0-4, 1-5, 2-6 and 3-7.

I will rework the channel binding to avoid diff-channels for these fixed
pairs. For fixed differential channels, reg will identify the hardware
pair. For single-ended inputs, I will use single-channel so that the
single-ended input number is explicit and not confused with a fixed
differential pair index.

That should remove the large allOf block and make the binding much
simpler.

 > What are these channels?  There is a reference to one
 > internally wired one so what are the other 3?

Channels 4 to 7 are external ADC input pins. They can be used as
single-ended inputs, and in differential mode they are the fixed negative
inputs for channels 0 to 3.

The internally wired channel is channel 8, which is the VBAT input. This
binding only describes the external ADC input pins, so I will clarify the
description to avoid confusion.

Thanks again. I will address these issues in the next revision.

Best regards,
Chi-Wen

