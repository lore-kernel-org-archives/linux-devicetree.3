Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ECF400DE8
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991590; cv=none; b=GR3YA/MM9+8cuIJ5NkV8KmDUlS5qRmvzIiQAyoKGrSAhon6kfE86YMCIiJv94O8uPER/WRlU15App20IjyUPoYZMtfOqTTRT9DRtOkKa0N9VIe/pC5Vi5+1Fr+SuA4mH5SwTdAiBqRu1ru5ZU60dVLDPHK/yBFyILgH+JkQ9nRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991590; c=relaxed/simple;
	bh=af73kpAYk32HU4/KrqRaCsdbO3x5f+QppyEA0uuLqJg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdciPnrfKwtjZY75N/7J2wAN8VdAMPvfuy/d0NiCwmDfmCAkctQ24luUWe6eS04DgODEyiz23Zpw81MUEvHAlzQ1XtlOCoYbK42Nci2zvjEtAZ2Nl6q1iGRCqc+cF6vWGs8Xg11yK/wyhlwu9g2KAXfaq0G0EsbckpCUisfOAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JcGJyA2a; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JcGJyA2a"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4908b92904fso13945995e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779991588; x=1780596388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjBnDhcN8xwPKgx08Kq8ygn56aIVDiT8Tf5r5T0cRW8=;
        b=JcGJyA2a0z5EF4zlGts5D0LUl/LDG9oPgvCzUHu6KyB0hKP4LLyCoL6U/HmWu9a3QQ
         mzRl21mf4vE/Fc616Nvh8v+BX0nGGRuW5prH9A/gP3mzXJfY0TmxJaP5rrtAtF++DgKz
         i2ua3hgVQUzTfA35hZ2aX99g4hSBhxzUZsdSghVcYJfYpeApn9JRRcvFLJdT432WpOcP
         rofGG8E56MeB96A9BcWeRhy+EKn/VXUaetjeveJREPVugsRQYykFjUWwameRUzzd70R6
         lnzbH5OzXdTD6jO2CpJhUcAKxEa/OKdI+NZhmW4uSj0YoUL6BOPKc0DpiVKDPrJv8dFe
         pLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779991588; x=1780596388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjBnDhcN8xwPKgx08Kq8ygn56aIVDiT8Tf5r5T0cRW8=;
        b=FleztI8mCYSGJEGMiBKIAbdskj+eFmzNM30N8agw3FolRHUp4nPXH+zqTRtYk4IA/k
         5xJPxKgbs4FYEyy3nogfxcY1lRY6foNqzQ+5v02/oGIxXZf+0pARjVvm+ty/nLRv7c50
         3KJlrKZ98IWZVUbBL8aj9+7KPhdcCy7QwE7i60dgf+qtyV+8UZU78BCqaby3Im3r07jS
         9MykZ7uHGdG/e7T/92a/QJUJGcglLlvb+OcC2nRLMfxMugfo1A7fME+yqHaZti4uo0nV
         u9UEnHRUaB1/js/FIGf3vvaOuIaQKH5LuZbMvx0c4Siajpom14UrVFYcShqPXnueeybg
         IEIw==
X-Forwarded-Encrypted: i=1; AFNElJ+Q3v2jjCuJmeWD2cZzXIL8AL8iO87SzWh+RffelnDCQ76stSb4E2m1saYpLsb42XQM/NdtAARdJqd+@vger.kernel.org
X-Gm-Message-State: AOJu0YxfYeqLZK695bdRgBOA6YGPx29vdStBk+BPGV2NliZhWRg93mGK
	1+sXqG6phR8BjjYLG0m0N6bq38ZRCyG2EqcEExjfY9gtoW8zXKpas/CjhBlhyRbKwTU=
X-Gm-Gg: Acq92OFrzIYJy40OVQji/NHkRf+Fs9yz9kxOvGGjGyngXJCaBoA6lwMz2XIg8aMuOcD
	B+JpW4eIjHefI8dmbD+QcPTN74k2IVXFMk3SEgdcLNJB0ZYPlf0ASmzynmp9o9wI5GYOlD3rfpd
	mwADD3WEnk5a6xVtzZReFnsuWKC599AIMqIINvHzO5bDSRY+AHEubPxzIDIp16PSnPx37Lk1Xtv
	14zO/iEO6817mnxntjQuelaNMOTqihSKiF7uYnLkiptic5cu/d+y3T1a/dAkAz9nfRYCdkHpIwJ
	+yIZz7jOSOwOEqpzut+YhrniPrIFYk2OMpI0aS76riUO3K2oP0Nb0tkkJZ9DSSe5dARRiY/kEmp
	IOnxZ7iw8u9qd65rw3IdYyjzvkpQ47MoM0jU4TeNcuZWvPinmFQH2/ATtgJDx+agU9yHPo75R7R
	opnjJnXkl3pFWz0Zx43DXjA7ZDzaJMWO0Cz4GzIBW16zLI
X-Received: by 2002:a05:600c:1992:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490426bc7dcmr456146915e9.16.1779991588018;
        Thu, 28 May 2026 11:06:28 -0700 (PDT)
Received: from localhost ([194.183.24.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909a23daf5sm1264145e9.3.2026.05.28.11.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:06:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 28 May 2026 20:09:47 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
Message-ID: <ahiE63mGZq711FXg@apocalypse>
References: <cover.1776932336.git.andrea.porta@suse.com>
 <af2bsEdAhYY9c4rb@apocalypse>
 <394b5e02-1aa6-4efe-a5f7-4468d1f82172@broadcom.com>
 <ahajNRmYNa5SNQnS@monoceros>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahajNRmYNa5SNQnS@monoceros>

Hi,

On 09:55 Wed 27 May     , Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, May 20, 2026 at 04:31:42PM -0700, Florian Fainelli wrote:
> > I would prefer to take the DTS changes through the Broadcom ARM SoC tree to
> > minimize conflicts on my end, are you going to take the PWM patches for 7.2?
> 
> I didn't find the time yet to look in detail, but skimming
> https://sashiko.dev/#/patchset/cover.1776932336.git.andrea.porta%40suse.com
> suggests that there is still something to do for Andrea.

Right, so I guess a V4 is on the way soon...
specifically, about teh DTS, I will rename rp1_pwm to rp1_pwm1 to differentiate
it from pwm0.

Thanks,
Andrea

> 
> Best regards
> Uwe


