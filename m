Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F5D3E023E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094947; cv=pass; b=YKvWhtmoPF1kVmfSUxSW2Lbx7ZQjfdNqeD7naJhhVAZtB2WoXlTUmVs8LYdy8JCrxGU3fd437O+QZyVkL7XsY3bY2B19FISLqlANXVLkymxE6su45InV9ciXRcYojv2fOIbRU8fqKVR3b0wr3wRu3ag5qgzJK/CIg+jEHWU4lUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094947; c=relaxed/simple;
	bh=71TFbEcoqimFGHlNd4y6mv6WLtF6nLvR79xMgngVEgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSaGUXTKt9bb5s1h4Crwyz/g2hWT8Zs7fKf61Jw1aMtpvcADFRHM7BjdTjN5uhe0mVnwsKn1wVioopekXjGNATkbcg8UsznMSsmz3cuEB5GRHW4w4pHDDgln4yq63HYRpQ/qjAn4I2Z/uoMu6u8mywrceWtDYnRyVMCK9NFTTgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BLMi+r7z; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BLMi+r7z"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so3166339e87.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779094944; cv=none;
        d=google.com; s=arc-20240605;
        b=DYD5r24b3qUSpKEpf3dl4n9CkMoKTMYuWV/tAZNffJv/t7IL0P65gDd4aCCYiLk74g
         PyI5j31M8CQ/4kVMhEMlmLr0gFbgeCNT++3ufTetHlfQoevnij4SuWilWOmcpK+O+59K
         Xo+ocz/wtd+VqZHrOcQNRPhR8Cu2khoEQL5YG/xGDPSG1Gm7y/DbFGLAn6WNC5q26Zq8
         xMpSBANTvskjMdQyUr2jDFZjNnjwz7vO63hQMn3IsSdHyKZDyx17536sjHKmG0TJwYcV
         WsoyNtLTBjUiAlLNh+JhRgUMCCdEO1L0Ff0nwXgtpzO7AzDML2somwNYr4oEYlrjnSgI
         jwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=;
        fh=4bjLen4ADMxj2CYPJNfYBUJoYL2i5wpWe4BjbQUKi7g=;
        b=OrQysTRxIXdByb3rdkpwCBRnrxsW6c/1QKY/0CXbY5GRMsn9ac+OrIVyvsoDVnt2N/
         ohr/8F0l+ttF3SIESI4HgJ/NSOtI5hjPUUreD0ChnVQcMvnc5kGWBkzuaOVkT/XuDrcC
         IdF0lvhE/Oz0GkkpM7h6fq8jPh0CpDu7+8dzx0N9iyClaSK43jOoTy2C+/2WnPUcQ7yo
         vMzu0gSmwZSzXxs2/lHPe/r6Us27HfHff6rnIvc8qsKms627i07Oa5M8XlklD7/Z+VSa
         X1m8DP2745ktThYPotEmwYDANvDEk49CfLNWCcAzaYWtqUk7IjRkV/Ih+AZkG09PE5U+
         SDpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779094944; x=1779699744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=;
        b=BLMi+r7zrqq1VTM1aA43BLE2Q1YFCW6NqxZhHWhMfVWfh90sNJtViUKaxs4bT2ewUC
         9efSEmAPpVroqcc+BsYcOvr+foNVod7tHMkCQIvLf28sijhEijBBSADOXpojvD7OK/6E
         DkqyJ3YNkhvEi1dj2Wxjnl55FePlm2exnwD40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779094944; x=1779699744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=;
        b=USJq9jpX+b+xCENWz4Hdxs0JFyurmwgnzhDiSsxEOq+4+uoAgmUdHozgjw8Zhx9oIE
         gkkfiSRWKHTW8M78ElB4KRopXPg+Qp1L1CLVkB3xF+WVM1pmsWAIPIlQoRV4M3pem+RX
         MyCOYs2UeXc6Ag2kVP6tWy/7+sg9blArCs/FdlIRM2pAXNSshL3hi96Peuyf93nzYcoj
         r6cUWTVxsCf0HgmA2xjS6TXsY2qJCGwv81JsLa0iHLwFbT7FNmJjpcmbwzh7N/DBsuvM
         k0uDcaXycGV16wOhwh1ubluseU5Xd1Pn3tscldWPJ0wpiWlnHmlvjeRceA5muYSak+3g
         Y6GA==
X-Forwarded-Encrypted: i=1; AFNElJ/oLkNlyJ8TKK5t/Yg6rMZCnHTvgI3q3tm7tTo0O1CNlS9AsI1dn03BstJWDhj3PmRobCXAs0DgKR1A@vger.kernel.org
X-Gm-Message-State: AOJu0YxrccVBhIpEUVySbgFQ2qBu3Qm5C7cQzIjvpaDz0/+UcJ9yHNNw
	3QggxxSb57QRB5wHbLny7iawahVCkz9LER/JRpk0uNrjHzh5GSHhijqmzsqjTKzrSwMXJlRzxED
	gMS0H9xyqxdcCscBeM4Heve7Coq7+RabI0vOdMybh
X-Gm-Gg: Acq92OGNWMOb3WbtC9/B/GyETjEb3W528aG5L2xneGkZ+yOxTu44m5i0g4ScI8Rs2FS
	nft646NSnoseRikEBDRitlxTGzmXQNJoB1391SXo7vY37xtj9FaWZrSQtRle67kxu8UiNMa7/ZH
	XD3icN3jRztal1JqOLRDAU6LZEjiCS4t0digD3V3wXOfc5Srk5YIl56j7LmhOsBb8ijTRtw0muU
	55huoda2M8Qw5+uIphzv5GULgSQ/N2hWKleWe2opZe3WNQQ82/S1LCgUDrYWMFn4SAbOZEBiU4q
	vR2cZChi7VXShsv+BnSad0hy59acib7Mfaz0Sf0GV3zQAffJ
X-Received: by 2002:ac2:55a2:0:b0:5aa:e35:2270 with SMTP id
 2adb3069b0e04-5aa0e35232fmr2660585e87.0.1779094943454; Mon, 18 May 2026
 02:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com> <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
In-Reply-To: <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 May 2026 17:02:11 +0800
X-Gm-Features: AVHnY4JIsiwOadahU_wI7dsAovNkMx3scRvxNCSxVAoQqeyJFwBSe39bN7su8rY
Message-ID: <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
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

On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > >
> > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > > On some SoCs without an IOMMU behind the PCIe controller, the P=
CIe
> > > > > > controller memory access could be limited to a small region by =
the
> > > > > > firmware configuring a memory protection unit. This memory regi=
on
> > > > > > must be assigned to the PCIe controller so that the OS knows to
> > > > > > use that region. Otherwise PCIe devices would not work properly=
.
> > > > > >
> > > > >
> > > > > So this means, the PCIe devices can only access a specific carveo=
ut memory
> > > > > configured by MPU for DMA? If so, you should use 'dma-ranges' as =
suggested by
> > > > > Rob.
> > > > >
> > > > > 'memory-region' also serves the purpose, but for PCI, we have the=
 dedicated
> > > > > 'dma-ranges' property.
> > > >
> > > > I think I need some sort of guide on writing the 'dma-ranges' prope=
rty,
> > > > because it is not working for me.
> > > >
> > > > I'm adding
> > > >
> > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x400000=
0>;
> > > >
> > >
> > > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> >
> > I actually don't know. But
> >
> > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000=
000>;
> >
> > this didn't work either.
>
>
> Hmm. Can you print the DMA address programmed to the device? i.e., the ad=
dress
> returned by dma_map_single() in the driver.

On a working system still using the restricted-dma-pool memory region,
it gives something like 0x00000000c0009000, so indeed it is 1:1 mapping?
These are for the RX/TX descriptors [1][2].

When using dma-ranges, the failure is from dma_alloc_coherent() [3][4],
which is the descriptor ring. On a working system, this is something
like 0x00000000c0c9d000, so again 1:1.

[1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L221
[2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L829
[3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L192
[4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L265

> Also, using prefetchable flag is not correct for DMA memory. You should u=
se:
>
>         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000000>=
;

This didn't work either. What exactly is supposed to handle dma-ranges?
I see some code parsing it in the PCI core, but it just saves it to a list.


Here's a function graph trace for the dma_alloc_coherent() call:

funcgraph_entry:                   |  dma_alloc_attrs() {
funcgraph_entry:        6.538 us   |    dma_alloc_from_dev_coherent(); (ret=
=3D0x0)
funcgraph_entry:                   |    dma_direct_alloc() {
funcgraph_entry:                   |      __dma_direct_alloc_pages.isra.0()=
 {
funcgraph_entry:        4.846 us   |        dma_alloc_contiguous(); (ret=3D=
0x0)
funcgraph_entry:                   |        __alloc_pages_noprof() {
funcgraph_entry:                   |          __alloc_frozen_pages_noprof()=
 {
funcgraph_entry:        5.539 us   |            fs_reclaim_acquire();
(ret=3D0xffffff80c7dcd580)
funcgraph_entry:        5.077 us   |            fs_reclaim_release();
(ret=3D0xffffff80c7dcd580)
funcgraph_entry:                   |            __might_sleep() {
funcgraph_entry:        5.153 us   |              __might_resched(); (ret=
=3D0x0)
funcgraph_exit:       + 16.230 us  |            } (ret=3D0x0)
funcgraph_entry:        5.077 us   |
__next_zones_zonelist(); (ret=3D0xffffffd055d598e0)
funcgraph_entry:                   |            get_page_from_freelist() {
funcgraph_entry:                   |              _raw_spin_trylock() {
funcgraph_entry:        5.385 us   |
do_raw_spin_trylock(); (ret=3D0x1)
funcgraph_exit:       + 16.923 us  |              } (ret=3D0x1)
funcgraph_entry:                   |              _raw_spin_unlock() {
funcgraph_entry:        5.077 us   |
do_raw_spin_unlock(); (ret=3D0x1)
funcgraph_exit:       + 16.538 us  |              } (ret=3D0x100000001)
funcgraph_exit:       + 54.231 us  |            } (ret=3D0xfffffffec051c540=
)
funcgraph_exit:       ! 123.462 us |          } (ret=3D0xfffffffec051c540)
funcgraph_exit:       ! 134.692 us |        } (ret=3D0xfffffffec051c540)
funcgraph_entry:                   |        __free_pages() {
funcgraph_entry:                   |          ___free_pages() {
funcgraph_entry:                   |            __free_frozen_pages() {
funcgraph_entry:        5.538 us   |
__get_pfnblock_flags_mask.isra.0(); (ret=3D0x0)
funcgraph_entry:                   |              _raw_spin_trylock() {
funcgraph_entry:        5.077 us   |
do_raw_spin_trylock(); (ret=3D0x1)
funcgraph_exit:       + 16.538 us  |              } (ret=3D0x1)
funcgraph_entry:        5.385 us   |
free_frozen_page_commit(); (ret=3D0x1)
funcgraph_entry:                   |              _raw_spin_unlock() {
funcgraph_entry:        5.077 us   |
do_raw_spin_unlock(); (ret=3D0x1)
funcgraph_exit:       + 16.385 us  |              } (ret=3D0x100000001)
funcgraph_exit:       + 75.000 us  |            } (ret=3D0x0)
funcgraph_exit:       + 86.230 us  |          } (ret=3D0x0)
funcgraph_exit:       + 97.384 us  |        } (ret=3D0x0)
funcgraph_exit:       ! 262.846 us |      } (ret=3D0x0)
funcgraph_exit:       ! 274.538 us |    } (ret=3D0x0)
funcgraph_exit:       ! 309.077 us |  } (ret=3D0x0)


And here are kernel logs for all the system's memory regions:

Reserved memory: created DMA memory pool at 0x000000013ff00000, size 1 MiB
OF: reserved mem: initialized node audio-dma-pool, compatible id shared-dma=
-pool
OF: reserved mem: 0x000000013ff00000..0x000000013fffffff (1024 KiB)
nomap non-reusable audio-dma-pool
OF: reserved mem: 0x00000000ffe65000..0x00000000fff64fff (1024 KiB)
map non-reusable ramoops
Reserved memory: created DMA memory pool at 0x0000000050000000, size 41 MiB
OF: reserved mem: initialized node scp@50000000, compatible id shared-dma-p=
ool
OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB)
nomap non-reusable scp@50000000
cma: Reserved 16 MiB at 0x00000000c3000000

Zone ranges:
  DMA      [mem 0x0000000040000000-0x00000000c3ffffff]
  DMA32    [mem 0x00000000c4000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x000000013fffffff]

Early memory node ranges
  node   0: [mem 0x0000000040000000-0x000000004fffffff]
  node   0: [mem 0x0000000050000000-0x00000000528fffff]
  node   0: [mem 0x0000000052900000-0x00000000545fffff]
  node   0: [mem 0x0000000054700000-0x00000000ffdfffff]
  node   0: [mem 0x0000000100000000-0x000000013fefffff]
  node   0: [mem 0x000000013ff00000-0x000000013fffffff]

software IO TLB: area num 8.
software IO TLB: mapped [mem 0x00000000bf000000-0x00000000c3000000] (64MB)


So I think it could be that the usable memory has all been given away to
other bits? But then dma_alloc_contiguous() returned NULL.


ChenYu
