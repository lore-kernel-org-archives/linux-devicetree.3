Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823178;
	b=NtpyeikKxxQzJUQTKkx/Jc9HG8MCLajFTvu538S3xGLF1Cb44A0GoLgm+8HGF+CjBnmG
	 M2SJcShrVCjeIyFGMgHFFtCcSREA4uGYBbUe/hYz3KEMEZyxsL2bTErBbN/haMAMcHjii
	 rr3lxgb1bgoiVBOfdxRBTtLMuieJOZJ0lkXFMyaDh51dBLK1NlvW50ZYAfN7A5n1P124y
	 BbAYlM4MuTF2mNiQp71RCOSN/aPXwkaxB6LG+rv77Msdn0WcP08BA56hY6Wdt25MN1Ktu
	 Nc/gKfwq73HRtpoCXxwBigb9l4rujPENjL8H/VsmYVZv6gdo6O1O9mxBFuFlH09IHlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823178;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
	b=w7Q4OgviUEJYVDAvHvsMimkJfYk0zi6gZzmEP1gC5880AFCzsoR1UiyodBWr1o884j6h
	 diBac2Bq4fP4oygtVgfvg0Lgbu1LRas7ECdEgHzUdHRG3GEwYMm2Jq9rZYellcmkfuTXF
	 QPsi302+9Pmb7vcyjrLCd4/MPrwQcCjus7E0zJL0o1A7LPu/XxSX4P6Yse/3pXGBrlcsx
	 ajwV06l+z+e53GE2jyHt35lMzlQw1wZYPYczQilGohk2DjjcTtPLPi0FaZymvxrIhyVfp
	 JojNddZ+8EQ1j7IslF7Z/0X+QrQCEGeIpuWAW8Q6/NZZcXzamP/xLVD7/ZzmMTD05tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD066070F1C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD066070F1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so786279a91.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823178; x=1794427978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
        b=SL2tJFCA+lXpKa39juPF1be6KAa24YWZqeJaYtZBJbt4nHEh1ertMcBk3LRR5P0pOP
         9tiVHWBSJkC+ijWj2tuCflhQkWmnX4SmyLTAvvCS/viMKweE+eCqImLdCkMINoFwLmCS
         NWaH4JDfsZE+f1v9Az+8PU17B8iBHm933j+ULRND+c9agxuo6mfSOuLN6U2mjuMklUtG
         w3Il2SWbesFGWVRNS13n0O3wncjBpNynifUN2expj0GbCxwUCDb5PREdEeZtR/8S1YkA
         CNpUy+xOLRMn/BIymzuxxV9/PXJYaqWTWWY546RO1VX2YYFvsEmwBnevCdUulUlOvZfR
         Wvhw==
X-Forwarded-Encrypted: i=1; AKwUvByIhosL3mb71k4taqNkJYXRQWCNJJTmLTJS7drYcYg4khvMd3/j+qgPq7VzdklSiKkOYSM7M4MCrHtL@vger.kernel.org
X-Gm-Message-State: APuU4Z/SIQPDa4VGOW3Cyo3w0HjyRfPZoiF/ne5vxpM70XqGSsu+RuAv
	0GtopcAVNc0PxldYs2l+lOfpfyMihC+pBMrttKINtOyA9I/34UfpRbGSSUTtF24x
X-Gm-Gg: AYBFou2t6HSGx+g5wS+x2n9f+pMMZ5D8Xk3+F/lCVTV2O70Yv/e5ImaOtQ8/bBAa2ZJ
	3mlOIBa2FbsCxBGFSj8DI4x1VdKuv5T3Y3pGoms1v3bWXYCU3vLvgKHfpguWW2s9xQ3YaIxzLuU
	g8CO/gAgG+FwtfsMf8+vBoCOPoLFCfg64lxA79AwDqRpsfmy3aEbQEYU2k6NkO9RYhow0JQa9ie
	Yhbq3XkuJakH1kqR7YV7CVnxbQn/K3I/5oJh5WRkBw/BEE+/DfolkB2szIUv6bE7/lerrQ2e5hH
	GjFkn4QNQ+KgtpvRN0no0ux+vQIKxulbRzxVJUWd8wt1xv4IEKEig/ZlOcxwUpRBH2Pe1uWZi0+
	y8XJ4eWl5PU9NOflrM6ltb8kFKLJ2aSw7q6dsaSjXqvVf1/V48Ntu3XpjIV10/aIdVOgy+6slWk
	6XTpDyODKyVchReVreo8V9NYNFDLGcn+GFyH4N9lb6W+h6pt7c8K+AXKaTcEx4icz+tvBSZScoJ
	MBvKAPsBdjO/kAtvOYXvGdAj6G1YoQWDvagJf2SmhpyUeOyoA8C6ALKbaLpSk2tUDzD8LPl0vnc
	PRuQIWT67lQm+IoKblm3Y8x0ITfSxnBXqaKq/UKkR1huHZFUqLwieBGJOVB4mYspygLPbDSM77S
	nQUjtPVwx+j3LBVXbHf1ILxikWPMJ7HCYDhbfBdE=
X-Received: by 2002:a17:90b:562d:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3ae898149d4mr14209569a91.26.1793823177782;
        Wed, 04 Nov 2026 12:12:57 -0800 (PST)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm445226a91.6.2026.11.04.12.12.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:12:57 -0800 (PST)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1313082c88.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxQrKhD3XiKAga4gw41A+awCvLKNayeWxwuAfw8EiI2gIGD/eLgaeE3WUwI7qSJMCii0YduY4+qctLB@vger.kernel.org
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id
 a92af1059eb24-1b0f0f5e3b5mr18258532c88.34.1793823176925; Wed, 04 Nov 2026
 12:12:56 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
In-Reply-To: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:12:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
X-Gm-Features: AclHuK_90z-X_G7lwJns7lB_5N2ZLz7CerbTGbvWSwHLWG_G7heWWc43q7AWu_U
Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why? This block is one used repeatedly inside this SoC and SF21,
> I think a generic binding with clock & reset description in dt makes it
> reusable without further changes and also results in a shorter driver
> without a table.

I moved them because writing-bindings.rst asks not to put in properties
what the compatible implies ("DON'T add properties to avoid a specific
compatible"), and each block's gate and reset bits looked like that to
me. SF21 support would then add its compatibles and tables.

Either works for the driver, and I'd like the DT maintainers' view before
v2: a compatible per block with the bits in the driver, or one compatible
with the bits described in DT?
