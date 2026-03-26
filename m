Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4831717B
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518391; cv=none; b=MrVlCReZiEeb6eENIvtK/AX9XucL+MPwAgEK5leBhyey1nt23Od+LzamsftL1VTOhc9/pPULfziIkJzcrUnuAj8hkd/48pMs2UAddQi2ugbyiTYaMsM21qHIrt+ISZu81n7Bu4bp8WbfiLABjnHISSK4m/9U/xozfST05QmDxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518391; c=relaxed/simple;
	bh=kIEyhxuYdaWsiktCdoerqKNEY9HJhJYjpyLKZYFTDC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpBBPwd6nEXCYLqiKiZuym5IQ0V4MPRDuDLnZSVk3P8m+m2G5WeIw8jttXK1L/y+HJqZXbvApm4ZPd1RZLTbWDmT2oIbmEzE1aZgtBnGjoV/UcICZuSKWbSAZxOtEJmj0a1khAQ3f6q2GkLiic8cazg6ou9ySxwEs3awPfhUE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso364387e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518389; x=1775123189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF0VWb50M+ZUryfs9KzhTMt2/O8j1VfHTGDlP+pSQVg=;
        b=OYs1bIY2F9kz8kMK2MR7I/4N6IElfMSpP+NT1RnSTAQScwkjPFEsksOO3l22XDmUqO
         ZZp8Ol9NWjesmTktJcwI07Y7ml/Kkz7VVSvJftWzkczvQczjnzHjfxJXaLZWqroW7/cE
         E8TOMvsezaRZFtQilNlBNI35/kh2IuH7Avu/ioQrLS2XYryxzX8mDZoMMKkgr4TdHMeh
         GrQA/JnczCHzCMdZQ7V2fCZSkyyGXjUvhVuS8r0K+GT8zCam1TTvfWdkOWOTxMV8niQo
         eOPH48AoPVGHnW3sNbsGW303L5fg3O6zTySbxoQuc5cek8RYSwKeD2lGUILeKtb+j/MU
         txpA==
X-Forwarded-Encrypted: i=1; AJvYcCVN/n8UmK79mNfCYsIqIaOH6tJLoDjBlJMiexmMNERLejptuZaPURI7IZb0RiyA5ApVlvhndp9u9VJN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8Jl5TWgFdxIziv/4+krJ7Bs+kYqxC/bmsvPCx/+HPO1iuYHR
	2UvzP8X6dJfxe8nC/iqewWHbPY/bPqVZwCfzsSCOVfvgscpbMxSqktCqhAUF53rDeCE=
X-Gm-Gg: ATEYQzyvggyavt1qnSWIDeroezMsNKout7g+DS0w8dBMHMNdxOpnSa+1Bhew6CBETdp
	g8PDHAj3IT1WpLDEYmiQSgZ0Vt/Tt6uulpCtIWAyTwbht8hr9IhNspx+GV/ddIYE1KEAJdKHe0Z
	O3EEIfz0ebQ/uG5vD4IMk0LR25BzgWMVmg7PErwTQ22EX6AUwN0LLsz8DbCCx10XaBN1JWBLo96
	MznOtmM0xzsDgVvDbnV9CSPrKs0x54b1vnac8xTOrEfQ2zJmEjMbI8Fsf+AELxtR2Fce7+o5auA
	hYVpOeaNYDxlLC/qOj9iIU/DPX0LuYxenYhW592pYAXqJOUmm9WtO4rvrs5iJXtUgrnUZ4vXGU7
	ceCZLRq3CPC5SwHc+v6NQ7VPhLbpOzWb8Mr/tKzVaLnjtWnSIZDXjV9LOaI44OBTBDEhB8rKvNl
	DFu4XnIvlNDf7dBTGSS+YuW9RaMyzal6dtWxIaev6PmMR9vlutaRbFuzKUTg+D
X-Received: by 2002:a05:6123:4c:b0:56a:f542:78fb with SMTP id 71dfb90a1353d-56d21f80b13mr3379025e0c.7.1774518389513;
        Thu, 26 Mar 2026 02:46:29 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c2afdcsm3363082e0c.8.2026.03.26.02.46.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:46:28 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94aca174532so229771241.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8IRe9UYbgmXScRC2+THgPVW9wdC0zPFByuT2cNK6qVuERUqHM+rNXnGf9JXHIBqIsshhA20LJqOiJ@vger.kernel.org
X-Received: by 2002:a05:6102:3351:b0:602:6c69:eec7 with SMTP id
 ada2fe7eead31-60387246888mr2874362137.23.1774518388244; Thu, 26 Mar 2026
 02:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045523.223620-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:46:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU67BBLP4NEZmvT36Pk5OjcbKEDjdyw7shZfiKhwVNGmw@mail.gmail.com>
X-Gm-Features: AQROBzC40eYoryYksApDOIGtz-evI70xDisaZpapKThRIts9LzB-N4Lzp7D6J98
Message-ID: <CAMuHMdU67BBLP4NEZmvT36Pk5OjcbKEDjdyw7shZfiKhwVNGmw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ8041 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1537" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
