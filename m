Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948709;
	b=BTsf8FJwcBdvtLdnRroXdMgvgpWv0/PhN9nTBM/Xf3kRgYPGIh5QSXcWtvZGYVHeBU1S
	 dYWaRyA6XntZjERJ8CUr1oMEStrH8NSGGnPBktJywlCFR2AzSMwMkycivQX6Ir8DdIyBs
	 HQLE3HXiGGn/QZP2An7G68rAoN/42Zizp2tZElmW8lDHNUDrqY8dG7030dXB0HQX1thNH
	 d7OglIlZO00WcHnhLAvrQUzDXllXHz3s0E53Sr7D8v93c3dv2fDXepuDl42fEpgaFrg5d
	 vA7PBmKS+6l0sQpbdi/8zf9aFsG3P1cS4lUbcPr2+Q74mYutyWS23ccDhZf6S5l0guA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
	b=ZiJHUSpgm0iWzr7SL7dpsHVPdA7htvOm/W0D4o40S07yiqWVO8q6XpNqJrgIKnGuou2l
	 g6TSUf9ZLLq0tCIFTB/XrESk1ypQcORK8TGmuJzq0K4R0wtOyY9a89LAYQ22/AvcWY2eO
	 6iHwLomYUuzv4Eno7ed8GXpyEZ9r0l3l53oQnkxE9TOW3pTdULyiCJOfffEVWs1g6+WCI
	 yXxGOSnyX97GXaYRbO4cHUEsambJpeH6FjWQycLYFctAC/LHciYUNcmrtQ5Iw5rj69gRf
	 ODMHgnDOYsI4lv+jibQMrR9H7ZzYRxXdbpnFJNZMbzkP2L9ZCLQE7MlrAIiMPW4y1gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PVf/MNIb";
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5082606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5082606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVf/MNIb
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4f4095a7aso2076447b3.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948708; x=1795553508; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=PVf/MNIbC8a6bfWjqZsIxgcF6k2/UaWL3F+LZLDew2Ev/fZ2Lu81CYI2wWz7Stxkq7
         L6ByZQ6Z42kEUj+NdNL4lNmZJK+zv89zA++4ek3zydtxjSKHyqJU+05UPBXCTOD2ZG2z
         3vMal9prNOcq0SOcvs6A3Oq02OC0W8ncTrMwhoUQmiaXGVXbcf5cxEUO8dFV1hg1d70M
         2HLVh9M7my3KAxVDfSULrJabCnwF5iqImeMt3Q+2htXO4Vrk/B7KKWbgqKWVj7gpL08j
         OOWeeDVHafI94yxstctdFUyjan6C+EAof615/HWP1AlqJfwBGVOXnpZkm/+mPNuzwcRY
         UN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948708; x=1795553508;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=d19Tt1ok6UiJeihTbsTWFPYulj7yPs+ryvymOajVh6X9SMi/oOeoUmhlWTWTzuMACT
         jIbmMjnghVDf1Ktad4x1n1KPy3SZmncYFMYaJOTqaZunOEaz0ikIhDMIjEGJ1h5d6+EU
         AOt57kCj33WhwhyYG6xkzaABLe7eO7IQzUkEQNuV4C/mGro4zv2qOuNmHD2nAzzD1wzc
         vr+8Gti0gnoduYh24BF7I4Hw7DFsY1SByjgIXe5MNe6hDNJkyvCl8J9JAK+K0GNxTH9G
         /oqPfS2GdAsfKoQ09LZAh5Dpxt4+EmRUH4FwS7FJ3yjyOdbu1atnOKE20vNejbOYpDhz
         2bHw==
X-Forwarded-Encrypted: i=1; AL+hErEbOTLKWWlqNO3ZbXUfcD+eCixRWbeIbpTPxh1HTsBPvrkCwHwNNgm3zWDusvrPpzvD8/senT16u9AJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/k1IN8duvmeOZXW088wr8w0UUDhw1vx+UdK57rnvv5BVhwdNeP
	hPCFfS1llkPn0JRuqXM0PeqL+dg0dKyH/pyZnidN1THSzaSGXwd/bPcW
X-Gm-Gg: AZFdTZfpCPMe38qDQJAV4ZKeUnfHRJdORXFFJTXBiUEOUecMvrPxFHtM6vYjKjesEh/
	eJgucvvG0Lf7gcf8eFuqRmqpwEJVnreU/L1mzdCeSKTxLQIQs9FqHsqYMPkZM0vHrYQAS4nFh+Z
	jPuCzBVAarPy0pDlzKDMqIrdKgVlBvEWUrf0ohnGKQmgGMkeRTHQ0Q/BKmrc8z9ljWPFv9htkvG
	fv2K8UHm5WpdJtXO+bDh8/iwkusV27oglwnRDyKR78t7feSBraGTyXZRthuRoiw4Q3zWpmKAeXL
	TLRn/OzenjshSVo6ZI209AFgqJjr5Bb1jdW5CSWppGuuYMMfJnv9OIC0dfNdDnyjdiPH3WqBgrN
	f8xrQeq9L0wUO4kIBhVZYfCrdk0WAYg3lik3rV/NPkTVsta462Q6iUAApxGbOtObp1C136rgZCd
	ct251HMybQU5/bzD3ujc5N/aJh8tKAvfbSsiqNCG+VlOoOqeskM46Z3Hfqkk7QCKs+nNRJtFBL8
	szq5pfJAuOVjNpHFnsvEAsR3ASoV8WIWhlrLJ+Odp6AAPlxB/YJ7MqCBVk0uPnpGpLe7cUOP0z8
	+Fwmoxz4/jj8lWZMroGyG/RX
X-Received: by 2002:a05:690c:306:b0:8b0:e479:6872 with SMTP id 00721157ae682-8b4fed09583mr3173897b3.17.1794948707375;
        Tue, 17 Nov 2026 12:51:47 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe057c1esm6086647b3.20.2026.11.17.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:46 -0800 (PST)
Date: Tue, 17 Nov 2026 15:51:42 -0500
Message-ID: <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
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
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
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

On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> The connector available on the Pico-ITX mainboard isn't a DisplayPort
> port -- it's a USB Type-C port instead.

Right, it is a Type-C receptacle, and the commit message should say
so.

> I think you need to model the Type-C port and alt functions of it.

I am not sure that can be done on this board. The redriver/mux in
front of the receptacle and the PD controller that steers it both
sit on the EC's own I2C bus, and their interrupt goes to the EC too.
The SoC has no bus to either chip; all it gets from that side is the
DP1 HPD line.

So a usb-c-connector node would have nothing to link to here.

Guodong
