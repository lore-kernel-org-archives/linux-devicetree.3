Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBB489FCF
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989864; cv=pass; b=PyTE5uJbs4ualbEMsZl7KTpqDweSG2Szt6h2qXAI5HXp/QNqU3ylShttDUOoflEUbKkICpYvy1dXSCEdp2K+thw1yeJnnBVv5bPOYhvig4zJMjoC53pyEJ9jhN/+3KfN97vLw72EFvacapXVXVa2nMlY/7OuSXZPrpSzdKVlYGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989864; c=relaxed/simple;
	bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNCXgmNWjf9JHbRZp+DFgO14E4AEwCEfAiH8JGMwjhedF0y/W/6T5Kk572cZNa8veX3QsLH+AzcnDJF6P/yQPvK5tkNg9mARGfyXALjlro4MCs2sBjVOEWaPYfzxpGJC0/ERlHTAF35tCt68QaEFyHpU+3uLj2wjTw7KLayt438=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThX742iP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThX742iP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2241267f8f.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989856; cv=none;
        d=google.com; s=arc-20260327;
        b=LsOiR0eqyAUMLP5ObaEsZceGyN0P9BogtYxGLQUaEi/Pkw94+LPIZJdtYwkpsByGDx
         BvGYRmnGdsIDdf+jtlPd4KnKCF8WFzC8/7+Q7nucW38lUDIvK+HYFSmOjD9NdNOKMazD
         /IPwx0MGdM49A1028vm5i5hJsADlXMkOCzJ7gNiI0LhXNJVc6UJOIkMsaWgGbqbOEeH0
         PliAgN2Rx2KWLWsrZMoBxM648ZoIUc0cA/28WLLPzknwzM6a/TrHbfRfqIae7gfg38mq
         A977xBTpxnGCKgosI+2dXvXLJmqV8Q1iJrtZAR0AkZWc4qf1Ix/tvQu2ql7InbDhHLbl
         HyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        fh=+Xhk5Q8ONO15/8jnQuJpOds24poq3rJQYvdLPAcy6p8=;
        b=kQHBAQgUQ3w37MJ1YmPBQ4wMrDYkux99xdK3M+BZpsZcDe6SicY5M5ouDm67pmqxCs
         +7Dqg2Fe4u/L423OBSdLD2qp76a54zDvjJrrIGDymX6x98wZPapC6rKSFp4haaz5+bHl
         CGWMNrZV1KVgl7v67T7cEv8BLLLClV/9ocx0mFHjVLX4UpBQ+ANKQo/lgLuhRv6C0P+b
         H58MKTrieHmcDyot7deWitc1egrMzRqQCs/U/MwJSOq4yRRtlphvg1uZL+napibH83Us
         1Yg2Wh6o4GnKlaTgQJCsHAnBZTxM6CURW1GY1jY6wdN6YCLXYUhEoxZKF9SphrVh2U7u
         ei7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989856; x=1790594656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=ThX742iPETQukFX3BBlsPPA+JqXvvRIUi3buvYb6DHUJ8uhywR7FkPybPC3WtdM2td
         cw+JZn2MXPLxNJkU1hv/HjhYQbCExqead52s5CZSES4onYM6ZeFng/l1dI4W2aCJ070z
         sGUIx8WWnCBUSgqZw2OQGQDhU4eYseFbxWM7XOZhjmsVd9hw+zaQJd17FyC+lmjZlng7
         YrB893St+30OJ3wABghrgJytAqkSKr044EIXFeyfBUmZZurPVJoA7+OODterBi/HYktB
         K+y+DZZjHv2NV80Cj+p5ANMayWnacg6V/RlXynE4nq+plf2w/FGel/B+E5JwiNU9VlO6
         LP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989856; x=1790594656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=tCsVJMByrv+5Q0/rTATLNcYA6Rcjs+QdrJgNpwBWzBl8HMv8VXfUiN5OorBLJtfWDN
         1f9RAcejXJJQrurVj8B2eMMIo2WypThvaI1ngMep+HTBdxV2hQYoGk6wHyDwSqHRnogl
         MN//HrcHF1ebt7AwsYHoEI/WAg5I2Iqn0TgNQRdfsRkqCBsDLR7kjBOIyGDN9VGRMwTM
         VNg2goo044ADdbRup6xo2x6LZOCiJWf/i1eRcfsFRPVgkUzm5uhh+BcXQjvTellKZ3n7
         nLHW9MJCuVvkQLSA05Nb3MgeTxt3FzEPzdmUp8b55xwJzfuFBTHNIcfll5vINxi7lRco
         Xfsw==
X-Forwarded-Encrypted: i=1; AKwUvBwh7L16F8r+GRlka7nZAZmkO+ZS0DbPqIN2jMFugb+8mbUFumx3UN0avDKMGU3nYt/i0g2MG0xp0xrC@vger.kernel.org
X-Gm-Message-State: AFuF++mBAiNeZuICwjgaT01LUyFDdyNmj9NQQjKrIyUINl38YoiRQ2Pz
	zwiTHLUhgqQb85hfl3bq3NhJDNvAxXl+KX/rwmL20Twvk3K92qBTTzO4DwJGITT2/bFqJLdVihq
	/T8D1f6b0hTQSen0UVEZLLeb41LiGJRs=
X-Gm-Gg: AYBFou3D2qCcxHdOU/0EK3QRkyY/fe39PHVBeO7iDBmEESD2aPa9XaDfR8xS5h2llau
	CZ8mMTEq0qdPQFSfwyY4vHoZMuHJz/GjWc/IZFfsQ+OOi1IeqliDAJN9pIrJHWc0q1MbtOx+jVr
	nlM4Bc4JEJR7Ek1UAc9JLag7PufVsIo+7zaysiGcUst+tKYQ//W34gLwA+ow7LuHIUMMwmvC4sL
	9ONz1JXTNFHWj59ZYuaIj3Qs4Hp6RK6Uws13Uw9Gf14uHUbUxQpJ84HNj0CztascWwfCIOk12aG
	Zrnx2EXwotWA7T5B6PEbD1pP6tKwUMgRbGFQYzO6B1LxqqaLQ5z9zCoem4za9T/ywq9RsP8O9tv
	rsJuIeoasK7lJ/sxsRJneG/51xudDpnslEeauxEGKlwaLzrLYvMpEz0hmyL5iYnlgGEDj/U50
X-Received: by 2002:a5d:5d03:0:b0:487:8ef:5303 with SMTP id
 ffacd0b85a97d-4871e394d18mr16926933f8f.34.1789989855856; Mon, 21 Sep 2026
 04:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net> <CA+V-a8vVtjALarck6PE3it1si2hNbveZWoGjTaTUW68Q6yYjcQ@mail.gmail.com>
 <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
In-Reply-To: <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Sep 2026 12:23:49 +0100
X-Gm-Features: AcwNN1VFoJ0rwe68Hi1fMS8HP9OtdClqcRaDuoUukIno7KtW8dqa4XMt5T_ytyQ
Message-ID: <CA+V-a8tugekX_ykWWMzVkHbEo4huviGYdJuECEfuYVZo6dY5wQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Sep 18, 2026 at 6:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On 9/18/26 08:18, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Thu, Sep 17, 2026 at 2:12=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Aug 17, 2026 at 08:25:38PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) re=
sides
> >>> in the second register region of the CPG/MSSR block. Since this
> >>> multi-function block is shared with other peripherals, it is exposed =
via a
> >>> syscon regmap interface.
> >>>
> >>> Look up the SYSC regmap using the optional "renesas,sysc" property an=
d
> >>> derive the WDTDCR offset from the watchdog instance index.
> >>>
> >>> Retain the existing MMIO-based access method when the "renesas,sysc"
> >>> property is absent to preserve compatibility with existing DT's.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >> Can I apply this patch without the other patches of the series ?
> >>
> > I posted the v5 series here addressing Sashiko's comments.
> >
>
> Sorry, I was getting confused. I somehow thought they are different serie=
s.
>
> Do you plan to send v6 to address the issues reported in v5 ?
>
Yes I do plan to post a v6.

> Note that Sashiko no longer reports pre-existing issues in public,
> so those will be out of scope.
>
Thanks for the note.

Cheers,
Prabhakar
