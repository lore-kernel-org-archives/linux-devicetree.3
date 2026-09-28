Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D8346E63
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600422; cv=none; b=OfoiyA77zoELlzMT11RF/DWPEs0ITN0OYgdAGlx5k9WN+BGltjMO0NYqmmSH+rxzM7YcMKUoSf0+BWw2+UzlDAAgWHVl3b14TkSJS6p29IXf3n46bMGH6sYEda8t2vwyhY9NtLYXewOokvlPVDsrdbtD/3n7w9WveACsIuAyfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600422; c=relaxed/simple;
	bh=J1UCxf74Usvo8/m/zisLMoMzaDelPgwuv0YSMGlmZ0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/+r6Y6bdTOTKUdLhGOeO2JBb8b6qVLcCDnK+pJXZNWgf/DgpVrjtdbhFz8Y6qCv2dOhghsFnxS4tIN3S3DhWgWXs9wwN3i4kTcnUh/vIdFbbg4HbkmDFwsRvOxnLB+1pR4wKKted5XI56NREi1JmkpnzR4InsukIrjOypXwmjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cd1d9d66c9so909028e0c.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600420; x=1791205220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swC+rKb42cR1zlVWS2oz+HcUhOn9Ph47VvSZUMBtH00=;
        b=C4PCB4LailhdzZnQifeY6IU7XFhiLGa2pyQno0qV++MeYYjMBGXViWwQILGSTD8oyT
         BzQ2JP1bbaicfJYCSkWwJZCo1LdDFIcRgpwl58rfSzAbqt53o40ifZLYgPUUzhUoUtLH
         ERZipEzrskACT8Y8wpRkbz4UUQcD+tRO2NhkdNfwsKODuJNKSzQcIoDmXQ9zqQDNLZTk
         wpuXRre4v1YPhxT09pJeZ/2IPU8ZtsUTjPCjhysfG9BxR5sh2idhwUzArjznVJwpQJIo
         875x1nArB89jrpu6UaB33Yn4iPKiJ0o36mVm2BsjwRx3RAwgb2nAXj6V2h7CKzNiQlMG
         f+ww==
X-Forwarded-Encrypted: i=1; AKwUvBw8iU6nB66pysZucChsLnOAq3UeJ/4IvRaw29vB88RZkHXHo4msmooEoZsGX6twHDApVff67e8p/RHJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJgKjVYwbcIoRllW9/dtEoC5s09UQUhAxlLzvZVGof8YfiZf5I1
	xjJSu2JaxO8LVr8PCi5h1H8OdDn+UDRBwM6nLLWcUJNFdtg1H3Xd+6cmBiEhhM4S
X-Gm-Gg: AYBFou1TB1NflbQs9rzXG7YSL/q3wk/Pie49CqNwv5SOEsE1n07KeLx34ZUh+aO1SH2
	w8H5K2FrEuvWGUghlWlxElkbi4+yUA4zN8htbUbEWosWZA2/sE5W91cEOn8yRCI9r+Q/fs5YMv6
	p+yg/3tsLL2xti2Mo/hNGZXC2wLZYQc/qwFTsmGTWr+JKXYjP+RfCCAfMsI1u4aoi73Sg21Xbsw
	U14f6SvDVE3sVIlMrQ1trSu4UZePBTWBYqaMAMJVjA2Au4E7WvKyuwGQAX83a+YvNSQxnYA9eOh
	5H7sS560bNfUaNwRvpGQgO0muWngOfi4ls0QN4CYChjuEBS45sj/HY9yEAfKvAnNHjRi3zwBwW2
	Zhdi1TqZycX61mnTBUJsxxeg3lQ96yzGB/j8Q1edTpo13bLGN0uVwah64r0GWs0FD6G89MNqPFr
	Bxp6ZnOzf2FDvEgogE/nnJbmtEHtGr+KGlg/h/NqT7XWAV2i00vjoTjE04cmQdD0NU611K416+E
	1P8NWI8jEWEU22POuO0Ft8/y1OC14+SbdnE
X-Received: by 2002:a05:6122:e22e:b0:5c9:c60e:f4b7 with SMTP id 71dfb90a1353d-5cb0bd5b4d9mr5282246e0c.21.1790600419648;
        Mon, 28 Sep 2026 06:00:19 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cfe5f4fa4fsm4522026e0c.1.2026.09.28.06.00.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:00:19 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79028ca9371so1016376137.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBze+AtQxYfRuJcxX6DXyJGveLTK7HtosnthGemUmnvP6rZmmJoSwg2kDvSL8/f3Kvq9VnWMkLloIPhH@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a7:19aa:f0d2 with SMTP id
 ada2fe7eead31-7af1f40a6ebmr3883955137.31.1790600418873; Mon, 28 Sep 2026
 06:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:00:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHAFoa+RvhzXDS=hijNXqBk=Fnt++LVm5rTiRQzzvm2g@mail.gmail.com>
X-Gm-Features: AclHuK_dpCNqN6yq7ND9MT0G1Ai1EvNq4GQtb8fvGHVDUDen2mnNfX37jzbkzIA
Message-ID: <CAMuHMdVHAFoa+RvhzXDS=hijNXqBk=Fnt++LVm5rTiRQzzvm2g@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a779f0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4 documentation R19UH0161EJ0140 Rev.1.40 , Jul. 31, 2026
> chapter 9A.1.1.12 Software Reset Control Register 11 (SRCR11) bits 22
> and 21 describe PCIEC ch1/ch0 Application/Local register reset. Add the
> matching reset into both RC and EP DT nodes of both PCIe controllers.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
