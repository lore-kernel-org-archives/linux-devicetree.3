Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE003AEF44
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505295; cv=none; b=us8VANtCFzGvUE4fd9VKJ1IMT73SqxprxvooAMBJN42PAVGXp5/PZ6y+hPBIUDDpyjt1qe/Nv9isNp5RAmuWZ77gHRkOCa+WikWxNkni+0zP0AxTEvF+0LFTfGGkAhqe2Cy1WGp7K86Ki5sulFSsdbmUwQJREcvp7zs2ZZy9lqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505295; c=relaxed/simple;
	bh=S1Oly4VRINHCM1QG4R4tTGNPNvyYOvpI2d0QTuC1ElI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhP5DmHYULQUeXj43BDsqqANaJnklYJAQxn9Vf4/2nnYpNprR8SbYLueJ0VouZmXcMm1CpSNs0HxrR2gmQxna+G+hCHQXplWVmevNeeSRvDzcu0pyQbgiL5qSSKpPs+kmwu3/oRhpemdAk6cMUwTzYW5y5nLStuYjvtxGaSNR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bu7gzQE/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bu7gzQE/"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f626a65so1314240b3a.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781505294; x=1782110094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpTWnKEfXWiCzl373nMMsDrR/prBlQwjYUYc6wVEFfc=;
        b=Bu7gzQE/0pAqv46HKxrhQS+Px/CCeemm2CNiDL1UgjUoXGTNyiUHbWmK24VL4IjJhB
         haYgjyUGWO7UnGaHWzlGaJrlk9UvQ8Xb1nlblRCEfsyzqwtQxzHpoOw8UX1xEAKGBgI9
         7YRgCUutQPJURtWRv8djDAyG/VV5ywXQnI8n6B8/k2l3VVNgyMR+TDur7BBXflzH9uJG
         QNOOuxsnhLo1ijo91FqWm18cDTZ0KNBr+7qA2+lhVEzff6J5+vgVtfx0k/bOBFxv8g76
         NIYKFxeca6gtPxo8x+GYngiDHrxX3IDIdZQaCz0+CrwNtDIUv9yjECFavC4w01h/IIZ2
         TBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781505294; x=1782110094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpTWnKEfXWiCzl373nMMsDrR/prBlQwjYUYc6wVEFfc=;
        b=RFhavEeKY5dU+kdHm6bLk++ql7vIRZ1DGSZ+emteBPGD7allGJryAdzExcOdo3vBfp
         ZAvr+/lmX77KoOHykyBP4fTY9tqeciR20jDeTwK2k4UaSAevky98ycbKQWZBz0zTDCiV
         CaFocdiWZsiZKniel1k/y4Uz4UKAeHhrbbS/GVvfAK+qwt3rc/jcYKwQfWXrX9Ol1b+u
         L7xVYfTaKBpwD1cj8qAe0/OZDTJdGrW+bYouJnVM2EW37AZNxBAL7/YszzQ5cJLChJBj
         537RddsBMYWdR64PVnGXcTnQLYWJj4KxRmb0I2golqv/tEXvioqEz5rLIeQhBwY2v+SR
         tbXA==
X-Forwarded-Encrypted: i=1; AFNElJ/sQKuqjlgPcrayHpFRpDHiAeoaqdKvFszx7WOwEdVsDX79nBK07wzYKi3cN/+MmXUE18vMO6Bnbd5W@vger.kernel.org
X-Gm-Message-State: AOJu0YzKjGqM6Sf/O7Eqe7gGcZ8IOseKH8UyqlNVzqbNIcxiH9oHrHbM
	UamSfm7qWFW5qXnjRvt0+4GMTzEZJF88J1Gtyag9g4I3AMGXmRuxb+y7XIY9e0zRGAk=
X-Gm-Gg: Acq92OFUNQA1rBIbM5mV6bCb+ucngJ67QtmfIb7HdDMGQ07vY/FCsdZ5QmfPgUJuKAf
	QFVLwoUOMS+Xc8lr7IfxAxeAW6tp9sPZPngCCM+Y2K73XHtZdTDsv9Dy4V6aktfDbWbkfh80ckk
	HDKBHMGJCUe/zdBWNJHTC74Uh2YfRMWOcT3Aoh1LmtMa/ZSMkWgJbAzFyi3Vrv/ZGPig9772C1H
	bLy7Ui7pcnx0TljO01P9hG2NBhhnh5hs+TVdq6aHbySNO8wGGQ14COhSzbLW3iXx/dwDgpek/y8
	3EGIN8ZqrMJUeDW/B3zxRmL8eRzYddJJgdatclmRCWIMJuX+Vr2wkelC9nBbRkxxQCVfqZceQX8
	gen0LO/8u9z9YIfY88q/dmzgCxk79RkVLext4mmYVbtqNt1YWndKkAXCNLgLV3dnhAbq6097Ds/
	gm5olJEfc1Wqed3Qedj25RrLkoiDxJesB7MA==
X-Received: by 2002:a05:6a00:891:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-8434ce784abmr13630133b3a.30.1781505293590;
        Sun, 14 Jun 2026 23:34:53 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm9297405b3a.51.2026.06.14.23.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:34:52 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:04:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
 <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>

Hi Shuwei,

On 15-06-26, 14:12, Shuwei Wu wrote:
> The clusters have separate clocks, but they share the same voltage supply.[1]
> So two independent policies would be unsafe: one policy could lower the shared
> voltage while the other cluster is still running at a higher frequency.

No, both will vote for the regulator contraints using CPU device and the
regulator core will make sure it doesn't break any of them. This is what all
frameworks do, regulator, clk, etc.

> This means they can't use different policies.

This is incorrect.

> From a hardware perspective, the eight cores of the K1 are homogeneous,
> so using the same policy for them is relatively reasonable.

Right, but this is inefficient. One cluster can be idle, or in low freq mode
while other can be in higher. They MUST be two policies.

> I used a K1-specific driver because cpufreq-dt only manages one CPU clock
> through the CPU device used for the OPP transition.
> On K1, the policy needs to control two independent cluster clocks and one shared
> regulator, so the driver has to update the second cluster clock explicitly and
> keep the ordering safe: raise voltage before raising either cluster, and lower
> both cluster clocks before lowering the shared voltage.
> 
> [1] https://lore.kernel.org/spacemit/aeaXszeaE62rM6BJ@aurel32.net/

-- 
viresh
