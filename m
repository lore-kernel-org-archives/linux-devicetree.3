Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABCF3A0E88
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857195; cv=none; b=ohpEvp3LVGSnuuAn4GAhHpCMZ3filZV2hKXkHNqedAxgYSyjGwKH8eM/FZP/K/vEhoSCofcSNaQHB6v8VOvF0XjSsgvqitVE0r9FP1eykEh9mhRgckmQQtVM2VgqBtpIRPAio/577HHtTJSPfwvwVOFcft2YdWSOgk1Qfq1fLuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857195; c=relaxed/simple;
	bh=DaAQfNMDqfA4SiBqN/u9osdm8oWxv6NACh882Mgt+no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+MQ3Ktd4ZYdIYh0ljf0JMY2etiRzXfKbNlxNJvoQ2J4b+QkLPRYKuO7TNpEnVDTtCOChtIlF/E/NRHmj3/rh1ttf/T3IovODZd+ek6aMffaJvEN3U1n7QiZz1Szt8xD17IxLgUI+eu9u9vHbAn8H/3sIIi3h03ETnmNoGrT4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97e986f1996so1017087241.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857193; x=1789461993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jpscs7JaPB6a7DSYaibBo7ovev0XT0EFpj0jxoPpShE=;
        b=bkXdsPyHEiN5vhk3Ei5oqDR0iSh4xGBtuw520D5DqE0f6Z16/1qyIAyd03QNo31pKI
         R4koWDA0HJ8xa67lsYtiebsZ7ZyLADzAwbNjUoNA8Zx0bxynZvcy3Dt8XpS9XnWscMQb
         z7UGQnB1sX0zbPIdrAt66evrOWSXVXBmF5ZcYYy/9zMzoB9wbYn+ZkWSTLDmnjhFGBem
         lx0oi5e2D3vlxcfpZHuOXQJrPjcqFSDnTCu8x34hBRp69gbSQbHcyGib5Cetk0G4pdbZ
         MlRz7DasRwr3wfm38VccUVIwG8gSuFhOJuienc6EsH4a3gu+DxoY8b5HofI3vgG3qESS
         k9kA==
X-Forwarded-Encrypted: i=1; AKwUvBzvECbJnsktP9dSpd78gXaxAr+gij/fXn2ePjqak98/NunD7ohJItE1Ef++Jd3b6HMyduDyvDhttsWm@vger.kernel.org
X-Gm-Message-State: AFuF++kF80GzACQ2X7FvsJNhcYnhK1RyyPTeodjLMMeJ0eQrernR2/6e
	0jfnqJYfuVbktf155UK/1/A5sdnLKFwEUKq2fpXDz9ddTMCJEtyIfBMVJ8A1ioOV
X-Gm-Gg: AYBFou17TM3dNtSVLVM7LaE1ZtR7ZF0Bg1QU9L+de377B/e07ezPQouoUG/sGci6OvT
	Gl1VW7e1XJuKAqcekYni6J9ymdxKV7Y8d0WAIutJ43JvRfXCdMzTq1+NLoUy0mYZb3K/yW2UV32
	8IBwc8ipTlAzEz67RCCQSFaG0AtLooyzXBthhHeAunkyfZ2JBEy7E013TtQEeNLoG8rl0rxKylf
	40YqsMkVFeISFlxWYBTsY6XEHts6eXe13P14TqXwX2Z5bVLGGbDYBARu/QVsGObaYL+oVz++xmA
	pLPhJofPa1Mt4KBJsqhJLzsNTZtOE80Xv34L/W3fErSgdF5fsyT1FeB0Dn+pvxogzk4cBXRq1rD
	oOU0g0ztPB1VN2uUqaAMUQmCzzxQrA30nwwlIaRBTv3XoT6IflMYm1L0qGvdeOVsx/1KHfB4rXR
	umACUCGNq3GN4CKLFLgsO/L3VS7kLWWVlDvxkW/gQwBPgjW9wTZclSz7pEnCFSQiUxE6i9o92Ij
	X5UE6w/+fBxylsQUco2Qyj8Vg==
X-Received: by 2002:a05:6102:6b01:b0:785:35cb:e64a with SMTP id ada2fe7eead31-78a4a6d43efmr9468104137.3.1788857193224;
        Tue, 08 Sep 2026 01:46:33 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm7826494241.10.2026.09.08.01.46.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-966eabad303so979065241.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCdNws3ngnlTz0eeElSIa1tI5+Ka/+fFXjSFl4tuIzx5yPCT/vk0LvRMtIsJLWKRDN+01ShIlbX2W6@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-78a4aa3506cmr8542865137.11.1788857192323; Tue, 08 Sep 2026
 01:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
X-Gm-Features: AcwNN1U6U5lTYgv4OCUonWRRw758LHZnUmo8hmQI7dJ9Temn454yHA3PWD6OCBM
Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.

I missed before that "msi-map" is not actually added?

>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -809,6 +809,7 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>;
>                         reset-names = "pwr";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its>;
>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

> @@ -2148,11 +2150,22 @@ ipmmu_mm: iommu@eefc0000 {
>                 gic: interrupt-controller@f1000000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> -                       #address-cells = <0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
>                         interrupt-controller;
>                         reg = <0x0 0xf1000000 0 0x20000>,
>                               <0x0 0xf1060000 0 0x110000>;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                       dma-noncoherent;
> +
> +                       ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
> +
> +                       its: msi-controller@40000 {
> +                               compatible = "arm,gic-v3-its";
> +                               reg = <0x0 0x40000 0x0 0x20000>;
> +                               dma-noncoherent;
> +                               msi-controller;

Likewise, make dtbs_check: "'#msi-cells' is a required property"
And it must be <1>, so msi-parent above is wrong, too?

> +                       };
>                 };
>
>                 gpu: gpu@fd000000 {

I have already queued this in renesas-devel as commit 7fe73a3a3f2c3718
("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes"),
but I can still amend it.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
