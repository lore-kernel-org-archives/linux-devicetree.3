Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219E3A5439
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033848; cv=pass; b=ACUls5QvMVz7WVM9+KMGsHbLY09459NkqfGm4GJ75K2xSZFQ8cOkmuBx0lvY8XCKXz4hjqf+CXbXg6RwQJyT6vEDRGvteGPDYD31b1jPyQfhqJ++MvPZArqWxvftEeq85MSb/+iAElSURJVMEblnxsOADBJriLvKdPlyUE3mRY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033848; c=relaxed/simple;
	bh=rjQpwZRziCRPmRDpVCXivkM3ZO4+0gIi2WpOJTzkNQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gesOq39qRemvuUzSOyTk7bbEavFYNenMKPK8Hed6SI96QXFPmNSUnnTFmaVaj3WmbuivkpCyY/AmtT+xnUIQQxAaiIlgVVgc3Mpei84nhY/9gTBXFBQRKMtB/VHUDoXvs+zk4PTHkU+kI1bFhJaL2oIDszWSQP9+tDxYeAytKvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjLqlUZo; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjLqlUZo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so1317231f8f.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775033844; cv=none;
        d=google.com; s=arc-20240605;
        b=a7jlNErRWcfxYNZCmfBC0eF3HFPXHisZvvR4b6xhteqPRR8xoP2dB1tQC5KrI1QdbA
         NbLBj5rolX2ei9YFg5OxLGI0VbfQUp8igdbOrBASC+bCtlEGWKHgSAPpKfuDDu0xu2uh
         d28eXFjAVzecQYihS2qIm9vxTKikwJr3QUYRqZN6CNCTZkTCTEoxMHAjmlZw2/YzGoAG
         b204K1Md7RhuRmlZ4+Y4YokKqEoqbYnPlqmUyIxorpZmJQR/vGx9Uuzd/fB0qM9IVTcJ
         /AjVu0IkClofNrgTHXoTqyEFtn4M8BFuRsLzJyjzniN2QG8r3jfOcV6+b9qrIMPOnvzH
         HmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mw8Legef/6oXHTECNzM5IKKB8uISInWRQbT3/G6OOAs=;
        fh=y0jli4clEIiIpOmULsbUhOYD3qHzbfgEYKEMcbEdgi4=;
        b=P4n5+aerIvVCrEiE4UigGIThb+YSXvXv6RAuN05up24H98w15YfyaaW728n5ZLSz80
         5CbEGd6ClY3qKJvmEvwI6Wiytu7/9MtMsGBA0SkMahm9CfC38gbO79VdxWSYlsG9iWlV
         X1as+FNSiK0PqTQ9af2ssxVqncX2lp3h2wv2dT0Zifn4vgUt39B1iJPdnRAYFWIpw55U
         WOg8VR0n6eMwHMXx8uya+pFGlKA1rNY/yOhV2AfBKRB6wO6nNWVAQmzRrHY73jd3obLw
         XTxZbX9VUJXbjR4Dcuhb1Z7YRRWWRhlSUZkRdpdMkKDnmEHauibLboR7kHQMoNJ8KqfX
         Uasw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033844; x=1775638644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw8Legef/6oXHTECNzM5IKKB8uISInWRQbT3/G6OOAs=;
        b=BjLqlUZo2/XDt3WU5+gWyV+0jGGgAub4sfJjeNDbTBi2USzFCzM4oOuE77l95KkObv
         qaMSt+kry3l/YwDIvtjgYWOenU+919RK1GutkWrKIebG9M8uCXQQLrP7ad6Bh33WtQ8j
         jUJKXuve5qCXPo5rejtUL9E5CMG316k4i3/YPkvx0W4oIB0IOKGPHSYjxW3+EJoVeSH2
         xf2nPZwIf+rJ5WfQ7igIju+EaGQQhKZWL9+zGdZ5uqpD0tvymvDfi2eLFMHbAp6Vwqjy
         fYRkEvjyKvXNyAz1huQKxJBTlWXiW0pZpStjhZBwIjGszSMMmWm/vwGROD+2dtNv8N+L
         cBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033844; x=1775638644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mw8Legef/6oXHTECNzM5IKKB8uISInWRQbT3/G6OOAs=;
        b=g2NJmnayA4uOfUGFt6ugbsHfxTDhS2Xw0NUfPXCrExGIQyW34bvxEqMqluay78lZFA
         DJH2X4r/g43VqN4Kdu7q6lDUuiLrztIU4kIKcT8jTYKUJirCwl1fqLDcjsZ+XpgoOcfS
         YxMryN5lyPlRtbbpUiIwSDkT9ScAzL/OHfjnQGtkHSXhPaaUjbUZJ7HxdLh3fYAXItPO
         k/+rfQTmVaLeVQduG9lr2CYCIJjcOZrQTlOb1DYxLxqtW04toogVk0qfasZmJ8OjixM+
         6hCP2FPazzD3rL6D+z2BMi2Xs9qCfozWHyXOO2fNbkdvpTIPH9rNrvlPsS7fHx+Hz/Xs
         +bGw==
X-Forwarded-Encrypted: i=1; AJvYcCWWltP4DRan62Bim3oE+Q/ltad1kdlp1IbBH+Kvcwm8xLd8QHDOg19M8tgd//+e+5CHYKRQrb1/Bs2k@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTz52Uvk2R5v/s1DzyNygCVlVOU1TVUEeRXjzqS9bvzPLToS1
	bJj+gXXmB5p6pA/U+R9IKiR5BxVkPFFCG1XAhplMLzRuf5CAqYDCM4aXP6k3NQSiWwR30tU8SYw
	mF4g+Khy32DHXgMQdWGMdKaQw1XotrTQ=
X-Gm-Gg: ATEYQzwwnPuB7WDUWGffle+rmX2dDnd8oOOkNueelKrJp0dk16lM24Sci9q9BHOPkNy
	FI0o7eijcgfE/cdgGdHKyFQSvy46hjGPboufwFv+SNFHV8aNgfL0eia2TuYG1Gc6zBzlAUqpzYF
	HKl77ar5E5xQU6JHObjTfAxUDD+lUPnyRsrE0I1V/G4wcuUnSey4BNLnMJj7J3OW6oOcXJk3zk5
	N4m0uGiBhGfMpmsZO5gQIbHZQajYJ5wQqtbNjPPbVFe2arSfmXG/3GMclSYmAZ9SKwVYNHV++6Y
	NKQFe1qw/EGLQd6lgwyXEc20ZcuNhyf8qcM50tAMm+jgmE9jFpQnzj++8WAua9TM9/tp0g==
X-Received: by 2002:a05:6000:2884:b0:43b:54c9:85f4 with SMTP id
 ffacd0b85a97d-43d150f6e25mr5076402f8f.39.1775033844230; Wed, 01 Apr 2026
 01:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Apr 2026 09:56:57 +0100
X-Gm-Features: AQROBzAJgb8y5bTEYQ31GU2eMYziS2ngz4zh_iuUgAJ7c9zmcODAjNpYWf5OEdg
Message-ID: <CA+V-a8ummyBKq4JN=YGG=k5_avKGjRYP1hcG8yARp_j2p62Gvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 3:55=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H state
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: fast
> * Other SDn_* pins: drive strength: High, slew rate: fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 54 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index f87c2492f414..3fae950db603 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -275,12 +275,28 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0=
_DATA5 */
>                                  <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0=
_DATA6 */
>                                  <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0=
_DATA7 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>
> -               ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> -                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0=
_RST# */
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               cmd-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* S=
D0_CMD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               rst-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
>                 };
>         };
>
> @@ -299,12 +315,23 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
>                                  <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>
> @@ -323,12 +350,23 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* S=
D1_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* S=
D1_CLK */
> -                                <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
>                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>  };
> --
> 2.34.1
>
>
