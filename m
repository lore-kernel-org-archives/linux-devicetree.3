Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823640;
	b=zPjAtq5y/aype1qXnNcsojyM6yMUaXm7ackEBImPlu4oqhs/LiNkLYxDQdfbUlLkAQeL
	 3VSkc2hpo9/KeHbm695I5BUhC9QSYjO3c7uV/6kXBUVc9nxT5/0b+RTUuevsl6lUVMKVV
	 uKXOvQG9lqaHnyoGzv9yCUqvPlHbjC+M7AWHupMxp7YS2HN9OdCZ91/ObqNcBApbBzKFF
	 50zoU+G7lOrkfCq2hfOhYy05zSpE/i/i+OTACfjEszUujU6SQpkE6kflQ8V+ryIIQW4TK
	 N9b5PMiGForrs+1orW6Gg0oYw8dXX3p7ECeqSdKnIP2b83ZiUsGWj3eKLqmrImTRdpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jiIzLjcyhaAEDOaVVjH5VECO9F+nQCzI1T/v9+EoYaM=;
	b=dLXlu8V4NVWMxMU4hU4GcZwJ6nWjR0v5fUPY4reYIiSmm6bX0U8tQtK/H1SLXxIB9m/I
	 mlY2cZ/QbzCCceNzYq1pZwrZo088j84A1gcptCU4GEUl3G9/OdOWqdd8Txo/4VAX4639+
	 nvbj48CSN/JKKnbbsyvx+ePfRt8/doFJiJS5gRYHLbzZi3kJjjRkRLZnbrFOyj1bOypqm
	 ZbgDvJfbdkYUWHe5FxmdUJGao62sfNJzW98M7vXNbdAFlSpwxioGvI/65cfmMj/oeQNqd
	 i21eZfarz+bbosv0GtypZsuTe4+FXugPF6UHwhGTu0Nf7jY/Tga6Tjo+AP74Rpa241w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d5SpOIA8;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC9E606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC9E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d5SpOIA8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso3113074f8f.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794823638; x=1795428438; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jiIzLjcyhaAEDOaVVjH5VECO9F+nQCzI1T/v9+EoYaM=;
        b=d5SpOIA885YJysxfb0kGqgAYfTmUHo1oj/KWBQH2yWjLJcr/ad4YAMyYWe4FxDSJYS
         UrPyEcVOzvi9Ojgw5IK1osCk2hQ7yXW8l2qP1eDZOEcp+oUTqcf3P0yGYX2RssIpJVEh
         YUMeZ76KUcXcnm8wD19EjXgQyFgUMRCLfW5ZLOwwY8TE01fgPIU+QuzhcStXE5mOjPQu
         yrWwptPkzYlA18Zp4syMMCMJvPwn4zkGKz3CA+et1ZeHWsFtuWPWTWskDVgHplL64L8O
         U2Gp0oiUMWSwMDso1aVB+KFeJjxav1ekcmRS/dly6jvNY8poyYyl+ilPLR1J2bpE5ql6
         42kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823638; x=1795428438;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiIzLjcyhaAEDOaVVjH5VECO9F+nQCzI1T/v9+EoYaM=;
        b=w3bSwzM2JIbHmGBoToAFyX2G7EFiLrcF70Ky0K4P5JAujFpB29dLLjggCbqF//Bvpv
         9jHANIm+cc4gn7ZLb/ku6OkaVd32tFjQbu7fHnI41Im4KqFwaDdTnlHzs/KdAX93JfcN
         /c+xj6lntHtGBywNbbZnBcYXabE1s+0AGA2dQhFkNzS6zqIVKwqGa7r56AbeU8kaWlPM
         bZ/h695ykvFxrKH5NxyjzF5Fd+Xkkv2MmYiWqLUIHQ2F91S/yNU2hOjwIhoalTWHIVVZ
         RXZ4fQ1Ga6JwmgSSIZyoLjjKfhaWhcp30iJfFN9EbPIKe62PEzXiOf+oBuievV7E3ExA
         Wtlw==
X-Forwarded-Encrypted: i=1; AL+hErHwmUV80l7+UtLUVMC3hVdKNyvXFnBejI5tyjQF7YJCM8AiaX//htZsw7u8arIxC4wja7aje3nprZ/Y@vger.kernel.org
X-Gm-Message-State: APuU4Z9WjwqMlnHCc/Dgvk7mtboT8QVxfaQl9tZ0DPOVp2qPjoZmz8MQ
	6sgpLpK5G0llmCJzmGCb/G8F31jd+C6vlH+eZqO34eOVBrJvCWiSczyzQxX3o1F3ppA=
X-Gm-Gg: AZFdTZdhvNK5tyEKdXhzkFHYh4C4IiFBp12uuNUUIhye1qA61/v1ZsdWX+X22M91jTg
	3YQLVLhOVgL3sMd6w8JbObgY0p+ZU4RFqcySoIkiksLhc2k3lXsP2ZAxpwWPU9N7Ytkw3Yrq7xD
	HCSh1TF8zmbh399c2LhSKty4jwHIfUBXRtV6hYx67rq/Ubis6agpMRrVw69tSp3FQMH4aOamjcO
	L3mmxupK6o5SwJVbCxV6Z137VBavj4PL8EVKjEniKpRWTWGzJ07kAdLxmSXx/Lu4A8kQlNgbGkp
	kNUQQ1c8x7RSL0Wr9cp8dBJczLouWnQyKC6sLj9CvE3TZW0dZLMv4De/aIrRr/b6/OsjXS8kcef
	xtgWK+I03lfC9oM7T5K8Mgl9NDJGqeq0v4TiclAz2tSqofTIbXvxARsK6lwmrUQOa2COQWhc7dt
	ESDOJ5+OK3erJnLWurNxZT7E2aieSu93pkfMjnLNIWAb5ebpCtBUsJR2zQuU8fRD8JhuTt4cdgD
	5wMJ04gYrTZsUhIWDtLW8742jlSPB6g1LjZ1Y3lq3KDHlwIvELID6GjLXsCbEq1a/K7ixfkh3Xy
	jp1bqQXJ+ou2MY32KAOwbx0ATbaRMENLEejuJfFqF34BAIFz
X-Received: by 2002:a05:6000:220e:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-49c71f334b0mr23205262f8f.54.1794823638011;
        Mon, 16 Nov 2026 02:07:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm20589292f8f.15.2026.11.16.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:07:17 -0800 (PST)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4>
 <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4>
 <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
Date: Mon, 16 Nov 2026 11:07:16 +0100
Message-Id: <179482363653.13037.14387881069650442772.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3779; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QVGLd4p/I26D1hizjjIbLHLqTX6+X9Rw38Hjb1db+Lc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/rl6Jq3JltrR3vh/VudFFaNI3o0pXtYBD3Gndqz7/9
 /X3cJ3UUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgInkaTEyHH62YF5r5oYiCa3M
 3usG4kKRQmdUd5bdkLsgd5OjnKutj+F/yrwF8c/0Na483OR8dp2c3VxzP8nw7ROqdF7djpi5aVI
 qBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-16 10:43 +0200, Svyatoslav Ryhel wrote:
> пн, 16 лист. 2026 р. о 00:44 Jerome Brunet <jbrunet@baylibre.com> пише:
> >
> > On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > > нд, 15 лист. 2026 р. о 13:03 Jerome Brunet <jbrunet@baylibre.com> пише:
> > > >
> > > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> > > > > for the correct work of the CSI block. Add CSI pad A and pad B clock gates
> > > > > with PLLD/PLLD2 parents, respectively.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> > > > > index ec537efac692..08e425365469 100644
> > > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
> > > > >                                            0, 82, periph_clk_enb_refcnt);
> > > > >       clks[TEGRA114_CLK_DSIB] = clk;
> > > > >
> > > > > +     /* csia_pad */
> > > > > +     clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
> > > > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> > > > > +     clks[TEGRA114_CLK_CSIA_PAD] = clk;
> > > > > +
> > > > > +     /* csib_pad */
> > > > > +     clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
> > > > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> > > > > +     clks[TEGRA114_CLK_CSIB_PAD] = clk;
> > > > > +
> > > >
> > > > Change seems ok in itself, just a couple of things I'd like to check with you.
> > > >
> > > > Seems both the CSI and DSI can use the PLL D and D2. Can they be used concurrently ?
> > > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > > > DSI counter part does not have ?
> > > >
> > >
> > > CSI pad clocks are used only by CSI and CSI does not change rate of
> > > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > > switched DSI clock parent while csi pad clocks do not touch clock
> > > layout of CSI nor DSI.
> >
> > Ok but they end up possibly using the same PLL from what I can see here.
> >
> > So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
> > is using it, it won't go well. The rate of the underlying PLL may change
> > since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
> > with this but can't CSI and DSI be active at the same time ?
> >
> 
> The clk_set_rate() call for csi pad and csi cil clocks for dynamic
> adjustments is not possible. These clocks are used only by CSI block
> and among 6 clocks CSI uses it can change clock rate only for its own
> clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
> design and are not touched by any other driver.

This is not my point, and you are not really answering my question AFAICT.

Right now you have 2 CSIs clock each linked to a PLL, with CLK_SET_RATE_PARENT.
So a call to clk_set_rate() may change the PLL rate.

At the same time, I'm seeing 2 DSI clocks linked to the same PLL, without
CLK_SET_RATE_PARENT, so those clock will use the PLL as it is.

The difference in the model used is odd. If it needs to stay that way, it requires
an explanation. If adjustements "are not possible", then why set CLK_SET_RATE_PARENT ?

If the PLL is fixed by design, then you should not set CLK_SET_RATE_PARENT here,
and possibly use assigned-rate to setup the PLL, as designed.

-- 
Jerome

