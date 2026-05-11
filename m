Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07A36607F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778476556; cv=pass; b=QKJOerVgknq454CGnQzcFx91odzb+gjUMm+3nBqge5fQZH0k0DrCqLPZC6yrOJFZETAiprgebcqQoa1qjyDDsSWfK2AMTijnTsQ/ZKLD8Y76phe9biTq8AABPMoSucbax3DBQwRpZFlqs/H6Vi/C/bN3QyXgfhnfG6x7PAUUY0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778476556; c=relaxed/simple;
	bh=SD8bwUDdBddm0zHH51qwfp9UPjfJkW2MFdQRs4LmgX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRwMu2iS2v3SRpm0lgoN0rVyDgPPp5i4pkRhFEElcWPsxK8kRMgR1UB4hc6n2JmQ2h3OUIzyrAyGI/RTE8x4TToxhgk3o3c0cOKNV1Yp1IYqDNEmcd6ZIgwA36Gni2CgxGjCT66nW+rNNh9zGS/900P7RUD6fvE3mcWvkWyd3II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WaD8s0V2; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WaD8s0V2"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a88db610ccso4445543e87.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 22:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778476552; cv=none;
        d=google.com; s=arc-20240605;
        b=bfAATAvL3I+TegvPAHpf8S+PuC8dS8DksneNO8iFvenwMPFnqzNuOPoyTJexKyEQrP
         smd3k98WtEnAiiU8uz/oAGMhzl5Q0PIt23aXtmJCjjm2VLUwndngAnAjJG8CE5INlgFa
         vyaQ/KR1moYo2aFtcdNc0azWebiPyBdSpOaTk/uoKubbOtKApB3dQisemRGuAE+Yr9ra
         rSSqHi8+LWrJyH8zywHTjinhHMkL9fI+q54w3Hg5Tx01JTgoeFKTUCLz7MFugTnjG285
         yXbUehFSCRR9vMUmDro5XehAxC7KrxjT6koUeSVIEmyweWCpWScNaJMSbotYLdD63yGg
         MWYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=;
        fh=SidEs+bMgO1Cutc7O3v7qOAcY/8snHKiaAiUP3eTjG4=;
        b=OjprZQNp1eTOUkM1hq1I3+hidsMUXonQ+m9w7BGDGwFTtumc01v8EWwlU7NjzcgzG5
         anTF9qXbAWqYgv6cx3Cflra1k0BEI91njsdP0W4wo/WFRs10P2vZSkRlMSoWVA/hVoFN
         SUXN26iwQ2dnBk3WpBUA1CaB/HX2N4khyf6wPcVS/nsDwSq+iKcIgtKYWWdOCzQUtYg7
         M2lyEpP9yC9LumgdZLL643ISkegOYWTqw307p242mG1lg8dVJWreOr1L2nMN3uM6CbSB
         Ur5ShxOPwHUawdoCJNWmnzI2VmpCPlcutpUI0MaUuyY5Jk43G38CrBsNP+W18cW/iNID
         SLlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778476552; x=1779081352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=;
        b=WaD8s0V23hKcnzdcNXedzIKS7Nz2nzsw5M5P0BQHdn9kHIsGEtUOrpxW+Hm+8RXZxD
         nvUHrR381lrKoz8/sxKJ+QNPv1IVpZ0dwgpiNvtf7z0QkjebLgslRvV/h2m+48l9UWpn
         9tAl9AKImll1c67xccFzGhvTXYjb0D3w6NjZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778476552; x=1779081352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=;
        b=qGGqpMxcem8wdhSci1Jtbeo3GCYoWVg4NkbngPWKr8Kf5nfJjJBeoqcwiv+AnEkyvs
         WixNJOaql2XuTliDlqOBQNebmcb0K7dSSRNhjQmV6Qhv729ST5tIROPcy7Ocqz4s/1rK
         2HpJhd81GG+WuEUj6eI941wiHgRkwTBVsApTboWsovrhSFQhBLsUXRrBPY7VNcEldJsC
         Xniz7B2xCAoZs6OJ9M227AGhyNQaNr3tNPBH/Fo5ABVSil6BXFmUWK1RoWYebSCc6jJs
         4YgHTdZHqxoTlukEUFwwV13WV3dBkHbVh8FbKugE3wef0pW2ZFSaJIY7LCpXSWQ4Ghme
         2PuQ==
X-Forwarded-Encrypted: i=1; AFNElJ//VdvEIsxYSk+o1zWfybAq7g2Mc3XhLoqOYNqDpBBIkMsbGjLo5O4KF9bps4MQtl//lgVMIYHSEKKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20u1WYZ6M2GJ4dy2mEoVsK3FXjEOsigDBVGfWv3hEah7O4wAn
	MsGhB2JFmz3hFxsYArKjqDa0A+4fCRIx25BdlxiC9BKRVwjF8r8HFt6MRcVob1pZ6KlCNdyPT0w
	j4ikneH5oALOyLcHkjrvN6YCxGgllQn0my+JxLlzi
X-Gm-Gg: Acq92OHAVBtoyUUtyl/zfP6ccEERDJVRgt6SRD5YPvOicgdfrDn5SG0lhDTm2fmcH+V
	BvTpzxBxSbQidR3PmvGc7K/mwFk7TIzUNWJ5DnXI17lAx2yADCKY+uGzkA7wKOHLzjpLaf17+gv
	vItjCTYh1dlYAQcuOMpF7sq0e/+tu3+7BVKgdYO+v1OyDHFX7zW36Y6iZwgRitnKtrlwDPgflVj
	716Tc1eej8ASKogMczmiJRMelY2AetgSovo+VYcQlwFM6MGkaxxs0tSyyrCaqP1oJw4HjVDTr1t
	TwuWTYNeHai5+W/nSc1Q6gBuatCg9uXonQ+QxQ==
X-Received: by 2002:a05:6512:6d0:b0:5a8:74c3:5d9b with SMTP id
 2adb3069b0e04-5a8b6c5f46fmr2281211e87.0.1778476552163; Sun, 10 May 2026
 22:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <20260508175418.GA97653@bhelgaas>
In-Reply-To: <20260508175418.GA97653@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 May 2026 13:15:40 +0800
X-Gm-Features: AVHnY4LZjBv6gGSmOK6fCKQuMDYhc9G69oS06Omds3Eto3-e9S9bD2qEZifR9TI
Message-ID: <CAGXv+5GBd_RiAiJRbjE82j_fFPdhan+W2z7tx3o8HAKvsrD0zg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 1:54=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > controller memory access could be limited to a small region by the
> > firmware configuring a memory protection unit. This memory region
> > must be assigned to the PCIe controller so that the OS knows to
> > use that region. Otherwise PCIe devices would not work properly.
> >
> > Allow the memory-region property with one item pointing to a
> > restricted DMA buffer.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This patch compliments another patch that moved the memory-region from
> > the PCIe device to the PCIe controller [1].
> >
> > [1] https://lore.kernel.org/all/20260430120725.241779-1-wenst@chromium.=
org/
> >
> >  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.y=
aml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 4db700fc36ba..4a9e41d01628 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -115,6 +115,10 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description: phandle to restricted DMA buffer
>
> I guess this is similar to
> https://lore.kernel.org/linux-pci/20250716053950.199079-1-huaqian.li@siem=
ens.com/
> and uses
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/re=
served-memory/shared-dma-pool.yaml?

Correct.

> Looks like those keystone changes were never merged; I don't know what
> happened to them.  But it will be good if everybody does it the same
> way.

Not sure what you mean. "dt-bindings: PCI: ti,am65: Extend for use with
PVU" was merged as commit 57a48a2619c5. Maybe you are referring to the
last patch in that series that adds a DT overlay?

> I wish there were a simple way to grep for this restricted DMA
> concept.  Maybe there is and I just haven't found it :)

Probably just grepping for "restricted" in the PCI bindings. :|


ChenYu

> >    mediatek,pbus-csr:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      items:
> > --
> > 2.54.0.563.g4f69b47b94-goog
> >
