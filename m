Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511726;
	b=v+9KrYkwQlCt5vF6AhXImvYBqF+94XPyL0hXbTmXlK66Bw0maBM4dlez54X/hH2s9q6b
	 /6cSR+JgvyOgSkYiw642eSEuZp1u6hHdZNehWIvjzFJ64QvnFfl/qGsrsbMD2dOu4kB/j
	 67f+wq+koFvcvn3LMlxLivLnSpcCIN4IJHyqBLaq8/47/JDxW8vDnvZghHrhud6cSsady
	 fLc7xk9Xo3ujF225HgIG5PI8C2dFkyy12/vRyWZDxe8SoXQEF+eHfMGwEzx+nbn1ZQZTW
	 MTurY4d33Aa6jNb1XyC1jXiEX5NM/tFVp+3YW+S8KTWOdYkQLmhDYTah9bJVKAuMPOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
	b=ECxSUddzxDcm4SOV6mDejQskC/oxvg1AiZ3WnhoMIHfB44CMc/bRqI5G6dKpIn/V8vCg
	 YClzZXBiBfQenYn7QcRBVNlL/zp6urHEPBqVqAp83JDZRQpt+ZJ7GluO9PPU1o5COT5K+
	 8gqRuyRkYo9WS1bTR61BXqFQQ5M/h/h37JOazeKYE6/ZrSdlg80DoXsa/oIW4wTSJ2JcV
	 U+gbmEOFdIE1jaEdP0m1Pfn5L/eQrDdCKCm+xmN2Ka8C3e/g75S/JAbZzoZTpfkdeowP2
	 BFveT9TMnQHFlWDoR2EAnxOIRiWDagZMYh2mWumNZSpM64IB6xHtTeJrbcs3vWwi3UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C2WIWGBz;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47178606A323
	for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47178606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C2WIWGBz
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c49c32650adso17664866b.0
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511725; x=1795116525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
        b=C2WIWGBzEq+FnQxdxvVZOO15sKgwmuqjcmlb7bHfqi6ECRcUGj4/+iz8k95r8NtdEU
         oSDDZ4mthI+EsAhI1MSvFnQUgGWktAeNSlXYGMKLHmaX7XVrYadYKQKJ+7vyiCiQSrD4
         BUWGZboAR7VUyo/W5RiRqOsS3TwUslLk16coM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511725; x=1795116525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
        b=uahzdas3NwHlBPuXWT4uk4aK6p3WVuBxj+mZrw/YMVz98Q2ES3E38LjfMt/nS/GH/t
         P9iaroCkuczcye85EHKKwwRkcrSdRZd2uN30PyZmrp/95wKp/E+FqaMv3mSjckJPIGLT
         e/nCgJNeRGFrOat37E5v5dRMy1LOVf6RuUYvAAsQCmg7npnqwoIaG+xGIv0U4DcUiaVG
         TnQVWJtnzY14spZ1CzmbVa7/Z6phW28MEAJnKXbcCHLcWmTE031QmCFLgm0eJEIT9irF
         lIAoiT0/lbcXLvIasfzjRwryfQXPz4lj4X4MKxtPREATgqscWvPKJQdXrybDxYNlTsqH
         oaVQ==
X-Forwarded-Encrypted: i=1; AL+hErGalQbeiROcoSNHLCTBFNTvMxfLUc+t/rNFF2DGSh1TKeCKiU+N/I/ntiaqMTKO7W8ZhVuvHvNv/79b@vger.kernel.org
X-Gm-Message-State: APuU4Z9uA4fzyuse5+5jl8ZU+r5bDyGN0n52koegbc4lgNcUU9FEqsy5
	i1S07teTZkRl9fDEIOXf9uVWFAagmoHpBeiU4GQFFRkyMRfFwIFNKmPLH/6PMYV7g+HiVuGNEQO
	h5fDIGvji
X-Gm-Gg: AYBFou18e3fIv3amvd/Ne0gf37U1CgQFcNyAwZpl1SyMnhNKlJK7ppDGW5fzEHLGH6u
	QGGq0+WGZFp0/qe5dpzSkT9MQkSil0QPcKAP/KkrWZ6IFc7PQpV/nYH9R83wINAPQbPRa6tj7hB
	zWG5jfQG5q+V2jQMDUBnBberMTPv8kSmLznA+puZfN90B2SMR7YU62XZmc4h42Z2jIL2N2TneUD
	H6rRYxJt6TyHlyOX14W3zEn+y8KkTZUavw3KaFnFzWWEeG6Ih41Po4oByNhJ2lxaaZ5jiNtQOwl
	yxG96KSOF4SPIxGDtCqD/g4iW1Jfs/hUEqBYAYiFOpSu5iyMDFxY1vG3D+VTwJPTppT6H2gQVLs
	nJcNCaAwkrILaiYBP3BRlD8SyGB09GHKqAXY/gpSvSxIQhlgUSVXn9xHmYGiVk9cS42kScSzZcm
	7Rm+lYsp39RvDL+TfbQcouEMxqCgUT+Di0QK1iKE6DF5epd43vmH6hjR0zOM3TbAUuYfgjPrVAc
	Wvwasqbr2/QEh97+nZk0BeqpglD+WzkWYPUsVCesD+qpK7FAsvB39Pq9VARC0taP/Oab5uQ506c
	CucsLAjBXsqLkbTyVShsnQ42/SQLfq6c6cRwUfy8EyZS9CFnwG0hp+blYWY4VogEZjtq
X-Received: by 2002:a17:907:3d10:b0:c49:cfcd:69e5 with SMTP id a640c23a62f3a-c509643dcabmr21378066b.32.1794511724735;
        Thu, 12 Nov 2026 11:28:44 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b58981sm9909066b.45.2026.11.12.11.28.42
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:28:44 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so2124705e9.0
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFiB7QXdko3jrD5IfQpJdgn8mzgS1JHUakECzANBBo1zqhVJMsdIATQEnSuGdObvuWisklmJ8v/0qYE@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id
 ffacd0b85a97d-49c6a645dd4mr1080826f8f.0.1794511721573; Thu, 12 Nov 2026
 11:28:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss> <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss>
In-Reply-To: <avUZ-uqxLAu2ICyJ@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 11:28:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
X-Gm-Features: AclHuK-14XxhBI8vAM9M4iq5bb2RGksEhVHE_lHln7MuRG1naDAYFNT2nkSydH8
Message-ID: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > > > > +++ b/devicetree.py
> > > > > > @@ -0,0 +1,226 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > > > +"""devicetree - Non-flattened in-memory device tree representa=
tion in Python."""
> > > > >
> > > > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > >
> > > > > I'm not sure what to suggest. Would libfdt_devicetree be too awfu=
l?
> > > >
> > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > objections?
> > >
> > > Don't love it, but can't quickly think of a better option.
> >
> > Would libfdt_tree be better?
>
> Not really.  The problem with all of the above is that they're making
> this library which is about managing a non-flattened device tree a
> part of the library/project/namespace that's explicitly about
> flattened device trees.

Personally, I kinda liked "libfdt.devicetree" that Simon suggested
(though my analysis says accomplishing that would be difficult).
...but I can also see David's objections to namespacing this under
"libfdt". Does this mean "libfdt_devicetree" is out, too?

One other option is "dt_livetree". That matches the "livetree.c" that
already exists in the source base. What do folks think about that? If
we switch to this, should I move the ".py" file? In my draft v4 I
still have it under "pylibfdt/", but I could move it to a
"pylivetree/" directory...

-Doug
