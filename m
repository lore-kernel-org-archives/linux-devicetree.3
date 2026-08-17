Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549B3B4407
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950387; cv=none; b=B/MzY8Rky+4rf+1JdUgBaIhqLZ9SByPElWWM2OORg3kaGaw4WBcuhuOBWtdLvrC2/AiGyUA+3zJ9x6Cn/T6DDvCuZqRWEua9lB0S0WvW5T0N4tc+YkTuQ9E+3pq6nKtNvtey1UJ0sNddDqbf1juzj8vQj5ryTfrrdFSquF3Mu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950387; c=relaxed/simple;
	bh=fbgeOiEO9EGT2c+GeyD/KoGXlrNibomcWQO6vEICVc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqGvyhhxMvW89FRpDDR+vj9u8/xWOaDaTCUCMYb4fGiwC/bKER0218Z0ic3ZE2+JInAF6LOgnzbLJ/dvsQHa7fw/+HijdU01XI9kt5RTCiPZIBscN2XKCrGmxmAleeEFWJxFNzYfGYZ7Dlajwq6YQhHug2WRVwKka+HVuqOXbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso594063241.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950384; x=1787555184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzZAObXBTvlF5qEmNlbVBhJCzf1NZELy+LTZ2/1S03Y=;
        b=eGfWFqji5ywBTj15MqVa1ibUJslvDw38LBmUECiPuvJEzjxUPsD0tepPz0hfu37w4z
         enER6wBH/HMYt50UtOr6Du7efMy1yXHJBrB7KWwdg+eo4HxujDo/sFctnMs27zbdPlf6
         wffQH6pvBMazSdHYaG23JYsvoH3FjyuBfFRQ0Mh8aBjO9vPMdetz3ZEIp+5jfyDe7pxp
         1KEsSSNvMQ8+zU5alapSN7uuUq+E0LgjwhiJ9LswfmVPhOo+7tFtaLWnBHWfJzZ6ai5V
         ZkFg0WdhUvSVM3QMOFPQFwAAXlMAcaH2+C56n8iXbZOGhZ0ylMTshDUxuH8KInEnhZff
         oC3g==
X-Forwarded-Encrypted: i=1; AHgh+RramDKzDHvJG87++G2EUCHUvFoRYIF5Cy6ZGGYg/PUFZXcPX8PbEILZC2b5Y6vmPhtIymxhy5Rhg4Nl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgm1S7ydLNuc9XnA9PDXPk7fMelANdVBiwn/819QqP7R3til9Q
	F1YKdv9Ki1ko6lsnNogwK886dg2Jz+yJh0r0pLRYREt18uvnB9QL0flQ1CvxqF3d
X-Gm-Gg: AR+sD12u/SdSFstQtBlZJZ1c4ICI/OLvZWT+8YpcIwkzon8Fcp7RyMmdgJXtCLSOqHw
	Q0Jpnmv0sGm6ztHH903dZV2KJzgzxI3EYkW6paoj2DDO04NFMBDnedGIgWShbH76gIHbRibSS5t
	LtsZ7g7FTDePHqziNMD8thk41axQhkGMqtkDpjaiC1hC04xpuSgBfM4wcGDzMa7sKv/ZBLCAFEi
	4w6UyElAy3DrQ6kfAL2CBEs9uy2wBYLR5TT+62sJ85O7zPkBRr1o0Fhj5/5w5pAfateV/qbZHcH
	ZKpFbvkF9ZjjaBRWA7x4ExbaruVKfYe06ZWEW8UHXOvMRl5IvoAzhVjmkpeBJ88yYcNW/782K2C
	G7WCvzb/BqFzcTz+M14juJREQpcO6WCng96Y/NzeqGmx0J5QH73wMWoOl/SxXS9tG6ITiU/0FDX
	oWFMBcStFDWoZGJP8Wb+jFXD+T3EHrVbLU0pN/yah8s+YCewig/PENbC08zf1UBgqB3qsKxBZ0d
	UP3BCqUfWt1q5F1cdFDq43sMqSS2g==
X-Received: by 2002:a05:6102:83c9:b0:773:756:6695 with SMTP id ada2fe7eead31-77307567295mr422224137.2.1786950384125;
        Mon, 17 Aug 2026 00:06:24 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c508ab92sm327330137.7.2026.08.17.00.06.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:06:23 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfaa014978so1147014e0c.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8KymHFKw6LmEKCAfXvZ0CylW1rvYXVqn7sAr/aWNUK1yjZpnvCeyGM6bp5zBwtaarElfGn0XH02hs@vger.kernel.org
X-Received: by 2002:a05:6122:3d4c:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c591984b16mr3773578e0c.0.1786950382154; Mon, 17 Aug 2026
 00:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org> <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
In-Reply-To: <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 09:06:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU0Z_VP7H3=KX1g7wowG1ZDi__nDgWRmquYxhLHKvd7A@mail.gmail.com>
X-Gm-Features: AcwNN1VnMyJzYsnp7zPKVxOcOJLiN424gLCFqLRF4e6JW2UrjUiX7AMCPRyQHkI
Message-ID: <CAMuHMdXU0Z_VP7H3=KX1g7wowG1ZDi__nDgWRmquYxhLHKvd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-usb@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 09:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Aug 11, 2026 at 07:09:33AM +0200, Marek Vasut wrote:
> > The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> > controller with glue logic wrapper around them. Document the glue
> > logic and DWC3 controller.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

> > +  dr_mode:
>
> We don't accept properties with underscores, unless this is coming from
> existing schema but I do not see snps,dwc referenced in the binding.
>
> > +    enum: [ host, otg, peripheral ]

Probably this should just reference usb/usb-drd.yaml instead of
defining it itselves.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
