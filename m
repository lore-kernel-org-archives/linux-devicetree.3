Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA74E80DC
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534221; cv=none; b=msmdI3poWUoWjSWFkyNfhlPV7+tut0tP+2iSpidmXsDR/pRKIHdWdRTKXHD4nbNrzjNPeUPLRnBnp8VKiBfFy+7lvgoK5LlvJMnp56byQl9k1q79FCdt5HGFTunzQTvMCHVryJEAk/9BXZqTftn5iNZcDpy1CM9FnApn3O8SFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534221; c=relaxed/simple;
	bh=fzOREMKstNdN+mmlGhqGbzBVxrEgv8H1fmeOK6xcw88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILAwads322QtoSQX+HDCr+oNh6IRBlf1YXD+BzYsGr5GavFw2UWiWmiBqLlLFoh9aDocHAgbQJpR/pUItVhwhnYu0j1SHXyfsvBQqrzgYew33bRTgJui+K+6fc/+mfkjp2N0TATtaWLZGxmpIKGArXzRkR7Pg00Nn+gjVAIdxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so1541023e0c.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534219; x=1789139019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FwDxiYsshE/fUWnWj2Ruj2wFFXY+QnXdoCrsnnd25AU=;
        b=iJLAigQNPcq+lOTQ7y1aVViO6eU5jZBR1VXaYAgyvtJFXSKyuuhekdeBY7vIiawLeh
         CYA/WvekXbyOsHVEzX00AX2sw2BFlq5XIo/PUy2YBqF9Z1Jbk7Y1H9NtUCD77ZFhJpIW
         f1bZe4Iwc2yX0riwH4opS/8krgiMGWNlP4msiT+XOihk9xDP6y+5EeGcSr3A2UG3J5vR
         vwOWFR7cOwvZlwbd7vcgutpq7N4YPWF0LdU4hdNYj+UKl3g8s4aBxoN9nZjjx4FNG19T
         GSw5kS+ebAvpissaEt+Szbc1FL+Vlw7TZ5LOqyt/e6gRYh/wi71+Fkd1EXOfjK5uMoq/
         W2Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwBKzcZPK1fxgik1+rXt26iUebHV3YHD6VRt9GTC37wbKN8tIYGjpPYBPWOAI+eCPVu7FFABZHdPSkh@vger.kernel.org
X-Gm-Message-State: AFuF++mD25RSMiTcfsWDhd2fhyHCREZQErf7uSqS5dzsgoOxn2JWBbvn
	aPhrkF9nao/gUqZyHc9IvgNbQC5Vefwey6CeMcUUoeKJ4ry7N78BlnUsla5O9DJ4
X-Gm-Gg: AYBFou2ao/xyzKzXewfdBPGjlSuYbydJCTOYuJ8UhtZQKKBlQ2ci/ICqytCdFSNg6uQ
	mpyGhXVUZ/2YTWQohwOO3yXx0GwhjRmR0XubPKn2JM4uYFHqkAwrGBQXyUn7wb9V3I7fmiZHNYa
	cO0kJnHIQ1w2aPaJTibqn/xE7XCOAzi2lW9G9irYsnCJW8beZU3s8O5xF3/JAEhG+KrtHloxdMw
	P9gZiZDitH3NMDHMbmrv+LdBHtYuDq5M+nXUU/ib1MLC8EUWsz04nsnDpxjE80IUslAbPR2zpfe
	Fbh4Zly7ySMCFZSYjcitrfoCcX4NzLzQD1TozhS99hj+lQfkUyBLXdsGvxqCuj5Sm7UtkxHIEsT
	LEdRSpuKuQTj1/WXsEFmUDR+f/WcoZCBoVR/GCN6N+mE7zLai5eML+74jz0/43reB7iGzQ3ItOU
	Jg1QeoqExxdPyauosJyJGD9FH0H/vSdF/GhkFxQ2qYLpusPgRaPf+yVsxWCxadui07y7DQl0ipI
	JdECHVQAg8TT9EEp9iUZkXAwwm4+eK13Abc
X-Received: by 2002:a05:6122:5317:b0:5bd:b47d:1865 with SMTP id 71dfb90a1353d-5c7dcf09076mr3635960e0c.5.1788534218649;
        Fri, 04 Sep 2026 08:03:38 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm2325276e0c.2.2026.09.04.08.03.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:03:37 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so1504856241.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:03:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7kw9rl6JBaEgL+7V/itWTTwNYeX2hY8Yr5XksNt0FTe0Z5VK6X7KNEItAcPDEcCNKNOSKG/6MHteZ@vger.kernel.org
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id
 ada2fe7eead31-78a568a7517mr457415137.5.1788534217450; Fri, 04 Sep 2026
 08:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
X-Gm-Features: AcwNN1UeX_tHY_zGLACot_ynQRVuzMQ5hoKZFPwjcrfLfwgwmaAT5NZ4wqS9wQ0
Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
Subject: Re: [PATCH 04/10] soc: renesas: Enable SYSC driver for r8a774a3
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
> Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
> so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
