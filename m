Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE35469820
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116687; cv=none; b=fAdbrwfSK0cENBTpGTv/VRBSQScRcM3h+jBua0mYpNwuJPdSPXWnJQHLr+qQv26164rdYbuYUBquHCjgFx4PV1dH7g8J8OYXGdIjXF4IOGieIZvak4JQoe+MDB5qoZD4vthLX70w3rPCeA6uYd9bR3nAECsTBgiXX8+yvurzK44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116687; c=relaxed/simple;
	bh=h5QtskLdwN0aOposRJmsMlXcFaOCxlrGFlXawJuLUoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcctcPBiBwdGtU7N/byUmpKUnSlM+q4kmnLVrA5j8tSlWnXNb1bKw//wQgq6s67jVkBzBB4BKT9JOTUx1BhY786MaPubIUcehr5sj5Y8E2VP+x6QPEEbMM3zGuJ83qnKL9o5iGzNNvC6464x0EkKDbgZE85dKF6cgS60P2xYQks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so484564b3a.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 01:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116685; x=1789721485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFqCzfESKQLEVO0Bv6rt70nL97v3lPj6zjiKBmAFaxk=;
        b=tMQSAgt4Q244U/lZdBNDX7IAbnjL9SwNwP7Zfr/Ed9zaQigKBOhTF/AZCRQE06+gz/
         EOF/FbL6PDVK860NbfIajX8F6z2ii7k+/j2RHHkwDmB9OfstBTdH8y4JJVXAt2iLcs3e
         FnAcVoVXPkjOInYzskHu1A52E1DUjgZIkXRRTH0pYTkgSq6R0XC+N01DWh+ZrNIGWgQQ
         1jWqsowbKLQ74up1289/7CUOwMnbNxfN4fo+5UyZdQXZ/Thm3TPN93AAMgJAP4ZsuHAN
         4vd+1I3gJQ5WwTrqTN3oCI2EWid06K+Bkn6iTRFqt28tGkNcZx+m8nBKWNyGydfuWhIy
         x2cA==
X-Forwarded-Encrypted: i=1; AKwUvBxhRu0p4FdswoHc/k/MWME6J6gEwPT8kTnXPcwE5B47lMEpp81aBBKG3e4gqSvjm6mxbwgYHgwsFDhd@vger.kernel.org
X-Gm-Message-State: AFuF++l9NGC3dBKm2YNXHlNP2GtW9aSNFeDKfwYhxblYeTQ49WxOYw8S
	5zTkmqZIl5KBOwV8Cep66AmlsyHJF/UZocgVkyynp8vuc7oIaUbgwBN5qM0H79ad
X-Gm-Gg: AYBFou2YYeLBdRH7mRRQfRJ18m1uFl6ZcR4uPXM8aiJ03C+lsn+cx9b3q7BSmQ33SOP
	SKx/6sn1Cce1OJ5ded6N8trEDThjLY83ZLatWPrDGrORJoRIDs1zuXgYWt8idFWqLDARSNSLMze
	2nfM4ibfK8kS1eP9mH9j3S+Tw0zTiCAOX+B58RkM4vs0a/2LKm25w9P3BrE5R03C7Rvfo88pZRG
	Qn/3c12WLuzjSDysupBOaAcwvGTKdqCgzvEk+Tp4U7zzn45FF5tm8wECDtYBgXpYDSamLjRUO7W
	OZIm2fNjjEZuVafsKZ14rxIMvwgr3u6LxyR++b4NE/O+gE+VHM2VwzbRSkDY+NzG9WgpQaRzxk5
	HSuNd7td2YlvuFTenI+3/XxRm0Vombd4qJ5gRQFw/cu1pbRh+ZmsRZRemG4IopS2MDjv2oz1QCF
	gFPHCyq4xjkFsnD+5yPppgm8ZQcOj4gfpGOXKccU48ZlNTXSQrGh7+xtOJsaIKNZIPc+Hi3pYvQ
	FAk0BTw4r9FBNUotOPjAlJkkX2yK4DjhGzwow==
X-Received: by 2002:a05:6a00:2d9f:b0:857:72ba:ff11 with SMTP id d2e1a72fcca58-86b34f095b3mr4817205b3a.25.1789116684458;
        Fri, 11 Sep 2026 01:51:24 -0700 (PDT)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com. [74.125.227.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb933sm778524b3a.41.2026.09.11.01.51.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:51:24 -0700 (PDT)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so5721365ad.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 01:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEe7GP4UQhLec4rsaSd9UO1k7vdHLN2atR+GT9C/lvIkSysVBgO5M+WV+Ti1J7WyhS7TGmjQfwazqT@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:789:3f43:645b with SMTP id
 ada2fe7eead31-792a83eee14mr1339655137.2.1789116307687; Fri, 11 Sep 2026
 01:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073058.253000-1-den@valinux.co.jp>
In-Reply-To: <20260911073058.253000-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Sep 2026 10:44:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
X-Gm-Features: AcwNN1U9x2Dw0_q7aq6BSLyw8iIHJUaRM391u6KpE8PvZrGWtybbNLMNuLVxPdU
Message-ID: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
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

Hi Den-san,

CC ufs

Thanks for your patch!

On Fri, 11 Sept 2026 at 09:31, Koichiro Den <den@valinux.co.jp> wrote:
> Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
> during link"), the following error is observed on R-Car S4:
>
> ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
> ufshcd-renesas e6860000.ufs: link startup failed -67
> ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
> ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67

This is very unfortunate...

> R-Car S4 has one UFS lane per direction, as described in section 152.1
> of its hardware manual. Without lanes-per-direction, the UFS platform
> driver defaults to two lanes.
>
> Previously, the core used PA_CONNECTEDRXDATALANES and
> PA_CONNECTEDTXDATALANES to configure the link without checking them
> against lanes-per-direction, so the missing property did not prevent
> initialization.
>
> Explicitly set lanes-per-direction to 1, now that the validation is in
> place.

Given this breaks backwards compatibility with existing DTBs, I think
this new check should be relaxed iff the DT property "lanes-per-direction" is
not present. Are any other platforms affected?
Possible solutions I see are:
  1. Skip the check completely, like commit 06a34d9c1f47b923 ("scsi:
     ufs: core: Skip link param validation when lanes_per_direction is
     unset") does for ufshcd-pci?
  2. Correct hba->lanes_per_direction based on the actual values of
     PA_CONNECTED[RT]XDATALANES?

Alternatively, ufshcd_init_lanes_per_dir() could override
hba->lanes_per_direction to one if "lanes-per-direction" is missing
and the device is compatible with renesas,r8a779f0-ufs.  Or perhaps
hba->lanes_per_direction could be preset in ufs-renesas.c, and not
overwritten by UFSHCD_DEFAULT_LANES_PER_DIRECTION when non-zero?

> Fixes: 5235d551779d ("arm64: dts: renesas: r8a779f0: Add UFS node")
> Cc: stable@vger.kernel.org # 7.2+
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -901,6 +901,7 @@ ufs: ufs@e6860000 {
>                         clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
>                         clock-names = "fck", "ref_clk";
>                         freq-table-hz = <200000000 200000000>, <38400000 38400000>;
> +                       lanes-per-direction = <1>;
>                         power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
>                         resets = <&cpg 1514>;
>                         status = "disabled";
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Works fine on S4SK, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Will queue in renesas-fixes for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
