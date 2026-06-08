Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3C3822B5
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942089; cv=pass; b=nOSejxijyFOG8poS+Kp204J6smKKjikYGWXWjwKTQm2k+hEiwqEzKb0/rF12VxHD+OoPnhBt+NgZN+UfWVs9RcO7i9sSjefq8sGwtu+YL4BQN6H4U9UfHCb0aATQgDJVisX3asJ5sdBftf7aaPG27eSDVb/YgSxxe2+zUlFW7uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942089; c=relaxed/simple;
	bh=af15f6HxtpFPuSN9bctDtLH0URZFfK/vsHExebARsmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGeK0nL9+EYsACCcMmZFEDo1KtYTznTeK4RbVeSFJaApEESNhV8L5U5Fka/tE15HS784en5RSWu5S9HfBknEe4nlswUoY9klTzxLGBwe48bIYcQVs8FmjK0d4d+pbI4NJSoFf2+TeIsune6zBtXDKX+JHpxEC6rdtJAYOD5H0Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKNPOmJL; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKNPOmJL"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6611689dc10so2101862d50.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780942087; cv=none;
        d=google.com; s=arc-20240605;
        b=LVEQubNQy9wPUZzx3CWHeOJxIxFNSIgTL670s9H9NezCxKWo2reMcZ/b1I5CsKH4CK
         Ipge4+2QDNfQ/c56f+mxIwJCbv6v2yybzw1XxxgK1n3eEUtDE/+RxZjfqBeGUEgxI/L/
         0wwUzNLgeaZYMqEKClchWg28SCVP/yJqbL+VS/pLkBCcLO3DnrrqsoqY8EqUuOZdtC/Y
         iYhGPhxKhGldQtJUcrPnYOJvIgPm59BME0Hq5cxfu9Xs7egYQ/1s3q0fRkD4kD9zwuab
         i5qfaQX/IaP66MZtVIRtuZ2BF0sSCxJwstkqu/B+ZXZTQSRcc9GNUJP9MMk70H778RJq
         5DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6LAXhhHuwnflAJcQthLO161IRLRgGSYNeprsC2Irfo=;
        fh=cpIB/iO5IfIYuHpvVoLNBbhN+VWxiJzluuaHSeBcCmA=;
        b=eSTWymP8KEYQ6nIvdr6jnYFDQYUSGaS/WFGs5a/+0PVT2Rpn+pYHGtbTlsu6eFuYnT
         WN6cNYNwnmWi1t+C/fNs4ZkC6Cg95mhzO1MSHh+MQCsSwjzexoIsndanZEPM69sG6sMS
         8cmOIiMrdI/MjtUg5z4u4nwu5ItuzxxhGSh7Vn0bWVQb2OWDDZdhH1r9Uq5mnneoRMvp
         IzReV1y5iDqx8S/9E1Bk6opJeUqAtwmpUIas6pF44WoxkRVEDeu2+UCSdRolEB4PZKWT
         LPcr7YBshtHGtfuSuaJlAzqr4+Tjv6JpMw+2Vr/70XLwYr/X9RKyPP8SYJ5D+BEK/h1T
         UPOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942087; x=1781546887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6LAXhhHuwnflAJcQthLO161IRLRgGSYNeprsC2Irfo=;
        b=eKNPOmJLZsmyAp3JP2AvLrUx0jzIbmOXDCTlkTq8geIaEDEuQzgA2xEk4APHRkH1LT
         a0KEZ5X7Rb3XKcHzUbSZ4j0YVzyTVgaEVdgsJyDDTk6QOky7a5pk6EmjwadNIFtYlVQD
         ePZK1+vPv1kFH+iCmJ+/UzSvmMYtbyu+50EVTnvlZSmpKkp2ArrSh72tx5b8YSyu6gOy
         6gmYVTAvB7cIkzKbHeFI7P5hK7Kz6dzlxLvfqQvIfQ+atWWm1Md/9c10/YHMXuBIug87
         m7XjCyAek+51PRaqfMCkVQL5QaNYwQXq9RPZZye+GcUo25W+elyqforxQtffqoe3kapm
         0gTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942087; x=1781546887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6LAXhhHuwnflAJcQthLO161IRLRgGSYNeprsC2Irfo=;
        b=cvrdIH59CYwPxcCNtMVk0cihlgTutV91Ircg1ul3tcnwb8OLwN95G+yho0bP0G3OQu
         lr14G0hUK0Nj4DuKpxWZNJQQ/HV+6glsS0aEBH5yCiq2MnEoF7KJEh8Sk9xTlzg1CJey
         GgdTIaCrG+U57q5s7EsK3OoePx+G/1HfE0WHgzH4Qssu9WekNa3gc39nu+V11xOrvxCH
         DpGUyfpIXiUw2kXaYUWb90KCCMQeNNMYn0lHaJTfFrwVOYuX2waJLSZVLswgQYlJNJdn
         OcgxLeZdn4MWb0RGYXnQRHNAvM9bPOr/6jGIlhYvHoP1DCb2G3BiAR1cHjwmYwgh3RqI
         k+Lw==
X-Forwarded-Encrypted: i=1; AFNElJ80tNC4UxEBKdTlCYU4Cio9t4DHB7LoSDptXOOhrFr8Nc54QODZno7g0lWnwsNnbiMWM7EY6mVLEMs3@vger.kernel.org
X-Gm-Message-State: AOJu0YwMg6DbYjiKqpVx+oP5GVPkNerrLslld7oPrWAriPowqt4eZxLX
	k3CRxZ252KyaC2WZ68wMsK33lQnOaP096XKt99vMFYDHDA9AFkcNYQ80u97D+lhel1F37zNq66F
	r2rrA217y1+WoiZCxHGto317+s+cBlQQ=
X-Gm-Gg: Acq92OEJNZgP2dhAoyu7JVMg7h3PIdG8U0u68ijJq1yTl9NJtIBfNI3ud92VarnhrsB
	Eq0ZjZ8KPwxCXNSHMH8tW2B/oTGUfAr6JrVfdLip4LJJGV7ToL3+lWljNoBkbnzTSItmMAT5cGe
	E0LjKlV6qWS8DpNodenxEsMnAyZ0WD9XpZVYOqfby3C5U6fBUxtoxQXLLUo0BdOc4KQEtuImu2e
	1Z09tX47p1NS0h2If0khB96ohlO41zux/w5esuNlG4Neht1TsPsO34qYKnkekqkNdiFPqwc+P+L
	OfoUF/hkQZ/uA/oKuOE=
X-Received: by 2002:a05:690e:d51:b0:65c:2404:ac3d with SMTP id
 956f58d0204a3-66106e0368amr13808719d50.13.1780942087017; Mon, 08 Jun 2026
 11:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608175418.1936892-3-tmaimon77@gmail.com> <20260608180132.863CF1F00893@smtp.kernel.org>
In-Reply-To: <20260608180132.863CF1F00893@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 8 Jun 2026 21:07:55 +0300
X-Gm-Features: AVVi8CcuMMLCFtphMXjKmrQiODvMliWOxLXr8dtDj0MRlfjKwC6J-Leqe9kLek8
Message-ID: <CAP6Zq1ggj5+Gko5VY+GmGVrJWcCz8k-WigvtWiL1kwTYXcC9wQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

On Mon, 8 Jun 2026 at 21:01, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The alias mapping convention for NPCM8XX was corrupted during the=
 conversion to YAML.
> --
>
> commit 04ac00da42e73e1f171a2c2d3fdb84bc4768096a
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
>
> This commit converts the Nuvoton NPCM FIU binding to the DT schema format=
.
>
> > diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yam=
l b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
> > new file mode 100644
> > index 0000000000000..0f95def019105
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
>
> [ ... ]
>
> > +description: |
> > +  NPCM FIU supports single, dual and quad communication interface.
> > +
> > +  The NPCM7XX supports three FIU modules:
> > +    FIU0 and FIUx support two chip selects
> > +    FIU3 supports four chip selects.
> > +
> > +  The NPCM8XX supports four FIU modules:
> > +    FIU0 and FIUx support two chip selects
> > +    FIU1 and FIU3 support four chip selects.
> > +
> > +  Alias convention:
> > +    The '/aliases' node should define:
> > +      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
> > +      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&=
fiu1;
>
> [Severity: Low]
> Does this new alias mapping for NPCM8xx correctly match the original text
> binding?
>
> The original text binding in nuvoton,npcm-fiu.txt mapped the aliases as:
>
> In the NPCM8XX BMC:
>         fiu0 represent fiu 0 controller
>         fiu1 represent fiu 1 controller
>         fiu2 represent fiu 3 controller
>         fiu3 represent fiu x controller
>
> The converted documentation maps fiu1 to fiu3, fiu2 to fiux, and fiu3 to
> fiu1. Could you confirm if this change in the documentation was intention=
al?
Yes, it is intentional; the map in the text document file was wrong.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175418.19=
36892-1-tmaimon77@gmail.com?part=3D2

Best regards,

Tomer
