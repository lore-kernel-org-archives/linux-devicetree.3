Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F051309DDF
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208240; cv=none; b=JTNLkPmgG2CcM3uS2ebfYtteiyjOATo53lqkuzQ9h3v0C8nQuNpIpPa10vyM1+QBNu04s9DGzd0bWIgyMs4oHWCfC9PO4V0jwzihsE22ChRv0VTE5chL44uBQatfMrN66sTqsThYRICpQkn+iLOygvDhep6psPy7Slc8yHiij90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208240; c=relaxed/simple;
	bh=m2vUozNn0aCng5ExIKXIT0OdW62fj2vQIm4HslRovuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QP5LQRDQATOKEanVzi68TyBhRsUCxEwGF3mfUVLw6tpT2ZFsx7/s9dLAuo++pMLJWTxJax8/M+XYQCv4U/7rEj7nIDWtRgIxlRhzOFkfM93oQ25gA3x/X6ZDTVns5F3aslpwgurzvjFcdNXoOvES5lFszS7LR7+ED86Fvm/04bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso526695241.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208238; x=1775813038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWOTSXRsWHBcjZnGGoJtQR/fyfNuqFqVCJ+5pGTBWnw=;
        b=NKXQjQHypKQS2Vg1cpvhho74QarZRUNHMw0pd+vs/mM73jVJWoMqoBzACsB5zkwnjH
         mrYn2aeAkq7yVvBnRCLCJ7p0MdqaBhsStKWPp8x2ykTPixt2+Aj1Wc3EVCTG/F4GgctT
         Gf3woE+dMWHe/axSyB+MEFTGuG6x6EDd0PfCOwUAzqRUjZVAGF4m0dpCghBw5hQKzGrW
         4CT/gqiWhvMpLx6g8v9tFfjS0g1JO1efc33Ingl07BBp0/AKCGR57GK9yulDF5pvBd0a
         KSa7zHgFpuYq0DJzj31A5v9pUH5hmlSMC98UX8elNRJ83pYtP/lqwsKXY83ev+tp9xfz
         T8/g==
X-Forwarded-Encrypted: i=1; AJvYcCVBLKynPsR7y4PQWGP8CMWOG23HR+ezH4ZZQ9OpUmo2vTGpNgp6GOZ6yUqx2algYr/F7F2oCFYKgpiy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk91JvB4nguOK2p+gYCaQHuKdlqhjbTxS4tvedtIh6dM7Ky4T0
	qYOj4EgPm2xuIqGan1d97lAnBtWlZoD04AyX+veCUu1zUAVvx3v0siLUl6ZwxzyW
X-Gm-Gg: AeBDietXdwXcT5nB7IScP6li0NQ3ZKjD7ud+hmP542C4gITM+FQh/WD1E7knsM6pzey
	SnfaA6qbA8pQw9jXNOAI60TOb+La+ZjYvrJZ1CzevXiJS+tUo1idEnNaFEnGl1jTdfkRUnNzo5Q
	zR5qiq0TbPPPZvholudoM6EP+2K9GSGTkCBRcG5RNV1TMyFBW4c+F2T8C5SakRF8S7g8R3ckN66
	jJX/Db8TuleiZ6qRWqw21m9RBjIyPLSPaKZxSKbucrA9MuX7g37Cjcdx9t4duLpePLOYTgFNWzU
	a7PW+gOQ2FNPFCAsVRQ69gqtTUTnRlXULrBIJT5O33FLkpXQwkBlKtQH5J2rgar+l9i8bpqcDGI
	7iNmvr0Xm2sPQRnc4uXrxQAgsdSiHXldOFLkLoSY+BwZw1KfzT2sMOYbyMOF+oFq2vZjCLnrf/B
	eN4w2yuZ3BsPxY4sYqb2UBNqCBb8Rt6XVsqqGnnL4+8b7K0r1x50ZN536QCsHp
X-Received: by 2002:a05:6102:f97:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-605a5099353mr730275137.22.1775208238056;
        Fri, 03 Apr 2026 02:23:58 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84f2c5sm5783518241.5.2026.04.03.02.23.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:23:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6058b3ec384so482171137.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBc51x6CBFHQ5seCdavY8o63FU2IPbbGvzkbe4BboKXp/EUl/JqdC3Md5VfA8A9L2Jqc3+2SMJxO9H@vger.kernel.org
X-Received: by 2002:a67:e718:0:b0:605:6089:6745 with SMTP id
 ada2fe7eead31-605a4e54dabmr739558137.9.1775208236667; Fri, 03 Apr 2026
 02:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:23:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVY8ZDeh8sGJkjtVj5e0EquhwhqeCo_T=CTdnDjKdRWvQ@mail.gmail.com>
X-Gm-Features: AQROBzCrzWEeQ4kO2P7sS9dJ5S9Z5ZtuN0jTbygabX6Hc16Zm1QvZSNSKwYRCCc
Message-ID: <CAMuHMdVY8ZDeh8sGJkjtVj5e0EquhwhqeCo_T=CTdnDjKdRWvQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: renesas: genmai: Drop superfluous cells
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Drop superfluous address-cells and size-cells to fix DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

My bad...
Fixes: 30e0a8cf886cb459 ("ARM: dts: renesas: genmai: Add FLASH nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
