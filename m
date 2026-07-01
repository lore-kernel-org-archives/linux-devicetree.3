Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6E43DA26
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903871; cv=none; b=AD0l1Dmqsu/pZTh+3bcVxJpdPTCMYocli9cfykw7HeVBwwPRXVJ+Gawd1qE69sbp0WBaNeP0tKe4AZRu+heYvArSXpNfU5a5TSsBkkbeH4cC1ydKm6pHQ5iQoLKAUa0wLCc+KCrRhuBA+JjvDYnnDHmP3q1Tk/Uy1CUWti/VWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903871; c=relaxed/simple;
	bh=GZVdHF4RDDIw1GGyB47+k+m0XFHhbNyNGeWh/pCWjI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQrP1iFLpKU/GF5nY6J4mXxoVBufvOUIoMzGPwk+VFUbY2ilxMRGkVfik+riIrG/o9aGlWOgyoEZEy98xCL8mnGNJjRK5WzUMbDi4Ifp+1Inzex9amossEgOsyEQHQPQBlJCuInVCD4pYa8wD9eNjoQKs7qG7yJIIUk/mqz4T2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7kun4Fs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7kun4Fs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF291F0155D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903870;
	bh=GZVdHF4RDDIw1GGyB47+k+m0XFHhbNyNGeWh/pCWjI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T7kun4FsQTg4nrByttcWF1XbAF9a1nz/xm5VEJGp6Vq6BvL4piRhl7pnpTSZaSsAv
	 o6vdGU5xtAPraiD6B8Aj1/xzLT/BeVvkRC60esDutv8NozfP303xB30G/dkU11VQby
	 BCcSNqv7e1MxVhEn3YG/ioapS6k5K4ypOjvOw3wlw9hBJ8M2p0awlpsfBQ0a+O3737
	 mfv8x7Ua6KnSPEuq53FbqNlRluTh+MLzo8GXEiNL5QA5BSyaGV9alRGPJvugzgZS8X
	 9x92fFNjHvpI/PYVIpjbqHZ1GQ7hyktFB9uCLU1mJC3CmOHgC5FWsCeEpNTD8BhjUj
	 3CcMF6KgvliIw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so579287e87.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:04:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqgesjhggVxqL+bqvCeLZvd66mfCYQKu6s6QKXhdYhBmoYgnyeKbkiKdAb9jxO+PJcqIcTiqV1u+7ax@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmAfUKKEa41GWp3dcF8xqKGrPxi+jOHf3Xo46xTafgxq60owm
	s/msIYxwuvaLzPHZmu8/kU0VME2finf0i7QI/g+rCq8nBZdVHGDQR3xkdnlxpvYU+G5lKM/I+3s
	2QgUO8LWBHQNnZ/Atdm99vTYQhM7eKCI=
X-Received: by 2002:a05:6512:2457:b0:5ad:abf:1e1a with SMTP id
 2adb3069b0e04-5aec678e6bcmr286502e87.5.1782903869487; Wed, 01 Jul 2026
 04:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-2-eleanor.lin@realtek.com> <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
 <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
In-Reply-To: <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 13:04:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1mqDetG-+DW_Loj5Ufp_v5DmLN+T9pM_28dAASHHRzA@mail.gmail.com>
X-Gm-Features: AVVi8Cd5VWiNZ8yCkmPmPqgDgJBXqd110lMfJ3ncCbilkzR-pzDuizM2gwBEdko
Message-ID: <CAD++jL=1mqDetG-+DW_Loj5Ufp_v5DmLN+T9pM_28dAASHHRzA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 12:41=E2=80=AFPM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> To clarify the hardware design: this SoC does not use a banked GPIO
> architecture.
>
> Each GPIO pin has its own dedicated 32-bit control register that handles
> both GPIO configuration and interrupt settings (e.g., edge/level enable).
> The only exception is the interrupt status register, which is grouped int=
o
> 32-bit words.

Aha, I get it!

> Since physical GPIO banks do not exist, using a 3-cell <bank offset flags=
>
> format would misrepresent the hardware. Therefore,
> keeping #gpio-cells =3D <2> and #interrupt-cells =3D <2> is the most accu=
rate
> reflection of the actual silicon.

Hmmmm I would argue that the way the interrupts are routed into a
single 32-bit register for 32 GPIOs would be an argument for using
#interrupt-cells =3D <3> but it would be confusing to use a mixture of
2 and 3 cells for GPIOs and interrupts, so I guess 2 is OK for both.

Yours,
Linus Walleij
