Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097B3F58ED
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106198; cv=pass; b=niO6tB7bsv1wJMxBaAk811Q8+oV8KMosuy8LVEO2FzhVhcSjwYicVO+b8yE3VTT89sLWVCLiDlraqQn5YMXWZVeE7Dn2Fd2ENqKi1aoCw5vZmRvpmNkqFspQV3dxkZ8KbN9/vx4F84jjXXP5FtSURIVfRMFcnkCBUC3p4XHhbuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106198; c=relaxed/simple;
	bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWWziNJs7QMqQWZTv89A+/5fUFNtUukodEeYHjzccjREI3dp7zZVlYJsCYvnBfhgWmBjBharjGMqiAToKOWkc2XdcwXWNe9HdqLmJ5vo0k7ev3IKZoO72Wqi8X6DzeC53E/xff9cBwc94SzCWm4wfrwZWQ7CcmMe+K1TVF10SIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEcpMgSr; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEcpMgSr"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5751770a178so581582e0c.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106196; cv=none;
        d=google.com; s=arc-20240605;
        b=NaflPPcsg8N62RRwf7eA/uUW/Xoyj2flmlz4P1/7waIFrEWR+UBAi9NJvJph9m0TGz
         adYHW8Z8CAnDC4zTDTbZ57ZNqJXZ4R+Raxxpldyryq7Qsqg41nB2eYPL8YVfpqkOPkeq
         avPd27cgot60okkf9Ayn/lMW73gKafhzfW2n01yyLH3FBJMIvet/EYSTrtHj2+uiIO11
         1lywf5heeynV9g6pzto5SO0iGu7fq40R+2DhmXwCr+hARXbRtfBkN+AZ9SjiuBcWPMvz
         yEA9itqdndKX3xZcZjVY170CxSQS85coXr/YZd6TVlFAnfr+xhboSEsepnreTcYoM/9z
         LPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
        fh=3jJ4yeL3nMmlyTzXFfGkTxA7/toM24O1fhEAbZaCykg=;
        b=bfhEWhm/aNYjVItral5DwL4eRbIfwlEC3xtZX/o/Mm5eulT4NAw6SqCISRFC+OOVyG
         e/JK0b1Pk/Wb5/zqCi7RCTVrheMckgLOX3vaJKv9LkmD97xFgd3SJpiJtWgTgiVGqfBl
         4t80XpjmDWDYvhOaUlNMU4iQDzQ3fyC92Ne+0CICo7b0wacfAR90VgXQrQG4Cg8P2ehw
         ysCGeNDoknCdR5pdwa2J12IGhzv+bL4qOIJoZ51SduVe9Kbi0Ux7X9uxg5g2QgCB/4bX
         0L+F85aiA06Os5jQlshPOHq77RHtHwoxhKeNlUCjK30rdTg+LI/xS8thwltDHOaxZL7h
         JTOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106196; x=1779710996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
        b=VEcpMgSrTCWwLdGo0GDRrmhpXA9gDUw19PYPHIJ/h6olhVXjCM9NfJIMfLmqMrXm6V
         nheU+I20OqX1XY7y+v4ZU5uP6sqFkWtgKE1N1sf4QrxOFYP7/tvZoXNYYBYtR0IhXH67
         PnnIjsO3DgjsB6pJZI/eirDcTSr7IkgENzY7LGs+aeNku70w4WAJ3TbmZ26HbUd7dCkC
         QuWKkgEmBA5uQ3XwAvHKcjHECfWEVM0/GDmhab2Zzj9EBVjnBdk2mw4RoKzJWXpBCvnn
         pEf61eqSCi2Nj88PBo2EcQ58I25w+xs5AMz5T+PhDkqa0jzsejkPjZh34Wwwhz3PHxVQ
         D4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106196; x=1779710996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
        b=OGB3MiQXBfSY1Fry97e9RiIg4YzbRD+5EmYdj9n54PSXUgWIIdaY1Dgdi5DSk/xpU/
         iZZ5ZpGwyzw1H+oR+gNo1msnj2FuPzWlQ36DB9yRhi2IlK6gzU4om/87ypA+4s4sgN7U
         AbPV6q5KTRbMR1nWTFh/9MOvZAiKKlFF5AGL0aUgw0SHEBNJWPu+Wf4gJZul4GLvCuit
         xPcY4fY7vni7+esUiBSyCTssLWhl/lbW5HYV5oPkh+oWlKYWCcAf+KBnCI9OqCMGaafZ
         q3Pz5v7QFtC8yfBEjknwDvMHxDBErgAQg5UlvhzRT90k/BcZOdUW+jX0ggZdtvoY3LUG
         xVJw==
X-Forwarded-Encrypted: i=1; AFNElJ857xbM7GMrlVJWhJsLhEBDiPwVN33zxuphkaGljFsNcGkuCpbTgIi1cE6EvyIjYWhtxXtt6waUv2s2@vger.kernel.org
X-Gm-Message-State: AOJu0YytTIxg0uwxg0mBPJCVVhg2uiRB6VSLK2BxF5oUCC+G3RDTizVo
	X6XT8ZGTVlby6Sx6BqQ+4fyEKz2Wb26O87ItbAdnwWyhHaYATVJ8Snf+KzSsNW8ZlzaL9Au/VC2
	KO8iHuLKHIpEcO8HR17RzrDsQ2b+ntP9qiCaypaMLEQ==
X-Gm-Gg: Acq92OFH5S00vGI9y1aldcjtg/4nGWuVlqWo+79uhVWQwxD0miFFca3NtDQrMu4WknI
	x7/Sdu1u8ZBbQJWxs0Py3Mdd56WbONeK0u8Bpj/rHv3ym/OfkwT7iBCqB1xUi5jKCDgAXgStZ1T
	3yKcag3EFUtNEUbIbbGSTJkOOiVENl6Fs/kz6YsbdI5NMr8KsxaXc1fJ3qxVy2akoB3nTI6nBOA
	TaBfrItkdnbipN9/gd4JNKHnXWswHp/2R1IPro8jE3lteWI02LoKyaVDvk5qHEMypDHj+zbymgk
	W9KigXKfYq05D4ocHdfb4d0Q85pmQmtKpWnVm/c=
X-Received: by 2002:a05:6122:2407:b0:575:29ef:7df8 with SMTP id
 71dfb90a1353d-5760be39b70mr7202066e0c.2.1779106196212; Mon, 18 May 2026
 05:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110092326.167575-1-mitltlatltl@gmail.com> <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
In-Reply-To: <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 18 May 2026 20:08:55 +0800
X-Gm-Features: AVHnY4Ksrs9aTussseNr09raAikIjCq76pmPVkVYEhG45aPbYof4tvxp5Ck7-Mw
Message-ID: <CAH2e8h6skog5P6hPc_DkVpJzR1Wj3s7j8jx3vMcRyCn0+sYqCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 3:19=E2=80=AFAM Jens Glathe
<jens.glathe@oldschoolsolutions.biz> wrote:
>
> On 10.01.25 10:23, Pengyu Luo wrote:
> > On this platform, according to dsdt tables, usb{0,1} phy consume the
> > following regulators. usb2 phy should be corrected also, usb2 in dsdt
> > is a little complicated, so correct usb{0,1} only for now.
>
> Can confirm that this works on blackrock and x13s. And I went a
> different route when I tried to verify vregs for blackrock and noticed
> that the vdd voltages didn't match the layer of logic schematic in the
> dwc3 block (some TI documentation), so I switched them already for
> blackrock.
>

I think they might take the power sequence into account when they were
introducing the devices, vdda-phy(~0.9v) first and vdda-pll(1.2v)
later in the upstream while vdd(0.912v) first and core(1.2v) later in
the downstream. BTW, the DSDT is unreliable. On my platform, it
describes that several components are consuming several LDOs, but
these components work well with these LDOs manually disabled via rpmh.

Best wishes,
Pengyu

> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> with best regards
>
> Jens
>
