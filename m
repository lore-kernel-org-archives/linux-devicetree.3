Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383F3E63B3
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454532; cv=none; b=MHkYFpBX9nHKcyMY4q6fyGZZ4akxqmE9u+459/LpBozuhmao4+njCXePibOQ+PDQdGq/rA/FqK+d1cPhIQ/3WbVdkHvkbhZbNnAOL1DIf/3PazRDpMngCOfRiGvCtmo+7FzmMHVHK8fhhblEID73yTNnUNCQAHlcBESt/4XXj7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454532; c=relaxed/simple;
	bh=V9EhkXmHhCfd6mpQBTgvR/U5ijzRrAw8mhQanHksz6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2fSxNh0oCFZLqf3tLKWLsdRUt9/Q/YjJu5TMAKTqpQ5PK9KeKs7P61XWs4A8OijEiruHHFlVgRan6oU1jVzbAJixIOMAax9qn+RtHI0pSG626LTr0V0C+9svNdECphWCBCfcevCe2TmyqfHETHvcWppphRCVSaOQnamyl+rsjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56ceded5a11so33125e0c.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454530; x=1775059330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZPS9rvjiCNyKh+pIYFKpxEAkHK/vWQ91zf2PSXKLkY=;
        b=QH+tpCekLsi9qCFvI12pxr1IE05u9OjrXJAnoAt5uIvGmkszz3tm1GyPamJe/qBdCl
         U1zsXwRXyMO8FAup3n5JUX7FLghs82mD1VTcwWEbFWdnN/gvEnVeI1bcHOuGzQBxBl8z
         wrGwP59x8+KIW+/ilrKk0/AiovgCzDemsOtu0TBZf9p3dVNAAGuSmWQUw+iPjo30GjBh
         GgVzaudY3qolItoBrhV3YuZnMjWKdSSK8ex2KCT7vWHuzcHP5ljOnqc2Jla4/J1h4TYk
         +GKC/cH92rKBDCb//NAF4FEwhPd9EkJA73cNxYLMI68YJNFGsj7Nrc+8cfXZTsvHugtT
         buPw==
X-Forwarded-Encrypted: i=1; AJvYcCUTK2ed/myCggsBleJJE2kRyZTwUokrZoQsk9OSNpj1IKjJFz9PQwDDJ7tLZAiPPFN4Nf8u2YNw2K++@vger.kernel.org
X-Gm-Message-State: AOJu0YzEU4VU9w2H7fz2TNkK3v1SK31GTV8QifbdK/IPBOEqjkJ+fLg8
	jfhcRPjKM9mvzB7h4QiUh4vdn+kaGNF2M41iTuKCISpaefztM0OvhSED+1ExGMesHPY=
X-Gm-Gg: ATEYQzxQVq6hlBMisWGh+uk7OslMox+532lyZM11zU+huTr5+7OT6wzuHShaWeiQr+S
	CKa+v9+AkLIhjVdB5P+zOxf8o3EWTzm5QiBEzKxMoCQVO153xrE/gtfXHpU8J1A9NXsU3dShNp4
	hWuZPa1PqLzoGCN9GpAYXYLsdtVFcYwpfmuHnP0qCLhCgu20ZzaSrJ0PwRJE07cTI6wv+DO1zzo
	I1q/wseQKq3fnA8mu1eGuMrNuM+aDqyE5z0WZiwM3CwBq5XrrH5NjuKoC0gbeWq08fomccVo8nP
	q14Kzx+J9UI76KxigVKB/gppbntNQw70NUVUcz825eSzNf6K2gaKtTnLcNsPiE9NRyj5KinlsEV
	xMfIrtQVsiy+vTkkmzvtKOjjGTkrBTRC8/95nH4qtrMJR/kUw6uWKVeGKeNbzrRzSMvV/UIUkkp
	BKrbE5kkLBp4VT0HOpggQ8w5gd50SDBxae5KggB/B/OpZfKMtSKIccvotYprD9f10l
X-Received: by 2002:a05:6123:a9:b0:56a:e25f:fc87 with SMTP id 71dfb90a1353d-56d21fa0afcmr1936955e0c.7.1774454529819;
        Wed, 25 Mar 2026 09:02:09 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf7190sm314870e0c.3.2026.03.25.09.02.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:02:08 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a857578a8so40449e0c.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXf5byUTtklUYTkTplTB8YThAg2EOKj/5Qz6K12xYttiaDEt8Q/KU/mOL3Slo6P+a9Y/DwyKnjFEtQU@vger.kernel.org
X-Received: by 2002:a05:6122:4f97:b0:559:5ef5:b196 with SMTP id
 71dfb90a1353d-56d220c4f8fmr2065624e0c.13.1774454526013; Wed, 25 Mar 2026
 09:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:01:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPvnoSVBVKFOgXFrOyVK_CDuiNXZ44v_FYkEBtYKEhOg@mail.gmail.com>
X-Gm-Features: AQROBzDAUOx_p6wz4xdqborLEdAuZA8hQ4cgzmgeW84NqoNOTvQEgITg1E2ITKk
Message-ID: <CAMuHMdUPvnoSVBVKFOgXFrOyVK_CDuiNXZ44v_FYkEBtYKEhOg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v9:
>  - Renamed gpio-hog node from 'pcie-clkreq-n' to 'pcie-clkreq-n-hog'
>    to satisfy DT schema naming constraint (reported by Biju)
>  - Updated line-name with proper signal name on the board
>  - Fixed node sort order within &pinctrl (reported by Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
