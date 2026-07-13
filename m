Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07382282F2A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958452; cv=none; b=hMcNP1mNQStnkyHbhF6zWX/2uL+FiszzUwcf3rUndMA/pVT/kf4QhCns5auqDFIIYt3kSBgxTGrw/Uw4d+rpYPp3MFRwoRNKLD8eAbQNW+Qi1AzOI4vRdAxl0p5W3tve/eks54QU5QKC5R0HlkbUHAHlXO+oq824op2nTo+QzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958452; c=relaxed/simple;
	bh=SsOh1enJoELJHzfIclkKXerzvf46Ll/w8xxgwM0UOnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REbCmmHHfkkLCbgN2SXsAQHYDMRH5BMHHZ2rrEp2fiRfZHjbMmIleFppaXULGF+cx8YtNuIF+j56aX8aPyEhhJkSgkjSW+ko9aoCF8hQFPRKJf6Af5UTgRfVpIuEGbt7pe3YeSDOGIcW3IHkY+N38/jbnMOVVElxjzeWzSoYKtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfdd59df9bso13345e0c.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958450; x=1784563250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=674QbDTihSeDJzkwbUpD4t11m/0pIrH8HDq4q33BUPk=;
        b=o6dnI1diC/iwnJEd2SFw1G7VmyGET+ia/6dLWXE22lBXuWfO+g33n837AjV0jj+x1S
         3zhLn/hXsrOy7YP6qfNC/6Khvjxigzpu3WNhW44eaSSK65lO6oROfdVkA9E2V0V1jVHY
         RfII+7StsXkHF/LLNt6IsvKs2Xz1IvATv/kN+fj3Zkh5+7M6hl3w7nePOLS4+NjgL5xu
         UWuEkprD5n9TNFUtv2goKqWcFcP8ht00mnNtAeWoegRHqEPHdJLeJXY9lOEquKlNcRgh
         nX9wAx6LMYtGV9YYuwisTgsDWUmo3lWoi/cyGQQvg6fvNqW5XWL1rBmBqg24ZGQfwjAz
         zgeA==
X-Forwarded-Encrypted: i=1; AHgh+RpnesY1kcEk2+AcGP0NSDZaGt5h0H+HLp323NjTIRicgNavFp9VuS0pZG47DUwRBTeXJMHpj3djt7jB@vger.kernel.org
X-Gm-Message-State: AOJu0YxIa10CstPOla7QsQFJtn7YReV+WzdEJ4Q+223zKXVKiSv2HAXS
	gMMFbatj/B2lHm3GiRHCFXrVBFMIpyOQIpZjHtrPsVDduXqIZSKtHeGTe46RRSymgrY=
X-Gm-Gg: AfdE7ckNciLm4LJ3ts5IgkP7U6YLH+ojHXkX2ERQwup3wXL8HWhFTXph1MwSFWDridB
	2qostLrwSqQyendLSyYMZgZFXvvoKEGhVmx9dYmwUKghMmna5DxCvDtJOy4XQkiSJDfOPd5DH0N
	Opocsn1bUCbLmG0LTpXNWAV6HLt2zgK2yMcjx61fQgYBoieWHmN19uUOy4jyGlTer9jgM0ejNwz
	V6iZWtx9HHO4EW78dzoUwzgVfrUvLba2FBM6TYWPIdSpDUzYCh0bRJrskFe0MkTbCm910fcMRJo
	7J1eNtHjq2gASMoFIUWNFjnvQ6lvdFK76bqQCo9n1YAU42j8pmBsjKcsdsjiWZykSXZ7bMA1tRm
	gGkgl/3gnhfdR1Qryu5a3v2d2QV6W7U7pywDd4xIiVkZQPXpE+/GXNTksk5GK90iLzcwf9Lxze/
	WdkybpJCFiLtAWvdsYrsEo9I5TMvy2RO/yVJu/fPl8iy13FfY5eX1pTA==
X-Received: by 2002:a05:6123:5c2:20b0:5bb:e5dd:d93d with SMTP id 71dfb90a1353d-5bfa42f0ae1mr5536508e0c.0.1783958449852;
        Mon, 13 Jul 2026 09:00:49 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm10009517e0c.8.2026.07.13.09.00.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:00:48 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso12814e0c.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RphHNMutUVeuxLbniSIPzhqaSz+beBSPjMNpRkv4evwjPYMHacBBlSjFZajqam4TmtBwvHO8TX+qOBZ@vger.kernel.org
X-Received: by 2002:a05:6122:6310:b0:5bd:a2dd:60ee with SMTP id
 71dfb90a1353d-5bfa470c003mr6470720e0c.3.1783958447155; Mon, 13 Jul 2026
 09:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 18:00:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
X-Gm-Features: AUfX_myKEIDnT9gmvoSHxK3o8Be_bh5PlIka-qGq00orZWkHqkcXT9vOA0tXJpw
Message-ID: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> This series adds support for the System Controller (SYSC) blocks found on
> the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-power
> management and access control functions.
>
> Hardware Architecture & Dependency Challenges:
> ----------------------------------------------
> The SYSC in these SoCs is a multi-functional block responsible for:
>     - Clock & Reset Control
>     - Low Power Management
>     - Clock Monitor (CLMA)
>     - Access Control
>
> A key architectural detail is that these SYSC blocks are physically located
> within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Reset)
> address space. While the CPG/MSSR driver is already implemented and
> functional for these SoCs, the integration of SYSC adds a layer of
> complexity due to a cyclic dependency:
>     - SYSC requires CPG: The system controller needs a clock to operate.
>     - CPG requires SYSC: Access control registers within the SYSC contain
>       bits necessary to control the PLLs managed by the CPG.
>
> If implemented as a completely separate top-level system controller node, we
> would face a cyclic dependency between the CPG and SYSC drivers during the
> boot process.
>
> Proposed Implementation
> ----------------------------
> To resolve this, the SYSC blocks are represented as child nodes of the
> CPG/MSSR controller in the device tree. The SYSC regmap is registered
> directly against the CPG device node. This hierarchy correctly models the
> hardware address space while allowing the drivers to share resources
> without deadlock.
>
> I am sending this as an RFC specifically to get feedback on the
> implementation of the SYSC as child nodes of the CPG to resolve the
> dependency cycle.

Personally, I am not a big fan of subnodes.  I assume you are using
subnodes because you can register only a single regmap per syscon node?
Would it be possible to just extend the existing clock-controller
node with two more reg entries, and expose them through a single
combined regmap?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
