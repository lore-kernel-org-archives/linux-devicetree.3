Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289B8479889
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395143; cv=none; b=BKIlow6YONHurINK8bE7gYJjGBSIJBr2xPKnl5N6+mHOi+yvv6R9sQFb6O1JD8iN2EPAaNLD43lbH1O8VEBR7pjz4FwtwFgr/E/equD18TL2XBoKrwrT3WnoZv4Stv+w6ap0UeTmW8bLpgoZAVMNeATDjFrEIxaUYgRA/qCRids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395143; c=relaxed/simple;
	bh=8ceMByd673naR3PwEiJsfobu32L4XCtKVcpdbpqYa5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdHN5LevoKXL7A5oDL+OMX4TYDjqijQMo71AMS3QJ/gwJ4oIJoenQ3Guix4rSrHpncS8ySK4DrQtZMkWvSI79q0uwElfRQzz9HsA+pBi+z14cjenvICL0r1+vKK0I+V7S4YTUtHfhvRNDwX1OpnL0nisgraf/DVLSvsECZrja7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e8ef5b507so413524241.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395134; x=1789999934;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0GO/2vfF/XubgIzu8oiJogl7L+f/XkIHsO6TluNVPc=;
        b=Kfq284fp+mrEn+KBFGWGV9gqg3J0+wmROzXzL3YlisruVTzgSrqDqW9FUT5KsWBETH
         b5CcrYB31GoxvHB84GV4lx8seo2hLteB8NaRxic5VLyo+OSDScvcEawn+AxjjjdZkXsK
         GOZM5wiIBYrNXQWqwh/IyQhRhOYu1rkocrt4LU+pEZf3HZDakaRvtibh6OIdtDjjrMO/
         arXN4GfyCWolfOo0QX6heTUHQOU16mmhknN2O2bf1LRtyqfya6i7fIkc5bfa9OANGA+X
         jKt6MKEzZqlT4s2ipQmwMVQ5YEvxTZU9p0XuSEFPVwRbqLK3SPmO4PYl+hAwSp0rci7y
         /Qqw==
X-Forwarded-Encrypted: i=1; AKwUvBzHLziCq4uYSGlU1XmO/GgyjrDsa/b5A0x7hNHymV535SsgT1Aj8WXLCqHMJmZKlq6xYqMcOX6Yijx5@vger.kernel.org
X-Gm-Message-State: AFuF++mWyUpjKsZBYL5pnIfO6aXOw6+1HxcOc3mOpbBP0h0tNybdT9mX
	b/g0tc2j0M4UBaGrnO+1YISlZtWU5P/OKGOs9cDExV3iAisauy64JvedYKi1+OWU
X-Gm-Gg: AYBFou2rCYEmHjX3QCaT9SRr0LQnB6M21iAS/RmdTRwzrhMgoNy2n8g6MhrJJDO2gaf
	IWgc6KdyKWFkSBFoPvPY7u7uVzbO3QvqrHJgDESplnN4sn0MxV2rVqfESseaBllW1j9+C2xrgjp
	rdfJIbOP31NvQq+LfsatpQdUT598ZhSzZShLPLLNah1fP1SisWzIO5mXunsiOQvJMJ1JtEeOVrz
	duhwyNEdRqkTXqHFv3PsNmgPSVAvaX/qzGWh+4zPZ7RmDWOceJkUmYk1I4mr259jxZghR9nniqd
	j+BzrE2ahfv031ZJzmlMjRhu2PABXuJr/M70MWE8QUyr6UKgW5h7zo18KqAYj5ZbBbI3Gro6myA
	tOJkpZAEcG9c2/X2Ft98XvhzvBUvTRDVr31o0IDVVBnfC8koIp2iV2ulKqRjbU1gPIMjW5hHltn
	p89Jrc8BEWRQHaP+WJzSvOzg4M/n+jvd35Qpp2D1Wxc1wXbtay/5XW4cmPZTGBx1VpKnxmI3ywk
	PX65TqqEAgjAGFaHCQKvoVURDRstMXiPSiqQ78u
X-Received: by 2002:a05:6102:5129:b0:779:328:8a2e with SMTP id ada2fe7eead31-79b4d1bd126mr941849137.5.1789395134339;
        Mon, 14 Sep 2026 07:12:14 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79278f86adfsm10744797137.2.2026.09.14.07.12.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:12:13 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c671456e25so3230336e0c.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9N2sxW3DYCjPV1atQ2pNfZfThy5N+BaoOdEp/0ymWQoRP+m2qD9/cIUmTakUifHhCtAd2C35aRP7J@vger.kernel.org
X-Received: by 2002:a05:6122:5315:b0:5c6:65e5:99a8 with SMTP id
 71dfb90a1353d-5c9749fed16mr2500859e0c.3.1789395132980; Mon, 14 Sep 2026
 07:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073058.253000-1-den@valinux.co.jp> <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 16:12:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDJac0Soob+Cf-dgwWPBpGrfCwHDN_nWTyE84pXJSoGg@mail.gmail.com>
X-Gm-Features: AcwNN1Uyp_yKSLQHdhola9oXjT2PLkCEjRN0YsdOH8kD2k3alY3_Suk4gIB3dpw
Message-ID: <CAMuHMdWDJac0Soob+Cf-dgwWPBpGrfCwHDN_nWTyE84pXJSoGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Set UFS lane count
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palash Kambar <palash.kambar@oss.qualcomm.com>, Bart Van Assche <bvanassche@acm.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 10:44, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 11 Sept 2026 at 09:31, Koichiro Den <den@valinux.co.jp> wrote:
> > Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
> > during link"), the following error is observed on R-Car S4:
> >
> > ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
> > ufshcd-renesas e6860000.ufs: link startup failed -67
> > ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
> > ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67
>
> This is very unfortunate...
>
> > R-Car S4 has one UFS lane per direction, as described in section 152.1
> > of its hardware manual. Without lanes-per-direction, the UFS platform
> > driver defaults to two lanes.
> >
> > Previously, the core used PA_CONNECTEDRXDATALANES and
> > PA_CONNECTEDTXDATALANES to configure the link without checking them
> > against lanes-per-direction, so the missing property did not prevent
> > initialization.
> >
> > Explicitly set lanes-per-direction to 1, now that the validation is in
> > place.
>
> Given this breaks backwards compatibility with existing DTBs, I think
> this new check should be relaxed iff the DT property "lanes-per-direction" is
> not present. Are any other platforms affected?
> Possible solutions I see are:
>   1. Skip the check completely, like commit 06a34d9c1f47b923 ("scsi:
>      ufs: core: Skip link param validation when lanes_per_direction is
>      unset") does for ufshcd-pci?
>   2. Correct hba->lanes_per_direction based on the actual values of
>      PA_CONNECTED[RT]XDATALANES?

Both solutions would modify the core, instead of the platform-specific
driver.

> Alternatively, ufshcd_init_lanes_per_dir() could override
> hba->lanes_per_direction to one if "lanes-per-direction" is missing
> and the device is compatible with renesas,r8a779f0-ufs.  Or perhaps
> hba->lanes_per_direction could be preset in ufs-renesas.c, and not
> overwritten by UFSHCD_DEFAULT_LANES_PER_DIRECTION when non-zero?

As ufs-renesas.c does not have early access to hba, I went with
handling the quirk in ufshcd_init_lanes_per_dir() in
"[PATCH] scsi: ufs: pltfrm: Add quirk for R-Car S4 lacking lanes-per-direction"
https://lore.kernel.org/ae0cc2bd764e6dfffce99db3d8b44a55887c508c.1789394185.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
