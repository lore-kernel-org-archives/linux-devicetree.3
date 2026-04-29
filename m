Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A23A1A21
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446047; cv=none; b=rFsbxP76y8rnmvA0JglTvwcSlLbtIlr9X3RS3iOHt+Aa+m2S7Ln3JgRy6m07Rjo2cUXDEZAufhY7/tv30QStOCTsvMJmITIE1GkEvm2PQ1q1g7oItU+eQwrfzaEhUfZ+zpDfH3uJRY++mJTcjSfKu8QVuFHJsDKzlaX0zhVk6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446047; c=relaxed/simple;
	bh=fwUCd2OO9r+K7cZl7yfax8OQL7g2mPXYtDj8o9TBPYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFr+tR3UHiIMxSZ8rsSpXRkcqUHeICkhkk2I5wpev1DeRLMo7syWsDtZxudKVOT1HSBLnURO3uGLAs11soSrGhZb8XVhCmDV6VYKPUBh1US7etmtoh+SDGTJI1CKGocHOqPknizEDYNFOfbKdGD97Iqa5UOSXGaha++ciZ26MNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60fce51aa55so3789920137.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446045; x=1778050845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxfHvn5RDAY/xqK2xFryyMAtewdPervAdenhp8f5XRg=;
        b=Dibn23aw1Ikuv41z2PgqdOSG13JPlSs+xxDMQ1uUF4u0nOTkbTDyb645Mu8H9P6QEa
         ZGqiIHS5a/2riam+nyoGAif9ITy48PMgbpZTPV5zT8MtXbjpZBYD4Zz4HZFPJAqjprNP
         ZGcR9LUECI9ObAEEX9OPS1gIrRAteAHBEDP5Jz7F7kITGy2vkeW14SvqTWSkRnfV5v7W
         DC5YKSc7DwQHFCOc4ETWXUpLtraBcwGqmE5deDpRagiSh9rSz3p9jVx2LomQo6uLrCjH
         UicJxrqe1fo2LUeaMOSWxBnKAUeJR6gcg7xPGq0km7BxUau23GCxdy8/HZKznauh7NCB
         QpWA==
X-Forwarded-Encrypted: i=1; AFNElJ/St/2i09H/4I650b6uw8oZ45wYLjLSlq86dvu6swxb106Vp87nWGmFg0DnMW8XrZaCusfaJBqh366z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0/oPejKWczy3BYxXkGLdg/2+AGTaa6pi+QnzdfNIwiBwBkWV
	5N1P09fhvOa2Wlio88UzVg5AbhngenKKWGlHOUMg0VP9gjJGenfcYxQEThFJs1Ehtuc=
X-Gm-Gg: AeBDieuFUFyUTJq8B9cvY3Hs+rOou+Dl4oeAZ+hOUi0h7s71xhcSkFA5LKgVSE3/Mvb
	fRlzTDZz/ODzuIB7tfJ1wrCC2sVlpagZH4SYuim90eWd/JBAxRK8ouoaUBikaKZIsJLgHP8yl/l
	Wcd3x7n1vWnM0Cw79d4HIaido1XNPbBZaATyszkGygGP+HBTBjTIbPMibPUNFH8Nl36gjs04Cnj
	mfJcbr2v06Qzfpb10Cx8B2V9MlppovANxpmeoTNDBnp6sB+webKBab88WIZOX7DaUUWhPjx3Cs7
	993/SYvt636aDSMISg+8GE5UlhcibKqkMlLMFz+viiG1UhML/Sk38Fs6N6jRXnNTCwAkd7kiNLS
	MbyApmMBwGogKrxdDCM/9z6GK0IPjHmUvJLr8ogzh2r+7e6avMqx3PJFYerM1wNZW4Uiqn33g/J
	UAAHfOZp+syvOwo+ll+vgDqrHqa1eW/yoaXFKM8q6QMr6AtMIS5tOmxZUY7BHZMoIQ39JHds1t0
	Ks=
X-Received: by 2002:a05:6102:cd1:b0:608:7548:e83d with SMTP id ada2fe7eead31-6280834e2a0mr3088002137.4.1777446044754;
        Wed, 29 Apr 2026 00:00:44 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7765acasm566467241.8.2026.04.29.00.00.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:00:44 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56f79717413so3538861e0c.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ86sktQoHKDww6GdA8RrcMjK3zEJrD/G8wjGWwAsCsRsm/0IFWqaG7AiDzHgvQgQGdnh9v9zW3GvwNK@vger.kernel.org
X-Received: by 2002:a05:6122:21ab:b0:56f:61d8:86d7 with SMTP id
 71dfb90a1353d-573a55d0781mr3033698e0c.7.1777446040132; Wed, 29 Apr 2026
 00:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com> <20260402112709.13002-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260402112709.13002-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 09:00:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj6wutXOkfcnnzPZ4D97fhOW+o1ainQDNiST9y_pBbPw@mail.gmail.com>
X-Gm-Features: AVHnY4LVVMFZMc-zJ6qM9FvMwoB3GcpitrWZbQQMaLuKtqtGKMymMdA0uRBA4X4
Message-ID: <CAMuHMdWj6wutXOkfcnnzPZ4D97fhOW+o1ainQDNiST9y_pBbPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: renesas: Document MFIS IP core
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 13:27, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Document the Renesas Multifunctional Interface (MFIS) as found on the
> Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
> Spinlock/Product Register/Error Injection/Error Detection and the likes.
> Family-compatible values are not introduced here because MFIS is usually
> very different per SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v3:
>
> * dropped superfluous constraints (Thanks, Geert!)
> * added tags from Krzysztof and Geert (Thanks!)

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
