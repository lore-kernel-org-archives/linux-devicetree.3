Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2FD396D1C
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066777; cv=pass; b=qlsZ8cD+kye4eW/WQl3iN4eafEAv9r1HhofYn+CsQD4qVaJ+wpCSZvjevHVBgFprRZl73tnUpb6Zj8e+09JFH/Jr57upNYonfpASXiiOswah2InZuKNgH5xhPBJI1f8R1lgo7oVCZj61YkalvHSD1tB5uUpUEUp/J1XGPNjYFfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066777; c=relaxed/simple;
	bh=8i76hr8Gj+RtGUBroSxVsQfLVKIuEs9W7G61OYrNzFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxPQtIjUK/+2v7P0WTbGmnWtxocjo8oPPBtbVWl460zoR4Taoa5UHxCIGUWdUpXWbpg6ngur31bZAnjZxptdI4fIpfQ3Kzmk74bwCvBVmkvL3x0RgWFTVb5SFRQrGd1koqN7Dymg/B4DrmsAVSAAByCGhss3UxD/eVpvW/S6F74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB/+J5fu; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB/+J5fu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b980b35534eso564914266b.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066774; cv=none;
        d=google.com; s=arc-20240605;
        b=DFczqJH3tY66r30hcLu8hdbbFf2x+5IlX3tqLMkVg1kjtZXM6fKqwn+Vt34ZAVVpmA
         N62Kdt9n+E2KR/N7JtH4h2Ja09+nk//+x+zjpVBKLUZsBgSGW6jFnvbHK8bkPlSnu5KG
         cr+QMjItvavXHGAf880bhUKvc3sdP/HFiJ1hE6J3CMHkw6qFXK+ZVuA+wHVdffEENjTJ
         9i5EsCLVBILnZssr+9xa/DGBs39XObLPx1ZJJEGCo/Grlh+5kX5fTOUkvadq0QpngMSU
         /sOB3CaSz+srhnUavta+wd4PGX07kSWcYoPbQeel8jy6CnrQY9b64bIOFqECD0/m/L2y
         NbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTeLoPuL69qtHikGrHVR6h29M/vzfp4S7SUKcSWz2wU=;
        fh=Coec0CDk8HseEBoaBLnJCSIgBB1HJjVpWiWV6+4tVTA=;
        b=XtbCUYqDk3ckPPCzn7YRPpFtVowfRPzLmlbSc06PeXCkV0DcRmiJt7l3BUzQX+hjcW
         WXZizqXucW38ziToMm1DjFL5Lmzsf/3WeMqJv7N1xdUrITG7wo9jUlgvzq27fNYkW7vR
         h+2xNvV4cYQkgMJXJEr+d5Z5wa0jQHg75ShLQhv78FzpZPBQuczvDoubrICGBknh3SMp
         wzSv7SBrGxUReWmT4tjemUaNnPDLIvLssISc6dEpax5ZaksStmEW4ngLv0fLqEVKOXZX
         CPhiSaxI6QIECK0+lfAUvgeefhEqQcEuICQZBiBpjCX49Hewp5SsQ5ciLIq4P0b/erVF
         Te3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066774; x=1776671574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTeLoPuL69qtHikGrHVR6h29M/vzfp4S7SUKcSWz2wU=;
        b=EB/+J5fujPLcNsgzTuRVpKGVkkNM38PYAGDlDvm3P/R02BQ4yxtw7cNpjBT4LzK+7Z
         7tMTAh6PEx+Pi1i/XJM9fFoxKm+MwBG/QnZ+gnT3F0uEciUzMDzW1cWpwj2Kx7v3nCoM
         f5NG2o0D8UtUV406I7K/80ol3+N2JRKHCrHjDG+ZKxeOH84V1iXoYrcAJNhumTqJTQ4F
         QSTVQQgqrXwq4qWKRAQY2qJgcrAogxLTL+Ox+o+gmiOb/BmJ7rq1S+I2EV8RSz1vPgax
         v/O7Zi74khPejszE1K5d5mLgrqFiZ3PvQGrWT/PKG7Rc2YhVrHT0iCTQkuCtK3Rxql+I
         k3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066774; x=1776671574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTeLoPuL69qtHikGrHVR6h29M/vzfp4S7SUKcSWz2wU=;
        b=EGSCjQNObUk5wSSGcWD3ajhPgH09eMLjobIgqrQ7v7DRQkfqIdspnLWFyDUyM4RC4/
         Ay98Kx28oDhnOTLyAQ2Aa3IzheadyulIBQLDYXfq2NtIoDRm2dmuqI5nFQOVt0i2SgRP
         //hRmJ/N+n/MY8x47kXrkbI+GSy5azHVDgHIPqK4KWk+o0BrgM4PSVSajqbQiL7mWGlc
         U9zEoD28NEtxoJx+GtSAuqk20dFrSZyUh7prVqEgOe4rnAfhVJmq5m4ZfpxRB+hLPOmw
         7iVEJJPtkvaxTizngKreCpEB2BSSW+CM+7IG5bb5fZ0sHcDATXpee8xrAIfklzkCPPfP
         mGrg==
X-Forwarded-Encrypted: i=1; AFNElJ/OXhh0yg0BbpOJ1VwGICGfsBwvnuF2GRjTl+4yaBj22F5ZO57fG4/U7E4KTjxhGFPWNJ/81xcfUeA6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5XYqwaEjqIs+XvJRpZ1WiSxp9V4wvCZYc8O0IRH9aMDP1Tfni
	5YObGYDZL0M/oosty8+OeFldnb0FrOuG1qfPQoBu0v9Wouqf1GzdERPbPFiIAoI9F5SBiBfBf+q
	kwzZHbL/HH41cuaO4SNv7iHJ3U0Nn2eA=
X-Gm-Gg: AeBDies2szu442YbWSD/P1t9U/8rXojhOvtprnMkKTe41nGUu8ZmeZhGuQKAI36XZr2
	YHMvFCaTkDIwFRXxNVtFOawroKaLpo1XX1NtHClTjVPP7KsQmxQAj2qsFEUNyI7AFbZsHRBp3Lu
	So81Rc/mlOHaTmCt/WdqKgh/YZ1NFgBRCkSE7fNAzBtlM/qzeS4qgX3NfKunjWZ09AcoMzSnwKn
	nLq1DmFjvjng6iGtZ5by28BLTwbP874sCxOIZgo60JZHcg/4ah8L5O46UCR/ib0A4VBxYMbMyp9
	JqHNxGOzBZRORLE443UC3MIqkj331caomOO6ZJUJt97J49qXUTs2qIhholjZpAvLYxlui6IGZQq
	e9cGrWO4=
X-Received: by 2002:a17:907:3da8:b0:b9b:3b90:1047 with SMTP id
 a640c23a62f3a-b9d46381020mr686807966b.30.1776066773845; Mon, 13 Apr 2026
 00:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1775900045.git.zhoubinbin@loongson.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:52:17 +0300
X-Gm-Features: AQROBzDd7oISg4nKnjr8XlrN-YmlCPDBGxSBhjMNA29ixq3SfKpY3ltSGMuX2Jc
Message-ID: <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:

> This patch set describes the I2C controller integrated the
> Loongson-2K0300 chip.
>
> It has a significantly different design from the previous I2C
> controller(i2c-ls2x), such as support for master-slave transfer mode,
> and  DMA transfers (implementation in progress), etc. Therefore, we try
> to name it i2c-ls2x-v2.

...

>  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.

Was it a special requirement from maintainers?

Note, the physical units are special. The m and M have quite a
different multiplier value. So, even if asked by somebody I think it's
still arguably should be kept as MHz.

--=20
With Best Regards,
Andy Shevchenko
