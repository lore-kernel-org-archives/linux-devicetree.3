Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE849DBBC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059142; cv=none; b=uX8Qc3c/fagsOtvsIz40bcn6BtwhrJiswcKK3sbyrHwmST/Yl/efg5OHsBERLfdyMNgu8457T3vTJcb2z+u2XMKH9fsiOjrklsQHqsKQbBNgAKWD+vqs0cQ4DClUwnI6ldeEW+Es0dN2GlQKEJzcwDYrqu0HWii3X+Tnc2Jb9BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059142; c=relaxed/simple;
	bh=KuZZEDlH2BTViZR/5FmtDepYeZ94dWiGKrfDtedWqdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsc1Oi3oHM9qLjlHPQQMl3cLz9sAI3ebkMt7Jng2Lms8Z1f5qbzxaGh5O6Ofz8/yR6XOZtDGqWPUl12YxcF3RdSaT/OhI8HwfqheJvllBJj50M89OMBhfVXK/aBMwE1CL30ShaTneNyKBzq/j/gJ8fPMYWxxWksIsTjipTqYJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so447186241.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059139; x=1790663939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pE43WIP/B8Af0zd1OEayR+RwR/Tk1IZvZVkio3avLM0=;
        b=kaFs9IxDaqcpOHstyXTAYDiWFIy27NOgYL3Qtlk0J8oxPBAvGPZA+lHiJQDVLk6gZ0
         YzNZqtl/IlpYwuspCpI7+X2h0YHlHSmcQsqV6BfilFayryFhKLAhyXIhfzVbF7JMN8ui
         gKlhaSZgjfZnkzUMCB0YNahSM9nbw67kS65EPGXBBK2GOZAEdBZhs3tU1PkFkogleVw7
         No6SLoJHcFXjt5HYCXfPy8uli7QuL3TU9R3S5HBGnfms4dwtrVhJ1BNKOH0Zrs212ANT
         RlZPFqcjtwDrCxpZvh6H/aOds7Y2UKbr+GcAOhEauppLYrMAQ4bxxmEYdJBOHEuMH+4X
         GdGA==
X-Forwarded-Encrypted: i=1; AKwUvBx12EAxTSaQekOXJyrSYslIvuj8O3hwePNY9mLPj5b+7/+wv88PFyjXxUIH1Oyv7Skscp0hdWT5gOis@vger.kernel.org
X-Gm-Message-State: AFuF++n8vWvo3G5rxsdujYXKIidPS/m+OXvbflxotxlCdT1RbwH761+3
	9Dnlesr6e3Ldo8AeLBUrWDPtgnBnpjENJax+hXe/CypDUrtGNGIOV5IxOLqaYbCQEJk=
X-Gm-Gg: AYBFou147EsWDJnzMEVOooXoNj6wDmbFv0Zpl6vN/oZSm2vplctvIgZOBjZeGXNAIQF
	mG5psBJ1wRPgdxCvDyuUN/F2DTXFOZhpcr849dWKmVF8fJDGdEi0DBUjqGbsVZdB1UhR4DjTUw7
	B52n2sat/DuyEWf4km2G9uIKxVE4zC6CsVLZezaBa+vJf+ryNpNzG3qkE9i94a2ZWm8bYt11wfk
	J832sAS3nqfztHvVBEVGpS0b/qdkSIuhuCBnXmRtrf6J0wy5JV7XhLqvUmcjPLnBGnzcwTXTqLx
	x67+6wOAox2NE7q+MbklixNWX8NTMe1EyqEtIRXt/fkQ7+5/icPDszcOGd0FwJMyER1zFGy4Dm/
	iN9mE/l8ig2H813PmhlIDMz02+X/w4QkfnstIkhOB+7GjfhHMEpDygyFx7xxYW7IVYo9lE765nA
	jDW6uUsZlJS4uJvaFzmVk+/iEVfhE9hA8WTYFQwUxtlfxra/SKxCfk0mgO+eo4YiyhtdfLiwHV1
	Xi+PtFkwjIYkZG1xmclZU7g/d0R9k5zr0NvTKBTABOcipg=
X-Received: by 2002:a67:ef8e:0:b0:7aa:d0a9:c5aa with SMTP id ada2fe7eead31-7aad0a9c60dmr606077137.18.1790059138811;
        Mon, 21 Sep 2026 23:38:58 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d25d4ecsm887080241.0.2026.09.21.23.38.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:38:57 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-78fb1fb9508so570116137.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByyYNldAdUN6khBq+wUxx0QkczBhfnZ2f5LLBKB4NRZfrSw7EP6GUTp3bNV9MBqON1xnWMoEJgJfQdM@vger.kernel.org
X-Received: by 2002:a67:e886:0:b0:7a6:3df6:ac95 with SMTP id
 ada2fe7eead31-7aaa080ecc4mr1420444137.35.1790059136564; Mon, 21 Sep 2026
 23:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
 <20260910181918.31551-4-marek.vasut+renesas@mailbox.org> <90a90fbd-63e7-4f85-ae8c-335b664e485c@mailbox.org>
In-Reply-To: <90a90fbd-63e7-4f85-ae8c-335b664e485c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 08:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjAv56=91_xXTTErAfS1brS7-s-4ZPHWB=eCpoF_KwEg@mail.gmail.com>
X-Gm-Features: AclHuK-rpqNNs63WVNzxtY1Too0qJAazs_ikggL609BMVbx2GdHhFI8yN8r-DE4
Message-ID: <CAMuHMdVjAv56=91_xXTTErAfS1brS7-s-4ZPHWB=eCpoF_KwEg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/panel: ilitek-ili9882t: Add support for Ilitek
 IL79600A-based panels
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 21 Sept 2026 at 22:32, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/10/26 8:18 PM, Marek Vasut wrote:
> > The Ilitek IL79600A display controller is similar to the ILI9882T and can
> > be supported within the existing `panel-ilitek-ili9882t.c` driver.
> >
> > This patch extends the ILI9882T driver to handle IL79600A-based panels,
> > such as the 10" Raspberry Pi Touch Display 2. The IL79600A uses a similar
> > command sequence and initialization flow, with minor differences in power
> > supply configuration and timing.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > V2: No change
> > V3: - Rename ILI79600A to IL79600A, there is really no ILI anymore, just IL
>
> Is there anything missing in this patchset or can it be applied ?

I don't know: I think you should start doing cover letters ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
