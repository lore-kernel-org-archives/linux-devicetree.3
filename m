Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837254E8E07
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534072; cv=none; b=R0xiHqjGEfCEAhtVgiFsrxNblHGTaTAiGCcbM3LUBdEDNmy307fscZDNrYchGZYn873abUSKCQtMBKff39kE+gHaS9xpnL+4SYwPGEhoO5n1/sqf8JdyWY3imNDAU5Yn9PnUZXHvyQHNNxEI1Gc6z4o+AAHyYP1Y4GvOn3zfTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534072; c=relaxed/simple;
	bh=90rHthjt/yGjs8ruJ73s4ajxZDBI6dnx8TaoyliYuBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui0y9P5IXw23YrmFyc7+JoONye4vEWClJfJmSS+2oItbH3PaGoE2l1tQbGXr1vzFY366uITf95s72l9QuzHWWpV+SHPWVblepC4Eun0A0w4DJCuqvrNBCE7Lj9WngPU/Njq2Wdd6Z4NgeucRtyQFkPxd9BtMZbkz24wgldgmcfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so732603241.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534067; x=1789138867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hlQwu8m1wQp2ta11biuk/tG/NCV6kSdttoO7IfG7LVw=;
        b=b1IpPfJ9nBrJ8oBrCkP0atPuwFevk1WkO3xPZV6xwzMkycH+eOEK8iiI3Zacf6F+c8
         yf0PU25QRnE2LsUCUrNXP1aRFL1fU5Eycjkv0h1Q/MRuk6De2rEkbR0xogrh1nxX03be
         VDrc0cAaDfeb517AjmufYD5rks0kin7Jo+r1w/bSKw0BujK6i0lNpnP2Q9H0/c3QXbuv
         1iLULr0IpFpUdize86HmtBzXRW1VxtzF3TgIqlX3A7toMJwDsFWgTWerob+9S8plJzBG
         ZlxV8/1LrjBz84NwwUO+v/M9mH4ne2G1dCwZJYiggzk3HBIOa8mLemnpDG3p4lcnziHL
         HNOw==
X-Forwarded-Encrypted: i=1; AKwUvByfi6KDSCIh996ftxMQ/jzIjWG1uc8scuX9cC40xYkxfq8hhoqQq7InxJ9DH/zSPfFDgFba4gaeMEKY@vger.kernel.org
X-Gm-Message-State: AFuF++lvt/iIqJcgUyIMpHn7QSJOogcXasOxSRNQd44Yc7569NoAASqQ
	6TpUfGY1GDY9DgOiBoBkxAW9e38Ful+Eab34OoBaazPOgHVU1M4BgZMv4z/3lreD
X-Gm-Gg: AYBFou33ca1F7zvflAs0wI6Ihhg1DRFfV3z8p37gvhrLYJT/91Yb2VC+CWlC4XknQqn
	xHyIeGXA86ssR4KCwKCohOxxwaxWjg+JE1Q23p0DrK3S+gUAzDf2xnvqn5iMtH+PpH5j8BKnlrC
	3el0b6S6P7nhlhdgnA1ZcNiwgm7tUG8RXaVibHzu/tpqnbLwXR0A5Ty6XuPFnSIgubPpeyrOFVW
	8WdtruNOFpq9TTD4doKSVoXYiJq5ZzF9kE3JooOHgtUivFDBWalZec5duIdsUaOA2PWvZ7waHY+
	AbhsvXIg+8vmmcy/ceL+jaMkLexREucFBVYN5/x4xG4W4pw3llIoN7MVv7+EiSCOCznGciPA7AF
	vwnYqZg4pZJPJi4DU3+MZyPJYVZkpWQaFBM0ihc0rcIy7kG89LD1UKR1BO7xWqPVOnY7G/DJa7n
	zV3LGAVpMekvni3bfAI5PIppCFh1YjzjEkfxP8sCE9OvWWGXRVTYAR5ZAvXSfnXmQCAlF9CJ2QN
	3OiqCjMwfXUbCbNK/Mx4FKwJw==
X-Received: by 2002:a05:6102:5e87:b0:77f:7df:ddd2 with SMTP id ada2fe7eead31-78a4a823596mr2646224137.1.1788534066443;
        Fri, 04 Sep 2026 08:01:06 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9809e56231fsm452412241.2.2026.09.04.08.01.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:01:05 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so732521241.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytx7J1L1M6ev4gI4vKnsQMkjsirYquA3MtfDtC3Oi9ivpRJGXQ5IhNbanzSk8TeZQhu5Qhi3uHY6Nz@vger.kernel.org
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id
 ada2fe7eead31-78a4a8b86c6mr2573960137.6.1788534062781; Fri, 04 Sep 2026
 08:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
X-Gm-Features: AcwNN1We_3fExHm_K1_nUZIVYeTkuFzPE8r5pnBYIyrcPLEEf_cM8LoiXO9Ji0A
Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: renesas: Identify RZ/G2M v3.0 SoC
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support to identify the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC.
> The RZ/G2M v3.0 is assigned the same Product ID Number in the Product
> Register as the Renesas RZ/G2M v1.3 (a.k.a. R8A774A1), so use the same
> SoC data.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
