Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C3199920
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005208; cv=pass; b=ieVXDPIhqJzqX3qltMAuChYqezp6xyFbuMIM6bNCY5IhIDDcTyEydjZsWVN3zZbd6jDLSK0bb9cuRvWIWqLcVb3e5W3xBzWbRw850RJfwVH2q/dNQeFPylxEbCQKacpXWeMbHBXvxEbXKWSC7pL4ShlVH7mgRXLcQi1A+R6B9Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005208; c=relaxed/simple;
	bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHeIFUCJWJNZt65ZyG7NhweIWEbg7iI8MOwvqsJ95o8QW6iQ/CMRLhXZOoQtC4KItX/z7oEv2yFuTFjvbOY1f78me3jmYQqygSouVFYClogxz0MF52q/EjunKAtaHHUyCMwEFb33nIZSz0LxiAdvh+JDunlsKNx+XZpdOkH9xfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxwtnWgX; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxwtnWgX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474303f3c72so1266862f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 08:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783005205; cv=none;
        d=google.com; s=arc-20260327;
        b=kzUDEg+pTh0w3NxcB2IYuXskieDCjw/WavpMLJKdthb4mZBFIBGvJw31+Rk62aC2xV
         SUk5MgstHyKBdSgYSDZxE3IAnj+O9cj5kRAd+trYrAtuIbrllXH6Rrle1MtbBv2rREiN
         V+ObfeD/6UIAiqcjX0sj/AKm7Eb9QhNnnsq3318xE2z67k8aW7aBMivsUHFKioa9uCSS
         /XPQ/5AumcHQBgMk5R9N5ydRmwPiBvJpEv4zL3zRIbdzxi/mdyAI4vShlzfF/sa9P4A2
         Y9MIYSq2P8pSVDfqXKi1Lgpwaoy0k9w2upffavhVqvRU6ARaJ1DalSqx619f5XU09laF
         K+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        fh=1XMpycCqgCS82WzUccPaEYerWadrKrzJF6+wTziDzqA=;
        b=iGtcE+TnLfwtGwkMdkeFUiKBOOMFF1NxrDW9rEUHKolmQOpn6OYl4kVmCQIbMnp5M+
         X+JAV+7A5RzpgvCW7DhB6jiCe7L0kaDoN4zu1rh5xQ32uU1ToPyAkMfnQ+/mIl4Bfu3+
         X+QuQeE4ikzQUjn2cCf7RmVRL7E7BQHAEN5N61ulcD7nCbU1vs91HR42oyL1h7zf1Van
         +da2xLNPVT0JcN20eGxarpM8fXIe53EO3iWMNY3NZKJbFn5WoprFtKCoPLRyx5JBCrPn
         GKZbBXfUepOciBw5ZG98FcEVZh/boVMKcWzJ5W04AVhOvMrzdMyUoi97RGAPIJA4wXvk
         BThQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005205; x=1783610005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        b=mxwtnWgXSUJ2VTpxDgjhS7KhZUtoDgNgcYhnNevbp0k93vTeIRBovOxpbe5r1n55F7
         xgz4dC9vIg2GhR9kdP6BneN7wjbA6SE2DHVfqYBYMEeXqnwoAMZuxFFPm1LDoLmwYqHC
         XuYg+ywghF8myR54ikxzuuvjyJ+czHEqRHrlN15XDfqhqO5HTVvgxeCxfP3kpovvTQ7n
         hD1AwUBGhVSWrmu/JRUY7J7cRSgiCgJ2BTtLrCIgU3qiqiZyEu7YlJ1NxiGtsjaiSG2L
         pnKQFxVKoDksdl6k5lB5rvynD9icKEJgOqrzNslpia7bb7ryDROwsLjQmP2K/pijmFYi
         rrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005205; x=1783610005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        b=jLT2dlfblxNFuQM7Y88punyF16O39sIqLw6UpuylwDv/ZAOq3YDWkRTWCwdWUWVxyP
         fb41l5W4m8feE0mV7tD6CqDEAerozrLbpRvpqxyQ/fgb1FPomIgx9HlaxEkRG74OQuNp
         HmQIa0/CeMz1zmAe/0bQobNNRf1OYr7vw+I+UjKTS/5qkuAE9vVWNfUTw6Itj8QBtm6X
         878h0xcvtlP5A5q8gHZFz4j9X1rqqqSHuJE+tTRgkempPo7ADnoeqluoG4myKKlTZ5B9
         PDsGrs2MiMCNnWy+qCsCDuSJ58pVwXDPMtBy8qkzQCtwkFN/8XzVYIzuCa7GhRceg/6T
         NobQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLWpNawohhCKx+92zhDaYvJ7aDqyE5XbRZgSBxvIDQc2VZnrPxZQSbDccVSsntUJ7PcEkR2hww0B4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5AoiFUabFzX7Nmd9i0kJARXSaOkDL0ZzD0tihQ5US/ROI+E8M
	vAGho8vzk2P74iJJT2F2fdSifIdz0ZWkvSPH2cjYkS2rSxRJQ44bubuirjGlHS9zOIvTl4mucCL
	bh4zS1qwgQIOos8b4V95fNr7W4/ESmZA=
X-Gm-Gg: AfdE7cmp59na1ryOIEoRBD75/HKduCasBhhQTC49DTKWWfCcag/CBcCPvpfw/ig4yWh
	75kqmbhyGfroc4rv7YuPTtqHlPO0gNvFJ58jXPY0lP5q0VS9xo8Df9WYTpOlGGUSKreUgygQC6+
	qhAIRnkgDi9z9OPZNB2yRF5ytTek0rK22dIX+yQGPYR8VU23cuaCJDVgy4qFLhwTeuS08IEMMa0
	8EiCX9teSOY22/WkPYPxPRaf67BhNCUDw9iU8uY1avFmIuL0oUY2v80R9qfV3WoA8GBZFWfXoCa
	7cQtrHmmsFumY/FSu3Z2U1fPTriRjOyVagB+BfJ2tjdoS3nEcSaJwSdThA==
X-Received: by 2002:a05:6000:310a:b0:474:b860:b7b1 with SMTP id
 ffacd0b85a97d-477573bbc08mr9500811f8f.9.1783005204503; Thu, 02 Jul 2026
 08:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net>
In-Reply-To: <c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jul 2026 16:12:58 +0100
X-Gm-Features: AVVi8Cc-s3hEJSawL1gEVp8kBOMXlVewT2dK4bhHbDClofCdIh5uSGgHTJrBYuY
Message-ID: <CA+V-a8tcFzoGBZ0NBE=612Py+E6gJ4MRqyT2QjxSN1s6Dv5CvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/9] watchdog: rzv2h: Add syscon support for RZ/T2H
 and RZ/N2H WDT control register
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Thu, Jul 2, 2026 at 2:27=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 7/2/26 05:31, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On RZ/T2H and RZ/N2H SoCs the WDTDCR register resides in the second
> > region of the System Controller (SYS) block at 0x81290000, which is
> > shared with other peripherals. A dedicated SYS driver now manages this
> > region and exposes it via a syscon regmap interface, making direct
> > mapping of the WDTDCR register by the WDT driver no longer viable.
> >
> > Update the WDT driver to support both access methods to maintain
> > backward compatibility with old device trees that use direct mapping:
> >
>
> WHy don't you convert the driver to use regmap first and then just
> update the regmap pointer for syscon support ? If that is not possible
> for some reason, I would expect to see a detailed explanation.
>
Good point. I will send patch 6/9 and the regmap conversion patch
separately, and I will send the syscon patch when the syscon changes
are accepted.

Cheers,
Prabhakar
