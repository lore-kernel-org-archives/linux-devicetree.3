Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519479;
	b=1U7Qr3aicErnhmot8SGmuhP4t3b0swDmIv6ArAakpmrzYtvVVF9T5nChGkbNpiRsKswm
	 +R1QNkuB4+3QwbjaVI1rty1wtHRlb/BZT2fABuawoEBSG/7S/UKIf5cv07Y+WEMz2oiGc
	 BzAtliXV3zOvMp5OUucEPuCgxMZuw9PwsBUH+J8RnjcfUJT1XCo5eKF8nF9uTgiw1Hm8n
	 v9n83xPlmWdeBCeuOS9wcylb/aDBsRN9lHAwEtYEWMxsalZub5hTXzQ3cRLchj6oolBK+
	 yt0VAC4QjoUa5WeJWwYJftTLx/SR2RPzxxy0gKRVsg2mrrH/5nOwHnCujT7QDd44eGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
	b=mf/YoTe2qynsvYBc1AI7tauwl16lioUDEzg8czx1cePL4jQCuAm3l17WVP40+/i46kSV
	 cOuOYJxRy8ttuXuJcgujaCpPuyp/rNU+Ws4IJPFYaP6iIwoSA3E/lxKT+mJhj9G7rWnr8
	 /Llbr3lxeef2zkbqNWWmTFx9MxAheKnJBSALJqB7bAuqGtVlPQ7S6dC+WrQ/6RDf+LhiU
	 ztZbf5IjQGvwzsKQS/YoxvsKqyWXDZjoa/zb/LKbZH1/s+ObPTAWX5ILbRgifEWantTKu
	 w8nhSOOr/UXy7umdnnV8qhs57G0B4XSUkvCBFNvhG4wKsWsbnH5lhaH4xDWZTpF0P9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CC606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so242983b3a.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519478; x=1795124278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
        b=xKJHd95sAilNxDe/H/brYhVIDpN25IywGBrYMIgArmXUljg9giGmywpiHONeDqHMJl
         STm0alalvjNY6VxoqVNq3fcBcjZkqRgtW+lKVtR7Z/HmigzCbunOykLh1viNiKzdSP2H
         CUEfP+FmDjjnBStpBGtLf4blWmZnww+3nNyIRaYeYWOt92RLy9kDwYz33lUc2HO8kV77
         PcbN0lVq2IyDZdOeWummY3QbInN0AQaeZF2zrPNQOYa7TMVCt1GKG44xRQ9RI1rU26ej
         yNDsEJysOzmLuJR+K1jGml3D6Bmi9lH+aS9HQb9INCmhznz7n/mD7qMgPxfswlMaxaGn
         4Tuw==
X-Forwarded-Encrypted: i=1; AL+hErFN1UX1S7o1/chThN61j2DKBJs01OOotBGux+VId97cTsXGxcpakcM6IC2P9a4t5FR5tAZL4LAqpzcp@vger.kernel.org
X-Gm-Message-State: APuU4Z/UnJS1R4EeAgTUf0p7/lVFmEE6JbNBuraoSZzkC1x9mq31r0sc
	rC+/WpVrzQMSk1WlHTAG3AdqyasU/iF/ZqsNIbxg7kWjKoQ9+Nuul8mxAViFKcLc
X-Gm-Gg: AYBFou0GhncBrmDqt/oDQ5tKcWB9kol57WaQ+7MHhY79/L83VXqrE1OK+E3XQHj/oTK
	FcukDrVaz3BqBJ/lLanxJIFd5rz13uBpcPWI+jvLRZdCmok1ZmFJWbjwueQCRLmBBmj/h6IdO/m
	eGKLWSMjThIsaIzMhc5ovmA44b3ovqwBsHf4RpDLWeQyKjLOiZH3UMiWuWx/btyaIr75+ZDyteU
	lba2agWsMt8749Q19UNGRtFWLxPZfGyTb91IULTtkKDMkaHkb9wFmTa6SPUnQLC0IchPEdG3vYH
	V2aFTyGqxrt/HfaqJrDpP6aMnERWvkpUTrFcO/g8d+W2wZmJ0EaagoiXzLAs4zmDV9hcXcKDOft
	MzlNSplO3uxNCnCqK/IMXLeueI2ibZbaXYSTujxAKKqSwWP+fvORZudGALSTWytA8C9ikF46Bux
	d1jlg5p0ognOQwp0lc+5L452I5aQYRIYHD6/8C8X0AfULzaj+x7i4IXlGPjLKznUY/6AMzOJMuA
	l5Xy4DeQu40i7rUUkoqB/Ok6dpeuJv7mNM6JcPBIlqy5X3Zc495kaHoyY+D2vOSf4e0eSBMPBCS
	i8tzR6shcfpOgRo86u2/lTX3YmeDUS5xLgLWEYM004DlnFntOPh3SH9fclw0/hzlYIKYYsYbEs0
	MC3jVa/RukB73zVUsdwtiBPGk8aFPniVMcvpetGIxwGDn
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr332597637.26.1794519477686;
        Thu, 12 Nov 2026 13:37:57 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6db9asm145748b3a.22.2026.11.12.13.37.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:37:57 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3791619605cso683771eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHbUdcdxylRObp7TCVa6kHaWe0ei6ubKcIWKyLKCsLRh17OzihYbIDRJT24ZUJO1Cbx9yOeSaPvvqn+@vger.kernel.org
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id
 5a478bee46e88-3798df3d361mr53568eec.13.1794519476959; Thu, 12 Nov 2026
 13:37:56 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev> <179444699398.1126566.18079369824329437583.b4-review@b4>
In-Reply-To: <179444699398.1126566.18079369824329437583.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 16:37:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
X-Gm-Features: AclHuK-qYQ4QvhuWcFcAv5sXFh2xbA3gQD3BM89Iz_DI_n7EaCswO7U9VivUGq0
Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock manager
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>
> The license is different compared to siflower,sf19a2890-clk.yaml. Is that
> expected?

Yes. The header is Chuanhong's, and it keeps the license he gave it,
with only the identifier updated from GPL-2.0 to GPL-2.0-only. The
binding is mine, under the usual GPL-2.0-only OR BSD-2-Clause. Both
licenses let non-GPL device trees use the header.

> > +#define CLK_MUXDIV_NPU_PE_CLK 20
>
> This is the only one that has a suffix of _CLK. Can that be dropped for
> consistency?

Sure, v3 names it CLK_MUXDIV_NPU_PE. No device tree uses it yet.

Thanks,
Joseph
