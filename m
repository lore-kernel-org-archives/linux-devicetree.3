Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E215B971
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257483; cv=none; b=ISo2fIiZoW+VKWtNsrgCPX89iPr4UInqXwboHK/OCNoTwvRydIYKv+qmCCoKHZuVTApJ9YMB72W44ebRPVESnIHLc9Xk6OOKYH8nu34Pur2n1laSddxVzD6M/MEC8cFgKIvHaxxcvUZyZ4wuDvDYTDZgZiJZBxTKYobf18/+sF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257483; c=relaxed/simple;
	bh=TsdwKdc9yokgTj1o1KWL7wDregVHwkh9wLKY74tlLjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0SkrDKzMBbsoOiXKRefgFrB46FgZCGvKp0JJgAWKf73Fpe1OnT8WKVhOYVvtM9CwEIYucqT4hkV3rq4K7Fz8CtemXa6gSKUtlo2i7YljEoqO8tGvt56M4ySrmXSy7uz+CdFm+8mSJfaxeFgTZwiZ8nUV4jqlHviykzKeFVdiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59bbe027424so553228e0c.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781257481; x=1781862281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ekw+Oevfx6i4xq0d1g4dLAXWaWK/4ZFI+zNuRgMbC8=;
        b=rsrBAchAII486XYWwXtUkZUGrtpa3Mcy7G08XkAirfVO9etMcIcsJ6pjEi6QukIMKp
         8l7RgGR+i/4IR1hwaIA4S9utahc8k+P/z5RErBFfITN3SBWJ1BlXdvCbndRcnjOljYSp
         4bxsaQA14gKITuuhCxiTHG0dWEo8hN/3E7Br1+SqewmaXmpeMT2oyS9up+cAQQ/m6Vbx
         8OQJLO3Y6VkJkP1NYqlQbZ7Bwoasn9xZEA244hW/N4SaLyRD0Fpc2A17aEvo5yRUZ8eF
         N4Aod5iMXx3Yp23EpFS+JyA6zLWdU+6Z1NYoyXhGm72tV+PhQrte0g/USwKtWZ1z7tQo
         qfVA==
X-Forwarded-Encrypted: i=1; AFNElJ9RjByxMvzemN+K4+UZB5UZa1vSxxYbiswbtnuWUNKfnTG4CzO7+CoipsPcG5CTUY9w8ufuM9QiIJUy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IAPJTaoVYfAPYefloRrl4qCU9PEl56MgaY6eEwsbeVdf+PFJ
	NO7VPFQOyWiteXZI5wvTmJIyY0WIc7ZcC2zymK6wbvigBJcAbiAvG5dqvwvOkOD6
X-Gm-Gg: Acq92OHsBN2aIkSRmbJUF7qd+LjwAW0O32Ce6xF5APyhWA0ZeZj2n+LuG1VZXxjkJDr
	N3JAfV9cFTDqIoPL2TvNLrZEz+RNFZGxKTbxWy4T38lv9zumrK3WX0J3OLJRbB20ir2Tx/4xwkD
	skKkF6mpIJAnOnKTIViv6/EWuLkPVwYm3nvBjUKsNAxELG6rPrYB4gReEG7L1jbNBkQvKs5aAxk
	nFtdCGr7kwUEr20wkPQ6nUhhAA91y4UJofbKzrbKXkpLvR+7r5Ho+CsBc+9RBMIVstYISoIQXcd
	KM5xS8Zsz2FxMBC02JhvaJ1Zu5rM22/LfAn4HkXb6qJ8u4l1QPOYUNjUx35cSXkfcam5fo6FMUN
	Wpu5PA5rzvJaRgUKYQGkCcuCpEEPBr4ljxHHCVNCWLPq+bM1KRmHGoFHKYwZXY6d8Xu4v96uzZ6
	8AT4BQREauEqDbq6D46k0hw16AyvJ7hfvm3ebYU3axvGoaTm5+9GXxltPXevsn
X-Received: by 2002:a05:6122:660e:b0:575:2072:54d1 with SMTP id 71dfb90a1353d-5bb6c086545mr834401e0c.8.1781257481375;
        Fri, 12 Jun 2026 02:44:41 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm1942099e0c.7.2026.06.12.02.44.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:44:40 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-963b248ef0fso312033241.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PdyncxvAdXSwxQkvxO6IfG/8nHhbkpxq8+YhCbVXxoynfb7Qiz3JvNfsn/KzKeR4qB2x+CBq+JKmt@vger.kernel.org
X-Received: by 2002:a05:6102:1527:b0:6ef:db57:d472 with SMTP id
 ada2fe7eead31-71e88fce218mr844922137.27.1781257480541; Fri, 12 Jun 2026
 02:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612092851.2141782-1-niklas.soderlund+renesas@ragnatech.se> <20260612092851.2141782-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260612092851.2141782-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 11:44:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq59znV1uatwVyszTh5PjR96Ay3DTe=TzP9VxgKm5W_g@mail.gmail.com>
X-Gm-Features: AVVi8CeFKC4WGhTZS8WnXOfTTINM5eUjUYYQa4NqNv0sVR6at_JjsT2cJ1T43Ag
Message-ID: <CAMuHMdXq59znV1uatwVyszTh5PjR96Ay3DTe=TzP9VxgKm5W_g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 12 Jun 2026 at 11:29, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Rename node ptp.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -603,6 +603,15 @@ tsn0: ethernet@e6460000 {
>                         status =3D "disabled";
>                 };
>
> +               gptp: ptp@e6449000 {

Please preserve sort order (by unit-address).

> +                       compatible =3D "renesas,r8a779g0-gptp", "renesas,=
rcar-gen4-gptp";
> +                       reg =3D <0 0xe6449000 0 0x500>;
> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       status =3D "disabled";
> +               };
> +
>                 i2c0: i2c@e6500000 {
>                         compatible =3D "renesas,i2c-r8a779g0",
>                                      "renesas,rcar-gen4-i2c";

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
