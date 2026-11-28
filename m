Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795840389;
	b=IdNuZXp3S3tJuzO9mKlnq1pYb6SMGWDPa2okfUwLJEx7WWSsIQurZSNzRNfkAzSp5qJ8
	 3qXrJM09ZbdikalhvpAjDiy4zCJMDcMgTs7o2+/W3aNvFDd/9duW3hdiKw5ftTPCV8+Hh
	 2W4rZT5iDJFks0UvufqfSJ8+knuhVlQGJbxCoJKexFS/FmoVWhN8Y/6jwqU7KgK0zb/0n
	 kYUh/SqojzCYFRNe5OCoFBfA7MJ4yMBAkknx/s96Ca8NQfzUpThSuMyDmBHI/kdPqNNuG
	 uUzbTfV5Io1sfZn6ikRjs3WGqGDxFe00AzU8kcPq0OIjFYLRPJU0BKaDfNm5B9r1Rlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
	b=jeH+/i8Geosslo/EU7rtfYtaCed6EEaoEpTGiuRZ18LLy7AudHVUgXbbFraj9ttfHsYY
	 vnKF+wg/gFitnv38JDleP+Cu5eZDm85hCPZO03dWP8GT4Ij9WLbMTG1wmPKgu4flNwOQy
	 Js/bmJVlXQKqfxXazUAb0s7eKqmPdDVava3WufSOab7WWB/hWvv6flAZ2VQl+LVwazyus
	 ZQmsYZMCHrUJmf4dJwL5u1KCsB4lnWa9zMEZG21hGOhOaLWiYiLxvPjBP1l7satZ9J2hE
	 PDnC3kjR2mikkcwWnJIp3cxjDf+i3wLQ3shlBMbaPXj39YUQwVi8iLsw4J8dgssOzBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwhFStPF;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F407606A31E
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 04:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F407606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwhFStPF
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070755c8cso4200410b3a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840388; x=1796445188; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=uwhFStPFskqhXnoduK+N2QkfbdQ3l/s0yIwLSiv2B1bbsHnb1SuZ9x/ESxJ6Wyin0A
         U6o2K2RLng7rfq03UE/m0LuQQhtvOb4Z2IvZgicQY+NfwriHtPj9dBT/M4dQzccZClZe
         7LPfQXRKfjmJ2Xw8vijc5Zx6yQZAU9CcTt5m/Jxxk935hlUryaeUxec6KQCF7p5Ppmic
         mCMn3dBYhl/rJDrZN5TbuKnNeA6dc8lBcNOl/Hwu8cQ8YLzgeUmS/qhSHK2GOVmvA2QH
         AkJDK7H9T41lWqh7mt0x9hiJzliCJkpO+JdYxTfxMMjHdSlAswA9MiBc6UyTwsTuVoGX
         jHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840388; x=1796445188;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=MPyp+TKAdikl2GY7I8KdnzKkY97b75nCo5RZJBsAeUcdG7LCpoaXGjQmrv3czZpOSn
         ApRgTHj/C4K5LTjZHvt5njgDDwE/Su2UEwCwRRE8TOwX9EBtYM/eHWI6wcwUNRaeCiQU
         vb9BXHJkKOjS24IbfQOpp5T6VbtKS16ECMlBbCWMZpLyH1KFaVZKOhe2ye0sRrfSCNoA
         C5mB2bTk5Z50r7RPhn3yz51uPZXpXW7JIt/bdrZzAxDd56bxFLX4hBdMkcbQeyE/ZLkV
         Jy9Fy8aSoK5QIgNc7Ti9vMEab5JjnudNU4KPhm3yOu+y6CvlCJFqXHjb/RO9LHtJsmt4
         un5w==
X-Forwarded-Encrypted: i=1; AL+hErHBJUbTdo/75dJAj8Y9/1RNZG47o3apSiqd2kCprz0fYJfAUlr2ko+SAU28nOAP8U4kxB8sN1tpPXjN@vger.kernel.org
X-Gm-Message-State: APuU4Z/5jsLzaqDDNA90jiLcc8Y6jVMcpa7rypW+tEV7F+2uk21rdxbT
	pNx7L0ubJcWHBRJyakChiAVgHseCvjaJS8pQuVqVVmMjWdusppqFy9RC
X-Gm-Gg: AZFdTZek3qyw63qnKL5IgNozIfpXybt9y7s47YWizkHOB6HDgVQmBkc+WjzArCTR8sH
	WJcwzjtScWBOeIwki+nkuFwZq0oOPyLX0dDpAWRTjCUkEvrdW3O04gExpPNNFxBZuhAtqfbxlx0
	HGnAZ+jHip8nNOFB+Q0jZrjTzyNpGaDFDMx8NJXnjvvAaYgyJ7giaMa82B3MtBIkpPF77FPeYwL
	DQZya7JbswK/VHY6OylLvKRswX2Bmxhw+tUBnK/YY02nEfGb16Qx+BODFliM4CEVW6dEYafYxY6
	OtBYn3bG+9RBEeA/199dgfAgpY1EhlHsjsXuhBXXSf/k5KRm78B+je2AbHHsZDwvRuoHGKgLTTi
	W4mX/T4rHveR6z4MaciA74APMxwnsO3DKO7IBljHzQIsbowONTjz09q4Pi647h8Bfg+lBLiaon8
	WOE+0RSCAqToZjhZ6tqOZOEPBf89M3+xpAIEDTAxfLv+8Dmkt/p4kA+fsRceCgYFsVJiYquivkB
	IreYrERgcqu0JsZpoy1GE+DRRoUL4ee1co9tXEw+YvRoWUiukg4aeSgX0csHGlOpSGGL00CEqH9
	zk+9A5YzXKr5YpfKHWTXslrt4YOMaTttKX2Ls7L622So489w1BprMftNHkclQndcGWLjuF5+1i4
	=
X-Received: by 2002:a17:90b:2648:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b41c952ebdmr24822169a91.39.1795840388460;
        Fri, 27 Nov 2026 20:33:08 -0800 (PST)
Received: from mac.lan (114-45-156-18.dynamic-ip.hinet.net. [114.45.156.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm17993882a91.3.2026.11.27.20.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 20:33:07 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
In-Reply-To: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
 <20261127030009.10572-4-iasnezhkov@gmail.com> <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 12:33:01 +0800
Message-ID: <179584038151.67185.14057994923136112895@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Hi Roman,

On Fri, 27 Nov 2026 18:12:33 +0000, Roman Vivchar wrote:
> I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
> find them?

They come from the MediaTek PMIF bank 3 interrupt register layout that
MT6789 shares with MT6833/MT6853/MT8195:

- In mainline drivers/spmi/spmi-mtk-pmif.c (mt8195_regs[]) and
  drivers/soc/mediatek/mtk-pmic-wrap.c (mt8195_regs[]), every PMIF
  offset matches MT6789 (INIT_DONE=0x0, TIMER_EN=0x3E4,
  WACS2=0x880..0x8A8, bank 3 IRQ enable=0x450), and bank 3's status
  and clear registers sit at +0x8 / +0xC:
    PMIF_IRQ_EVENT_EN_3 / PWRAP_INT1_EN  = 0x450
    PMIF_IRQ_FLAG_3     / PWRAP_INT1_FLG = 0x458
    PMIF_IRQ_CLR_3      / PWRAP_INT1_CLR = 0x45C
- The same 5.10 tree you linked also has this exact layout in
  drivers/spmi/spmi-mtk-pmif-core.c (mt6833_regs[] lines 167-169 and
  mt6xxx_regs[] lines 119-121, where mt6833_regs[] in mtk-pmic-wrap.c
  is identical to mt6789_regs[]).

Omitting PWRAP_INT_FLG and PWRAP_INT_CLR in the 5.10 BSP's mt6789_regs[]
leaves both entries zero-initialized (offset 0x0 = PWRAP_INIT_DONE2), so
if any interrupt enabled by PWRAP_INT_EN (0x450, mask 0x180000) fires,
pwrap_interrupt() reads/writes 0x0 instead of clearing bank 3 and leaves
the level-high IRQ asserted.

> Also, the series doesn't apply on next-20261125. It might be due to
> recent mt6572 changes. Please rebase.

Confirmed: the conflicts are from the mt6572 commits and the
dev_err_probe() conversion in pwrap_probe() on linux-next. I will rebase
the series onto linux-next, carry your Reviewed-by on patch 1/3, and
send v5.

Thanks for reviewing!

Best regards,
Ilia
