Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D2367B96
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135027; cv=none; b=gc3mrF8tueydv3/QAtBwtWHtfDWaoZ5rtgRW/VogpzOlMp8fbdlzOMEeasCfWQOMHWwjtNLIAHgZ+uL3zCE3Dcai2DwYAIA7XZbaLBQSINxygwt7U8vhp3QGBtHhfvR0cxKne+zSsGH8U7m+bGgjuHL4DulnrJ3ww+fZdEVM/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135027; c=relaxed/simple;
	bh=TEFG1JxIrWa5R8XIIqKP99UZShAp8TtJJdn5VwTwpNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7SIvMVtV7v/fStz4a5/Bip9is8qp6yRYf2qoOndnmmv870gPzumhhXoHvlO5+bUcEjGJi4TZL4Z4JkGfX5ieOQr2fnJqbXdp8TwnGZqje9ATetLBMudC4W8TmtxQj2JtFHAZfkY1sfgj/Wj8RtqJuJT8pmPKDFkpXRP/Sjj4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6978f1eeb87so2482727a12.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135025; x=1782739825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2oNQ73bmOtLMU2rlDlwVXgajqvH2VaQxprzA4X+ja8=;
        b=piPjhiAnBaoDaL2EfkypjL04/jjQaVw1aWaWPUaepsqMf0Zel9V77K0GtY32qj20DG
         CaegxZZ/5WtjgIZ6L+KOL9IQQlMaJdkrpqqK+gnlOZjdDXMGqxLxqivf+7IreML3QsRG
         g4X02NBS7EfjW/TlxCHPdXk2dHaSpcGZ3GsrkARvIGZvCPkBqUq9wch85nqFoOwlhWGq
         kNb6QHY/dEA3TLnbKFNIelQDuD204Iv81ShBeXcVuYNzykDy1Q0cSlIZx1XfVNHqhecX
         iBOCfZvzafQpbBDY/+ZndzN1qZ3B9nKXINBjiXXIZTiUFCv57k6AgBb1hDmh+MpZBBqB
         BW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8iQVfLfgTB8FIdv6aiv/HU36ptWANY4MtriIveOFN+0grbpmAprpvxa/3BFigf0mu5vh1kg9UR/kRc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+24mkSoqIq+h5QhwdUqySSsmYt4B4A8Idc7gEzl3mYKirWt6n
	fsq45pzoAwlwqrabSpjB/R4zqFqpKPg6/uVEy06MkE8I56GbccFY2XYR4GUjv8eL0YY=
X-Gm-Gg: AfdE7cnBCk567qQ+azb/E+3E0d7Y+WRv99G0fDTUOIhuLlgXtCI5cjOy+HaZceYpu52
	j5HvONm87+J67Pg//qHBS7e8ZeyDF4dpoUvrdfjb2Dum2zQZ6C2kQBdrdSM4xMS2SvhVnhVjHLW
	YdTO9VFJuk3OaCNzwqjfVQMFC16Luz/sV4Hbim0ZhH+qExg4Q4iXFN5mqKNqIj1OZAIce4GP1vp
	SVxMVYveRI3nlG/7fqzzi1p6aXqfigLvP0mDuxIatCckgr/Nr97jxbBw6rG1356yaBnSqYJ5Uoq
	0Mt7I/nmwykIBAN3xOjmTvJJg3vkrFwOQwBS09M8dza0qrteZd2THTbf7kLOmm2YoTpc3lrD8Yc
	+tfQ12VuX/jAdON7Ku8oTgO+mXsB+jZCYpcPZZDjInGbLgE5Mtob7sh0CHuFB+JPNw/4qcIjLes
	osmoPGM93WE54QULF97lWCHloG+ABFZEnpIe5hLUhVdy0NZbQHN1wrBaM1BNod
X-Received: by 2002:a05:6402:84e:b0:68d:235a:cdaf with SMTP id 4fb4d7f45d1cf-696dde5e6f7mr7134200a12.5.1782135024927;
        Mon, 22 Jun 2026 06:30:24 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be64ddasm3117670a12.28.2026.06.22.06.30.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:30:22 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697764213d6so3920583a12.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+blU9zyhn0kqkBZhBVO1ao+6uWX56yohZjuNVHvkn3AhnhOavV6bjtjWmIBzDRMeSE1gcsKbFHViPH@vger.kernel.org
X-Received: by 2002:a17:907:9726:b0:bf3:230c:4c64 with SMTP id
 a640c23a62f3a-c097af6b5f3mr627239766b.16.1782135022625; Mon, 22 Jun 2026
 06:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:30:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsj7yXeZTqdE3gpmkEQb7HGsP3=-_vrmtcQr=xFhG9NA@mail.gmail.com>
X-Gm-Features: AVVi8CfcLXAI7P3_jEdAo3lSJH0fCHPKxANgfXD58AuDMR5cmQzIbXzm3DlFFeU
Message-ID: <CAMuHMdUsj7yXeZTqdE3gpmkEQb7HGsP3=-_vrmtcQr=xFhG9NA@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 10:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the Renesas 5P35023 (Versa3) programmable clock generator on the
> I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
> audio subsystem.
>
> The Versa3 provides the following clock outputs:
> - Output 0: 24MHz (reference)
> - Output 1: 12.288MHz (audio, 48kHz family)
> - Output 2: 11.2896MHz (audio, 44.1kHz family)
> - Output 3: 12.288MHz (audio)
> - Output 4: 25MHz (DIFF1, Ethernet)
>
> These clocks are required for the audio codec and the Ethernet
> controller found on the RZ/G3E SMARC EVK.
>
> Output 5 (DIFF2) is left out, as it is not connected on this board.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v6:
>  - Actually drop Versa3 output 5 (DIFF2) from assigned-clocks and
>    assigned-clock-rates; v5 documented the removal in the commit
>    message but left the entry in the DTS.
> v5:
>  - Document output 4 (DIFF1) in the commit message; it is needed for
>    Ethernet.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
