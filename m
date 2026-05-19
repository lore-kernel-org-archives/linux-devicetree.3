Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC8E3E120A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180193; cv=pass; b=ocwCP7CbHtGtcPjYJ5b6rVO2yiUdKl/D/GAFPw7h5X8vkky7iJzCg8gA0/hle08i22szWGHTpWHVPDSHAzZTdg6AHPmPiS3MS28xZQX8CMrVGckT+p8xdmjMr4t56mn5WF0O46TONGls+L9wkgAHrh9UIVFyK6wzCf0qrRcWTK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180193; c=relaxed/simple;
	bh=/5/1C/nfDchQen7a0uWhsJKKNfxIdxaNrtMjwRBDWI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMozjfW4x19yuCfb+wso0Btu4BKpENvJl3SPn7OX2eTIUqo+LW18HYdP5P0lMIL1Koeqg3/jvSX+sGUpnu07q/xu3Wwg6AUPwIFrW2VFYXVhtfV0U3L/OHH+so0maN3c7qMZ7DKKqsyk8RexCoq+uewuBNB0t8K9xF9vNOiW73s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i3WzDKci; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i3WzDKci"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so2155558e87.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779180190; cv=none;
        d=google.com; s=arc-20240605;
        b=I8L3veVJHPQff/cf6YL1FgiDmNw1KlGailzw7UCLQU0y29rrjdoZm/B0/+GEv7BP9R
         Jg5qt0khtH9QPFh+kyYP1DfQE4/Z4SdarTEkE0odWoZU91iTVeQIteIQRW3pIq0jkNpE
         DpmBY05OWOOvdhWK9qYCKuEVb+qAC4mDJNWzYS97j0aVyXMjYNSzeKhyQypfYBOFRity
         Qk1TMVzOgTUkIYzcnj04zTTB12+pXQSRwrT/9QIDPPTjBvVZxAxH6oKGytsvVXnwy3Ix
         fi6bz2HrYJM6gx1P2g7/lM5ov2XL3TGE9TpWkjAQU85H80tmkzZYNOjIYn6GbbtrPQwV
         Ithw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=;
        fh=ihTCB+RP6tV/U8etoCYg3gWdFSEoZMpKKYvWCNB5Z64=;
        b=PrgyAVdOUETANnOMBtk5H0qTSj/TA5YkOj/47jwISrgd/7iGNX48/qGuv11Pbs88c6
         WjhWqQm5qsP3UTBsjur2unfHJMOR9fMLhisusbfBAW8SfjIZPKFOAuhqnUOLjodlSMdo
         nZCkls5iXEvgIEYp6wjqbngTrpyw/paryqVNGbJ2TwwKOZ+Zlt6FLYRs2NaaCdiJRb5E
         RQn5e05h3vndGp6VJqWeG25vTdOkxtBYmTkxrHvQOOCmAendGNWWAujRQ7NMQ6DsHufH
         wobFPuwUg6CYiNmR2TTOITPQcrNMwU4mNXqKViDWz/lB0YMPOautBbT8bLx5E6oAzDDi
         5zQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779180190; x=1779784990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=;
        b=i3WzDKciNW8m7qsosKSxuNLin4pwyDtQ1yJ60VLkGYiJmKtCj+YKN9VZqwJIZ52+S3
         guRvvbxkeAkK8JsRXl1ZidYxmogPxBpPQJzvt40Q2iy9nwhWHFYPMGi5PDNggqqp9BMn
         L/VAi9pLZ0hPbVV6tObIJgY05YJbkV+pAJntk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180190; x=1779784990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=;
        b=CHrmngToM9q/0Z+CqV9qOaayTdqPPNVQyNBh94ea1xy+rRdAaXZCBw4cFgGabpxfFT
         hsHAnWdreOJIfyK2OCkZt4aBka67JteHm9YEQmYjqNiTgdONZZL44TC2GaJ0x883WtEK
         Abl0Impa1Iks5zq1Gko2OaAV/wDDni8PteklvqDGLgYW4wppVIBkoufclYK1B7nO8YZ1
         cnFvY8cUhTs+z0eXLe4i+Z7M43cftWhX8IwB92TBKyonrCz+MjNUBtS1NZQVEgBxOWCe
         /xDIs7rZjoLCNpS+ezYfDgw4M9EvGUbymQtNCAj4H/v6ZxXEJ9DTQCw50GkCAhuB+Ey9
         3/zw==
X-Forwarded-Encrypted: i=1; AFNElJ/m6X8Bxv7mv7M/SXQAuMV+7rdgVVAIL5DbC3eWz0LBUYFpgyoUA9r+a0QdTAkp0PIJDyP0aZpeylPp@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNoI3l49B8wkS8UVvsnQQevRolUY+iqo6Qvt68yZsKQockzlD
	N46mgi2VGPI8a/mn+FVAQTlJniXBKo/4dLKnaUIyk5zBZ4NLu1OTf2KILUflHOLuQTapQlxfAWf
	kfR1it0VsDL9a31zZFotSJ+ll+V1aCcfiuR9sPf5i
X-Gm-Gg: Acq92OED/J2iWc9p7yKkcQpEec5iXmbUOSFNMqDwY4LrmxvFlAdFO193J1vWOfr3gmD
	Ao2UWcd+S7DwvipdYFzI6d5Yv2VP1lKputqXNglLLQHNUYNEH0P13tNJptXEY8NA7fSxFwS2j2L
	WmRRJGdUqAfBXY1c1/kmb+uiPPHad80ulzRkRJttM+mPA62uIsqgd7PR/LLyxOcmRlZAYZraXit
	OehHKwSuE/AIAksb9U0zh+qnY/UF5cWZwObKURh/5IdqPTQ04xugaf2KY/VNcPu7hkxk9VuDNtF
	OEUC3LqjyTO7kk3gftc9Oas5Z7L6PUupLSKWdckOsEDPSHLM
X-Received: by 2002:a05:6512:1291:b0:5a8:64fd:142 with SMTP id
 2adb3069b0e04-5aa0e60aebdmr5661162e87.15.1779180189498; Tue, 19 May 2026
 01:43:09 -0700 (PDT)
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
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com> <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
In-Reply-To: <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 May 2026 16:42:56 +0800
X-Gm-Features: AVHnY4LLo4eF_VaQ6YS2FYY5drqx5D71hzS5a123cTm8zGoSSsL-Aobf3coFKV4
Message-ID: <CAGXv+5Hd91gS=j4x8rEPVSaU8ET-W0qygLTbCLVe6uGC-tQBrg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 3:21=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > >
> > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <=
mani@kernel.org> wrote:
> > > > > > >
> > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On some SoCs without an IOMMU behind the PCIe controller, t=
he PCIe
> > > > > > > > controller memory access could be limited to a small region=
 by the
> > > > > > > > firmware configuring a memory protection unit. This memory =
region
> > > > > > > > must be assigned to the PCIe controller so that the OS know=
s to
> > > > > > > > use that region. Otherwise PCIe devices would not work prop=
erly.
> > > > > > > >
> > > > > > >
> > > > > > > So this means, the PCIe devices can only access a specific ca=
rveout memory
> > > > > > > configured by MPU for DMA? If so, you should use 'dma-ranges'=
 as suggested by
> > > > > > > Rob.
> > > > > > >
> > > > > > > 'memory-region' also serves the purpose, but for PCI, we have=
 the dedicated
> > > > > > > 'dma-ranges' property.
> > > > > >
> > > > > > I think I need some sort of guide on writing the 'dma-ranges' p=
roperty,
> > > > > > because it is not working for me.
> > > > > >
> > > > > > I'm adding
> > > > > >
> > > > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x40=
00000>;
> > > > > >
> > > > >
> > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> > > >
> > > > I actually don't know. But
> > > >
> > > > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 0x=
4000000>;
> > > >
> > > > this didn't work either.
> > >
> > >
> > > Hmm. Can you print the DMA address programmed to the device? i.e., th=
e address
> > > returned by dma_map_single() in the driver.
> >
> > On a working system still using the restricted-dma-pool memory region,
> > it gives something like 0x00000000c0009000, so indeed it is 1:1 mapping=
?
>
> It has to be 1:1 mapping.
>
> > These are for the RX/TX descriptors [1][2].
> >
> > When using dma-ranges, the failure is from dma_alloc_coherent() [3][4],
> > which is the descriptor ring. On a working system, this is something
> > like 0x00000000c0c9d000, so again 1:1.
> >
> > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L221
> > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L829
> > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L192
> > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L265
> >
> > > Also, using prefetchable flag is not correct for DMA memory. You shou=
ld use:
> > >
> > >         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000=
000>;
> >
> > This didn't work either. What exactly is supposed to handle dma-ranges?
> > I see some code parsing it in the PCI core, but it just saves it to a l=
ist.
> >
>
> I think the failure is due to marking the memory as 'reserved' in DT. Wit=
h
> 'dma-ranges', the allocator will only ensure that the allocated memory st=
ays
> within this limit. But the allocator itself will not use this property to
> allocate from the reserved region.

It didn't work with the reserved regions removed either, since CMA and
SWIOTLB take up the space by coincidence.

> Now, I'm not sure if you can reliably get dma-ranges to work for this use=
case
> of forcing the dma_alloc_coherent() to use the reserved memory.

Well I think that would be a bit sketchy. But we do want the reserved
memory, as the whole point of limiting PCIe DMA to that region is to
isolate the DMA, so we don't want the system using it for something
else and potentially getting overriden by some rogue PCIe device.

> So looks like 'memory-region' is your only option here.

Thanks. Hopefully Rob understands and gives an ack for the DT binding
change.


ChenYu

> - Mani
>
> >
> > Here's a function graph trace for the dma_alloc_coherent() call:
> >
> > funcgraph_entry:                   |  dma_alloc_attrs() {
> > funcgraph_entry:        6.538 us   |    dma_alloc_from_dev_coherent(); =
(ret=3D0x0)
> > funcgraph_entry:                   |    dma_direct_alloc() {
> > funcgraph_entry:                   |      __dma_direct_alloc_pages.isra=
.0() {
> > funcgraph_entry:        4.846 us   |        dma_alloc_contiguous(); (re=
t=3D0x0)
> > funcgraph_entry:                   |        __alloc_pages_noprof() {
> > funcgraph_entry:                   |          __alloc_frozen_pages_nopr=
of() {
> > funcgraph_entry:        5.539 us   |            fs_reclaim_acquire();
> > (ret=3D0xffffff80c7dcd580)
> > funcgraph_entry:        5.077 us   |            fs_reclaim_release();
> > (ret=3D0xffffff80c7dcd580)
> > funcgraph_entry:                   |            __might_sleep() {
> > funcgraph_entry:        5.153 us   |              __might_resched(); (r=
et=3D0x0)
> > funcgraph_exit:       + 16.230 us  |            } (ret=3D0x0)
> > funcgraph_entry:        5.077 us   |
> > __next_zones_zonelist(); (ret=3D0xffffffd055d598e0)
> > funcgraph_entry:                   |            get_page_from_freelist(=
) {
> > funcgraph_entry:                   |              _raw_spin_trylock() {
> > funcgraph_entry:        5.385 us   |
> > do_raw_spin_trylock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.923 us  |              } (ret=3D0x1)
> > funcgraph_entry:                   |              _raw_spin_unlock() {
> > funcgraph_entry:        5.077 us   |
> > do_raw_spin_unlock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.538 us  |              } (ret=3D0x100000001)
> > funcgraph_exit:       + 54.231 us  |            } (ret=3D0xfffffffec051=
c540)
> > funcgraph_exit:       ! 123.462 us |          } (ret=3D0xfffffffec051c5=
40)
> > funcgraph_exit:       ! 134.692 us |        } (ret=3D0xfffffffec051c540=
)
> > funcgraph_entry:                   |        __free_pages() {
> > funcgraph_entry:                   |          ___free_pages() {
> > funcgraph_entry:                   |            __free_frozen_pages() {
> > funcgraph_entry:        5.538 us   |
> > __get_pfnblock_flags_mask.isra.0(); (ret=3D0x0)
> > funcgraph_entry:                   |              _raw_spin_trylock() {
> > funcgraph_entry:        5.077 us   |
> > do_raw_spin_trylock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.538 us  |              } (ret=3D0x1)
> > funcgraph_entry:        5.385 us   |
> > free_frozen_page_commit(); (ret=3D0x1)
> > funcgraph_entry:                   |              _raw_spin_unlock() {
> > funcgraph_entry:        5.077 us   |
> > do_raw_spin_unlock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.385 us  |              } (ret=3D0x100000001)
> > funcgraph_exit:       + 75.000 us  |            } (ret=3D0x0)
> > funcgraph_exit:       + 86.230 us  |          } (ret=3D0x0)
> > funcgraph_exit:       + 97.384 us  |        } (ret=3D0x0)
> > funcgraph_exit:       ! 262.846 us |      } (ret=3D0x0)
> > funcgraph_exit:       ! 274.538 us |    } (ret=3D0x0)
> > funcgraph_exit:       ! 309.077 us |  } (ret=3D0x0)
> >
> >
> > And here are kernel logs for all the system's memory regions:
> >
> > Reserved memory: created DMA memory pool at 0x000000013ff00000, size 1 =
MiB
> > OF: reserved mem: initialized node audio-dma-pool, compatible id shared=
-dma-pool
> > OF: reserved mem: 0x000000013ff00000..0x000000013fffffff (1024 KiB)
> > nomap non-reusable audio-dma-pool
> > OF: reserved mem: 0x00000000ffe65000..0x00000000fff64fff (1024 KiB)
> > map non-reusable ramoops
> > Reserved memory: created DMA memory pool at 0x0000000050000000, size 41=
 MiB
> > OF: reserved mem: initialized node scp@50000000, compatible id shared-d=
ma-pool
> > OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB)
> > nomap non-reusable scp@50000000
> > cma: Reserved 16 MiB at 0x00000000c3000000
> >
> > Zone ranges:
> >   DMA      [mem 0x0000000040000000-0x00000000c3ffffff]
> >   DMA32    [mem 0x00000000c4000000-0x00000000ffffffff]
> >   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> >
> > Early memory node ranges
> >   node   0: [mem 0x0000000040000000-0x000000004fffffff]
> >   node   0: [mem 0x0000000050000000-0x00000000528fffff]
> >   node   0: [mem 0x0000000052900000-0x00000000545fffff]
> >   node   0: [mem 0x0000000054700000-0x00000000ffdfffff]
> >   node   0: [mem 0x0000000100000000-0x000000013fefffff]
> >   node   0: [mem 0x000000013ff00000-0x000000013fffffff]
> >
> > software IO TLB: area num 8.
> > software IO TLB: mapped [mem 0x00000000bf000000-0x00000000c3000000] (64=
MB)
> >
> >
> > So I think it could be that the usable memory has all been given away t=
o
> > other bits? But then dma_alloc_contiguous() returned NULL.
> >
> >
> > ChenYu
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
