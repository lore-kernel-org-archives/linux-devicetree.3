Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993A2D877A
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138712; cv=none; b=a9qqjgbusx3qYg6vaU1A0JA5NyPVkwv/POU3Xa0VoE3ZadhH0FRPsbDFAANL3xp1t99Kutvft292gEXo+BtP0KrAlMkb8w7O28ZbGQz9MQdxinLZD0bXY5NRkVf70CTmq1Ev22qSWYs87JCpWR/sSzKizOQzey/YDAmoqqpu2uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138712; c=relaxed/simple;
	bh=r3lJ4kiRDypA2TdCk466l6gnOvWQLdaxP8w03fLtVio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPd1UTgTPrX3A5ryOQ2SQo6uT8eACGgdrI7uJzIyAObCk3JJk8gY71HUqojipLFXMwK0nv/8H0b4AwTVA9wrrsQ7y69DrgevfV+L6Y/sDOCQ6nvmTIT/20EXbtt4PdfxNQYy0EMJc0anL6NeASTmgBhVELq/UYYdzrw9UVL11TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69de16f5e80so2456144eaf.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138710; x=1782743510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTuN3bG+ueEYLxM+WscVd56YjnZYXVGUSccycTk8sM4=;
        b=OyfhHlpB3V7p3SYLwwMtrZkvpKBtFB1d8scr+ih218TLV6GUi/htmTgAAV0wRBARi9
         bys42zO02XtPR6NwIjhNfZPozED1wLXFQF75wW65MIltBOEN2y40dhZY1hPNFzBMl/cY
         wtvBPA2v4FTjbBCa8FiNewqqAak8Yo8RiPAt3ENj3Y/70aVQK9bW74B8YSGHOTaGvxh3
         hkLWdDofuEDEn6YYBk1TEUuYE17jeyAGDAdY2oWAZHIao7OioLJ1prMuwfXEq6885yTu
         0UT5iwzutKWiYC7ujeLH9KtJZgZgzCDAK+BLwtm1kInk08EI9W9LNinr+VBIOl1kguju
         KhuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hTmNqLW5nGZxjvOv4uwVtTAfvzlli1Bhevn81OkI3iRxpWhFnaSPs8Kz6Bkd6A3YWZvhS9hqJ61TM@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGL+fpLy6B2Y09m7E8WGO2DB4tLoedW7TFoi7ZVzf8MQRUJhC
	uZiqkHphGwOKjodIqK18Uvjw2C+4amZ0jnSpRtdB8XdHUIdhSqlMl+rSUYpboW+L7MY=
X-Gm-Gg: AfdE7cldIls9vra6JmQA3TSVaOPEzzgm5l9VE0eEOEJxzR61nF4vmjnuSCpKown4ENL
	JNN2cAllHPInIQsy/z+G1FE6B37xnnNg1goAx6f/tEpMrYWrz8HzJsaa+lUW2vKnSYltW37h2gu
	88fKAbuzy9+J9OG4L+aeP2XGaoGsJhIxgVq1ixsu9hMdDchrfaW8lWKFhIqiA29a3kY4h4TfWk7
	CrOWGJNqxhB0zVcvE+Xsx5HqUhJZz5gda8+1OvtarCqU+fIbLbhtVEBb4SiBCVwdgFYEfSEkzNj
	iRxJEST09RGc1lSHD8OVUYR8PB/UbSEyvKV2r0lN7wsnHENGh2Uz0ngC3ajlxv+oo3vXS5ms4xO
	LbC+Xiq7b5hwPBhLjE5OOAgmqqThklWg36W8Ot4AxRxOnsYJj/HOmZRWjBGIJtg65BZuovqFl9n
	svYHtXRnUL3aCx/ItBEu52QNMIxAOC3cE03sZw4oSAwOOTNTpAvQ==
X-Received: by 2002:a05:6820:4c8b:b0:69e:32b:3313 with SMTP id 006d021491bc7-6a0d887e3c9mr11624375eaf.17.1782138710024;
        Mon, 22 Jun 2026 07:31:50 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9faf29asm5418508eaf.8.2026.06.22.07.31.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:31:49 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69eb8b6bea8so1978484eaf.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/xf1kEvMgnAVSI0/J/5FF85iRQO43QrhPTslnLicdH6HzkJka3NkMt2+uFvHU9fsr2xrxoD3XP8obB@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:643:80f1:33d8 with SMTP id
 ada2fe7eead31-72a0168eaf6mr8780905137.4.1782138235741; Mon, 22 Jun 2026
 07:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-5-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-5-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:23:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_PT=H6POjaQDNe0T3wDnRR0zzR=DERAs8tCmbd7yhLQ@mail.gmail.com>
X-Gm-Features: AVVi8CcQco2AWKdlNRMxb7JEavLjHlygQDEK2M26qkwC5lqRACV6o9lCgFa_anc
Message-ID: <CAMuHMdU_PT=H6POjaQDNe0T3wDnRR0zzR=DERAs8tCmbd7yhLQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> After contributing the driver, add myself as the maintainer for the
> Renesas RZ/N1 timers driver.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
