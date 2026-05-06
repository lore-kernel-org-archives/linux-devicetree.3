Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1232D7DE9
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088294; cv=none; b=bhRe5GA62FVx62aAkOdoJw0tseSqe4sjkUkVhYKHOMJe363J8jFBlNcWUzJ4wJiMqLi4RD2BUArTvVOrcPzVQQk+QYxho+Ud7r6EcIxh9yt/2VpRDMZZSYVRATwcHbbw6jQFkZPiVclew3E6a+CgmR9hM7l66160PeTBI1B8hI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088294; c=relaxed/simple;
	bh=DQb4mZmtpmsl6S4rgxHyevHyGJltkbl3e83K1WBj2MA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TQMBRIgYFPZlY8qSEX750VEcBuE5wH+1Q/mWWdCvYUFHprOavnwhM+VPZJfoLsoeAlHlAZ3eQtJn1hZATT3K7hJCdG/BwqArfMF/Kvdr1bxymA+sdNK5FjyBDwwAn9Xev44+uy29s9P7v5G9F5y/sV7wP9RXEIqijqSXxLmBzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=FEFAAO2G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="FEFAAO2G"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2addb31945aso40221435ad.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778088293; x=1778693093; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gVV/kfR/h1OysFK0qH9OZJa5FrVam8hK0PCgulO4EE=;
        b=FEFAAO2GU5gCOUvgM5Lk6i3k/mrJUnHG9B714t6yrPNYM6TncSs1FGBtJMvSNGZdu8
         NhA4q8J8F53SO8+PMuffOTqq9oYiFxQkeOyiaWSWAiyZFiqAfe1AtmfAdqMuVFhf4AGx
         5rjjZsf+a7k1808I3dNaHnrRidyiv+WJKmjDE5ThisOaiCqELHrJpTqH94glSPbV/Kz6
         y7bNESfqWRpH5a5/VupCdd6O0KkSVpVPlxTWH9qudpjbGsrFzIzK68HTT0iTX3f/+YMq
         whYr15ZWSQf5TKpVQPX34V29bD60lX1b+lmypUhvkTtasWfIObbnk415/xffzYt6tRmY
         OE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088293; x=1778693093;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gVV/kfR/h1OysFK0qH9OZJa5FrVam8hK0PCgulO4EE=;
        b=kb2Wp6PKKzUEqcnddtlqou7F6rjmb8NHhIrYkSImQwo9UFhrVeCP2eQurNfkAFIMAF
         pzBtzg8CivosSkZO+AJNcWGCpFGOSO/UwJEuMcVxoVaJ8MIwu2rRoR+HIphd6Hi/S0S+
         ExRXpteemCNifmxaGVIGt36hA8gSHVtwVVFktzzC65Uc7SBxqIYmLEElRHs2jd7Yx9jB
         Bh0ZjbwOYFu01iiTGrrCmB/WgInOX3JrOcdh4NCV01jH8aNDO4KuV0yz0RnQk3yTNsF/
         3Bjb+DkOCvCuCvFMunT9zTSnx76zkIeOQB4xZqjHAJFpBvh5fv4I44jOkVXhTODThmIc
         o6bA==
X-Forwarded-Encrypted: i=1; AFNElJ9M0Tb+KYQlqQm0aZN5VN5YEgEft7cXN2fVcF1XlW/tZM0Nw32EUFH4iFAN2lajpqty7R20HrtjFPJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1MXSVSYVeIz9YPpWBfEhEMcOJ4UvikH90pQ8pWhggAmUB+Ys
	4gkpLml9WYHiU6qGB3KaZgNWAwIGKfEr3tafnSSkQUwTth+pb+2mBagVjOOfqhbasDw=
X-Gm-Gg: AeBDievoe1eGaSDkupMCsR2kgfCNAje+/Kt/GiFVqlvGazL3kSUz4yqZD2HN7x3pppX
	Zj/WDwPECFxlXLoFhqHUxkc8r5t6gVUgi87HwTiM3DCYAXhvcwltml+u0R4/NOpGZwJ6dW20R7V
	LlDhxZdysb8eNZMQnkUnQSGPPbGWPDV9kkkftEMZORHksCfRHBTBpdxw0sB6fF5RSEONIDZqT81
	DXytyIVhBo2v2gYjGE5UTJpRnKg7jyjS8ig/K8OGIqFguPG4EmNTxPe2WYjqvRNHSLEtlfH5Rp4
	RhZPovW4OYX0yX5E7IsNwe7n6nHjH3di+d09HYqpOdgXwR60hxcwFaZsQCHPnw1P5ZsY9Q4Mkl1
	YakyclGXvIuBpqAMbAU/EnnV7S8amzfyL+tH6eOd6uLwxATH+LSPFgVxOKjGFYiR9XtqHKIFASx
	b3joW6+BbgQraRI3bnR0LySf4zzxOr/w==
X-Received: by 2002:a17:902:ea06:b0:2ba:919:bbf3 with SMTP id d9443c01a7336-2ba78f54ac5mr48636655ad.14.1778088293255;
        Wed, 06 May 2026 10:24:53 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ba7b77cd50sm28311605ad.0.2026.05.06.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:24:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Jonathan Cameron <jic23@kernel.org>, akemnade@kernel.org, Jean-Baptiste
 Maneyrol <jean-baptiste.maneyrol@tdk.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
 Andy
 Shevchenko <andy@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: ti/omap: omap4-epson-embt2ws: fix typo in
 iio device property
In-Reply-To: <20260506142044.6456b2d5@kemnade.info>
References: <20251231-mpu9150-v1-0-08ecf085c4ae@kernel.org>
 <20251231-mpu9150-v1-2-08ecf085c4ae@kernel.org>
 <20260111123200.6871a41b@jic23-huawei>
 <20260112094259.4648cfaa@kemnade.info> <7ha4yfzv2t.fsf@baylibre.com>
 <20260506142044.6456b2d5@kemnade.info>
Date: Wed, 06 May 2026 10:24:52 -0700
Message-ID: <7h5x50a1sr.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> On Wed, 14 Jan 2026 14:30:02 -0800
> Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Andreas Kemnade <andreas@kemnade.info> writes:
>> 
>> > On Sun, 11 Jan 2026 12:32:00 +0000
>> > Jonathan Cameron <jic23@kernel.org> wrote:
>> >  
>> >> On Wed, 31 Dec 2025 22:14:17 +0100
>> >> akemnade@kernel.org wrote:
>> >>   
>> >> > From: Andreas Kemnade <andreas@kemnade.info>
>> >> > 
>> >> > Define interrupts properly. Unfortunately, this hides a bug in the linux
>> >> > driver, so it needs to be used with the driver fixed only.
>> >> > 
>> >> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>    
>> >> 
>> >> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> >> Not related to patch 1 so if TI soc folk can pick this up that would be
>> >> great.
>> >>   
>> > well, it needs things fixed via patch 1 to avoid creating havoc...
>> > But from a strictly dogmatic point of view the devicetree describes the
>> > hardware, so it is unrelated.
>> > ... but from a more pragmatic point of view, I do not want to have interrupts
>> > enabled for drivers which do not handle them correctly.
>> >
>> > Of course this should be picked up by omap folks.  
>> 
>> Based on the changelog comments, I will pick up the DT patch when the
>> driver fix gets applied.
>> 
> the needed patch is in. So it can be applied.

Thanks for the reminder.  Applying.

Kevin
