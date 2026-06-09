Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE137AA97
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780976023; cv=pass; b=YRyTjeqqASiW5xnMh65H+q/TiKJneqATVJPMBvCvnnj56R4WKTovP4U8k/Jz+q7LbeTx1iGizY0d2IBZIEwFfaVryIFNrNHdWY52Qekz1Wh7zEpkiAMVl5+n5A1xamaddzipKw5npoQj7XE8qt4znLSan/nxY08xi5K9SzwXlcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780976023; c=relaxed/simple;
	bh=6/fP80sttTz7ttlvprLcNNbhgm18y4V+UknELgO6vMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8chs/lOQnrqY+INZT7nV4VEfhqWI4W5JVTQt6ueL8FVzkEgL322Dg+MOCIh4GgREKp9RD4Qvf/U2aM0H1gPEqk18CdADhPH/vDyeeFLA9NZkoqUVP8XMEY0qA2mlAXITAtQHPdy/FlF/OFeoBhovHewhDc/TL0i/SdtrnHvGrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N+VHCwY6; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N+VHCwY6"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7dfceeaf168so47438377b3.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 20:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780976015; cv=none;
        d=google.com; s=arc-20240605;
        b=VwINIcCYN2Wi9WhTd/7XDuy7Sq7B558kovD7nWVB0+AMOJW6IhH23WSXYJ8z1Z6V7V
         uMNC+9/SdvsMweTeVUPDdfx+AJPbhf1tICzHR0F8PKaJvAgf9Ic0+12Qbw7Oz+dAid+v
         QnUYp0/Mwh7aCRMBCDp+pPJqstpi5vSohYuuDCd66upG1Im82SoWM3rlZCX04yN/JaTi
         o8bGKiR7yJuLLIh5nklbHoGME31q0anLecwes2w3vzw91t3QeTX29dN5NWDq3DkYCWAk
         bFtKAH81ylWZ3usi0vOejtjJNw6AODeaQkKmVJWvg24UqzwkAbmFY0R0Wp6QIV3rwUZG
         Mqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=;
        fh=u/FozNI6gv0/PAFboHzx6j8t5i97Jgl2R1ET1KGGmig=;
        b=F7kS23rVM5wmQNUZyKZQxFpagn+VF1NCJglkbxL2Up3bRlSE0x7bZ0dXty1duIfeWe
         Zq2RUDVNgUgfBGXnCEctKJ+NuxdSfwEOj3algMcljuPD+I0g8PVxARMCLxjtbLwkFaMW
         gRkPVUvtgQDbf5dcOmDf80WzWfVJJO/AyidL8iKxvIAns5lIcnBxS6OmeAvruV3a+nyr
         alTnvTtkFdb9a0ZSer/Xj/4JZWlRnziAv9bcFiYmDhfIez/Jl2sbZLfAAerVo8vXnCNG
         +aNJ/xS3g7HGWN739x4tovV2HlKVhI/zhVnC0Ex/f24+i7QtiZ8cJYSUOzGmyciULJs/
         U+Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780976015; x=1781580815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=;
        b=N+VHCwY6g/CVhwVl+6N/Oh/mthb3cZeiHG0+4ygb77J61glyMdsHBjVnG1PNaHcToK
         fYZXoWvGuFsFZ4uyBI4FLfpfmSJyNX6qMKkdcEqwGZEvqfH63uXz3wvGz0lz43I3Jnc8
         7ry22fbCQcGV8Oh+j28r/ZpkX551CQTrXmutc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780976015; x=1781580815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=;
        b=rerprTkWsA69huzioj8ysCsOkjN3S7yWkxT4kitpEc23tSqJU4w5cpaZji6W8foqk+
         I4aBvK/mKzQLq1XF/Ktyfdw2shaVwQJ8AOrNb6jQjbeHffCsIr68amwOAnJ2vJdMZHN0
         3DKsIspYHa9TbzAY6m1BtQH/2QZq54+7DdvFa9xM8W0ShTbDradgHRXSFgpuBH745Ovt
         9LutEhRDzAGib+0FcAeZfFmTdCSf5LFTgeGV27lPtfR9vG1TA2vdzmwhr0jvCZD33rGl
         tpvlrl+nNNcY7IzGC83C03cVkClSdT7Jow9l+je+Ew1aoMA/ghP5xIQFfUyoiyCdMnn8
         unLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UObwoJkyksZzzZh+XUCXnlAwep+aDsY0EE/n44kcWK24Bk6H3fUVt33VblDGvY+A92K3SvrUBM1qa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6rEm7G8Kv6FR/SYyXFET2+05O4yeNkGmaf4n9i9qTBQJ9xW2
	MC3VuI8s994kNI14rFLyoBFMnNZ/S/84/kYneREd0psI7klb4DHQoA53KvGMCb9ZO1RU1Q0jJnX
	6t6/Sv9LRk+OHBUK7WclydxLjXp1YPBNFXALlAPZn
X-Gm-Gg: Acq92OFb90tQmSZ4xuXYs5/bI1uxH/9I3mmHt+fbr7/co0nb5dBWUjQfeb2Q/e6Lnin
	zs7Vg+eVtAPLlwzj9y4AUZoP61H8x9qgUM9e/zAd+oh4nPyD05VKOlTAGMbQNBba/3ChRwdpTro
	MG5LWDFXijEIykxHpG2/ZDjKLhifxNI3tqhYHZHNwErbIObWufY6y+dt2xr95o0vxWSjYTdrMcd
	LWHvS7pkl4veNRzMJLBCoheq2aXQ4PM+U5H2PZt3eD6PgVu7LyQDG2c5vdC6/STgw/ltDlHnx4w
	wQbNUtv/mW09JreWD4o=
X-Received: by 2002:a05:690c:4991:b0:7dc:61c7:5919 with SMTP id
 00721157ae682-7ed11384e09mr179186077b3.37.1780976015575; Mon, 08 Jun 2026
 20:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
 <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
 <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
 <20260601214836.GA37779-robh@kernel.org> <CAGXv+5GK6+X3-eY8PbrLTsSwK2Uk2URiQti_Gd_9C=RwRaJ44Q@mail.gmail.com>
In-Reply-To: <CAGXv+5GK6+X3-eY8PbrLTsSwK2Uk2URiQti_Gd_9C=RwRaJ44Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Jun 2026 12:33:24 +0900
X-Gm-Features: AVVi8CcLvfu3nmY0FgYyZD975IyBRElgoOX6HGLOEh9gnunhRFWsfhBJHTEFs2Q
Message-ID: <CAGXv+5F94K7JJz9pMg5=7-YoXjT_ux8SvBKP17BA36mXYTYo6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Tue, Jun 2, 2026 at 5:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> >
> > On Tue, May 19, 2026 at 12:51:49PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > >
> > > > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <=
mani@kernel.org> wrote:
> > > > > > >
> > > > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasiv=
am <mani@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wr=
ote:
> > > > > > > > > > On some SoCs without an IOMMU behind the PCIe controlle=
r, the PCIe
> > > > > > > > > > controller memory access could be limited to a small re=
gion by the
> > > > > > > > > > firmware configuring a memory protection unit. This mem=
ory region
> > > > > > > > > > must be assigned to the PCIe controller so that the OS =
knows to
> > > > > > > > > > use that region. Otherwise PCIe devices would not work =
properly.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > So this means, the PCIe devices can only access a specifi=
c carveout memory
> > > > > > > > > configured by MPU for DMA? If so, you should use 'dma-ran=
ges' as suggested by
> > > > > > > > > Rob.
> > > > > > > > >
> > > > > > > > > 'memory-region' also serves the purpose, but for PCI, we =
have the dedicated
> > > > > > > > > 'dma-ranges' property.
> > > > > > > >
> > > > > > > > I think I need some sort of guide on writing the 'dma-range=
s' property,
> > > > > > > > because it is not working for me.
> > > > > > > >
> > > > > > > > I'm adding
> > > > > > > >
> > > > > > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 =
0x4000000>;
> > > > > > > >
> > > > > > >
> > > > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mapp=
ing?
> > > > > >
> > > > > > I actually don't know. But
> > > > > >
> > > > > > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 =
0 0x4000000>;
> > > > > >
> > > > > > this didn't work either.
> > > > >
> > > > >
> > > > > Hmm. Can you print the DMA address programmed to the device? i.e.=
, the address
> > > > > returned by dma_map_single() in the driver.
> > > >
> > > > On a working system still using the restricted-dma-pool memory regi=
on,
> > > > it gives something like 0x00000000c0009000, so indeed it is 1:1 map=
ping?
> > >
> > > It has to be 1:1 mapping.
> > >
> > > > These are for the RX/TX descriptors [1][2].
> > > >
> > > > When using dma-ranges, the failure is from dma_alloc_coherent() [3]=
[4],
> > > > which is the descriptor ring. On a working system, this is somethin=
g
> > > > like 0x00000000c0c9d000, so again 1:1.
> > > >
> > > > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L221
> > > > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L829
> > > > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L192
> > > > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L265
> > > >
> > > > > Also, using prefetchable flag is not correct for DMA memory. You =
should use:
> > > > >
> > > > >         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x=
4000000>;
> > > >
> > > > This didn't work either. What exactly is supposed to handle dma-ran=
ges?
> > > > I see some code parsing it in the PCI core, but it just saves it to=
 a list.
> > > >
> > >
> > > I think the failure is due to marking the memory as 'reserved' in DT.=
 With
> > > 'dma-ranges', the allocator will only ensure that the allocated memor=
y stays
> > > within this limit. But the allocator itself will not use this propert=
y to
> > > allocate from the reserved region.
> >
> > So the region should not be reserved. Reserved generally means the OS
> > shouldn't use the region (though maybe a specific driver/device can). I=
t
> > should just be a CMA area I think.
>
> No. The whole reason for this is that we want an isolated piece of memory
> for PCIe so that PCIe transfers cannot corrupt memory used by other parts
> of the system. Normally the IOMMU provides the isolation. On this platfor=
m
> there is no IOMMU for the PCIe controller.
>
> System memory isolation as setup by the firmware already restricts the
> PCIe controller to only be able to use this region. And we absolutely do
> not want any other part of the system, be it kernel, DMA buffers, or
> userspace, to use it.
>
> And also, if it is not reserved, the kernel is free to put "other" reserv=
ed
> regions, such as the default CMA region or the software IO TLB region in
> this piece of memory.
>
> So I believe using memory-region is the way to go. The memory needs to be
> reserved, and assigned to just the PCIe controller.

Ping? We need this merged for the coming cycle.
