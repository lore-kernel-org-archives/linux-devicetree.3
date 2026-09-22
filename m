Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99644F5E01
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066869; cv=none; b=AvX+vPfpxg5syFJoBYqlE8dLZ4Prmo8uq/m0eADTe9nBxk3AH4cq3c4Hq1CRK66EqECO6S+NXjZXJFFCI8etJWxFHNkvqlxGc5HzSF4fgkv8GsOW5wLapS86JMmAf5FiSjFWgLETt4ns1tFV767VK17wBO9ejYwR3va95k2EywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066869; c=relaxed/simple;
	bh=SKxdp95432XDvzCPjjgWzrtl8ftbBUukhI2StzJWGQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0CNCkJMvvZJpCsITLskLVzkF4E64szuYk0ZBHgaUKWASNhwlRG6mM21N95DpsQKcKpItiyXH4wuCa55VwbYaybBP5UP3vYrsJ5G2YaEO2fN8xURgE3B4dk4RGdcp5vla5Q2NbZdw9mSgqvtPgTwfLVSHPLFO8pIScwHv8dSwMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c83397eeeeso2496912e0c.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066866; x=1790671666;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GWIDjRua9lHrNbDmVCrugzijNwD0WxzTJmDg4pdKZIc=;
        b=LGzrHbf8CEikGbk/GMkOmQGVf0Kn6P5eND1SUH1bEGtwSpcLSysQxvV1WSrkWdclCI
         LEuMh7YEjbVL4/efLMAEfjzdR0SYF67uJ6fhKPhhycsBMoiAveROUyEhnm76cgx6Z6oO
         ePdAp9RBSK2oRONRplsxmkw1hHB0HZu+hQ1Fyb107SpvLNNZJajKLEDU4UZEvWewAOfs
         O9xzvujRY4cCDLHVxkR2jpJ/KJ7LrqWDp+uoA/EziYAPFEWQakySuGj8aBJhBm1lNLkH
         oNSc51D3rxsa64uaS9uR6fPkRTKO2nXdIibgZLFD32W8F9cM1cNXs43oeB8DeSEDW8sv
         iAag==
X-Forwarded-Encrypted: i=1; AKwUvByKiHExiaCtxIniLRmgux5N33a/5nY2kNiWu7ef2WWG5ceODoJzgs35ZkUWHYpJLipM994VSb9EtE9d@vger.kernel.org
X-Gm-Message-State: AFuF++nkXdhfttvmxFrT5Zx38r2r3L7s8k9bSL72T4AeRXEsoiXXeMea
	e9Of3OUSX+xpzKG1g0kGFMrscidAV44ZpJqSSKjiqVW4cj7GkDVA4hv5BVvdOrYalLs=
X-Gm-Gg: AYBFou2lFbuT+KMMP9ijIS13d+dJZrFyaYWjCd2A8FtJXSOSVt6CQILywqi/jlkuKg7
	/3Crb+McGYlQXbFQRmbYmhZepQg7Z5tQ+G5eUQnIIRG8En1lXXEwYFK3AX/ATeWzGMeQ62DwQ0Q
	+aGXHOVZcSoNrg7N5JzdcuoZyL7Q1qdkg3mXtLA7y/Nzh3mZbvaL4OJsQHDEvSI9FvPlqVaj0/X
	Uxhr6o7TvOJDY9cECeIz/dRcizrg5ijq9wHzk16aWdKZEL+lhwmJBtD+5ABQl0o+Rrg+7IqNtgi
	DzG8qivwdlfk4UHgVBcNQgKY9uliGl6OqJ4cpR7fGV7mFZvJ5hqOplTaOKeVAbxz9pMT/qLBeVD
	uOUJMdzbLmN9zclVMeOmanmu7v5Dkz56PJOW2sYN8rvGigyAN/bNhHuceeTrtfCIpJ+dz8NnpL4
	6Qc8q+01MtCAMggrtd3zXqHIQbp8nu9ell2svfn8J3KLuhqhuHGbCCPj8IrWqCPlkVfTgUhalT/
	GMZmzBHbWwSMlq/JWFU3h75QY1YtvQTLS+9uY8bOlv6xaQ=
X-Received: by 2002:a05:6122:3486:b0:5c9:a60b:e5a3 with SMTP id 71dfb90a1353d-5c9b59abe8amr8056445e0c.14.1790066865678;
        Tue, 22 Sep 2026 01:47:45 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e7d4c733sm952832e0c.13.2026.09.22.01.47.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 01:47:45 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78565b4db79so2096456137.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycZAYNIBvIO6zqUuWpLyva1dmRv9LkUoW1ajMKJYj17a6AsYX98woM/9ZtQJvRDHT/rnEthL9FPiDo@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:7a5:391c:37ac with SMTP id
 ada2fe7eead31-7a55b439f6amr7821226137.10.1790066865188; Tue, 22 Sep 2026
 01:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790065451.git.geert+renesas@glider.be> <b8f4648eb1151b75d41e561c6b2adbd9bc4c0782.1790065451.git.geert+renesas@glider.be>
 <20260922083355.B7BAF1F0089A@smtp.kernel.org>
In-Reply-To: <20260922083355.B7BAF1F0089A@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 10:47:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR_-TG_FkP36yQEhcbSOObXCqsFa7iw7gYbQB-4Go=uA@mail.gmail.com>
X-Gm-Features: AclHuK8uO17HLkbg6-xa5vAIJjSfTAzcvmAvxN4S9JnEeQEAxUBJc4dK1JH3qYo
Message-ID: <CAMuHMdVR_-TG_FkP36yQEhcbSOObXCqsFa7iw7gYbQB-4Go=uA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: renesas,sh-msiof: Add support for
 R-Car X5H
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Tue, 22 Sept 2026 at 10:33, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: weakened schema validation for older generations' dma counts
> --
>
> commit 339efeecd4721be8f1b5b945500191b6aa6436e7
> Author: Thanh Quan <thanh.quan.xn@renesas.com>
>
> dt-bindings: spi: renesas,sh-msiof: Add support for R-Car X5H
>
> Document support for Clock-Synchronized Serial Interfaces with FIFO
> (MSIOF) in the Renesas R-Car X5H (R8A78000) SoC, which is the first
> member of the R-Car Gen5 family.
>
> > diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> > index e0c7047ae8adb..41e423a42654d 100644
> > --- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> > +++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
>
> [ ... ]
>
> > @@ -100,11 +105,11 @@ properties:
> >
> >    dmas:
> >      minItems: 2
> > -    maxItems: 4
> > +    maxItems: 6
>
> [Severity: Medium]
> Does this unintentionally weaken schema validation for older generations?
>
> By relaxing the global maximum to 6, a device tree for older hardware (which
> only supports up to 4 DMAs) could now silently pass validation with an invalid
> number of DMA channels.
>
> Should this preserve maxItems: 4 globally and only override it to 6 inside an
> allOf: if-then conditional block for the new Gen5 compatible?

I wouldn't bother adding further restrictions, as these are not related
to the actual MSIOF block, but to on-SoC wiring.  DMARQ is just a single
signal going from the MSIOF block to one or more DMAC instances.
The number also differs among MSIOF instances on an SoC.

See also my similar replies for rcar-i2c and serial:
https://lore.kernel.org/all/CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com/
https://lore.kernel.org/all/CAMuHMdVgJkwkoF0-ptQ9g_8E5j1Oa8G41nBiiOfY+KF_p7XAxQ@mail.gmail.com/

Perhaps it would be a good idea to remember this?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
