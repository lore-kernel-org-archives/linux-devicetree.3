Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4F5476CB
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874290; cv=none; b=jv5KGhJqHx733k+tdOIpBMSJwT8gqOnUtfCBkfyCpXElMEEGsjcLfFtGbw7Kmwfs5G6MqP9T9GvJyp+KUXB6RDuByMoU5rjhiAS9Pc+0v+20r18j4yW1WDypCKUqahEK9+I5KpI13am0TlOggPygXfbUzWY6htijSaFkcx9j/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874290; c=relaxed/simple;
	bh=yu9OZgfKfzPNFzxIZHgRFCy5pcqiTq5Wq62oensSFpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pD/hxlvCTzr9VQ4VK5OvHNgGCjREkVvwSZ9EZ8KcG0zq4u9Alq/0bvsBuSLO5x3c9iZmQ6hgMf00JNOkUvRRzQrx6XDEg5tgxquHGya6gZKDMGIT8egz+D2MrYH0J+Siy9P7DPJ5xaWEJuClBEnAAb+a9DjrA+ncWjw5MR0jS4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so6132205e0c.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874282; x=1789479082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwjnLI9Ep/r7gZDtAe178FX2I6j4lZ75aWazhYEJCj8=;
        b=FVkI149OX2xBmD6B+cfBk2SB0ZwFH8rzwinSeW9Y26OL1nA4eCatET4ZRgpNEU2GBn
         c0pJg+l0XDJrGuowhT237YZkwHT6d2AoyAjHh7WDmY9X+S3qlXlH4dIwSJ01q6npOSCQ
         5Zllo+2xa+AzrNlaNwZMDjydNuIEYWr16M0fZyiq7hAVVrCkIRkFRKY1+TTqrebiA4Hv
         WYvo/1QpXq3kUhyzp7aqb747WH5O5aUAxFU+spaWpk1vKJbu3zMOdml6HIk4UsdM4cHg
         e9MPMRatb1TANFmFYUi0jyWe8A8mrHFpxjHb6/oiV0lxFLDb2lbqTPwnQ1dhF4YDLuqb
         oKQw==
X-Forwarded-Encrypted: i=1; AKwUvBxJVbBx4Y2SogWs7RwsLuUZHL+4aSwxZbfXbT26F4wGjFDM8V2wS5uPEqsGoPdz9IHjRiN1g7Cf8QRB@vger.kernel.org
X-Gm-Message-State: AFuF++nk3KAwti8aitMCnHCe7SCqG7H6GPUXMpWeuAg4B2V3MdUsxg8I
	DDrm9wXq2McJNdVQzcOQr3hHA6M3oF8CTV4hx6ld0dLDQwjhRrwmq3TyGL5zPpXc
X-Gm-Gg: AYBFou1o0SEQ6VVggVN9ctoKjn4YXjcbeaRUZMNyfVLpzgzzserDrVYxxsruKdqmIDP
	EYvnXu0ijXvqE7ugPJEJhv6r0Du5BHwrY8wg7DMZfL9TcExlX7XDo/XJdKSQh0DBg2woK0mCmVE
	ylesJKzSu1DS7ItOdvsDHdaLkj7yubvII9/v/t9VbgRpTkej9k71et+3f5BsAXV4LqfQSdbcJPS
	onOON5CWPSdZqHQzsEcZ11FaxSSC63O/xhZacLyXPkVGG62LSZwHK8dunidK5QWTjPd5HyE0ME8
	5cEdkysVVakwJ7IcrQEB0cUUo16sKQpCKwTlU8QJaMas0Ua1oemis2aSJ2hiqbLrUK2UzjQFba3
	8L2RPPuQm4GfJn8fFEXvlSiZUp3VfhDHenWE7IzZkEo0q1ZtGOzfvU2s2d4VhAAi2FcC++S0M5d
	1Ty9rYRLWqOAkC4tS20x1YUcXpmE1zeGT9iGeMIhgUFtGQ/uP/mRy+sB8/ilCvPymyvy4ve3/Cv
	2Isq8tFoCwS2bPZFJHN84se0Q==
X-Received: by 2002:a05:6123:91:b0:5c6:6587:a600 with SMTP id 71dfb90a1353d-5c7f579a28bmr6933264e0c.6.1788874282312;
        Tue, 08 Sep 2026 06:31:22 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm9713959e0c.16.2026.09.08.06.31.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:31:21 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-982838c4cccso290104241.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTEel2/fo8e6GoClkk88Gl7/crYDlObflqtmiyN372ZBEXtRHgURWCI5CCyh/liQQGO+Cds0/poOe3@vger.kernel.org
X-Received: by 2002:a67:fe50:0:b0:78a:5bc0:4b7b with SMTP id
 ada2fe7eead31-78a5bc06bd8mr4345758137.21.1788874281039; Tue, 08 Sep 2026
 06:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:31:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
X-Gm-Features: AcwNN1UocVhmKEZQcX_zmxc5OTroh0qtOuTM2DsW1-WXkXKuXnRy_MiHk8uuF0s
Message-ID: <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
> RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
> ITE 6263 HDMI transmitter.
>
> The overlay enables the LVDS controller and the display unit (DU/LCDC),
> and configures the ITE6263 on I2C2.
>
> Update the Makefile to build the overlay as both a standalone .dtbo and
> a composite .dtb (base DTB + overlay).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0

Any chance this can be "(GPL-2.0-only OR BSD-2-Clause)", like all
already existing arch/arm64/boot/dts/renesas/r9a08g046* files?

> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
> + * connected to LVDS and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
> +
> +&{/} {
> +       lvds-to-hdmi-out {
> +               compatible = "hdmi-connector";
> +               type = "d";
> +
> +               port {
> +                       lvds_to_hdmi_con_out: endpoint {
> +                               remote-endpoint = <&it6263_out>;
> +                       };
> +               };

No DDC?

> +       };
> +
> +       reg_1v8: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3v3: regulator-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Any specific reason you cannot just reuse the existing &reg_1p8v
and &reg_3p3v?

> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       it6263: it6263@4c {

hdmi@4c

> +               compatible = "ite,it6263";
> +               reg = <0x4c>;
> +               data-mapping = "vesa-24";
> +               ivdd-supply = <&reg_1v8>;
> +               ovdd-supply = <&reg_3v3>;
> +               txavcc18-supply = <&reg_1v8>;
> +               txavcc33-supply = <&reg_3v3>;
> +               pvcc1-supply = <&reg_1v8>;
> +               pvcc2-supply = <&reg_1v8>;
> +               avcc-supply = <&reg_3v3>;
> +               anvdd-supply = <&reg_1v8>;
> +               apvdd-supply = <&reg_1v8>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               bridge_in: endpoint {
> +                                       remote-endpoint = <&lvds_out>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg = <2>;
> +                               it6263_out: endpoint {
> +                                       remote-endpoint = <&lvds_to_hdmi_con_out>;
> +                               };
> +                       };
> +               };

No audio?

> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
