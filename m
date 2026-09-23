Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E1455D894
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176691; cv=none; b=TPY605IJ9mDcHAJNwKKQ6tFncqwAHGP743M9IgHGd+54hhe9romjkzRBX6sN2abTOCGYEirq+y0g1Q8mmhOvDEwu4+qZQHtBpBEWMA5CgNeKQWVhXQUkIJdlhxLLrjodnBK8gSMHjTBdsUAIS/M6Rraz7X+SXk4seQH6JjxMR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176691; c=relaxed/simple;
	bh=4At2W+U2/moj7AT8T+hicJRX9oknEhtMUmhLAdjqwNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KL8S5RNISHk2KQzGkz3Xt0NVaf+ISVKbBzoxYLEMGzOs0y3AGesjsnBH81wXW2M5izV+/eQjzEdpLWM1CLm7aQ3Z+prdlNGaE0ueauHrPtYSuYVs7gCidJXhmVMyUR4ym+qor858v8QBnyzafT4yRvwGZPkS/cSE/ihY/HUJk/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so5336985ad.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176689; x=1790781489;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCnq/zzLYRUWzxPlHY5tjdaCgBAl1dYFcApPP+PgMMU=;
        b=GDPC2b1zFEQgWpRlu8c09jaFc8QrywuH9zXzTEoCP/ow/wYfpF/XhxRxc7G9X5J8Jf
         En35NCmL4joZ27vyFgYuOo4vYpdf1MzlWpxZGFMUVo6dXRbbZ1KLZQvRvQu/JTGzJ50F
         VuDgdeBy6iQfh0vP4s0NU4ZkrDh5aN2Twes5znzmAH26qBpHU+JhENC+SPEv8NIvbeNW
         nrVCRu23sr6mX247VEWD3fIgAdnfW7FvveuCsiwPhJkRWCGZ2Pe0FSCFGCgh+EVZ2U6N
         UEt9VB3Hu/UHCPHxlg3AQoZJFw3Q+TqClyDYUT7Z7Wt7VGGL0m144f8KbjuY+G5cVPuh
         1Y0w==
X-Forwarded-Encrypted: i=1; AKwUvBxgpQEveAkPav79TCqDaBWL4Hlr5UKUzqUTDjFhk4ucIZP+U4zvFmyFnIaF2dv5vEAt5dZ4oSRpEQnR@vger.kernel.org
X-Gm-Message-State: AFuF++kT+FQgTFELkd0PTzgSXpHtuzcTxT8x0QgP+2dOtwuEIoh9VD0P
	EKM4Z8VDvKdikS2XIp/anIwieYHiaB4NHjpE+egOKsQJ6JXjMqutu9gRJFxmYHi0IgU=
X-Gm-Gg: AYBFou1yr/u4UL6hAxG59nYyA6NStFr+pL36uSAHhoPU7dchx8vsRP6tbP8pTYeWdhD
	RUe4Rg/t8zeaUUqHLJT84ijT6ebdWjMg4PE75S/b98nJ/HiBkPjnIE27bpfKm02BM5xg6Yxu1Au
	QlgYG1AvWnbXaC8K1YQnBqnavC5OKY+PBAEMk8wYMJ5WtalcCEqVYJSh6P9RvjtSXeGi2LNbWwx
	UwNS7NVDJED8GeX8HKGsyrIg8pMl0O4gYwkFID6pepvg1MbgQkyNPWEWGFSDHcOKZ9Vx5ibCz58
	G7B7ICEdgOz33rsIDlkyj+wGq1z8IanYSiSyHJrGKe4ZJUfRPLxYaSgZHjxBAKJ/CGiiTjogh7D
	q7NUgc87AwVWQQVEfuN7yE9uIbRh0fuEs1asjK/XT3vYNVUMxaaVFMXW5UJaz3KwoaRwmNilanM
	Y2xWM2xPCbhVvtzEb0snFMEMI8xlKdJefvQJq4LryEp3L4uQkgwnk+opF13QtEGX+YBPbF1w9yJ
	GheXlfH3JYG3BpNzAeAw7bFNwJyFB2PtJoyWg==
X-Received: by 2002:a17:902:e74c:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2df69d5680fmr23988165ad.29.1790176689438;
        Wed, 23 Sep 2026 08:18:09 -0700 (PDT)
Received: from mail-dl2-f17.google.com (mail-dl2-f17.google.com. [74.125.229.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f589fsm13275695ad.70.2026.09.23.08.18.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:18:09 -0700 (PDT)
Received: by mail-dl2-f17.google.com with SMTP id a92af1059eb24-143859f5737so1450292c88.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlYYfgI99FeGsKzxGMJiHQWCnKzZH2SPsMFS3UhOCcMxvOzbJ4Yqq062CUCfis0hBm9ltUXhNtgyox@vger.kernel.org
X-Received: by 2002:a05:6122:1d06:b0:5c9:a60b:e5d1 with SMTP id
 71dfb90a1353d-5c9f165640fmr3422858e0c.11.1790176255382; Wed, 23 Sep 2026
 08:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
X-Gm-Features: AclHuK-BF50Mc9e7D97YaSRELj5RHb8ahiU8YbPOF3bWrJ1zKR2oLG_CwN8d9Yc
Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
