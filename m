Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BED3C6A38
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456647; cv=none; b=PcHQTKgPg41YTURiUb9aVr8uLwGSXM7Sf3+vQTlfMq1ZaHOyIE1M9Sdxz88Kdar8EBw+ad9CsG2ePg0L8yQT+t4ipIZUL5+ywO0AOzVZGfPSpYz0kg1tpjMuJ1y5jbI81wJlnuBq496KWGdKE0mlQr0npCEtwsgWmYKQw94M1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456647; c=relaxed/simple;
	bh=ziuevw+51r4Kxjl+I3p78m/V9rg5BKYcFEZhcMCyNR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MATpBLPOpBVnBI2Fh9u84TkX4jatojX1tV1Bb3qf2TAJeV4Wk3IaAkRHY5iJkFa/9q38nPvUhRLoDee/iRHAjLDpZfw93iqLscRqG/1KUaLflYDIN2TmhzXU09tZB4iI+kIjLlI9EfIc+COuSJ5jSavAWRDtxEM311qmdob2INA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d0476490fso2184935241.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456645; x=1780061445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai+ED0uxqMFK7sBAS5UAlxQfyL41wANubGy+GhyhNzw=;
        b=Eqte569Wz5RgewWcPOZvK3GguKbSir4gukZL/W5QXqY3HxB+vazDmnZsBS1PkEvwT5
         nQt8FdyAXwh0KyMynjKP6WtFUfwSyxkv3fAMwarhP8XECirR7PvYSCalGsbw9VGgmhwS
         f6PdZ5/VPpNSRHYDsiSQm2qiAP8b+IogqtMBJWq5oIpgMfEFNwqwgqIlfa7yOVAAOHu/
         Vi3ShIDTcmfHXoOJ2EzBGyjnHjcssYIFZKX+SCexMpzZtYFUh2LiLn0GoUCeZVqvPoZo
         Wk11wcdT4ydWjkmSOXp6hadK2sAmubbDj5sSqV98taWai2PXr0VCiTXonVyFUyx8Ye0r
         oD3w==
X-Forwarded-Encrypted: i=1; AFNElJ/kCqaJvb/GDGjVNYmoJQfr9ybzowoduIQuWQwp3kDS9bK5cry3TlcwdakOE/QnpqU6os8AnqBAFSyA@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFweY2rtkFzTdwaKApvzUcuWgOnHIGftBbdPS3+C3AXOAQwkE
	kZBxY+Km8bDZs+tEr2zWQCA+CAjhE6/Y+sLawSOrXS3nrzCPk4Vl5l7YTpmt61p6F1E=
X-Gm-Gg: Acq92OE8EB8fIlIaFXlQUdrz65T31uLYXSPrO1oEN/uCjevACgcC/+yMLEYeqxZL82+
	t1y7M7DNalr4mWR/EtWL2gbTJZKe+TN20pdJhEzf/ggHnlvj93rPL3Ko1xVl6sI1KuY4qUb09hR
	DqQkfDftq4/xDUY9ZDnwrsZv9QNP1rRGQRGwJuePCMLtFEppgywTtVSiwkKp0WLANxbDiAmMiiA
	IxBSmTBdOU07il2yQSbfKC+DYqcP0FObinQ/04/fYOE8jMIvVAH9bgLTNPccqY+8AG8KJSEeWir
	6TGujcZLhjMAbf0k1ONeK7KJlnaFAAt2xKls1+ykOGL7fK0tXgafIO1DbiHrU/ZRVyml0ypgmkS
	zzjMevAMNPPVHFboCIx7lrRzkQ6KwPwdel+XJuenM0HYRPdH/MvssqxiPr3CYctND3miDGfzlK2
	+nL1lqkCR8H0Y5eWtDqEGw5BWJBExcvnMsQ6Yb1IBAAY4OrY3mJxvnisnHDXJYK50f
X-Received: by 2002:a05:6102:54a2:b0:639:43f5:1fcc with SMTP id ada2fe7eead31-67c8398e702mr1505694137.13.1779456645262;
        Fri, 22 May 2026 06:30:45 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f07e05sm1248793137.10.2026.05.22.06.30.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:30:43 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575124e716fso2448105e0c.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gCBvNF54/5oWFkdYOQx883WayaXkfCyypbbSA2YZ07vn8/4sSqyW3YnHsp+haxTjMOLL+66FrVmum@vger.kernel.org
X-Received: by 2002:a05:6122:4587:b0:56f:b2df:1791 with SMTP id
 71dfb90a1353d-58662daadb2mr1796652e0c.9.1779456639337; Fri, 22 May 2026
 06:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com> <20260520115144.60067-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:30:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEDpM+rGm8-huk2gV4ChDDV_WQzOAZjcK0520Ub1+XRg@mail.gmail.com>
X-Gm-Features: AVHnY4Iv2TWrM_EsCr6NTGF_hpU8CUMgNrig3cwPwu6Sv2g5iw4mOn8563dN2mk
Message-ID: <CAMuHMdVEDpM+rGm8-huk2gV4ChDDV_WQzOAZjcK0520Ub1+XRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g043: Add max-frequency to
 SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/{G2UL,Five} (r9a07g043)
> device tree.

increasing performance by ca. 33%.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
