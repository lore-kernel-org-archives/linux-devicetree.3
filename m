Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F393DEADB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325358; cv=none; b=k0tg8fESa/+NToIEU+BMxKMiUwgR2Se7rE0vVbdEt44C+3mQTcDYSdqI01D/Hs/A6hbkmvvOxP5PVr1Z8k5emU0BbMW51lJ9pS1dkwJ833RsbFh0Eura8Sa4eogzkyPMPTtFbPqA+NGOG70v8Qy/NID7C0UGk1dzm50P7jX1nEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325358; c=relaxed/simple;
	bh=glp/HdZjPID3k9JwT/K76pg9j++zO7I3Rw77qWLA6Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3O8jELnlQBvvkEhDzrSWd/yj06EE24o2oc2bi3Q1j5+SIwbeLyyt6C/TTPVBxU4d8EkkNbloiHvU224GvZ0zH3Jv7Ab76boc9Ny53GJJd309/70MDQ5zMDg3zDKb7ws1OujHwhmlbOUw9WlrHT/xZR5LXrGTZftYjk29C1Z/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-736eea06c3eso751599137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325351; x=1783930151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf9yz7bHOmjN0sKgSDCZJBffOCMRQyGOU+wzNPd/KAs=;
        b=lSTHjGhtHoDgR6uiWsUE4A4F4Q67tO0FGING3fja+PMMkwGaigkEprubnGQaMk2I93
         hGcsc7nCh50masTlKEjOXZ54df+o/6Ksy+NO+aB9KDepxKghcDct674TB4m/U641SMzB
         vvanbEy5hulPU7PgjSRzSL32SHLPTd3nG64jaQi6qFOQSfMLpt1mCTDNiTzpEC/6zrSb
         1nQ9by8VE0UJt/RmCou1vVxsmIemKnDa162XyN67xmeYIsO9C7MRWkqdz5ugaDbSU+Vp
         F6mxvorHJERp2L9srbAA3RM1I59kNrwPnP39GEtBS4y9SaWU8H3TJvM0njKpkAsXuUkz
         xDcw==
X-Forwarded-Encrypted: i=1; AHgh+RrYRU6hooe5u0+4kqbFV0I3Af2lul3WqufiiAu+k7oN8hIq5P2Bp+1/LsVeP3js4dVXWotOmnIKlZhV@vger.kernel.org
X-Gm-Message-State: AOJu0YwEH01FO55CeSA4sX4nfvS0yq9BgRnTG1j/LFGW+Lrpe7y5W83B
	QpzpLXkLhcFEEXb4yfAuonxSBDKZTlnWQwG/gUSkOeUS//6ZGHvsNz97VS5s7iMh
X-Gm-Gg: AfdE7ck/w7/oR49UoVsAulUaHwha+9gUUpFxNbD82O7KQsWyKQCjud1Fx127EQ2qClv
	qIcMWKi55p5mafa1TRngFXR5fpWUY0xA8WVrA25IHdXyFs1tVUu+TcKGJi1IQPaVnq/VOX4eRCt
	5yNMYNtApEz3pxSrKsaS4D77m0RJNI1SHQQSnKRnsy6LjdKEU6pRUpm+nLR/fqvoVilrjO3UOYA
	YTxkbJH0GGZc3L79dvvdUSMrJzKObQ4HIqaX/Ia8VPBKdpNVCkHFyqfLvrWZalmOxu6usApexW5
	mI3RlNztTqss27Bz6zHOsTDGt8SYnwo0fAL2Jq0HkuQG4mEbtjAr1fgGBSUmMzNSYn22W2WPsL4
	vyHU5Ox+FuxGvAS/aW2FiYNLEle670OuIrVFe9OgcQaQrx10dhohfvc0+kc5zz2EV3m3oQaJeUE
	ikhwqCFE+p5OOv70pg5tim5hF/uZ0TiN892AuhM6Y62Nzn9ofQ/H/8GIz0JltY
X-Received: by 2002:a05:6102:2c8c:b0:738:8022:d74c with SMTP id ada2fe7eead31-7427e7fa3a8mr2676624137.15.1783325351356;
        Mon, 06 Jul 2026 01:09:11 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838bb88asm4709117241.4.2026.07.06.01.09.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:09:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-738bcf9a573so728906137.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:09:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxCmvu7ok9frMwZGd5i01JdfIosnELUhANjiYAUpJWIVNWjEYY3lWCkEW6r2LdhItrBC6ZZDhanTZW@vger.kernel.org
X-Received: by 2002:a05:6102:32cd:b0:73a:2195:4386 with SMTP id
 ada2fe7eead31-7427f05af6fmr3257389137.24.1783325349869; Mon, 06 Jul 2026
 01:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com> <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:08:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCqTQ0fWDyHJkU=0gzFe88r0hsSk9tsgfQUZq4TRcAoQ@mail.gmail.com>
X-Gm-Features: AVVi8CeGulURzBLLfkjFzqZ7MqehawY40QKBoJDeR4KrDLoVwstpoZpBrt3N2ag
Message-ID: <CAMuHMdUCqTQ0fWDyHJkU=0gzFe88r0hsSk9tsgfQUZq4TRcAoQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow hardcoding EDID
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Sun, 5 Jul 2026 at 23:35, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> data over an I2C bus. The bus is also used to detect the presence of a
> connected monitor by trying to read the EDID data.
>
> Some devices where the VGA display is integrated in the device and
> always connected do not connect the DDC pins. Some development boards,
> such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
>
> To support those, add the ability to provide hardcoded EDID data in the
> device tree. This is mutually exclusive with specifying a DDC bus, and
> can only be done when the VGA display is guaranteed to be always
> connected.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> @@ -19,10 +19,25 @@ properties:
>      description: phandle link to the I2C controller used for DDC EDID probing
>      $ref: /schemas/types.yaml#/definitions/phandle
>
> +  edid:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      When the DDC signals are not wired to the connector, and the connected
> +      display is not removable, this property is used to supply a binary EDID
> +      blob for the display.
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing VGA signals
>
> +allOf:
> +  - if:
> +      required:
> +        - ddc-i2c-bus
> +    then:
> +      properties:
> +        edid: false
> +

What if the DDC signals are wired to the connector on the provider side,
but not on the consumer side?
A DT overlay describing the consumer device can add an edid property,
but it cannot delete the ddc-i2c-bus property in the base DTB.

>  required:
>    - compatible
>    - port

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
