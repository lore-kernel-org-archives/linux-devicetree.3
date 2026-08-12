Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF09332B13B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533280; cv=none; b=jgWlipwSdCdkw0Np6Z2H8WXmBprNeNDB7qU0h0D+nNrORpRHbuk+45Udo87OtgUIMS0Q6GrzPhq6sMN4xg3vERAiH7nJfNaqicbOkk+a3mOIEm3C3nPXRXQEjtyA5kl5UeReka8DeLdzwswp34AdjPYG30B2tVTvCJU4ZGpnw4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533280; c=relaxed/simple;
	bh=ZDQ5pPWDKwycT4E4mNOoJZ2LV+cHXkkjmMM1uiBduVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0J3J1euhJK25HOHa5RVpzqHwYOBN8goLkx3gBhmNF7+i6LZZYvus78yWPxW0E0QWpuKXI1kK3eBM3Z8WzoQLIcssP1wlXifvnWnkY7K3h/LVtdWKQcTpEfeEx6G09adtUv2TKw96zpm1mmN4zOMPZMz6NCbFrWZm+c8a4rbP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf95ade656so312338e0c.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 04:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533277; x=1787138077;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCCZvy6wBuqHUxauMraEzIMerW1TTEAMcJhR4qIYKD4=;
        b=ekWy/wlaZFzICLVCD5tlYLUd2cV6T0Tpx6rmrq85y9koVMmdDx7B5pyQD5Pz0Yl6FJ
         6MHBrVbiyB80PwzM7CBK+z3toEzebiG6nfEgAo8VGbzGVLN3gMDjzB4uoQyRpokmbnPX
         MMl9ntgVG9b0LENpnL5Qh/xUzHxF22g7Pg07BK5SZP+AinSD1it8M6y1xV5RlPD4ayfc
         nHjbGy7O7uDizvrd/fadh7B9i5QMD0dMAzoRD2NlN6t0P+i+xE/F19lFsKYY+xfYfjXG
         cSN68WbGb5mvJ7IlVMNvIRh3JA7PlT8u/RQcABCFF0ZoJqhdnhqDgWNDctVrJXodwUT1
         DhKw==
X-Forwarded-Encrypted: i=1; AHgh+RrNyr8aHfeVuGiieEPdCFWxlFOGCxjbsqirvzPFevjVuE0I92VgmeELGeqRc6tMFMTCGQXnLs7Fy2CG@vger.kernel.org
X-Gm-Message-State: AOJu0YyV7Q5zsECd53hJXPJ95Ij02mvL1BUIt/n8TQvAafgP6AoRhPVR
	Kzuadq9bHDsYRqz97qV/m7LDR2NJXXID1GCf8lB1fgcMYUVJMKILW5llYyyK/fvT
X-Gm-Gg: AR+sD11G5jUVEqvdqubZYI06SXO0XCIha7FZ3blm8GvtQ3XW9XGaqL3F607YUlzkslz
	vmFOnyL6Hffm3riUd82phr/ym4Crn3j3ro1kpvEHoHww5pM31A1iPzhA1HgDrAZMBi1ugXNJJS7
	3eciujYVePuq76Wzg66l9CLKAyQI3cUNDoKf48B+iKctclnxMz51BdCEF0mfFE6dZcLpIUCIL7L
	S+S8zcpQD1OYSmmV21lun0ORNM2b4P39qCZuOYJJWK2c12k5UNcJv0XC/NRrIBYCOJ+q8AtrBoj
	ZBIsjCEW6erJU+tcIB8qxlEOCTnBBrryH/NI9OZxp/TfX4xRv5ts6v0ZIa5uxrYMbmpXDrVo4Y1
	qsrvZbaSCLbH/9LpOTTKfugCgsqzPIwKjZsOISes8URl4h+LTesqy7zIx+by74Ra17m7GxEMdQo
	285zNmd3qmVJsYvbMLQ/U0aYYluxb2p+h5zzabT6fuXqaBhmcVVyJMQCF2BcoikvxEWxUvx6F0w
	hseh0LCV4GrMQOwQIEYOFe1nQ==
X-Received: by 2002:a05:6122:88e:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5c50225569cmr409870e0c.13.1786533277367;
        Wed, 12 Aug 2026 04:14:37 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b785edbsm924052e0c.15.2026.08.12.04.14.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:14:36 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so221742137.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 04:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoyKRNpFuvs38o7KMQ+DiTyOSvlxNOYC3tKiKQ9fCfVTaWSPLitCSyQkIg9bcdELV8Yz8VU9asgst18@vger.kernel.org
X-Received: by 2002:a05:6102:5692:b0:740:177:f357 with SMTP id
 ada2fe7eead31-76c8d1f94a9mr774665137.6.1786533275732; Wed, 12 Aug 2026
 04:14:35 -0700 (PDT)
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
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org> <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
 <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
In-Reply-To: <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
X-Gm-Features: AUfX_myBSrf5rDcsVRuaQc_or0Um_HrH3WBYGhc9bJh3otQ1_zgZw-LE1s1AUdw
Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
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

On Wed, 12 Aug 2026 at 12:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 12:02, Geert Uytterhoeven wrote:
> > On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>>>> +  firmware:
> >>>>>>>>
> >>>>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>>>> generic "syscon" which is disallowed.
> >>>>>>>>
> >>>>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>>>
> >>>>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>>>> it is fine, but you can't.
> >>>>>
> >>>>> It provides a firmware API, which is not available until the firmware
> >>>>> provider is initialized.
> >>>>
> >>>> I don't know what "a firmware API" is. What does it provide? I know what
> >>>
> >>> It can provide lots of things (everything we are no longer allowed to
> >>> touch directly from Linux ;-)
> >>>
> >>>> a clock, GPIO, reset, interrupt, etc. provider is.
> >>>
> >>> A clock is an object you can access through the clock API.
> >>> (s/clock/.../ for the other cases).
> >>> Firmware is a service (virtual object) you can access through a
> >>> firmware API.
> >>>
> >>> In all cases, the consumer of the object or service needs to know
> >>> which object or service to use (there can be multiple).
> >>>
> >>> In all cases you cannot access the object or service until it is
> >>> available (initialized and registered), for which we have -EPROBE_DEFER,
> >>> and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> >>> firmware".
> >>>
> >>> Thanks for your understanding ;-)
> >>
> >> I think that's the difference here. Clock is not an object, but a signal
> >> on a wire or within IC coming from one device (provider) to another
> >> (consumer). Firmware is not a signal, not a wire, not anything which can
> >> be provided from one to another.
> >
> > Oh yes, it is a service provided by the secure world or a different
> > CPU core to the application core running Linux.
>
> Service is still not a resource. Not mentioning it is way too generic,
> because anything can be a service. We have entire services-based economies.

Do you have a suggestion?
This is just a phandle linking a firmware consumer to a(n optional)
firmware
provider.

What do you suggest?
Perhaps "scmi-parent" (cfr. "interrupt-parent", which also does
not point to the resources consumed, but to the provider of these
resources)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
