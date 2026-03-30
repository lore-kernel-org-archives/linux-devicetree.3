Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1303BD622
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867933; cv=none; b=Secap4TRO4E+FmcY2VTQv5kga2uSTDf8AUjsrbKpzdV+SvIo3SMH+qOA7tTXAjXB8FLlYHOKDGOYzvcYvS3wrzBG8wMtMQI86C68204TmLtZ6WBZEY0Q7rv4FsKxaNVifWd3k2hJeEe2YMQhiJzecisGIgURiTTCcLZgmZcVBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867933; c=relaxed/simple;
	bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U9DYv0rrvpWA/xzHpzSZo3NsOlYCZH+/0BjPJKXAgUTgYsMvFZ7R47SOvv70Vsyt1F9Pssol/pbQ6LyUcdrwUou9EMMEVt6H3SWbjqbzSs+DHp7z8wJLhEZmYiwDYpxTQdbfCif80xVdwQA3z0cgaGm3F6+/xKfdzXCMPApEAWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCvcQwNg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCvcQwNg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso42783515e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774867931; x=1775472731; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
        b=VCvcQwNgAwvtg6k5HaKlSk/DWAF287dpGwC0Rn8Ss871lQXbEI2DnRHtdW2xQXmJGh
         1n0yxr/aQ7X9PEd4x3a4rdhGLkK8/yVBNvq/kuJYFQ/MqrzWYRoAMq0xX/DVTmC4Ef4G
         Ytn4u/JkAGZur15HRZCJ9Q9rd2wC1JarucW9f8TKbKsDHtZcFgFZ0ziNyBOcbbhK+8At
         QJ/v1XvY0HOiHEfB7VRo3ZltFUZatWUXSOcapmU7lLnuSArdccf/tC+4RBLE2i4MmZW9
         Zwrac2m2GafZGJRLTfO56KACyfl0NUTm6Wm28CV/gxR9yv4YqTGJ/1i/uWgHcUK5SVtI
         TWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867931; x=1775472731;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tGCl9H2u0kxygEigoVcToA6cJ97rZF07Am4vKOJmbs=;
        b=kyK0D/pf1RglWea4822uaB9BPp4pfGQcDe7s5ch6/tkQs8H6TlpBnScta2Cy1B+5c9
         jVWIW0uyBA6jqVg41Juw2UVqYTWLg8lWX+Jo9rFkdxMnlb6gUZLgtz5gITlyBBWdl/iJ
         5IB6q8PtJi12yePAdAo2euWlXy8rLNxXP79FQ/kESkNunviAHDhXYT1qFHFRRurLyqVG
         ZlC1wYDL495a+3icnSm6IlByl8DNC5VcXg84CbEWcH9eZ4DofoaIxnpQMa3tzQ87Em2a
         O29pjPhm5LLZa5F9GIlQFFTma2/YmcJfY5Bkgtsu5OoRb9gKVTXyBMT5B9xuqHNRJvGj
         R+2g==
X-Forwarded-Encrypted: i=1; AJvYcCVxdG0IMKTAQRWlANPZmtWf61nNUcTw7HeNA2D4sZiJEejzvVKG41XqsdhIFlRoT6jW90zHKbhazaG1@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHX2IJZ7fvOLr8KonFmCWBogiBzOo1ujxvvo29v3/LCjhRi3y
	WSHoF6AzGoAa3nBSkxwzKpXx/lqEzeFBeAOYhV5N3WZHuBsDLtCBuAnhX6eZNPaIypo=
X-Gm-Gg: ATEYQzzqCWRSLxK7j9uLeWjG1YqIuOVbsyxf3VchnjCxzmrCrNTmJaN7kPgEi9iEWIK
	/7E01ZcyQ6kjaj5WMDTGdKzwe4QxDWExkHeLEVDCiGIv8poN3E3rdH4uliyA/nAWqbbd4WxJ2GP
	p8nUbqyum51ZdD0gFg90YTYy8YZk4la2+3aIJcY3UWJ9TnMC5MckbhGZbUQU0jEJJQKwyJ55Z1Z
	On3NidPj0p9qF/sRfwrPUJsue8PxDOXLFIwaddWoZckE/I9xc1hpNP+sFAf0nN94adOQhNblXdP
	Xo/666S8r4yv5lK7W4EwB5V88pMSqJLUxiLHTgvi912x7gdYuowFr5voVEbkawhnUujys9IeCsr
	f6QdyeqMFxNgIRUooLq7ZLH/DwFG8Ni8HWJDYAqS77OAKS3scSRPgxcXPz646UJdku3xOG2kiuf
	8kQd6kbdX1wVGbd9XoAWvhoNmbNLp7
X-Received: by 2002:a05:600c:a108:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-48727c82082mr167788605e9.0.1774867930830;
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm78932785e9.0.2026.03.30.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Message-ID: <6f0be0a71c74e7a7959e9ad02e93aff1cb8ef712.camel@linaro.org>
Subject: Re: [PATCH v8 02/10] dt-bindings: power: samsung: add
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 11:52:08 +0100
In-Reply-To: <177409897339.266364.69715997034739052.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
	 <177409897339.266364.69715997034739052.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,


On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:47 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/=
Documentation/devicetree/bindings/power/pd-samsung.yaml
> > index 9c2c51133457..3f1a2dc17862 100644
> > --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> > +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> > @@ -44,11 +45,28 @@ properties:
> > =C2=A0=C2=A0 power-domains:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > =C2=A0
> > +=C2=A0 samsung,dtzpc:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Distributed TrustZone Protection Contro=
l (DTZPC) node.
>=20
> For what purpose?

It is part of the domain.

Furthermore, TZ configuration is lost as part of power-domain power
cycle, so this allows a driver to take necessary actions (inform the
EL3 firmware). I believe this handle to be similar to e.g. the existing
samsung,sysreg

> Your patchset is organized in odd way - first patch for me, then not for
> me, then again two patches for me. Please keep it consistent. Or better,
> decouple since there are no dependencies according to cover letter.

I'll update the cover letter to describe the dependencies. 4 depends on 2,
and 2 depends on 1, hence the ordering.


Cheers,
Andre
