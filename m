Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032047AF6E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580243; cv=none; b=tHMY3M+8o8J2yS/9/qJ/MKfXFSLZiEh5L2GSJ1qq3mWsuFctUmB5zBY5x0AnOLtsEBAAUPn0U6044wiN/ZF9NKqqhOE8zkdTG7bcMKJQynIsFuNrFTDRPJfdltrGlZHQMalMkWbMccFnk0wGJZmhntpk6QYuF52i7Idx0TK3fXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580243; c=relaxed/simple;
	bh=UgIbMUc6XbhuclV25YQJD4R3U81Nf51u8wUxbex7Fwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhgF8IXE0jDLTbpVlrZnvRfZ0Bp+4u55n4eLE6zHVov8p1wg08lkMUq68sM9TrpemFYCB/ESme/SsxiIF9HG+iB1B8PZ2bAje8HsmmtBqqPlDFZhnjXljt0EOJkMPr6sFrF5+HCxKgYeWDlFjamW7VC7Gjh+mo50ddrlOkBcptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6cfdce656bfso248906137.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580241; x=1781185041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbc9H6Sodchbzo9eJFs/pRevavF6zt3cn3QmUq2TwY4=;
        b=bUwmZfP5fZRzN33eh5QA1p5/9ExXJQshhGmwhykG/lyEX+4v8dbRrFEy7yQEwSOYtD
         Ye3YDlXwZuDbkZq3tJBKSz3YhX6OmBkZwjVMNMsvaOTpQjIKzjPDTtKFKskvC1hMtPqj
         Yu7Q586TH5PV6VZl3TeyjT8Uc56irJ1S4lvFeKls6DdE+TiiBFPI934M7HJUzEyj3J2K
         nIu9E2hMpTu90VIank9jMZ1Lcx7j85qfKfUkBxIQCCUZQ5SN+hG2SiKZeEIuTRoASz26
         0Y+PfcoN4ymM9Cf/v3STKwYxpoyCNzOVGJBckMpOpyKKHbXVPHnXtY9mrmabc8LxbKL0
         es0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Ea66lsYr5pJkkxjsVck/cQcVQ1cqxGiQm//fL9J0oOyVJAssixS4dgKRuXBfjOlHQ/HKxnKhOQPPu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8s10ODezQY4zCvKYRbjr9z8+Z6zJfWoBeoNhH8t5LqK5nROhJ
	3dZFgf+IeC2p+T6SN2Fa7Dta1m4+0BPey5mO6R35mfxXdYo8boGk8ReIri83Vc94VRo=
X-Gm-Gg: Acq92OHVOGuLQslpF4OLSb86b/mw4TNmXop7sr2OhUJ6IqNtwrVS1YyrLLiKqGXIFmI
	oXjISbrmfADH5YRj8XAjbw8PLq+5CaQPouLa9bFJJZxFb9HagpGV+ZW4hgWaSTnx00ZiOwr8tFj
	xoZmnJdqbPGsM52dnGNqwGco/N80ITUCLxUI+mzyO6pqzXyiBZw8oQMvHGTSyeiNlI3bRsvCbF5
	Nb1KTwIIMGEbCauTSM5Pso5NdRpb+Wiv9fMfGAHfwr9G8Y6td/vwuCMrrMzzRdCD4aYPOpoGBLj
	rbqpt1JWYjgwbFU0f7KoB7326536vsdoJdIcIqa+WXSuQL/yyYC2qw7jOHWuOg/CtFEkwr0ThXD
	LMRs3QRbE7wXv0VUcVFtZ6HGw8nhM5KQSjfKbNZDek7b0C977WVl/XiVf83L8ELMt8InTZhAWad
	7hTv+l2dn/oZ8076R73mfwpGimwt3T0RdKA+sjmIyh5V6AUJKNXpDPTIi820TRm8DJt7hdXbc=
X-Received: by 2002:a05:6102:4b07:b0:6cf:37fe:2cb with SMTP id ada2fe7eead31-6ec4b36f743mr3806815137.27.1780580236448;
        Thu, 04 Jun 2026 06:37:16 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413d48caesm4804487241.0.2026.06.04.06.37.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:37:16 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso232354241.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:37:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9dyHOdTECM5TNm371wcNyz1HGd80Jz0kyscOnkZe/qj04KS+1AYvop2Mo1vohaD4abnrZwilOif5I6@vger.kernel.org
X-Received: by 2002:a05:6102:5812:b0:6d4:ba3e:bf97 with SMTP id
 ada2fe7eead31-6ec2a7e2ef7mr4555261137.4.1780580230878; Thu, 04 Jun 2026
 06:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:36:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8p4ms+enMYSzOU1nceh_w7UfwvTuLwk+5OUOhfej_jQ@mail.gmail.com>
X-Gm-Features: AVVi8CfjLgrPCeJLjfD6K3yH-jwvL8Dw6l53_F7pY4rGyGZ55Qm2c4WwhIt32_Y
Message-ID: <CAMuHMdU8p4ms+enMYSzOU1nceh_w7UfwvTuLwk+5OUOhfej_jQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 15:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Configure the drive strength, slew rate, and Schmitt trigger settings for
> the sci0 pin group shared by the RZ/T2H and RZ/N2H EVK boards.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
