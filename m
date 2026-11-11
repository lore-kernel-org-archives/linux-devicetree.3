Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371195;
	b=3ph02n5xIQMqdJ+XwGnJUjErnOxCNwltLDm4kU3ddZji845B1CUqZZso6zlYPj1svqcB
	 xq3dPNSAFP9vBcwPHpPgg93KGAke7Mgj0oPxQJCB4prbf1/iUzZ6aIDR6LRbD6giG4vNK
	 ZU+rof7xNHY9/9hRNpMH2BYe6CgKLBYFvJjUXzFSsiTDhVEPbTbhX8H9A7DIE9STM/MWx
	 MDV1pdKJLquYlH1wpP08B4iL5Jc+39els955sg/2IOLiALVbJuV7c6ziDbhO/FJxPcYIU
	 /Wk6dza/22HV4om79Ml4yFYX+A/4VvaHIp3rjGRm1TwV0srT2eCzZeY6DBoF3t3r9Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
	b=p1G0MFZ4fBfbX7pbB1hCW5sw8rELfYruKFEeImfMH54KxGiZZM6Rk5oHT87gPPetjHcY
	 wN72abdWEJU7gVhFvKhL9hm2wUfjAAVeLWCSTx0S264H34bMjj3Bdy3QlXE9LWswVipz+
	 RbjDL77pnhfMiACmar+sDukLf68NEfPkNLtFSRnkr8NmCUqJ8eFhtoKus5biOSy1ii33h
	 9h8Km6cf+yMlOs7UDZoOwdA6pEsU/QGCvvPqxI8QSaXdB5sVOalVExhvfFlwS0dXuAIj6
	 xd1mVkCUDQonIKVwhe/cbkmiwXZ4oBYwr4GGHxG+SWmW9RYCEIkrvgFoAIrg9DAuGuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbN1JFNZ;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D4606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20D4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbN1JFNZ
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso2780511eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371194; x=1794975994; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=AbN1JFNZQgkGlWWEsrQ2VJ68U4G/Mq1OjtG8B+uBa1Wwy7ExbZjxHbLdw2+MmyO23v
         5xcRGu1cceZx47w59x/vnxflTSZ408f+CyLztp8uw8FlHXOhaHCLiEZUJdQwRtrQVj6z
         YK7BZ4XyvWBzqGSxlYtPxATNNFfjGdh2qTeNaoRRobnn6qYwDemc1qtUVLdJ0xUFBqRV
         3doAvCXPD4DwUSk4lokM2xjHybRczcN++AbtIEQ+3QwVdAPKdozvjpDA7G78wlkZCMay
         87i1fRUI5BIObbUORel11gYkqfe0wUU2phrXekf0HtRcrWvCUEmkw4Bfh3vAQj34y6bj
         tk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371194; x=1794975994;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=tMxIZCUQnJFbTPHZdXgEI4s2Z51r3JuaFbnAnYz3Bk36q9PE8mqxEbe2p5Tq6I61hc
         3XanwTXjEGy4kUqOWkue3WeLe9bmH95W44EQSoO8p4bPvJt/77SAI7DCbqsdHaR/VU11
         wXYHI6BvzaY6yiJ5+7jF9wNpqeAWytjC/+h/brMUlpJTmsjjNoCIYa5797w8rVwZVj4e
         P7KTVoBfJLqk8x8ZWipqpE7g+QRBmsyhVEowK7RjumOyLOPUFFzVFGf7oemGYQE60RLm
         F0tLfouslvMidHBGk8POEGnGT2Rs6fSxPoU3gl6WHNC1T/8WGkn8tsr9uISDzgg3OnEQ
         46xg==
X-Forwarded-Encrypted: i=1; AL+hErEAFEuBaUvA/trf81HkSIPXyOQeTIYKPqCVN1I65vew5h4P5bfNDzPVWZEskQDoEYzA11/sC4JR/iJ3@vger.kernel.org
X-Gm-Message-State: APuU4Z+o67Ztoqghf6P1TnIBWAZzzteUPGaULwtdPuCi6GtU4thAxi20
	OayVINDCnYsNs2kYlNOu6P9Lt/+T7t7xuGQkVlpgPrqZmV7jEhCal98NkVt2YM8TkRY=
X-Gm-Gg: AYBFou1wtoX8VM/dX+1j6HaebuxHkUNfcy/lYdatbVs2P9o+IO94ks3/7owJBBz1yB/
	FmJcqtGxiHw2Ghz1J8XqdeW1h93/8un6K7FCf3m9xMTNYkOCA8MML3VVh1jb5XNy20Cm15gSRVw
	SXrnDH4MmPWOHV9HDtvs1D24fpTd6Z6b5uH/iUxg9HjxXGNf8BCOLVlo8loyAm2gchKAbABOmHo
	5h8/3jyT7CHECL/Kiuu6Bf/r23/az2IojOI1VfZC97iXctI6i8+yY0Rrj/4AVuY3lEu52n+WvnE
	UC4lI6DH9mFKXAX1GRxchcWnmM4g79+oBXy7ebcLtAk42osiKS+klmwt7L8kj23pQdRwPyUUEEQ
	DflmzOFDWNxuBkk/v7qGPEJzoqRQP8Gj1iwzufQf5MwnnLaAL5MBNXFvpSOrH/EfGLBMyNkgILi
	KTEaZaqzGGpPS1CX1W2g2V98flWMEXKwMSlkPFv9e1jEvY3L6pXBlbpG6D7SmSmORufzf2dtL+w
	Sn6sb5VRTOXMUWmVoIuMzrSq0gn916g83kejRAvCuWAz4CBGnVpI0EI8UeYopyZO75dTVVW2uve
	+1I=
X-Received: by 2002:a05:7300:c382:b0:376:bcc4:774b with SMTP id 5a478bee46e88-376bcc479abmr1028837eec.23.1794371193980;
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm13018714eec.17.2026.11.10.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:26:28 +0800
Message-ID: <0d340a99e07dfba7ea1fba6d9529a1a6.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to
 the PHY PLL
In-Reply-To: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
 <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Jerome,

On Fri, 25 Sep 2026 16:43:46 +0200, Jerome Brunet wrote:
> On dim. 09 août 2026 at 21:14, Cody Kang <codykang.hk@gmail.com> wrote:
[...]
> >  static const struct clk_parent_data edp0_pclk_parents[] = {
> >  	CCU_PARENT_HW(lcd_pxclk),
> > -	CCU_PARENT_NAME(external_clk),
> > +	CCU_PARENT_NAME(edp0_pll_pxclk),
>
> hidden behind this macro is a .fw_name. Basically these are your DT
> input names. You can't change them at will like that because your
> bindings are supposed to be stable.

Thanks for the review.

> You should not use placeholder name, ever. No need to make the
> name too specific either, from the beginning it should have been
> something like "pixel_pll" or whatever your doc refer it with.

Agreed. The new names follow the documentation: the K3 user manual
describes these two mux inputs as "pixclk from eDP0 PLL" and "pixclk
from eDP1 PLL" (PMU_LCD_EDP_CTRL, fields EDP0_PIXCLK_SEL and
EDP1_PIXCLK_SEL).

> "external_clk" is not declared in your bindings AFAICT, so at least it
> should be fine to remove it.

Right. It is in no binding and no device tree in the tree supplies it,
so nothing that follows the bindings changes.

> There need to be a dt-binding patch documenting the new name you need
> and then you can start using it in the driver.

Patch 04 of this series is that patch ("dt-bindings: soc: spacemit:
allow eDP/DP PHY PLL pixel clocks on K3 APMU"). It comes before this one.

I will change the commit message in v3 to better align with the logic you
described.

> In the future, please try to document all the inputs of your controller
> in the bindings. Even if you do not use them yet, they exist.

My read is that comment is more to the original commit where 'external_clk'
being commited, which is not from me. But yes, I agree with you.

Cody
