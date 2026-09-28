Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6DD4DB567
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606411; cv=none; b=NGeUZhP5+WjNF+qhXUUIgrQR2RiskC0BWc5s6RjawhZJKZVRTGO/IqaRMERUXLbxoqeG3IyIVUHs5xC2aZWD7KFd+Pw0juZwK8h9SPlhbng5zXYduEH3Vib98Rv+Fiew0BLpbBwzxiMAJELCs/howe2GsGT3358I7Wx+8wXFY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606411; c=relaxed/simple;
	bh=ll5jxnO1LxSP6VOdbTEMyX5P1KDm9LihOkdaoeyDm7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUIrgYxLsGb+RlB3l6UZ9ElbtJaEjMdmyiW09WHKDUWckPs8P2oVSuBmHFRpOfPkqQp6wSsYh+Rs6ApKzxaeHzbob4tpwXf2O3ATL7bpyppbQbudchpq0d+dcaBIe8z4rJJLik64ff1B5RI5MH1Jnzefy0VVFw7nZ3JA6ssJ0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49895394230so293400fac.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606399; x=1791211199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3m9boaHoB6pESjCzvTfI8L4swM5eZahhrdnO03H/Os=;
        b=eoDpxX72X5TefGkyJjTaAThzVcRdz0OSrtxaPPJEx5+UlTBbPDbWjTeiB9z63PwQIR
         zCkgKpfsUPR/oejB2CRgHy0FOkrLtwgkuWOM6VqcNK2cn7KsAXRqaKzsKARXLTtbFL1U
         lDWAQBxwH3skYJllRgqG3f6/uhg4XnFpT1SAmQhqqsJBz0HHg1Bs4rMQE/6zxXlINFbr
         DvJZaUjOy/O69S98RQ0JFCQFznX3OG/+D5wZ/DcaPLIrCJRrYqepEQeTqwhKqwPsJ6C3
         dLKQoGW9uNhy9O94DJIO5OcI6UJURz2bC+jmJThBioaopEQfJEzCmAP572FobmaNEDMc
         yD4g==
X-Forwarded-Encrypted: i=1; AKwUvByUyBHMCQkJAD/aw8wBYPrXFMLOzFK8qtBS30xJMdh4KOafn+kZltZUwAHaMECq4u87h3MlNWj6Wq8V@vger.kernel.org
X-Gm-Message-State: AFuF++kN4qWT/Q45zPigIGq3yTAU0BZKzuRBTntMNOinqVhXpbTooKmM
	2lmcqNCDwfbYq01PDK4vcUgIW5sSxbyirMUgrEn9QToABAXsO8d4Evs6IjIPTksA
X-Gm-Gg: AYBFou2jYDe6xv63KQD7I8T+nzLdjLSzeUpYgBVbysO8hnqMWyYIv0t8VLDN79Vaj/6
	j3DVlqM8h3yDe6aQ3xGGXfc6YoU6SvDPoftqXL3sdbSWcEvQkT08iFIuq8b29r1ciG0fbUuOawF
	QIC6Sq7CJ0Ty3zyp684KO6bnMw0rq/GE0I8oz8yYt2SYxHgc9L7hqI1U/GX1S1W6xooweIG1UTa
	4bpyj1YricpCvvEaGpw1mkOO13ngdVH0bb9yiTk3JozDkj/BBdtMxtakov/atyYCrHGiRHSnuyg
	zhbDV7W/gKTleoOnx0LvXZRozqAzyJ3WAQbrZlvLz8vw9887Lraa73F0WdqJyEIbKvDGuOV21Fw
	J3O3MMh+c0Wi9JL4kwCUGlx8MF3cQZadvydRaHERsLR7v57HpTu7kHTi74xmhmqK5srB8ffu5Ou
	W4yD6jL8SHDX4cALvBScva6xdw2VVOLLiF8njLobXj4dLIStRhnp4NtP6Mw1rDe1zgOo6/zEQJt
	0bZmm9Z0h2kXOOH7qzh5O2Sozsdi/Zm1S1r0MPQPmcUBN0=
X-Received: by 2002:a67:f44a:0:b0:7b1:3ecd:3d8d with SMTP id ada2fe7eead31-7b13ecd3edbmr2157793137.7.1790605906005;
        Mon, 28 Sep 2026 07:31:46 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cfe5f4fa4fsm4807051e0c.1.2026.09.28.07.31.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-982838c4cccso2251625241.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByloAOCbWPpaCINnB989P8Hf4iyaWkrfySysiccdwh8gttNIb1BNAWOGL3NZe4E/S5uaGyTv7LiQFIg@vger.kernel.org
X-Received: by 2002:a05:6102:1a02:20b0:7af:efe6:2bbe with SMTP id
 ada2fe7eead31-7afefe63c7fmr2495728137.16.1790605902970; Mon, 28 Sep 2026
 07:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com> <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
 <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
In-Reply-To: <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 16:31:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
X-Gm-Features: AclHuK_hO01Uu8W5tQcoOhC1vcw0bnPcJI__NCNgulHZI0GJtePof15Jh2gc_yQ
Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 16:11, Josua Mayer <josua@solid-run.com> wrote:
> Am 23.09.26 um 16:37 schrieb Geert Uytterhoeven:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
> >>
> >> The SoM features:
> >> - 2x 1Gbps Ethernet with PHY
> >> - eMMC
> >> - 1/2GB DDR
> >> - WiFi + Bluetooth
> >> - SDHI Mux switching between eMMC and Carrier Board
> >>
> >> The HummingBoard IIoT features:
> >> - 3x USB-2.0 Type A connector
> >> - 2x 1Gbps RJ45 Ethernet
> >> - USB Type-C Console Port
> >> - microSD connector
> >> - RTC with backup battery
> >> - RGB Status LED
> >> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> >> - 1x DSI Display Connector
> >> - GPIO header
> >> - 2x RS232/RS485 ports (configurable)
> >> - 2x CAN
> >>
> >> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> >> their dependency on configurable mux states.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> >> +       aliases {
> >> +               gpio1 = &tca6408_u48;
> >> +               gpio2 = &tca6408_u37;
> >> +               gpio3 = &tca6416_u20;
> >> +               gpio4 = &tca6416_u21;
> > The TCA64xx driver does not seem to support gpio aliases,
> I have confirmed this now. My expectation was that setting gpio aliases
> helps make /dev/gpiochip numbering predictable, however this does
> not currently work.
> > so please
> > drop these.
> Is this a good reason to drop the aliases, or better to define them
> regardless?

Yes please.  Aliases are meant to identify labeled (numbered) connectors
on a device, e.g. first serial port is serial0.
A GPIO expander usually doesn't have such a connector, and the various
GPIOs are typically routed to a variety of places.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
