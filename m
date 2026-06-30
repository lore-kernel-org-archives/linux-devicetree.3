Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589143E0227
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843074; cv=none; b=QIVFVSHN/Pb5mVSti4Pf9f4NvA0AwmBfU/di2Gv552BLvdChWTaKnaxubxoLJVheJUCuOVv3XvAAIzPBxiB04hGKj88SSucmFydC7VHgaj7abHZd1rouSwW7vDdAd2cHUlhb3Xxnc9E5YPNkw/NPisYmpH5Vl9lEgndj1J1pjyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843074; c=relaxed/simple;
	bh=OYJNr+fvg0ooEirPKzpg45GmiwT9K/fc8PU+rAViuKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6GH+oZ3w+zQqjO2MDIVFq2b43h2J8f6aH3IaW6yJB8fx/V5Pfv2IY4lsHRFr5yDtxAz7pkx17Xb1TcDM0eY9se8Eyj0QohFcoliU2OfcEuk+nPUzyTo05JI9ntbu0gN83LM0oXSZPbj5p6U6D0fUQIAJOLOTVu7eShfYKX7wOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a15ca0d761so2196528eaf.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843072; x=1783447872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCVJ3/YfnMGwAtAU15rL0FQBriNX8zfFDwNu+BCGAtk=;
        b=XK5YNnZ4OJVWzq4fAcEH+7wjzq8Zme3iSGxRZegENI70kJrxJKPhdgiBD0BAEGKIq0
         tg2kJHr6KhPT81lm65343Y2jZhKGF+xVAUClIIe50hc9dDZlqC8x6o+SBUumD8/QWUrb
         Gb2BjlpfJSMeh+cqoR7YHl6lKeEbxCL0gdoIU/fMp8EqGsQHXZuAxeEakMfQQ19UE+v3
         iUeXMrRz7H0eb6xBP7unY8S2UZr0OrKaE+gEitKl8n2DPCQGXvpRYhgfMnpCxl/Q7Hno
         IycxUFjHIXK9btXxyzBu4Am4d2evrP5oIJL9iwPeYzFXk+mJJRJiBKAiXS04hLvNYBVF
         ad5A==
X-Forwarded-Encrypted: i=1; AFNElJ+j3EbKCzCLl+B5SGutNxmDE8Gb279DbQyv8TGoLwBJA9ewwr9W/HtEUXaON1VqMGopwXTXaw0bjpQb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4jZCi6NEEOMdhO8aXuJgQqcwoHx4ZcOxOKAlHPSYIZaWPyMc
	uMKsEqX8ViXj0eXGsDz+hfJCWvTKAjDgHXWQT1gGPvFtNDxUuCWjFOQUcbgwlZ5M4/A=
X-Gm-Gg: AfdE7clr+ZGaDal+PR556VS3C1Upj7clwG3SXhCNS2g5K+g8KhcNNY8WGlnJxOU12YP
	voYAP/Lybu/m8MybiLEGaNkugVa1y+sSxUwPL/6UPn1d3vY6q8RYEO9LfQBNYribJItWYFMYoId
	aMeH4Fsp8s6loIwPlle/zWCE9xAVcK4LRn1FpVzVPZJtP2E/V+KBv14fowR07r6dq6zCN9+TUMH
	odgFOuEPHeE8vU58VriE0F2zGPDUhrWVeukrA3SwYDdMWPOGAkLgjAg4sIAK6u1lJx3BtwLVOMN
	zQWqVCa+snOVagaFIFpVy/fLwjX1p0pzrcTRkKrgQTh+MGOjmzt1jGJp/xQtCsRSx3o2FaxTjC+
	OIuc8G6oYrMDxnKJvBHWXd/f1OsRWzTSMr6DozTcp29mQT7fBj3Sst8QFFXPm0NPDDxrPKaUhUQ
	YgGAAwdtqcnQLwR2Tl+mz2e4rNwyxuwwUDf+SM5mJuoeHGv0VaKg==
X-Received: by 2002:a05:6820:1ca3:b0:6a1:50eb:2115 with SMTP id 006d021491bc7-6a18933a0b9mr3253547eaf.57.1782843072327;
        Tue, 30 Jun 2026 11:11:12 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebf89825sm2910497a34.3.2026.06.30.11.11.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:11:12 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a0e55e82d0so2826622eaf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Ut2Vua5bv62AkeMQ8UPBPEDfj+mUFgOXM/M40Yrl8TEXyXccUEmGvro9Y5hY4zIiKhDnz7Y176yJp@vger.kernel.org
X-Received: by 2002:a05:6102:5805:b0:738:472f:2ca9 with SMTP id
 ada2fe7eead31-73a369ec1bcmr2473065137.7.1782842696311; Tue, 30 Jun 2026
 11:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 20:04:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
X-Gm-Features: AVVi8CcCGeVbbcW5z0757KT0rVC9sZPZEWMHF1Z1kDBEh7vVAiL0IbidDTttqgc
Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek, Shimoda-san,

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
>
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
>
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
>
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>         return rcar;
>  }
>
> +static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
> +{
> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +       struct device_node *msi_node = NULL;
> +       struct device *dev = dw->dev;
> +       struct resource res;
> +       u64 addr;
> +       int ret;
> +
> +       /*
> +        * Either the "msi-parent" or the "msi-map" phandle needs to exist
> +        * to obtain the MSI node.
> +        */
> +       of_msi_xlate(dev, &msi_node, 0);
> +       if (!msi_node)
> +               return -ENODEV;

This is not backwards-compatible with existing DTBs.
I noticed because PCIe is broken on Gray Hawk Single with R-Car V4M
after this series.  Indeed, "[PATCH v2 4/4] arm64: dts: renesas:
r8a779g0: Add GICv3 ITS and update PCIe nodes" only covers R-Car V4H,
but not R-Car S4-8 and R-Car V4M.

> +
> +       /* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
> +       if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
> +               return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
> +
> +       /* Derive GITS_TRANSLATER address from GICv3 */
> +       ret = of_address_to_resource(msi_node, 0, &res);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
> +
> +       addr = res.start + GITS_TRANSLATER;
> +       if (addr >= SZ_4G)
> +               return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
> +
> +       *msi_addr = addr;
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
