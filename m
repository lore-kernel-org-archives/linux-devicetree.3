Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE563A6B8E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520619; cv=none; b=kSFA+rdCVHafLnAY6108j25dA13nkBXPiveMh8hmASPmkjuMQuvKGndwZMIn3NW/cww34Xkh7Mzgwpu6gif/OQ9rO/Wp1ybp6o6hSSvTmSQAddOs3if+l7b6rDLlUOmOJ4bgSY7lw//tl7/hVaBVz3S1cjqhCEL9A2b7908qClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520619; c=relaxed/simple;
	bh=V06IaIi4jTJzj1JK9gqz8ZBxdNpdoXx4g6Xhk1QdB8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AU9aliLndGqrruErcOqPR8rOfvgATbyZm2lypJK/jr8uOwyJ6h720icBNR8GisUGc4FgBuzE1PRejZkLdgFjYelsOm+boIJ9PvlVDiRZOTp0VFiEqoB5UJ2CwxxMhl4wvU06P43m8c+kDi/8MrPXR5lfdDpsW2uOXw9MND1VV4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so325265e0c.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520617; x=1789125417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKz0EbNXKgkRmHwAjHcE4su/TyTn7raXYOe8ludN9rM=;
        b=KVlnKmshCapsFXrechW4+neyh+xlhIJm3biiZ4KcJe4MnEoxP8Wrp66w1G6GaF3Vvf
         mdLAxkpqQRZX/kd7IhSuBpQmSR1hc+HkxgwrOe3uFf/c78/gxFArB7L7KTJ+N2b0XutS
         MzjumPOlKpPyJaaaTBcq5i4fn9dxoU0CDZXkywo4sY7q5Jo8qAwVsrraxzN5sA8IayS9
         P1zzoPqcDokKYaJwB9WjO51F7/J32ZVXaF/yTkK+N9Rdaq7/RnoxqT6St9mU3+O2kvsF
         0VOA549hGlYsjv+XQrK+J7dW0lz8oclvCLp5DMZAEeZLMYyQb5KwRDYN3LJf1yE6xIxn
         iZyA==
X-Forwarded-Encrypted: i=1; AKwUvBwKa6QagrNQajqK+7VksxA0YGoqFsm3HLZdQLtmY+4x20HOHEDfQMiH2NcxBjw7wN3sSL0osFXEtxBx@vger.kernel.org
X-Gm-Message-State: AFuF++n+rwMvi4SiOogLIS+6A7NDcbgAjLnMeDdg1/5sK7OHFrFfmwI3
	1CAUwx0Enj0EhU3f/VwOashnM0xpiXpaU5ZT67yq6sZ6obDh53R/DjL9JFnw/QJMhAQ=
X-Gm-Gg: AYBFou1c2UBqYyp/yNjNNXE5lUbwHMJN2C3ux1Ld8yn5z6XvELviz0Gzxp1HQwAUdLS
	bzOVZQO+QvKNiHYb9t+QZOXmkgaNyiBccpeRQ67b29TqKQGJV7AmWqH9S9iq0kLr0lUUuzjSGPT
	GPUFokWe3OuQlBvTiQ5LpoDXDh83qfvcW6uF9QupTOJW2r6Xcoge7u4vFKvhJvbk1lQFQwnUNQh
	L78IJ1yaTd6+XwdkzisBs1L630NYpyEZfPJhe9bjc6IWvMjDEfqhQFhzAbnWfXA+KYLwrEsR1Hc
	26J1diBTGlpzStrvEQ3nB8+7tPXPehc7pGuMoY2QxSeCciRLAAqCbTE24SEQD8Pf7gmvfkNqWzW
	412JQNKX/lSTVNbtBWVMYf6rlxqXRHfQy8XyQy8cxfCJxxXaeaIwC2RFWQRQ3u0n+iLUhlr1O0M
	bWMoneKzOS/bag2YLjL6XNefaGtk2C7hsteZMET6wmbIpYanlSpTq1u43jEeUx9GLXAgtnPMvFu
	ReCLKJTMgciDo2bu32pxsPM8QUV22faz0HIaceHFjHkntph
X-Received: by 2002:a05:6122:3d0e:b0:5c2:c0ae:a2e8 with SMTP id 71dfb90a1353d-5c7ed493f50mr2154931e0c.7.1788520617240;
        Fri, 04 Sep 2026 04:16:57 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ebf559cbsm1878300e0c.0.2026.09.04.04.16.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:16:56 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ab6c88052so289607137.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8/QyuwcfUoPonkDFg7QWRoEI6VfVlMEbVsKoeq8E1yFCgvZpwXEGBqz9V7CImtJ+9qYVG4s+0Gy33@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:77b:b14e:b670 with SMTP id
 ada2fe7eead31-78a4aa0794emr1096677137.8.1788520616710; Fri, 04 Sep 2026
 04:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com> <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
 <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
In-Reply-To: <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
X-Gm-Features: AcwNN1U-uc-LOk3gvbh_6tN7N3DFNnBp7J17BKaRTYV7o3lPeDqXkvPWiYvEkoY
Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josua,

On Fri, 4 Sept 2026 at 13:14, Josua Mayer <josua@solid-run.com> wrote:
> Am 04.09.26 um 12:12 schrieb Geert Uytterhoeven:
> > On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> >> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> >>> On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.c=
om> wrote:
> >>>> The list of allowed pinconf properties already includes input-enable=
,
> >>>> but has omitted input-disable.
> >>>>
> >>>> Both refer to the same hardware property, setting and clearing input=
-enable.
> >>>>
> >>>> Add input-disable to the list.
> >>>>
> >>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>> (...)
> >>>> +        input-disable: true
> >>> The Subject of this patch is  "Allow input-enable pinconf".
> >>>
> >>> But what you are doing is allowing input-disable.
> >>>
> >>> With the subject fixed:
> >>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Thanks!
> >> I'll fix the subject ... !
> >>
> >> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pin=
conf")
> > No need to resend, I will fix this while applying
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl for v7.4.
> >
> > I will also add "output-disable", which is missing, too.
>
> Thanks!
>
> However I am ready to send v8. If I drop it my series will fail dtbs_chec=
k.
> Is it okay if I do resend it, and/or should I wait and cherry-pick your
> version
> so that it is easily dropped while applying without conflict?
>
> Or drop it and live with failing dtbs_check?

If you're ready, then please send v8 (and add "output-disable").
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
