Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0223D4131
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408359; cv=pass; b=ZRlM1mDj0AiTH3bLVFBMPs278Qt0tssWshLZf1nLO+u8GwfpHFf9lyym5b5Lwi4Hw4T0cQlSmkqAG7t3xtAQj8uV5rpgcsQfgwmx+LuvV32uoM+OktuliiGbI5gMtTnnVKODhjMBtLETChW5vzwr2LN/pz3Dz9G3bsbwDwkpyFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408359; c=relaxed/simple;
	bh=rCGcZNuznrOWRIC1YVvACSPyCAFYpjl0i2agHjIy+X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkcHDLcanZmh03kwaRD7pbaHB/3nnJ+kPTN9HuAvP/8Uae7X73POY43lbb8I71fmwIjjLvzTY4EOMgWSyKflpluuRn0TWPigD2xCzPnqbp83GixbgAEv7/Ll0eqUIeFjHSPgvVNcy4iveAUYK+vy5HXDx7tlxGwTgcvSNix2cqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWXVLt3+; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWXVLt3+"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44cedfaab6bso797837fac.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785408356; cv=none;
        d=google.com; s=arc-20260327;
        b=TEYdcF2ZNd/llikXo360ONGIcF77TXitiAD2s7H5wbrOYDw2jtzUlLp6OeGzoe4AJu
         4TWaLalh1npoGINIpLgWyR5QsQH8SRGf7LhW2nQBhT70hCjtC0skOuKr2Dm4bma5n+oV
         x5G0FGJ3s0gk4NIl7uPi9fyxSi3Q7FBkAMABDN3Z5hylRex9Pb7QgITO9RoBd1tgQ5l4
         Od+Cw8vNhwerRNgz5mvMK26aUVDpZJ6Y/XAALTtIL+aCtLI6zbn5B5OgkuYgjotX60RI
         PME3kBoSt458r3lD2yYKJDZiJv6HPap5RXx91dCMXnqk4z0tUkjWcXfdy0q9A29gSO+i
         OEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=;
        fh=Slz+DpBjCjO88ybs/KPhro1JkKH3+xSiBEgEzh9OB8A=;
        b=AxIN8HCoSBUc4zEHuovsNQX+Q4QennXfoHPy7d1o74Dn2+7Kj6k8B5uBcy22GkUCF2
         izZg+aFN5Z7ZPpGJOx5oCl5VPWKiNQAheBfAvy9ucbYvH6Qa/ZhaSR/6m57xzwb93mwG
         BGPjTOasU6ciJGJY+bU1F61Niux3W8B0Is4MDtOrwkXBu8kKQ+w5PHojqsCodsmbQIUc
         o0fFfpILEt2JYWAXBTxlhB6lPLgTmg7RkLVLyBzQHLiHCwDl8cSvPw6ap20JzjobJnhw
         lReGzjY+Y0HKox+w9tn2aa6GjbTuU3vH4oRM49HfQ7hKRsi6VdaJpOlaj4Jj81D1cLap
         s5bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408356; x=1786013156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=;
        b=dWXVLt3+u66ZOBeASffWsGAX4ei0LnKVWHeQ2gnZfPJ804f2BBrGZ+oIsBfV4jQCyD
         p61ixKj9YKvd6fCw1CI/RMwPEfeUX6BmuQvC68uUpsBSn9owiDnr29AAeX60cxSYJ/BD
         DC3fSShhQ9NcULBDh0UHYvemaDnlGQGMMKrTNyuWrh0ZbjwoXuvTbMScjXeS4O97IvPA
         OXVLnjuraeUqYmZTnN/VZvWf+Bp6P+3MnB1p/K2IoO0Wb4ZV6k2ndlhUGDXjoaiLtm2L
         6nkMrzSCXdJBs2trDhZXpZ6lsCrCMpf2UOEWDaAU4zPeeSKRlypRwoFsFFACz0xhc9iq
         RxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408356; x=1786013156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=;
        b=q6gRHxbso5A6sil08lhYZ3WFFxekqUVlVkP9qLWbEl1FUsPmgdJpz5LRRuyfOit/C6
         3qiarhmcvFhvsh4BgGTmI8CPyqTXBek8USqCq/M6OFM1i2pnTjcCAhdfSOPm5dc4tEVh
         Hlohn6mPf1hh+teInGV1i0+Bu3Rwi/h/I9UKdiKJ5VY4vCPE611ecpn5/TGgcdIt5R8L
         AcqTgTFqs4mbpIpB8CL0iEOotmo3ajdV2ZsIIXDfF0CDFQaGRMMEUFaaxcb/O+lF5fkW
         /X9KkLox9VlfrmQjoQlMA2luCPRpAQGz+OJR8lEHfFis7BqQbUhZR1yTonJ8KIGXGHt9
         SryA==
X-Forwarded-Encrypted: i=1; AHgh+RqxbzWj4801oRKhTYmIvrGrk6w+1Q1FQGbkAjeglFy60x0qtgm/XmxnyODzSg7PEc/rALTHffPxWcoh@vger.kernel.org
X-Gm-Message-State: AOJu0YyeCA5ZrbtyN3oAultmVThK14GvjEeD8J+XM763jslAaCA39FmK
	3rv6dwc/IGNIlg0GL2bbiZybk8I3n2v8yrrp2Fia7y6iRU+q+HM9kt/8HXzuAWQWQzR1E5mQ9kz
	wwtkc2FrlTodYBi18VQ//MwMikoafSG0=
X-Gm-Gg: AR+sD12GLi03lwR/2pvitDjQ6rUrCNiSguJs6Pd/mvG1NVWljuykwn73iz3sr6n+6Gd
	PfQkzxIOL0pug+WQ3hy8IT7YIh2JlgYHXzmnoK4HIOsoCzdxor8QiYpYfe6njXEdM6xT0ZK60Pv
	M6jqfI8yl/fK93o6t0Ko6xEf138zFlIDdPdPG2A7s/L8Wl+IAlCoCJEqDgip8NjWtFaDxxffEnQ
	xjc+Odyr2s7oFX4dKtysDxy6SFIwTggKAtYKJcA5ma7UMLhZJ0c+4WwYcbmK5qX/3msVWzcsrpG
	J4sJivO5VbR0oNnN4mDs+/3X/fPz1lgP4gJ49Rw8VbcNNLuH6RDSdW1cHsd2ymxL1aKS9UCxb9a
	0iA==
X-Received: by 2002:a05:6808:13c5:b0:497:e1b7:d7bf with SMTP id
 5614622812f47-4ad8792c413mr1607208b6e.32.1785408356120; Thu, 30 Jul 2026
 03:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com> <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
 <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
 <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com> <CAGXv+5HcwgmEEmhtTU5TpexxRVwDXC-ggdtOViLdmThT7FjB+g@mail.gmail.com>
In-Reply-To: <CAGXv+5HcwgmEEmhtTU5TpexxRVwDXC-ggdtOViLdmThT7FjB+g@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Thu, 30 Jul 2026 19:45:43 +0900
X-Gm-Features: AUfX_mwdD2ZTuptxemrBnMkBWAJZzxtdwPTtYISNfHSIpFsf0WzQLSW0-4D-zDU
Message-ID: <CA+m4KrAK24AY-1xt-VdpuSycM43LwP07euYwgNatmyf=YCwvCQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wens@kernel.org, 
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, that matches my understanding as well.

Since the MT8173 enablement patches do not touch the common HWRT/free-list
lifetime code, I agree that this is more likely related to the currently
unsupported GX6250 path.

I am preparing a diagnostic kernel patch to trace all free-list references
during HWRT creation and destruction. I will reproduce the issue again and
send the resulting trace to the Imagination and DRM mailing lists.

Thank you for taking a look.

2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 17:37 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> On Wed, Jul 29, 2026 at 5:35=E2=80=AFPM YoungJoon Lee <getfeus@gmail.com>=
 wrote:
> >
> > Hi Chen-Yu,
> >
> > A follow-up to my previous email.
> >
> > The official v1.1 firmware did fix the original "GPU device lost"
> > problem.
> >
> > The following now works correctly:
> >
> >     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > The driver initializes successfully and detects the PowerVR Rogue
> > GX6250.
> >
> > However, while testing actual rendering, I found another issue which
> > appears to be unrelated to the firmware.
> >
> > Kernel:
> >
> >     Linux 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> >
> > Board:
> >
> >     Google Elm (Acer Chromebook R13 / MT8173)
> >
> > Mesa:
> >
> >     mesa 26.1.5
> >     vulkan-powervr 26.1.5
> >
> > Firmware:
> >
> >     rogue_4.40.2.51_v1.fw
> >     FW version v1.1 (build 6976702 OS)
> >
> > Kernel command line:
> >
> >     powervr.exp_hw_support=3D1
> >
> > Test command:
> >
> >     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
> >
> > Renderer:
> >
> >     GL_RENDERER:
> >     zink Vulkan 1.2
> >     (PowerVR Rogue GX6250)
> >
> > The benchmark progresses normally:
> >
> >     build (VBO off)          212 FPS
> >     build (VBO on)           216 FPS
> >     texture nearest          174 FPS
> >     texture linear           173 FPS
> >     texture mipmap           174 FPS
> >     shading gouraud          165 FPS
> >     shading blinn-phong      135 FPS
> >     shading phong             99 FPS
> >
> > It consistently hangs at:
> >
> >     shading=3Dcel
> >
> > Immediately afterwards the kernel reports:
> >
> >     refcount_t: underflow; use-after-free
> >
> > The first warning is:
> >
> >     pvr_free_list_put()
> >       -> pvr_hwrt_dataset_release()
> >       -> pvr_hwrt_dataset_put()
> >       -> pvr_ioctl_destroy_hwrt_dataset()
> >
> > followed by:
> >
> >     refcount_warn_saturate()
> >
> > Shortly afterwards another kernel Oops occurs:
> >
> >     Unable to handle kernel NULL pointer dereference
> >
> > The second backtrace shows:
> >
> >     pvr_gem_object_create()
> >       -> pvr_fw_object_create()
> >       -> pvr_hwrt_dataset_create()
> >       -> pvr_ioctl_create_hwrt_dataset()
> >
> > The glmark2 process remains as:
> >
> >     glmark2-es2-drm <defunct>
>
> I think this is more related to the unsupported nature of the GX6250,
> and not specific to MT8173. Maybe someone else on the Imagination or
> DRM mailing lists has a better idea of what's going on.
>
>
> ChenYu
>
> > The system is otherwise still reachable through SSH.
> >
> > I collected additional diagnostics, including:
> >
> >     - complete dmesg
> >     - complete kernel journal
> >     - kernel configuration
> >     - PowerVR module information
> >     - userspace package versions
> >     - process/thread state
> >     - runtime PM state
> >     - running Device Tree
> >
> > I can send any of these if they would help.
> >
> > Also, please disregard my previous Tested-by tag for now, since this
> > rendering issue was discovered afterwards.
> >
> > Thank you again for your help.
> >
> > Best regards,
> >
> > YoungJoon Lee
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 13:38 YoungJoon Lee <getf=
eus@gmail.com>:
> > >
> > > Hi Chen-Yu,
> > >
> > > Thank you. Updating the firmware fixed the issue.
> > >
> > > I replaced my previous firmware blob with the official v1.1 firmware:
> > >
> > >   FW version v1.1 (build 6976702 OS)
> > >
> > >   SHA256:
> > >   e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
> > >
> > > After rebooting, the driver loaded the new firmware successfully:
> > >
> > >   powervr 13000000.gpu: [drm] loaded firmware
> > >   powervr/rogue_4.40.2.51_v1.fw
> > >   powervr 13000000.gpu: [drm] FW version v1.1
> > >   (build 6976702 OS)
> > >
> > > I then ran:
> > >
> > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > >
> > > This now completes successfully and detects the PowerVR Rogue GX6250.
> > > The previous "GPU device lost" error no longer occurs.
> > >
> > > So the issue was caused by the older, non-official firmware blob I wa=
s
> > > using, rather than the v4 kernel series or my kernel configuration.
> > >
> > > Thank you for pointing this out, and sorry for the noise.
> > >
> > > Tested-by: YoungJoon Lee <getfeus@gmail.com>
> > >
> > > Best regards,
> > > YoungJoon
> > >
> > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wen=
st@chromium.org>:
> > > >
> > > > On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmai=
l.com> wrote:
> > > > >
> > > > > Hi Chen-Yu,
> > > > >
> > > > > Thank you for posting the v4 series.
> > > > >
> > > > > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > > > > seeing a GPU device loss as soon as Mesa initializes the Vulkan d=
evice.
> > > > >
> > > > > My current setup is:
> > > > >
> > > > >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> > > > >   Kernel:
> > > > >     linux-next next-20260727
> > > > >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> > > > >     (next-20260727-5-g33d6e5134c70)
> > > > >
> > > > >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> > > > >
> > > > >   Mesa: 26.1.5
> > > > >   vulkan-powervr: 26.1.5
> > > > >   Firmware:
> > > > >     rogue_4.40.2.51_v1.fw
> > > > >     SHA256:
> > > > >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d7=
3f2
> > > >
> > > > My firmware blob is different from yours:
> > > >
> > > > powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51=
_v1.fw
> > > > powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
> > > >
> > > > SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e2073=
23e4a
> > > >
> > > > Funny thing is neither of ours match the official firmware blobs re=
leased
> > > > by Imagination [1].
> > > >
> > > > The latest version is "FW version v1.1 (build 6976702 OS)" with
> > > > SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2=
b1c44
> > > >
> > > > This version also works for me.
> > > >
> > > > The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> > > > SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050=
d22f2
> > > >
> > > > And this version also works.
> > > >
> > > > It seems your firmware build is even older than mine. I suggest you
> > > > update it and try again?
> > > >
> > > > [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blo=
b/powervr/powervr/rogue_4.40.2.51_v1.fw
> > > >
> > > >
> > > > > All five patches applied cleanly. The PowerVR driver probes, load=
s the
> > > > > firmware, and creates the DRM render node successfully.
> > > > >
> > > > > However, when I run the following from an SSH session without GDM=
 or
> > > > > another graphical session running:
> > > > >
> > > > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > > > >
> > > > > Mesa prints the expected GX6250 warnings:
> > > > >
> > > > >   Missing reset support for brn51764
> > > > >   Missing reset support for brn58839
> > > > >   Missing support for brn62269
> > > > >
> > > > > The command then hangs, and the kernel reports:
> > > > >
> > > > >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > > > >
> > > > > There are no additional timeout, MMU fault, firmware, clock, or r=
untime
> > > > > PM messages immediately before the device-lost message.
> > > > >
> > > > > I originally also observed the same failure when GDM started GNOM=
E
> > > > > Shell, but reproducing it with vulkaninfo from a non-graphical SS=
H
> > > > > session indicates that this is not specific to Mutter or GNOME.
> > > > >
> > > > > Since your cover letter reports that vkmark and glmark2-es2-drm w=
ork
> > > > > with Mesa 26.1.5, I suspect that there may be a difference in the
> > > > > kernel configuration or another part of the test environment.
> > > > >
> > > > > Could you please share the following details from your working se=
tup?
> > > > >
> > > > >   1. The exact Chromebook board/model used for testing
> > > >
> > > > The codename is "telesu", which is basically a hana in a different =
case.
> > > >
> > > > >   2. The exact kernel base commit
> > > >
> > > > I have a whole bunch of patches on top of next-20260727, but none
> > > > that should affect this.
> > > >
> > > > >   3. The kernel configuration, or at least the relevant DRM, PM,
> > > > >      generic power-domain, IOMMU, and MediaTek clock options
> > > >
> > > > All relevant options are built-in.
> > > >
> > > > >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
> > > >
> > > > Module.
> > > >
> > > > >   5. The firmware SHA256
> > > >
> > > > See above.
> > > >
> > > > >   6. The kernel command line and bootloader used
> > > >
> > > > Chromebook's builtin bootloader.
> > > >
> > > > cmdline:
> > > >
> > > >     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D=
31A
> > > >     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.de=
bug=3D0x106
> > > >     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
> > > >
> > > > AFAICT nothing special.
> > > >
> > > > >   7. Whether `vulkaninfo --summary` also completes successfully
> > > > >
> > > > > My current relevant configuration includes:
> > > > >
> > > > > CONFIG_PM_SLEEP=3Dy
> > > > > CONFIG_PM=3Dy
> > > > > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > > > > CONFIG_MODULES=3Dy
> > > > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > > > CONFIG_DRM_POWERVR=3Dm
> > > > > CONFIG_DRM_MEDIATEK=3Dy
> > > > > CONFIG_SYNC_FILE=3Dy
> > > > > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > > > > CONFIG_IOMMU_SUPPORT=3Dy
> > > > > CONFIG_ARM_SMMU=3Dy
> > > > > CONFIG_MTK_IOMMU=3Dy
> > > > >
> > > > > I would be happy to test additional patches or provide any furthe=
r
> > > > > logs, kernel configuration, or debugging information if that woul=
d
> > > > > help.
> > > >
> > > > As mentioned above, please try updating your firmware blob. Your
> > > > version is even older than mine, and neither of ours is the "offici=
al"
> > > > release.
> > > >
> > > >
> > > > Thanks
> > > > ChenYu
> > > >
> > > >
> > > > > Thanks,
> > > > > YoungJoon Lee
> > > > >
> > > > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchi=
no Del Regno
> > > > > <angelogioacchino.delregno@collabora.com>:
> > > > > >
> > > > > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del=
 Regno
> > > > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > > >>
> > > > > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasn=
ey@redhat.com> wrote:
> > > > > > >>>>
> > > > > > >>>> Hi Chen-Yu,
> > > > > > >>>>
> > > > > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wro=
te:
> > > > > > >>>>> Hi everyone,
> > > > > > >>>>>
> > > > > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > >>>>>
> > > > > > >>>>> This time around Mesa was ready for basic testing, using =
both vulkanmark
> > > > > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > > > > >>>>>
> > > > > > >>>>> Changes since v3 (all in the clk driver patch):
> > > > > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > >>>>> - Added missing of_node_put() in remove function
> > > > > > >>>>>
> > > > > > >>>>> Changes since v2 (all in the clk driver patch):
> > > > > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > >>>>>     - Needed since the driver implements PM domains using=
 the generic PM
> > > > > > >>>>>       domain library, which also depends on PM
> > > > > > >>>>>     - Fixes build breakage (kernel test robot)
> > > > > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > >>>>> - Dropped unused mfg_desc (Brian)
> > > > > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > > > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) b=
ranch
> > > > > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > >>>>>
> > > > > > >>>>> Changes since v1:
> > > > > > >>>>> - Adapted to changed DT bindings
> > > > > > >>>>> - Dropped driver change
> > > > > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > > > > >>>>>
> > > > > > >>>>>
> > > > > > >>>>> This series enables the PowerVR GPU found in the MT8173 S=
oC, found in
> > > > > > >>>>> some Chromebooks.
> > > > > > >>>>
> > > > > > >>>> I'm making a pull for Stephen for the clk changes. Should =
patches 1,2,4
> > > > > > >>>> go through the clk tree? Patches 3,5 go through the DRM tr=
ee?
> > > > > > >>>
> > > > > > >>> Only patches 1 and 2 should go through the clock tree.
> > > > > > >>>
> > > > > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wan=
ts to pick up
> > > > > > >>> DT binding patches. Otherwise I can push patch 3 through dr=
m-misc.
> > > > > > >>>
> > > > > > >>
> > > > > > >> Not sure if I can really take the DRM bindings patch through=
 soc.
> > > > > > >>
> > > > > > >> I will take the devicetree ones exactly right now, even thou=
gh it's going to
> > > > > > >> give warnings.
> > > > > > >>
> > > > > > >> I trust that you'll make the binding get into linux-next bef=
ore it's too late.
> > > > > > >
> > > > > > > Rob beat me to it. :D
> > > > > >
> > > > > > Love it!
> > > > > >
> > > > > > Thanks Rob :-D
> > > > > >
> > > > > > Cheers,
> > > > > > Angelo
