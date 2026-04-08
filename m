Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50E3BE146
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653762; cv=none; b=p+/koVI+WlJj36AfA62s8NzUSUVaACEjlc0t7vfDW32Z4TCU7njQH/h3QfD2rGArSnRAv9tJLJd7IjHSxZp6ZazIvT5ziZVX0aLMmXy0S04YDz88CfKxlr0LxnmZVmEEBFR7Je8Mesckb0PrjkNmed8XTwBdpwiW+IXjPe2Mknk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653762; c=relaxed/simple;
	bh=sQmw9lWDcF2d/4KFoX+2MzyqctprsKDF8SgNpypvZGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqTnz8Em3FBMzsNbHlJQBUjUgA8IxwYTNka0ngzhJNv0WBTSLQIs6SqDffsMx5NH9UQedwDqEsj7Xo4punX6jbnGX8cmk9RgJDrd+Z1sNelizhw4W3u/EPYQBUWKxge8iv/Rz+wK8HtVb2cPnjml80RPobjX8lYMlll2FxjbEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cbc593a67aso624786785a.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653760; x=1776258560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/ehc1JvHivWXa8+tx/BxLqhZP9bLnNS5TsQxkh+zto=;
        b=C8BQBR6qt6hHnDif7dbWudeJ+df4ApKLSI94jFOTClRdOx7u7+T8Fwo0ABnfcKnKc7
         /EDKgovO5GAT2uRLuZj6oOq6zvwly9WiV0GnFOs/MFb7a69F4yBvoQQ6Zd1rzVpictLa
         EtRp0uFU8LdYUd8dCeb8dWtnbNjZRMZP77TDoeOaqpH9LArbflg1nGSQEhJxOHrSS30p
         f9ozV5sFXs8MMsJUWV9xRpOjje2MypjtRBP5chCKdwyskoDyxwMOdzLfrt8zcU6tARbk
         KNZIxz1rb5whmTy+K0hvqE9hWBmPfD1ZzxvPQBIb+t5hr+niD8hE0HJuy2mIMFpEoPPv
         fFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXitBvNN38B7MiXZVM6g12Y+S8axavn9F7NBAkI/Y6ay/M9OhF48QYTA+cWfK+b1/pvooQyuE9uBzSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVW61inya8rP28vGrp8qN9W3B2Dq2sS2eQGf80WRGlVYsNMbDf
	uVAqB8OXYXjq6N/fX9xSsHaX2PItHx0Wf9qoKpv2XhN7qmSOxnujskMbQbI6DtgE
X-Gm-Gg: AeBDietjq9N2odTa9EAAe6ecShOalSEi/vUD6/YJKILxevo9fuAyJ0xg+fhSrZ//HLU
	rGefUy+0ewgX2jkdNTuVbe0cJo4wzmYJAP3XipZWU8hrIXi3/jH0LkEZQnawPSB/PU0FR/ardrE
	cGCo9Ccg/J1+n/FNcweBjfMrHIRFFq5rFM5QLh7sNDT//FjDXbMllmvLw7wY55QOGltkCpYik2v
	4Ut7AefcveEBvmh20GgDqsJ7UDnaKSV7bavh7Prxqk8hKwUPFXoDnM69WOB8fz34iyokA7D5U7C
	LLDTjS2EjLYx7uUCqLgtowQs1nAUEdpKpzA+aasPYXjoSYdV/UlzLom13yzbULrguq/avIvxkh6
	EMhG65Z2gbh5kuNisagoHOoRiPhgWgcSsk2po2CCuBIstpYmumvYGUX8mUzKUQxcNFaQ7CbAhNv
	yjyMiQTLDNxWjHbKIPl4687D5ao6GuJgZKjGQnvC6cLR+9D4nPjG+yvwyWu1POmhBhgdgPlbHl/
	sE=
X-Received: by 2002:a05:620a:448f:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8d41e437a65mr2963464885a.50.1775653760209;
        Wed, 08 Apr 2026 06:09:20 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8648c17sm1539871485a.33.2026.04.08.06.09.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:09:20 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d8e11b948so32179281cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmpRgzhMMz5slPyiTbKQ4qBNkT92MOEwq+scxfEw2JS4Isx70m01WlIVsJ7IewqzHlTB4iMIsrg8Gg@vger.kernel.org
X-Received: by 2002:a05:6122:a05:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56dab90cf81mr7244283e0c.6.1775653285855; Wed, 08 Apr 2026
 06:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:01:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWimH9kaOcwVx1LnujT=Lbm8cE50mj+YFxtBQMZCT0N8w@mail.gmail.com>
X-Gm-Features: AQROBzB38k87n7vfkgAHJ2zbU_998n7zblsjoYLjCSjeXBMYaqe_VAmcFna50bs
Message-ID: <CAMuHMdWimH9kaOcwVx1LnujT=Lbm8cE50mj+YFxtBQMZCT0N8w@mail.gmail.com>
Subject: Re: [PATCH v6 21/21] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 DU0 and DSI support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 8 Apr 2026 at 12:40, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable DU0, DSI and ADV7535 on RZ/G3E SMARC EVK.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -33,6 +33,7 @@ aliases {
>                 ethernet0 = &eth0;
>                 ethernet1 = &eth1;
>                 i2c2 = &i2c2;
> +               i2c7 = &i2c7;
>                 mmc0 = &sdhi0;
>                 mmc2 = &sdhi2;
>         };
> @@ -77,12 +78,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
>                 regulator-always-on;
>         };
>
> +       reg_1p8v_adv: regulator-1p8v-adv {

Please preserve sort order (alphabetical, by node name).

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3p3v_adv: regulator-3p3v-adv {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Why not reusing the existing reg_1p8v and reg_3p3v?
Note that reg_1p8v driving eMMC and QSPI are also not the same
physical power rail.

> +
> +       osc1: cec-clock {

Please preserve sort order (alphabetical, by node name).

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <12000000>;
> +       };
> +
>         /* 32.768kHz crystal */
>         x3: x3-clock {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       dsi-to-hdmi-out {

hdmi-out?

Please preserve sort order (alphabetical, by node name).

> +               compatible = "hdmi-connector";
> +               type = "d";
> +
> +               port {
> +                       dsi_to_hdmi_out: endpoint {
> +                               remote-endpoint = <&adv7535_out>;
> +                       };
> +               };
> +       };
>  };
>
>  &audio_extal_clk {
> @@ -107,6 +143,37 @@ &eth1 {
>         status = "okay";
>  };
>
> +&dsi {

Please preserve sort-order (alphabetical, by label).

> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       dsi_in0: endpoint {
> +                               remote-endpoint = <&du0_out_dsi>;
> +                       };
> +               };
> +
> +               port@2 {
> +                       dsi_out: endpoint {
> +                               remote-endpoint = <&adv7535_in>;
> +                               data-lanes = <1 2 3 4>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du0 {
> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       du0_out_dsi: endpoint {
> +                               remote-endpoint = <&dsi_in0>;
> +                       };
> +               };
> +       };
> +};
> +
>  &gpu {
>         status = "okay";
>         mali-supply = <&reg_vdd0p8v_others>;
> @@ -132,6 +199,48 @@ raa215300: pmic@12 {
>         };
>  };
>
> +&i2c7 {
> +       pinctrl-0 = <&i2c7_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       adv7535: hdmi@3d {
> +               compatible = "adi,adv7535";
> +               reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
> +               reg-names = "main", "edid", "cec", "packet";
> +               clocks = <&osc1>;
> +               clock-names = "cec";
> +               avdd-supply = <&reg_1p8v_adv>;
> +               dvdd-supply = <&reg_1p8v_adv>;
> +               pvdd-supply = <&reg_1p8v_adv>;
> +               a2vdd-supply = <&reg_1p8v_adv>;
> +               v3p3-supply = <&reg_3p3v_adv>;
> +               v1p2-supply = <&reg_1p8v_adv>;
> +               adi,dsi-lanes = <4>;
> +               interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               adv7535_in: endpoint {
> +                                       remote-endpoint = <&dsi_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               adv7535_out: endpoint {
> +                                       remote-endpoint = <&dsi_to_hdmi_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &i3c {
>         pinctrl-0 = <&i3c_pins>;
>         pinctrl-names = "default";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
