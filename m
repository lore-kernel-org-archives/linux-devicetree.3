Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFBB3B19AB
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456052; cv=none; b=s3Sl5sU+RTOQw5K6d9PhVjkBE2KPWYBuLhYZquWD05vxbcngrBi2wd4scvScClb3GoRGMv4/TVnoeCejVeJYxzyPxyfWniT4pya/mxpf9ftVSHBISZy8rABmBL040kfkMxPkTq6sFOFI2YCT3nGWe8khwfN/S1BDl0l+EdfxwGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456052; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jE4iCmF1euGT39J+uTV6ySlw8AlwEROpZMnQCQcRWFIenyDHtnf5a976ATnempDxDz9KTt+OvpA30q6b6ZVmpIKgDWz6gCQxiUs97MuKCfUsfKjR7nehSJsDNMPSx2CSa4SB98cOQR4fP+Tl7Th6OwVu3l85UTrJ/dsZuOUEbsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so1008859466b.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456049; x=1780060849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=OGIAeNFke7Z16C0G+7yE7hQvuWSsHx7p8O2D+wtQf2/DkJw+Jt+vH+hjtKkqpjfpM3
         J845uyoT9mji7w9h3JY9MDu25NxdaUVLX7fFlbl8NXq541cBSEKv0QNi8260osIDM2Xv
         Am2oOTC7JHZF+3pc4TSxlTQmYkKb/lS4KfgGqBpf/Pv7aqLdv00h/NvI8nEi6M27SVfa
         pmkT4lXYSwAx2l7Na0NZ9Agx0WukjVqagjC/C55nlRQQCAwK69cvVwa90X/Fx6NpvOHI
         duzEchev7yzKYTZvAXLuSHdTxFPjmzue3Jclkpz7KDAwJ+DkOYFXX9kjq3060RJwTMhC
         GgbA==
X-Forwarded-Encrypted: i=1; AFNElJ9KdJ2f6w8+XNDDB9aTSK9A0K1B/WqXxt8Cb0cbUuqWp/rCVIs5q41NswmaHRlQGhEKIVP0klp4oh/k@vger.kernel.org
X-Gm-Message-State: AOJu0YyU9DAn0P7TBbJxAOKcIylCSSl3+4jmzUW6UnkfeUzUWjEogRkM
	tDLF84Gl4pu7zxWrH6s60iaZ0gYw4smjdStDg78tnwWPem7MS0eWkZ/mmj/rHpSmTgk=
X-Gm-Gg: Acq92OEw2Vop0TG84almhsbVxI0+pbfmGgI68442LyCqe0O/I2i8XK8cybf3EGijWTq
	vjbt7+IEFH1YJ/3EsvAHAGNIQhbxXmFBQi19+3Iv1UrYbCGrUyEday61TvO7heaga2s6WdAEtbE
	0QbHmnm1HnYjsKnVRtb7A6rmWNUFm3StIXyQjR9Q3fmpokJOxBOlbds22mrglzmIO+lKpbbQxPF
	XaWlV+ljdw/tG6ugEIZI9r3ZK9naaIhP3771GymYXox8r3racUsGRzOjobO/1ZAKB9Wn2RteSkB
	vY0NxoRglF/+pquEOR+mcNElr9tl5FVfQFnt87FDC42nxpVptojrBRfr29tFI9lpcDlb/r1mZ4F
	NAHGlxeIImGOno3JOJ7zAZhLK7RTVxU28no934DUTamK0wo+pvSuFo5+4HCiiSeHV6t0tc3O+5z
	tMG1WfJRIOgdmE5zMMo/XsXURN9c4LdaLFVMsWV6+FBvVZ6fkvQNE/OKF+B706j1I3fvrfHgM=
X-Received: by 2002:a17:907:a68a:b0:bce:267f:19cf with SMTP id a640c23a62f3a-bdd236004a7mr235523166b.12.1779456049010;
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc69d716dsm53003066b.62.2026.05.22.06.20.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:20:48 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so6999410a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7Y3hyVTyZ2D0mNai4GENKZqBuKc5KCStSpna8wqUhCEQLYpQMRXg5G7BspsOVn6plkR5A/D7ibFmI@vger.kernel.org
X-Received: by 2002:a05:6402:2111:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-6889c437481mr1999990a12.1.1779456047876; Fri, 22 May 2026
 06:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:20:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM9+4Zhz1-jOu14rwNLvfY5zvoO5Tz2AN0VaCzNMqTdg@mail.gmail.com>
X-Gm-Features: AVHnY4L_KbB8gzS9scFyMNemawa__tn8rl0sAqed-jsnkmOH1xrDTQxnThDhUyo
Message-ID: <CAMuHMdXM9+4Zhz1-jOu14rwNLvfY5zvoO5Tz2AN0VaCzNMqTdg@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: renesas: ulcb: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
