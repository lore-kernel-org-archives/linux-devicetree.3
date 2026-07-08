Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED98A3C3453
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540995; cv=pass; b=XZ0HPNWiU+sLQYMs/G0gGmMu7ertOwgVTUCZWa9+/bzUMdoOSfbPSjcwRxoABA42ZEwpuqiKMKWZgykmbs+0V29JzbIJ6eXXSts4U+Gp+LDV27XiYp+nJKgsu/PkDm5R9TDZCmwuI8ijPiPniUhxrTCpAPZtCqd6sYeW5ADzcL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540995; c=relaxed/simple;
	bh=VHoB62D85pcWXecYyB+2zT7VNa7GDV2Iff4zIPRsuxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhx7G1vbDQQVY147S4wrnRk/dUsPZP17nKS9whVBpV8l2n6ZFmE0z/F6vRXfzVnKffJwhbqGq9Vq66ongNV0f7zdxftPNpIUYQfCFrQyNb76Br/Yb5TXVfcjn14ouSXYC0QeE91bidzwvAxyRWEVc4FhHF04pa4RryVFMd3LAVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Sxu5BKLo; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Sxu5BKLo"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc6dd436c6so11763275ad.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783540988; cv=none;
        d=google.com; s=arc-20260327;
        b=Io91RfjXfDuO+3waN9RhRjoKpVslkky0Vo9aAikZPg3g1QpF1AMQQOcmJ4gKr8SZu8
         ZWgZpykz0USUvrHzi8ovUM1HTk/BVh7UlK9qEj0QZ7exV6vzMN/5sO+9C4KgyCnisqY3
         /rl+S+rgrB2SSdgsHq68st/zI33EtY/XQIFxvSIDuWfHVtrBq+9DlXo/bjH/ww3K9NUq
         Rv2h886mA5JlcGRSNjdnXdRECwAqQqu/HU5r8aySCagTdtnpDUqOuMXaDmSvNkXv0ArC
         0ze2KgdB7E9ZYHqBGfI9Um2sqweFD/apeJTa1lvBUDGcLzz9tkQy+so8NPQ6SmjCEyVn
         F81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        fh=KT3LNXTCuw6paRJNSm+vOW+7mO0xgKHEzI3ax9Xsosk=;
        b=cA0DFA1miCiNxa/9KORdGopPgyDy3BhXdORGC/1BZyANJgt+d+a6SfrVFUD5kxlqG3
         NK6fFPFVuHU51n1sybBf+iSUWb3nBzQpwKshl5lOhANiJAI3ukin8YoXtJz6Ku8aJ1As
         Qq7ZLRTYoJqNFxtAjT6QoL6hdCZ0sh6QaVc3wJzyXy8ybolkUciBsBcNWP4cYr7hRKZs
         N3f+GebXRucx/sEpNaPKcpXnwRlIBCnQDWfOGuDaG6UNzX//PmL/VhhmlM9Zz6djxXrA
         kU/1hgchOWSOK1F/5qiIWt0xT9Dnf4o4Iavo1KJaFDfNq+ZRb0lU6+69ZL4MawQUZJbQ
         oOgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783540988; x=1784145788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=Sxu5BKLoabsMdi/Rp+XbMUw/GJpHKWmXtQtjeJJ1e5jaRoDt0OxDvTBg5lR7E4GYy2
         q/WL+jB73uROAx9nMRwKq8GEHgWiKyt1Wtw3kQ0N+TKIq+jNvpwMGIOc0gFJa4lmWi7w
         GSntuDY+XYTkK6cIndgzR2G2+Sckacb/zXfF8ckkstBcSvdofryy4SOvuVT4d8okkDo1
         OLOncnTlay3g3ZIJ5UFygN7BHv5oMQ7IRim2mMUenEExfTZMdJMagz1guuNBrqAfTEZK
         9FVKiBkehcUcFflzVq4ELilKFIoleK75rPW0bpAYQLhpiWsbrNppgf0uRHOSdHNX+Kfp
         cupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540988; x=1784145788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=lrlmcFVbu6ADd0Hy/9oiY18SIJ0v+9iRQr5p4SduP4voN/Fle+IeozNxttSxFvnWPR
         /om7gFKSDwOlNNdNjzxEHko0FJFlVg9H4PBofFCU7E7K1RXaTyvH4UeDwwKfS7oxQAXM
         w4B5A4ly+lnbLy/5+iUpxaPXNNjmpfpTeIOv9a1GKSNyBghjLbTtm0fC8Swe1CXn5fE1
         CjPbhou1lkyyp7dx+vzrGsYAwUcOY191LRZ/mSTHe/NAP8o7hYfxZ/0AKDbjlRl7fiq2
         n6ZWioISUFpeLATUoN4H6HSGUbA4uqZereo8KsrHXdachmrHNDbyBXTR7f7609fP26L4
         uCxA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf6iaMeYgcZuLPlMgk30U3ACLEuQAlnoe9popNR5yxXEfE1x8Sl7hWJZiX5V23fgh1tExZhvczpWhn@vger.kernel.org
X-Gm-Message-State: AOJu0YwZQi0c5IuAy7herj6mEcczFb0H+qSyAZSSLyMsidmv7F6zUUXz
	EMTNULcdsvCSUJpEO4m3GaOJmuQAf0hAU7bVyD3Ca2Egu0PO+LGnprIRgBzMQNkenjO9O9E0V9p
	rVJSJ5Nxdri6+IE6ihMDxGhyGWVAzP08=
X-Gm-Gg: AfdE7cnqm3JH50NsbwavfsbqXHdIyjXE/2rRN4IFA7Rzgc+34FYz+LqunoQRn0RV+Ky
	7UWf+GcMLkzHGkMnwcZzUQyS0mp0e/6Zw61xylHE4CvxUo/mcPcT/4es6fxQBZ4k2+pkLal6VN3
	0/Rybvh8tIIVNYZNXmc/3sG6tIw2SXBO2ZKUz7ZHDQSrH1iVpjHuNomZEe65R/q1IDuwir2sk4N
	C1T/VT3yQrhIZ5l26hmgOJ8VwhPrP5uWKk8Jg/m8r83v8tKeS+5QO53x6gD+MT8yffpNbDTt4ES
	j1YyPCjdARIrO5pzCbLztjz8lP4Agg==
X-Received: by 2002:a17:902:d507:b0:2c7:f12d:5d37 with SMTP id
 d9443c01a7336-2ccea3b4332mr41011575ad.17.1783540988351; Wed, 08 Jul 2026
 13:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
 <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com> <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
In-Reply-To: <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jul 2026 22:02:57 +0200
X-Gm-Features: AUfX_mylmZnzRL8QYx31DSmWj6ivxEWovLb2UkpKfybbs6Pkvk-Opma3o6RcohY
Message-ID: <CAFBinCBQ+g8Kr2tL9ob9PvTakGrtwH3qZWjEy-ytGiufGUEieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:39=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.c=
om> wrote:
>
> Hi Martin,
>     Thanks for your review.
>
> On 2026/7/8 03:33, Martin Blumenstingl wrote:
> > Hi Xianwei Zhao,
> >
> > On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> > [...]
> >> +                               func-ir-in {
> >> +                                       remote_pins: group-remote-pins=
 {
> > Can we keep the established naming:
> > $ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
> > 37
> >
> > I'm worried that adding IR blaster/output support at some point will
> > then lead to confusion.
> >
> Will do. I will rename remote_input_ao_pins.
I'm also happy with remote_input_d_pins or however the datasheet calls
this pin/function (seeing that A9 has AO, C, D and TEST pins in the
always-on domain).
The part that's important for me: include "input" in the name (so it's
clear that this is IR input, not IR output).
