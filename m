Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AAC3F888A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154899; cv=pass; b=ZFhjjPU3tTvy4y/3QBf0lyZca5J5Bz7iitwxmIg75Hj9DiinsK8krUDP+UOCsLFsTfVuUU0wBT7J+3OJN0Tyhksr6VNNrUvj+Zb4VQDKPBM67hhK3w0GMsMIVvq/rmbgMWSdOg0iUtE3xg9P31o7JDM3Gxp8Zy85Yw8fHhu5QPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154899; c=relaxed/simple;
	bh=of8ZV/kCyQQV+q31+bi/0MLLfWXyjaVnFi/w7NTjqrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPZDoUZCcGFboxlGHH0wuHypafhv2KkmvR0Tz7zxNCDINxn8TNkZOFg+B5H3kCDa2NmVUZ4B9hY71Ul06ed5RegmlEwYv/Uevu+LpdJkO+aZ0H/4Kz6CmtTkeT2lthCDlOpIFHOzwrmdi+xGRU1a4n/Vga2Y5Ta9ktp3Uf+apCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0zDBoyr; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0zDBoyr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso46385075e9.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792154896; cv=none;
        d=google.com; s=arc-20260327;
        b=JnPTh0HXM9EU+pJDM2Par73iJqa7EvJof/S3bxxiJA9Z2mRkI3PN3AyoEhygnTYImY
         2jhrLa14sLe2eQQUtFyyL7tldQzUDf84Fl0JFXtMXdf+44SObRyeANk3Z4aoZy9q5RDf
         CLo3EP+8Ue/fBEq5reu1iwUL7aT0MfoWVML3ze8CtiWPbkpQXi8BCkCrSMre83S6/nJF
         kHqG3U62aJjMVca+n5R2R1vN/sgrHw25hsbtuOqrFsYMS8qRmxhASTQE+o5R7e2x9kSo
         S3dTtIsmPh0rZzWJrH9w+guBwIj2zqPGinZlIM9Cvdp7TdYpeBav4HSdfLn8GF3rUOGY
         4nMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        fh=OlhOVXWk0MUHWarzASDZBMboYCHl1kDewAu9F8uuKrM=;
        b=TTbUwzhiEIcM3+e03hs3uv5SC/JWcLT4cyxdOz8+AHZeFn8ppwaBLe0cnKKu5sSC2P
         9/8rcAGo7e/sl000KdNeBghV9/XDx/JLx4obU+vz9adYhJjWQly8p75QjJumylwdbxG7
         ZX2gx/WwowkCA0iyEVjEPezyB7EvvSk2Ti7apxUZFHSlsXSOXmTXDhUsNxy6r6K5Ve7S
         OVpmpX6HXtQCDakrOjqF5bsitKgG4ghrqRazJS2IBQrJgMGX+llG5ubl01llKESTOOgU
         kPQzI+BbidJFuH08AU2JbeZpvDLglV8Nq01nx5fdOEAsDVT0eVh4072f4hPqdPBx2/JM
         mhQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154896; x=1792759696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        b=K0zDBoyrzl/q1EAk3uVtoc1ebVFR3/THUnMTEI9b6vlCL5yjmjGyhYSLlrkaG5YfSf
         gBgs/NHeyBedyPzeF9owAhfYRkpPc1SRUKb3Y/MjmKyrosRWPotac/HpJt8qJ/iesLkm
         ou+Pi1etlHnEm4YTWLzHXZNaxGdWgzMJzELFQANSqkN9k04Wn2pYUTupHN8+3phRPovn
         9TVk5Rqn8mMo4Rt7SRCNzeal5WSe74UKiLIPVJqsUojx9Wp1GJPvEzqPbUUJy2+YaC0Q
         YeknZmNGIy+7Xu9b3OX1I5IxPxgG+vDmKhiZSgMnyYNPLeeqpXE0c3KCLN0wIicJKJN+
         njyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154896; x=1792759696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OlgrAJhI4dBHdDb8YFJyI1V/AAzFncQtNS2z/ZSh9A=;
        b=Bc82FbTLR3SXP6/+KrPLay65MlX8e+HD6hlqs1Yws6NpCjyuKg5sRTlkMOYSKR5yVH
         Xz+JLI12gzy/ir2L0yB8JhrqMFHRY2ga41/sqGwkFcVpLDrAQzDkZxhodhAnRdwgQbG8
         E32CWCXiWAZv6Z6vReYOxSltLH9AvEaq5zqBxY0A0tGd2mgvIGqAiQq3FDu6hRmtbEay
         RSxYrH5dq3M/wNUiyRzOW7DZkOervd84b4yNMg6mDFAWCy686qvRLNAdXUCUL1KoGTzI
         gduTF41Fdl693kh3AwrJnk3To4vcjol2TRdPlGQilsjW7MBDm0TYyB8tblaoF50KCdYf
         l+6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzp76zG5SVQ+YKP6YXRE6ouU/9EvTTt2iNp+fz26iIMVruU0fbwGT8E504+njQTdulPUTCN42oUP9vF@vger.kernel.org
X-Gm-Message-State: AFq9FYJYUO9LLg1HWokrFFfxjCWdHcqptK+gvCC2E3M80jBWIWC1rbpQ
	0TGOYzoJkHYDfwKiKumoVHFam36fHj/B3kKZ42PjmCzCb5fMY7NT1i75FdZJq3krbPA9t8Sg/hS
	M3f5HV9U4mVfUEYyxH55AKi7FfbBNmHo=
X-Gm-Gg: AYBFou08PAUUsYKkne+KIelexC/NFvttmLav6L5vrdrn4zBKA6P1oZ/SrDmZQGLtLUn
	YKiBneuhNaqGBobi7PIO86F1gyZtI+rL43jRCml6iPFKi7ewU2b3orlDldHlmyeY6Fp9clxYIZl
	6SgUiOqYH1iECvSVGNdBbLHbpxPjPzFyQvX0vK5dovzcPBRuYXzfDzU7q/YFYiDQkcNF5oGgIZF
	qWv+K+OVlTpP/k3xGRdvTHpZQRteQa6VVxVIECmFZDjB9reAecLl+Pg5fp+LsahUoQprxvJ7wte
	93vxBAg1Q6karBPplt3TVfViwDFNI8a6H04b/m2i0cRsAcgQIKhRV4zzbTSOM4Bu90+315uFMPS
	G9b633tt+OOkmUEsTjBARbo5GXbtGOxZ7/UkykmpOuhIyxluGcMG9TyMhfDDXzU5Fx2WGxxEjbZ
	o=
X-Received: by 2002:a05:600c:8b30:b0:4a1:d492:1604 with SMTP id
 5b1f17b1804b1-4a1d49217abmr8476215e9.11.1792154895917; Fri, 16 Oct 2026
 05:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 Oct 2026 13:47:48 +0100
X-Gm-Features: AclHuK8lvl444VKeNoxNELwm6dJ26rZofEbdCjP1xmIlQpJFpVbMZ5iIywezxjA
Message-ID: <CA+V-a8vFf-4e3k1wUeDTjHMx1rb27WMrnsVn6OuijHA0ACzpHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] media: dt-bindings: convert ovti,ov2659.txt to
 yaml format
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:41=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Convert the OmniVision OV2659 camera sensor binding from plain text to
> YAML schema format.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Chagne in v4
> - update MAINTAINER files
>
> change in v3
> - update subject.
>
> change in v2
> - drop rob's review by because use new file
> - use new file ovti,2659 according to sakari's feedback
> - v1 (2025) https://lore.kernel.org/imx/aPdHqCWNdmVkch7S@valkosipuli.reti=
isi.eu/
> ---
>  .../bindings/media/i2c/ovti,ov2659.txt        | 47 ---------
>  .../bindings/media/i2c/ovti,ov2659.yaml       | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 96 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov26=
59.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov26=
59.yaml
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> deleted file mode 100644
> index 92989a619f292..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -* OV2659 1/5-Inch 2Mp SOC Camera
> -
> -The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array siz=
e of
> -1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supp=
orts
> -multiple resolutions output, such as UXGA, SVGA, 720p. It also can suppo=
rt
> -YUV422, RGB565/555 or raw RGB output formats.
> -
> -Required Properties:
> -- compatible: Must be "ovti,ov2659"
> -- reg: I2C slave address
> -- clocks: reference to the xvclk input clock.
> -- clock-names: should be "xvclk".
> -- link-frequencies: target pixel clock frequency.
> -
> -Optional Properties:
> -- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if a=
ny.
> -  Active high with internal pull down resistor.
> -- reset-gpios: reference to the GPIO connected to the resetb pin, if any=
.
> -  Active low with internal pull up resistor.
> -
> -For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -       i2c0@1c22000 {
> -               ...
> -               ...
> -                ov2659@30 {
> -                       compatible =3D "ovti,ov2659";
> -                       reg =3D <0x30>;
> -
> -                       clocks =3D <&clk_ov2659 0>;
> -                       clock-names =3D "xvclk";
> -
> -                       powerdown-gpios =3D <&gpio6 14 GPIO_ACTIVE_HIGH>;
> -                       reset-gpios =3D <&gpio6 15 GPIO_ACTIVE_LOW>;
> -
> -                       port {
> -                               ov2659_0: endpoint {
> -                                       remote-endpoint =3D <&vpfe_ep>;
> -                                       link-frequencies =3D /bits/ 64 <7=
0000000>;
> -                               };
> -                       };
> -               };
> -               ...
> -       };
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> new file mode 100644
> index 0000000000000..926e5cd966b8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2659.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2659 1/5-Inch 2Mp SOC Camera
> +
> +maintainers:
> +  - Frank Li <Frank.Li@kernel.org>
> +
> +description:
> +  The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array s=
ize of
> +  1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor su=
pports
> +  multiple resolutions output, such as UXGA, SVGA, 720p. It also can sup=
port
> +  YUV422, RGB565/555 or raw RGB output formats.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2659
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
> +
> +  powerdown-gpios:
> +    description:
> +      Reference to the GPIO connected to the pwdn pin, if any.
> +      Active high with internal pull down resistor.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the resetb pin, if any.
> +      Active low with internal pull up resistor.
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          link-frequencies:
> +            description: Target pixel clock frequency.
> +            maxItems: 1
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@30 {
> +            compatible =3D "ovti,ov2659";
> +            reg =3D <0x30>;
> +
> +            clocks =3D <&clk_ov2659 0>;
> +            clock-names =3D "xvclk";
> +
> +            powerdown-gpios =3D <&gpio6 14 GPIO_ACTIVE_HIGH>;
> +            reset-gpios =3D <&gpio6 15 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint =3D <&vpfe_ep>;
> +                    link-frequencies =3D /bits/ 64 <70000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe10d29b7657b..585bd3344a9e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20591,7 +20591,7 @@ S:      Maintained
>  W:     https://linuxtv.org
>  Q:     http://patchwork.linuxtv.org/project/linux-media/list/
>  T:     git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
> -F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
>  F:     drivers/media/i2c/ov2659.c
>  F:     include/media/i2c/ov2659.h
>
> --
> 2.43.0
>
