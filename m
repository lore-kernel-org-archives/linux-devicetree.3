Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953299;
	b=QfpN0O4rwvRH9NOS5n21oxox8LN87u0haLDWTG4vgEm/q42e4gG3VGKZx66klNVf7aDg
	 6s4IwIy8FB2eXzquBzvWeq5+W1c1NtRBxUnK4SoKuNoyJ1QZYkp9I5uOg6WV1DT/zTc7T
	 p5UQWx61iLJ01IDB1fgOyHwwwG5E08DhE1Yz95mm5fg4G+IOMzvuZ9JeaDJlqokh8xEIj
	 /FN0RlvRrLCeyd/wTKBrhcnJowl5N3k5nWeFj8URLlXsWJmG1aSTWtkc9mPnVql8SEOhu
	 dQ/4C4cYjdgIahgt0A6LEvtzvodRFu03IvfHbj5fu+wBQisIWy3JsNgj7I2kCTUwcZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953299;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=B5U6R28eASu1V9FcblqPPOgTL19VFOQ1nMFsFJSdCXU=;
	b=geJS7uFE79WMeuut8/v/fx8LldJQuvbnsKVYmyeVq1CjoNdR/vnMGp4NNVZgEOO1Tsli
	 pPYo1w30mvkKtobsV5h0X1Vb2OjfES/XGNngkDDRwHT97246f+YloxvPHfs9ZUwVoiCl5
	 JDJj3q6M1ZtDg6FAPn5rd6Eb/WMuLJFPlbzGslMV6QjPjJVNEnTwHPIoMIfeJg8PLelUY
	 6H3+V8dAHKbXG48EotRuwV3yc74aTEPEs1DB3ZstoSVSts6ldHQek+fduijdrdrgk9sPs
	 fCWvCx/X8qvd00VD5tjv0PW53w7Yk4b9OVe0p0duwN/UtVq9K/xYs38fZHzGWD1/AtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BA6606A331
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6BA6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3b75caad1so298795137.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953298; x=1794558098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B5U6R28eASu1V9FcblqPPOgTL19VFOQ1nMFsFJSdCXU=;
        b=ZfRN2sqtDBCtsiip47yHIhVSsEQRPwJlnCTDs/WSEW3pu41Sb5bS4FnN5GnRszqu8I
         rkrWK0XQpknlkwe5u+OHy/GBC6lbybh0k0d1WwDkV11UKQE2/B/2aJUB4EcidYxJuxlt
         ZfyqOvnX4ohG+AdIKD+PwmB4uDE1zEeW3f9LfmCJ/gTd40ylspGV4sGHV3Ek5UI3ujVg
         shrXs/lOy77+s67K+D3NsiczXxGQAxW97LOpBOE8bas2YrgOlW5sT6DtS6EOZiqtcHxg
         hPUC5pUiC8ERX4Q8R2DSYj+9lVif8p998wFVLV/Sk8U/PwfZcwSMVMgNJVcnhDewKMTl
         67zQ==
X-Forwarded-Encrypted: i=1; AKwUvBydVI/KLdHo1TSj3Qhp+2TH3eHv7G+zHHm5lbdrU/nTfkXbzWpBp77TdOy22EWGvay7p9IIwLR83uQz@vger.kernel.org
X-Gm-Message-State: APuU4Z9FVWZ4AkABJVSbboZp1zY5tpIkg5RJW8jjrmRCvlFjLVVsc6/z
	vuGl6vkwP0DnJxbsx6tF6bObd0bTNtxxViOQj8qRz2zYYahCwvqnNF7jr8TLAUW7BDU=
X-Gm-Gg: AYBFou0zaa4Y7bK66SbKu6gpQKJf2OBU630nH389zSaog+Oo7tAuHZMAu8xEB7sOUJ9
	kedKCj8cLjXHQTRTdqlPtBHL+ntURjKcju2ek8U/Seikg5NcX/9MKVIYPtc0nRI36fkZu0lF9ir
	Rp0fcjO542v5yje/nvxZ/K8wyqdapt+gfwr2nz5J45BLQYcwStXQV5XsdNgFkXGxZhlFQ1BKp0l
	KhHlZsSv27/QGdKsJRWQdF/Ogfpv+1+tjr9YCePdOhnynoW8VrZ8jdmqHNEt1QKyYBjOKTDJ3Wz
	XfYZVRXUeIhGPSh/g3nq9YQtNLvZmrHWFZhu4U3oW7yGBWL0mrE/Qj3nxKfTxN5jVGWZYqI6i0B
	QPs/0QrRpfQZV2c0/GY1iNk5sPbmPfaWBGqyd/YSycFSWRDZjRjdTXw5iw5T8bVKZXJtFCEv8I9
	LBHhAG8YsYLtpqCoQz7NLul1J6Y5PzT5usNoH+YX/u1sFCp1QZ1x/h1oV+JzyI4wct//Ep1gi0Y
	NEnsxd9pDCAB2YMalWjwKtUK6/Hpjhc5nkY4N3DaKubSj8tGtGQqjzAWwvyfm+s5/7bKNMpenhq
	Y7Y5Y+KB72tZXILAgR7BiM1JvJHSkfDm2ebrJr/3Z6+VWNl6VR89x5jVU80LAXb1uBcqFIO8uhT
	/tb/TsA70YjufkdA=
X-Received: by 2002:a05:6102:f9c:b0:7d2:8dd6:e2c2 with SMTP id ada2fe7eead31-7d2a1632919mr1138057137.29.1793953297883;
        Fri, 06 Nov 2026 00:21:37 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a8aff468sm799825137.8.2026.11.06.00.21.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:21:37 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e9528732b4so438248e0c.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzsVy9nVvxxAXWAfpUQU+6/hvT1IEGZRhdOnyKhkUIxWDrn8Uw3aqydn6Q+O+8GcvgqBQupgSxthcs4@vger.kernel.org
X-Received: by 2002:a05:6102:4188:b0:7c1:7ca9:94bf with SMTP id
 ada2fe7eead31-7d2a157ad1bmr1177241137.19.1793953296374; Fri, 06 Nov 2026
 00:21:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <415c8b26718e2e5d53f74e65daedf9986c76dcfe.1793278754.git.geert+renesas@glider.be>
 <TY3PR01MB113465CCAA88F962CA6BA2E7186762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113465CCAA88F962CA6BA2E7186762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Nov 2026 09:21:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXObreJN74sFpqmorWFHQ+uuYQ8E8z53YLy83QWzOhSmA@mail.gmail.com>
X-Gm-Features: AclHuK-V7fgcHmuwvDEyfPRfTLsQvNGxgbL-okuZ_HotpWdWbAS1JxTmpUbfEsQ
Message-ID: <CAMuHMdXObreJN74sFpqmorWFHQ+uuYQ8E8z53YLy83QWzOhSmA@mail.gmail.com>
Subject: Re: [PATCH 3/9] can: rcar_canfd: Make clkp local
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 6 Nov 2026 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 29 October 2026 13:11
> > Subject: [PATCH 3/9] can: rcar_canfd: Make clkp local
> >
> > The peripheral clock is only used in rcar_canfd_probe(), so convert clkp to a local variable.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/net/can/rcar/rcar_canfd.c
> > +++ b/drivers/net/can/rcar/rcar_canfd.c
> > @@ -467,7 +467,6 @@ struct rcar_canfd_global {
> >       void __iomem *base;             /* Register base address */
> >       struct rcar_canfd_f_c __iomem *fcbase;
> >       struct platform_device *pdev;   /* Respective platform device */
> > -     struct clk *clkp;               /* Peripheral clock */
>
> Unless I am missing something, I get build error
>
> drivers/net/can/rcar/rcar_canfd.c: In function 'rcar_canfd_probe':
> drivers/net/can/rcar/rcar_canfd.c:2250:55: error: 'struct rcar_canfd_global' has no member named 'clkp'
>  2250 |                         fcan_freq = clk_get_rate(gpriv->clkp);

If your tree has Claudiu's "[PATCH v4 3/7] can: rcar_canfd: Allow the
CAN FD clock to be sourced from fck", you have to update the new user
of gpriv->clkp.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
