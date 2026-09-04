Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8484446855
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516751; cv=none; b=dvH+5lAL6rTw8JLWNlTnNdyDWHWB6yNdAgzTsUNyfrLp9qZP1yGVhLbbmvLOSCQeHucvdnZ5opQggipM+dRyBVykqiTpOUyaUvJl+eyG6i8RlT0e9Mw3HpWDoxRlEfTCGhUWpm8wOnQwyuurV3C2xqya4nv5zKSiJxmrWAhJ0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516751; c=relaxed/simple;
	bh=QkrSEynGau1ZbI201+0Em8TncEc13fHHUvNMrEc6cck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhbOU7jGtEXswkCkPJltv01QfYnfeT3gbM2w27qrpfoQnI2XNlDpkN8YSQJlTgipeYtdA+VEiPg9KGG3d2D71uV50kZjDNr+PFSTpOlK5kpuDTJDvRu+fkOQ1IGUgeJxWeI3TrluuY1WYVIGuPMhspzkySNI6XGF3M+hG7d2aSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso263353241.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516749; x=1789121549;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ZpJN9RlZp1CfHTyya0RqETx9peOqUoR2+FiCTsKgE=;
        b=gRpL3wuraNEJLT6AVo7TpUo1zLfrMV+ESuoubTCcOjaoHDv2V0yAlQB2zQkEjKsqwV
         GsFtGmyXOm/UmqiJbwn4dg/0Sx4wOmcG9fcBR4fXtKdFrVOrKc3LSpQHjEzo+9PbpQzz
         5VaN+PbSYRHMBg3yqlMJTcpBw6VX+oVSZvKVjXsmBw7amxaBYMmMnbPeeESxKCVQodw2
         dD/TxxJaF2cNJvb4EEnsoar4KbqXJbF+PtLlKiTl0r79FdcwAGlXNZnL54Txzq0UulYK
         N9mRQr2zSQFakJk5uOcmiPD8agXrFoAUgJvQ2I4ifHr4uehomqxkZ8TdYY3JjMSKPxhn
         uj4g==
X-Forwarded-Encrypted: i=1; AKwUvBxB1q0hQWkB/QPmWMVgbvLUBK3S407IyuWXsIZq9ImX9Fq4yqVlf9BmCnnx4iq558SXpjq0bZZUAKjQ@vger.kernel.org
X-Gm-Message-State: AFuF++kJXQaRS34v+PVvsGVls1HZe9mMQNOPoH25TZRr6fKoqCWAnv67
	6rpBNnsqtFtoRz6b683jRH6ACqk28s8YAL6dCWDZG69t6QkD38uCSW/q/9B4q9C0hK8=
X-Gm-Gg: AYBFou29njVxj8gNzj/Y84YoDiZZutAQD6lmzKKPwgCOjWYCs4V6fDl0RN13g13Fzix
	1YNzQ5WAwwVO8fvaxhVthaC/6PQUoQ7VV4XEhkGgH1XHT1vcAaiIBdPcbw0UD6TlcBLtAusyzXO
	iYR0MAkmvU+eZMnSOVIDYltuMlFAS4dXnnlFQZUEBo98t3seEQ4fW9DDRcde3V9cH2Vb9PnAXBI
	RcuWv/ZM1A5bWpE0ZyV9Zm+I9nVganJ0QFX/lRrnVhIZ8Qez2L+0qr1nz6pYwJ8tVb72x3KqnyC
	u4wEf7LtHCvqAP1sYlUbWzIy7bsYKiS2vZ8XLWpi5ZczYt42NsWKvwtzDsJeFEHIoiUX+0BxD23
	yR95Bs+w4I1cJOKoRzuOV3QjL0xTS3jKJLAEnpQdtlf+6MiBOr1b8OC9b/yHF4HOOBivqh7r4uM
	WwaYMeQK4tNwdZhmKlti9vD+OUJmcHnuFgAf/RlZHdeQySoPINXbNNKW1nvoI9W+tKT33gGALjp
	moF1XVBgg3TXsOFNurJWJ4bT1s60w==
X-Received: by 2002:a05:6102:3ecf:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a4a926209mr1126894137.13.1788516748621;
        Fri, 04 Sep 2026 03:12:28 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76512sm1478998137.4.2026.09.04.03.12.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so371537e0c.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvkYJWOtb8miZN8cJmAtD/l/BhKHg1AnRgSD64Cb1xLuhxZ89JlrJW41xFoQucHdCVy+5U+cs/unbx@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1286425137.10.1788516746128; Fri, 04 Sep 2026
 03:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
In-Reply-To: <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 12:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
X-Gm-Features: AcwNN1V1Us7DEfFHRItLM1ZA7SwiTD-ZOtpiiIkRmjTu4wyeWXgopaPPPq_n9t4
Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
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

Hi Joshua,

On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> > On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.com=
> wrote:
> >> The list of allowed pinconf properties already includes input-enable,
> >> but has omitted input-disable.
> >>
> >> Both refer to the same hardware property, setting and clearing input-e=
nable.
> >>
> >> Add input-disable to the list.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > (...)
> >> +        input-disable: true
> > The Subject of this patch is  "Allow input-enable pinconf".
> >
> > But what you are doing is allowing input-disable.
> >
> > With the subject fixed:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> Thanks!
> I'll fix the subject ... !
>
> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pincon=
f")

No need to resend, I will fix this while applying
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

I will also add "output-disable", which is missing, too.

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
