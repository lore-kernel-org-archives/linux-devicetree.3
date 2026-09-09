Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4828640B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939835; cv=none; b=g7B5fBDqgr436SUGBS5Oish+gfXxYBHxNg811Ff7iASUfauBN+MDDdXCYaVdhNc+KvHZpgH2DEh1nLId0apa1nf2bnBMPN9upyozdEcPDaicLJR0VZMvJbPB3Ztm5rxskQvnNlNVo1tobkCpvGR3IWrF7JSj6XzJ4NpB3zg4FHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939835; c=relaxed/simple;
	bh=9yc14kv9vv0ac8fv1uYJcHFWFcqHf9NP7Ogx1611OGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO0d4SFt3YaWehWEOcf/5ZOV23elONymL/yDwwi/oQcjWPApcv5OskH6qMCfxGQF1f1BJrIUNsCyuXphpMUayxjy2LE+IahBlspST1JOCUpeLrS5UuLO6tr6yY692cugn8KfDBwYksx/+6lgjbYIw4Q4nIObHrLkgzwqt50x864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c197e7e4e94so914373966b.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939832; x=1789544632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rInCUUC/UXiPpHJ1CPYpbMNMz1oCA9yxKCwNhHDaNM=;
        b=KyxzusBO6khAAe22ZQBvXoP2pVbXrQivkjbDydehu+J84DwvINZTobkAXQnpq7GgWr
         Jp/VKG+4bGKnz1eE6GqCS7ohaw3gBSrJs2zya0TusAomtxNAFepIuMQBsl6vtJ2pun9s
         jDdnEgmVh8QhHcAs5tLnq3pRN/fkVqw34lPjpHzI7mzhPCT6bE7RebIpejwWs2mPQKB4
         gL+EnNw1GyVE8fiq1rOMal0V5B3SQw4KRsAKVoDtGOKIE07Eoc0L6Eoaww8smYTAGHmp
         /bFcAfKKwNkO/cTU7UVsim7RN/ec+sEQ5xujxkZvj0iWPCTXMPtJIkLqyqi7iyor+16u
         TV7w==
X-Forwarded-Encrypted: i=1; AKwUvBzcnwrjSiHhJywtNVAUZTivV8IDy07ZNe6vccY37zGqT3h8tT6DWvf1V5QzVm+2i8aLKdAtsUYMpeAb@vger.kernel.org
X-Gm-Message-State: AFuF++mcXn0dassNIeJzPtHiObo5iaj51bChtr3c3f/3lBpIUcNEL9VC
	GeWevk0iz9/xoKiNBHfdlpVLnA5VUBpXFegNlgCT2kGk3p1b3MlBCtbHEmp74k2UE2w=
X-Gm-Gg: AYBFou0YGzybu3bVFdzgPp417ryI2UnrJCuE5CRY8HkDzmp2xPQZOquVmAkMOjh5AZX
	UsuGsRJUFDcS7ZQOFc54cTfmyL7qK9y2T3bJnNolLi0LjaYrkXoWPsguaOtx9hsYcACrS/ydQte
	B7T8tc64JF1oDHYdqVtS7zwhDYx0C1iBRH4097RySafHpNJvmJEyidpM0IuphU/sOrqnCanPs/X
	rsxoVynM6NhJPleLKvg35kbrsnsSPhk7hXAMtvCOqI9NdVjHqY2QmugCbC4SSBM/Xv2m3zmVKer
	i53ICAK08dtojhDzr9X/xkKXoPD3f5+ohentGAWq2TaY6//aUDwywBcZGQOJQ3xgEFVdnbym3GU
	gwk5SR66cQ5DA6p237VUvPGDjYP5p3q4+/9JTHf7F3lZ3b0z4Wfhy7n6TkLkg3/WWHthD5pbptR
	VxNVHt/2wXpyPUN4tQX1g0LIz1QcTCqZmAvaf1l7MlppHc+Ue8Be+SiBjogMUDnuVgCcEKpfE/g
	Fqu+FPAKrhpq7aFGGM51D/hGLwZDKCFDV/C
X-Received: by 2002:a17:906:4786:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c260c7a9a41mr1203337266b.6.1788939832149;
        Wed, 09 Sep 2026 00:43:52 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e4579395sm460609466b.48.2026.09.09.00.43.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:43:48 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so8321578a12.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxkcPV1/OQIlW+g7SWbCpAQQOA5Xhhm6axQ/z7DJKC8s69kyRqyRON+egYHN9gwjE8yczPIC3IrvDRm@vger.kernel.org
X-Received: by 2002:a05:6402:f05:b0:6a8:e223:fee3 with SMTP id
 4fb4d7f45d1cf-6a8e223ff92mr2011006a12.43.1788939828389; Wed, 09 Sep 2026
 00:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-14-biju.das.jz@bp.renesas.com> <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
 <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:43:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
X-Gm-Features: AcwNN1UM-4yUAnjvwz3HU9UugHpIoEhFheoRD6Ksts2TAyZGkKbX5f7QzfQ8BYQ
Message-ID: <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 9 Sept 2026 at 04:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> > > Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for
> > > the RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output
> > > via the ITE 6263 HDMI transmitter.
> > >
> > > The overlay enables the LVDS controller and the display unit
> > > (DU/LCDC), and configures the ITE6263 on I2C2.
> > >
> > > Update the Makefile to build the overlay as both a standalone .dtbo
> > > and a composite .dtb (base DTB + overlay).
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

> > > +&{/} {
> > > +       lvds-to-hdmi-out {
> > > +               compatible = "hdmi-connector";
> > > +               type = "d";
> > > +
> > > +               port {
> > > +                       lvds_to_hdmi_con_out: endpoint {
> > > +                               remote-endpoint = <&it6263_out>;
> > > +                       };
> > > +               };
> >
> > No DDC?
>
> The driver uses parent i2c bus as ddc-i2c-bus. That is the reason not added.

Neat trick. Do you know where that is handled? I couldn't find it.

> > > +       it6263: it6263@4c {
> >
> > hdmi@4c
> Ok.
>
> >
> > > +               compatible = "ite,it6263";
> > > +               reg = <0x4c>;
> > > +               data-mapping = "vesa-24";
> > > +               ivdd-supply = <&reg_1v8>;
> > > +               ovdd-supply = <&reg_3v3>;
> > > +               txavcc18-supply = <&reg_1v8>;
> > > +               txavcc33-supply = <&reg_3v3>;
> > > +               pvcc1-supply = <&reg_1v8>;
> > > +               pvcc2-supply = <&reg_1v8>;
> > > +               avcc-supply = <&reg_3v3>;
> > > +               anvdd-supply = <&reg_1v8>;
> > > +               apvdd-supply = <&reg_1v8>;
> > > +
> > > +               ports {
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <0>;
> > > +
> > > +                       port@0 {
> > > +                               reg = <0>;
> > > +                               bridge_in: endpoint {
> > > +                                       remote-endpoint = <&lvds_out>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       port@2 {
> > > +                               reg = <2>;
> > > +                               it6263_out: endpoint {
> > > +                                       remote-endpoint = <&lvds_to_hdmi_con_out>;
> > > +                               };
> > > +                       };
> > > +               };
> >
> > No audio?
>
> Binding describes audio port, but ITE6263 driver supports only video mode compared to
> both Audio/Video support on ADV7535 driver.
>
> I will add audio entries once we have driver support.
> Hope it is ok for you?

That's fine, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
