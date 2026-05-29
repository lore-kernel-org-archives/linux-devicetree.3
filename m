Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45923AE182
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046392; cv=none; b=XbqLxZYiCNAOr9bkNPlkCNNpbvt3D+u14uAcwlXfaJpq69H3x+DbPZw035zk2eYEROUOYsWWyjNyvXt6qcH8OSeexWwlRlTfoDy3R/4ot+ENfj4By01mfa+MZrMxAN1iHrdxbmV/C7a/EVGrFoQINkr/kvV/DHjz4IY0vVANNSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046392; c=relaxed/simple;
	bh=oV2CAuJqeXrPOy57q4RphHZJTqsoxAZQc2f8difrQ+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsWGvcT4GWCvw/pjxEaHH3mimDtis8SW6xGFcvPfAvDLYQpv8cG0p7MjOo3w+Cb27LcZ8VJRtDnbWX8PqIRauWZzuLB6JmhDYUyavrchqCh/rmJS1Sj7rKxcxSdh+GK1u8PBMyhAF73hmPSbYvepzqh7vd3hS8rxXv7nwdxJg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6312b8f8e47so4614533137.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046390; x=1780651190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PINeLKm3kL0R1j/P7mEZaS9aKY06NtQ6TlFdhZaM4xo=;
        b=bae8StnDgN+I0LRsaiugPC9hrIXBj/JC1Dlc8NK5v8MfY0k2FRN2JpHtd6YHdyV8hx
         N+XxG4viE1CgH6JhawjPO7rghvlsQWwpLCGIrK9GWT9/rXiKL7mnm1KOYNDsLfZRhNma
         6aexl7v4V+5E3plEsWiASAFPgtpGUsTtYpn77CAt7xdsKWyQORSkycswK2gXjxGjsrmV
         mHgHs7nEHIjcy67oQnPTCR93oFe5cw6TK8inCaixWkpUM/IAlXYvV+opulk2M9eINcri
         i6BkSHL+0szFP/uMP6Y9HZM+t9GvWwRq5vC1soB7rtYpaN3bqJQe0Vgmee7VSOHoaMpa
         w1YA==
X-Forwarded-Encrypted: i=1; AFNElJ80tJpxnW1dsq27sMHtPb1Z72CHNWYzWiSmHiLg+nmBWaHLqqaGoW+H0pVqK0ib9gqdByVDUHQohWeR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu5F9qRvd95Y7dSxvi7VtDYlioETy3ZVZXMGjWkMe2cJj50tr1
	Hn8zcDPGcOM5+i+R41jizYqlKaMI/eIqp5gyxWzXTF96ZeR0vRMZ+ZbGImxz2md+bGs=
X-Gm-Gg: Acq92OFvAXrFTAhGicalTgszw2w/SPxBaUxJvT9+VK3c9wp38es98Tvb9ngRa+F+kkU
	mWP1oRQw0vQ45ieyAaOiCvv4TQLX5HWCFism9j94+ycYWo9Erj8rkr4C8J0waGRPupp30s8kxSj
	3a8zg9Azd+LwVXG3ThCQIJzQMZRxzbvFwEEUfV5UHlmMmDCMrVPu9trrq9E/TBJaj7KKHMXBieo
	CvdYxElMtgXxoNKsOObFCNirbJl04tP5HRt9R6gfRnHWRTbp5bWrbzz7p/598emAlCiNmdVw6QI
	CGxhVpEbhItLf/tfhHPmDUatddi3bTXY6wfjtRXX++S82ja7r3nwj3xIE2UBmUkHSzQliHRhrDD
	w+ccgFSIX6RJveAQAxWZdVbOcn+XBhp6d8C37AyAXsmgXaEUfBDOrQpjpS2HJsx1tqIW8BkBuk7
	33lxEmfGktMfKQA9R7e9SQY0INIEKBJj4yXkLH0KYEITenmLgJgI3bMHBv1EFBc/0VgTjNtX8=
X-Received: by 2002:a05:6102:26c5:b0:631:2cb0:bf8d with SMTP id ada2fe7eead31-6bf2d110155mr638712137.6.1780046389692;
        Fri, 29 May 2026 02:19:49 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfca34f6basm639558137.10.2026.05.29.02.19.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:19:49 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9638c832c48so751451241.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/kowPdBJMevuOKEE+FCEAiv6UctjnufqKueSZo1RDToYiawX++fTNeLfsYelTCQabvHEAshKs5GzRa@vger.kernel.org
X-Received: by 2002:a05:6102:3c9d:b0:632:29a5:bbf5 with SMTP id
 ada2fe7eead31-6bf3b0353ecmr638347137.14.1780046388749; Fri, 29 May 2026
 02:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com> <20260528070239.33352-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528070239.33352-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwboeT30Akf=bpex1b+OsmOL_4j73vZYOMZg2SZyFbcA@mail.gmail.com>
X-Gm-Features: AVHnY4L5q4t4ywhQ8g4z2FVSpxaYhp1qbbGIJUT0XRLeBom7yaAr_DPkj2kig0o
Message-ID: <CAMuHMdUwboeT30Akf=bpex1b+OsmOL_4j73vZYOMZg2SZyFbcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 I2C{2,3} devices
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
> setting SW SYS.2 to OFF position.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag.

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
