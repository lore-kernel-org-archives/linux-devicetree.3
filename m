Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69810409107
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739478; cv=none; b=ao8qPEvdHs5YsmLc6zQye/tU9BajaAj0laR9IaH8hqD8FgeZzhWvzIr+Ss7iH6Vf85x9C/rEV8w7xaaw6u0CCf7jHueVwQyvvUHCeb6slKLIzBqkp+4QKEq04ts95KE53PWfl2QXehP2rN9axv9R+vSUliXrEAj/avnbc2i6bdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739478; c=relaxed/simple;
	bh=2F6Q+G8lPK3/LK966UnTL3MxjuHM04Y1nolQeR3CA4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9BFR6UiHclyxvIFPbRabtN0rKWptMNMsQYYPBZfRa8cAUOT5gpB9gQcqibdBP/nawYDDeTyKN3Wbfyf8vM0VfHTe3yigeWMzmioC+1ukajjYxOh8Usv3Iqw7VPuYYMKEgdvXIVtPLXsmgnzhiGMAMUKK5m+G/PGBMheG58ycys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9673385b1efso773502241.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739476; x=1783344276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLPd0Ch+Wc2elcUwgdUQIz9nCCIE4WAtlCHUOVZvJQ4=;
        b=nq/tzmXg7i0I7EIGgjPo0gt499UFbb7k2cHi9YOz3VsrPKgJtDylcIndn4DUwrd0K7
         ZaR+9JtnMCJwuqh9QBjq6bP8AAtz2glELy217cUAYu9iFTdkT1a4hXrSnyhk2NTwwsGU
         rHlOK6vjrp0P2pP7Xxuf9LUEo6tjYKMYvlF0qXCpWa3quxaNdxUx/S3A2mPcf0Qs5WbD
         9xvEmy1LEoWG2fqpEFFP438Y1W8pvQO6kdyMAkbadAkzYz8ZnbPrBsG+yVCy1kdu/3bJ
         JzPoIPE+GcJjHv/k0YdR9sklWsIqq6JSYyizXpxfPHRnvSexbashKEPzbFfbBqKkLDow
         uDyg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7c3mGtFtpLQhZZE8q2QPQtioJdBlRwrQJHiy9u7GFSkIlpibRm69RD4wSYwNwuIJ2S2CHKUWmdXTO@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWZQV1xn+Ft54f+SG1a+dusE5reoJ5LGozwY4eR4q5bLig6xX
	ukJA9c8AG2hvW2WjKGweh8RYIKBsVPZ1OERlxUZJQ0AVDOBQ//fYscKisB/m3VzY
X-Gm-Gg: AfdE7cnZ9YJCRSbqDU3aAz4Ux2dmVWwGunVDzVdsJS+TFTsmagyavwEWDKuR9VxnPcl
	QJLBZYxZD1z/GkOKdu6BSVZq41OM/MBZlKVHCs077pfheFrOuDWKJlOQuUDbBWsf4y0htgOcVBN
	Nt3jLT6OEohmgjGn7PDLyM2wEWJg2s7f2xh5MKNTSZvrGgok4UV1Qi82lYVMZmPIJh+ublLdYOD
	KnFoMeRoCqbh4IJijqa10CNFigUWuyaH2muT4cduiB2yYL4ADQfD5ID39L7oP0wf+XPDc2zqS0f
	0OlRnGpq5MRmyDTJoYCLB/Vr6gTi/fFmx+f11HM2fwFiuzfSX3aYtJHRMa/1KpTaYzXm7rfa4Hu
	8cYgSQ7+lBlgq5LED77m53NT2b3/KcSPyalPsdQ4RNAl3prZWY8vbWZE4uNVYWUTXqSId1hoCCt
	/fe0/36lLi+aFRMi6qPpoE6CtxGoO1KOoUAF7kag93KS1tk0tH5Q==
X-Received: by 2002:a05:6102:5695:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-7343495a4acmr6686019137.10.1782739476275;
        Mon, 29 Jun 2026 06:24:36 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-738bcff6df0sm1527340137.10.2026.06.29.06.24.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:24:34 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9673385b1efso773477241.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomNGUcuRyo+WpNaFZegaVS/r1Y9WbGI1tduF3nOXkhlrq9AKytpeiS+4l073OjVoEuwa/IDnlaZhNJ@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:650:94b2:3839 with SMTP id
 ada2fe7eead31-7343444e593mr6347265137.7.1782739473554; Mon, 29 Jun 2026
 06:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:24:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7E+8qOaB57HPV+bZsbKwjwMnKOKTgHXTP=37JnttDyQ@mail.gmail.com>
X-Gm-Features: AVVi8CfVKo8iwUjr1Vw7ce8j-4Mj2uWLtD2PeaR6Sv7OOxbw6WnrkVNuF-6CbEk
Message-ID: <CAMuHMdW7E+8qOaB57HPV+bZsbKwjwMnKOKTgHXTP=37JnttDyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 20:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Activate the FRAM and the SPI bus which it is attached to.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Change since v3:
> * none

Thanks, will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
