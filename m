Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691D3382F4
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035623; cv=pass; b=kJWt0NnnRowP3Krzh1GO9oDDn9m0P0wIqxdoAiyfyPH3QYDxK/Xcrt9Qopg8H8eVPXkaXMg4pkhHUwz5/HVuXuTrTdkZqy1oK2tSPYdmLTSSMNMljO9AN+NwIIwTHEIL38yoSVw4qMFxMiDPZ7ne0ZipBDPorv6uPT92wzclOME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035623; c=relaxed/simple;
	bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQpjbf+jGUNrchYLm0YO5qaVpZESLsxYdPfPffObS2XE57xQqbGH+pLACgT999KcG1j7KlZ48uNCc9wddSVZmcuJTnKTAEKB9+cNQntUG5N89oJkd57nfIcEU2MKAucvwrCy2LKqdfIn93LC3z/VkBghLlUOG2hzTk2FGKbDBc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZf1aXd0; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZf1aXd0"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3111234a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035621; cv=none;
        d=google.com; s=arc-20260327;
        b=myd1NSR204kuHWFhSq4WVMqGWuQ30juIdtd5FOXqdULeQQybm6rt8rZpCWzLknjiOB
         YrK5ng8/V/O4WG8RMyv+JH82vGMloq7zx+QDpiRyjud1Vuj+/WQCswv1V+OrNM0101ii
         l3r033Vbm27MU31yTYQ/X873E8uY5WfvxhEAXxSl4E7lXmCe9roP5XJyFxSkNNPHqiie
         GN4rEuPkLbFDOIcYpeCsb+B8T89Wfu1Rfc4t9cHRjvgOfFEjXtGGveM3UTdOAFaYQ/pY
         S74F+VlbAehT/rUgKBqD8QGJXOrn84KTthJZFp2CQATrcg2xR/DFW6WNaV4tgZv3zSJE
         0PBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        fh=sGJQp0rLvlv3yNOqTEcxHaixSa4eaidaR/WOdVO8jIU=;
        b=oqGAdfnyGFvjMzWBvG6WQk847dwRMYFxYz06Gu6f4Z6wp9tYoBheoUP4nxutYCtx2T
         QvG+qQylW7jPxGE4Y9zc8TdqmuN/vrdctgk4NzbBcoK0+heSRFZ8xATym61A4TRdLhLN
         t6ZJvAGOsGCL7KRNzZm8czium0/Ug7NeEA6FuCzjtPpDl4+j//Yu4zJynkbBtW+XjkTG
         TTaEbKezycLSCaGD+uQQYFO/jon6+Kv+V2LH1sXpbPpuAUCYQp7wJBrwGAFx5Y5fx5NU
         mu+bUrR65Y4ZhsK33AhVYDi1QTRJT+e/KYQn4JtIgF1RIsXjxjLCEpq9K+Y1NeS12gVb
         aKzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035621; x=1784640421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        b=LZf1aXd0NDZy+HyoV9fvHRsX5BLLkFdBKmoUP+hsams104OkhJru3dmMG/oz6E0o9P
         0rBAvVrCSCSIhCrYr1gNqDhOAvm3PLyO58snWKTApbRtlPeiTym32NPpIKOblXD7z4Au
         XPt5nXHEqkOwfqPqyrJhnwospmkSKWhwS0H/L5pvhr62cA74ZAcmldmq8cvN3/FhWLda
         ubfOxB4awH73kFJIDmWFoVzv1PT8p7cjjTzZTp67yTxK32oHIm+PEFbUlkuQtf0pJRUo
         ZYu+Ih1/KqqwSaHohotBUtpxiEb1E2iGPgYnM25zKGGTr25K0BBTuVvChnaBs+5J/TMp
         A2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035621; x=1784640421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        b=pko1b0JB3nhTqYnAL+jn8hW0dgJMQTK1oHmA5f8OlYr+UCnLo9IgaMF0hwx10skdK1
         UthBa9NiD9HyrnICFwv8G36tp5kxcvTsatOgbl4dM5dyyqcfv6sQ90/WcwwEUYA1+CaR
         Ba0bZ/UIPcThM82B4YhXNwPAKqvOSLp3vI9nPOZQBqTA8joodHYnkyKqYoUBZg0DXxZs
         65XL04Winw972mT0Wj0Kmml5d917Q+MHq3U1/QK9Z6T9ZvZMkJl2b0SqzNXuo9/jpL7U
         rvoPUhACVOS7xeSMQ5Zd/tsc5G1vSAnupNTDJd/KTEW39/3qf2g2G9cTUWtD6K0ASNNc
         6Ugw==
X-Forwarded-Encrypted: i=1; AHgh+RoRwLNTQiQa13MDSkAxOLMrW2GC47X6FO8sBC/2iJj0J0r23yosLCMkfLwp5d7F5IhshL80ra2FmcH8@vger.kernel.org
X-Gm-Message-State: AOJu0YydxzPAUxApy9yR0eOJRpG4ZwkaADD8ZQIUlA8rcWIm3MuDsoPC
	IIoNb2dxy33R7IH8vxAYWzfphfZArFXnrzXjeJG7ckrE8b6ljCmq2/ABGYLpQN8A9bByCMBKeTr
	XI2UaBW+ExVJj84rCJ5wNaozDIh/ypZo=
X-Gm-Gg: AfdE7cnB0SReCgXTeRXj+W3wj+p3kV2p7WXHNJ7JtuGFBNTpl+MlDPicF3I7lmq8MY0
	BXoOh1Q826UEoAv5oda0yQnWd+nssdPj3mxsk0tR0yGCG+5JYSAo88Id459VlF724mTkFmUplzP
	SFW6NJ+wzwzOC4c77LtiFA1fCS6j5wMp0n5fh2G70ngsEofbrJlWnpArmXggHdvlrOxS9qkfXNy
	RJvS1Xm6/YopZseaDTjT86UHQ1vyOgLg64kN0rsqAf55pn6HXFFFXE6rfKK52lXsis2tUsCUW2C
	XSUK809E5obBLYy3kZ/v32Kju8dLBg==
X-Received: by 2002:a05:6a21:730e:b0:3c1:279c:526c with SMTP id
 adf61e73a8af0-3c3576426d3mr2584439637.63.1784035620851; Tue, 14 Jul 2026
 06:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-3-clamor95@gmail.com>
 <akeEd0GcHSqScGIl@hovoldconsulting.com>
In-Reply-To: <akeEd0GcHSqScGIl@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:26:49 +0300
X-Gm-Features: AUfX_mylEu9Yyzm1iZHwnL_3qQ4wX-qy21nMalz6S1BYQvhN4kmLF8d5IT5che8
Message-ID: <CAPVz0n1aYREgo9Mqb2fioQKTKa478rhMYPJJjcUagjCGNTzMgw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] mfd: lm3533: Remove driver specific regmap wrappers
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:44 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:19AM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly.
>
> The commit message should explain why you think this is a good idea.
>

Removing custom wrappers over standard regmap helpers is always a good
idea, that is self explanatory.

> Based on a quick look you lose the errnos that were logged on errors and
> also the register debugging provided by those helpers.
>

That is not true, regmap helpers will provide logging and you should
not include debug stuff into the final submitted driver unless you
have a extremely valid justification for this, debug logs should have
been removed once the driver development was completed.

> Johan
