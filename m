Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE141A554
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220314; cv=pass; b=tv1s4ov8psRn7xbGhrEspnuHQGwb6iIhksQkb3Q/MEM57T7dA3Wi4PjkonDqtVWeoq+9qwrN3TiojY0kITz+dsB7xH+IGZEN6ZFzAOAmPGs+X6aErkiFtOg5AFnK1dLB5XPqPzJOiv4pm7eiKV5U4z3Of92hks/xkrxlrUoFjwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220314; c=relaxed/simple;
	bh=t3xYH86c4ExcaKChH03nscVoJU8EICNUpRC002l28p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PU3fgn+v8lK/8qa75Ms6L+X9VYEJ8kfHEib7dfjji1aNglRqVN0o9hLHiPP6kB2t5vf+Y0ROjNK3ZoJrgnhlZD8jd+OoN7HQmNV/4qmzlHxr4KdjLgLVR1/yb/1sNrsRDHAAlpg3g5fTQd0J/1pxbh0HxFFz4gfgYqbVYP52mac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0XmTq+M; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0XmTq+M"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a615978340so438631a12.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788220311; cv=none;
        d=google.com; s=arc-20260327;
        b=Jn566WaTVW+7P/IbkRtPhPFtJ2/jege8YdTWsgIUedmJ7YwDkz8DYuDTT7zm3CTRCS
         Jk9Ssynesdo0u9Xofv6ILY2WTug+BOfOjFe2fVrAmeKI3HvVn3MRftUpyM1R2uh/wRio
         CkaEhTJHGv0qaT/rsliSC9qARgYfgDjQn/U4hDHYhJkI9rg5K1wuVyiIBSaLJe7lP8yJ
         MZs6eMszxjKi71cxtkqXMOBQ0aAlzRV5sW9m8a3S6mvxbCCPUxSuR+c8lYnn5Vyv+gR2
         iC64l1opgJtGD39e8UcLcZSmlD+109t3DKAsV91S+3EAWdoyPh4c/E9qzWyBhrnnFLl5
         vTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdeoGj3QRUvukE27/0x3ejCrlyT2DNzcW+QIx6ZFAP8=;
        fh=7IkyLeGN45eV7G4UYkPCC/KmGmtV+5/0lfevIsAOCkI=;
        b=Gkk3VT1BgAot8mbt+luTi9MVUM5OgiXKP5hTXTt6QmIW8iRssz+n7UqiAaQ7xMAXhL
         OjUIlivo2h93fNpfIZYRIXTtvIDKNM2bkDP32+0RorsBoBO2o3NOZO/QGLfZk1wXWost
         HC13wO4ZDpes5qn5Hl422McTtb1uxOpSqMsshMmQEIR9M467f2HxXVbzbe+ysY60n+jz
         YP4rwEN0OVyFoBlumsz65SgM+brMr+xgSPit5h+8YRHsuYBC0xbEs4CJoawOrb8TLSJR
         F6bPm6mwDUC2we2uXs9kucIEfO18EWFTWU5xzkeznMFE02v3DKNl3ZU/LKhpHAjp5WCS
         jidw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788220311; x=1788825111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdeoGj3QRUvukE27/0x3ejCrlyT2DNzcW+QIx6ZFAP8=;
        b=j0XmTq+MWVZZoJEyl/HiVf27hDQ62KTcKDngUOqX7Rd3DpMLYfEluu04viTfJFTn7u
         u6YfwiwqjNOxshrgiJJlsfCwGfDGYxAN0ObJwOXhV//1uVn9YoTboLUVW1jdAn+AUcV6
         JdRaxvynPp4feqSyEuXdhWfFSRq+dO3mOtjvmxCRyj76kKFvaP1AZSvLGto4h4wRPDkA
         KP7Jr6KjexuDZtzK7A3h2G0rmwOZI0Ey1rxXxCuTsqgSV25dXj9pCz0HGnEMshUNd9Ji
         7Oxk2tOzLCt5Yf4g/hLFyr6aZdk5UWMnK3ZqNKBFQ1UxL2MpkG+DvQs4nlUjn9jGMr5V
         no2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788220311; x=1788825111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdeoGj3QRUvukE27/0x3ejCrlyT2DNzcW+QIx6ZFAP8=;
        b=ahJvBXqou7frHp9vm1ollQucm0lL9QiUsyNpu5vHIHE4FLLkx/JiQOiyN56FU9saIU
         pu/5vXRg9BmDdWJc28FfOF/egB0SJNtbRYgtfUk3LL1cJ5KRX/811UbZBYFZ5CkqYKnp
         /wyjPdM7EwY58RduG0AtMYYixYW1upRpzIWPML+prbZUVOQjxbniL0lGhpuoFSLrYclC
         3tstnMDTlze3rY580kW9zzmjTtj2uhiKWUi7V3o/glei1e3ArsPVzEeAO8DiEb3nE4XV
         U9kBut3EXRWBcXjvujV+ogeptrSlpT//hqEUYfYmcePZLEoh1MvcZ09l4+Mi+nA6vNtl
         SubA==
X-Forwarded-Encrypted: i=1; AKwUvBwpoeOJPNVUy2pARf9okzImtk2FZE/uRaGfF8VoKWAgaTmbspUUjoJ1W3CieCqzymWtSs6mYfWb+LTJ@vger.kernel.org
X-Gm-Message-State: AFuF++m0JPMD5rV9e4INxQNknOt9G0YkLkq8SXxHCT6Q2TBX5M5fm7vX
	ud17Il5Msr0Jn88IVSUYBiABkncB3luExLNpQHfhcYma58xP/U3JWe5tBp8h23CP/WUNnG0xEgv
	KzMZP5YzV9ZURgQN06S6d7EqSCZSFgls=
X-Gm-Gg: AYBFou3/avw4Lrc4WCL7NNmjfpPEEHEDHhOcVN1xLYv7+Ee7oLgP5bmkAfe6Pt1FvVm
	E5Tn6u29w4MqrItzNxl3NAdFYJ8nixopPaKLwXI0YF6Ox5EoksS4rkpXoOnm2kS5x+K2ipWp6ZW
	gSlpujtO0PmN2poIsB7lImZy6Kv7pnisTGB+iPucayUmT9Pz8hZVu1Dw9i6qi+2qp8f+7TC2EIP
	b637I55ADRSOSyuj8GJ6itWBR32ggdmDJ3MNJ43BNW+O6luvo/mFdVE6lmROxnNpAHBd4WSeyuU
	uk7voWXOENkrk8ukd4XeNqRTojuHWQw42dUzBLwlOnOWdjrSU1DgZs9CQglIBJK4vuuXqVUgFAW
	KJAA=
X-Received: by 2002:a05:6402:3204:b0:68e:4c0:f59a with SMTP id
 4fb4d7f45d1cf-6a668cbdadamr1448205a12.2.1788220310870; Mon, 31 Aug 2026
 16:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com> <20260830-honored-llama-of-realization-38eddd@quoll>
In-Reply-To: <20260830-honored-llama-of-realization-38eddd@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 1 Sep 2026 05:21:38 +0530
X-Gm-Features: AcwNN1W9t_PNkWAnCMFSJa_lGVlfSOa-JFT3_994hP0eVrH-g0-08VIHzNJXlew
Message-ID: <CAOWyW_44Z4rQ98H_i_tO8bB2Jkj5psCeEEtT8kSEgL+XOGshOg@mail.gmail.com>
Subject: Re: [PATCH] regulator: dt-bindings: ti,tps6586x: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 2:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Aug 22, 2026 at 12:40:28AM +0530, Bhargav Joshi wrote:
> > +    patternProperties:
> > +      "^ldo([0-9]|_rtc)$":
> > +        type: object
> > +        $ref: regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          nvidia,tegra-cpu-regulator:
> > +            type: boolean
> > +            description:
> > +              designates regulator as the "CPU domain" voltage regulat=
or.
> > +
> > +          nvidia,tegra-core-regulator:
> > +            type: boolean
> > +            description:
> > +              designates regulator as the "Core domain" voltage regula=
tor.
> > +
> > +          nvidia,tegra-rtc-regulator:
> > +            type: boolean
> > +            description:
> > +              designates regulator as the "RTC domain" voltage regulat=
or.
>
> These are coming from nvidia,tegra-regulators-coupling.txt, so the best
> if you also:
> 1. First patch: convert nvidia,tegra-regulators-coupling.txt, to a
> shared schema and correct other devices which use nvidia properties,
> e.g.: ti,tps62360.yaml if I am right.
>
> 2.  Second/this patch: reference here the schema
> allOf:
>  - $ref: regulator.yaml#
>  - $ref: nvidia,tegra-regulators-coupling.yaml

sure I'll send v2 shortly with suggested changes
>
> Rest looks good, thank you for doing the conversion. It is very
> appreciated, although I am bit slow with the reviews last days.
>
> Best regards,
> Krzysztof
>
