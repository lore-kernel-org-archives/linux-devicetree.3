Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605C3E00B3
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967777; cv=none; b=MnF6HnR4VTy4eLjqZBp2dgVZC4dtiXM6nr5VFUmoUDlAKCdrqT8Db0V1gjZh4PrLFTaSIbgir87g/+qqRDLes0Wmn+rKEPx10EDkIihTuQ4VCTBEOjwXMxm0BzKkhKRSkiHyWvuxSfrQvO6RDAQ1hlZtgxxlJuzAug49Zl1CgPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967777; c=relaxed/simple;
	bh=Gez6xpQwq1YHIFskoCdlyQnVU+aHTgdUkmXSskLEISo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NA1ZSi8sLAYEjgkKGYvK/FERyx1IM9eCLTA0uxJ2eRhPIBZh1N7sy5HE38ZgMJhK7/UlBwKCxO6vfGNX3QykjboqRCBM8jHX8q4Qzc3daGrQW69PODdWS3e4pNbVfQAje4Q5qEEyyZnme7l57KPBqKgja6LNQAYpX4Q71VwWe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oy/2MAjy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oy/2MAjy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so30813525e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786967774; x=1787572574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tV4PQbMLFFgyHeT+5vlbh1R9csfOU7q00rfgp5Wi+ME=;
        b=Oy/2MAjyBS1fIFnMsU1QEeYuwM58oBlquAEJpeNzBbJJYYbi8krhekwtw9SehZ0AVC
         oFmI2F+RlJt1irfvI/oZ4MNp13dLM0srSZEGHA/3erlAaZ++VPWcwIDFTKwyxjR+7G5q
         0bsA2Nig0t0ypgU6bcerIPhzGXHQ73+rQTg+fAedbRc1ck7E9gvlvWkNZICNC/1Z+fss
         jxdyPN+NCU0tFj9cKoMLLDcWsrTarG1/UgzH+35rExhTcgBrYV5JHcyf1LSd7mVHq+aN
         WPiZ5AD9yWk3IRyjZH8e92g+e6t5XL6vo0DH/hDAdgUsy+q+W2fK4ZBE9q81Wh1PdOex
         8/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967774; x=1787572574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tV4PQbMLFFgyHeT+5vlbh1R9csfOU7q00rfgp5Wi+ME=;
        b=RjZ/1LGMGZ33XpFcIx3NQJfxg/ciREbAqx3ykCYdrypG7J3+gH8ZMNheHDHGkgp8Co
         U2c2Q3h2CGlfKXpskScAWcVTHqMWp4GnUkk7/QZYYzmKYSMd0w35VIo9c95wmi5zRKOF
         wol3nXCjvi1KWQk88GxLzT1VCD9VON1lAsMscg5vl2STrgOtxzrNIuwKvAk5DJmNp4U5
         PMeO/cMBHAHoyWcE+yMK1t8RH2px5SefAvPFs1MkWOSJeyd6OHgijkgRLjDj+8kQ6aNg
         Xw1Moq+2DvVOlqovOnSgAsHtlI7zdVbPsweJ0gBvgq0XubbjyWOKymp5grq0SxuluUY9
         /ORA==
X-Forwarded-Encrypted: i=1; AHgh+RqUr6JI99olNowmtvuA1DS+vs0qwdyHuAiFOjoaEAVhPUW12wnxH4imXPW0sB/4tndSmpYHLf1gUm0G@vger.kernel.org
X-Gm-Message-State: AOJu0YwgowhEjNtZ9+bwDWHAxSevpx/fXyiGq54TM8dsF4QyR85d0bYq
	MOmF/1JNozb6JSbqSLfkEgQ/Z0nd2Xa5aDIqbfu/dDKta7stRXCSiGnI
X-Gm-Gg: AR+sD12kGSMvx54DdrWjiIaRDlC2I40iBk7X9WglqWV3a5aphinQAe5q6FfwKIhu3HZ
	qXzIEuloCucVvRTfAFRyv7EDgASYjg6n2JkxGVx0uUGHQqvMli/OvPQHmLKwZxkFcAb7ASKHXBQ
	3T5VOLtpqINIJT4iB0pXAqdAFl6BF0tqcuu+MgGM/vl6nMRBO6bUF2qiKGPkYb9d5KwURgZzVxf
	gS1o3/U2uB4cNV70znbwdsUOFadzN4z8OFT/Oh38uWlz4hKeAp5qJfR7tS4CdhY4CpGg5Ka8M8Q
	9XVJLvp6jxrZpB+c2G+5IVvKCrqZDh0GGR6QO8zaXfBEiBSjvoc6ARjjQNUjaLWIj0oygaNa+wq
	6IquC3OB2wL1QeyFrcJVjGjNtU74iGMchLzpiYG11fDqn20E/1dipdAaglUNiUqIRAZSKn0lDUr
	tjiEGrspwEDpDFdE+7/7y8HENOMd1juHR1m0ZuoQ0gYA9WFCCRZ1lx5HeaPic0ysysFCV5NWFoc
	pKrtg6gkMDif/WkOCYvmmtumlvBxjmIVfZ6wDzcUDu5f1Cmm+LsgJTeLuaYL1eaxbi8GuTgj4Sh
	5ZsxUThDgoUEk82Zq6uEEtjH2vIxek7wx2Lh/otqI63pRR+R6NorRyTmo8EVPHdTE743sW87Plk
	Bu+6DkahMDf+CxMfxRphHjBPAI8yJbHP4yyNRnnmlk91p+xAndcdJoLZvSILGRWA3GR17LQ==
X-Received: by 2002:a05:600c:3b1d:b0:499:87b6:f3c0 with SMTP id 5b1f17b1804b1-4998807e4c9mr371138435e9.14.1786967773981;
        Mon, 17 Aug 2026 04:56:13 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998777a4bdsm203726505e9.0.2026.08.17.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:56:13 -0700 (PDT)
Date: Mon, 17 Aug 2026 13:56:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Petar Stepanovic <pstepanovic@axiado.com>, Akhila Kavi
 <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Jonathan
 Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit Shah
 <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260817135610.00000c0c@gmail.com>
In-Reply-To: <anoYDi-bt-t6ZeeD@ashevche-desk.local>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
	<20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
	<anoYDi-bt-t6ZeeD@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 21:27:26 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> 
> > +	soc_data = device_get_match_data(dev);
> > +	if (!soc_data)
> > +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");  
> 
> -ENODATA

Hmmm, I always thought it should be -ENODEV. (`grep -Rb5a5 "device_get_match_data"
drivers/iio/` confirms this, but maybe it's just wrong to begin with, a few
instances even have checks missing).

-- 
Kind regards,
Joshua Crofts
