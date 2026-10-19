Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426555;
	b=S6whSpmNZxf6WEGHmuVBZIy8lfgx9wiv6FmeNM84oXlTRcIZaxsS1oLm0RW5Kru9y85d
	 WURY0lhUSOKrpABovpAV7melje/KN3ZD267HwmnkukuBboPIo1WBnKFRK+6pt1DZt2On/
	 QgUMxc/EVlDcSOvnGVz0ktvGB9688LPgmDARBA0Ju6cxG8AmHbyElaA0q4umb8D7S9Qk/
	 yso3rbOXd1+fHp1jJLlvUig2b0RtfRJGJsF+OV44+6b25okf4fGWdmrn+PBxoEc3htHl0
	 5LYXXkREOpmqY69NmftoYXvwofAB+LemFM/A9ouuaNcD3TnevrHRVdPNRM0NHW+onhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426555;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
	b=B7FLJErRFNmS/FIruKbKgRLggTHGyX7ZCTYASFfR9bDCrqVdbwH5yHYZ6WeR0EGs2rMz
	 I2GavRLDB2NtlJu2pVnt3bR8OR/a0Cl+bAe7Jv22y7zhcwiOqBiC8DmcHJyDSomnIcrfu
	 1VC0hPwE04w84hLPkFkG1IwPLxhGHKSczVQ7jZJNj0N/pKV/BaJur3DVp+TWYyAvLZ5sA
	 f83t2OFmS9m61GDsGoUkKY298hq3SCocIXBI+EGNvrVhSZhmBIJfPgfhyrlBxIifIsKTa
	 IAe3IFa21hm6j7ti/LHI3j2U5n84YhE/iUq/IUMOckXaYdK4n4vCNh9DlqonZjOzyYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D7606A31F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155D7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so542851866b.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426552; x=1793031352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
        b=VAwUbPhcS45ICDm6mLMXDRDvymtMTDiTzTorRmFGaLiazDC/HA2EldRWXSD43Ffj6i
         HoYmjVl2kwQy/oU+1MsC9u/nLgsNeA/h/zoK1sNPhdiI3zH0eqnDsXHVrLw2O6pioAMO
         cw9/5ffNwwbctnOxfaILC9lRvNGeP/XFGXz22cJsE+gk0oPiUSRBPuh/GKqJVoHBlU7a
         y0GwtC4Dr4QmYkPPzZJGlkoOcgnESybSf8nsmARyl9c9cEsYOl5ZC24Glk71/I7rQdyk
         AWwRylh4FTp8Dlo9PHClLl2ALQvOfcHrfgi3h+U65GLhNAhvzyRnbbjfffpei3sxJG8+
         W2JA==
X-Forwarded-Encrypted: i=1; AKwUvBwwmxIk3mhTknulu9z29mJawzaiziCrjjerrqp/X6LQy+jw7ad5BBHrntT3sjShTBNvsj33n/tm7VqI@vger.kernel.org
X-Gm-Message-State: AFq9FYIT9l9zix83m/C/1t9+Pf+i7y2/qjcMd2qiX3F9fv7GRfvyzUHS
	01cJulld0DCyOSGtIFp2qTgSysD+mLHmBdNb5OlGwwXi+iHtBZyFz66LizF0DGXSt78=
X-Gm-Gg: AYBFou1AHIl0sjSB5pJS7RxHZM7AphBhldeH8HjaF9afdtHeAZ+PlJmQLsiHhHkCcl/
	475ayx6v28W8TihiVf08wnGfdbTZGoBGeYOazCKmF7sx6XW7PrEmc5EbqCWmRCA/PIMeUHyGofW
	QV4NxG2N5WuO4zAS9XHSqrKCwz+qYpoG/BTq8eFbMqRGMlExTI6YC53Uv8IEZ+LId80k+O2JlbP
	bo9cXzVxZdItQxweSalBYAbSqitNmd9+rKBj5+1RmqBuBvwZ6rkhXuJMWOmCfK6AmCpQWrx6fXH
	dztlQQtQw88b95CyzK6gBsm8eYGyeqb9mj8C52N2uL8Pb293u83obClwl4E+U3aGt8ur/mxUBVm
	EmN3VE93qeL6UZ5bKJPnANdUBeaUmBgW4Bd1wTxGAb/rna12pCKOrucI++jT5iPlhdZKMEjLjtU
	q0iSdElY3wwxssuv7nNlwoVBu7H1S2EouQFrSD18NaBVD7sNGkCfao2FgMk5CbC8k14lVPUe7I0
	84lBorGshNsacTB62DMMELm4rMBBS6+zAuu
X-Received: by 2002:a17:906:1009:20b0:c42:bc58:f21 with SMTP id a640c23a62f3a-c42bc5810ccmr288456066b.15.1792426552221;
        Mon, 19 Oct 2026 09:15:52 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm365576866b.13.2026.10.19.09.15.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:15:50 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e30c26a4so458676166b.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:15:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxizGuV2MjwjbmbZNiHLk+FMjXR6KToD63nUpGvNd7bJvA/aaiqh0IQ/j9BtMEiGD4JDlAEwu5fYLJs@vger.kernel.org
X-Received: by 2002:a17:906:99c2:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c41825dfa20mr602336266b.26.1792426550419; Mon, 19 Oct 2026
 09:15:50 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <20261019155619.GB3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019155619.GB3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
X-Gm-Features: AclHuK_Wqb_TY8SIlHzico7Y9pGZs0pikimfidJslyUcM_WsFGAezgyxmzAMr2w
Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 17:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:41PM +0200, Geert Uytterhoeven wrote:
> > Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> > to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> > firmware when running on a system with SCMI, and SCMI support is
> > enabled.  Take into account some peculiarities of the current SCMI
> > firmware implementations, and fall-back to fixed-rate clocks as
> > replacements for SCMI clocks that are not available.
> > Support for bus clocks used by serial, I2C, and SPI devices is included.
> >
> > This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> > hardware description in SoC DTS for systems with and without SCMI
> > firmware.
> >
> > For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> > SDKv4.31.0 and later.
> >
> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c

> > @@ -94,6 +113,21 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > +static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
>
> This is the kind of function name that looks prone to a namespace clash.
> I'd name it r8a78000_clk_scmi_find_proto().

I deliberately picked that name, as a suggestion for a future common
helper ;-)

> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
>
> This seems to be safe because a NULL scmi_clk_np implies usage of the
> default map, which only contains fixed clock offsets, but that makes the
> code a bit too fragile for my taste.

Fair enough, I can add a check for a non-zero scmi_clk_np...

>
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);

... but please note of_clk_get_from_provider() will return -ENOENT
in that case.

> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
> > +             if (!hw && fallback != map_in) {
>
> And if the above is correct, fallback should always be different from
> map_in when fw_id corresponds to an SCMI clock.

True.

> What issue does this catch ? Should the fw map contain a fixed clock
> entry for clocks not available in SCMI ?

Originally it had entries for fixed clocks, too, as the firmware
restricted access to several bus clocks.
Recent firmware provides access to more bus clocks than before, hence
I figured it would be better to use the SCMI clock when available,
and only use the fixed clock when the SCMI clock is not available.

> > +                     for (unsigned int j = 0; fallback[j].dt_id >= 0; j++) {
> > +                             if (fallback[j].dt_id == map_in[i].dt_id) {
> > +                                     enum fixed_clk idx = fallback[j].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                                     map[i].hw = fixed_hws[idx];
> > +                                     break;
> > +                             }
> > +                     }
> > +                     if (map[i].hw)
> > +                             continue;
> > +             }
> > +
> > +             if (!hw) {
> > +                     /* CLOCK_ATTRIBUTES is not supported */
> > +                     dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
> > +                     continue;
> > +             }
> > +
> > +             dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
> > +                     map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
> > +
> > +             map[i].hw = hw;
> >       }
> >
> >       devm_kfree(dev, fixed_hws);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
