Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925262;
	b=GAisM1kTR9Og2SXLG4nAwYYbSLEA6tWKtffugxfgOoatjwbE4TORdgqr3Oe0kazk+gek
	 1+REOJ7A3uz4b8yqlqGRM0rNAdHFWVtB//lJ8OVV/S1HhPC9/ZKTGzL5zBHyr+i6sl2tB
	 /REA1yiv57i8kePuxfKTEBaEZkt3liJ1vexxrQlcCKWjiafdVxtN2YAoRWGbsWer8ZDQJ
	 As9ky4NpfocKCTcCt5k1UOfxxnGeMQFOZj4rUmDd1sQUcW63hEWEI5PW9RJhw4cVtNGsI
	 78kSWthqlyTpeHVnWKLUlW0xJ/HkLfs9cxuTGWlupyfHskKlBkUvhA7YtXHkcBoGlIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925262;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
	b=CE91S80qMR7mEk3TxTOTYVl7BFRP9iAqsg/o2vjv4NWxNuBlPyyxhK4b+1r0TQ9xs0ow
	 nYhbatyQToZBkcSFLk0H2WM8yvJJHiwpQhztkWfCmCtQwlaf502Opd0FE5ZhaepJcrxoJ
	 4frD5qHPdFaaZFB4hD8yQjQayoI8dR3YA43DriY5HlQYn5rTpprt0onR9jocjGvCxfwVK
	 cOzK3+x23RszbGnZ9NAn8MDO7KYL5LlUHM8Z0+qyI4rEpJHkvW6pyLza9vLipQv5wJGBk
	 un3S7bzE9lcumVqWZd/0HIVtT1k6GBGKbJUW+QQlbZIvL+BmUoBhXk35H3pmIZue2Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B4606A331
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 00:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987a2ba0cso375215ad.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 16:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925261; x=1794530061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVyjMpKLjhA1Rj6kFt39fijzgKw1bkGZMKnXsd9NG1I=;
        b=JlY5pIGKy/7x+ly7EhOTtE+DqCaZrshDhtnCpr1HzBY+q8ZJEjnOUj/1Moz6N1itgC
         pRzIMFvlEktdTNPK+K2f3+GJ4HEZ1bH13qlRbk0lzu/J3lc3rI/5rn9kSXyVfjsrdQp6
         ip9wO1iMC4GPi4tu9lgA4TKxotiRke0gzVkwIX6FdV8QxCq3/+aq71iyjQ9f8nA+KUut
         7IKa6mnO5gsrLjc/HrEW0adAo/WWtTxww87zD+o2VmlB/xHZTmCdPT5c3InlCkFSKTMl
         muFckC+hivpp81r3GehGpXBSp9Prp/6VgqmpFN23vxlF7GIutHoV1/IMYxGcyD4DCDcd
         50xw==
X-Forwarded-Encrypted: i=1; AKwUvBxoW0phi+Dx5lfkw1ty3v2BG3Ef6zNMcU0QeuIO4X7fQWnTq4+KkiG9Q93YSLQK9p5vDdvgo7hqVjkd@vger.kernel.org
X-Gm-Message-State: APuU4Z+5/DRpqsteaHrfUQ88vP3xJcg31aR3lFi4HsvB+vbbr9P3fcdV
	z9SPKedtFxd90cmMlXGGJD9quSa6OFlrnJsGL2HoWgOAg3qs5ewrzHmmA+OLpsCq
X-Gm-Gg: AYBFou1pbmCVxthyvBXkUCbnKbwwXFOV7n8ALJK8awEbs16/RwVAQ8VIpD1CAZUcrUH
	aNodhEGRL9uJpdqHgB9HJlBO07BD8NiFTQMEGtHWRQ2faBkW2CiFZTkQa4FODHPDhlhXqtM/2mD
	nrOf0AKJckY/eGAx5hXE9EfFHk2ose5U2B5H93RLBUgLvXZymwYRwTkhFfPWu+tiIWtGhw9QiYr
	PPcUD1PvGJNNvfITIUP7Z1Hc14XKRnwdX0ju7GKXoFSgv6DdGtOmzbbpN3qwFyxH2pko1EQ38rb
	xnTz+b5NAnmNW1fYAK6cXN2ZRLVURP3rmOOX26M5+kbCIt0kCKekhFA2ISSA5mrADsj2UufkCCR
	skrZpqL1630dEXnAuuAjUyF7sZ45iP36jbaUg0fgPJV1bHbYdhNkZ23i9eycLxC0dQMOUQ+06MP
	eExTTMbDyJsgQvct5tCNSaNrnTZyc+nzaz1W+MUoA3Af3PQVCqgRi5V70j7+tV3FKtJ7iQ0ISup
	op/mstQwp4QO58hiSjxZ2FrsOnm2Lit9PNp1W9vt9hCR0qr8Tu25h6rBKJVkl8wzXo8mDUQpyUH
	Bu7ZQdRrAqONOc3a8th7fDoq68z6k/tnP5LkXIPBJgwRvlTU85cPck9v2CZZD+/X2hncvWfgM0P
	afYXB9F4PZvuJOdVF/XTIxJJK8xjpjXZoIPYssrtlKZ4=
X-Received: by 2002:a17:902:cf05:b0:2eb:1dd7:3aa4 with SMTP id d9443c01a7336-2ed40c03eaamr14628735ad.34.1793925261016;
        Thu, 05 Nov 2026 16:34:21 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed4761d88esm389565ad.6.2026.11.05.16.34.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:34:19 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so121827eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 16:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwHZ2u6s/vOxJjcqf2bWP6JMaPAvr8fPQm78kpENREVY46s0p3UarNt0tOCS78EGG2txlRmYnKeSyMy@vger.kernel.org
X-Received: by 2002:a05:693c:68c6:b0:369:d84e:eba5 with SMTP id
 5a478bee46e88-36f75443f92mr1048026eec.11.1793925258726; Thu, 05 Nov 2026
 16:34:18 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261105-upload-golf-40927e20b7b9@spud>
In-Reply-To: <20261105-upload-golf-40927e20b7b9@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:34:07 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
X-Gm-Features: AclHuK-ZB6vwHbkhfZNFAAIsLQdK0ZMK7LE0zya9GH_XZ9poNQEbizkJmf2GZbE
Message-ID: <CAPY4CJ5B7YhuQtqvFanP5GpfK0YvJ27xcS68KtK_rZvbxYN6dA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I think you should put these in a binding header file, rather than just
> put them in a description like this.
> I think you really need one for the clocks too, since you've got things
> like

Thanks, v2 will add include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h,
naming the clocks and resets of each manager, and the driver and the dts
will use it.
