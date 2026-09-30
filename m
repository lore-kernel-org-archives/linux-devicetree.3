Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358351C332
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791414; cv=pass; b=aJJxNFdBHCrxTawuIuhArrDhMxJ1HIjMdG7PrQoM/WCpQ+oLXLnQs68Lg/j/2SL4i+o41QDaZDOjHAjeVIwYX0jfSWWgBMZg+GvrV4ZpFdcHOqTBWLupS5bnDUXH4UeRkASoMrIZvVa8luE9aOOhtnJdQNjemWGuqfuDapgqe3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791414; c=relaxed/simple;
	bh=upcfHAxGtdtk1uSk0A/SEb/TRi4JNBIMlA1MuWmB/Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N06hc1/3YK0scm2Jk9Z3J2C1ovK9kbspltYrMCzf0ib+JwhdPJH52kIPs5/wk7/+pKWJN2bHBhZD0NNwE4I2ElS9MW0rmZVQl84FjFJOsKGCy2OpNQUShAL6LFZo7yBhIl3g+FnpM4Us2iA8bThJmNw+BnO/v9PT9no8YxBRR+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJWdqBUM; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJWdqBUM"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b6f8b8113so867604eec.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790791412; cv=none;
        d=google.com; s=arc-20260327;
        b=UaBOMkNkpQrFeFJ+6XlScJKvgyR9D73ekw2Z6+3JKvdrz7bNjR3Ow62tkx53JyJgq5
         WL1sftf3i1/cykbiS9u7ICxKNO9lh0aV/V1p4znHdqd26liXOQuy7J49DIwh+QHIYZUQ
         QffPMepDO+zQzhW7eCWCZe12fis+1o1LoZ0qRIUxgGcU8vDy8CHOgk3SQYpQjGVsqTOQ
         hu6aIz/6roGXDzP15YFOduL/QyMnOgViEQuvG91TAoVFVCEW9uZos9p9txjvelXoyVsF
         G7KwBqn6wj6QyKAfc8a7ZvxxMlTuS+L7zZsSJj+6RUbQoUjRb9wMM1cFfe+Zb4MUfbez
         DPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFazgWQfgrqX5tXQzvSSrxoFxe7hMQG/LSZ4puiNeNc=;
        fh=ynLnZXnzYyXpa1EWlkQeaHHcyONapgDBK2K9X4AB3k0=;
        b=Guj3oQ3qs7cGHUuEILJHDPdYsMJRb4Zbho2f7Ibj1f77Z53PjWZ4i67XNVX75CKy2A
         ewwgjF24893mIRur9e5iCmUUNw5+w2vvP5219ldPT4bKLoqGUMKRcNF0zGVhREdXUse5
         ejuLjKw98yrCs19LL7ykKNJqn2Ac1YBJyWg5acNxYxCU5bzqVD7opcLHdPsfc7gbgPJS
         DqMg/hXGmfeV6pzk1FzEVc3SWIYZGIbWt/ht+hkmvSIZ/4E+CaPNQPT8ppzggozOgLu5
         WXE33Bu8WUNoOnYkaaBzsyfHIvBSXY/egWt+CiPyAupswWPWD2uPmSNfzLyI89Tb1Ote
         +dJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790791412; x=1791396212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFazgWQfgrqX5tXQzvSSrxoFxe7hMQG/LSZ4puiNeNc=;
        b=ZJWdqBUMnfCQYTAgYJNR9K/BuJAKGQjNOdURb+MlxuF86Mew524XuvcXtNjsfBLs7n
         TkkuSUSxpgI4VqjhOD7oUefpwTztkkjko+ooJ/klsrKOemEquddWWla6ZypuD+Lzc0C7
         y550yCH4Kba1fl5IAFZN28fkihnrjTtIm4CCOnylG+XMsfB+UZ7pIvk0NpsUOyAsJYfs
         PMMzU2DTaTSYLJlUZpZLrne9zLmsjtvi0rAX50hIvQ5P+O3iNM9krFBIBJOMV2j4OzuJ
         UoeKcd29N2YQ18tYGEg+DuX/inIv6Kq1gy3lCPTTsUWPEZN3HSJllw1xybzM765d6Ahv
         NpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791412; x=1791396212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFazgWQfgrqX5tXQzvSSrxoFxe7hMQG/LSZ4puiNeNc=;
        b=FWCdLXhr2s6F+BjzyUfp5Lflc8Jg4QHFik89Qlac3lQkRXy3xBMl1syvotqVh1+jSf
         bwpHwJvJdP/F30wZQD+QyYh4jY59CpTY37r3bZwNjaCldlapOQwMll+1xTPIcxASAutV
         Eduy0nQ8nTxw5aE7K1DQkCbSi4DYHm1S958TrfzbGGGtgLk9CtX6bj6qm/Mg6E6hr2A8
         JodirwHPeuU0oBq/Gz6JiT0710STFYBV77M1I3lyFojMdkw2gu/js04s/ybjURg3grGQ
         aKWpbAF2a6dinP0vvc8s8UGllH/AfSAiL+ZKlSAeY3mB5xOjiocwxCz0/+NDQmG6KuoB
         8woQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS7Fh5DHgsrn69G8bT8l9LNQUdH92tkWYsSFxo7aQL1psf5j7EMp1Fjh4+ytaaZv+mjU+94NM0s9PJ@vger.kernel.org
X-Gm-Message-State: AFuF++mT0m78vyYNB5bNGmCxYKpdnN9u3EtyZC3UAkUIbhdcIAqWIMM/
	fGWqK/ePXYpJ2hUuMeHzCi0MMVI6upcFW7cLJt98Ca5f4FJIO0Ltg6WEeiSsvRSZ01uhshPYlDO
	h+XscSKBE+3wGtIuxfG0S52hxGWD63mc=
X-Gm-Gg: AYBFou1grfvu1W7I0xGd1eMXKjXXCvx7LOwoEsHlel/5xVdtMG/378t8Wse8daVMFTS
	PmqLYnfck+C24HTfK6ZPOFs+lTvvdzl1b/2yQWyHtnA09929jP4ANP/K9VtO5eOwltBpRB0csOw
	YGPEBb57ceHk/hpc9mNhp5yQlYiNOcLRZtaTu1UuyTaS5XAYNEXt/cQehNxQaiW/GbQl6/yAEc5
	x2dPeUQ+TAPaYg24EdXevGwwr3Ht3K+aewCefCleVOP1ysZIXbRsr1sMAfT0xHO51CfVLk/Aq/X
	c5DFWsH6seJoMZkrHCUdx6/x5RWaYX2UsBGkZ+GoiNsf1DVkVnAk0mnMX0IfsMK2G6lVumhbmSf
	QIISHFvr57OZk
X-Received: by 2002:a05:693c:6302:b0:33b:f87e:9e24 with SMTP id
 5a478bee46e88-34db442e062mr301482eec.0.1790791411529; Wed, 30 Sep 2026
 11:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
In-Reply-To: <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 21:03:19 +0300
X-Gm-Features: AclHuK-1QxITN8tXKEVLFacuZ52BTqv5hd6JiagMmZ8V3B_11Lh2NaeMasip5dQ
Message-ID: <CAPVz0n2mwC1r+Wsm8j13J-zoZyzjEH2sepsYKVbf847Gqnapgw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
> > +
> > +  dc-gpios:
> > +    description: Data/command selection pin.
> > +    maxItems: 1
> > +
> > +  rw-gpios:
> > +    description: Read/write pin.
> > +    maxItems: 1
> > +
> > +  cs-gpios:
> > +    description: Chip select pin.
> > +    maxItems: 1
> > +
> > +  data-gpios:
> > +    description: Specifies a set of 8 gpio pins used to transfer data.
> > +    minItems: 8
> > +    maxItems: 8
>
> Based on my admittedly brief research, according to the TRM the display
> controller can drive all of these pins - of which there are two fixed
> sets as you mention - directly. So we'd need to describe which interface
> the display is connected to in DT, but not any GPIOs (which they really
> aren't).
>

Thierry, Mikko.

I am not sure how to approach GPIOs defined outside of Device Tree.
All GPIO interactions are done either by ofnode/fwnode or software
nodes. Global gpio declaration is in process of being removed and
legacy GPIO API seem to be not long-therm sustainable. How to resolve
this? Should I keep above layout with GPIOs defined in the tree?

> > +
> > +  nvidia,init-sequence:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: Device specific set of values used in DC DISP_SPI_INI=
T_SEQ
> > +      registers.
> > +    minItems: 4
> > +    maxItems: 4
>
> And AIUI this is panel-specific DBI commands the display controller will
> transmit. So ideally the display driver should receive this data from
> the panel driver.
>
> Thank you
> Mikko
>
> > +
> > +  panel:
> > +    type: object
> > +    description: Node of supported panel driven by the bridge.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Video port for RGB input.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-width:
> > +                enum: [ 16, 18, 24 ]
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video port for DBI output (panel or connector).
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dbi-bridge {
> > +        compatible =3D "nvidia,tegra-8bit-cpu";
> > +
> > +        dc-gpios =3D <&gpio 110 GPIO_ACTIVE_HIGH>;
> > +        rw-gpios =3D <&gpio 11 GPIO_ACTIVE_HIGH>;
> > +        cs-gpios =3D <&gpio 108 GPIO_ACTIVE_HIGH>;
> > +
> > +        data-gpios =3D <&gpio 32 GPIO_ACTIVE_HIGH>, <&gpio 33 GPIO_ACT=
IVE_HIGH>,
> > +                     <&gpio 34 GPIO_ACTIVE_HIGH>, <&gpio 35 GPIO_ACTIV=
E_HIGH>,
> > +                     <&gpio 36 GPIO_ACTIVE_HIGH>, <&gpio 37 GPIO_ACTIV=
E_HIGH>,
> > +                     <&gpio 38 GPIO_ACTIVE_HIGH>, <&gpio 39 GPIO_ACTIV=
E_HIGH>;
> > +
> > +        nvidia,init-sequence =3D <0x0000002c 0x0 0x0 0x00005000>;
> > +
> > +        panel {
> > +            compatible =3D "hit,tx10d07vm0baa";
> > +
> > +            reset-gpios =3D <&gpio 175 GPIO_ACTIVE_LOW>;
> > +
> > +            avci-supply =3D <&vcc_2v8_lcd>;
> > +            iovcc-supply =3D <&iovcc_1v8_lcd>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                panel_input: endpoint {
> > +                    remote-endpoint =3D <&bridge_output>;
> > +                };
> > +            };
> > +        };
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +
> > +                bridge_input: endpoint {
> > +                    remote-endpoint =3D <&dpi_output>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +
> > +                bridge_output: endpoint {
> > +                    remote-endpoint =3D <&panel_input>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.53.0
> >
> >
>
>
>
>
