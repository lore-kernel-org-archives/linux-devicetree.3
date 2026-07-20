Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC58411661;
	Mon, 20 Jul 2026 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568687; cv=none; b=XYqMyWJazFI9FyEmY7CbHvFUfkWs11CUCJqiWYqDUT+lzN+KTBKudf4pELrvXkylC1pKMW6CdSa1tGM85Y25SCF9z2L+8kPJGVaRmXTrFyeb1BUnAYsjiJTl3bQ/4Nu9bF11n7nfL6ln/WgXtU5Xbt7aDSNTa3zJI6DyJ/6ETug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568687; c=relaxed/simple;
	bh=52DwpoynaOvHM9vJEebCNSBs/KszUUs7RtD+zNy/ZDY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hYDVrAKh7AbS8g0jr/6NOeeivBmlE7WsbGrNduNB27ZZJ3LCFVOsSwozUwAe2+dc8+nJbEvLwx6ajp0Bpvcw5b0G0kGBgdOLzgDD3QoC5u7uQGEEsGodAWzBrW+oSrKPajhmm8jZ1kL9kaJPrW1FBGFG9HUJQhKoeAso5PPnofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=jEnI1ye9; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="jEnI1ye9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784568678; x=1784827878;
	bh=cO9f88LeBetQWeK0wi0uVMRKku3fwGmKFJbkIHyQjbw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jEnI1ye9WDJTttfanXzHusDpkUnDvka+waQ8U2QuUOEYlGscl6pA2KZNYytnROVvD
	 DILR6ucvJFXgh9UtQwjGinq7Rwg4437kd9w7VChmxUcSnUSqO7OmWFtlKKoKCE6lTt
	 JQpwnfgwc13MrCUkXtnI/UUVMIPOiuYHa/HgL6IiB7iNqfIWrRGmA8/2ZfoWuiFmUW
	 5OiCQ+uJAKtuOp81t7DBsssrg+uMjisIB/HrG3BgZekjQLMWltd8hvU3PMT6eY7SKe
	 VunR4KqQ1hwt4vASRHidxwClJ0+ymIgqTiwqV9gyB4dJ/l83UVfJJ7usMMSz1tl8BC
	 il7IHbEtyWJGg==
Date: Mon, 20 Jul 2026 17:31:12 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
Message-ID: <UBb0LTozsXND4yCm-5gQEAG4QXz_21gIMGXI5HbsQhBzbfJnwk6ShZN0Sob-K8w-0X8l4gf0KF4qjpnOK80l53gTX471Dh18dUaiUhrsb9U=@protonmail.com>
In-Reply-To: <LQrjqkJAVzl-TSaOAypAQdfM8rR4F59aSX5yJIw8S3neOhFlPmTeFrW1PBK4JDos7v7VvL8nTblX22lK78U0FlVE_bwuOJYR36CK3eDE5RM=@protonmail.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com> <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com> <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com> <LQrjqkJAVzl-TSaOAypAQdfM8rR4F59aSX5yJIw8S3neOhFlPmTeFrW1PBK4JDos7v7VvL8nTblX22lK78U0FlVE_bwuOJYR36CK3eDE5RM=@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 872230804a0fa388bed88c134d29216f79c87a3f
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, July 20th, 2026 at 4:33 PM, Roman Vivchar <rva333@protonmail.com=
> wrote:

...
=20
> Something like this:
> - mfgcfg
>   ^- mfg_pre ('safe' UNIVPLL div or 'unsafe' mfg mux)
>      ^- mfg (if you're here and your chip is NOT mt6572w then be prepared
> =09         for crashes)
>         ^- whpll (or any other parent, but downstream uses WHPLL as GPU
>                   clock source)

Oops, WHPLL sits behind the gate, so the clock tree is this:
- mfgcfg
  ^- mfg_pre ('safe' UNIVPLL div or 'unsafe' mfg mux)
     ^- mfg (if you're here and your chip is NOT mt6572w then be prepared
             for crashes)
        ^- mfg_pre_whpll_500m (or any other parent, but downstream uses
                               WHPLL as GPU clock source)
           ^- whpll

(Using 500m is a bad idea for the PLL which can change frequency, but
I have to revisit clock tree once again to make a better decision before
sending mt6572 clocks to the upstream).
