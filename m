Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F18833D6D5
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383765; cv=pass; b=dJkMUNKyCfEIxE/rlowQ7KzhVwK9BSK+4AtyWS5nEwAx1LohyzAwxp5LqLZb6NfT3t4t0/VmKFmNXR45FvDDfAkHcruSpM4VMD6FvH3iQYVBfBFeo6RmFsHzlmQMj/1in08Ms253DhMBSFAMbRDOEI2R8ggWF0u1NaRm7e8gwdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383765; c=relaxed/simple;
	bh=dc3hxz1Z6ts5aP80soJ2hBJ6WJFOrS2+h2Wacc7ErT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRJMZPfuBFtw6XjVMcVggOmdo7S4QdTCgt5b5mJ4ws7hMKBOIt6KxTGRFAWbI7eSTy7A3grdYkQzUZt6MSG576dSDnAodCGd2P+JUeiQ1hLFbM6Ne9JTiBHk+/B5u3WQeMPrvxPTYJcTXL8LxpBKuoTxzsdG5h9yGYudJMsh64o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gcKHJH0l; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gcKHJH0l"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so2159016e87.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780383762; cv=none;
        d=google.com; s=arc-20240605;
        b=izHZm6wJ6ALUKK8Dg4QkP6kPNSUdWqNsx85IbV31lvQUQ8PY87F1+5B1a3oiRIZ1fN
         PYAi49lfruVd1UcSpAaFHAgSIrPntJij+HwfcvCYbMUfUrU3IVuyB57O+bptxSsLMpga
         D3Z5+cW52aWpHwH8bPVC+EhK6HVuwZlE3MvKgSLKEiayTQ04Bi1IyVhvU4vfwt7wVJSh
         OPZpTsMGaG5Lgg1HbPJb9WHdGlUEVPZTAbNPN8PSFOGi2XdcVe+LHEZOEKcoouBsCmk+
         oh61n2HpwDKu53UUdmfct9+Ee6Vc87433NRDWRF8EkAUvnMkHhNh6tZYC09dRCx79V96
         ERxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=;
        fh=bDfgnNrfbWItOUsdexK9z0RYXaGs8Uqq6gRtbN5806w=;
        b=XjfMz2nYMR8nPVuabZ406mksZMeiw5tEbCTgKvXkbONKUHMYStOv2TaWm7r/y/j+8n
         MRSwLIk4rr2pqT5hx1X+BgbuUsdyDul2hcPKRbTbjtd/ocAKfErf6zgYHxJyKbIW8Ybq
         W4nTS8xJPviOnuR1qq9uDutr5bKF7P9xmW88cnki/jOAwsCoGj99VleVESBOpdGg763a
         R4/s/jwqCLK5kkMCup1jzb1WohSg5Ea9TWjYTECjEHfr4XjJOz2VdYBX/xoCoRssfnbm
         qbXw8QnpOTNnS5NqvnclHwrwM8Z2Z0AvzEkdSFDgvUeBTrQjtPSHo7JkenECGOGhmfR8
         ob4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780383762; x=1780988562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=;
        b=gcKHJH0lkC266v2H2vZybnksZ5YHP65poH+Sx2ZKrDLy6WlhFu1UyPJ5DDXfdkSidX
         JIMcoriyI3Y0XZgyxGClKxeGCe3gjFSdAfon5YbAiZZWI5zI7p0Bu7xJvxs3A7WzBauZ
         Ktg4SwTWNS9+PMfPF11M/MsPrs+glOuuoEAFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383762; x=1780988562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=;
        b=pcPtLO8bjbzS1RWqqCNF3A1ax0STBTbv/aizUliNp08EZ72++ZKaBPbXAWQY3zBby1
         g8giAeKdqGAKb5VtvEuB0zT3p5gLbe6hswPDljBCOIvldmN/K1aHX4Pe0FU0uU7KPPYT
         sfpsfCVCaE4xlHOVkHHKVgj5eRRVrHhejCTgDu1m1vOm9u+WHSgiKkhaPHfnabWLv6FX
         4z5/lKM6QAzx2w5BCPofNeiK4IslBPgedWap8iMbA4eTktY9PiTBNPv9wAqnduFtiVL1
         iE2+yLLmUU2ZJmStAtxVX6K3UYjacrxJBU2kbrUnZfuRMcWPS4+bzrFn4itWgU83VzNJ
         AFJw==
X-Forwarded-Encrypted: i=1; AFNElJ+5nWsTrRHteGTnuhy7jzwoPKXD0dd1HwurnIxN8mZvhWqG/CedJV2JhC+R2pSYs6qwn4LUoXjjjPX/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5P8YBP5J0OYPU0nBqCURs09L2yDxkQUAmteJyJNfzUjOixgPy
	AF+J/weCjgJTgXdjftlvdlINO2VxBDl62cZ2ZHPaysHB6jeipjTVM6XwoO+0pEfref+2o6rZlyY
	btFCbRIH33BPMyQVH716deW/qwnGKzgTnLmNuO5N9
X-Gm-Gg: Acq92OGAJ5VPWci1J4HLji//FbJJvwLSh5zSiR6El7v7SSZApTdl+0aMl9apbAQS+3T
	OWchdKPmEgh2xjNIN3zNredk/6n2/U25Ys2WG64fTKgxGDlNJ3iOwxmfZ3LF21x7gM6OIljffoF
	zttIHAkRFpKgweuQJo85llGQfacWi8M8VlAx18BwPPuKQB1umeYo+xT+0dyewVjYRBOFywmS5sG
	1K+yCRO2VLPI48VR7mZFMFabhXp/eioQDMF5Ik//tQvAOlMAaUhjmnXtCc+aJMhSBzzl4mfBF+F
	sQArsHx8bN3DKtmyk2xigMpG0K6bAZreMfMpmBT/jYZzDyfFtgea0wHKpQ==
X-Received: by 2002:a05:6512:1149:b0:5aa:6c90:283f with SMTP id
 2adb3069b0e04-5aa6c902a77mr2153865e87.20.1780383761782; Tue, 02 Jun 2026
 00:02:41 -0700 (PDT)
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
 <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz> <20260601214836.GA37779-robh@kernel.org>
In-Reply-To: <20260601214836.GA37779-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 Jun 2026 15:02:28 +0800
X-Gm-Features: AVHnY4JxBAhKzuOj5WlSWhMTG9y7geprKoaK3gn9MaHW8gIuPbxvEk-tzLbY0lY
Message-ID: <CAGXv+5GK6+X3-eY8PbrLTsSwK2Uk2URiQti_Gd_9C=RwRaJ44Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Rob Herring <robh@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 5:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 19, 2026 at 12:51:49PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani@k=
ernel.org> wrote:
> > > >
> > > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <ma=
ni@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam=
 <mani@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrot=
e:
> > > > > > > > > On some SoCs without an IOMMU behind the PCIe controller,=
 the PCIe
> > > > > > > > > controller memory access could be limited to a small regi=
on by the
> > > > > > > > > firmware configuring a memory protection unit. This memor=
y region
> > > > > > > > > must be assigned to the PCIe controller so that the OS kn=
ows to
> > > > > > > > > use that region. Otherwise PCIe devices would not work pr=
operly.
> > > > > > > > >
> > > > > > > >
> > > > > > > > So this means, the PCIe devices can only access a specific =
carveout memory
> > > > > > > > configured by MPU for DMA? If so, you should use 'dma-range=
s' as suggested by
> > > > > > > > Rob.
> > > > > > > >
> > > > > > > > 'memory-region' also serves the purpose, but for PCI, we ha=
ve the dedicated
> > > > > > > > 'dma-ranges' property.
> > > > > > >
> > > > > > > I think I need some sort of guide on writing the 'dma-ranges'=
 property,
> > > > > > > because it is not working for me.
> > > > > > >
> > > > > > > I'm adding
> > > > > > >
> > > > > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x=
4000000>;
> > > > > > >
> > > > > >
> > > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mappin=
g?
> > > > >
> > > > > I actually don't know. But
> > > > >
> > > > > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 =
0x4000000>;
> > > > >
> > > > > this didn't work either.
> > > >
> > > >
> > > > Hmm. Can you print the DMA address programmed to the device? i.e., =
the address
> > > > returned by dma_map_single() in the driver.
> > >
> > > On a working system still using the restricted-dma-pool memory region=
,
> > > it gives something like 0x00000000c0009000, so indeed it is 1:1 mappi=
ng?
> >
> > It has to be 1:1 mapping.
> >
> > > These are for the RX/TX descriptors [1][2].
> > >
> > > When using dma-ranges, the failure is from dma_alloc_coherent() [3][4=
],
> > > which is the descriptor ring. On a working system, this is something
> > > like 0x00000000c0c9d000, so again 1:1.
> > >
> > > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L221
> > > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L829
> > > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L192
> > > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L265
> > >
> > > > Also, using prefetchable flag is not correct for DMA memory. You sh=
ould use:
> > > >
> > > >         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x40=
00000>;
> > >
> > > This didn't work either. What exactly is supposed to handle dma-range=
s?
> > > I see some code parsing it in the PCI core, but it just saves it to a=
 list.
> > >
> >
> > I think the failure is due to marking the memory as 'reserved' in DT. W=
ith
> > 'dma-ranges', the allocator will only ensure that the allocated memory =
stays
> > within this limit. But the allocator itself will not use this property =
to
> > allocate from the reserved region.
>
> So the region should not be reserved. Reserved generally means the OS
> shouldn't use the region (though maybe a specific driver/device can). It
> should just be a CMA area I think.

No. The whole reason for this is that we want an isolated piece of memory
for PCIe so that PCIe transfers cannot corrupt memory used by other parts
of the system. Normally the IOMMU provides the isolation. On this platform
there is no IOMMU for the PCIe controller.

System memory isolation as setup by the firmware already restricts the
PCIe controller to only be able to use this region. And we absolutely do
not want any other part of the system, be it kernel, DMA buffers, or
userspace, to use it.

And also, if it is not reserved, the kernel is free to put "other" reserved
regions, such as the default CMA region or the software IO TLB region in
this piece of memory.

So I believe using memory-region is the way to go. The memory needs to be
reserved, and assigned to just the PCIe controller.


Thanks
ChenYu
