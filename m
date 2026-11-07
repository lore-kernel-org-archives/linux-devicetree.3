Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019387;
	b=bG/L2bfYz0GzPfK8z0r3Tl2yaeEhml2u74gLiyNyLbFkBk9fOj27bPdx08tjSJPbQe+w
	 6X36+jaZWfBkDfqRk6SfzISJwz8ZXkk9yFToz7zKDFQkYJ/P3BEGGUQ6ecLzkdMstHS5i
	 GT0f/WbScQ3Tu5RSD7dqi6x/Io4rhPHIM3IAGQYFUM4LLUhfzEczaT0Q3MWCkBM4uZ6+C
	 M+55Ym9Hk6B8ulCLp0ELCuBwJxzG4eGt3//NpxPngTomOh5Smh/Db516lYv2anjmPj92P
	 Sm+5zOhEHYIKhLazo/PzB6xU5i4xph/ZqtLy4UiPiAdYObiKzUKQPoFI5jZjGzVP54Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
	b=W2NMTPzm/5bc5YPEQ5QFt2IMUoU5kHWx7Sj0Jt6ENuS94FimX+cs2TwP2aYfadOj6RUj
	 VB5sBRA7EsqpXPtW/CnTEdS2o9qh/Yl1U24osMQ+NmacMo060FYwjbga6E9L5j0BxQVY1
	 /8Unl6bRlgXL+s+v9VbGxt3bxwtsskFww7to/AhHeg5AlCHUZndj/y5MYErqzd9qBPVS2
	 ac2ignm15jXUrdZqij1ay9Gk3PBj4mnzn2EvFVAuDA1y366n5N+0avNXxAJwHIUZ6Bx+5
	 o+VJFsLmxG31JYvEKJHtbO9ZvvFKD1r1xsF4I7MH9p/dKGWxEwhr+xHHlGF5Ug+ZAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ofn8u7VT;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30D606A32C
	for <Devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC30D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ofn8u7VT
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1530367a12.3
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019385; x=1794624185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
        b=Ofn8u7VTPmbHApZr5I532d4huM/8UL3MLBccGMRtRxUToJ3XjtuNH916KGqshCX6e4
         xwi7xHxV0dzUHyRhf+5tVIMu/g6PfBMJsh1PnIoIYmHceB+oGjw5eE4j8oLpgjEXXc79
         kHkHGxqTXVKGJJqIc7jPDLhBcdN4oMpLzOt/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019385; x=1794624185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
        b=ngUI5gSKJnvHWfuDTUgkMl1gQ6+boZpzF3DhlMZ2SPtefG7fiq2OSTLTxDxfyoLhE4
         2LaE+iezA2zCxvQ3atwcbi6seGj4G6u2sAacDyT111PA3yl2YX5YGbOJ0t4rEznZbMKn
         bgAiUIIQr3WauXpkRpKPhJWdGsRFaGVM5ElLRmh+qPSgPi0om7rtoVsB3lSj8mmabJwF
         2eW0M7rcZz+2DDefD6fpjW03Aus5+52RrxlgfgvOe16Ei5s/K8Csnu3bLZu5+G1v6LvV
         e+m/QBrvgtRiVvJS8hzS1FuRAyRaUer9aLR8uIN0+kid9Tdjv7C4TmNHFR5Ce9BGTsNl
         MTHQ==
X-Forwarded-Encrypted: i=1; AL+hErHPqWNmgz3NaZC0qmn4mTxsfL7v5+7GF69beFQPMM9VcJwj7D8W0jvnFcCZQ7wRdzzlOUmTpkjpq8Kg@vger.kernel.org
X-Gm-Message-State: APuU4Z+lwt1QODFhEcVytTW5ywXo2mXZBjFAiNwRlJ03oNiQIpeCNX9H
	IBOhx/zUGP1PPNbqliJQkMv/t5LZokPZtn1mH8nSywLitUP/pcLJzlJSHvlbWu5b+Gqt1fIaJD3
	789dbirKM
X-Gm-Gg: AYBFou0tjHU+AmVaCAPSh4uaIn5r11tFlGUpJhEFsTmZ8Yn8yFqIEr/M89ozC4lRBLk
	zUo0+s4bJVb8s6zD2pEtyzPjAHeknjANFFN88AvEC9syUdwYuYsEJYOQj/XInAhOuBxnc/VIs5c
	WTM8k6p27kh026ouJc3jrLRogLoYlS5s6PSb2bEooHg3/BjyhkHDsmhIhFIB9TLQJ3zEivJxEwf
	YCwsoIQEljHgT1Tufu0Pj6su206OJYK/RN//jeAt4F9Q1R84IZq3EKjRnLBKcCXb+ZTENb4ntdA
	QmJUthoj2h5anJkT8U9rJvf2k8p+Fe8zn9uwlacAyIWQs4X5TR9LoZpXOGxwWcJ71ug2xdowE+l
	WFTZCjY1/Vk4JCQol9kE05/Em+XltIkGbT7gDnGsWlW0YD/rSB9sgGcTsvtSqKSl7hx8iHA3hX1
	+wZ605+lz8+JhXhvMO/OUQIkqCjmJHfMrho4otWF5d8xtgXGuB28dYDMjEIWaRb9hhbHMHBfwaA
	0i66nCtqQw2TDYqvSTGYGDKF5b5MfPwN2wtBr0s6a60qGybHuBVxtWJIsL9EO/CM7DASaWo1tkq
	w1PI+scqnkrSPOoYrmJcukCNKE3Z7gBuVw4v7Dr8GO9MQpIhiZIDiMAdotQjMEfEPM10B8wFYeW
	PN1Wi5p25bFlG
X-Received: by 2002:a05:6402:501c:b0:6b6:f3dd:bb85 with SMTP id 4fb4d7f45d1cf-6b6f3ddbf1cmr1444907a12.8.1794019385257;
        Fri, 06 Nov 2026 18:43:05 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664b0239csm1408959a12.26.2026.11.06.18.43.02
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:02 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8743225e9.0
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxHj3ZCMnQDpZN/qMRT3nqN+fVSi3gaw0QKbop9JuR/WIyr4xUkTK4QdmOvWZzL4PIOIRTWO/cTh8eO@vger.kernel.org
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id
 5b1f17b1804b1-4b6dfba8628mr66208895e9.30.1794019381760; Fri, 06 Nov 2026
 18:43:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org> <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
In-Reply-To: <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:42:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vw4HA9e4222Lz9zqqTAj=qtM6hxm9V92kYSKLrORQekw@mail.gmail.com>
X-Gm-Features: AclHuK-C8ZGba_taYSlSltFRRFmvJecYKz0U6LcbuvJ6muIhoF5x8g5ctxikpQA
Message-ID: <CAD=FV=Vw4HA9e4222Lz9zqqTAj=qtM6hxm9V92kYSKLrORQekw@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Wed, Nov 4, 2026 at 7:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wrote=
:
>
> Hi Doug,
>
> On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
>
> > Before introducing `fdtfactor` itself, the series starts with a few
> > preparatory patches: adding a `DeviceTree` live-tree abstraction in
> > `devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to updat=
e
> > `/__local_fixups__` on the base tree so overlays can be applied in
> > multiple stages.
>
> Just to check, is this still the motivation? Stacked overlays work
> without it, since fdt_overlay_apply() does not read the base tree's
> /__local_fixups__ when resolving an overlay, and the stacked_overlay
> tests pass in a -Doverlay-local-fixups=3D0 build. The commit message
> gives a different reason (keeping phandle metadata in merged trees).

That phrasing in the cover letter was a leftover from earlier versions.
I've updated the cover letter in my draft v4 so it matches the commit
message motivation:

    Before introducing `fdtfactor` itself, the series starts with a few
    preparatory patches: adding a `DeviceTree` live-tree abstraction in
    `pylibfdt/devicetree.py` (with supporting `Property` and `FdtSw`
    enhancements), and teaching `libfdt`'s `fdt_overlay_apply()` to update
    `/__local_fixups__` on the base tree so merged trees retain complete an=
d
    accurate phandle location metadata (for runtime consumers, composite
    `.dtb`s built by `fdtoverlay` that are later fed into `fdtfactor`, and
    round-trip verification against `dtc -L`).


-Doug
