Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3683D3D02
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224850; cv=pass; b=qxuxtsDbL2krTkVn8ipo8vsCxJULl6lDhlxpyObwz+1jPNayGaclbJi20V5FlUt7TSTDt3U++yuqIJ+R+lSIMiQP+L2dwCIefOZgnl2e77jfjbg2saJGMtQrIUiSiFz6HSZQUpvtnAdiNmcvLf/OB9+C8kqSrtkmUHokFcIExpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224850; c=relaxed/simple;
	bh=jFRvdALDo5fFsKxjY7tzVZXhmkoO0GugEh8NvOGDMRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCsOZuKgawDNiUVujAYneKu7/0IsFuOn8Bia7qP79p1HxapvBXp0XcDxWC1lq3YKR5H4ej3X2Ms69LTYG/dzaIY5EeKeqCaOsC7lU4AAG/0St50JDd/ty9NxRyPryIM5OZegPD1ryJN994JSYFEY6lirkZoGnW3JJN1Cilfjslg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxBE1a/O; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxBE1a/O"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6b5737bb2so3798350a34.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785224847; cv=none;
        d=google.com; s=arc-20260327;
        b=aLcOQ5F2ym31d4eCe+JROFwYmFr7WGJMA/Oo4u7d0I9jqr+D/xrL33LVcT8ykupj9p
         neDyX6UD08V3IanrKiuoUBRwnwMJRjso06Z28EilD8DF0+IfkfJIiOe2/y08q3gTHrzE
         8NtUESBokq1+Wmg2GBKFFw7DmXByc5TiUuZWHF6bKYS2/kd+SePjDfSq9A4Zc2mvR/Ai
         NnCaAjYfabbDQXkFqh4DMF4+oarHVOJC9W06+7sHCF9b2X0sQypNwbw22zUPTyTjploB
         uwk0fJZofdNvcG4waL5j5+mrATXm56wHRV978wRpnHQVIrogM0ivO8XE03s6px4MPBxR
         Ljuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GvSDrArFihkcvCKtXqCukbCZkd2fZ5Ks67ZlmWgjtZU=;
        fh=MKtfEkN81Xy1bScmM+SIkctqjjPH18uSMruigw9Cm+4=;
        b=qvgqPbfLGpqASQKl3UXLhH6KaAtwnwhzGyKjD4ZeiPqTWFrndFzjf4OKouYTgcSn25
         Ls4GYjBZY0Ui5V7S6ryZR4QxyHut0C6x7cp2g50k9BQQb6K4mzXNkv9IwbeKf8WJt32S
         1A7z/9iH/G17uVURZ21HLnolW0/mMRD2BmyRVeCMZBD9TpFmYeCE5J0HkgFrgULuqlPD
         OmTWOh9s3IMqjvxX6y5cmMfStCT3O+PVDg0bTQRS8aVwvvVf06VR+QwFMVX9772HYUT6
         86SQvRnwTMOUFs/Z2fkZjh0CuK7t7QpFw2W3AzA/p31P7NOF1OpIW5qi7Mjud4hPdj4q
         NwHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785224847; x=1785829647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvSDrArFihkcvCKtXqCukbCZkd2fZ5Ks67ZlmWgjtZU=;
        b=fxBE1a/O6ZGVVKkHTCxfuwqf990FvkAeBZVDkPzRC2hEW9EstabHo3aKdvLm7fpDbe
         JHwmhW2mPi3RIqZfbnm6MGHmIMoQQ4SeMh3A3op5u6ulwHLwerACcEax6CA2vIFMgH+N
         GN4ZpGpF38rTuV3mAVudcgGTpPhm9sigaF1Fnz8tcPToHMLY8piLgeOUbagoeIg6z6CT
         f/N83J5YMQWPiy8ljx/CBwniR6Gi+/vZbHYHq47b2ia1Gh19EWJAXYGLFbisXKFYeZUK
         uL7ADLoQZRbFAwkBoKiZ6m9gW33KuIyLq7WUrBrXQBisey0DV5BpDJIIFFQaNDoDUhzJ
         lqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785224847; x=1785829647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvSDrArFihkcvCKtXqCukbCZkd2fZ5Ks67ZlmWgjtZU=;
        b=C6O9w7kRyg1sOc30cjrTcLZo8GTWZSiOBuAbEbG12DXyC5aePzxyls7cPvsripRlED
         nX14y15XGJ2e5UVlFB7nWWJJf/01gQPSUOfKRcgW0tCycAEzcS+haCwQiRId6uW3fry6
         0xRjyVG/o2i8mC04EKauLv3wL1mqtKzY8c6/c5nidu03e0jEIhTX2/KwvroVWekxYSJY
         0RyysdrVZV4PeAXSdkrByKMkTM+8RIOwBkIKfthMZ96mVEyddehXPSCgoqo+BNmVwKfX
         F931NQ8MCvBEFznsQ6S+7MhnOZQdtdpr69KSAvrn0Wxc4FEYZfYpQXQxIqu5iybI6iOX
         bFJg==
X-Forwarded-Encrypted: i=1; AHgh+RqRQZQVUQWDWb9KznSjC0d/usJDgvKnyU22GOCUbQtSucq2lm3MdChgu0fo4kjsizA0xNCDdz7KOeZS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp1c4EpJYZPK3mAFvuY5ibcu+/cklqLdNppBCrs/AfAGl5PQSf
	sMyf8eGZ87oSeOXD9MNsVkPEsGuhMdOKFAkO5WlsG8CPMlsC2uY/mtKRGOpDtWmuQHlUTKJkZXQ
	9oXqI/WWY4Q87+v96L8rRrvY7Z5tZzgQ=
X-Gm-Gg: AR+sD12chBj4e69IbcoID34WntWezzFimvCcpk4QafyCKRM0eIKqWGfCfW7FYVVA8Du
	epC/vdyQaNfjma9KZgKYualjuQypD7V0awkoXPDO0Xt1kkMpLNsFcFR7j05r/WltIqQcADQzkQs
	LxVClSLR+gj325z0AgJOAHL0FqMrzUUnvpraKoLKNi9cc8es6fnNi/kB/pxVEh56FmWeBevkGlu
	Th0gz+XnIRcs7ARbc8eQ2HLyPadvxfcm4v/yrsbT2d2WKE24yn1sxfG6k2unsxqJ64RBTLFN+ht
	qxms7uQ1doIyThG3B8C+8ks0IHht4A==
X-Received: by 2002:a05:6830:7309:b0:7e9:adef:4fd4 with SMTP id
 46e09a7af769-7effef66a20mr1250145a34.11.1785224847196; Tue, 28 Jul 2026
 00:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727091555.1023910-1-wenst@chromium.org> <CA+m4KrCkk_p213=JVVcuxjvO2tCREw7_mL596xu-RWJ0Dz3p5w@mail.gmail.com>
 <CAGXv+5HXf9U6CdMudVkrWL_62jktW6jYQvtrjAFGc=+UnoKQXA@mail.gmail.com>
In-Reply-To: <CAGXv+5HXf9U6CdMudVkrWL_62jktW6jYQvtrjAFGc=+UnoKQXA@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Tue, 28 Jul 2026 16:47:16 +0900
X-Gm-Features: AUfX_mxyx2qeDVnTVSDo_LY0bWU_51Hewgc7AQz54UsBBlH4uRRKFFV95aTgqR8
Message-ID: <CA+m4KrCnZQW4WqTrKwCAvnwh2YCmObMmvtjdc=HDy5N+RiGm=Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello ChenYu,

Thank you for the clarification.

I understand that the "vgpu" regulator entry is unrelated, and I will
exclude it from further investigation.

I also noticed an important issue with my earlier "clean boot" test:
although I had not manually started vulkaninfo, the system was still
booting the graphical target, so GDM/GNOME had already accessed the
PowerVR Vulkan driver.

I repeated the test in a true console-only environment. In that case,
the PowerVR driver and firmware initialized successfully and the GPU
remained alive until I manually ran vulkaninfo. The GPU was then reported
lost approximately two seconds after vulkaninfo entered the
vkCreateDevice path.

However, this was still tested on Linux 7.1.3 with the MT8173 v3 series
applied. I will rebuild and retest on top of next-20260727 as you
requested before drawing further conclusions.

Thank you,

YoungJoon Lee

2026=E5=B9=B47=E6=9C=8828=E6=97=A5(=E7=81=AB) 15:37 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> On Mon, Jul 27, 2026 at 11:49=E2=80=AFPM YoungJoon Lee <getfeus@gmail.com=
> wrote:
> >
> > Hello,
> >
> > I tested patches 1/5 through 5/5 from the MT8173 PowerVR v3 series on
> > an Acer Chromebook R13 (Google Elm), which uses an MT8173 SoC and a
> > PowerVR Rogue GX6250 GPU with BVNC 4.40.2.51.
> >
> > For clarity, I applied the five actual patches numbered 1/5 through
> > 5/5. The 0/5 cover letter itself was not applied.
> >
> > Kernel:
> >   Linux 7.1.3-stb-cbm-pvr-v3
>
> Please at least try linux-next. There's around 30 patches for powervr
> between v7.1 and next-20260727, 15 if you count from v7.1 to v7.2-rc1.
>
> > Relevant kernel configuration:
> >   CONFIG_DRM_POWERVR=3Dm
> >   CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> >
> > Kernel command line:
> >   powervr.exp_hw_support=3D1
> >
> > Firmware:
> >   powervr/rogue_4.40.2.51_v1.fw
> >
> > The driver probes successfully, loads the firmware, and initializes the
> > DRM device:
> >
> >   [    6.110569] powervr 13000000.gpu:
> >                  [drm] Running on unknown hardware; expect issues.
> >   [    6.117454] powervr 13000000.gpu:
> >                  [drm] loaded firmware
> >                  powervr/rogue_4.40.2.51_v1.fw
> >   [    6.118010] powervr 13000000.gpu:
> >                  [drm] FW version v1.0 (build 6476056 OS)
> >   [    6.122992] [drm] Initialized powervr 1.0.0
> >                  for 13000000.gpu on minor 1
> >
> > The following DRM device nodes are created:
> >
> >   /dev/dri/card0
> >   /dev/dri/card1
> >   /dev/dri/renderD128
> >
> > However, on a clean boot, without manually running vulkaninfo, vkcube,
> > or another Vulkan application, the driver reports that the GPU has been
> > lost approximately six seconds after DRM initialization:
> >
> >   [   12.084078] powervr 13000000.gpu:
> >                 [drm] *ERROR* GPU device lost
> >
> > The relevant boot sequence is therefore:
> >
> >   [    6.110569] PowerVR probe begins
> >   [    6.117454] Firmware is loaded
> >   [    6.118010] Firmware version is reported
> >   [    6.122992] DRM initialization completes
> >   [   12.084078] GPU device lost
> >
> > The unused-regulator shutdown occurs considerably later:
> >
> >   [   31.712124] vgpu: disabling
> >
> > Therefore, the later "vgpu: disabling" message does not appear to be
> > the immediate cause of the device loss. The GPU is reported lost about
> > 20 seconds before that regulator shutdown message.
> >
> > After the failure, regulator_summary reports:
> >
> >   vgpu  0  0  0  normal  1000mV  0mA  700mV  1350mV
>
> This is unrelated. This regulator output is _really_ unused. "vgpu" is
> just the default name on the PMIC.
>
>
> > This output was collected after the GPU had already been reported lost,
> > so I do not know whether the regulator state was different during probe
> > or immediately before the failure.
> >
> > The PowerVR-related clocks appear enabled in clk_summary:
> >
> >   mfg_26m       26000000 Hz
> >
> >   mem_mfg_in_sel
> >     rate:       455000000 Hz
> >     enable:     1
> >     prepare:    1
> >
> >   mfg_mem
> >     rate:       455000000 Hz
> >     enable:     1
> >     prepare:    1
> >     consumer:   13000000.gpu
> >     clock name: mem
> >
> >   mfg_sel
> >     rate:       455000000 Hz
> >     enable:     1
> >     prepare:    1
> >
> >   mfg_g3d
> >     rate:       455000000 Hz
> >     enable:     1
> >     prepare:    1
> >     consumer:   13000000.gpu
> >     clock name: core
> >
> >   axi_mfg_in_sel
> >     rate:       208000000 Hz
> >     enable:     2
> >     prepare:    2
> >     consumer:   power-domain@7
> >
> >   mfg_axi
> >     rate:       208000000 Hz
> >     enable:     1
> >     prepare:    1
> >     consumer:   13000000.gpu
> >     clock name: sys
> >
> > I also installed Mesa 26.1.5 and vulkan-powervr 26.1.5 and tested the
> > Vulkan ICD with:
> >
> >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
> >   VK_DRIVER_FILES=3D/usr/share/vulkan/icd.d/powervr_mesa_icd.json \
> >   vulkaninfo --summary
> >
> > The PowerVR ICD was found and loaded. Before hanging, Mesa printed:
> >
> >   WARNING: powervr is not a conformant Vulkan implementation,
> >            testing use only.
> >
> >   FINISHME: Missing reset support for brn51764
> >   FINISHME: Missing reset support for brn58839
> >   FINISHME: Missing support for brn62269
> >   FINISHME: Devices without tpu_border_colour_enhanced require entries
> >             for compressed formats to be stored in the table
> >             pre-compressed.
> >
> > The vulkaninfo process then remained in uninterruptible sleep:
> >
> >   PID   STAT  WCHAN             COMMAND
> >   3244  Dl+   synchronize_srcu  vulkaninfo --summary
> >
> > It could not be terminated normally while in that state, and a reboot
> > was required.
> >
> > However, the clean-boot log shows that "GPU device lost" occurs even
> > without starting vulkaninfo manually. The vulkaninfo hang may therefore
> > be a consequence of the GPU already being in the lost state, rather tha=
n
> > the original cause of the failure.
> >
> > At this point, the following parts appear to work:
> >
> >   - MT8173 GPU device-tree node probing
> >   - MFGTOP clock registration
> >   - PowerVR kernel module probing
> >   - Firmware loading
> >   - Firmware version reporting
> >   - DRM device initialization
> >   - Creation of card1 and renderD128
> >
> > The remaining problem is that the GPU becomes lost approximately six
> > seconds after initialization.
>
> Sorry. I'm not seeing this on my device. I'm running the patches on
> top of next-20260727 this round.
>
>
> ChenYu
>
> > Could this be related to an interrupt not being delivered, firmware
> > heartbeat handling, reset sequencing, runtime PM, a missing regulator
> > consumer relationship, or another MT8173-specific power-domain
> > requirement?
> >
> > Please let me know which additional kernel debug options, DRM debug
> > settings, tracepoints, interrupt statistics, register dumps, or test
> > patches would be useful. I have physical access to the device and can
> > build and test further kernel changes.
> >
> > Thank you for working on MT8173 support.
> >
> > Best regards,
> > YoungJoon Lee
> >
> > 2026=E5=B9=B47=E6=9C=8827=E6=97=A5(=E6=9C=88) 18:16 Chen-Yu Tsai <wenst=
@chromium.org>:
> > >
> > > Hi everyone,
> > >
> > > This is v3 of my MT8173 PowerVR GPU support series.
> > >
> > > I got another inquiry on the status of this patch series, so I though=
t
> > > I'd dig it out, fix all the issues and send another version.
> > >
> > > This time around Mesa was ready for basic testing, using both vulkanm=
ark
> > > and glmark2-es2-drm (with Zink). Details below.
> > >
> > > Changes since v2 (all in the clk driver patch):
> > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > >   - Needed since the driver implements PM domains using the generic P=
M
> > >     domain library, which also depends on PM
> > >   - Fixes build breakage (kernel test robot)
> > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > - Dropped unused mfg_desc (Brian)
> > > - Added check of clk_prepare_enable()'s return value in
> > >   clk_mt8173_mfgtop_power_on() (Brian)
> > > - Saved error value for return in IS_ERR(data->clk_26m) branch
> > >   (Dan Carpenter / kernel test robot w/ smatch)
> > >
> > > Changes since v1:
> > > - Adapted to changed DT bindings
> > > - Dropped driver change
> > > - Use same power domain for "a" and "b" GPU power domains
> > >
> > >
> > > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > > some Chromebooks.
> > >
> > > This version is different from the initial powervr driver submission =
[1]
> > > in that it splits out the GPU glue layer support out of the powervr
> > > driver and into a separate clock and power domain driver. The glue co=
de
> > > is otherwise the same, and also the same as found in the ChromeOS
> > > kernels, with some extra comments and macro names added where possibl=
e.
> > >
> > > Patch 1 adds a binding for the glue layer, called mfgtop. The glue la=
yer
> > > contains clock and power controls for the GPU.
> > >
> > > Patch 2 adds a driver for the glue layer, implemented as a clock driv=
er
> > > that also provides power domains.
> > >
> > > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerV=
R
> > > binding.
> > >
> > > Patch 4 corrects the clock for the GPU (called MFG) power domain.
> > >
> > > Patch 5 adds device nodes for the GPU and glue layer to the MT8173 dt=
si
> > > file.
> > >
> > > The kernel driver successfully probes the hardware and loads the
> > > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies=
 [2].
> > > The "exp_hw_support" module parameter needs to be set for the driver =
to
> > > probe successfully.
> > >
> > > This was tested with Mesa 26.1.5 from Debian Forky. With this version
> > > vkmark and glmark2-es2 (over Zink) both run fine. Mesa spits out a bu=
nch
> > > of warnings since the GX6250 core is not officially supported.
> > >
> > >     # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vkmark
> > >     WARNING: powervr is not a conformant Vulkan implementation, testi=
ng use only.
> > >     WARNING: powervr is not a conformant Vulkan implementation, testi=
ng use only.
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:7=
3: FINISHME: Missing reset support for brn51764
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:7=
6: FINISHME: Missing reset support for brn58839
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:5=
23: FINISHME: Missing support for brn62269
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: F=
INISHME: Devices without tpu_border_colour_enhanced require entries for com=
pressed formats to be stored in the table pre-compressed.
> > >     WARNING: powervr is not a conformant Vulkan implementation, testi=
ng use only.
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >         vkmark 2025.01
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >         Vendor ID:      0x1010
> > >         Device ID:      0x6250
> > >         Device Name:    PowerVR Rogue GX6250
> > >         Driver Version: 109056005
> > >         Device UUID:    d04cd6f3a25fd4900f89c151bccfdfcf
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >     [vertex] device-local=3Dtrue: FPS: 251 FrameTime: 3.984 ms
> > >     [vertex] device-local=3Dfalse: FPS: 220 FrameTime: 4.545 ms
> > >     [texture] anisotropy=3D0:^C FPS: 223 FrameTime: 4.484 ms
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >                                        vkmark Score: 231
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >     # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
> > >     WARNING: powervr is not a conformant Vulkan implementation, testi=
ng use only.
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:7=
3: FINISHME: Missing reset support for brn51764
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:7=
6: FINISHME: Missing reset support for brn58839
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:5=
23: FINISHME: Missing support for brn62269
> > >     MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: F=
INISHME: Devices without tpu_border_colour_enhanced require entries for com=
pressed formats to be stored in the table pre-compressed.
> > >     Warning: DRM_CAP_ASYNC_PAGE_FLIP not supported, falling back to '=
mailbox' mode for SwapInterval(0).
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >         glmark2 2023.01
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >         OpenGL Information
> > >         GL_VENDOR:      Mesa
> > >         GL_RENDERER:    zink Vulkan 1.2(PowerVR Rogue GX6250 (IMAGINA=
TION_OPEN_SOURCE_MESA))
> > >         GL_VERSION:     OpenGL ES 2.0 Mesa 26.1.5-1
> > >         Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D24 s=
tencil=3D0 samples=3D0
> > >         Surface Size:   1366x768 fullscreen
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >     [build] use-vbo=3Dfalse: FPS: 49 FrameTime: 20.473 ms
> > >     [build] use-vbo=3Dtrue: FPS: 45 FrameTime: 22.660 ms
> > >     [texture] texture-filter=3Dnearest: FPS: 45 FrameTime: 22.642 ms
> > >     [texture] texture-filter=3Dlinear:^C FPS: 50 FrameTime: 20.172 ms
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >                                       glmark2 Score: 46
> > >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >
> > > Please have a look.
> > >
> > > Thanks
> > > ChenYu
> > >
> > > [1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.w=
alker@imgtec.com/
> > > [2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/=
powervr
> > >
> > > Chen-Yu Tsai (5):
> > >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> > >   clk: mediatek: Add mt8173-mfgtop driver
> > >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> > >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> > >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> > >
> > >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> > >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> > >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> > >  drivers/clk/mediatek/Kconfig                  |  10 +
> > >  drivers/clk/mediatek/Makefile                 |   1 +
> > >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 241 ++++++++++++++++=
++
> > >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> > >  7 files changed, 362 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,=
mt8173-mfgtop.yaml
> > >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
> > >
> > > --
> > > 2.55.0.229.g6434b31f56-goog
> > >
