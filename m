Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34233F5BE
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783879181; cv=pass; b=RFAY33Yuwb132VAAXwR4UxvMsKOwu/QvluuDmaIB/m1BKpJIP/RO77FTiHEquyP7qjcUJy5T/6Kexg1bLPo73Wu/BC/KE1te1QHjfDZckb4zixuwvKv8iY1IxaIB4fmgDX3HPwX4Upof3RXwMU7x3KCOSV2I9k3CHkpbiCqECEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783879181; c=relaxed/simple;
	bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DROOs85DCNWgf0ehp3/NJ0mul/aXrmzgEgX7/Bqi50PY3B07H6td9uzPjpcvrbRZfLXofR8g381TPnHKgZJQuFIen/lc4W3LUSVVEBOGEf5kALwVeaWASNE2i6lu4MDzcsovWAXSCcgkiDNTAclfAyxzkKGa3OxIwPi6hap4dX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jau6VmWQ; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jau6VmWQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2013441b3a.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 10:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783879180; cv=none;
        d=google.com; s=arc-20260327;
        b=euFqqqofYiAXEuXW2y9Wo82QDw0s+qHGxVSaFEDpPCbMk6MwKBggJiq8HyAnw0SHy+
         WxyMxBsj/yoC3Q83Ak6I2LNynzXgw5ZWQFLI9pbkvhdj9to/4iYDgIIUYeLcm/HekbBA
         SbLEzgAhtBjdidtDzlzB8fQ6CZE0IZx7KqXCafRJ3cYajAsRWYe01YL8eFrcIt7ZESNC
         AcNuEH0KXyYf9JRdkSdZL4J+ka6CvqDKEURqPyakLz2ndpOCvCwAbs6awX3My349DeS7
         NOymqLf7r8w/VCBfDBM+GTNp2KGDlL8/qeYN6YweojvkfVh7MrWjRaIB8Yt8WN8XyQzs
         TN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
        fh=VoKQRrJGloHT0/A1rAXFtcjwdUvTJb78DJ0S2nZdVoE=;
        b=BKFp3m8hTHtfB9anYkkZacAaSDkReMwgEI7M8wsfaOmEYOpOSufr2qRLUZvGHkvCRB
         osFE1M9jENURMNyHOlPQUkynl4N0WsHdiX1BYDdbiCxqylUFmdjYqSMCcdS457WthIsi
         4o4CLTXLsfFSL8ELajUVXdHBrbHGtuv8UHga/qjp7DhJIB/P3vHODQGiYTJu1CchKZ/p
         G3oIQ7NqfACUV4ppWDNhbGv9t8M15u+KDkdDQsoD1bRzBaTA3vi6hM+5CW/67Ceb+k0a
         jdG5H5wbhxGnaWtZEBHH/7iX5cVu9ixvSoQbRwZ/2aZOcYv3fqBcc5wP7LhiI9YV8QFi
         EvhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783879180; x=1784483980; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
        b=Jau6VmWQCcnJEaq/puQkAU4NtZlB/4deZZ0XcBYn6RSlaJUmFqo6lebVbHi0KEviuF
         NRkAxJvhhla0v74lcGBpxYEFYVqPPsCD60JvN6qlSLdwkxOzOKpJcjCeWAZMB5cFb/Hy
         t1c5wHVVO8pCKTCcYi9Mg42BFhXZpdem32EU1OLRLfJnbyBkKq4UhH22MsHfenKwMc+O
         MvGmO0NQotQV+V43+GbDCtVeQCW4VJaOq4m+pELqJBKTh4cI3aqWwnOSMIYhUCrUSDIE
         VCY4fSvlQImfy6b8YEhmQY5A9qoFsy40Jw+GdY1tfxTx+MZ9Uc5Fda8k9GMAfKFRm7yK
         IVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783879180; x=1784483980;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
        b=bumqJtfyO1b0XvXJ3I4Vyw9fJz7tPdEgAzfgBP+T9ONZ0pZbfbX+Erszl0hYC6B0eJ
         cOvyXc50u3CIxxh+e6Z5TC07MEkgYJhN6o65ZrFpfsKLSwqWVuY5/Esf3H3twW7aJ0Yb
         NZhXJpK3tSCZxxGoGMcDi9F7WVdq4jkzsKaMeUjLFWOl0vwgTVXO8eP0NZXJ0yPGnVqG
         yUms6KlKxtG3GEA4FwdOg8qtAaqKhwAYHtxvlKUnyvM9HzD+P9UL8RPjLCT7KefJ1Tz8
         UIXPTkRl0IesnoiqIhw1yewbkB3ZW3hi0Uh23Y4cJAgk8AVdppQLZVei+8u7Jwv8FwkY
         VniA==
X-Forwarded-Encrypted: i=1; AHgh+RpYDnNHMPz0FX9z/mgVqe4R1u6K+rR1EKcf3GUh2wzqDnXIvLRr1StY5JRENS2j9im5wYSkIcuXOfLT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxro0Lc7aUupbMVJt5RxZESHRBogsa9JYss+rw624/JFSQZzg8t
	VhUh6c7rn/Pk03TtXHkgdmddnLdLGPpwwCMhV4kriWP1+TRAVE1JCYtDX+8SQKt6TaEo7jPhzyN
	24kBUSzbvaG2KdH/pGF7Dva3SfxPT750=
X-Gm-Gg: AfdE7cmdiUibskNVkLxfJXr5/YceKNMi37Y+aNFxNRXVFAsvU45E4IooIBla35l5sPG
	Aj0ErnLOPW4aiMEfpm6zxbz6kbv1S9H8wplAbQL1TJDRrhcj/P4j9oG/3cadZolXewM2GHZcXwH
	48GnJCXbwxcSFyDYRK+0kzcStyxhA4pkpwB2aSpyuN5pFJoxcs1gOfAWkWmaC5/xK5nQfRzRIxk
	awqdkG6bEd601IQIfYbg+Ef+SooHFi1XZRK7lXaCtfZeX/dLNGuKJlTSiXrnA48CmuDF82tsR/g
	pVQcVu9Ul5tZghhFyKlOF+qIOPySi5b7D9KTh8Slrazp/i5XPHI3ZZ8RgukEcfFye+i7ldRVuj/
	4edoHaK8JxvS6kbaGa1IE
X-Received: by 2002:a05:6a00:4486:b0:848:804d:9c5c with SMTP id
 d2e1a72fcca58-848896dd3c0mr5554442b3a.38.1783879179743; Sun, 12 Jul 2026
 10:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-4-422675a65402@gmail.com> <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
In-Reply-To: <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Sun, 12 Jul 2026 19:59:28 +0200
X-Gm-Features: AVVi8CdXhh6gKGuHTJ0a2hd15-RSpJMz5r5Gy7rN4XSVonKwOhD1LFSXZ8VR_Fc
Message-ID: <CAPSPb=t33bHfuEAMLWPM5=2fSyJXv5vjYD=_pSNRq6GcUz-X_w@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add
 missing sdmmc cd pinctrl
To: Jonas Karlman <jonas@kwiboo.xyz>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonas,

On Sat, 11 Jul 2026 at 01:18, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>
> Hi Joachim,
>
> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > The cd (card detect) pin is used, but not reserved through pinctrl.
>
> Maybe this and some/most of the other DT changes that fixes some missing
> bits should put first in this series and with Fixes tags?

I can of course put them first in the series. So we have the option to do so.

But what is the policy regarding "fixes"?
I don't think they fix any critical issues, but they do make the DT
more correct.
So do we want to backport these to stable?

Maybe the following changes qualify:
arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl

But I don't any others should be considered fixes.


best regards,
Joachim Eastwood
