Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2F3BD22E
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027990; cv=pass; b=gSTQfws00X/rtAweLAxXuUK+uXUlOzHMCEvaFW90S6uvN6xhPEIMgR1JkzMEqSs9ebFD3HySZ3TL0xaCj6zQ1lGr1qvtcEESPUrMraTZ/0UTrPXFMYVxHO04C+XOtC34hIptLYDkQyHekVODResFIK4NhTE4iqb5Tattod5slAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027990; c=relaxed/simple;
	bh=Gkvz8FuV+k7erKPiRfZE7MtCx2V48IISIIAtH3VnUDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkZvcLJ3G7yq8TthVUrEHOB2vzUJ95TNACAi/zxFGUAvoMCMI+gUpz22Md2suojAfAziZ176pQVMg2iIfdnBOUHRaRA6dzdkNYfA6baEzImbFlNX8FOD43YMqa840sOnyDEas2YZhvC8hpJ/y1Y+Ahew8jxx9COzi0W7Aps6m+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3QiGTjx; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3QiGTjx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48909558b3aso14901475e9.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779027976; cv=none;
        d=google.com; s=arc-20240605;
        b=Bjr9hQatTvFfpjRttLpkqr0L8foeO8A+8tzlTUBxRisEvlNPOS3p1JGur/PGBrykvK
         QuS/SaAC0DMM4ElpJKRb6oL38sKiGm8koKP6LQPBeAkM9T6f8rH6YK/Ap9VG8C641J7z
         pYEPMpsVzhB75V39ALKv7qKY27rX3RsnRzF02OzfgXcY3gd7OPjuc3t626ZcxvDe4tN7
         iEoBQeEi8Lrx7WIaMlgQe61Iau760cw3mA6FSQZV9mCpy1l4GnUoyV1poEGQ4IgIqe1W
         0c/NIGjPJ0SMyvt5Z5oQTulWxl+c/+Xa1uSPNwvt/otjZ1DkgIKdCkwmnQiXyD0ZlBce
         aJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kIbD7lOBiblVhxTn7ntPA7uMa1vlKZnETYPcj80Vvo8=;
        fh=HInS7L7DQxv1RTNfGgnMY6cUky2Y2qZkWFtVl+K04do=;
        b=gezMqc+QKd0oi4E3MAEPRS7yHBd8G8/56EzA8OYtWkm/FSvEe9JkVlj+JeCCM4z05x
         xQhlToQD8N5Sfj5GJzOU2Q9KSFafNRnc4vAP6aVZU0dzgtKP1nIxUFexezqUG4qg87nW
         2swl9k7pGxnZKvx4ML6yjo7LaYViGPVgzZT0R72ieu69UvNsp6+09L41mKko21xOA4s7
         QxlOPlwcWwbvTelbWFcT5A+c9HJs/GgLpKsLLsMFDD/oCscpo8u5FE0bwc2hBbmOtNgG
         AVK35VzpD0F/UaRlqTUInINhS/x68LXibl5UyNcxfd8z4QjRk89StK4iXdyamYwcwPvP
         wyTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027976; x=1779632776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kIbD7lOBiblVhxTn7ntPA7uMa1vlKZnETYPcj80Vvo8=;
        b=W3QiGTjxJSLX4FELgVBQ3CttmWlCVUpHgqPhVsRGmbuGjEaixkYRMDIw3UveuCTkRb
         bvOL1yh8KLRd1IDpz89ApYVywhbVwthsH9PYtm2/0Uc9JzXbOW2ZU1VLcp7ZAdYC+iKW
         TlzkQx1nQhZvXNl2pEsECUO6uuqqp+nIYb3E/342avK12QBqXfHfNs/r7VGZcQ9tgiUQ
         /ou7tjYH3pzxnR3mIwTeN0zN+wHlwMdcD1BOMZVeU67p/2up15QQHyrvsf6eFhfhQYqW
         dMbNf+h2WANqcZ6WXwT/jeW2Zqf9IOw0QIT/bzWlq0vWTgmCz7BL/hPs/Lqi0gxOthKF
         IScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027976; x=1779632776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIbD7lOBiblVhxTn7ntPA7uMa1vlKZnETYPcj80Vvo8=;
        b=YBZ/guIvZCXL7sii+FphWCYiFrBMs2gkfHnnWLYVsJxJ2J6M/A+nHxRd+DMptsQmbh
         NppvbUws8uqDarciqGMzfrW36bvigrBkiBjwLYbNgOnHTud3wfNlZ181Vqv5VXJt90ql
         R7CzkVKFC3BHY6NuPGKeNjEjVz4KKIAO3HX4/LgfoTntC1hlRUR7q5jmgcQ0VgWrmO8v
         Ug7j4Spt+GZuhmcGHDl3VC04Zb6zs+QWm7oEIAp4diQeon9Nbl0NfchWxxi67RdVsvCS
         aq4Ogw3iwzRSqNH6GEI4dX5UlAstlPLudNBS2vi2rdZ+/xZ98mb2HYtDVbm/eJAmgD1d
         EgCA==
X-Forwarded-Encrypted: i=1; AFNElJ+nX5pTl78ZR4Gfx+hGAh74CfpnFffcARQ8x2dFn64Ols39ne414/lXgg0PGEMMizUCjyOwSibDywvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhE52LcEm6RD5/3xySGPG6VL4TWsHHwaGJSg5SlL9tuTwL+yXX
	hzKmXm1lXWoRtIWhSkb6SpnFHDowuXD505mwLHoKRBKVKGIVDscTxf1rSn3qXuqLmNkOz1VP6Nd
	Jy1hS5gdzuOwkrQ9MNyV0Bnd3YyXXuROZa3Sd
X-Gm-Gg: Acq92OFCJGEVYfLDdWaZSJ0WIG2mQWPaUSnw1xOX/9JYoiIMC2lXyrvqzWNW3MuR39j
	IQk1ZhTZIOEnEAbe0zszuCwICTWXSZD1GVMX7OvixcR3UPuqgZOECaf7XoSNDOhdI6XUaEWqIuy
	+glPdxyf7vEpsP/zafy9hz6gtrpJCh+uYb8qlWV9Jq1rmG3Y/yBj+psuW0H5wFyAlFhQAwcyLja
	czs8v0MPeYYqDJ/PgO8PlEO6Y7fwWxyUZCStBLwgYK8/jalz37uCZBrBf8rvYOtAzwV3HIfZMSl
	MRuGr65Hb+4OxYngfuCmytcvec13OmEkhQtvuew0HjIxWQtTEWpY4hsGabLDw+EVL44NXzQP4i+
	tA/5Z3PP/Oh6uDQ1M0YGdrgYJVY1GxRGyjU011CrRPE5BSm0YdlhYa+0dVtzPGJ71bInq0m878D
	RUVkn4wZa4zZmxn73I9A==
X-Received: by 2002:a05:600c:8906:b0:48a:5501:7995 with SMTP id
 5b1f17b1804b1-48fe63270f0mr141583565e9.18.1779027976256; Sun, 17 May 2026
 07:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
 <20260516-veml3328-v1-1-1d4b663e2fe3@gmail.com> <20260517141054.3981672c@jic23-huawei>
In-Reply-To: <20260517141054.3981672c@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 17 May 2026 16:26:03 +0200
X-Gm-Features: AVHnY4I1LCjLfqsWnqx5ys9B91bu-zrmM4tALO3Qti3wW-Wp3ykaBA-fCTv3Kp8
Message-ID: <CALoEA-yk9dJFx=pjjm-=UmTi6Wzx1crLswFfGC2QtPMCP2834Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: light: veml3328: add devicetree binding for new sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 May 2026 at 15:11, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 16 May 2026 23:50:53 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> > Add devicetree binding for the Vishay VEML3328 RGB/IR light sensor
> > connected via I2C (SMBus compatible).
> >
> > Additionally, add an entry in MAINTAINERS.
> >
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
>
> This is very standard looking. Have you considered if any similar
> bindings can be easily extended to cover this device?
>
> Note that there is no direct relationship between bindings and
> drivers, there are single bindings with multiple associated drivers
> and multiple bindings covered by a single driver.
> Also dt-bindings get used in multiple projects and some of those
> will do different splits in what code covers what parts.

Hmm, now that I think about it, the VEML6030 binding could be easily
extended to support this device - oh well, should've checked earlier
and it would've saved me a headache.

-- 
Kind regards

CJD
