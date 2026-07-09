Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B621E332916
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609446; cv=none; b=V9A3CfLkRK8N8c9g+MRhj8xFojUL3buZ50TFkWQxnkvuSZyZvIR09k2nZ2/U6qcl9w0tPXe9G1r11ZyrECWAXAsalqgqEC8kb8kabd7ZmVzup8bHCSEH6U0Hd0pV7OFBE1p2RyKqxneOq56XNCVXCP/k3bnzo92PuZF23bNr96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609446; c=relaxed/simple;
	bh=D22bs7Gp//BQpXDOkWsc6nFgskYAhYnSTHhJDh0cIUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNi28WrrOfUKXoJeDcDtBP69jppLEfi23kNGmpGnrOeLz4yTv6Z0Cc+C0EPtZ5ARROer2fAweuZh5kgOTe2A0mqrVoQkjB7dEOZ9ZhmKRGnlIqBZQihFy7+1lOQqa7SrHfQ9S/gPk3hshfST3R2hafeXfEuWbJljGxogWVIsMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso3577664a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609443; x=1784214243;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c0vL8AgSCv4ML2U2UtgOvcetG/7O+3lMpH4bSkibr9Y=;
        b=pBI18k98Zz7pAcb/DQoSFI1aN3YI9ttQeTo3SOZ5eskWkmVhtw18DAru1HsKhA8GOk
         q75MG4BW9IafkY+myXdddb6oB6If3XOQN+uaujATcEQJPukxV6xhnFjJAFBZ8On4e8tL
         gtA3FygESCBnpy+saoH6FITGwdSp7moyIJhFe7WKPvQ+U+CUbn46Rv0R1MJpfucHPJs6
         Sela5kY6JUlpxnpX6y+zRnY+m1TWtyIRBCwVxL2wXsCQsVB8/+eNUpe2Bv2+8Hc9YtE2
         R51YSp7vWUN8/6L3zbV74kwZOqdDoH+HOQW3cs6FRYIQjZTooFYBoOxajQ/7RBcL/Voq
         wOFw==
X-Forwarded-Encrypted: i=1; AHgh+RpHCgUTg+teNWKbRH/sUAViK+hK4FLrnH7wZskhSUkh6zBNX8cwopbwsYxK8P+qO7tzaZ/liiEVjB7/@vger.kernel.org
X-Gm-Message-State: AOJu0YyEML3Pz+PUDd1PydhcunohaKpaB1WInutGXwzv4RhddOZBJiG9
	xlbnxRbyHsfadk00K/SXTXh6RTYZE+dVyK83db6HY3UViTSy1/4JnghNkNYOEHWATVM=
X-Gm-Gg: AfdE7cnEd+fvhI/tbpnEqF/lUWYWb1vJJk8ARYlFR+VjH2wm6NAJpN8aqHHKz7mzi46
	Dr82hewRGcMBOboNRAEeqf2LKtpS2pO6cXy14Y7qBKjy/hBgmgs2fMSA/HYt62UWRhy7WF4nYaG
	Omcekp5i6wW5yPq+gnRZp+86bsysPx7t/Hq1fyQAo652KU0qQDy6xId1ECDbSapGEn0YVhMy6df
	K097+7ricCIdoMBcb11EbQ9I6d3Vt/uaWcVtac1yhiwk1hFu5giHI8Bod+5qExlIdAjxxr/fVDa
	9F3dSibDkosrQoYVkQNt+xvwA4bXw3z5ahe2joksA00BowGGz6RIOYcsC+uM5o8Ij6ppWxiODEk
	lx/IzAl/yacWN6jLxtb+ruIuakfuDkYmgFAfF7QU3M7qp9Arrj6Ky3fjUH3IEfLYlsaqroOhqK/
	2LjcfvM4V42xwMpC6O2n3FEuyxngJzNNYFxSTBIAmouVGkX7sRdA==
X-Received: by 2002:a05:6402:5292:b0:698:aff5:ef31 with SMTP id 4fb4d7f45d1cf-69ab4486822mr3158041a12.17.1783609442885;
        Thu, 09 Jul 2026 08:04:02 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm10873410a12.17.2026.07.09.08.03.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:04:01 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso3577376a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:03:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr17lXFMLGEDrK/rgP0F6WcGWdUamCQf6D9XmIpgcjCtvjw+2CyWd01RfbG3UaPdDc2zxpPk4KQ/x9Z@vger.kernel.org
X-Received: by 2002:a05:6402:1cc2:b0:699:728e:48c3 with SMTP id
 4fb4d7f45d1cf-69ab445e9c0mr3209549a12.9.1783609439594; Thu, 09 Jul 2026
 08:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708172849.227915-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708172849.227915-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:03:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuPH2GjmTos8cHoTJkH6N7sZs5uqPAHfT6PBFxPYZr1w@mail.gmail.com>
X-Gm-Features: AUfX_my2wAkDhVcCsKhAbEjp5BgVr1WX4DivmVuOKMgII3pJ_dksXAqoZy_HUkQ
Message-ID: <CAMuHMdUuPH2GjmTos8cHoTJkH6N7sZs5uqPAHfT6PBFxPYZr1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges
 memory space code
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 19:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G3E SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
> property to use the 64-bit prefetchable memory space code.
>
> Fixes: 1ac57c9830cb ("arm64: dts: renesas: r9a09g047: Add PCIe node")
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
