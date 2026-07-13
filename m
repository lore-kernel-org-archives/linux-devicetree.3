Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9353DEFF0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933973; cv=none; b=J7ZUcQNAZ2THnBHs8vkP9j8UfGmmBVe2DjOCknYGvorzQ9FdKcseFLI1fntUFoUhcIeTl2Yrnr8pzNCEnzM/ppbdfwK+UILRuAO35IdX+OWpYNfSu4Spdcfo7bma0rUYFfkjSgvY8yXq4cORBfV+uuVVYAEYpzIKvDtAm9PbYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933973; c=relaxed/simple;
	bh=KR7ofJS3EykDayBzMtL2mzrr5NE5XcLuA8fzBY6jaNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAuXjeG4nKDMz3UOARpi5VJGnnGWJq3yNcXSEZ2Fc4o5C4l2RSM3hCNqEcOAvKS26t+zY/wrT+3jSlicK1v49Ib11TC8md1oyRGPaB2WX5nsAncLERWjpIxjxU89M2vQx+J+GefWmK5VvV3bpJzlSdVwk0VRD1ocZ7XXXwoOdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso928963e0c.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933971; x=1784538771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mdt2ZpMbpiIZVtPHl8mFZke/+oHZ4bhDPI14xdCANR8=;
        b=Ym9NVHwZwCihtqQGByaMTcQ6uXBMp8ZjFGdRa2IqKbBKIOk4kQ1GUVNvILvNeqUmIt
         NyERx3iyBPXDwvDQNexpd6+vGbZm2ebUAl6hmlWcGuuCZEiE7WTxrhBHeKYhBhtVv0yc
         68GJP1jyKMEnyGwrkgcmtRxT01cWytDc//UjpThoEDk2YYjw/BXJw3atQpa4cTEJkFT0
         EH+MvZnsN6SCX87Se+vHKb5aQaI4/A6fJUPctRymGdPwkRKUA83EKzTgjaLEexMfaMYm
         0H3X5tcpnFXBgUm/jhyWE4ktNY26F21cnRrniZBY1F9fwbTkoB+NxBfNW3NTWJf+jOqJ
         GvxA==
X-Forwarded-Encrypted: i=1; AHgh+RpfmVOYETGabeLU1VYD2oEhINE6jl0XGkMe8Lba2OISz7b6pdeut/9gKufeRv6Fq9jnGG/ikVrcs7j/@vger.kernel.org
X-Gm-Message-State: AOJu0YzidhoyJPomcRwlZlj0PvT7UWOAlGpRf6W9Iop3pEfEUIB1Xdi/
	mUtFjJDUX4PghO5exuUVj7O9vGzaWbTcQ6XqzHbl2fhm6eyWRCmhxh//5P+YwXwn
X-Gm-Gg: AfdE7ckcW2Y1iv0thenRIaP6q7DPlU1TDq5enG9wGgtpb3XFY9H7tcDadopmPh1ZtVC
	6+NDwDEChM3xhva+d8wescHbrNZXufnkWe+4/izCgIyPiNRislyOe1oGfiVCNeRjAWUZnblvAzi
	dk2mk9ptyxow90zuIUOCoX1EauXjo+l0Yew/7szDLKTxltHDwYIjej20Y4cBp/H8xSuFLd48rLp
	W4Q0FyqDmNxfgZPgM/KG2H8VRPEhZ+3x73QdwvQqm0kwWsBRBS5L8gexxhsMkozlSFfyH3nVWB5
	fxhzGz39MAx7V4BoFCAPIC1YcZCiVu88oLLalTwj4ISrWK0OKG+kLTkerE92Y+Zs+thsx1/sld4
	2Oj5wb9nsUdzXBcfSq2ORnOB3uZstU+t1uqiIxnCQqqNOVhL3VFGF/UjhTEAcgj3tCmgFnMHtxn
	bbHIj4ogsg+kek88RkDx+adKQlFA10xpnjEHVTFGYXxTj4Bf2gN40YhQ==
X-Received: by 2002:a05:6122:e202:b0:5bf:9bd1:791 with SMTP id 71dfb90a1353d-5bfbf06a222mr4516207e0c.1.1783933971192;
        Mon, 13 Jul 2026 02:12:51 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e0f38sm9075536e0c.2.2026.07.13.02.12.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c0627c302eso177450e0c.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQbl1rdlqi/Da3XckRcOIqhfcH1SStr0k4FwkNY+fAdy/5g7afpFqAfE2/hz7xcNEkURlpVN3IbqC/@vger.kernel.org
X-Received: by 2002:a05:6102:c11:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-74533d5836bmr4638111137.13.1783933970193; Mon, 13 Jul 2026
 02:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org> <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
In-Reply-To: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:12:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD=y++zr8sfnf9ZjW8md43ifmuytd-F7PY7r6e2p9Tbw@mail.gmail.com>
X-Gm-Features: AUfX_mwAEKuhdsHoYqlC4vkeXsOmSglqwfwCjvHk1qnz5qkYmbXVC-KIeAr11Bw
Message-ID: <CAMuHMdVD=y++zr8sfnf9ZjW8md43ifmuytd-F7PY7r6e2p9Tbw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 at 11:11, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 10 Jul 2026 at 18:05, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > The DBSC5 DRAM controller protects DRAM content using inline ECC.
> > The inline ECC utilizes areas of DRAM for its operation, which are
> > in the DRAM address range, but must not be accessed or modified.
> > Describe the inline ECC carveout areas used by the DBSC5 controller
> > on this hardware as reserved-memory, which must not be accessed.
> > Include DRAM areas which are unprotected by ECC as well, those are
> > parts of the DRAM which directly precede the ECC carveout.
> >
> > In case of high DRAM utilization, unless the inline ECC carveouts
> > are properly reserved, Linux may use and corrupt the memory used
> > by the DBSC5 DRAM controller for inline ECC, which would lead to
> > the system becoming unstable.
> >
> > Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> > V2: Include the unprotected data areas as well
>
> Thanks for the update!
>
> With the ECC carveouts, Ironhide survives booting with "earlycon
> memtest=17".

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
(also with all offsets set to 0xcccc0000).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
