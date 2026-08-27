Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202F43FD05
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832136; cv=pass; b=DSdThS9JWZ/XL2xVWjmY7WOW/N0uo5EOsHmsTXtKI8zF4SSjSixLaWLtzRLT/2J5yA4VcRO4TW5eCDmTTHwTrOvfv9IHBd6FZLvVH8p5mkCxSLOamL/5xOcfjqaIiml3D/UWFzEyA1BqR9AiO7CgOWqW/QvryvbxuM62apxIyz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832136; c=relaxed/simple;
	bh=xWQSpnEswW8SIEjwrK+aE2UD2+VqHJ2cQp8CJm8ZXQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7TC2KWsjFtJTvRPdbE7R9Tf1BNRlglhxw5Pida8lWFuG/1vL0Om8ja7QtSbMpFaIgpybH4zYj45z8l+ZCbO0utGurSIEPFiyrWdfVO8JaU0e9AWN7Bmd1FPzSrFo4JZ25oP0hICWwsxpDQdeBg4bNoXUaa8uQbchZu0TEEO2to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqP6mJV7; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqP6mJV7"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb787dec99so1866473a34.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 05:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787832133; cv=none;
        d=google.com; s=arc-20260327;
        b=G1iear5A53znnsrFFuieUpHweNVwNb6oGilT32QoIVLz/QDZaDP1YEKJRCFwQPJ3L8
         2UPRmJGWdm1icZkJ0NpxpmiZRkKiEvEkA+P/8zSpuoXm0VXeclyu1Y3AD0jroBnNsgHw
         hGYdG+WAK/bXfBOS/6E4Ddcahu5EsLpW6zvZeRoRY2pqxzHX5/jjhd1LmoyERnqWW80n
         s2wPhPWFLz+DxuKLgwipjtK90LwKFIAMx2GYCiVqfSuO2a2+Su4JZFHn5K/AbhVIP699
         9S32wuw3dkwX1jTohLV5DVi9FBphfaR+RoAHH/SEFiv2LPLQy2fAqHRJxN1QPKs98iB6
         +I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=;
        fh=BfsEWcPKxd1C/lCD1+gKls1QrGKidt14FwXVS7Jl0es=;
        b=qIi7W6DTvKpd+XbCG41ztX58Kvix625Z5vB7z8NWvd38xin2yyyz9gszrNvPMzZz6e
         G93wj0ewKfYYvq9ZOSszoO2hM+C/olME70qbc+8ryHfR6UqTYp5Q2MliR6hIOGMONc7C
         xFkgjtv3fRaj46FgGGwqVUmsun+tF6lk6IyRUnGFQ10KqJWrtgIB/m+tG112LZq+CxOe
         69sZOWRBgWW/y3gq6ZLPhBxdT313QSL1OIlaH8OvZ8DUjLOpudIa7xciJvBBiEzEQ08I
         OvoqZqTLx3GEG2JL3clWRB0USWwq8WjB0xm1zfkJ0YTaPIoqHXOfhZtQTZr6HL2LUXeO
         4CQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787832133; x=1788436933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=;
        b=KqP6mJV7/xLdtYHTZYrgyYLRCZzawia2gjDmZk1aSal/cj3XJOylsE6wRFu7GNPTqJ
         EHwKDoU9WrhUaBdzMd4y8EbTBEUPVRQimuOqCCrdNJodgSl6DeqQaX6qPbukrl0cXb3L
         1BpwOA/A8Y5EF+syKkM4cxNZDrbhiU0iCPEAAqIS39+jGktqem2TwzrDTMOTWW0bzRP1
         YwtgUbjypode7tztW4269PniQXn+dHIKMMJCnz6ffTENkGNXyfpPiqn/HKhKnSWldBss
         P8RDnXMZeW7dGcyCF7ZCwwd3JzxSFLvLIUwyft6PcVkO3MmgVlgyeeEvNgKRmpAAz/Li
         /FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787832133; x=1788436933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=;
        b=Y1jnk+xLSLuDk/q/DRVie+P83NI5kyUsPUFxhv3qfBFmK7XQkfxtWFsT7EC5UyMeew
         OmxM3NyxniTHk4FVBgvySzBXkvmzfea23D4gCpw+s8CkLgACYhoF6d3vr2bD/P5UJiFZ
         AdL0VwTL2ulhEcFnXxxyW1A7tl+CULxZKatsU/A1jzGs0pOv65P2bLnL/JyGk+PMpOxu
         N9EJzody2cIAQ5gVgdM1jem/K9DhBaA3Hvllpy5jZ8mUEbT8D4R5QZ1YDviUS6cJ5yKx
         3WMV80EJ3vdinxEl/hNj10UgLzuzWWX6LiWdVj0iFOVo3qddwE+FD2P+ueVqzvyARg21
         WaKg==
X-Forwarded-Encrypted: i=1; AHgh+RqOzS3mrWGabG5Bp9GoyET57KnNO5Mi9AGT0YQ40N9EGzwZq8UgQg015/sFIaVUDhnlGRVcqGOpdBaV@vger.kernel.org
X-Gm-Message-State: AFuF++liDzKEfbyHGerrIP4iXMca4nvnmP7qeHlBTV8mXgmDEwjqWHnU
	wytAnkUGYoXWL7Ue6wGojNo2VOBcUf3voEqaOh4bmWN0E6LAfivOrPhc+y8DNUHxygEiSMIj0Sm
	SBTSWBnyXrNplx8P5h2EbpEakdjjlRe0=
X-Gm-Gg: AR+sD11cd6LpfSmjs1J+aLhQFfoYlSkwEb2oGSB0WnDLkLEEmO/UXR8DUsgb2rZGB7U
	K0tODpCiPX+JO4brGysfAIfnINgfrlgsK8RoEpyZootEiQKwLTs/2FNl+aMtGnUHfhTxj48WwYy
	Twe/cP+RFd6Zsxt4zxo5cnIBmzwZMfTn9Z92IfHRS+vQEU35sKoArW8QeSgCrjkdKBwkim/LfRD
	dFUUHv55jGIH72OR4Mn+pYy+yiWgEJ0Ffsq2Q3AdeCU5veJrlI+yRKdhBQBk5B+xGIjEtqIjQ+u
	cMYxb9kdzt9ZUg2Q1aUiAfPk7NPYL70Oba1AKfjagLm9w8gGdEE8Q0sK+rThOCvpQOJYOocoKEM
	CEA==
X-Received: by 2002:a05:6830:82c3:b0:7f4:edd8:b7eb with SMTP id
 46e09a7af769-7f4edd8b9demr493222a34.6.1787832132894; Thu, 27 Aug 2026
 05:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com> <amswFn2qWkvypMH8@redhat.com>
 <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com> <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
In-Reply-To: <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Thu, 27 Aug 2026 21:02:00 +0900
X-Gm-Features: AcwNN1XpDElWizfeTEqW1-geIkvA_6UTkfh-v46rtV4U1JNftLGLCb82tOxCwhE
Message-ID: <CA+m4KrAOdFJRRzx8N1kK2LvLcfjG4Gx_pFmP7SsZjKUvU-0dTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: wens@kernel.org
Cc: Brian Masney <bmasney@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
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

Hi Chen-Yu and everyone,

A follow-up on my previous GX6250 hang report.

I retested the MT8173 GPU support on an Elm Chromebook using
linux-next tag next-20260826. The test kernel included the following
MT8173 DT commits:

9ab51bbb2813 ("arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clo=
ck")
33d6e5134c70 ("arm64: dts: mediatek: mt8173: Add GPU device nodes")

It also contained an unrelated local xHCI fix, which should not affect
the GPU test.

The resulting kernel release was:

7.2.0-next-20260826-stb-cbm-next-20260826-gx6250-xhci-fix1+

The kernel successfully probed the GX6250 and loaded:

powervr/rogue_4.40.2.51_v1.fw

The relevant kernel messages were:

powervr 13000000.gpu: [drm] Running on unknown hardware; expect issues.
powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.fw
powervr 13000000.gpu: [drm] FW version v1.1 (build 6976702 OS)
[drm] Initialized powervr 1.0.0 for 13000000.gpu on minor 1

I used powervr.exp_hw_support=3D1 on the kernel command line.

I also tested Mesa 26.1.6 with
PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1. vulkaninfo completed
successfully and identified:

deviceName         =3D PowerVR Rogue GX6250
vendorID           =3D 0x1010
deviceID           =3D 0x6250
driverName         =3D Imagination open-source Mesa driver
driverInfo         =3D Mesa 26.1.6-arch1.1

GPU interrupt activity increased during the Vulkan query. No new
PowerVR fault, timeout, hang, warning, or Oops was recorded by the
kernel during that test.

Most importantly, I completed the glmark2 workload which had previously
triggered either the pvr_queue_signal_done_fences() NULL done_fence
Oops or a complete system hang. This time the test completed, the
system remained responsive, and no PowerVR kernel error was recorded.

This is an encouraging result, but I cannot attribute the disappearance
of the Oops or hang solely to the MT8173 DT series. The new kernel is
based on a later linux-next snapshot and includes intervening DRM
scheduler changes and reverts. I am therefore reporting this as a
non-reproduction on the newer stack, rather than claiming that the DT
patches fixed the driver issue.

The clock, power-domain, and GPU device-tree support from the v4 series
worked successfully on this MT8173 Elm device, so for the series:

Tested-by: Youngjoon Lee getfeus@gmail.com

The expected experimental GX6250 limitations remain. The kernel still
classifies the GPU as unknown hardware, and Mesa reports the existing
BRN 51764, BRN 58839, and BRN 62269 implementation warnings.

I can continue testing newer linux-next and Mesa revisions on this
machine. If it would be useful, I can also try to narrow down which
change between my previous kernel and next-20260826 made the Oops and
hang disappear.

Best regards,
Youngjoon Lee

2026=E5=B9=B48=E6=9C=888=E6=97=A5(=E5=9C=9F) 2:50 YoungJoon Lee <getfeus@gm=
ail.com>:
>
> Hi Chen-Yu,
>
> A follow-up on the GX6250 issue.
>
> I ran the diagnostic test I mentioned in my previous reply, and I now
> have a reproducible system hang along with HWRT/free-list lifetime
> traces.
>
> I built a diagnostic kernel with temporary tracing around the PowerVR
> HWRT and free-list lifetime paths, and ran:
>
> PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
>
> The test was run from multi-user.target with no display manager running.
>
> This time glmark2 progressed past the point where it had previously
> failed, but later the entire system became unresponsive during the
> desktop/blur part of the benchmark.
>
> At that point:
>
> - SSH stopped responding
> - local keyboard and VT switching stopped responding
> - the system required a hard power cycle
>
> The HWRT teardown trace immediately before the hang was interesting.
>
> Normal HWRT destruction repeatedly looked like this:
>
> dataset-release
> -> HWRTDATA cleanup data=3D1, err=3D0
> -> HWRTDATA cleanup data=3D0, err=3D0
> -> free-list release slot=3D0
> -> free-list release slot=3D1
>
> For the last HWRT visible before the machine stopped responding, the
> trace ended at:
>
> pvr-hwrt: dataset-release hwrt=3Dffff0000c0c62800 ...
> pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D1 err=3D0 ...
> pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D0 err=3D0 ...
>
> There was no further PowerVR trace before the system hung.
>
> Therefore, I do not think I can conclude that the free-list reference
> counting itself is the root cause.
>
> What I can say from this instrumentation is that both HWRTDATA cleanup
> calls returned successfully, and the trace stopped before
> hwrt_fini_kernel_structure() reached its first free-list release
> message.
>
> The tracing is intentionally verbose and may affect timing, so I do
> not want to over-interpret the exact failure point.
>
> I have the diagnostic patch, the full kernel log, the HWRT/free-list
> lifetime trace, and the glmark2 output available.
>
> Would it be useful for me to send these to the Imagination/DRM mailing
> lists now, or is there a particular person or list you would prefer me
> to report this to?
>
> If there are specific additional tracepoints you would like around
> hwrt_data_fini_fw_structure() or hwrt_fini_common_fw_structure(), I
> can build another diagnostic kernel and reproduce the issue again.
>
> Thanks again for taking a look.
>
> Best regards,
> YoungJoon Lee
>
> 2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 21:38 Chen-Yu Tsai <wens@ke=
rnel.org>:
> >
> > On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > > Hi Angelo and Chen-Yu,
> > >
> > > On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno =
wrote:
> > > > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Reg=
no
> > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > >
> > > > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney=
@redhat.com> wrote:
> > > > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrot=
e:
> > > > > > > > > Hi everyone,
> > > > > > > > >
> > > > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > > > >
> > > > > > > > > This time around Mesa was ready for basic testing, using =
both vulkanmark
> > > > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > > > >
> > > > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > > > - Added missing of_node_put() in remove function
> > > > > > > > >
> > > > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > > > >     - Needed since the driver implements PM domains using=
 the generic PM
> > > > > > > > >       domain library, which also depends on PM
> > > > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) b=
ranch
> > > > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > > > >
> > > > > > > > > Changes since v1:
> > > > > > > > > - Adapted to changed DT bindings
> > > > > > > > > - Dropped driver change
> > > > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > This series enables the PowerVR GPU found in the MT8173 S=
oC, found in
> > > > > > > > > some Chromebooks.
> > > > > > > >
> > > > > > > > I'm making a pull for Stephen for the clk changes. Should p=
atches 1,2,4
> > > > > > > > go through the clk tree? Patches 3,5 go through the DRM tre=
e?
> > > > > > >
> > > > > > > Only patches 1 and 2 should go through the clock tree.
> > > > > > >
> > > > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants=
 to pick up
> > > > > > > DT binding patches. Otherwise I can push patch 3 through drm-=
misc.
> > > > > > >
> > > > > >
> > > > > > Not sure if I can really take the DRM bindings patch through so=
c.
> > > > > >
> > > > > > I will take the devicetree ones exactly right now, even though =
it's going to
> > > > > > give warnings.
> > > > >
> > > > > Apologies for missing this, but the first DT patch depends on the=
 clk DT
> > > > > bindings patch for the clk ID macros. This is causing build error=
s in
> > > > > linux-next right now.
> > > > >
> > > > > Not sure how we can fix this right now.
> > > > >
> > > > > Brian, would it be possible for you to split out that patch into =
a
> > > > > separate immutable branch for Angelo to merge?
> > >
> > > Yes, I can split things out and make an immutable branch this morning=
.
> > > But it sounds too late for that.
> > >
> > > > >
> > > > > Otherwise Angelo might need to drop the DT patches until the next=
 cycle.
> > > >
> > > > Yeah, that's so bad.
> > > > I'd be happy to be able to resolve this, but it's too late on my si=
de.
> > > >
> > > > I should've checked the DT patches more carefully, my bad: I got a =
bit too excited
> > > > to finally see this PowerVR stuff working on MT8173 and going upstr=
eam.
> > > >
> > > > Sadly, I have to drop the devicetree patches :-(
> > >
> > > Chen-Yu: Could Angelo add an Acked-by to the three patches, and then =
I send
> > > Stephen an additional pull with just those patches? Do you think he'd
> > > pull that?
> >
> > (replying from my @kernel.org address again because I don't feel like
> >  pulling out my work laptop.)
> >
> > I think the question is whether the soc & dt maintainers would be bothe=
red
> > by it or not.
> >
> > No need to sweat over it though. It's not like the GPU driver is produc=
tion
> > ready anyway. We can just merge the DT patches in the next cycle. :)
> >
> >
> > ChenYu
