Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F43876B2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717612; cv=none; b=tsHnJzZ+tepnwxDYM9zwbMHiXigFbVPPts07TFne6oq/8ZXk2OddbFFOjI2DMCXSix5II0etrAt0/OZWxPpzKZanxbNJoJXMlspbDzHjpi8gRi7pF+woYkANJhEq5eJcYjWUXckbLtOh4TBuHfyx01Vc7oZqy2zugPHi0CE1P58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717612; c=relaxed/simple;
	bh=wTlung53wgG0U6uz6ynHrcjwVaYOb0YK4Nvyasm8+go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3KWD7FxlL5+BhsTk3DpIPG1OIDrsQ6ixe4SadbNBpgNToWZFX9zUkBPCPub6oIzsZXwPhZjVFIy347fjs6WabJZ6OlAywQCsB/ur7JQ47pML27swld0l3DOa8Ar8xNU7vOEuVafbEsof3e3cdG3OnnKzCQBIHLz79coNtLyJvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-790a0799373so87261137.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717607; x=1790322407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=;
        b=nLkY8oZuVjwAf+cb+P06xqfcPL959pPE70vAfJqInhe4RMIzEc3wjh3AOkIyv229ce
         BM+aCcXFEj7xDEcWs80WMOBjvR3sAIYOZ3I2060zKHpQRezdtLkxmEZBZSpM6n4gJ6F/
         78A4pssgxujSj6HuqhaVWaBcOTtCODZXW/MoTrCuBWzEBk6QEY2U32jYfPvynGB1lICI
         LklGveK7hWH4o83ZS93yDXD+kH7t7fM9qKdFCmg9bgj2zqAIc199X/phGMPXnyRbhg4B
         snLp58kiIWWfejXwrjOP/9lRULzbE0g8f7QXikG02bFQWCGONByevizzROmZQB2dWZJ7
         zrEA==
X-Forwarded-Encrypted: i=1; AKwUvBzO3sbapXuke0awbLIb/Qy/yjsu56eLiQRBOxZhizL9ou3uVNRyjNtxBHqZ9hiN/Yag1tETOYlwVQId@vger.kernel.org
X-Gm-Message-State: AFuF++kgDm44YujCshQAWY7SKXQcHK9SPQt44sIF30cAETtMUvchC4X2
	XjS8chl+4UftnuAFa7j2EZb2ANwryPKhHh5mq2vG8rvXRnvK1Lc9v1VZJaBwnm1gCMQ=
X-Gm-Gg: AYBFou2DXAKgGS5qfEVfzP+oVVt7SfLVVGDPBwqGWmjC+vh2oxc6uYG/ShuUTGTXrUa
	AjDSATylRJIzsopGQsAVCGmZDa7nLzzZSaESeN/RA0HwW+gy2lV+2J0ffosCEfIceDaH/By7gf1
	ozTysNauwkcboPPX8ZDVnxaSUcKJaiKYFzFFdpvjxpGvuaP03T+ToSgUfFcSPmji2/7Ws95kZNp
	YxYlFIGaYSIOM+n6lefQdChKxRYujnAhUXbSNbO/KcZaxY3a1UL9RMCEgaOIGcbrWbeEV2ESbTt
	HqGNo+5B7stjIiMDTeVPE1voreBK45uIrd9VMSXPANOz97sJTC8/pGToaEfNvo/htZYwK/m6cQ3
	Qa66+ZP21HImzzm9wEYmCwkWwf4uaUQ08kp1yNfcqMFdkjVYR9EpJaVzWfYF7ag+sx9qE6suYmZ
	alNoDIUmGgDPputLk9nyukCzBFMOxu3OyTXy1zulR7BWgX2H69Kf+/1tagS0/APm3hbAgdVV+Yh
	DReJExy5irMsFFncupg2nVrqfB9XHXOy1O6/WUa6eFx6FM=
X-Received: by 2002:a05:6122:1828:b0:5c9:a617:5813 with SMTP id 71dfb90a1353d-5c9b8b7cb0cmr292846e0c.16.1789717606752;
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b833bf25sm824794e0c.7.2026.09.18.00.46.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79229116537so149743137.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKQwZOinzIk+JXt8hcFZ+8S83EcvZAFLMTrA6U+brv7WjpkE3A03eiNpHgMdep/lmBejMVT2cSGgKz@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id
 ada2fe7eead31-7a55af2df71mr547985137.4.1789717606396; Fri, 18 Sep 2026
 00:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <1d5c56c80291e447208ac8777aaf90ad6f0a4f4d.1788338320.git.geert+renesas@glider.be>
 <20260917221647.GA4038349-robh@kernel.org>
In-Reply-To: <20260917221647.GA4038349-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
X-Gm-Features: AcwNN1XFZho-l6FTtqXfFYSmbjO5DpuymjytNtvp4sOSdCdr5EidSrnlACqjwyk
Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] of: property: fw_devlink: Add support for renesas,scmi-firmware
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 00:16, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:20PM +0200, Geert Uytterhoeven wrote:
> > Let fw_devlink create device links between consumers and suppliers of
> > SCMI firmware on Renesas platforms, and enforce these dependencies.
> >
> > This prevents probing of drivers before the firmware they depend on
> > becomes available, thus avoiding unneeded probe deferrals.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - s/firmware/renesas,scmi-firmware/,

> > +++ b/drivers/of/property.c
> > @@ -1417,6 +1417,7 @@ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
> >  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SIMPLE_PROP(renesas_scmi_firmware, "renesas,scmi-firmware", NULL)
> >
> >  static struct device_node *parse_pinctrl_n(struct device_node *np,
> >                                          const char *prop_name, int index)
> > @@ -1574,6 +1575,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_regulators, },
> >       { .parse_prop = parse_gpio, },
> >       { .parse_prop = parse_gpios, },
> > +     { .parse_prop = parse_renesas_scmi_firmware, },
>
> This is going to be a catch-22, we can't have vendor specific properties
> here. If we need this, we need to come up with a distributed way to
> declare them. Linker section tricks is one way. Maybe something in the
> driver struct would work?

Quoting myself:
"I still think the vendor prefix should be dropped, or replaced by "arm".

> Can you just avoid a property altogether? Why can't you check for the
> presence of SCMI at runtime?

A system can have multiple SCMI providers, so
of_find_compatible_node(..., "arm,scmi") is not sufficient to find
the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
