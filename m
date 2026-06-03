Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE259403EBD
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484590; cv=pass; b=IFxQlKbG1q73cjckPvnLST5+0GZmEFXRaqYLgIVPnjZf3IzTbXSkQx3oXENyA5ap0AuI5Wy0mLAWGvLymJwwk+IuGJdm5ZujfMN/QGshnuX5eojINGzEwewWxVKvzZcvrLqZEeIOp8foI318L0R1L11zPAw0NRQF4O15076VeXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484590; c=relaxed/simple;
	bh=jHEGkQWmCiRquYv7dcdV7LUzPZN4+dB+tUT+2l122Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRbDDr7bFNEvaPNocjm/OpOZkt5fvpy9/5Eg0v0gTnOh3mgyAYT/XPp0rQi4KtONeyykuzsXpB1vqVjmFkdUEdv8hOuv5VQjDnCpnGI84tbwPbtWqQ8PZGx7BCfci1uUx3PipYINwZ7g7C+N98ysyga3DXUcTnMU59evMk1Thn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nY/gxJP9; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nY/gxJP9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b3637b90so15250585e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780484587; cv=none;
        d=google.com; s=arc-20240605;
        b=APAe/SmfBivMn8p95LEsDng6w1NmiaZfy+MH4OnBGA8HHDv4JbiOrGPYCYH4lyJgJC
         BkscBM2RyREsSl0JfBMrlGAyqikrdsDlEgWaA4GbNPO+Zudwfwuym9C/iU33elBsSkRx
         prdxM3iZfsBa3OVEMafJX5fAsGa5cHg85k2zM271ijzob9q7lvmFKMCXh1Fp80ej1dKE
         yLuM9Jh1ljmv2r581bAEDT7FJpX3TWTqOEyva5goM7spuf4Y+jP425RwsLnY9VVzgAnS
         5r3z4VTryuxBQVofGhjFJarEIN49JATdaNoUG842AxTYndVSpwjpEbX9yNk18XX1Bvk/
         27mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=19ZOqLcRfEJQli2TJQ57Z80anY5/azGxsdyaKOdIypg=;
        fh=98p97WgDOty0lFZcMhbksLEFn5UO6jXmcvdwrZ+2Yas=;
        b=WpFZrR2KfRsyDTyk7qW28PJx6pTLn0x7oHbtBaL1+lKhdsgMP1Y+Ey6ooPtSq7sQtu
         6uuLrQzzEHgLpPyiHClWitCpOjHyGCwPvUDOx7roNVvoWVeVJKE+QbbaTVC5USfH8o0V
         EEmdSOcMhm4fWly3hvr87sQWuGRcN2mZBlxfmi9rrVruKGPvp3XFqZ8maVD0bNlMFrpj
         bpC7deybtFUf24yzfvl+9KWsxscJTYLY6+woKA+sz5M9R9qK0mD0fTq3ilwcwcEFIUr6
         SRYoUgpYPT3JUoHNfZo61ywtB4pgf5ftUKrrbYll9XMYpZMJMlZhMZ0bnftM5W0W04NJ
         GxXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484587; x=1781089387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=19ZOqLcRfEJQli2TJQ57Z80anY5/azGxsdyaKOdIypg=;
        b=nY/gxJP9e1y0FKjZrO5EqSbnO4O8hk9sQ0hTUGdTlzHuJtkOdx1M9hOh9T3xtNCCZ1
         MreNqdPOI9sL4RHsWTOlS5hh7qJ0g7c5fQdqa5JBGCZ5TR1Y72rlsPZFqRI/yeGWpNX9
         iZdDnpDuErE1uV6dunqz8BKbHbT97LGP0PNt9yyQUIeQqmt8tf6H1a9T9Lceb4S3CXaq
         IJGdbAb/zGnSKy8vsX/T/EFMstKy0p+oZ9vfxqbpkb3eqnF0ofyWvn7ecM61xnNZqSu3
         x1MvRCweOcabb9C1fOvXCGPulA3B6nfWW+dZ0pCa7Ye5MWD8E/jcQrgyrVVy7yN9fyR5
         fh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484587; x=1781089387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ZOqLcRfEJQli2TJQ57Z80anY5/azGxsdyaKOdIypg=;
        b=VhsIJCA3SIAzOrhBvyqh8jlW1bIkgIh1Yss8d5JLfCP77e5h6yCBRPJYARKf1cx3+E
         0YqJYS2yfgF5IHENlcCAesqZgPZxvmMOWBjg/O7nlKgWHUki0z4YboyV8AjLQg93yLhX
         Q6558mY7fV5zJRBg3j7f7f3ttbX6bol4MxjP8omTL0Abzd4j0v/n4wpt+GYaPrPQf9Yj
         kkRFaEo6Sy6nFHmYH1ozcuVSxiFC/5sTWvBchRgRpx3LmM0SvPlyllCJ+STMJL//CrHr
         AMZGA4iRtKaxfG76usJ3MtlZPeW1DGRCxicS3vL0tkp6UPrBkI/m46ERqeDPqoIEGXXZ
         s4Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+RG9S+/x9F0yOq+EEajzphcZF6RtcQw0PymrtC8g5dLN+F8zesyPcn9wQ4gLg+MFp/Ni91n+nKUZi/@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBz4x1UZKn+ZufQtSHu0hXMcSVMR3PE2Ky0UC6ucy+Q1QL2/7
	Mk/9IpLMXIqdjU7uFbtUQSoniE8W2z8kmg57/RTrE1ln3iHxf4T8zV6X7wZDavPByeuPjZcg5lW
	6YB60iyecfC+HQ07FujkR7L19LjRishc=
X-Gm-Gg: Acq92OFws0s2sb8Jhs30qGnX+OMnIZQXw20fIEw7FPS3/XvtyZLMsrf1BfCLcNtavfF
	Qjic+nhLGwMh4tjurgsx2C3E0KYpB9y0Y+/GsRmVm4XeVz03yahzpHG/7wusbjW4sdte5/XskWa
	Zc18LoAP1pZFdVnj1u3OkoOX9yfAYyXLvDZy6RBKsuXGRWizbnAJmso4m0a1Bpj1/8cYgBqdqSg
	U6NH7JR2dFys6lY7ii5UTeCpLu5quta9v6DFNIM+FiTFqfQRNK6y3T1vRs5qOS9cPpOeIPp1QMp
	YCH2/9HMvla2CyazDFBhUUi2ES63OMIRea3diFGVCPgCSnI9d/vxiiWzrpii+ocLMrYU0capuC5
	6J9gHUcqITm4rjhKCxPDXQhWPQatGHeZ7d1q9N4InrjArYWMWbbo5ab7iDdBMLJ4jv34YDtbLbV
	sVKKx/lO10lPwDF0ky
X-Received: by 2002:a05:600c:1d09:b0:490:9d5b:d721 with SMTP id
 5b1f17b1804b1-490b5ed62admr47852065e9.16.1780484587272; Wed, 03 Jun 2026
 04:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com> <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com> <ah66ljSiIc0ywFC2@ashevche-desk.local>
 <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>
 <DIYJ5ZACTWVS.13T8L275VHTKM@gmail.com> <CALoEA-w3TqD=2YP36=ScmRttmmG3BBCKvtfSqeJL0PVxRxEbuQ@mail.gmail.com>
 <DIYK6APQQX6S.2KLGTD0G5GCDA@gmail.com> <CALoEA-wXRhiTr1gA8GdLAmt2PO29N9S9FrX4ueab7P7FJ+HOPw@mail.gmail.com>
 <DIYKFNVUW1RR.1KP94ER0FKNES@gmail.com>
In-Reply-To: <DIYKFNVUW1RR.1KP94ER0FKNES@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 3 Jun 2026 13:02:55 +0200
X-Gm-Features: AVHnY4IcRQxRd24RJd5myssr89Xu543nyDRJPW1Xny6CHV5wBOKECYlvGFFZPyk
Message-ID: <CALoEA-ww3xT+YkyvDM7runoOP0xc3cijBgiGau2=hYqm7wSE8w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS series
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 14:34, Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
> I used the compile_commands.json generated by
> scripts/clang-tools/gen_compile_commands.py, which I always use to have
> a better experience with clangd and Neovim.
>
> Should it make any difference?

Hmm, I'm just wondering if `-p .` and `-p compile_commands.json` are different,
otherwise I've no clue why your output is so verbose. AI is actually
pretty smart
when it comes to working with IWYU and the mapping files, if you're up for a
little challenge.

-- 
Kind regards

CJD
