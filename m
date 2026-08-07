Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3D233933
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786125063; cv=pass; b=AE6dDAmGDQP8Nm8iGZQP5TwGeT6pLv8JW961kD1ebG+EIV6CHQha586ogZIL96XsEVHqWf6eRsoo2rHwaxRO4LX59NMvgs8CmdRB7lhEZvJOAC4ZIedjHOhNcCURLZSqnkFr4e/O0BMgw9J1+gF/Pj2KVJ1eX5gHtWUsNmYrrGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786125063; c=relaxed/simple;
	bh=Y5Eon8RQ+CcJu2x/PUMS0016ahTcxgHY4XXYlHwteqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUxVkEbcwLcYeaWritXvkBTVDGXVORh/C1iamohxEB1fb65aMbsKc5CA7UkUIrOvK2h0R+ZbonN6FMBFBU2ge0YzYcBLf+OCt4tMSKUDL+he6eWbFbPMwaNIR/L0NiruZFv1wpccx5SZ85me+D19Fu9aadYmi58cuGQo2iEDQPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzSUqHmK; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzSUqHmK"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aeaaef491cso1113474eaf.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786125061; cv=none;
        d=google.com; s=arc-20260327;
        b=eQoS62Gl95ipvPuhEY12Bu0Ur5yZC6h+d8teSwrLTdissp48QN8wWKWomKCZdw6WZA
         rNa1+UOdjGEyOVNToO0a4pXMj6z5YA2bbYt7AFWsLDnvau/QbyjbDLlvuHJoXd1RVDz9
         jBmp3BKDmx48E1gC64L6hH186yvYzt3nFx0YdZU9KUJ2XOe8UUZHyMWNeVqy3YeSz1kL
         8Qp0srw+ghPjW8hK/i3T0285PJcltELQdQ6YKs6AoTtFRZ2Nw0z/8sxyiIb2c0YuphvV
         bSCLDJKDoAjROP9Sh1CsYr7xPxWfJi9iRf7eHj1NSEAItY+EkiBMEDLg+lUNQ8DQIyAP
         GrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        fh=KRfACPfO7ZNREt8541yII44h4k86MjkCVmwUQ3fxPhM=;
        b=HbdBzPxvJDITX+CvmJ22eq0Hg2sLUX/k6GxdtnpzTNuUgcpjrHQnV+JUEybKoMB7sE
         l/MvtJN170wcc8Cf0yYETpMTwNiiJAA9Iv3bdpljeN41PneEr+2i5kvnBbNLHb44L7pa
         E+ZAFvYqvRScPEAHuKFCLVhBGe2GoLiyr5GCAZs9Mtsib5nPCG3RwpFMnwJONQ8OjpYp
         xir5hT9iknAuFmSLquwvR4BteRLBugwzWlti3GNZ+qTwMTusFRaMoiMqMn5/+ugjHOls
         3JARDzqUAcWcDKrQlrZnlkZUZGSo+Wzzc1DbfxTq7s1JgeYMpHWXUUrxi/q+s8MzHwsq
         wqHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786125061; x=1786729861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=ZzSUqHmKQ6sEQsyN9xlL1nxZho267zJrmmdM5+PGGpOCYwfR3Zgt58Gxnc8bh7S2Nr
         sxDzDg2SaFGQ5rRSiF7iac8em6MH4hGbbTcXjL8AoRDv8Qrj23eWXSZcrKHFxK9v9LDk
         HG82IiPn+Nl0Tala1Iy2Oz8pfRlGhgfpbbqKh3rz3chEeBYdBL0tYqV83tWKmz6WVgNo
         CZnVDPD13T5Z9AYbOk29yhek6dLq0xPj4/ygHqzNXCPODZhckk7osvcaIv1qttM50POs
         xwJ28mBS79XA7CZ3sSk5FqIF8GhkaEYkAEr2zx3b2LIvEpI84qvZ7P4P4Z3QN8ony1KH
         Jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786125061; x=1786729861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=QdFG2q+Ssr+z+YtJc5dn7vH1i3dKqL4oxy16QVwvC2g0cCHcCqglOLw7+Woi0XtV2v
         9q02v01KStAYVhKM4kcHs+45ODsXm/+la8IIKP451bpst05TC2vENwTsU8a8525de53q
         GN6zKPLinJ/5a7hL3nlzvS9K6vptrDxKtLFer4XEKLBpTbe80sNJ/deKsoaJ5BupqiaU
         FJX+1Tkn8cUF1KXwWQcrFO0mnruJW4bdNcbU0LEatRoHERgHIGgZd3a4UWM8bkwdCCwm
         fsCkiTHTYAVf7sEEWoMdAglBGt9eeJYrkCWsyO57oHzNfRJ/GjlPv6EfikEv2yujqCE6
         GhOQ==
X-Forwarded-Encrypted: i=1; AHgh+RooPor9wgAvqJPI+4qh0DtQd/2yrs7V0Vj21TNBBAaa+mhLyDjBsFt9YmEHKJ5QcE1s0dxrxTQ7lZPm@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfExwpy9xIBxM4bM1m0/NxDMszLy77yKUbennKOa3nc0vAfSu
	LWfYK7J4LGOmbYvfDmv93+IR+sKr6qNzsusGTF0feR2fI6lAT5v1QeGyW9UzLM+v+Kc2NMJRZXC
	TGfjQdE6LpUadC+d3lhv6Vf4JjdfNVGs2XTXLdW0Miw==
X-Gm-Gg: AR+sD139R0xLv5K8/wP75tQllEiPDBnGRf+9wKdE6PAgbm4qNGjdYCoCvq4SdG8s7ME
	S67MIebLxv5Dzqouluz9nyctXEEiHQBWFqu3aqiXSUEwuaTAsAwvKCK5o0CSx12L4BoA1CKy2H2
	xwhjMS4+Im2WikcQ7q4YValglI6R40qvJAauJYNVNU86Bzzly9wHURKi4pAfsnb3TU89QyRxEtg
	VcD+aPXji6edL+xECYStJ4FMF+86d/tQx96Eng2WqQ6w51pru2NXYdVDO1hzg7NVckc2TgEEGKP
	gm9phRtzxEfbm/eWO/aQMlkbxmEQdsBIsxX9v6MGg92mJANT3VbMGgludXN52Wfa0rPVYiqF5t0
	rrA==
X-Received: by 2002:a05:6820:811:b0:6b0:40d9:8ac6 with SMTP id
 006d021491bc7-6b041f594b5mr991109eaf.9.1786125060721; Fri, 07 Aug 2026
 10:51:00 -0700 (PDT)
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
 <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
In-Reply-To: <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 8 Aug 2026 02:50:47 +0900
X-Gm-Features: AUfX_mw5H1veunrAd0DWILURr17Bo7nhldWDJMLG41xotTB7eMODtkVZIaJFjgA
Message-ID: <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
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

Hi Chen-Yu,

A follow-up on the GX6250 issue.

I ran the diagnostic test I mentioned in my previous reply, and I now
have a reproducible system hang along with HWRT/free-list lifetime
traces.

I built a diagnostic kernel with temporary tracing around the PowerVR
HWRT and free-list lifetime paths, and ran:

PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm

The test was run from multi-user.target with no display manager running.

This time glmark2 progressed past the point where it had previously
failed, but later the entire system became unresponsive during the
desktop/blur part of the benchmark.

At that point:

- SSH stopped responding
- local keyboard and VT switching stopped responding
- the system required a hard power cycle

The HWRT teardown trace immediately before the hang was interesting.

Normal HWRT destruction repeatedly looked like this:

dataset-release
-> HWRTDATA cleanup data=3D1, err=3D0
-> HWRTDATA cleanup data=3D0, err=3D0
-> free-list release slot=3D0
-> free-list release slot=3D1

For the last HWRT visible before the machine stopped responding, the
trace ended at:

pvr-hwrt: dataset-release hwrt=3Dffff0000c0c62800 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D1 err=3D0 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D0 err=3D0 ...

There was no further PowerVR trace before the system hung.

Therefore, I do not think I can conclude that the free-list reference
counting itself is the root cause.

What I can say from this instrumentation is that both HWRTDATA cleanup
calls returned successfully, and the trace stopped before
hwrt_fini_kernel_structure() reached its first free-list release
message.

The tracing is intentionally verbose and may affect timing, so I do
not want to over-interpret the exact failure point.

I have the diagnostic patch, the full kernel log, the HWRT/free-list
lifetime trace, and the glmark2 output available.

Would it be useful for me to send these to the Imagination/DRM mailing
lists now, or is there a particular person or list you would prefer me
to report this to?

If there are specific additional tracepoints you would like around
hwrt_data_fini_fw_structure() or hwrt_fini_common_fw_structure(), I
can build another diagnostic kernel and reproduce the issue again.

Thanks again for taking a look.

Best regards,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 21:38 Chen-Yu Tsai <wens@kern=
el.org>:
>
> On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > Hi Angelo and Chen-Yu,
> >
> > On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > >
> > > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@r=
edhat.com> wrote:
> > > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > Hi everyone,
> > > > > > > >
> > > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > > >
> > > > > > > > This time around Mesa was ready for basic testing, using bo=
th vulkanmark
> > > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > > >
> > > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > > - Added missing of_node_put() in remove function
> > > > > > > >
> > > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > > >     - Needed since the driver implements PM domains using t=
he generic PM
> > > > > > > >       domain library, which also depends on PM
> > > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) bra=
nch
> > > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > > >
> > > > > > > > Changes since v1:
> > > > > > > > - Adapted to changed DT bindings
> > > > > > > > - Dropped driver change
> > > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > > >
> > > > > > > >
> > > > > > > > This series enables the PowerVR GPU found in the MT8173 SoC=
, found in
> > > > > > > > some Chromebooks.
> > > > > > >
> > > > > > > I'm making a pull for Stephen for the clk changes. Should pat=
ches 1,2,4
> > > > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > > >
> > > > > > Only patches 1 and 2 should go through the clock tree.
> > > > > >
> > > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants t=
o pick up
> > > > > > DT binding patches. Otherwise I can push patch 3 through drm-mi=
sc.
> > > > > >
> > > > >
> > > > > Not sure if I can really take the DRM bindings patch through soc.
> > > > >
> > > > > I will take the devicetree ones exactly right now, even though it=
's going to
> > > > > give warnings.
> > > >
> > > > Apologies for missing this, but the first DT patch depends on the c=
lk DT
> > > > bindings patch for the clk ID macros. This is causing build errors =
in
> > > > linux-next right now.
> > > >
> > > > Not sure how we can fix this right now.
> > > >
> > > > Brian, would it be possible for you to split out that patch into a
> > > > separate immutable branch for Angelo to merge?
> >
> > Yes, I can split things out and make an immutable branch this morning.
> > But it sounds too late for that.
> >
> > > >
> > > > Otherwise Angelo might need to drop the DT patches until the next c=
ycle.
> > >
> > > Yeah, that's so bad.
> > > I'd be happy to be able to resolve this, but it's too late on my side=
.
> > >
> > > I should've checked the DT patches more carefully, my bad: I got a bi=
t too excited
> > > to finally see this PowerVR stuff working on MT8173 and going upstrea=
m.
> > >
> > > Sadly, I have to drop the devicetree patches :-(
> >
> > Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I =
send
> > Stephen an additional pull with just those patches? Do you think he'd
> > pull that?
>
> (replying from my @kernel.org address again because I don't feel like
>  pulling out my work laptop.)
>
> I think the question is whether the soc & dt maintainers would be bothere=
d
> by it or not.
>
> No need to sweat over it though. It's not like the GPU driver is producti=
on
> ready anyway. We can just merge the DT patches in the next cycle. :)
>
>
> ChenYu
