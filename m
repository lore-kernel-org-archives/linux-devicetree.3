Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE51433E81
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783117094; cv=pass; b=gwXF0p3O8wQgPiBS8fMLus5yNWf5uKnFzQldGi2Y+H49sl2CtwwmliWjnRyWRRHjr6ENhJnVvO67eEeQ56AaHZarsxVf3HaXR6Azk+e3mVlR4ht0A1iKvSwKYWIjbjC4W2XpYgGu+TC7rMfi1qPSXfb7pc+mVdmN7c7V3T9uLTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783117094; c=relaxed/simple;
	bh=mjwuQ3N0OVI+o56jIG+twM3faktMneyLA7TDmjbcSuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyqecrEu9jA8d/zG1qkr+2doohPzixv7gsDU4nnnkk2r143By4a2slCbfoPY85NvozGqhhnnrgsC9MxST67P7BAU5+BqWyJxVE1cN/Wq3pSMYH1anTcnRbQ6LzIfAYpwaZ/XEn2BGJW3YhmDl88AHM3qQyA6E6JZvdy2iX6KBkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJiLhY7U; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJiLhY7U"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1425587a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 15:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783117091; cv=none;
        d=google.com; s=arc-20260327;
        b=kKImh+6ZHZ9Uz1G3rYapELcrmgdSPND3UWFJEIysFyJwvM+nOK1T25yxppkgjXSri8
         KX/C6jjAADHzJPj+T7rwPSzjij0xySfX/y/ueyaRpNfV7UDlvj/2O/ihIphWfilaJJGT
         4QHatQ4Winfhfa85aSlp5W4GnnJa5EybRrFQeC1Ancz6bvf9/MihOxi3A/3BwHjE2KA1
         HgH5cEx+cGETPT3c576qQBnpAqWptvzWRTfLm9FUev+J4zAkPc3/lxCoIoKXCI+cGc0f
         el/3BksvHTxS7vqbJVniAkFvNYIn4gezhEq2xtSjZ3MBaASMp4BCIrBjKaFAe1W/0yC/
         L4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xHnip0cuaNSCAQMubL1LiIso9IuG6Ch3oOSD+V/3cA=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=jBTZQvA1vt2B5hZEpp3KhDDKGOZfsvILS6HcTkaIzOqFh4jqeDbeLXA190wOvztnr3
         EZItX+Xk1iJCAcoV37bcnJtUUf5Qu0n2aHXBTBylQofQX/QGNZfPi0in/BQEewR+zln8
         iXAI46fTikgDHZ6h8YUJateAJe+M/2QPOnCRUlqBy2irdxnzKwkfOof7iGlT1vdR9Up5
         QN22yfKtiSjuPOZER9cAWN49Mu278Zo6vxrDeuGwRk4tgWTJhXXffy2KZ8wrBkqfAJkx
         d44ryt8o/nS5G8By7fFfFsSzXCpK8lTkc7ZTk16KsmWP9tRHYupuD/hIDNOVVWJ7/gKN
         Snjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783117091; x=1783721891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xHnip0cuaNSCAQMubL1LiIso9IuG6Ch3oOSD+V/3cA=;
        b=tJiLhY7UROJgkT39RCbPd6kU9+H7N/Nrk76TKXyQvt1Oqu0i8RikB48bsOy1PMLZI7
         9ab1WCztSvNFk/eTUvDtUPXNtceop0D5diU5640YYu4TYeRSXkfbjQkSDAI8R7UCXuAx
         PK/J7khdPHO2e5js8q+Jr8v6JxW5uGhZi8aVAqRgP3DJHzKNQqOl/qqa+ZMcDA1TNVz+
         Y9a7Ky6bGulce7BhkAULppKzLQRDJMnN/DuWk7QbiKOD7TvjvKmLHoD8IPQxv3eHu9ZW
         1Vr1xX26HJgq7wAqc6YaIRMkKpAjiR7otUlYAV6upiUE6weKNpqiyj9RTAkKKK9T9n2e
         NIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783117091; x=1783721891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xHnip0cuaNSCAQMubL1LiIso9IuG6Ch3oOSD+V/3cA=;
        b=glE1FamTGgo/BXHzjrmZAXpM/37O01nsXyHmOqv1WreTzx+aPdXdgFGnsaclGYQXtA
         w1WYV6gKP2YgwmESmSTkxBvHV8kCiARY849wO1FNnkewlXhurpgsTt94iZRxX/j1oTQY
         sY5A6B/dlBM+nPOv9kABMnEXQtuC+RrRvCMa5fp+HP9vDHtEqzexHNvrFhdbyzsZZeRK
         YiBteG8N1Kv9e/Arrb0VtDgS/ViTt/furCHJJQf39dbFsa1NfHB3DgK9RAHsradZsqyD
         vPTyJGuRzfg9tOJcjvsy60EGsR7bN2PnXlR/upGm0vPLJgtmZaLqMCrATQhD0bpjihhc
         GcOw==
X-Gm-Message-State: AOJu0Yx/pEtW7+LJqSTx/zQG+HJCC1bgfKps6VMdaWVFO5Hhqv2I1Q6l
	Kvv5WZAPuX7L49uL8CVXoBWvUcB4j/aWmDYgrAVEQ66+LD158mATIQrHfaL8rwaqZ909gNyLO99
	D35CzWeGao3sQj440NsHRuEuRJoIAW/lfSAIu
X-Gm-Gg: AfdE7ckMm6HMi0ugpIqD80D1mj+rX5RRT2kLydSPTJNcS1PKH1BfL8x6ki8i5loa7jr
	sj+k06OxJ8MyQyYc+cAVFNHOTukJ2GdzV//SG9G9SgSCUBl50NVzvId9N6oCfS59q+DnQ2l4GnS
	2MgTlNb+S/lpQUAF9+OWyly8rUJefE/XiiS9IWOqJ5Jk155QXhN+1ruC8AhHNAUvPsT1PLzjdel
	wSvv06HYeilhGbT29QVhA33l0+4/k1Be4qKdctDUNhpVthh5kPGE9zik/YiF2/SZpDCNta4KI+l
	FqPJsaaKT7JKlUVTC/cCaUCyrdmiT0WCeBqOoG0KusSevY6zKgVWLliG+tQ1oXlOwpraGcGsneB
	VScyd9s0zB0CJIwZ67VWbyg6ZgTU=
X-Received: by 2002:a05:6402:4014:b0:697:e8d9:6bcd with SMTP id
 4fb4d7f45d1cf-69a1a3ad585mr390450a12.28.1783117091262; Fri, 03 Jul 2026
 15:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
In-Reply-To: <20260628232714.BD9581F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 3 Jul 2026 15:17:59 -0700
X-Gm-Features: AVVi8CevX4VTz70uK7iuU8f26JnXOHvs7xu2YZvdFO5ofn9wxQlXZIu9UGROBOA
Message-ID: <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 4:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Removing the PCI memory ranges from the parent `axi@18000000` bu=
s breaks outbound PCIe memory mapping because the child `pcie` nodes can no=
 longer translate their addresses to CPU physical addresses.
> --
>
> commit 4f061464281d4964ce46dab60d36a09328f14862
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
>
> This commit removes extra AXI bus ranges that overlap with DRAM on
> BCM5301X/BCM470X SoCs. The intention is to restore the original
> single-entry mapping and fix PCIe routing issues.
>
> > diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts=
/broadcom/bcm-ns.dtsi
> > index 392a257136696..a1062245e5a01 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> > +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> > @@ -95,10 +95,7 @@ L2: cache-controller@22000 {
> >       axi@18000000 {
> >               compatible =3D "brcm,bus-axi";
> >               reg =3D <0x18000000 0x1000>;
> > -             ranges =3D <0x00000000 0x18000000 0x00100000>,
> > -                      <0x08000000 0x08000000 0x08000000>,
> > -                      <0x20000000 0x20000000 0x08000000>,
> > -                      <0x28000000 0x28000000 0x08000000>;
> > +             ranges =3D <0x00000000 0x18000000 0x00100000>;
>
> [Severity: High]
> Does removing these PCI memory ranges from the parent axi@18000000 bus br=
eak
> outbound PCIe memory mapping?
>
> During system boot, when the PCI core calls
> devm_of_pci_get_host_bridge_resources() to parse the pcie child node's ra=
nges
> property, it translates the PCI memory addresses to CPU physical addresse=
s using
> of_translate_address().
>
> Since the pcie nodes are children of the axi@18000000 bus, the translatio=
n
> must pass through the parent's ranges property. Without the mappings for
> 0x08000000, 0x20000000, and 0x28000000, the translation fails.
>
> This would cause the PCI core to drop these memory windows, resulting in
> pci_assign_unassigned_root_bus_resources() failing to allocate memory BAR=
s,
> and endpoint drivers failing at pci_enable_device_mem().
Different AI says:

The review's analysis is wrong because it assumes PCI MMIO windows at
these addresses must translate successfully to be usable. Here's why
the commit actually fixes things:
The problem was that the translation succeeded.
On BCM5301X, 0x08000000, 0x20000000, and 0x28000000 are DRAM
addresses, not PCIe MMIO space. The old AXI bus ranges created 1:1
mappings for these addresses, so of_translate_address() returned them
as-is. The PCI core registered valid-looking resources pointing at
DRAM =E2=80=94 MMIO accesses went to memory instead of the PCI bus, corrupt=
ing
data.
With need_ob_cfg =3D false (no brcm,pcie-ob in bcm-ns.dtsi),
iproc_pcie_map_ranges() is never called. The bootloader has already
configured the PCIe controller's outbound windows correctly. By
removing the extra AXI bus ranges, of_translate_address() fails, those
bogus resources are skipped (the OF_BAD_ADDR check at
drivers/pci/of.c:377), and the kernel stops registering DRAM addresses
as PCI MMIO windows. The hardware continues working with its
pre-configured outbound windows.
So the review's objection at https://lore.kernel.org/all/... is
incorrect =E2=80=94 the translation was producing wrong resources, and the =
fix
is to stop producing them.
>
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628231156.12=
54012-1-rosenp@gmail.com?part=3D1
