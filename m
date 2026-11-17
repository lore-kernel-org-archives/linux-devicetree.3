Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909486;
	b=VFiZtV1jF3J/conjAUncR846meqDfbtw5ByKUZAbKISzz1QFn2fuRxR/tyEi9q8JFOBm
	 mkrYE9Xcb3wkr0TiP23Txs7qDEnMy8X0NLj+S392koN6I+NIj+49PgC3PpercVE1J8ICd
	 xmOyKdwktmcn/LF8zMCNc1o1UZimb1tp6JUR62Yryiid3V+tZy3/T9jMdJC/TfTb116lJ
	 MF7QoESPE8MrqBGndS+rPQZUH0TbP0ABvTFThH9+twGZYe2JGqOnYytJv7UlKqfV32u9+
	 cS0EP1wNbW00jIhXzjRasrAVGDDRhh5H5cXWaCWPVrksbFRNyfWb9Tj83sYEmEhPhTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
	b=XGEQ0xhWf+LL6BjkQ9cd2h4zFDUQtwD5e6ksb2OuTLsIwVG+3OlDLP/+ay+wxwvOA2bf
	 gV4vKZjyB59cPrBJhmGo6LbKstiZVIYrLcBkkK7x1bviFksp1nDGDb8iSHVcbUDltesQt
	 wixEQ8qz1FGWWmqxoXauaqyvzGWkVNn98gzP8lmB37py/m8xBMXzXX5+tIlq4165voT7y
	 Oq1r7xUnQHJCrBaBd5H4jG5jEb2FcUfB1ICrHGzsuP04I+1qrCZPpkjrJ9VK57kmUM8g0
	 JAg5ljQaLuz+ZQyyZvUQcIKeFc77snQ8qsSXKlbyalwiOmmMNjRI5Iy3xdBXDnJ4GlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBlbz7UY;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA7606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBlbz7UY
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so49312f8f.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794909484; x=1795514284; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
        b=HBlbz7UYAPrmBKFGv1u4Nsfq7bxdUa+wlgZaXCZDRVHRIndL/ZAcDq3gnvWc3RrrcK
         9PTTUT06rDDFePGSAXZ9xFE3ULqvtH9HbEHteJGLPTZy6v8P8+jAGTGoaR7SCGwWk8le
         qJVtvGBERdEIflHCMnAdfdz03ysMIgM+7rLNaKfWrakYShK0NN8+krffTMco8/5yOS8o
         0uPHHPkfR/ADmOXUXOBFNTcBSqCfXZx1bh/gpqaq6tQC9h4WDTmw87n343r+15D126v7
         C6AWn5HgbBdaV4yiwNiStLkTvXw4InemsPD1qTwxtSeJ2jOv4qh1b9MomF8C37TUZ0wn
         ugZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909484; x=1795514284;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
        b=RXtylh22ARnLGal9WkTe+GCNsVsE1kY+VEXGsWluIiNKd/oDWi1mrfu7G8gGZSg63y
         HnyplaPe9Bf2VdjjAQj1rXvkFa4UcxO17t0gLPBTh++YH0WKN+IJFy8s1EjngNG9FR5V
         nd0P8HGl7NH6PzlR5ariI37PBmJRlp78H8f1eqmn+jO5ThfkxN2uX0Jv4CPAtIM86kpa
         gosyoOgjyEOgHQqulwRCPo4qfdRQzC0FpQL+TAy1+XX8oXsM/bdDj6T6ue7/FAdHtC4k
         1yU6rhdgI1/GSfG+ToAKkcjWEMkBqRFvXLiTOMpd6vUaYdLMj/8T8gRo8LGWAtiG7rj6
         ggaQ==
X-Forwarded-Encrypted: i=1; AL+hErGXOohNZISEHI+coBRXRrRtql7mmzfmNekzlIHXig4EvnWlVkRuAfdQXjd5LSP5kre+3dfFdyfGrx/l@vger.kernel.org
X-Gm-Message-State: APuU4Z8j+xm6w+Kv39UEBWKa/Oy/v2tpRvvbju6gyxzNbfFBMAfbZ8PO
	SKceYe7TDFAmh+hQTKy66M8t0jtljc0VAZMdvPSFTAnCUA3lib7JA4FzwDCqqGvfKAw=
X-Gm-Gg: AZFdTZdexkswshm7KRcceFQf6A4Oub1zK8/zY45sXa7jsjcuNyWh+yWPnViP1ZQ8uVy
	jBQS4NBWMFYo8STgM8Y1yCEgPl6l8khaPSf3SSgiH10z/nO9UL7ATnpGCs5t2o7mT+3/ePSxAXT
	kldXsE/wFOtNAjpgPsDgL6HCYGF3pMCpGeiF0RvXQtrX+zmtb01kB1mCKQUB0YS2i327XKIjdv0
	8V3EeMsfgOTCgCqxOhJ24P7FTizVEE+Bwn/BDNDHKkH/OXpF9IuOsnM+22RVjGqP61xPB+3ZBs4
	x58rjTedA0zNGRD7vucBzvgam8yq74VfE22WsU8L9p0ZsBOKPOVvnQjqHN14YiKJdW5A1oN+3FC
	a7JVBY7z1bC89AGxeW/IGgK1mxu7qqb7jccfQEyfVMQKawVzzcBWll/MkXN2kZpi0uf1icw1g21
	TuopGG8t3aWS9zX9vVaCyS1IPRhY2zcrGtAX288v0/AJlMNxXhHn/x3QqBrunsMLl7RglwjDztw
	NcLBuSYyf5uncJorPNuGPTSG67TK6ZAL5wMWZDmYZ5ZiTd9Tb+tcIrntVi4jTB7YKA+ucK06XqS
	NYdLPfgVkxrnEnVxEX7MY6IrS+tXsotqnM1IXA7/u6+pS414b+0XS7bUZxwHMBqvFDgvvg==
X-Received: by 2002:a05:6000:4911:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-49c71784fe5mr27875992f8f.32.1794909484352;
        Tue, 17 Nov 2026 01:58:04 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a33c344a58sm4540848f8f.34.2026.11.17.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:58:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 0/5] Add StarFive JHB100 syscon modules
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Date: Tue, 17 Nov 2026 10:58:02 +0100
Message-Id: <179490948276.13037.508529632883431639.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=A60UEjvsGJwLzqqdQ3rQrk6QSaP2ECtLpK66B0J29GY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/VLU8E5Zp1f2ZNK+vg/vIfFbPR3sinreb/npj0eJx1
 139qviZjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzkkxHDXxHZRufsaT+tZf2+
 Be3sz/ZoYHgdJipjuqHoTlP3Z13dLEaGHfJfWzfulbz7PPLrpfZFN7IWfGW5Ye9es+dGaHbPb78
 TnAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-10 03:58 -0700, Changhuang Liang wrote:
> StarFive JHB100 has many syscon modules, as listed below:
> - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> - pcieep1_ecsr_syscon
> - host0_syscon		(Host0 syscon)
> - host1_syscon
> - husb0_syscon		(Host USB 0 syscon)
> - husb1_syscon
> - husbd0_syscon		(Host USB device 0 syscon)
> - husbd1_syscon
> - husbcmn_syscon	(Host USB common syscon)
> - gpu0_syscon		(GPU0 syscon)
> - gpu1_syscon
> - b2h_syscon		(BMC to Host syscon)
> - h2b_syscon		(Host to BMC syscon)
> - vout_syscon		(Video output syscon)
> - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> - pcierp_syscon		(PCIe root port syscon)
> - usb_syscon
> - npu_syscon
> - per0_syscon		(Peripheral 0 syscon)
> - per1_syscon
> - per2_syscon
> - per3_syscon
> - sys0_syscon		(System 0 syscon)
> - sys1_syscon
> - sys2_syscon
> - strap_syscon
> - sfc0_filter_syscon	(SFC0 filter syscon)
> - sfc1_filter_syscon
> - sfc2_filter_syscon
> 
> Some syscon modules contain PLL, reset.
> This series adds related drivers for PLL and reset.
> 
> This series depends on the series:
> [1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

There is still work going this dependency, on things you depend on.
Please re-post when things settle, taking into account feedback on this dependency.

If you can use b4 pre-requisite to mark your dependencies, it makes our life simpler as
it help automation pick it up. Thanks

https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

-- 
Jerome

