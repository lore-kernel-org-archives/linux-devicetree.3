Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E63F38425D
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030101; cv=none; b=PrShOb4ZT62t1q47WXCc/exmC/ivbedRI+e4eD8cuPWHkxf1WC9Q/r685HEaIP9cIufe3okq3KuC4ixktXG32j8f3JsNuO0j4xyJaHhUWvYjGlii45pj1LNxDcC97Fy0LrV4WL8WgujNYjz1An7i0upgID7qKanIakUfY7re05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030101; c=relaxed/simple;
	bh=NrNB0Z4JheJ9/gWbOMPohCnZWZtAqhLPKDbrHylRWo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9zMVcgeKd0itvyfG+Ymb33Ch6yv7CcjMz6vWKvO6CQn8OE/rrwVt9IaY82hILaQCYE4T/PYhFvYP3hSri9Ocs1gDu/e8iXFu+vzPRd/XtjSL+2NK4lNomuCZXK20230okAnIYwo5Q0378OX7KrG/OTet5JK3tW0Lj0vkQnW6pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56f660d9a51so4961762e0c.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030099; x=1777634899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTjTO3Vp0zB9Wc0GJptJYSFqlnWOG96HJNT3Sm1YIxY=;
        b=WkdnT7d8eZrOuMAYDhLrqBk/DOVROWkpqDoMYL89srDFjmpqSGxdEaswgWByVVDpTK
         4X8IpUK8ncIWw8qczlwCvQAEQGj3/WkEQH+jda4BNB4kvbq7wNNle0g+jqaCm5j+RIZz
         SN2wb5EM6PCpUuiPZv+eS75m7JJe2ya7b8yuozUNclN6+wv0tYuY7c9MVnDlsh37KVy8
         sovuLwSf6MNZXtklnlm2wha6ysxzmdE2f7+qrx7TvaOnT6ghgiKxjE8WP1pDkrz3HpEY
         XTqlJ3Qsfhxb+659Vl4kSimz4qUvWKYgGta3azhpgV2Nl4608njseq9PR5GzzYmdy6nS
         9YQw==
X-Forwarded-Encrypted: i=1; AFNElJ/AiI0hK88QNKgF/Ifujc/5qSXARoeAdntnyw6CivEI/TioqDpK13x5ouT71/50twPdSI4J/5ga5sLC@vger.kernel.org
X-Gm-Message-State: AOJu0YwkaQgEf26E6Qb39Hrfz6fu3yr7/D9GCNzGvWnuEnCsq27soe89
	hyCU1j7BWYQOHwPYP0ZmOqmOWZQdfy+/8BudPigfZedLZeZIbPlXieulj4kP88xzIkk=
X-Gm-Gg: AeBDietZNHXrak70FVYGA81bCcXxtaWMPy9LnqkprCkxzeNmthftp1N+rXWUk2Na4UB
	x8qDyl0bo9DLXBOcs5ljh3Wj84Hy2pad63ugRWtQZguhObUuLKnVHx7xtEaK8K7Yx18XK8krG5N
	9KxrXZhEyQjKahBy4dEJOhx4OVfmB8wRJjQNqRU2Vh5ceysyRqDTu991SbbvwJRDgKtmnjxKKud
	N2681zAsqaOuJ/z3gzMU0vuf6/HKVU3AkusH+X0Krp6EeH2NOz1FbYvgT3oNYGe1fph1g3qZ5Jm
	l+dEGKV9sbtpiPnnjg3JSHw5e5NnHHfbB5jTpTBHZEPAZx1C2jsmlp7rPX6ndZ/46oAOG4FVPts
	jZyF+WbppBoRbcRa7kcR78c9FPZqF3BV45zvtORIq0myUJoJxn4Ohro3xItprdm8rWwZRsce25D
	c9rZzcAWit4L3HKhZMwbthcbkJh/q7ZE7HGtLqb4F+T3RyltJaw4rml1UVg9C7m1gp+6azjvE=
X-Received: by 2002:a05:6122:2888:b0:56d:439d:d055 with SMTP id 71dfb90a1353d-56fa585ecf0mr17605648e0c.4.1777030099534;
        Fri, 24 Apr 2026 04:28:19 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93253aesm13114846e0c.14.2026.04.24.04.28.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:28:19 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-605a3cff8d0so4654219137.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Iz4dJYTEJZdPfRdQob7r9uaMDA2/pQIUvt7ueBzEQa/X9sbArQfhIE8amDsQIFf1OfTw6U2J3rLHd@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:60a:cd0e:5cee with SMTP id
 ada2fe7eead31-616f4f84fdamr16386481137.12.1777030099174; Fri, 24 Apr 2026
 04:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <7hcxzqr4qi.fsf@baylibre.com>
In-Reply-To: <7hcxzqr4qi.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 13:28:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
X-Gm-Features: AQROBzBE70P7irgYnQUYx63AIUadZqGfMGlPrac0wi4EECHihh00jV8ht_DYoMI
Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
To: Kevin Hilman <khilman@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kevin,

On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> >
> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
> > SoC/board combination that implements the ARM System Control and
> > Management Interface (SCMI).
> >
> > This means Linux can no longer perform various system operations (e.g.
> > clock, power domain, and reset control) by accessing the hardware
> > directly.  Instead, these operations are abstracted according to various
> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> > firmware running on a System Control Processor (SCP).
> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
> >   1. Core clocks and module clocks,
> >   2. Module resets,
> >   3. Power domains,
>
> I'm very curious how power domain hierarchy is described on this SoC,
> because one more issue to add to your list is that hierarchy cannot be
> described for power domains in SCMI.

So far I had no need for such a description. AFAIK, this is handled
inside the SCMI firmware, which does know the hierarchy.  Hence the
firmware can power up a domain when any of its children is powered up,
and power it down when the last of its children is powered down?

I think the clue lies in having a PSCI top-level domain, cfr. what
you wrote in [1]:

   "But... how do I describe the relationship of this hierarchy? In
    particular, when the SCMI-controlled PDs are actually subdomains of a
    top-level, non-SCMI PD."

Or am I missing something?

So far I have used only a few devices on R-Car X5H, and e.g. the
serial ports are in the always-on domain.  I did experiment with
a dummy UFS driver, as UFS is inside a real power domain, and that
seemed to work fine.

[1] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
