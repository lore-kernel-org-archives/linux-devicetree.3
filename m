Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075877;
	b=CWNHKGqVSMeZVT9LG9HIz9LmVvmnpMTM9emreKQHP5tNIKzwMmLyT5MqW3wdWl+b9w94
	 afBM4KhIpQX5Lo7wIKgaW74/BRqLS+Nx5eDi7vB4VzUlAvaCjz1kT/WO2LmEide3K7RPA
	 /krChblLFOzLKYhHUnCdyF0DiCL4EV0YoVmAR48HBKaHQa1dYJ0aF2tbRhAidH9GomsLU
	 dPDabZLWeoavQGz+q3LNPUtLt7u10Bqx6qB5dzbQ7fYeU7RN7mEdlhzX2QZ8C3VjjVUQn
	 vO6OhRhBgsmrmb/pkq6XTAFfbe+SNwi2kYFHuduekW6SXG598pE3MQCwVOyicrBtVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
	b=TQ+l+9x2xbxUaP84Dm8xeLAenTzAiFH/wlFLAIXXPGpNm70048ll8fQU76cRM2yjlps+
	 6KFSvS1k6LdkuRwSdah+piHakzHwCECNkEQgb6hmaXPHEBzUNK2ahhJ/jiuNLngxiXXGD
	 D/U1VLbGaZLX8OQkzxZkOZ5/B8ATX5W6/aSwWZnYrTnRJT67A3LaaFYIfVCDwiFknN6ii
	 RAqcIrH8OHmHrTwXpvwjq15qmy7M+dHrgI3t77mAquFwgX1Uiq1c2wdel9vruwEgaKslp
	 UCzshdqox2QtRH/H5KhKRRLzXnkQqjhZdeCAilfhjdXn7y605N4FXPA5KLOY8GautKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LcEPjWCr;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB5606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CB5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LcEPjWCr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so27185475e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795075874; x=1795680674; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
        b=LcEPjWCrO0y4SAy1MDddWs6Qw5Eq/jxNqjXdJnCuw5GugceTyPYuLmPQdYLzxMvd2O
         oakdhu48o40QMt/QKgQ72HtVKfcd46YN3YhqeAoGIgScnwq6hlP+2cK60xjbB/VB5/AD
         itqVUUJZNjminTWNE8+S02wFGQkYlvN0EAI9l+f8o58WByEVRSQRK5v+IjqDBZBbaAYK
         NrJ1/7VEZVbQCXUa2GTbeaAyAvpqrjDMj+K7Pty3Nzw2ukhNuNZU6jgy9HFfal/xTfkp
         NQ8pJ/hCRCzAJ4zJN0fz1FTIwuGweYwvvJKDQ8dTUbQSnKr5dm2PsjKaqwciIDFXbDo6
         wqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075874; x=1795680674;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
        b=DfVy6NieA1xkaHFgvxuFkm/sm5+CfxK/TNGRH1O6RiRvThBGD+6LXsXLaQfjnXMlQ3
         9QuhP1qBhm3ny5OkYxIvFQLLdI6XR6cdf9EEjJBZJOSyhsF63UVCgEFvyIj5ePXIKcqk
         ZRGUOiEyzjY5awoXQQUigmOQS2bL8nYQ9D3f/RXgb7Rn8T2I/PsJWZtyscex4phC6vN5
         1pGN7fjICpVHAa0JdJUCmJgXJheagyxBx8oF2QtMTd42CaZ0O0yeOOGCuuESEt92cwkk
         uSSe9UNJ+1MsaG2WcU4RzcmeW/EygyOBsnZCXrrJ/hWyMR9l2fKWmozLQVZ+uysVyAO5
         RmoQ==
X-Forwarded-Encrypted: i=1; AL+hErEJKC577uujlAkrEIIiZwTGfUCinbLMCjyESn6Y2WETe/EbkoQH2XR8G4x4o0FbM2RLVI9hS/f1aqqK@vger.kernel.org
X-Gm-Message-State: APuU4Z8HeKXglsAVoQrIl+MH9y87ucTM9CGi6rRVEB6Lk3zCEY+eCPAK
	zC/M/o/LjCfuBRtfl+4Nd41qKDOGi46qChPnMvZUdZYFEP7tdzK5HOD3ibMhhsPtfKI=
X-Gm-Gg: AYBFou0wLvgMYMtMc/bPf8OVTt4WA/y/1O4UrDFZu8QZzJuVHOeoIEN+l/KXnD5q95W
	zEHBSVJcJDwV6LJvE5fj4CariNNH3pqSpEyp9jdLBw37HjghdFXI8WsUYKp3qGdjNdnxkMDYiaj
	YC0oeTUJIxhReJAbfJfuQg5douzwncY96AhRAOhdOjRxDp1gYp8p4Su/RxZRyH2v1QNM4ujJL8h
	TNSN9GEWBAkwIghASGOAGpyh8rEFDB7HLI4CKekUmRLdaVF5bF2D1+bId67bYl+LVXCzfarL0lH
	/X4xmJJpR9FO2Jn6Qco2uJ4BXJtMLDckvQLxgf/we5zK664nQ6975KZiFauVs7aZ7uuD1V6OLdk
	6ud2rregniCUus/W1PJL26MJSy0Epd+eHkJvd8ncgozPkIQwE9AtIZDLYAYtsKpASKlRcIcgcOr
	iOA65DCHtWWSXTryLz14uM0+lwl5WvDp0SIIClKWnHOC/8jAQsj2WmegrHAWofVuK/qTR08zEQB
	gWaDsjZyJS3P/1U0Y9OYLjswJykCX7zf9mzRLllg+tZJS8/RzJBuzRwyZarG3EB0jLIja8qhvwu
	BY85ZmurX7B5ANU09iXM0Yt2BfLZHf+Hj9xU2kw5ET5DektNggeSe/Wv52WBJbpu586h2Q==
X-Received: by 2002:a05:600c:6095:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb7da03b45mr88477785e9.10.1795075874056;
        Thu, 19 Nov 2026 00:11:14 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm21511305e9.6.2026.11.19.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:11:13 -0800 (PST)
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
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
 <179499607256.413320.18141155995846183804.b4-review@b4>
 <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
Date: Thu, 19 Nov 2026 09:11:12 +0100
Message-Id: <179507587229.639563.16969059581009770947.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3952; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=S/MfAZNg1Wj0rP92aDgSVxBVGdkD8yDNkTKcT4QFMoE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFn/1iu8i1iwfEKNoRkvi4zy/bIXjwRtU6/s8V0fuO3VT
 TWRBxHXO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjAR7z8M/2t8bt7abX4m7O3v
 3dPPaMWWVe2yjevLrM38W560U2uPUTzDP7Pci74zz3e+mZJ1qb+nmYnXff7OG779u5Xu/7N/fv3
 3eT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-18 19:51 +0100, Carlo Caione wrote:
> On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > > The S7 PLL controller provides the fixed PLL with its fclk dividers,
> > > the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> > > 
> > > Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> > > their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> > > firmware and the init sequences set them up.
> > > 
> > > Signed-off-by: Carlo Caione <ccaione@baylibre.com>> > +
> 
> [...]
> > > +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
> > 
> > Not sure what this imply ?
> 
> It means that each of the five bits enables one divider, while the
> datasheet only documents the five bits as a single field. I'll reword
> the comment to say that.
> 
> > > +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> > > +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> > > +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> > > +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> > > +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> > > +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> > > +
> > > +static const struct pll_mult_range s7_pll_mult_range = {
> > > +	.min = 134,
> > > +	.max = 265,
> > > +};
> > > +
> > > +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> > > +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> > > +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> > > +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> > > +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> > > +};
> > > +
> > > +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> > > +	.mult = 1,
> > > +	.div = 2,
> > > +	.hw.init = &(struct clk_init_data) {
> > > +		.name = "gp0_pll_div0p5",
> > > +		.ops = &clk_fixed_factor_ops,
> > > +		.parent_data = &(const struct clk_parent_data) {
> > > +			.fw_name = "gp0",
> > > +		},
> > > +		.num_parents = 1,
> > > +	},
> > 
> > Is it the good old predivider here ? Shouldn't it be modelled with
> > a read-only divider rather that a fixed factor ? just in case whatever
> > came before did not leave things as we first expected ?
> > 
> > Applies to the other PLL instances
> 
> Nope, not the good old provider, this is separate from N: N is in CTRL0
> and our init sequence sets it to 1. This is CTRL1[27], div0p5_en.
>

Humm, still looks very much like it ...

> Now, it was indeed a read-only divider in an earlier (messier and
> unpublished) version. The problem was that with a cold PLL it could
> cache the power-on setting (/1) at registration, then the VCO init
> sequence would enable /2 without updating that cached parent rate
> basically breaking both rate reporting and set_rate. The fixed factor
> avoids this mismatch when Linux initializes the PLL.
>

If the divider is part of the VCO init (which I'm not a fan of),
this makes sense but it needs a comment near the fixed factor to
explain how this works on the HW, that you are setting this up
with the VCO init() otherwise it looks like there is an actual fixed
divider in front of the VCO no matter what.

> After dropping NOINIT_ENABLED from the HIFI PLLs, the remaining
> assumption is that an already-running GP0 has div0p5 enabled. That
> matches the firmware I tested, but the driver does not check it.
>

If a PLL is going to use NOINIT_ENABLED, then a RO divider is the
required approach because you no longer control the init.

To get the rate right, we could play a little trick but it would need
a BIG FAT WARNING comment.

Register VCO first - basically re-order the IDs. .init() runs if the PLL is
disabled or if it does not have NOINIT_ENABLED. At this point you know the
predivider is set and the VCO orphaned. Then register the RO divider with
NOCACHE, it should pick up its correct rate.

It is a bit fragile but safer and more correct that the fixed_factor
approach IMO.

-- 
Jerome

