Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8552F7F1B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236107; cv=none; b=es/ebRFqljpzd8sH/OlN7LIohw4bSkhFkQ9UEIyIr/IPkdmT3eydr1x82wfLBq/j/2qS7VGWIu+HGCt83Ax704bk+L62GtYkmoVbCRFEzjbRmATM5KOj1GUYu3ZMsyCFe2+DEZnBIS7VknsCgnWSZxlfdt1g53wXgnMfBx4quSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236107; c=relaxed/simple;
	bh=vgfeiR53zUTqL9wCEjuNbQgZ56wPbSXK33ZlwgtxoP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmu3wsTWJrXyU4nErv4xgKrx/CmiyOsOHR4JqP2Rn0wZBt1kVc91yeNrn9b/oufCmDBnd3XeLZCoBKhQdBMMzKB+OYSFrMiQ8zJz2Kc7XMnix9D38GQHxaaD30OMbT4n8IbK9ctR/odGFJz/yLcMGT69NeZZNQO4vUJRRRJ5jlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-807bf286000so1863517b3.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236105; x=1782840905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Muh/OMSDZ663MN4xoOU6DnOJThUhytQ4BDNNdsQmXS0=;
        b=Zav0OL6egGO1x837FJHFYHGPS/JWENPU4Jep7624stk4uX3VTVVgXsbR6FNgARlX6D
         /OkT8orXsLNLsCqaGpNIajZttTFObhrAfeG/pTYGFKpWbyF0Q0i1DWcjTYdyoEckZr/C
         O+wzgY4GmG0dfZGKtnJvKrIEIUXGlYucX2QQcIPA3ZM0TWyY4UOsHvNCT8vxPEh8LKrC
         azjLYCCvBbfMidXqDvztksDM/kRQC0MjSR1hwMUzNT2TINMA4vZ6db6m3TxEQbyY4zPr
         cqe3/dGsvy40JXGNvjLPfqBy1Xe+JzZK7bo1RB1qo3Na3FY7YrvKOgOk2OSuq9AgzspL
         MSsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4CaViINem+sXq7rXYzEiq3Rg5TjcRPoCx+f3HaxTiko968Fl5qAebgu5knMl3fs06n1F63+bijko6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YkY4SW+ibBuCafa1+BW767+CJoY4NZMVUZHNHchmJqesDM6n
	RCFwskLG5eHBXeXa5o9OuQVMoxoA1MLk/0lUbSYULpHiCV5h0lPVc97CEDVHA+dI
X-Gm-Gg: AfdE7cmbWvkDCOpZQt9uWH3PfD9BKadFpcPOCRU0zpCGJnJu0F1EQclkE/xzSr+s3pu
	hv2eXNDI21iZPJXTAC96+Ya7BzPq41BM/5BYUHN3eJ3ZWpsqHzM59Lz0Y6Pg3LBwQwYHgiIn2PK
	KIgQlU7MXtUiCOWO909cYC5zr9gUh7yU+2fbfDWc87JyH4Z2pOR14yD2GpVB9LvU2dwoXELvATw
	xASHvyxiLHXw1ps7tcX5Vd2Y0NN5ivr3jWUJiIa5FnFahfs3nE0TtmZsiAWvQvz7Qt+84ju3x+o
	Z22JhvH4x/JOP0rwQMpaZe8tVK7mTYy7VmpJozC1dxU5RXWgoCCxU+gfNHeUQPEvuxVwotC0gV+
	4CwzerNliaVbDKVlBquPicUYvsAib13Z7E9k/VCLuMNynT+qKOIdAPFIJka8dB40mciDd5YYUWi
	HMCeJfgbiyOQin9QXv4eN7jhfYWgDIgfR2sYyHGE2IBupM9f84wZ1rmKFghqaF4JdN
X-Received: by 2002:a05:690c:e3f1:b0:7b3:edc7:9b97 with SMTP id 00721157ae682-8012d9f7c3cmr232068067b3.0.1782236100219;
        Tue, 23 Jun 2026 10:35:00 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-802601bcba8sm48334857b3.38.2026.06.23.10.34.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:34:59 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8051ad12d23so2109627b3.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:34:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoBRV5gtABZkMnFymtwSYXJrCM9Hebta+yp21uZUxK+pWC10TwAfIgSJN6/Mwowipcquv/6nWasqan3@vger.kernel.org
X-Received: by 2002:a05:6102:dcd:b0:6c5:d55d:c091 with SMTP id
 ada2fe7eead31-72a1f0afecdmr13056221137.14.1782235646896; Tue, 23 Jun 2026
 10:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2026 19:27:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjvjckPSBtqvWy_WHZZL08KeNo1xeL7jaTG+5rKyWiTQ@mail.gmail.com>
X-Gm-Features: AVVi8CettBHPDtUTsCGKpp8vAn8Psn3jekUVojmzhnZ0gc3_U3cHxNpDSHwB5q0
Message-ID: <CAMuHMdVjvjckPSBtqvWy_WHZZL08KeNo1xeL7jaTG+5rKyWiTQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
To: Biju <biju.das.au@gmail.com>
Cc: Alex Helms <alexander.helms.jy@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 at 18:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
