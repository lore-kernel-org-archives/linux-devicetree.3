Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016953;
	b=oSDktmVtEonr3JCc2pEM5aDpCg8cuBz2BDNJDf1eG4b1yi2Xp14pKRy3wtp7rPKG5kcv
	 zKxxgJ2yG4aJEsq3t564aJB9hfRtD3Chy7TZiGLZPjyLoUDq3vx/m1rEiwqwF61i2Y40h
	 Zogl0rDuOYHJFpiudzSztxhBIQfbpIfgYlydcJmaWOEJk++sDvkZj4jZW1M26ODWNUnuA
	 BBJ1qTW2YvksawpvPNY9VGz57pbmYbwaYme3ynK+GczEjYmv3i82VJcndGjiX2/fQhIIW
	 42nt32OzXMTA7jdrtcmKuKBKEfhuH11tSt1F64zSRwqYwXq51LiDq1DsoqV2bb9oKJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
	b=hfqg0F8FGGWeNbUixBJdBfIxQUW2di7bdbG/Xm3nQizQqWBojF94ChKgOUM3PD0ozQBx
	 ID/+6Xy55a4XShQ0rQ/zksw/RsYvt7JPI8otYQMjYJfkNPiqyey+lLBEKAvwdJOt4OXPm
	 QVQbZE/zUvLC11hOQUNIH3ynSfUxfQ5/1sT3BXNlRS2GDqGRdWG8fE2xQk/kKE2wNaRy3
	 kXNJlLG/f+2StqMbffkslxbJZl0K5+hUiqumW0ydCNF7Sg+qu7RIdql8RaCgOIXsSNRbN
	 xAe7MH+cJ6wFRbXmtwcvPrqhnT0x1wUqrKYWcIt+TwJ7F+SLckG+WXOtwUCC3UIgoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypGDTFJV;
	arc=none smtp.remote-ip=74.125.227.197
Received: from mail-pi2-f5.google.com (mail-pi2-f5.google.com [74.125.227.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7569606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7569606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypGDTFJV
Received: by mail-pi2-f5.google.com with SMTP id 41be03b00d2f7-cdb9382f3baso306958a12.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016952; x=1795621752; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=ypGDTFJVbxylofrs7RPLtLRc+FST4V+oVKo6JjaYkTo2SZwK/1/t7hQq+hoGa0E0M9
         ira0rz4fUFlP/11ZukY6PdKsJGNIHGFSNKTnyMwGyIRUYpdjmCDun9yrsZOOmxyNJ7A4
         mWf8cFYeCvso0ggjDvnSaGm6LkHSa/zZhaIB8UCWcOSiO/ZqP8ZUeCHWqje+I/Oz93qr
         i9zWR9IrnK8zUAsTiP/DT+5Obv9xGaAbt3lf34ZJ2Te/Tv0Wujfkt5Q6dEEcn5sUR7xB
         mf1c1PH0a3QLvm0hFIpUx4yPYUE/q33sRgG5293/ASc/kBcq+0uCL3YELc17ADVzBqwT
         2gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016952; x=1795621752;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=mpHnynEZvk/KbBhOCLoTUJzfyVPkm+VwsOeBOOGAKSDsFW1n40o7mMRwEarckyrCQe
         47t/jE2Se3cQJk+fhzXgo9NDjXpmeI5CRPbHZ47L/jFy20CqxKGe7qYeVniQarFgnSO8
         j5lQYQfdaHA5PrTt29pKnFS4FsKj3Q73oR7aBy2iiTRD68DqBFNiO0S91nWebGgmRkbm
         OcjYNuVq0/qzS/RimkxX7JS/yj32X0P1NtJxjlMVlxu7VoWB6ZQ7Vtn3z4ebfy73KtXZ
         lGa2w5pyM3IJjgC0vE5DTi1nTLhI61KWKxbNXQwI+NlE5OoAJGJwizsVJCSxDukISm4Y
         ZFBA==
X-Forwarded-Encrypted: i=1; AL+hErG47sVSvg+MFr3zTwaYSZfeykQ99wYxlo2qylCWOZ/+QdKemLeH2K6vk4yrI3u3nvbA5qT495FZOUz1@vger.kernel.org
X-Gm-Message-State: APuU4Z9kKCMI8BPy64YShBLwrnDNjsIUnQpjkWWfHZMk8BLOup5aSELt
	5anOk98tnRKfZCqgN2Ts34bJW2snTZYuJVRmv7z1g8SMm2DrGBZWtLpx
X-Gm-Gg: AYBFou2rHLl9OFri9fGqi1+tMcfqjiKkZS6mLnZZ66GVh05+Rq3KBHsW4CZYFZIu80N
	OzuKxgys/CpCAdB9jkgMMlziEebzuUKd4KFeMLUeerb6v5OGNAT3xQ1OlHUP+KRbWNDnM45/C0T
	7F0Rk6h6RCOD+U9YKZG/7tMX75G5ez7UFLUQ+anwEGgxTCbJw/1VI+Mx9gl1gCeBl7dWq0pZB8F
	nTB74LRPtJjW1c2NR9lklvUhOsQLoooQw0jasqS46PuGtnMZCiFV4YXYI0kOwqi9nlg0b0dd/re
	iHAoB3JhZGdgJIFcVHa6P/2WHOnDlKjJuYbQ6R3Woz9tHIdqGmWG2UnV1+KYXvJ+ybAWj45Y5xM
	Q9gD4794FIJpOfkgUfi4TCBptMupy6OenNhgupe5yVt3sofrv346f7NFg6Qq063NwJGDXqp6mQt
	3poVcvHbBE4eGbDC5w6KJ7xIofK7lWKZHlnA4bZPuxqJI/gMs/AXC4CNW/1RFQu5e3R5Z2q8GNS
	JY99ZkjufazBV/313P6sLmdoPhTddlxIBKVq8tI3Zr9yjLF6gJotTpnBA3bW/dWQgbBAarhSkNq
	rrw=
X-Received: by 2002:a05:6a21:6e0c:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3fe8bdd7c38mr2965829637.72.1795016951931;
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1055183b3a.22.2026.11.18.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Date: Wed, 18 Nov 2026 23:49:05 +0800
Message-ID: <e4eb5f5b7ed8b3b6bf47d709e4344e0a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, Guodong Xu <docular.xu@gmail.com>
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
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
 <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
 <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
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

Hi Icenowy, Guodong,

On Wed, 18 Nov 2026 14:25:38 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 15:51 -0500，Guodong Xu写道：
> > On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> > > The connector available on the Pico-ITX mainboard isn't a
> > > DisplayPort
> > > port -- it's a USB Type-C port instead.
> >
> > Right, it is a Type-C receptacle, and the commit message should say
> > so.

Agreed; v3 will say Type-C receptacle in the commit message.

> > > I think you need to model the Type-C port and alt functions of it.
> >
> > I am not sure that can be done on this board. The redriver/mux in
> > front of the receptacle and the PD controller that steers it both
> > sit on the EC's own I2C bus, and their interrupt goes to the EC too.
> > The SoC has no bus to either chip; all it gets from that side is the
> > DP1 HPD line.
>
> The ChromeOS EC firmware exposes some control for a Type-C port, you
> can search for `google,cros-ec-typec` and `google,extcon-usbc-cros-ec`
> compatible string in arch/arm64/boot/dts for more details.
>
> Although the K3 Pico ITX hardware connects the EC to the SoC with some
> not-so-embedded interface (eSPI), which needs to be handled first.

Thanks for the pointers, and thanks both for the review. With that, I
think in v3 I will leave the dp1_out endpoint unconnected, as it is in
v2. Let me know if you disagree.

Cody
