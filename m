Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227252;
	b=f4/pgAIc9QLMfwyMVMlYO+/YzVRE87YnKKr3o/ZbMaAiDh5jUgu3o72QttUbqhklV6rm
	 04YmAZLOc6IlJKRuYy9QDdJISRxOa2l7BqAM5OeozacqG4M2HWgLlq42sTknEBR1IVcLV
	 GzugwFqnzXPEWGYA1n1BgnkK5yFoMemJPRA6gnZuZPuqOAclKoumE/sxAM0sSlmbAhrga
	 mpxzQqimkfEmNWjDwpOkyB2I3bfmTq/StNWdUOhyN+00IY6etLLBJXr+c7J/UTG1RkQbt
	 yAZxjCzqiDzONBMmOZiHDUw0EYRjNnqbwaKTkPsxuf/Y3LcjuLYthwgm3scHG7wxaGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
	b=oEJT/I9TlQq+EJ/68ZTQRSSkOdyGnyu3Uaq9wDcqL3u/QbJTnYBWJUvjboj4QWDRQR8y
	 DY+TISHot73lJ2A4Fq9TjaOn2m3x+R1vawD4fzgXBB+v+RzBZ/erV50JR3WthAOnMiEAO
	 eq4Hn1XM/hun6lTgNjXJJHK71sExrpQWNcXr5WBgsB+xc9XoU2BJd65x+6tRjZq6mKCTK
	 50PVB0G8/fw2m2SM2gWJEXJxdkmpZlJdbI3UPJqLqc/kgr61FffLwdNQ+97KmpCys98UB
	 5w72xeyge3KRkUqiqUIp/pjZMeRH1WCZf9cQsw8jPBGQWi5y9eDOXHvjwlqojz34cNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF1606A339
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FF1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so901080a12.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794227250; cv=none;
        d=google.com; s=arc-20260327;
        b=Ezpf77QscylbLpHe0CKZXV+h1Vr77h4ngGcqhWgr2nPoxH4U0tOwIxRFu6fKFWGMxW
         jJOyHePvtGWsPODNBm8EeDNDlrkagAlHMZUnK2KUJyPlDGIzmO/RtjVBSdDDP5si5S48
         fG+S345vFrPPse3vKN7ASrJUp2oCdgY3oj9p5czX2NF+iifzt9c2nFWEsmlkNgAGjMFW
         3ABRUGuM168ShpqS3H8dtGFgGANx7f/BRBLW8pwo2z8FrwRZwJkDcN7mAVjlEcYI4kg8
         BgGFSmbOnvyH9qL+Vj6QIHY/BQdRtRKELabcRxFq54S5n9eZm/xlh1fHHwFXGR/WwkVf
         Nm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        fh=41WnMnvwlxFGFR+LNac0PghVLSGbyv2tfDcRbXyPfpk=;
        b=CE/aaebogE/8Uo0cY9LYJtu5k69JlhohSjILDT19LBjrOsBzGdTPiXFZCbsQnLXCU8
         F9i/9mUF0HqO1YGy7ELWPQjaVDreAxS4fwNGa2uJ7h1RwE8AXsc5026Lum9IMCLBjtE2
         w1T5iD76XyOHDZFNsaUHqUfSS69dpiFwb2rGzrC6gLNNrknUjK7jD1JIjgjh2VozDJ1h
         RBEkkc+EWIdc35UN0xWst5h6WLKnHRzMwqiJoEXyrBfIh/J5CFFUmkjnGM/Mk5n1S4l+
         lh6KNgGGdt9yFs4N98tjEPqxaCqwaf3N3WvoCVw35Nh5La1iOmYM6aCbr+eTOXHOY32h
         H3VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227250; x=1794832050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=QOgyhbeqOwd2Z8XLJx9wuh00POYRhyJMgoyTP2JMbJJZZwVnt12qxlUpcwNXgfG+pp
         JaMwEbHHzfXgzSVYNUUjUGAHM4w5gIiWjKVMo79/N4Kp7/QNLp74fZlfCscaySJbfldb
         xQdArFs3VDfGTOs1UtGkxdrVHUOFJ8um8haAtZ9RIzulS0FS+QUM0zZPsQpT63l+ktjO
         SVICn62kPn36QNCk9ALNSp6FdvD79vNG4ObZxi9TgEboX/0B+2bu/ByYWc9nxsh+fkt6
         CmD2fpaF5ijY1Cz96O8VMTE4HMTAPlOe0mt1ogz/3/yMi9wqTDx+W9cVvmqfelt/BCIs
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227250; x=1794832050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=d0rn4VMKDiEoNExrnIZINw3TyoeSEEW1Hlx26eGVlNifIQIyYe43NSSv+fEZxLPn1d
         vGx8HRY7We8+0KEXs05drax9xZlL3fXfWTXTmADR/XkJs9FwN5AJplgo/C3E1OS+zYGQ
         Kx+4gqQCOXG48ZGt4KLznkWZ2k+MKiPD4Thfd/RNoh/16qHmT0EbF+w4hysTGtO8Df0B
         BsYDTZJzoGeRszEgti93GsMYvOGjL54evzyv/ZGiIa/qvR8FrgZYa7DwIeVg6LcW0zPm
         swmp4cNaKROgFgY74/vW4DOlOjMM52Z21NBY0cuRKP09CoREkFVhBWdO/3TTtfELEbQY
         tZsA==
X-Forwarded-Encrypted: i=1; AL+hErE1vcmgi0b/94iLAinJipWL5703u7PPyj7oqiQ0C0UtoxYxCbv+K7aYjYdzPGiDsYoz3gGha3ERqVgQ@vger.kernel.org
X-Gm-Message-State: APuU4Z940YSuUkXnOS4KwTpuzKQ1b2U3P/Mb2mCuKKeD2hbNKimcxOR8
	OVFvtT6jdyfZkMP/jaX1pxOSb4U+laTO72WHEajpviCnlJDBcAXny1fFIXjHU5Lyd5CuGWZFmdG
	NrRHsGlneBbMccQa+EnP3YZeuZ3WbCEs=
X-Gm-Gg: AYBFou1zRunO0qdxGdbg/s9GHBc4SoEodwbZoJ+myZ1cCl+dE/vO2EfJORp7BH6dm3M
	zmJD0pJynEdsq/LVx9aIB/Gkt5ResYpEh5MkY+pMWlj57oBY8Tw/hJ0kiWu07LnvwdOcEKXp7Ar
	F6E7qru9KaZrA3gabzo4EsW2AcYeqHL3EtXcsawVcIUYNgDNzePoxplmnwPN4f+d4RuDU00uDt2
	ADlIPoxWe2wBDVtFY/RxNwleDdBsB1qw/qYO06QBgfvYSnECdZf+Dn7UKSZAtpM4NHDAe5bSke5
	xBpaQbag/sT/MeNy1dyCXHoteEdBnMGGNJvISsbzhIBDPulW44ZjUmn/Mt/ucUxLKghySFOE6AR
	4tTE6Go7E4W7Df5DoJUp8HjUodo6BFJHG/mREBV7Lghqh8wt0vtPqfQBUpBlVkpCaOeTGDwXPa5
	EX9vLcDC1DyZf3XFweVY+lT1Mzcx/NKQeu4H/+6B1Ukj0j8OnW3vVmsnVjfH4=
X-Received: by 2002:a05:6402:3895:b0:6b7:8b1:aa79 with SMTP id
 4fb4d7f45d1cf-6b7223c1832mr2314095a12.5.1794227249763; Mon, 09 Nov 2026
 04:27:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 12:27:03 +0000
X-Gm-Features: AclHuK_ZRUUlCMH4HvENtZrOvYlrEIYJCdD6Zdsj2qnZgU93aq494AwRB7CTooo
Message-ID: <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> which the CPG driver registers SYSC regmap. WDT driver now uses this
> syscon to access the WDTDCR register.
>
> These patches were part of two seprate series [0] and [1], out of which
> certain patches have been queued separately, so I have included rest of
> the patches into this single series.
>
> Merge strategy, as the WDT driver now includes renesas.h header file,
> the driver patches can go via renesas-soc.
>
> Note, patches have been rebased on top of next-20260930.
>
> v7->v8:
> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
>   restart handler" addressing Sashiko's comments
>
> v6->v7:
> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
> - Added new patch to drop pm_runtime_resume_and_get() &
>   pm_runtime_put_sync() calls while accessing the WDTDCR register.
> - Dropped propagating WDTDCR access errors.
> - Dropped converting WDTDCR handling to regmap as this would require
>   resource address comparison to get WDT index to call
>   rzt2h_cpg_wdtdcr_count_start().
> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> - Added if regmap is available, use it for WDTDCR access
> - Updated commit message
>
> v5->v6:
> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> - rebased on top of next-20260922
>
> v4->v5:
> - patch #1 is new addressing Sashiko's comments to avoid potential deadlo=
ck
> - patch #4 is new addressing Sashiko's comments
> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>   restart path.
> - Handled the regmap locking in the driver and introduced nolock
>   version to be used in the restart path.
> - Added review-by tag.
>
> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Add helper to start WDTDCR counter
>   watchdog: rzv2h: Use pm_runtime_put_sync()
>   watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
>   watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
>   watchdog: rzv2h_wdt: Add syscon based WDTDCR access
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
Gentle ping.

Cheers,
Prabhakar

>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++---
>  arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++---
>  drivers/clk/renesas/r9a09g077-cpg.c        | 35 +++++++--
>  drivers/watchdog/rzv2h_wdt.c               | 85 ++++++++++++++++++----
>  include/linux/clk/renesas.h                |  6 ++
>  5 files changed, 129 insertions(+), 45 deletions(-)
>
> --
> 2.55.0
>
