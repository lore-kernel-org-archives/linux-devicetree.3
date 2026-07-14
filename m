Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6183F210B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015656; cv=none; b=KPGpx3mQtsJ1h2pko5EfbHRNak5+huduh/YPpmzdvxz0ISY3FTGKtSOCgfOccGOqn76USuFhUCbvIbT28K2rUL4b8W8VXZIYeHUPoHK+AoxqJEpHLdH0me6E8jFdk3G/KK5Yv+uU6GCTC6Z7DmnWea/jCYL2YDAJyB3Mm9m1b0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015656; c=relaxed/simple;
	bh=THxugq6t+PDXlFGTMulIef3VfnF0pxoHGHT4/GfoOOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k00K+3BqdhcMrR6xu01U9uurt/J1HgkC9aV6Pkr96R0kZgUqFRFuUNVIHUw+AgCx2mSzGQhAOzbkbtzYpkpS0R5j3JJ/6dpHMcB/VRPjQayZ7B/gZ4a4nSSD76AlL9NvXwrIG75oZUMyBrIj8SRpp7H38n8Z7RNk/jupoqMHs48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso341355241.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784015654; x=1784620454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BgRx/9A4mxiDsRVEDvyTiz/IgVDal/aTcWb8tkjr7jw=;
        b=YVfmYepY7FhTScB2fQhRscFfzFezoFCZ68DryWwo8spqF0PCCQIUDsSkrCf3jmki2c
         YM9rqbTgFjEsinBBT6EfmwAvJTWlDSTP6dBU5gw0go1OfHHabMAFv7AYUzFevQh6nvKM
         5JnTMSe9seQIuZ0+b4m+OZ1gdC3smpe4aAsBD41TRdsCsPUcfgbAEu1kShs7R9fGEmLj
         UJWd+irali+AhXsXPW5nKBxMkKSSDOaEOZeQR7WW5zQWt5cMNL0EICcR7COLmEtTDHf5
         dHVu6uT95kbv481HbQLuK9KEtAaKeggp8tXHdUzaC4fBZ0iXiLl0DIm4oqv/sg0H5D6a
         aMBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ctHEuX4B7t7nRY1ld1ew/1AoC+CUaItqGUXxOX7yvlmCes91bpf1DJQgzQq/1N0r7apBIJxNvDtk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi+2eEvIFzSEt5G/m5Yv1DWM9ASpwKW5lrBOciJPHHR6mtT4Jh
	8/SgVZ+bH9a9f6nEZoiKbEDRtRZb+np1liybCG7Dj98PCFkeCrAdliqCef5Uu1tAZRY=
X-Gm-Gg: AfdE7cmDQFfRwG9Qa7LobFw3TRd0mISHege+C6k8EuPMlLM2/f6V4L7dk22Z+mC8yw0
	SNqD/ww2ReFLaV8jrAQaDGQHPDpQnDY38te6EVt6VWNZjDACVRDQ1Bw56M0KFjgIgIwcdDhAVcf
	DPScvl/J9rHYvmjwOek1LklLKe8m5yweDhCsxlKXGCDjN95toYvatu5JmkDad8HdZ5gAZvSw6PP
	Hq1GfKQ1vuEsO1XHQAos+d7ZDGc8XJYs31Bpj8gZhHFLjgJapumhVvQHQEQLfrUf/H4NZPsLAVP
	T6rKEZauLkCYg+5m7yt5T12LmNnESrw3+50oksnUULa9ABxQDb+u21W/1SKNunXgkDe4TGyJCSa
	dCldBhtRdIU1g9hft/HVbFjxvEF6RlAWKgme0v4Kjq3zLhx/uVC7PG/eGv68hOBFyjURcC2l50e
	CYP5ijlN70ahtAAUZrnji6iw9MeKfyTpHbSH1gbRJ8Zt2Ks2HiPBz1Vg==
X-Received: by 2002:a05:6102:3e07:b0:744:a77a:a342 with SMTP id ada2fe7eead31-74533dffa73mr8033664137.22.1784015654357;
        Tue, 14 Jul 2026 00:54:14 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a90d4fsm10381169137.5.2026.07.14.00.54.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:54:13 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bf959b820cso375407e0c.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrC4ADcYX0quBz2WyBbuex1I3sMw1yCLtiwjK2r5V3JbhcpxGASO0v+yt9eLAdoug+UT8YG22gJOkbb@vger.kernel.org
X-Received: by 2002:a05:6122:83f2:b0:5bd:ecad:8f9c with SMTP id
 71dfb90a1353d-5bfbf172175mr7212570e0c.6.1784015653328; Tue, 14 Jul 2026
 00:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713175400.GA1258926@bhelgaas> <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
In-Reply-To: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:54:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
X-Gm-Features: AUfX_mzs8lWdOW-5Jg3BgK8EeDUWxqE-PpZFEV2XQkTM46SmNqGtsnsDEZCmeKI
Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> >> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> >>> On Thu, 09 Jul 2026 21:10:03 +0100,
> >>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> >>>>
> >>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> >>>> copy the one GITS_TRANSLATER register offset macro directly into
> >>>> the driver.  This repairs the ability to build the driver on
> >>>> non-ARM non-GIC targets the way it was possible until now, which
> >>>> retains good build test coverage.
> >> ...
> >
> >> So in the end, it is either this patch or limit the build to
> >> arm/arm64 . At least this patch still allows building this driver
> >> with more compilers on the various build bots, so I would opt for
> >> this patch here.
> >
> > I like the build coverage, but duplicating the #define doesn't really
> > seem good to me.  It makes readability worse because cscope/tags now
> > sees two definitions without an obvious reason.
>
> I can rename the macro, or ... sigh ... I can reduce the driver to build

That would obfuscate the code?

> only on ARM/ARM64. Which one do you prefer ?

Just add the dependency for compile-testing, just like
PCIE_IPROC_PLATFORM does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
