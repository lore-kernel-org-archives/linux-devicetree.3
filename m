Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6823AE187
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456267; cv=none; b=VrAuqbjXHKABE4qghJQl6zL5H8IcF9MmXsrN7H0YQ9Y01sFKq0EKvXff43o/VFFaS9X/iUy9Xg3Yb/M0Db4u1CPsGAbwMCHhttUkZxx7KeJDgaWpikCOBAvpSi6BgsJiOoumEfhdMwguYH4Sx1+qBXMInI+KbiRqsQo69nnDSP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456267; c=relaxed/simple;
	bh=5jJ4w8wnIzSsklB+C2cv7wJkPFCPFGJMxCqrgKm3mQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIgKB+pAkwC6zOj85Isu6EIA2DFI9aH1rmZ4HSZqy2FxvEqPr9IhiryuT3DSSC/V7LZNn448G7n61M0VD2Gbed528Mxuvr22vbXEjG+aO3fUAQ9bn3702+9ZYTeaUm9OjrOCXZ0ap8CW35SrMPBn7Rnl6ZkhrgqJckSG+hO7sAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so1263353566b.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456264; x=1780061064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GDvKPT9BVyh92cXGfrSByV+to8ygxr9SCCX7AQDOOY=;
        b=CTSIuayZebEyzqaIG2U1ctdWcsdGxFWj7ubvcSyjMYya54xnmLLli8sqWf7Q/bpobG
         SOUrKh5wBFOvA1cqMiHUi4WQ1z+5WwYmPY5NWKajFGcLEthpvkZeii8Wop1BTuQ5tLXd
         tvGOaTjD7CBo9K/Rcfdeei+S322+3hYQASxmHao/XLHsmFQVUhZevcI7zFoDoInrRPwm
         coz7sD26DNp6PUAK5wd5SN1X7M+NlxVbk1k+gRZ5Rd4LETa9cCcaPdv/eI/IKx8XwyFe
         wyyYibgrMtCXemZ24Y0KDq+5xuwNGi0w4E6pXTOsTtxlZeg85yHBANbzuruWTnzzoGAt
         L9yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yeh7nELExFE2a6b2CdZLyzd7kOYXI99cQLg++T4F066NVD2nLuzfnzIcRd/UV6jd7Mp8w+5exD7rw@vger.kernel.org
X-Gm-Message-State: AOJu0YxjuN+YxW9gKwdSMb3Irh7sflyOF5+Bv6AgCdZ7MbKPo1/jXlBr
	l5xTMWt45xktHzP4qdrx5cZwe0VkGLb8czy+oLieOVUmSD5b9fmf2WGSLBYsNmw/XbI=
X-Gm-Gg: Acq92OFo7Dm8bB/nyzbHgay+e6i7Xoieu8fRFCGHKBp0ORUjdcBvNF761hiISLi0as3
	VcvpiYjJepDo/LUDuWCSyV7MJQMxrs0e8Hvjx7ZjsK/IdP0zNnnVJKtCMejPV/7eWgHzbl7M+N7
	Ojil5KN1A7m0qlZ5Cbfsdgcb+dfGp31ZgG8L4Vkvxcj+pABJu3AC5Nm32R6mkecztavP1LGNAu2
	enLBfaWoJijyzGl4/YbYhETC1qlV/anWoYtVlMJyj4nq7xJyFKRO4pyLMXx0aQ6QX91ihI50zTi
	RbsxD970xvESUkvnhSvJureQUCQGTHbV3u7lyoRczLjwQMJwSu6kfGhvi27MfqVP4cAhVvQ3mmQ
	KhqN7lJ2vnzjHU0yVaNFqIhyiDRELU0LkVrN2tGqLIc/KJlQXuTkpB2osMArLk9cw3a+cBmWPUq
	TeInyCGUgZ0f7hocblQbM7C+cCD6T+jAm1y9eWwMT0AJBWfPdK4EY84sjl9KX3RZM63Chnddw=
X-Received: by 2002:a17:907:760b:b0:bd4:3df7:3791 with SMTP id a640c23a62f3a-bdd2503ba69mr163497266b.14.1779456264061;
        Fri, 22 May 2026 06:24:24 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1e984sm662958a12.14.2026.05.22.06.24.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:24:22 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-687d82dd690so185032a12.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:24:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+N+1AIVGmQfDM+IICjLgOJsBUT1xoQ02kC64clcxx3OuUjaNLn/3QAF8JPE0S87+8/mW/HffVbRFSW@vger.kernel.org
X-Received: by 2002:a05:6402:40d4:b0:67b:7d11:758e with SMTP id
 4fb4d7f45d1cf-6889c44d02bmr1805319a12.11.1779456261967; Fri, 22 May 2026
 06:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:24:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsopE_aeQb25wa-UGbAegObAmuAsjR3KhyE6tqkJX2rQ@mail.gmail.com>
X-Gm-Features: AVHnY4KDNA7entSIpywZdqDZOTEKyZkKaLYsaeA_apHbUNOL0nn5iX7Rgbyd_YU
Message-ID: <CAMuHMdWsopE_aeQb25wa-UGbAegObAmuAsjR3KhyE6tqkJX2rQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: white-hawk: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on my White Hawk, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
