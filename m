Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913053;
	b=zBoOKd8IWzakDmjdjMl3+nyqn6LHPwmvTALNBomkABbRVanp6avgg2Y0KFkByrK+/VdU
	 8FJTTmEWHmrQ8+rMiv9X8gEqjoZmQaddgBCKZ+SgVm8qZd9vEakdDvzEMKTm/eXBYvqn/
	 o+pcdg+TNr/2L3GHN8HMMl7uRbbRTqDBxw4V+GgVGEOVX9O8yj0lvGw/AvwQ40xNOVGcR
	 qf6uo8eTmS1CWlVJH7EwHUFGpbnW9e2RANavaYZyr7voCaHs+B3pIpTdYF1KTz3tlncN0
	 t1WyvnUx2HpS9ps1yFGxkBKSED+cQkcTw8nLYoAxYNwvxXbO4intA1EJX8djG+iS0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913053;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=nAEj2+zGM/3XkCWGNMk+ECxEPs91EtFhdr4yuDuoVFo=;
	b=E/q0i10Alvwxw2e+9xnEL7TRp8WaMQ6bOgdu26YaHSa17n8A4qFGMhem1Qd1qE5hkN9p
	 H397PXpKqZN8d4tb5G20g5PWsLnj5Zd/VufFCnwIcvEsv16QtAIqswL6+i9Tx/IzYCJzf
	 GUGt7fad0IbYUzFsMLY0LjLek7GkvJxiLXk95Hz/W3MiNmGx3I07X+nIIfOfBC+npGSWX
	 +0dgZmsJgbXVZyH996QXrI10/D9xITATDraakYEFmjoxjov0GjJE87RgCAvMWEZqQT10Z
	 Dy+KOEZpOp9WLYr0oMULC1gfO5VfIO1OE/OE61qJfmfP2our3mafwRdytNg9xfEkBTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6972606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6972606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1267956a91.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913052; x=1794517852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAEj2+zGM/3XkCWGNMk+ECxEPs91EtFhdr4yuDuoVFo=;
        b=adnq/6V/zl/1Rm/WygeMPmXIsdLNMK3VcHk9Dt5/4be2AiTGgUA3/o9x4AL1ZbR+be
         LVHF8dPENDjpwQbt9W12/q9XbXNF4IDZjVSBz8Sn+cxL3oHQ9nsUCs+xLcrzoVsmFisT
         gGGSx4ar9mZhaNw8R6ih1AcH1MTSPWqMM5qqjzFzqnx1aBG0YAp4dVRbztQrgh85Qe6E
         /fSaD3ucUJ50snM/+L5CKS21ftcWIWUa9U/uUiDVaPpJ86jXTdaoVrl1qOqx5aBWDi1Q
         hcAPUy4aP9+Bh4HS946ecxVZULfUU5jgM6Ct71oYBC14bbJWlvvN+WSIgsA4C4FpUG1E
         a+Yw==
X-Forwarded-Encrypted: i=1; AKwUvBycP/jPCDfuNguch+UP00rXpwEEEqcCHseyXicj4wDwceIRIyakamoDlDvWmVqkoqaC62PPDtf8vphH@vger.kernel.org
X-Gm-Message-State: APuU4Z+zHzY4gHVS0zhUyCAAfFoEUbWRMbSJbNt4yGPeW9wT6tYKUiBs
	OaMuecXfAm8EkK3zr6QW7/xSMlnMpH1EjJq9aeEqqX0zkuNSz4GXGT3G8VbFpwAY
X-Gm-Gg: AYBFou2+oxpPdM04G8i1OsZ2m+7QPHjAfSlJvHNzLVRfjCA0hNJzn/DAenzYU+BqBuO
	udgtfS2tMy7PtRNxae7IWTeE9jRDEPLgc43GCvDRHo7JyD1CE4A1LjAQ3I3dp2lBj+tDICRCHwH
	szPe4Eed/FW4tU2akI4vx/dv37X7Pf10x34ILVxkWk22QxanR0ltvDpSp5Ila4U95P+7XV1zS0X
	0Yf4kRwMyJAtCCQMpJL96ZzsdIcVsddllt92mxgGoPjf2dxpNTLXx5GU8RI430yd0n5GfvzVoZt
	oXULZUm5fz3Cqfi/kRcWI7B6GiMkAkPhM4wao8fEvSojTtxCGfiQxkYKBrvkvjjJ7Sww+01Pl+R
	Hk3/3WJivyFU3VOsbZlH2LmuRR809fSN7+//BZ92a0xf3il7HUyr+PP4ORdVdC6i45Jc+J7F5Zt
	8gtO4KwbOzcEKFYp8FcoqZXXEc0obcTb6MqFyLr+cXb8SJ4xE9EVuE3iwVWxF6/NnVXIrzwXSbD
	F9hPeSRxiOZ4zFEBl3qcSzCCpGMz+qO258k2dZTe0gFbY9RKyq4jiTPGlSXhuGour/oL68/StGW
	wPEURPiDFejeCuAIAEbJNO8YIJKOHqtKfcZdprDB2k+jHYfFythpCs8oatrFE4hpggiw1Ebvd23
	V9rS5I1OBbjbjWC0dpksX5BzNfxReRyPEJhyiSb3oosw=
X-Received: by 2002:a17:90b:3951:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b0db6f10d7mr208242a91.26.1793913051954;
        Thu, 05 Nov 2026 13:10:51 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5111278a91.3.2026.11.05.13.10.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:10:51 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso105939eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:10:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByiTMmZgmFM+lwPPo8M5D78dd68C7znTkjlws2yaDJlgWTo7Nwgb0Ts9WejXXBHwLQl6RjvUEeXt7WD@vger.kernel.org
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id
 5a478bee46e88-36f76023af6mr403193eec.9.1793913050522; Thu, 05 Nov 2026
 13:10:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev> <sashiko-outbox-199396@kernel.org>
In-Reply-To: <sashiko-outbox-199396@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:10:39 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6OG5B43AVKOVm5k4HurTB1u4hJQGgLyvgGfm6yY56+0Q@mail.gmail.com>
X-Gm-Features: AclHuK-pj-xm9X9wgWQkxGyGq4DurFvYioljAxStC8zAaFVSdtHpwpbzJ0LRFrI
Message-ID: <CAPY4CJ6OG5B43AVKOVm5k4HurTB1u4hJQGgLyvgGfm6yY56+0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Should this depend on MIPS || COMPILE_TEST (or MIPS_GENERIC_KERNEL) until
> the platform Kconfig symbol is introduced?

It comes from the SoC series, which goes through the MIPS tree:
https://patch.msgid.link/20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev
Until that lands, the driver builds with COMPILE_TEST.
