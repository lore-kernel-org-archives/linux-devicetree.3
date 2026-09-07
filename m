Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B126525A91
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806802; cv=pass; b=cttxDzSYXsgZdeix0di4ydP/1mSMruNdGXdIMa6vcIbSlctm7+JCHfqPRwpL7d09a0pTrxPu/jG1gGNS5wS1ahtKYIgtD/ho16S9pAMJ2nIjMNi1BOL/C2lgCiXZeUDgQbAEKG+xX/l3s6/HwAiJiyE9n1m6PJnSo836EOTxc4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806802; c=relaxed/simple;
	bh=Kvu+yYHIqkrVmBOSJUYeoPn390eBvDfu5o/RT4xjxh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=an6nnX1GvPhiGHT1FRYc7oWbiPTmc9UDYiewNzbXrurhkR8Z+Cl0JA5xfliXqBDIYXxf0KYmeA7ReYAHMRQJJFDk725KLc3JzAyDxVR+0kEi8zyTRLL3gk1N8hRP6UVWvuQ1vGW1N/WtkeAuOq6eooGtyTI6iNlySghKJSN2qfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFBshJci; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFBshJci"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18032615e9.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788806775; cv=none;
        d=google.com; s=arc-20260327;
        b=IJRv0CVf7UbK+d+kear9U8IwHhtY4I1utumUyS4qQqzUGCMu9aVRnGkjNS4J5qk1qx
         2spYDbtiqXiSoJhFWf5x/2TvTbRo6s0bpv2yNRlR3z8kD2YC0jji4jtubSLSSFW0tU1U
         A9quDqU7Z86GlKPxsUPJ3o+jXG9GjRoM6EjcOmYM/m9dsIqXo/GvfoG6PTT1xba38UDh
         P3lZ3VkUGI5VBzFMgE8rty+x/AjI0ololRDXVlpDULvWA/I0kYxGgdm4aTHfRtr7qXy/
         0a+xIC4eTJ5uYK78Bgtbr+tCoAmccuqtcBZpH4u7R4ZvX6bryPMhYkXHBC/RdxUrBYTP
         O8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        fh=qvLFN58P8WsFQGr2Gp9LmSektG24O64f4HnVHQseZbE=;
        b=RSZnM7vz27O4upsUfYj76AY/oBg74zwx91nzrqPt2AItUj6mX/mm385XyqBdqYxquu
         zIcg/zHgs+wesNSxWxbhsk9nDGCci+toYlaFmnc94iXT8mU5gUXbH2j+6h0SBG3MILnv
         dfWxmvy11EWJcYBzl+Wrz7SMCEoF6mwwNyvM1pgggK4OCBWlpwnEsxYvGWHKL+xdEEHC
         oU2drkwVE4yUMMeFz9o4QMrX80/9hbSG3cQ18Id9f391sunlg1X4wmGMN2xsetCksu2C
         P95jgNRupn1cbXXVPfp17nWOZdC4jeqWM724ipQDJpcrtX9Joa/M59kaihj1rnBAuL1D
         BG1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806775; x=1789411575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        b=OFBshJci78zCHfXQUSmtYSOEmWo3cwkx7pqkY5KFMN2ZJzq4MRE83anQVFtKdo18N7
         /W7KY21H9EfwijN48gcMKoref8S4dEGsjtj3oQ+pSbSXef+GdNst16pHFEC5zk8juePZ
         25159d5+D9PLpC4Eo/m30Lz7dgbEJNwKaeiO3JWGd7Fmr4VBoXQt7nahBiX2oJvzcAkF
         Fno4+4J7fg6+ioWa6RrglFYjb3tUjAZNWvrq0D7wb19O8lqoIsDEnY534Wg1rDZ8e/8J
         HHHAeXnWTPYC2HYvd7sQ+g9Ub31db+Oga6++DQw/3pOUbtzwO8m2T8G/mw+Ov0LahPRj
         Htmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806775; x=1789411575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        b=FhtBO+NUVxnqkCjvFMFdjL1cwkWkd3AlqEBbSpEexEGoqjmNCcLEJZAY28vvxoa4hV
         qV7yvdocP3UyQIJDXSHWfkbrVJ/KrtBGnrUAjUOkq/Of3FABGAFF5Iy2ppi9N7SETcb7
         T/WCNr7sKrFZYnyzABPv0BnUH0Z7xfwkVCTzztjlWFD8vbGYfX6oZUehyk3MQlmK/6kW
         oN8LkkIioV4nX45I+CvqBGoL8Uiqd+Z/OBq7YM9jK5VvC6b5A4Z7F0aGAg5L+PNQVUT0
         idlAatn7PTg/sfjMHkoyYlfkxPpUAxCzps2KExJmwltY4j39yRpqvzeOw2yckI/0w2R5
         SFVA==
X-Forwarded-Encrypted: i=1; AKwUvBy+Hb62G/a9YLy/2tA/LjEpNWC09ESKg35hbvqpTPQF3nyNxTyVf4U137KCmM0NofjdA/A0ydzWJstK@vger.kernel.org
X-Gm-Message-State: AFuF++lUYA/XrsidZ+Kjip3ZVVFTrCQOHCkDXZPh72oC/zKSCBwdz6cj
	6o6h72N7AVo9MZYP7/lZbJowHWGAmsITBYtp5O+d69Bzpj73mlFqoLwUdLA9ofqVwFahE/SpLe3
	8/Il1jnQG/Zfuz90yzex/5X8g4eBdlnQ=
X-Gm-Gg: AYBFou1Lm16IwgXz0QL4wvsRFpucEZbxTJpeArvIHlYwNFp6+Adu5dJtrXGYSJGJkhu
	YNK4aABRaIXRUM6hSNIs0mmUbDFHlamLS785WNXYIvUCWjDILneHSXAdst9yXigAgClPnOiDR9C
	3EsuP/0RAwlpi62IiF7J5RWC7IR7nemuQ/E51AEpUSbjcsL/PSuerxtDzwqb2IoW+xCsi9m5CBc
	IPWkiYUWgYrbhCYx9TwBhdE0GdPXX4MNvh3mOLQHi3IDQfiwL6Qg6l269ayoAq9fbfv78Ebebfp
	zdYpcsAe695PUYKRQzE8hSYATnE39Qgho5fIlWFjr5iu0ob+kJJCbYgVMPG3ta+vf+E3QCbnnxz
	MXZP5goIm5/XOKbTaqpkEJX9xLXqsMw7BtgTq07CXKow=
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id
 5b1f17b1804b1-49cfc6ea7b4mr221188365e9.24.1788806775355; Mon, 07 Sep 2026
 11:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
In-Reply-To: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 19:45:48 +0100
X-Gm-Features: AcwNN1XE7uW2eXf-zpDN13rtRKPngwcstajdD4PloW5l674McTr-7H6fGfJLoZs
Message-ID: <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 3:57=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK is
> currently modelled as two TCAN1042 instances.  Improve hardware
> description by describing the actual transceiver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only due to lack of hardware.
>
> At least the TI AM68 SK DTS should be updated, too.
> There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
> ---
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
>  .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
>  2 files changed, 17 insertions(+), 21 deletions(-)
>
Apart from the sysfs file name changes everything works as expected.

Old path                                               New path
/sys/class/phy/phy-can-phy0.0            /sys/class/phy/phy-can-phy.0
/sys/class/phy/phy-can-phy1.1            /sys/class/phy/phy-can-phy.1

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 469a6282b2a30c91..14f5834082fa500e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -112,7 +112,7 @@ &canfd {
>         channel1 {
>                 status =3D "okay";
>  #if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> -               phys =3D <&can_transceiver1>;
> +               phys =3D <&can_transceiver 1>;
>  #endif
>         };
>  #endif
> @@ -121,22 +121,25 @@ channel1 {
>         channel4 {
>                 status =3D "okay";
>  #if (SW_GPIO8_CAN0_STB)
> -               phys =3D <&can_transceiver0>;
> +               phys =3D <&can_transceiver 0>;
>  #endif
>         };
>  #endif
>  };
>
> -#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)
> -&can_transceiver0 {
> -       standby-gpios =3D <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
> -       status =3D "okay";
> -};
> +#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB || SW_GPIO9_CAN1_STB)
> +&can_transceiver {
> +       standby-gpios =3D
> +#if (SW_GPIO8_CAN0_STB)
> +                       <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>,
> +#else
> +                       <0>,
> +#endif
> +#if (SW_GPIO9_CAN1_STB)
> +                       <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
> +#else
> +                       <0>;
>  #endif
> -
> -#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> -&can_transceiver1 {
> -       standby-gpios =3D <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
>         status =3D "okay";
>  };
>  #endif
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64=
/boot/dts/renesas/renesas-smarc2.dtsi
> index 696a933af808a8eb..826a11ab93c7a253 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -44,16 +44,9 @@ chosen {
>                 stdout-path =3D "serial3:115200n8";
>         };
>
> -       can_transceiver0: can-phy0 {
> -               compatible =3D "ti,tcan1042";
> -               #phy-cells =3D <0>;
> -               max-bitrate =3D <8000000>;
> -               status =3D "disabled";
> -       };
> -
> -       can_transceiver1: can-phy1 {
> -               compatible =3D "ti,tcan1042";
> -               #phy-cells =3D <0>;
> +       can_transceiver: can-phy {
> +               compatible =3D "ti,tcan1046", "nxp,tja1048";
> +               #phy-cells =3D <1>;
>                 max-bitrate =3D <8000000>;
>                 status =3D "disabled";
>         };
> --
> 2.43.0
>
>
