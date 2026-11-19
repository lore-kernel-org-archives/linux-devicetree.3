Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124338;
	b=LnuaA8BP2kXlA4CBnVQuvT7uZmLZJirANJackvFEp3jgpJHjSOY7ruVR2lGycaAJzakH
	 t5CyXlHAZl8Q9P44HF90o7D1vBMwSkerPK+KlYl0/5Kw8IJ08xpF79vPS5x46GSd4iuXC
	 E0WNT1TDkxQF3cgG1cjCL+RxnnUNVYJPEFu1453lQnhLmjMKoaCx5h9z7+dvK5kRVS8CN
	 MKD2/nJI0MdbQ8SPlKnBI33n6Lytf7O73pFYLQ7Qt/A4mRkH30lUCBOl/wtnpxWCM9e7k
	 BAxeR3WLFI6y6qNgvX520+qrQ/+zt8kWZtMTcsRcFeb2yYxbU3OuzOhPJNUDNoNdOHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
	b=MqnM/A4yQtaoTr+vX3VcCoIje4hh1ZDKajSzcZPKUv97noNR0JuQUA1H803sz9L32qlR
	 1PaemBSIO/UNuPyovAg2z3CIHAlUV6QPjW+qL8A/VaLc1toeKSuTM4EkuFC0njuI8iFRJ
	 tJY35HxkzcQ5E9YlhH8YcRa7CkNOduit505tXh+sCLkYWkwj1GHAFpXUeqQZEcTxZ14ih
	 YCkYcbputBdbjFRC+Lond0ISYNCa/6gyj/SFB5dJIihdCjkvAZpqurkZ/ItoNPpf3VtHj
	 tGkPBH/leJJHNYBpMrAvKsfUJxCn6o9DCHv7j3sa0L1tAR7F9wgsKJ/a+OE5aRGJ9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyiTt0Wl;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A060A2605
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 21:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5A060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyiTt0Wl
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e2fcc300so2158607b3.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795124337; x=1795729137; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=oyiTt0WlsE/V9D5hUQXI608VV5yECoIwBcFPiIx2eeFBJ3YWZeyoL5guMklQc5hlik
         ZcxuF7J7ibR7FrDfwlg2hPem3bjlTBY/us13BV0ah6NZNOHDDDgPGNMAoIjmBcRTbB93
         Rg+/+tzF8PjUxGMDMn+RXK6rRtfxBrH2/ijOUDvfiJDhJKdK7VE/i6GDMsnZ+OzPs/v8
         e0+xsvjtPScOV+jOBisrqNbz45YXgrnX2hkYbi3wW2EfHTF23zAvo+LVrQGfzcXoD8dS
         jNaM0H/aya5hSf6JQDujLE2cDMUl2/13tpxg2CJUUbrq3IfhPNe5mogv/YlUY6iGBYsH
         CQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124337; x=1795729137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=q+/3PiniYEBeqafaQ0nlvGP68atnu+n1YWafPtIQimtmVBmVKfNCqSncGVIm8/yd/F
         jJa7Bf9hxXjKoGJxut6nBIfIbEBZGzpq8uI8GCqCloACFfidJnTXfoCw7gEbckrdns9X
         brv5A/prE7GMnNsIqy2sE+ixkp3xa2MQN4I3GmOdtD0zuNedwMthxWuhrSZcQGdEgJb5
         QizJiaADYyF0THXFHJhi5gKAfVNdmIbOpx5NcMKwyeCz41hYDfMgZXkOiEOjNKJjYWlF
         zfRi/W4DnuoAPFqWlmVVfKFABxI/73wvDlfI1hdjI5loBh+9UJU6K8LTfyS5j3Rrb7su
         cH1g==
X-Forwarded-Encrypted: i=1; AL+hErFQqoeXmP0jdjzyxe8VH+pAlGQ2blIOB+TBWKFN0g0IBWgPG4TrboQ2ms9UuNII7N8zJaOPyrQ+6Ayc@vger.kernel.org
X-Gm-Message-State: APuU4Z9oFz4fOSPNCiK1nJXE3R1Yn0pd10ejcaNiBxPGs1nhtlcU/1ca
	KrbBqqAsTHjHHX2305gjqRiwzqA8BjtIY/n6IPQ7cEF0TS+PDOLqCy3O
X-Gm-Gg: AZFdTZfDO7/6hMOww+Zl+0yUzAWwD6KVz4wM8LWUqbt/Db416bwRqKdMzPYFFYlSt0X
	rbI4nlrLRGeZEUvRKvaCL1tOnY+y0yPBS0Bp3NBMAsSRyMUhsGHu5ClbiiQhm68fclwlwpbFDwj
	mHLUVgamA9KkA2xGzLXAdWAnnfGKtUlsq+0JqSwDEx6bLsjWodIjiwpyoczO1Lm3gsV750C23ft
	0BfHOKaJP8wnhf1zCu1MnuZ4AM2k8dHiXPNdIIZa/y4qhsLEy29+i8cGWbHYt/1QerIqD1s95tf
	wcmmnFFGYO1KKsyEKK4bJnjJaPKsVrb4CcMeini8HIZWHxrjZVsHQybVowtUPBHK1S/ANx0xoc3
	fGUKQbrXWf/EUTqIu38y8GHNnnEsILqbNHCqUjlkqF3S/Kct46aixWzxwS7l+7OxmMuWmU7Uukz
	jsEGtEXYt4aqeqYI3o98LKXSD8E9hZK1rZ0+DJxwmiUzFBD3LqQnnIpePOT/cvNkP/I2gu9fgEA
	lmyof8BrykITecSYfDflnymEpxPWXYebEP++OwhYgKbOPt3P1LKdNUk0ingko3dkPTY638QQFue
	hgZ63g6UNma3TTcBFQdVNkMY
X-Received: by 2002:a05:690c:c9e:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b5204ebe00mr4585427b3.80.1795124336861;
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm663093d50.20.2026.11.19.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Date: Thu, 19 Nov 2026 16:38:52 -0500
Message-ID: <7072ab495239e6bd28e2e9ed75244e24.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
 <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
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

Hi Icenowy,

On Wed, 18 Nov 2026 18:18:11 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 16:48 -0500，Guodong Xu写道：
> > For example, the blocks sit at different addresses, and most fields
> > are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
> > the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.
>
> Yes, this IP weirdly doesn't consider register map compatiblity at all.

Exactly.

> > IMHO a K1 port should add its own compatible, its own field header
>
> Well I don't think field headers would work for a mainlined driver;
> maybe things like regmap_field could be used to mitigate the
> difference.

Fair point, but maybe that can be done when the K1 is added. For now,
in this series, let's make sure the field header and its users are
self-contained, so that K1 support is easier to add later.

Guodong
