Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496858;
	b=KQMXasbBoO0g5RB8Da0N/rcBqxb50beTzJwzaIw15cNyBa3lwPhnDFMUDMXhus51L1FP
	 BXO59Q4Xaynp1A6p3ISNG9yE0R00Ob4O11Yml55RGTJ01VCHWYu6CADjgBjvWLBGb1Ltl
	 XP8ko2Y6Nzz8KB6JaVjN97XMmWc+LrmQ+zJpodkUcNNjkfDmS7rAbCcagK1M1RDb8jEHk
	 vrW+4YjV7JHdbjRI95KGGcBM/Kj+OhagL1VNL4EGqdNjDSVHh6l1AwLEwwZ1Sy05MaRGG
	 DZK5GfEBQINiwnyAQTHWKrCm8xhO3mU4ka33OC3+aK97A+pXZuiWSFEQBYIVVXh43MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496858;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7AH5KLYkXXpwtDoOq342gqQ4JtDTxtQFyRIk7TQMJ3k=;
	b=4rx+DUj/P3wfIS4zDu63y5NZfd9cPKYdMtOUL2Y8oTrncJdPVi10XfiJ4qji1cCgIkCl
	 1hfxOhZKSxDyvVOvWewtZBQptBewF+piGptU6NbPlMM6rWORbBJaWyHnkTqDoWMy2yRAu
	 YlqdJUu7HisIH9cX+5qyIOhBhuuB+VmHAowB32XEd2FQ3/l257bM133fVzDwZt57u26fi
	 aqr2DkJ7XkB7yvvZ9PeTIlyTdG4EG7VkwZW8Uph6iv040RXRwzbQj+CSUPtY9SrPNA0AB
	 ZnUK3WpJ7fBr8vIwDCDpab88DH/uG/ewmwiWrklskHPWU41iftLNFTCjhQKs001Fg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E2606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B32E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1162569e0c.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496856; x=1793101656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7AH5KLYkXXpwtDoOq342gqQ4JtDTxtQFyRIk7TQMJ3k=;
        b=kme6I9LVMIu0IXtR7EBKFSq4gROiomFn6wNsfBO1YI4W6FDrz1su0hCX+dJ4aRlhBC
         IA4ruwJJ1Lh5sIWd5fW47kWrWtQkBhmY9FutYBt/ClCGWKxxJo+Hgb/CyQFCuJneYkiI
         FA49AEfX9ZW7IzVBFAvPIAO4jARi8ryo9z12dQ2zJ13y9MX+kRUpYXY2IWTV/pZX7O6t
         QMJcsgeYl31OqRwlEmSoQVmWgSc1zJqGas3zyepjPIjp9ROJ5LrPmYbwoZIL/doB3oiG
         P5uXX1yqi6LPwy+PNL+y5ifyX4yM0CiyfqZalzjDfV65SRjmmKsRVJC0+C64jnMdm4KZ
         mP4g==
X-Forwarded-Encrypted: i=1; AKwUvBzsus92Kzsnn2piZtuwgQCZZFIiCxmh77ylUeA67Lnf3Q1VK9AHszuXAHdC2NscVX+hDrXGRmeQLL+F@vger.kernel.org
X-Gm-Message-State: AFq9FYJmsiEDQyfUGqQrS//81E3+PDIN4gn9+xpHyaMj30Qv2y/a+y6I
	KOtrpgR7noHYGGDpUgX/z+gCGq0jBoRnTYiChObZIgln3MtGHXPUAkwMLjyiEITc2wI=
X-Gm-Gg: AYBFou1GGmC7i3602HmHxca1XmrmhVKlC9YXCPH7oKUBiI721ddVyOt1PSdoLaOu1N2
	PkGZNGL9P9N6YLZUt10Y1IRolkD1dF8TTezrMFcBMiW6bIaqjvyHluriThZxIhq+nGqPI6ED0S4
	thNKgCZmHu1Twl61fsmaC0EABxI4WBF3MMXbsL169E8BVRS3ISGk/bq51iqAKUAsvWGa8Ch3PLv
	7Txn0HnFMyPNSdwLm3kl9TPa7eEK3AsOloRrxK0SNXrN7vKz7ryiLnuHvQLxdjqriUKk9l+MKhR
	3+Is00/hndhGeT5y/tReAl4AS3JsYkiFQYHE6WjrZOrM0ekVtU71hsfmV2Q7SEPpSmcy3KYjd6a
	nnLhFJT6QUo/4G2fxNsEFSUOcIm4u0lHlb23Knbph4NcWhmTi51OGTWNQ/lAw6lJUQaowVLai4e
	KX7caALMAumpfPa3Pf99vTDTOwQhv0Uv2dPr3/v95gTBo8LQ8cs98RLWqvDwk90wqyDL1lF7u0n
	MGpjQctFvTb4GiNV5nIELYkbViYmljzxJco
X-Received: by 2002:a05:6122:f93:b0:5c9:a60b:e5d6 with SMTP id 71dfb90a1353d-5eaaa66d373mr3306501e0c.16.1792496856538;
        Tue, 20 Oct 2026 04:47:36 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b128725sm12829608e0c.0.2026.10.20.04.47.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:47:35 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98301b325c4so782087241.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:47:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhDgDk0Cr3t06+eiV2ZPlB78z+pVyx6o6SSQazVyD1u2YMkQRMiHRgAQGQbw/QHugojzXfrKU/iiqc@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:2c29:54ef with SMTP id
 ada2fe7eead31-7cc36a1fdd5mr2439750137.19.1792496853877; Tue, 20 Oct 2026
 04:47:33 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-11-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-11-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 13:47:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2wTNjaT3HacNiAAwSNU9MtvXqdFg6uSk-pZUBh+9tXQ@mail.gmail.com>
X-Gm-Features: AclHuK-oSwXELoK3ftCuQEMht83trZrqGJxwnNQHzvwYJozTnmt64-x3G5ZnW4o
Message-ID: <CAMuHMdV2wTNjaT3HacNiAAwSNU9MtvXqdFg6uSk-pZUBh+9tXQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/17] PCI: dwc: Free the MSI domain after the host
 .deinit() callback
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> dw_pcie_host_deinit() frees the iMSI-RX domain before calling the host
> .deinit() callback. For a core-owned parent interrupt,
> dw_pcie_free_msi() removes the chained handler right before the domain.
> A glue driver that owns the parent interrupt and demultiplexes the MSIs
> itself through dw_handle_msi_irq() can only stop its handler in
> .deinit(), after the domain is gone, so a late interrupt can still
> dispatch into the freed domain.
>
> Remove the domain after .deinit(), in dw_pcie_host_deinit() and in the
> dw_pcie_host_init() unwind. Keep removing the chained handlers of
> core-owned interrupts before .deinit(), which powers the controller
> down. Clear pp->irq_domain when the domain is removed so the unwind can

FTR, this is now pp->msi_irq_domain since commit 8f0b8cc3a655f56b
("PCI: dwc: Rename pp->irq_domain to pp->msi_irq_domain") in pci/next.

> tell whether it exists.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
