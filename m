Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BD544E047
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399399; cv=pass; b=LDZB4SRzOFYX+SHpzlnDHQZsb768ROoXEsBYynfguJN949H/e8d/obg4aDileMG9yVK8UM3nGUDvxS3rS7sM22eRHkLZHYEPPCfUGaHvYo+Mdo32gprw6fc7p6WYFraStJUsgOuFY71p6RU7uDmD2T2JkH8cNhCy3lPcZyDSGp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399399; c=relaxed/simple;
	bh=Gj5kNKHiKM0+Au1qFMRM23lhq4ixWxWNBV6x1UuRbIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNyn8MBDZDzYN6pW/Nyvwum9TjT176bSlIFvksa6ykkcDE9nO0/DV7ATu/O1o8z/JSNY6miyJ1HsjpVNaqy2xUe1yad37M93T3en3Xe9ssnXLEj7yY5AXD7/3ebYEvqKU8GhLwB2U4opahFBqXNIaDraZAJQYVzEKBNesU7xxiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGOUFOaF; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGOUFOaF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso5791774f8f.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777399397; cv=none;
        d=google.com; s=arc-20240605;
        b=PO5+yCrHUapk+V91HFdkI3noas/btjPR1u4dV0P6aacTGpojxRVY9kiy5AoQbTpoCx
         6UyZYEIdWMsU0kPrT0tyKX+agXh+TMcOgC9V0IPCENfE40wMAyeh2WGKzFO80TS2kvuQ
         aHsJrKyIsDD/Gi/gTZS5KW8W0FDltiEUl+HvtuzjGMQ5Q/Cxc6QGhy+t1QvJ3Zp6Qxtx
         2zEwT8+czHYWRe8QbqRnlJpievKn6fMzXUy1yN3FReyh0MGFdoZGT/S2jtHWqCbI4sDo
         j2xhb9ghIJGoGQ8U8HM/WKmruIgirCPKV3AOPQM4I4EC6CxJJ2KYXxxz+sfUVGj+tZpI
         uiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=clMjyO+6vB7UWgH7GxcJd/5ADKnu72scSHbOBreXs2s=;
        fh=OonExbNakOnSvUMMHgrPmf9MiWBGracjPP6m2usJXv8=;
        b=OVdtY8BUPDJCQoBuSL/EVMK1TSwhy226RKwqmRxDOkNRSv3CyxJgwUtJeK8l6UKUF0
         s/6vpIdOsnJX9uUvFfoQej4RB82Y9PO5fY3D0im6Ji3dIgOWk68rdwG46/LUG3rL+wmz
         QeUHfbc+/Qb/Qh+QbPTrHJQZ277owQO8OAM1AOu66Txbnij3tnu+t7f3eZCE4nfz7N76
         dkGLJcKPhlgZmntyEVqvJqCZgJejWWW6TCgNoRN7XbkkDh8JPyA5Bw9cmPpyJQ7gb8MV
         v8eoFlD+N+h+0gfmAR/tegGyoHFoW53LJAmoxMVKebmVKxUINqVG+/T5hNL0PbeFdXXc
         tk6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777399397; x=1778004197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=clMjyO+6vB7UWgH7GxcJd/5ADKnu72scSHbOBreXs2s=;
        b=BGOUFOaFR8Hv9S1kyHlJJJOLoKgGTuoxWDop5+qkoD+l8xoGL/9otGHU939KhRLM+B
         nyrG1R9B/nqx2LTlyw7pE442wDexxokbJwPqyVte2HbzN1Fscry7VDPXNr0kKUOMJkr5
         DPBwtGH9cYaTC9EKwg9zKi7j33QTm+rNTc5NfDj1dmss4qJ+ILUEu6exPTWVhi+Blilv
         nY8nKcLcEt6Dk6PelsQA+g+DU+In7YTUgN3NMWBrJwxuOfwdQ12j5c8zj6hkQPM/nQy+
         jBFp7tzEGb6I1ajRU2Wgr5NiXNwMYg/TFwYJ6Mq0jZvjjKIq4HZ2DJaErtLUEA3iMzv1
         dcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777399397; x=1778004197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clMjyO+6vB7UWgH7GxcJd/5ADKnu72scSHbOBreXs2s=;
        b=jyLo8vnRxB5QhhjyrB4tH5Y5aU8CfX7tXc/OISEr8djxkGUQ2YpEOTQyTZgSeYqRwD
         vSTd0U4X8ZMIClmlzwfrCayEn9IVVx0aA1BUMnU02pCAqzckBolqfmNjZBfci8MEVh9T
         loxsqbu8s3lQb7E5WXInkFpYr3RB6zgypUHV34y4H6xLT8LGEAKxnLwSo58W2r5THDI6
         70/oCFGDHCQ3z1F4zkXzK33/PYjO/gPdPjob6QN9OEwE0ad9ITVf7Enw6Nc1vK9pLPd/
         sPXl4Abw3oQrpalSZdu1mt1xG/fXnTspRSpLU32wCfc9SIsfK7Xy6gu5y8HzMNqmnSYH
         +nYw==
X-Forwarded-Encrypted: i=1; AFNElJ/+o7OtbKchA2fDfzuxeZ4y5J5uFgf0BGv6G1XPGEyocfkX4xQR3fexpTz8WsogXvdANsQWno9/f+N3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/h/x0q+Q/iSIZ9MLw+2VRTniiKNgKauHg74bae6GYwuLd3I1
	5vxINpMs64Yc+kWqqoMTSYM9ynXm/5Xq3RNeeLZ9Whj9EKyRSKyoykUIXcV9S/h1fh8PaKZQqUW
	v63RyAMTcws4Rz/uQjvEo22+OEAY9tuk=
X-Gm-Gg: AeBDies/chAenPE1r5HY0uf7daQTWvhUHlbGSxezxn7Kk8JBve1v1TdUajNhRGy6jkE
	5EgPXOoBaTx8C00gURd1deI5PqF4eH7wgUFPcX2uPBXE86mwcxUhjDSkdfK6zd4A6Qt8bVWpEuA
	lKoXYLtQU9gPuVXonJe6HNc6J9NfG6YvTlfKcIUZ4xOia2FeGflrl4m8l1oGrD33IfYGwozm+Ec
	KtF93WceiR/8ULSfPetrD9MFeycfDNy1G40wVsEWPtGkYoZoZ48NXpoyCL8szxBY6DmXW/IGn0p
	cXiOL6CmCoWlnJjH5tpVgut1hTGSdpVCn+AXSBmYsI9q3hlyQeeJ+6nWvjMwo+EDgz0YaHFb+wN
	iG5yha/hBBYZh3qSN1yczHJZ0y9A5TVCZV+oM6PYuY9wH2kQYwnGiOLjkkDPuvyW1sD/+JN+955
	s65N6D5cQuTOvBdiUpyeE1u18Y4Dy/ZkH9LNNM9F2Prw4syq3/8g==
X-Received: by 2002:a05:6000:2f8a:b0:43d:21a:9a3e with SMTP id
 ffacd0b85a97d-4464a9134a2mr7070378f8f.32.1777399396376; Tue, 28 Apr 2026
 11:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-4-piyushpatle228@gmail.com> <CALoEA-wAUpZ7_2_3kB33mNB_Y_DAc_p7QwPR9a5pxL1iET_cdw@mail.gmail.com>
 <ae9otn7HuPKVtzsk@ashevche-desk.local> <CALoEA-w=giUoevbAh+i66ATKfXCr9WUE0R6G6DOMq2xE8cibEA@mail.gmail.com>
 <20260428185404.26f3da04@jic23-huawei>
In-Reply-To: <20260428185404.26f3da04@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 28 Apr 2026 20:03:04 +0200
X-Gm-Features: AVHnY4LDI48Ptd6qgL4Ex-MeV9CkZfBLPM2365IsepDAk2KUQnnN6Wnzh3ySm70
Message-ID: <CALoEA-wvYy3Ji-3PsCduHMomwEG9KmpxSvL9xVY2vUPC_BnM3A@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] iio: adc: hx711: update Kconfig, module
 description and file header
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Piyush Patle <piyushpatle228@gmail.com>, 
	ak@it-klinger.de, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2026 at 19:54, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Mon, 27 Apr 2026 15:49:06 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> > On Mon, 27 Apr 2026 at 15:46, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > On Mon, Apr 27, 2026 at 12:26:53PM +0200, Joshua Crofts wrote:
> > > > On Mon, 27 Apr 2026 at 12:23, Piyush Patle <piyushpatle228@gmail.com> wrote:
> > >
> > > ...
> > >
> > > > > +         which are used for bridge sensors such as weigh cells.
> > > >
> > > > Typo here.
> > >
> > > It's better if you point exactly what the typo is.
> > > I think you meant "weigh" that should be "weight"?
> >
> > Yep, that's it, my mistake.
>
> Nope. They are called weigh cells not weight cells.

I stand corrected.

-- 
Kind regards

CJD
