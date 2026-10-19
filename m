Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613CA495030
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397306; cv=none; b=NWb6wENK2eqX/XDpJgEpxkZfvVsS3WRVjZwFFcvn5SsnfEvFM7kJpW0MozpfS6nrjw99g0EIwfH5+uDpxFZ54PPGE2OV99MKT7WBmGZEInn2QpmFJ/OWuHBzIMhU9gBvRERbNVQcyIR/bgHXeEL05tPQYNeq1A2kbSlO1YGkeJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397306; c=relaxed/simple;
	bh=QfENBpcHhADpjfd53lUe0RxsDEJq18op5rWidDM1g4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWc9q4p7jDiM/YYqJev1NukDGmI9F+422lFGQYrabg0v6bvi8dGisqHVcZ2HuRhtqozhinWy2mYkS17DaDqxFjPQ6BII/++CODAGwMaTEyCZQO8Q73orrHT9SpbkzBKECHAEK2oDQhUaIj982EG3gMFbh6NqNYHyGHyHOJfGa5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac4855401so340031e0c.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397303; x=1793002103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=botmgDWh3QU3uykH2zSrPm6okwvbkqaZK5yti63bokk=;
        b=2zq6hug4zCUuKP4hq3M4zBpsw2pmxS4H43mtC7UtBM6sLMGXRcNy2ovbEKQsjINVvp
         ogaaCUSkKDc+T4lkwxAl9/PMYIlMtGC1AzXAQVj2t05MzQmQrnxkfISY/UdyaBmGWz38
         Npc45IXTQ2gH3WXTNglEVqyiOc6YYU91xaPMCUGsevWMkqGMnecShWpdrd619LZPevKE
         cvhDExzRFJBc4cHuTtgOi7xC+KvQZIz/YZW2Vyy8LWg4CijyHaPmLlFXZ6kNfjCnYmU2
         lYCIgcJg7ODmO6n/0j6aFjWgoIntzyoXAw4fcqN17daAjmI5Z0fuz63vY/1N9G2V743v
         Z1KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSxfS9hgYzq6GzsofW4CwIUxtFK2oJQkeGSgiT1iELMDrP4HH/7F73cCju62VG3ITWGTmcKQq/4S7f@vger.kernel.org
X-Gm-Message-State: AFq9FYIUH40JR9sVsDimwVT4bXmu4sGwC5a/6UuOmFhZ8Q6D+rEYOb1P
	eDV1tdwNKUyliLAsnMle2FrsVBbcY1XxmtzFMV1c7pFlwuRd99JGN+TpZzk+X2TC
X-Gm-Gg: AYBFou0+UOYn7rYsQxaoo/vmLyoJuR6jHYaJHPEgc1cOABmc7HzKIq6u+1ppQYY2n6h
	Jqz4EgFfGFSttrOKurOfIiFZZmtCfLhXiIsRYFBJafjDLSrt3JzL3Pvg4DwkJy/6MkdE8pAGeEM
	BFWVZoplYRpc07PaXgzbTN/03ICUk1j8/J9Bg8MY080fxZrvN7gTq2AOT3WYg4FIyDM1V8p9zHI
	QXbN2EJpSFWiQESDFV8fVPqEx5cRNniCtKoxJKMT889tdTbhOF/TgW5M5BJzk/FdPDXP/8p/Oub
	QTNBXs5HqmYPSigdYj89ZDlery0yqqbRVDy4N280W2rG/vU+Pu2ZY/2d7TVhEGVOAMtATdiC/no
	sIM5MwVcYkGkqln0wefmjvOaP0Prib4ZcNPrE7ZuqRTNZkh59/AohIS9GkImNWWORYpCIRlT5gA
	YhucBvrFQig69DnKE+TAxbBapiYVKgTV/lxm3zrv86p+gn3fhQPhGSnHKd+lkKl/o7WlSb08fET
	a1o9t8AKjskBc+XNvB5MnSXs2vMwBDWbpKvRzbQ
X-Received: by 2002:ac5:c003:0:10b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5eaaa391a3cmr1577281e0c.5.1792397303207;
        Mon, 19 Oct 2026 01:08:23 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabe1b2026sm4335604e0c.17.2026.10.19.01.08.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:08:22 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso50272e0c.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2+QXmczk7CjwnQQ0Sr2TX7REXPiXnPoE+i+yzpbNE6HBDjkrQCfK80LaLCExsEjxUEmnQXofgk6Wz@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:7a1:f980:e934 with SMTP id
 ada2fe7eead31-7cc369c0d0bmr1772093137.16.1792397302431; Mon, 19 Oct 2026
 01:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019022717.511096-1-artem122novak@gmail.com>
In-Reply-To: <20261019022717.511096-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 10:08:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKpkTFBEj9HkSPOMfefNYcqGyh33H43oVhHVHevn4bag@mail.gmail.com>
X-Gm-Features: AclHuK_PpER2TShAXTflyONo_n8Icmw2EzWmH61DvSpoBwL56FzjhvRFzzvqUgE
Message-ID: <CAMuHMdUKpkTFBEj9HkSPOMfefNYcqGyh33H43oVhHVHevn4bag@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305 compatible
To: cacioandpepe <artem122novak@gmail.com>
Cc: daniel.lezcano@kernel.org, robh@kernel.org, geert+renesas@glider.be, 
	tglx@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Mon, 19 Oct 2026 at 04:27, cacioandpepe <artem122novak@gmail.com> wrote:
> From: Artem Novak <artem122novak@gmail.com>
>
> The Renesas SH7305 includes a three-channel Timer Unit (TMU).
> Add its compatible string to the Renesas TMU Device Tree binding.
>
> This is an RFC because SH7305 TMU0 Device Tree support is still
> under review.
> Feedback on the proposed binding would be appreciated.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -21,6 +21,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,sh7305-tmu  # SH7305

renesas,tmu-sh7305 (+ sorted alpabetically)

>            - renesas,tmu-r8a73a4  # R-Mobile APE6
>            - renesas,tmu-r8a7740  # R-Mobile A1
>            - renesas,tmu-r8a7742  # RZ/G1H

Probably SH7305 does not support module reset, so "resets"
should be excluded, cfr. the proposed bindings for SH7750:
https://lore.kernel.org/3b3f41148158aa146f06a40aeb5b23c8611b1895.1716965617.git.ysato@users.sourceforge.jp/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
