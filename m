Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD1367B88
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878901; cv=pass; b=t/n0lKLVBLSfWn8hSd5GwYk7+hIsJVM1WTEKqpYG7MU+D5x45ejz7641uYIXv9M4O/3GXwjZBQU6rnSFDSPCSkS7n+C5YIDep2q1o/SprMnV+UufyX6iyzFz15nZdYZgzOiYxsoXpSP92E/Ts7c/iimdJZQlbwOOPqMKzCZY75Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878901; c=relaxed/simple;
	bh=fc+IpUQ3nxL/5ehuQHd+IPjoUpneuBJkM4s9M0NB2Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHCutgiIEuVasKW5T/hHf2I7QPPGnu24jf+ujsCok8zOALWLkqtE4ahZd6v0oe42uIPlxEiFklbYtM9aQXb+AMjhq4MKpMD3nKzNd2reVap+SrR/+7kIfAtWdLx/8ztazMP9er4lF9tsHsKZO4sEEd15Jmx/CK9FlFFwNQBGXcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk9LW3Oz; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk9LW3Oz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c7c61b5292so41835385ad.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 10:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783878898; cv=none;
        d=google.com; s=arc-20260327;
        b=kg73bUE8RA2NU2y7La7CUYJXT80DFmHfG+riCLfwh9uwyTD9ZyfabCLcGNMAgCv2cz
         ZtdvKZ4e2faffWWMnjGIsYHPVC+Q9RQPCHrqzXcQ9JwamDaL7KHZQs6ZwsqLx/TdjRqd
         T12gLEqN0R4H0eRPtlvZFqhbaA37OR3TO7OrP4fjVZc375kEKG826GGLHSJOgOjucmWc
         Ifz50GUb9j8ulpuqlWPVYRJT1PsjGehK4RAckYQvnZhwznwIGEBeztQYm6H48fozNQ5h
         cqMA7PgusSHzzcFYpV5fiHudSx9mMrMxGl1yTGTzjFL09axykrOjBTfj/miQIV4RyvtD
         HAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=44M0iHbAGhfU0E5ExDjtW7aZAEv+cpa/Gl2E/ST/Kgo=;
        fh=r1Wn8vK8IcwQJUAKYsp5DHo3p7m/ZNCLKiBVGpqKqGI=;
        b=OX+UD4g+hYz8jbgj3RgXvAk24JtlNv7Mp40dQ3+/Dh3TVSaQ/DB3Z9SvjXlWH+3TO9
         2+v4FoWGlKFdIxF6MzBFDN2+Sx5YdSSsFA9KTJ2bZeTddAlgN/zhEUWazfqr3Xw2L7mn
         UxObTVbOq8W9TIbFEZG3M8hAT9pcl61Exp+UcaIpAVXPLZx5VUQowysP+AMpwtTnRaQA
         qqTpRbY6HTcUmVTWj7bNMceJTZwM7FPQe0C/Q9CbdA1jDzQjGhn3MpsNcfXmIznPJ/dJ
         +pdl1Sc4Dm+PzxiIXOYbB1YgLQqPabtc87abgvfCdL+K7C8KgfC1dNOkOsibROqZaijX
         xCMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783878898; x=1784483698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44M0iHbAGhfU0E5ExDjtW7aZAEv+cpa/Gl2E/ST/Kgo=;
        b=Xk9LW3OzvRruJ4VOuwqux1+NPk95JeqTGR466IFMnKnrJkBp17kHT1JkIBGVX0XUJO
         +zBeO+4M/Dab4Jzj2ODDxzOyudxoDFUoqLyMEteALSjk9zd/0g0Xh02DNn5IF3UZqyT6
         lm4X5AXiWqrPv8e84cHsgFq4UILDjmGZ5n/uRWjIZWbyhH1lRVOg347wI0k03Uqhi0S+
         QY7impInoaf0Yorchx32dYnwMbjXA5JkyotfDXJsrbBWb70mAuHXS9rTnSz4jRIhsNq+
         ALg0REAIuFX5519q7mupm+NajEBSI7sA5XvN0VYqVWbdXQ6mCasCz4mnsK61OCD9zYyY
         211A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878898; x=1784483698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=44M0iHbAGhfU0E5ExDjtW7aZAEv+cpa/Gl2E/ST/Kgo=;
        b=k2YolZKDkXvzyL3LVjWJxtHJfYZYoSGWQ/GfB2py5Q1766BVww6v7+W2RyLkb5sQuv
         a3xRRjLscEy6JFlGgb2FwCNoWLQiLWoV4RyUr5y2MIfzopEMPuSOnT6nnmzIEw5NikWJ
         6JAipcQq+xxA6QIgaU19U9yXAkMwh+KkQMB4071NUwH2IsMaUzhhE8q1SYzjzTV1Av6N
         1PqMzUEZaOGgIge97oUKe13PgzmopaFQ59cwBQLT4ZjqLI5lH6NB3DsbhqzwgE8GyBVM
         DaGi5KlLUPPbISjwOlEFMO4n4pTtLDQi5EcwTu8/nQZ/vO4dG2xMx2NDn5UcbpdrqB2G
         tYxg==
X-Forwarded-Encrypted: i=1; AHgh+RpYN8+0rPkVPz2WpAbO2gsbUlJAnNjh+XrQJrfsrOSYy7CxUbqWIORqNg772d9n0Oav6OCVC4lfEQwS@vger.kernel.org
X-Gm-Message-State: AOJu0YwUur01yjCKbNX4GrMYK1+MywrBM23m7Yfr2KPADc3c14I/bIGO
	iAY9nmKJpmQulzpDAbOv9OJYLYodkHFx1sUt4zx3prMPw/19lBMfKimciODsW6R0UJTcPRtjIqL
	Tpq7mrHiW6lQzR/DWMt8gbUJhtKO+xK4=
X-Gm-Gg: AfdE7cmNYS84sfPmcvXfUSffGEYNQ9XVx4M+X58sNOAr/WqoIs6/Bw1xsPx7PP5bIqP
	9coDzNznmY40AIdZQqs3YkvJ8tRvs7qJ66/S0L80sLN94oZcJvNtUd4zbRckgNDGGLzGl5zDB/N
	qr3dW/2hcFnXaUL8GFMkHgFyoqcRr3afOkoOYD1tlPQSoAqY5MVcIiD/JeTifzYl5an12ZXqxWc
	NaJfbUzh/BpdjAX8NehAEWgvtKIP2UmyMi4+TfpsbBi575lizPxP37jVwyW39tWlrQI54FzL81Z
	bcnU5Rw8SEzNUmA33UFJN5hWytlkTLkvQMFLIim4yw==
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id
 d9443c01a7336-2ce9ec0f113mr59165295ad.27.1783878898518; Sun, 12 Jul 2026
 10:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <043fc930caca4c436651e8fa77a1ae16a26d0a98.1782909323.git.mazziesaccount@gmail.com>
 <20260709104839.GG2045740@google.com>
In-Reply-To: <20260709104839.GG2045740@google.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 20:54:47 +0300
X-Gm-Features: AVVi8CcL95qrnKnAwDam6L3CmPNXOQrdJCc5kyQJraLZys2_Y9aFOne1g2IfMvw
Message-ID: <CANhJrGPJDjxv9xqXs9ZQ37O12yvUoxGxmL6chtteb__RdLrTPw@mail.gmail.com>
Subject: Re: [PATCH 3/8] mfd: Support for ROHM BD73800 PMIC core
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

to 9.7.2026 klo 13.48 Lee Jones (lee@kernel.org) kirjoitti:
>
> /* Sashiko Automation: Reviewed (0 Findings) */
>
> On Wed, 01 Jul 2026, Matti Vaittinen wrote:
>
> > From: Matti Vaittinen <mazziesaccount@gmail.com>
> >
> > The BD73800 integrates regulators, ADC (intended for accumulating current /
> > voltage / power values), a real-time clock (RTC), clock gate and GPIOs.
> >
> > Add core support for ROHM BD73800 Power Management IC.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---
> >  drivers/mfd/Kconfig              |  15 +-
> >  drivers/mfd/rohm-bd71828.c       | 145 ++++++++++++++-
> >  include/linux/mfd/rohm-bd73800.h | 307 +++++++++++++++++++++++++++++++
> >  include/linux/mfd/rohm-generic.h |   1 +
> >  4 files changed, 461 insertions(+), 7 deletions(-)
> >  create mode 100644 include/linux/mfd/rohm-bd73800.h
> >

Thank you Lee for review. I agree with your suggestions. I'll re-spin
this probably at early August.

Yours.
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
