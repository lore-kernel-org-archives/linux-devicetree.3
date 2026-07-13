Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AED3A5E9B
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930759; cv=none; b=igCBqIhK7v6ZODDS4rf/SJk0fsQVzp/TpOjC/l68bRYnY4jb23FupDW1mCQFbKrVzfTZsLaHdpmhuEttEw5TrDYCtf52TgHJPwLC6MH49mohBUmoUypJHQrNuKfcDc6oQQ/Rv7EqGKRtE5m6g5XouHSJcgGiilaUeLsVYjecAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930759; c=relaxed/simple;
	bh=Psfrc3G7bXxsl7ECubdBiSlZDy7VaNL3f7/IvFNPlmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cs1XnLtvk9Qb165+zZm+nG+U6OnWYBsXw4wo/971UGgaepxYk5xeXkdu3B5XKKqu+x8z8plqoiY5RIblT68I3ON6N4shH+wX+PvvhQ0Zo8yyhHORBfKaOc2ROpFjXVAhacB9OVOTazwBY5iY/lRWcRYjAuZXAao2B4NQqzx0Exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2647051e0c.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930757; x=1784535557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK7IMBHRP2FdUnWCkfnYLPOObmzv4mtZRa495nyVkt0=;
        b=OYAwFKgHisElW9A6t71hGxefsJtZN9nAvRLgNA7V+Slv4KaZeY8ZsTsfeQocf/SZBT
         mCf/OLhGQlkbK0PclOl1IT1v0pCZYOFQlGzQm0KtRHJI8vwbcZ/G/Em8lLvscaEVgJ1U
         hRZvq2HiolWu0Lr0ednBdbcUos6eujkZe7UJroLutq2jdKbct5F7RRCxj6f2mHCgzEOy
         zO0gbUIE40esE4jJyDd51DkHmG9gwzUKHA4cWalaH+OJpickw1grCQOJ60LkgScQGNk+
         om9uh7dG3M0blPAY0x3niwM1xktKBU85YC1qSLmfeWUy/3SZGBgVEHU9v9gLv3jWwKif
         4gew==
X-Forwarded-Encrypted: i=1; AHgh+Rqe4mW6CoDnkGCXvdIK1oM2EesbmLfyLrflkXWFzsN1Tf+hkmc1TdpIPUXffN1jRXlaulzpFdryZcIc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Xku4fF+JcbX6q9Qm4aNPSHr7v9N1STxhtdmKXnjYjT47T3gp
	f+52Uy26OwrLuLWoqMPdJb5YWXQY6wgIwhYYwisWbcbUd6RT2u7Tk5sAFrY6A+ZB
X-Gm-Gg: AfdE7cmCiY7jkl7iCyySDudUbHngKkDOdyW1uyX7rtFzJAw/peReb8dl+by7KY/9i4r
	5c1S+oBIV1HPbBfH9aKpZ6nwfNj8NMJIS+mhpHEXToba1xsXRw7EAOAn8WDAnXBVXaT3x6mdUSt
	Bttf6HjOc2vwvD4O6bMxTZ2s/teA0QidFYS40Z9p43FjuAaOJCyODB5qV/qnFNO8EsUjIYoGbyo
	KZ1xHZ7AqReSEmteqPTVQyKZLi4z49pGIjuIJzLieT8gPSjx7dgqR9N1rDvrX4IZEGTqc8Y23LI
	lMZGs62691GZBRsFuA0ioeiei+yopEk6zJV7iF2xmxrr3QO05WDOZnB0WdPu0e+7//3iaPJef1q
	A6LAD2Afp0Sc90WJ4r0z6BcK2J3nr0whU1H/guD7UCMSeCnX8cl1wX6xFgZoUO3IBoDPn8jBhEU
	VC8xPtCacO7S81W0SIgLsdFhEPSjMJ1E1ussl/5UJJuRY2/CWjig==
X-Received: by 2002:a05:6122:2086:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5bfbf3c04a7mr4674513e0c.14.1783930757668;
        Mon, 13 Jul 2026 01:19:17 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfc655c77fsm2983872e0c.15.2026.07.13.01.19.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:19:17 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-737de525d2eso3006694137.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7Qx35RayAP9puSxPL4TnHEpM5OqLK9ekEjshpAm2/rBKi8aUk8vaDOt6RmJFJz0s04G0TMe+1Il6Y@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:6f0:3c5b:ce7a with SMTP id
 ada2fe7eead31-74533d7c9f8mr5298165137.17.1783930755575; Mon, 13 Jul 2026
 01:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <alQTnZwVRwpVTVUf@monoceros>
In-Reply-To: <alQTnZwVRwpVTVUf@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 10:19:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
X-Gm-Features: AUfX_mzM4sxy25iOR9jBU-xAME53IzNcexx6a8MgetXZ4RYeb2wzLaySAOrHbao
Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Mon, 13 Jul 2026 at 00:22, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> > +#include <linux/mod_devicetable.h>
>
> Please don't add new users for this header file. Only use those
> <linux/device-id/*.h> that you actually need (if any).
>
> Ditto for patch 4.

Thanks, will do after the rebase to v7.2-rc3 ;-)

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
