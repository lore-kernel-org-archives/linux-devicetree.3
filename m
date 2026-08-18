Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2D387346
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063864; cv=pass; b=aOdWlyv2hyjkMXYoMeQHlPp/XVTI7gwa/r698Q5CmX/PJ7prSkjmz7QXin62dq0ZjFBSx62SschZSm28zxvHB531yQ87uu2ele6jgcTFtmwu2XaCHYSHr3IjS9VfvwTtVul4tLKVRasQejnoa+76C4pCqGFr1GMpChq3Xe6U6YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063864; c=relaxed/simple;
	bh=IBSqBa5sZuE5sG2ci2wFJ2FoiGRJLttrL4EX81T6A7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YI5BZOGNB2HZdzvNtOS1e/0MBfaMXo8CgoNsVFHbY5U1fUOGbx/6pFug3o87Bi452kcDMUz5yFV0JMq0oYyOuJwkhQewIIS9U6s04DT1geaR0hJj8X61IurNmPnagIZL/KUOcAmZnv30GighjEFLCmKnKCSlzCWgR5hBrwevuAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E24Sqg3O; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E24Sqg3O"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so4523876f8f.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787063861; cv=none;
        d=google.com; s=arc-20260327;
        b=OrwJyPQ7fugSRo0/M4omntdHhN6K4Z2YtkHC3vcHWLjgKt3vGpKYjOgXNOJXmwvLUK
         EP7RLpXqe15liToA/WZqoXpYuvVAgyKXkDgnAo3A/yvHWCEX0m+LCIg4zcFa6E5qKIKR
         MjI//ZQXsyhga0L39qxGMMxOo4m14TGIN0he//P5LnVyF2N+ZIggpaa69hFY5JXNGYuQ
         5G3HB/UyTDm3pt95/CaFcvX9NZBlcFNR7CJ0yIurF7B4X9mbs7SfVTJQey9f3Jc/7SXd
         ki6EgnWdzlj6sENn2uBdeHQGpW4oNH0ipe4kNSi9oJztfe/DK5GjNnJj6VFF23ApzU/a
         uh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=neKK3Po+sGuDPlDODHxSwX7bifhtt0H9rpNkrMSfYKI=;
        fh=xlaD2m5ZuQSWWRZVx6IS5/v3vfZke43x+3/XNGot4ug=;
        b=PWWsvJ5yE/MFJTP0iagH9K6FZQPi/LQ/Z/iURO525esHp7RVBt6hNAscT4V42X6of7
         XB0ti6EZyWxAk7YcWq9TNZAS9a+hcwErKu5Kb++VJp9PJtHLe80JhBUU58mhCk37NJVq
         AsYI54ky6VPDv/VFaCxCE5ejONo2N8/jmLXhBIajGdovjFgalxWcnegyJ0U/u7CHe/S6
         iNdyFbvrP7+pijcvytYVck4Z0c4fzNjtZtF7/wgClzp3Md7XfpNF+vVwX6SqYKc0GDt7
         b/j3ZcYu1ymN9thxSbHzzRxfT3EI0MTMFLxSX1VXgfgBVOlWK7ALxpCtp9KVlR0pXCSO
         8vfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063861; x=1787668661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=neKK3Po+sGuDPlDODHxSwX7bifhtt0H9rpNkrMSfYKI=;
        b=E24Sqg3O+3Jd511y+cKzRx3tpy+SZNq5wIYMFN30s9983UipPXlGuoABWRLSZHDwxw
         fAF3+DcsWsDH2A/u2h2jRfig7k8XGzCQM26JijOY2pnsTxaHEQAkdFcxqBUsBIdUARK6
         4P9Ce2+n/MRCT+IaMTMVjlo7VhveSu1c1pA2X+mez474R+4q7RRIMjLRJ/Yrj713b0b3
         fTF/+OjHOypaPn33buMGLoYU2rLbjpFH73WrzhfbxinHBbzJKWayznwhN1Ls1Tayz+Zp
         vTxdzPy41cqg+wK3OoxgSJVh/0ZBTnn5VaKa0cKih4v+RO71dbh96XjuJX1I2s9e8N8n
         uOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063861; x=1787668661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neKK3Po+sGuDPlDODHxSwX7bifhtt0H9rpNkrMSfYKI=;
        b=Uxy/AlCycs+4Sf66bhnH827DE650QgcAyREd7BXWFlJSZC18U9RoSFXLTQG+wUyPCE
         QjiGqcuBPk9QLDsmz2pP1BSrLPt+gs/8ARMQtd2JGx/W9hsA5+/bJxff+jx9pP5OJWD0
         h2MzcLPYrss6O0tWtWAol3yXvt7re7dx7rGBFjeAiBm73qEVFYqqgleU3WLJOYtQFZzk
         TgnfCHKHdhCAx+y3MOTMr1wBxXhwOyX2xojmSlhrKDshEXsNzNVrZHohJxp2FBu1Nijo
         y8AYjvzABq11iaeGF/oaqWpIRp8NC9HRPMvenx2qOL1HAAplVrs9MnBPTgp48gi8X5Ri
         4Zmw==
X-Forwarded-Encrypted: i=1; AHgh+RoD9BahqVfHLHkvT7dvwEaHCKXrDDIUbPK+tg42uEPmahCcQUREWgdp678wdqN/++eYdpQeF3oB0KBf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGP8Amuuq708jjQ55mCpt5SNZ16ZSrwOl2OBAHXx37MJE74J8Z
	NiECa7O23PPJ3E6Qm5nv3v7G9PV7TZaRhPg0Z87ZpXLSBp6ABzKPDK1u0F82Xr0P4+bFKHfwoLA
	D2KyrDQqbLMWcxY+MjmK0imfnlxTUK+o=
X-Gm-Gg: AR+sD13nk0Ny07HihLMTN8GmOIFX5kHW2V7mrePQilPPngmztkK4LkhSvDCABlraaAP
	Tb8UdQtMLO3G8K4qOBxHj54D3I7MJQ99G/yTlxEF0YsNhTNGbBSS6/d3FAPrl2yXe+PZ3RqQKoS
	RQ+zoN4k+oAh8AWYBHmL/0EWVju+HBuq+QrLcaqw8KFxaHV/w7GmDsveVZd3jyLolntdNhRrRKf
	uy9v/qc22nd2ptY02DfOBI+GylUS7k/Z5pR9H/oiO7DyLO3yEWNGvmksgobUIqO6d94GcrPJ3cS
	uuGyCk00jdml8fb+LuahLZHng2Hl2mk+a/uj4IwnJLIgryZUJrgA75HpPGighr5nfjZnMe5dHXG
	5OUHgvhGHdby0BllXlDv31yf0Lov/yOstOSsQo6fWIc7sd26M0qTTggvOiemH92M=
X-Received: by 2002:a05:6000:4387:b0:482:abaa:fbc8 with SMTP id
 ffacd0b85a97d-482abaafd4bmr9687806f8f.2.1787063861449; Tue, 18 Aug 2026
 07:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoQ4nMR-NeV3FFz9@ninjato>
In-Reply-To: <aoQ4nMR-NeV3FFz9@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:37:14 +0100
X-Gm-Features: AcwNN1XTiorvtf8oIvzxJNwW0UUvL1-YI7zD4R4i88syKxl9raPTSpiWlkJvKJc
Message-ID: <CA+V-a8uCt2_Vc7A4iFuiCKmkcrbFCi+0_uoWe_Xx=aT9=Fz79g@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] rtc: rzn1: Dynamically calculate synchronization
 delay based on clock rate
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Tue, Aug 18, 2026 at 11:49=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > -             /* Wait for the counter to stop: two 32k clock cycles */
> > -             usleep_range(61, 100);
> > +             /* Wait for the counter to stop: two RTC_PCLK clock cycle=
s */
> > +             usleep_range(rtc->sync_time, rtc->sync_time + 100);
>
> Hmm, 100 seems more arbitrary here than in the original code? Maybe 2 *
> sync_time like below?
>
Ok, and I will also update the comment.

 /* Wait 2-4 RTC_PCLK clock cycles for the counter to stop */
 usleep_range(rtc->sync_time, rtc->sync_time * 2);

> > @@ -444,12 +445,20 @@ static int rzn1_rtc_probe(struct platform_device =
*pdev)
> >                       scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
> >       }
> >
> > +     /*
> > +      * The internal clock counter operates in synchronization with th=
e
> > +      * RTC_PCLK clock. Calculate the duration of two RTC_PCLK clock
> > +      * cycles in microseconds required for operations to complete.
> > +      */
>
> Too wordy, this is enough IMHO:
>
> /* Calculate the duration of two RTC_PCLK clock cycles */
>
Ok.

Cheers,
Prabhakar
