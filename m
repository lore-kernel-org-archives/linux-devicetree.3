Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E94A387A
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595075; cv=pass; b=rscsfEC922kxdTQGI+cx/cVOQmm7iqJYoN0NoVhX2+i1QwIx4OTX7QjR1UYp0zkcivNNFTZHkOt5FzVMVaEH8od0qmNe+DZudF8gsJrHdY6EP/5UC0op+nElZVjSzzUzXI7V49etfgEpgSKxf5CyqcBlcGlYZ11Biai0dmy/vu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595075; c=relaxed/simple;
	bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbbHeT+/J7J2nYnylXzJtFiEmr5dIs83SUndIvgZgcs1Vnsmwgv4/4tkGjMlkQT4UKwJyVsHyvi864wzEmbLOwBuX/diMmv5SQqUA43VMt6r07xegrPz+IHFIasxJF6WHqX72A2QWYQwt5mdxcGlIDGpcMLEnOqhksEBQCSUkZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PhRvxyDc; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PhRvxyDc"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564421fdbso63204137.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595057; cv=none;
        d=google.com; s=arc-20260327;
        b=jCQHRkOAz+HDMc/kT79tXB/mAUMRFTvXh8wssYBCg5JOLyZK8g3EMrTw9plBUjW3O+
         kVJYdy1GuWpssndF2jQlL4YIZeFwbH2lnaGC4ySg2zwqIKcgCpSiNmR5euCYMQZkSuMp
         l3x7ztHJGGcBrspl//8eWtW2M7Ls2py/5VOrKtaVIadCupJekvemwnCqLgouGpJYShLH
         ID7SKlv+4oxtdxfRsnvO1hMntsmmS00zgCm8pHsrLfA5QpnPcrPNuGmGIm6oiPBv7oQ8
         PoWpZjaWMKhpAhna2VwsSqXmvGrKTyoTcHH0SRSKc8Aw2ugJ4jNSUslrOiW2v+yPSnwU
         QeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        fh=A5bSuHuk3X6CquSnytNt23OQSNIFa5TRm8tSEhKRC6E=;
        b=XedpH6/ogwIhLGXP0Al5mfAX5BaYO6DVIrIyDR1jJ9K7lxBlkctu8SWZQzMCHLPXxz
         reCnDmYLU8q0u6YL0FSNPCgJJiWbpb4zsTH9W4BxdUCdlQLspFK4JwUT9UlKAsbXJs/j
         SlsnKNaB1nEPcMnBnjjUfDzKYWqWhKyFDA1sEK6xACFvhLExZPKHQQGvnsDjvjb51Z0I
         Myh30m3dF0T3+FkcV0ase9lpVSErxMCRhFHrmKLRq0S1hssuosuBc5TzQtMAaHfMl98T
         DrchXRgMgqaUzAu9YeAgHU+5ZjBoxXlP940T5fd4RLUWC7yX7hOycY7okg/7Ot2JUhm/
         SyrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789595057; x=1790199857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        b=PhRvxyDcEKpo82rz7bjO1wDQ8uBdzgmqFw/6qMLJ6ysl579NXOSm57qPRzt39pD3oV
         RQb6cdMJNN/Ek0B5W2zGNfO0RqIoSKMqtIpUc7eAhIfyNHQGufGBDtCJwInLu+pX9hxn
         J9cpThCkU1tmfCxsOJRLdZFf8wYm3kRlo/yoPwYzsu2PbhjQqcSKR20KyEdhLP8618yJ
         5CmZfZeIm2+Na8mFl/ktZ3dXA1iPW6HhEYtD+ujAGpNgWXor7U3Ki4cMIqiM6LMBSHL9
         ktggN+6MCwK15bvCxc3iBeUikkFZwpbRMOG0Pyt60U5y0YJFcb8fm4EhJ+LQPrX9SbDv
         Tdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595057; x=1790199857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        b=U+RAB5bkN1MrSzwa7PUeITTQsUOmdFo6kUKaSZx4sqNh8xt08hOjJUjSpi8BPddZ2m
         ds3uX0Xp8SK8VStRxH66XIpIktJU81XqNMjUiL7DEuy8CXpRogzUsaVMzdt7Y5qdCwYP
         r73vXDSIVHfWywNALZB44M18m6eF7gfuqY+J65BWPyJpBD5pUm+m/t8o3Mo1d6pFZ2nN
         SUMsncVL78Xujwl8FVA70j4hlO4VOyNv/YyaxflsESOSA1CJ4zH5iYtwiwy2DzBoC0gk
         AbCvQBPqfNPjOSeLABoDCt9IIKkUeGi0cxdo89q4o85YIcCsMsykSUOm5vf2hdxGu1qY
         IYgA==
X-Forwarded-Encrypted: i=1; AKwUvBzwkuZzsljNScFhqGv4zzB6HP6WD5uGuetcSgCShofrzp88G42G3mxtyeVw5mjQz0aLTcKPpkSMENfC@vger.kernel.org
X-Gm-Message-State: AFuF++k09faNcrknNK/Fr91Lu9KAaElYyPtRuOGGrvDaBjev1RKdEF0i
	xnvArkL3R58suTUjBoYYOb/q5og8LPRcwsSd/yy5jjioJV1e13XOXdSDuBmv49SS1yZsh/6T2jF
	l3+KZ6GjBaRVlokdTqbpbXVMTPmIqlc4fTcuKMso=
X-Gm-Gg: AYBFou2IOL70DfCgaDsAiyopbDyFyEO/DwUvtcpfFVZ+xX6BdIfLRr56XXeUuevS7rv
	1h5WlZiFqfIxZ9ibl3a/MV0AikfPp1931ZThWNydKdcacJ38u57FY68k/vPC7y8aOQWZo4tDR84
	XSvjghZqlmnd0i2MPwK+rmYABPWWnsQxkKyM1aHB1nhRyUI3R7dn9wqIjGQSGrIGEoof7rWkYkj
	1JfMIn65iNuY1UwOo4h9opW1ecAXavC2P7O6+xo+Kz+sPn4sHx5S1Qb3Ly/1vIqY+EL1UpTeeQe
	RVt3PbdS9m56zNLOvqX5ZV9Gb7f09GVAM7ln8KK33vcfCFqUOk7JMYsT+Gdc9WUmx5KuXPJOlxa
	6GsAqvWqw9uLtjXBhYMIP
X-Received: by 2002:a05:6102:a85:b0:7a2:2a6b:e7b4 with SMTP id
 ada2fe7eead31-7a22a6be8efmr62586137.2.1789595055938; Wed, 16 Sep 2026
 14:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-26-morbo@google.com>
 <202609151258.5FC01072@keescook> <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
In-Reply-To: <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 14:43:59 -0700
X-Gm-Features: AcwNN1XbboPOY3deKY79Gty15vkSErYIT9HTgeQdVXaDzFhBvm8_kiOA449bIqU
Message-ID: <CAGG=3QVZRCJ94+DOfSsSDhsrXVYf-ec01NZBy299nYiCAYfXKg@mail.gmail.com>
Subject: Re: [PATCH 25/28] EDAC/thunderx: Replace strlcat() with seq_buf
To: Borislav Petkov <bp@alien8.de>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	codemender-patching+linux@google.com, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Jiri Pirko <jiri@resnulli.us>, 
	Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Rong Zhang <i@rong.moe>, Arun Raghavan <arunr@valvesoftware.com>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-edac@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-nfs@vger.kernel.org, devel@lists.orangefs.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 15, 2026 at 01:00:00PM -0700, Kees Cook wrote:
> > Seems like seq_buf would be better her? But yes, at the very least, thi=
s
> > needs to be scnprintf, not snprintf (or add the checks as you have
> > here).
> >
> > The rest of the seq_buf conversions look right.
>
> This driver has been an orphan for a while now (we just made it official)=
 so
> I'd prefer it if we don't do anything here.
>
I'll remove those changes from future emails.

> And yes, that mega CC list is just gross.
>
Apologies. :-(

-bw
