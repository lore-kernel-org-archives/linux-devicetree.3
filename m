Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136F3F9F4B
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081918; cv=none; b=OyGehl2ItxTATAnCvnUr+GqZqZBXMZxHv1MGUYktGh870lmuQA6tCLu6F++s1Nzit3dXsTKNn498ayjMoz+uPzQ7VB187bh/JfUSF5Waqg6uMkP2++25S53y80qXtP1dNhJobW4MWQJHKtEBwgQ4hoCnQ85AxMZ3UgX5hmsiwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081918; c=relaxed/simple;
	bh=mK4RQvudzSfHDKsOsVoyt8Iw5IZ1HXhGx8SNTgh8YWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHX3MyMSiaQzZuEc3qEYXEV2cfuW+AgihzAlAZ68HTB1C2+EDryli1rp0UHFtwkv/+gnMTOvtteeJedTUFR0Ad9YH+ggy+mmI5XdXfrJ5Rt/INbIG2dc/krURJCWmuq0RIuP+fCNMuvL0TLZ08OWLrZIAh+nJHAzBdinXTkxLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57512a429d1so2853949e0c.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081916; x=1778686716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiPvar8b58lM8s+EHxxzQhZuLn8K6vNLqEMxBWnkjCU=;
        b=iA79yLv7UIgKrcJ0b2OlMoBBLueX0vBsFFM39PXFn3itCMjwNlDoPiQrQeGMzbdYgx
         ZcmWDylgiiaot3VkKr0dx5pAc5q+4aDYo+B5cjMRpdNm449oPgKGCsvHVZ97s26xfNU/
         wz55ijm6u/h0BLaDH71p9LK5iip6yTe24Phnu5Q95rNR0OO4QP4tijC/weMiuB/y8khi
         3xYpXfLrdLMeQYRzD6010dQZ8duI9PxGmO08iru+Gf9mRWL8+FZwtKX+9155lEXBt4lp
         YslnCYzEesim2AWg4Vg3xf+P9EbY8x91lRPxHKc6nIVMMD4D13zYhEVmMUpFN0VNkFkR
         +AmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+89ZCdoKtBRofdcfQALZM6Ngrn/s087d8jsRmJTw+UB+HwGJ1TUJ7S/MXRwEbamL18wFZs+c2KyuJt@vger.kernel.org
X-Gm-Message-State: AOJu0YzLWjC8mKib+vU1bRMsXDiJ8qPtYyJGqXWEFiDYHklbCTOBYsaK
	Qhj5PlZdv0TNecBhRPMIiiVKYuVCJJX6Rt4knrFSoYg4H8AKInhijWT0CsNi9VCFv1o=
X-Gm-Gg: AeBDiesCPlNHJXD97/CTfjKs1Xqr05m0SGklF1mbGn69WDEUFJFs1vtzD9dk8AMUdH1
	97a9rO7WepeW+RdpDvkCGCmH/sVov67uTg3ek+IT+UZyMu1KacRncT2mp4NvRRbjzVEl5aNB6se
	luXRliC+BUq3CPdc4PtIRGIWlAgApDI3a4Dp8PAB/IYsAVMSG3HH6/T1QN01NeoO6AF9CLJq4Qg
	mqiBAqAW+kM0qvhY2QUAH/thA+i8cAb96ph8DivmYyPdjJpaMQSFbDsbMXsmQXxQ7vrKIo+Yt0O
	2d8/w0NbzOc2Tc7u3VVwTx5D0DL4xuQM8X0uKrh8xZJAHJGcHBpX6KIBXE3LFIOfctkzIJE0Yvs
	s8nDbUS9BtntFs/xQa7IFYIOvlS5m9miHuHqJwc0OJF+sa2sBKOPL4931Uf/Bf05MAxHFj/aHLy
	lAJ+yMkClWCPWzSluYgiApm7mJnyVA74AgxzCN6lJnFAfNmsEjs7yIHPrw7rSm1leb8aGyHno=
X-Received: by 2002:a05:6122:915:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-5755962d507mr2115810e0c.12.1778081915609;
        Wed, 06 May 2026 08:38:35 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f835632sm10170259e0c.5.2026.05.06.08.38.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:38:34 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso4136397241.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/kHWGWkpfVlfNdwRnxnd45FueQAk5YESA9uxzRyh3FMCoIbbRfuXc26BXBAxa+dIURdFX9p45iGjEd@vger.kernel.org
X-Received: by 2002:a05:6102:948:b0:613:6b44:3fad with SMTP id
 ada2fe7eead31-630f90367e5mr1751467137.25.1778081914401; Wed, 06 May 2026
 08:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:38:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUQonMKppURhOpuewET5v9=dqqbywtRzn5jNBqPdFFuQ@mail.gmail.com>
X-Gm-Features: AVHnY4JsU8xfdNxfBXAX3UweYeeFn-aNk8d9aeafTdrWsa0-SJ8O5YDm2A2HTXw
Message-ID: <CAMuHMdVUQonMKppURhOpuewET5v9=dqqbywtRzn5jNBqPdFFuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/G3L
> (R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
> more pins.
>
> Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
> numeric ports.
>
> Document renesas,clonech property for controlling clone channel
> control register located on SYSC IP block on RZ/G3L SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped Port P4 as it does not exist on RZ/G3L SoC.
>  * Retained the tag as it is trivial change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-pinctrl for v7.2
and renesas-devel.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
