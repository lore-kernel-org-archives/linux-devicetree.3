Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB9416842
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529384; cv=none; b=mIbBvQ3gA6QGC72ZpB3q2JgajuyisiCeVYsdxGuR36dt25S944JNf+WpGiG7c0xYGOG41ni43c9gv4pZeqFJ4QlZgxRxih78Re8pqQcwH/+P+n4cO6n4dPuwPOijsL5MFTzfF2nxz5leMY5TOme/PVGUy1t0E47qlFKwCd0HG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529384; c=relaxed/simple;
	bh=wokLofWxv7vLrWb75WZJGxZonifi+3z274aDMO/O3SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oShRLzh9LaJP5QIuWdbbUt3pb/wT3b6Od1huesUXqNVJ5vNXbtUacZ6zI0bWFYgN8l9oZkh5xvWW9czAiS1rQXAjBK3wrjFUP8eL8AbuOCeoHPBzjhPTKtkitdY+z6nhKDdLqkHU/gAEVz7/5ZqlmdFvJsEwuFhd2NTGP/qqc9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ee4399c423so626537a34.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529381; x=1787134181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CR60h/fVXoId0NfC1qox1rIsZX7Vdp8o1eA32koeHU0=;
        b=Z0n+KBp/wt35hzm+rh0Iv33jpii51AnXBFQhHkd5LtSk0DOUGMix4OeER8gaTFEBUE
         rXDDZMHRDewbaXikiDFaZSzsFkXqpwvJ+BTXJnOvc4P2unsK/YG3hb8GISQyVZSEF8Wh
         xEUjQSccB91r6sn0Md/T5xZndhT9MOVVSq8ErB93UE8FEXy3S9Rn8dxM6nhLF0j0RoG9
         KKeRYpU14Gobal5waNNovavXeJEeYhYj1059lvON/CnIJlD1DuQ6QVvjvjN7hmDCnkAj
         C+35sF6TVC0hEXTez4DTolN26xUUxwfjmmr//rSU5YohCPbzmmnw3toum9H+pgjKdTQM
         v43w==
X-Forwarded-Encrypted: i=1; AHgh+RqoidEtJrWpRdOEXeJYeRWXFnIeh1mqmhiB5Ggn1g8EmZr6cziIMiK/2SipECrwnl+Fn7GzxDJ3feKV@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqv6qkprt6h3ptE1eYg8Lbis7DtO9S11VP7JQ+XRuGrlTFxlz
	keyX4pbUk5vYBbvU9lJPSdydxaozNv9HOGhVtzBOEzbFD4NpAzTwF8b+9QurxBx5
X-Gm-Gg: AR+sD11EtuzlsapNGjY6Rq0O9lUA5DXU1Pz1b7Fhcu0y+Biv+LNg6pkgc0XVFrsNI6V
	L41DNKgMp3C1w4OncjfXiTk3bLEXjV9CiU2vtSVPjpWdD5vZdwpec2R8vh5snyER9136KOZUFCD
	NEGDrGvoKg55ghQ8lAv+A11S0MeBecSnUnDb/diDDe87C+wMXiD7gtWK/IAJOMo/t1REjTpeTUh
	vJkK3IpWUiBmCTvEi1K0IFXi6zJSIaOvK0YvNBG3NZ0Ca8zj9DAJLQQ77e+59jL5gxbv0/Ydjb/
	mbSQWQMEVNvkRy8Qj5iejKgXNl2Fvr5t4ViN/xXnd9vmBaYM/eF5QBZlMwpoYUYT0XcjXww9bmU
	BJpjv11gDY1pjEbx9tobXCt50wWe+KSAVYhaV1YTZ8ZPT15maLkDG7zsp/UftNMI8H1URRMRRJT
	eCEvI54zP5drV2nlj+oJ1DzbLTTgxFkhFlH0GUwTgbj16+2DvV+sNerLc44wXOYm7Ka5/eHNIHV
	XdetAVPV0TBuPn03B2pl8tHcA==
X-Received: by 2002:a05:6830:6ab2:b0:7d7:ef0a:1ce5 with SMTP id 46e09a7af769-7f3b798f983mr3625048a34.9.1786529381036;
        Wed, 12 Aug 2026 03:09:41 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3209120sm2745776a34.7.2026.08.12.03.09.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:09:40 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44856d185bcso514937fac.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwhtXshhfg1jbCFJ5XTrp8h/roRgvlWb4uzavZDmVvKimlpEUAP/h/67Yayr47BjpzZinrYJFNdVms@vger.kernel.org
X-Received: by 2002:a05:6102:3fa3:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-76c8e62eb86mr823119137.7.1786528956520; Wed, 12 Aug 2026
 03:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
In-Reply-To: <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 12:02:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
X-Gm-Features: AUfX_myt-2ep2N9UFFpinQmtMeTX8Y6aB554SNFoItehXn5f25ET5eoahbFPK1U
Message-ID: <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>> +  firmware:
> >>>>>>
> >>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>> generic "syscon" which is disallowed.
> >>>>>>
> >>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>
> >>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>> it is fine, but you can't.
> >>>
> >>> It provides a firmware API, which is not available until the firmware
> >>> provider is initialized.
> >>
> >> I don't know what "a firmware API" is. What does it provide? I know what
> >
> > It can provide lots of things (everything we are no longer allowed to
> > touch directly from Linux ;-)
> >
> >> a clock, GPIO, reset, interrupt, etc. provider is.
> >
> > A clock is an object you can access through the clock API.
> > (s/clock/.../ for the other cases).
> > Firmware is a service (virtual object) you can access through a
> > firmware API.
> >
> > In all cases, the consumer of the object or service needs to know
> > which object or service to use (there can be multiple).
> >
> > In all cases you cannot access the object or service until it is
> > available (initialized and registered), for which we have -EPROBE_DEFER,
> > and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> > firmware".
> >
> > Thanks for your understanding ;-)
>
> I think that's the difference here. Clock is not an object, but a signal
> on a wire or within IC coming from one device (provider) to another
> (consumer). Firmware is not a signal, not a wire, not anything which can
> be provided from one to another.

Oh yes, it is a service provided by the secure world or a different
CPU core to the application core running Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
