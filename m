Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659673E123D
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449148; cv=none; b=PsOTcrakPDRfySd+ljtKW5bCLzsU/oT4uJNjNdNO1a7jX5BDnVDBVhM+i7ntC4CfHiaiUjeVtidEJ5rBDMy8ByMpjfvURdcZgKRc6HAHYEDzWDgLruQrAjKRKztGghp92PbpphZN/0o7zYSIqlFs/5rlg/LA/c4Kc6ENYnrCD9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449148; c=relaxed/simple;
	bh=KIC26orWxGaAZWFOgWwVtXKisuiThVkAGGA7/jTdMSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blGKMaqdw3VS/BDWO6uwoDbt2NNZn+5fFGMdRk2ORpdHnHUDvx5McSg/QHRXmzCz41VUz6Tj6tL2Hox+9h9cU2KSrXvuJqA9LLPNfKVEmIQEYSuB169w2oSj2wX0e1tb2A97QILayPhnCjl9IeGN8jUkrEbPeZuVcLO0hQLsy1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-950b77942deso1784413241.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449146; x=1775053946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IR4PMQkuXHgGVHr1fS3zbP4B4tvfpOd5H/w9R44nhs=;
        b=i4+UOdtz6YwJtozDtaGm+dD9Ce3iAQ+a23WiOxZdXl0YJl4tn32NTHW7GmEZXNaDH8
         13DkHFjB1ytuhcFS0ZsC1W8Jlh7VFTYAtJY5+selGADTcvhYOR25WKHUcjftHxTKEzx1
         JLSIVdWWrZ/W91s6y7pW/fX1E5pQ6/+x68hYpKCQZnILQ83qEKhC2VgdSc6x3juTUJcR
         rqw7TbE9I8kHyd9GDU3ty3Y1gSidhZFL5nRODLbmQXX8c8E0MctrIYV/p/6jkfq1HqYT
         3nExVwuZvT7keYV1T+ugs36M279MMF9+8M0Jlv4bizXYJ5CJdSl/zYVAhZVOwiqMPWrx
         M8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWgTu52asK0yQwzUWXcgYM14EoyUQqnQMLeCj+RS3sh6nGJT0855lFGNuUVqwWYhlNnf+0a5po4oWS2@vger.kernel.org
X-Gm-Message-State: AOJu0YzvW1sGgKgUonXqf1CzYKAsqVsDVbwVop/mw2z68QKsTWHBQO/i
	xQzDQyzfWH8/Tb+lsV2f69Jhg+EwFCp5VkvUsH7dOuj4iGSuZieCH8iKa5Imkm9wKiw=
X-Gm-Gg: ATEYQzxwejFbOLxysH869kfQRY10G0DSx4k/A+P/Sy7SNTphdn6e1Gb9+vnil/ESpSa
	PMt0XeuqkZ9mR0ZFD0VipuYV8pFRkq/3J0eV2ToLBnBUlELOCZT5/Bd8yaaZuTQ8CG9I/QBJRYE
	MulRBWRmCzsMYeRxGRa7rI3cGaB+Wtady1jhlnvvy8+4f1Y8ef8mTpeoTI2a5TKv8LCad7ikxod
	9HDbolti6oliGsihVGPFbWJpXHxYK0IbP5lm6kLvbD984S7NSV/4KuzbNjx5zOIP0P7neaYNPpb
	xjB9sv+TmkMWz8vQJejPcKyC5r9QqyJEPfMVwGa3zUBmF4pzfGLGZ3bS5KAK+WbV5YUTTK8Mse1
	VKsUp8n8TXUx6Eb1xRsMuiMXo2OTrMqglLmh1gHe7Sg5cw2Ul9233EsDh2Lt/zQ7kL+gM0gRrFb
	lAN8vJM3gmnalX0nq0akpjNTN55lTQedsyNIb5795v6iYLAXg8INYdWm4rTKWBGL2i
X-Received: by 2002:a67:f844:0:b0:5ff:de16:36a7 with SMTP id ada2fe7eead31-603872ac3d8mr1196051137.23.1774449146189;
        Wed, 25 Mar 2026 07:32:26 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ea547sm13929305137.6.2026.03.25.07.32.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:32:24 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56cd71a7630so2198890e0c.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWunaC9pU/paQO8kOzdP42Zkh7YxPmP/1wZd2pBbkFe/quox3yH0FQWWJtp+M8MdA/iEDNrc5n+gtCK@vger.kernel.org
X-Received: by 2002:a05:6122:8b17:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56d220bd240mr1842211e0c.14.1774449143358; Wed, 25 Mar 2026
 07:32:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
In-Reply-To: <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
X-Gm-Features: AQROBzAmzdL6WbhshCdeY3LBceLPE6ortgojdqfCAR4hO6ROgmFwhIjzLsI-de8
Message-ID: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 16 Mar 2026 at 13:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 3/16/26 10:11 AM, Biju Das wrote:
> >> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).
>
> You seem to be commenting on a 0/4 cover letter here ...

Ha, the exception to the general rule ;-)

> >> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
> >> RZ boards"
> >>      https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
> >> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
> >> all RZ boards"
> >>      https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
> >
> > I haven't seen these patches.
>
> They are deprecated.
>
> > It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
> > covering all Renesas boards + binding change.
> Isn't this series effectively exactly that ?

I believe we still have e.g. the KSZ8041 and KSZ9031 PHY nodes to fix,
for both RZ and R-Car boards? Some of them were covered by [1] and
[2] above.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
