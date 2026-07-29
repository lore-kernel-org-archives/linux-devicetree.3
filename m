Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE483B1B4
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283736; cv=pass; b=I3n3hekve5SUJA10kXMZrqihrYV+eN66WRQnkcUfoOtNJ31uIQO07NOWFmaeGF+Anx2qidHgDTaBv96/s0TmR/OBCtCnltdo1uLcNdYmV/ASOlQkN0jNN9fHvVIYBe4SOZax82qp0mQSzEOu8DbEJFtMewGX4dhf7VetZdnveEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283736; c=relaxed/simple;
	bh=cDxfYqcfSByeJjQqSK1OEhcdxCYtFWgTcU8x9Td5aQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoN/RWM2EMBdb0s2oDUrKvSCWxnmYqqyybdWtkCB+CWuke9cyrRIDcV/q2xAgtuUJOKBkVBywUiAhDuy/YEzM9+rY0qeOW8zCjk9NBEcTeiJHvD+lItdXfDNYpu2ap7vIdUOGDV1AzSnrM4rDI457p5LWHrSSVim6MruMeBxwp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlvKkHpU; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlvKkHpU"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4a483a552efso154250b6e.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785283733; cv=none;
        d=google.com; s=arc-20260327;
        b=pcJF9vyJoClWwITe2CUooNlNhdthH6vwX8nmY/4UzPwGD7xfp12EgRNvbIK2djxjix
         0f5g9W2/oLZCKfR2YtbFNkr2AE+BeHCn8+XHT9U/2yLdAyaed/8xE7WEacW60P6hZaRN
         ZCtEjY1eOlsq8xLAqTGSzbsc6RFVuEnVOGRrwLzyNIC7iMrRNhoP+i1G9hY2+Gt4yb6I
         EYdg9dl+xJRH0MVP9KX8kmTHRo5K7bEYS5OOY/pj9KV4ewY3Oq/ZNIizYaM94O3+atWe
         z7ARjj4Kyo/STUAqN6Wn8tLijp65j7nMRIebSPKaBq23ry6/JWFI7L+wxWBzVBdx+vFH
         3hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        fh=DqiBv8UHUl+xJbWkxWvmSKBPR4PV434Bi2Eo43RIPvY=;
        b=GEM7k+tLOW/s0W+iDLXFtVR2OtGJBGpcQoYIAr7NgxoP4c01CbUTHUYrEi3xfw4lMi
         6QfnpH+w5XzPGym6HVQVy7KIc3RLhlA/jXi2auN8HkTKAe59mzWP7J+U3i9t1H8aNFCI
         09Sc95tehpwWdEW9+bkPrgsJakolZU3kazvmR6FGYhvLDgbZ/SfXZn+PdmB7aiBMm0ni
         e/Hqjhd03e6z2Jjh3cWDU7gbhvGQDCvYSopCyfFY7A3djXtvbQ9rPONKVMSSkYZil0Kq
         ERorO+gOwCZeTMzIw0YxsOBQhLwSx7IPbiMksWdhT4aFDwpHOuFvLp3W7RGSlCmWmEuo
         LaqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785283733; x=1785888533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=PlvKkHpUFhBkE3JglxXMHHFFM6lJSixpSMG+mZUpfJicsDLxKtamyylms3+ivWZ2sg
         Hu3gNOjDzvWdSpDUJz96XVBpz3dbs8q/9x3wGeT/WVftfuEBEslPnYQ0YB88pTtsIg//
         i74ioDsCqkltbZK4R+qf78wBH49fHV/w0LWfI1K3zVZpEd2aqsRx94CAUhk31dO0u6S+
         RlsyNa8OHdePeUW13Url369+slsgPL35z2AhBbbmwHqBxnizLgr1sGFmwwUXImo3xBDk
         8OA2Ecqb4OtKUOm4ictkoWKxsRKuKp2ExFjS8yALtN5x4MfaEWYaGgdckTTQQ3NkolSJ
         o5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283733; x=1785888533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=I1eaqy/7QXYK866xZH4KZeFa+9wEnovxiCx4QCtFxc2JLKBwLGd76mqhwkkIR3xnEU
         9Na0U5EwUyMESqwv6J8nb8pASI3t4eoOpsVA/BJwRUrkIdHvoVIK2/AvFLH7vTAQj19n
         KPJYtJr4mLBahDXSp8o0x50MwufBVtl0YePqDKCgcm6T148RcqSLunynbd1d+YjLp8lJ
         uBKhZkuihLpqCHBzZZ8fQWkUbmMBkJxmfda9w02dNa0q2qhqb7j9OpbwNco3PrwnWHRZ
         hHCW07fcMKgZJSkUaiSLOMJ+uLH9CEw2vNWGvLjF2FaH0WrENjVadACV+4VIJrDTQRxW
         b2QA==
X-Forwarded-Encrypted: i=1; AHgh+RrHi8Wm9i2SeBDcBr0yZhQFIK+PgAjjR6uM8L6u9oLXwFVvlHUIGE3RnVhCY2TLJLcgkO6w1MvDCUR3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6M8DxOfYxwTb4vWFPcxVd5zS90yuungqwFDD4f76eZRsSnZfS
	b2HEA2H0jWTVWQPCsWaZHM4adIuTzon7knnr8IhTjzZgXVMswKRhEydwZ/MO5wic5ekcLspRn2a
	3KjKlhyCISCNP4429hlzdcxHxYWJpmV0=
X-Gm-Gg: AR+sD10lii60FxeMuH4TtCPp/dWZxXlm1cAbH4meTs9hqhfRIv53fIw1rX3MNZJw5dy
	yxVqMNwMjY3wRB+xazTwN7mfS7973LscN3/i4f0j9ArBZJjy6rqNz7e/BkrCQVWTZ86ixHg511I
	JSIg9KJTKyAqITfRGtnY873+Fv9YH2xVrZl4usOjsUak5e2rl0KVsFasRQW1xZYA4Jjb8DwE8ch
	LsVtbJKdyDekFykQydHjHeR23cxz818/wM059fLyz5LN2SQN4/8WaFTvO3r5YF9jFBUM97FAT8m
	Y/+nfJBk1vOZxTKf1/rddwfV77Q7Yk6Pf1VTl8TdRIVW6rSeSzM4v8TNNc84uNGCVNXUSeQgva7
	xhnH9dx6S+xY0tQ==
X-Received: by 2002:a05:6808:220f:b0:496:2b3:ae71 with SMTP id
 5614622812f47-4ad5b9cb9dfmr3003896b6e.18.1785283732989; Tue, 28 Jul 2026
 17:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
In-Reply-To: <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 09:08:40 +0900
X-Gm-Features: AUfX_mxJyiSm31bWY5a0snpvZu7asEtmvztGs1v4_zBGPb9VpXQsQKFqM4tmGnM
Message-ID: <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Thank you for posting the v4 series.

I tested the complete v4 series on my MT8173 Chromebook, but I am
seeing a GPU device loss as soon as Mesa initializes the Vulkan device.

My current setup is:

  Board: Google Elm / Acer Chromebook R13 (CB5-312T)
  Kernel:
    linux-next next-20260727
    commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
    (next-20260727-5-g33d6e5134c70)

  Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+

  Mesa: 26.1.5
  vulkan-powervr: 26.1.5
  Firmware:
    rogue_4.40.2.51_v1.fw
    SHA256:
    f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2

All five patches applied cleanly. The PowerVR driver probes, loads the
firmware, and creates the DRM render node successfully.

However, when I run the following from an SSH session without GDM or
another graphical session running:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

Mesa prints the expected GX6250 warnings:

  Missing reset support for brn51764
  Missing reset support for brn58839
  Missing support for brn62269

The command then hangs, and the kernel reports:

  powervr 13000000.gpu: [drm] *ERROR* GPU device lost

There are no additional timeout, MMU fault, firmware, clock, or runtime
PM messages immediately before the device-lost message.

I originally also observed the same failure when GDM started GNOME
Shell, but reproducing it with vulkaninfo from a non-graphical SSH
session indicates that this is not specific to Mutter or GNOME.

Since your cover letter reports that vkmark and glmark2-es2-drm work
with Mesa 26.1.5, I suspect that there may be a difference in the
kernel configuration or another part of the test environment.

Could you please share the following details from your working setup?

  1. The exact Chromebook board/model used for testing
  2. The exact kernel base commit
  3. The kernel configuration, or at least the relevant DRM, PM,
     generic power-domain, IOMMU, and MediaTek clock options
  4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
  5. The firmware SHA256
  6. The kernel command line and bootloader used
  7. Whether `vulkaninfo --summary` also completes successfully

My current relevant configuration includes:

CONFIG_PM_SLEEP=3Dy
CONFIG_PM=3Dy
CONFIG_PM_GENERIC_DOMAINS=3Dy
CONFIG_MODULES=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
CONFIG_DRM_POWERVR=3Dm
CONFIG_DRM_MEDIATEK=3Dy
CONFIG_SYNC_FILE=3Dy
CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
CONFIG_IOMMU_SUPPORT=3Dy
CONFIG_ARM_SMMU=3Dy
CONFIG_MTK_IOMMU=3Dy

I would be happy to test additional patches or provide any further
logs, kernel configuration, or debugging information if that would
help.

Thanks,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del Reg=
no
<angelogioacchino.delregno@collabora.com>:
>
> On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >>
> >> I trust that you'll make the binding get into linux-next before it's t=
oo late.
> >
> > Rob beat me to it. :D
>
> Love it!
>
> Thanks Rob :-D
>
> Cheers,
> Angelo
