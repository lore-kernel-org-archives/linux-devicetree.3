Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838899;
	b=xGb1A8ApkAxbA49E2ElegmTMiEUAzJ6/B+sagpoVG7XgrmB7DqkVDjQEmZN/4ZGwbD5V
	 iRAp7/gaxHmZGTPsPwBGiPrEI+JggjyNa8YBhJPMK9hll0BTzoJOxf5gTKxz2UEyRgmma
	 wSJmLnMmw7FwhhvQs+DblL2etYNWHM1Zynk5DHeborGT9jN4nu9CDTzDqHUsUX29ftgNn
	 4ZFKH16APpsJIi8k5gm28pEJQxanEDw/lzzObTVRt6eXNBpR506NPzmK41IjD2LMYrklZ
	 kmhRFerVtf8ljBr5KyuvB12K+dv0JSLma939ZqxJxBgAOO8y9kXL0B6SsU/kHvQsoXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838899;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
	b=bmCiC1tV56M2oK7ME8vytqAuy4LvvViwougN0pbosYn5HLE/AX3O+l45rm1tM2hw6LiH
	 JcJyqml5QzHMi9GlGWa4+ru2+iMyxeTA2Ww3N0UVfjHT2sQCPRAUAZWq9xZDYjFcO4mHV
	 hijfDsFtW/B0AoWPAFNTzm8Ge/p8uT/OXXNOVS5sA8cgLIw31g7WPqFWestf6Jeat9ZFc
	 FET0JOgL79I03TZuTJMyY22moQBog0uRi+PViFeB3W43etT83fG3RKMCSaAR8aSYLP423
	 YABJJZplffrJOxS0GnJKz2MSMmuMNXPHfZYAHr9cmmvEBcncD2aG4mQIqCHai1x3Iug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CA606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378CA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso593870a12.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793838899; x=1794443699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
        b=ZHJBaFsh2vUbj8nJzI2pCRq2RqBB1TfukwFJGjcBV73tHAQJL+d8I3WIWZjaoE7blU
         6V/i5R7/QkZdYtBbQW+dlrDR2ZP7YC7kuAMLx9n5kjpMeI2s6BTWpU3UUeae/UVL4YOL
         rYbJHKVRqahtkLv1Du518pk3sRotdS7s2jF5dr/w1WRUdYSRepqHskDd4PmWCe7HW8wr
         eb0uhH7FR2GhVGjUIGkTLjjOoxbyIHke2pOT/o+0kG3Pt34Z6hFyJ2wMKZdviFYO6ENx
         Hg+TDUBVzXlEZVBwx37cPA0Xd1s/qZrKeDk3N0lvdNI07l2UczkBBTtAEa7lgYwhq6rr
         4PGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0ywtVrLnHeTxIM9DmbwRmxA+aVcZ1stcL2p8KitwLUvHEyZvykrHDZS6eGK1wzSCp4Y0c15cDdWGC@vger.kernel.org
X-Gm-Message-State: APuU4Z99kqIPqTIWDQZX9yFREeBL1cCAouD71GX8hSqTq8gO4h6eag8t
	3vRgYmCEzAW5jItKJOs6jg+eZd7KtRJw5TSHti/LEV1sRll4qBiBsa7BWI+wjrsb
X-Gm-Gg: AYBFou0YtLupOxp7TruuPFmcFbKcZ8iC28ejn13JygDxFrvis9JLln6AFi2wHDSB4bR
	8yX014nRhEYG462IJ179TgtTeTSExMPQyp/XCEpgSOm5MJ+Z2QEw+k2JFbNq/F5POHhQq6gZGqp
	89H2AUjQQkmt7JVBX17BfzOzzNjjw9hZxuTMZ+O+7LTYIF4x+IiL6Jp+T3vPR383WETySNfqDkO
	czCTBRunEd4FECYA0S6pnufohxH8Ko9/ya7ygEQNaFD7DVfrephTbU0eiztGq+34c+npbs4aysi
	ni/vonVgY5MG+GN/B6OKA8xQrRmdkFoc++f78EwkntZJuCY9S51Shpj84KHXsvgKJ9SFgxm5XWZ
	pxeGBybyPtHwcpzTzkIyDF2p+YtiWl8/gKbZx+AE8B1Rt6b4mh/69u8P5qrDaZ3ihsVCEDN9TV+
	uu4ZZfp8LFwAIrsdFf2hvi8moNqn5V+C0YqR+eztSt9TtI7E/I9fwQVCIhGtzD3L7ZfQnREvmCj
	gLfwdEJax40StHkW/nTT7Zg1tIDQ4WhwL+DaPk/z9k+g+IB0sUc2XWFWcB9dcNhhDNkfpYbPiZT
	D+eGxBvULYjRWN7KlSK9CiVBX9P5mWAMe2t+C2ae/vkLGVIW4vBmj4KFYZnVeZLeNAo2snZEuXu
	cJNwzF7Exkm82nC62gRpwkctp6mlnp1M4Ss2EsBG0S4g=
X-Received: by 2002:a17:90b:2252:b0:3b0:aaed:48d0 with SMTP id 98e67ed59e1d1-3b0aaed5d87mr1618563a91.37.1793838898405;
        Wed, 04 Nov 2026 16:34:58 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32baf86sm936065a91.17.2026.11.04.16.34.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:34:58 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so1741831eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByWcBfhr75qvmdIOB7oq6Y8lEwS2nQZDkJL2/0/IYbl7zy9bmFZRCN+WKdn8XKO6PAtJZ0G+ms1p4wK@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-36a4244dbfcmr25290212eec.20.1793838896251; Wed, 04 Nov 2026
 16:34:56 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
In-Reply-To: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:34:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
X-Gm-Features: AclHuK-1vO168WRWmJd07mz7tA0jKpT7PGyfi_yQuj1AayEjOBkR4gYRSMoaS_A
Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> They are the values the vendor bootloader programs, and I checked them
> against the hardware.

Correction: they are the board's factory calibration, stored in its
factory partition as 17 and 10 steps; the vendor bootloader leaves 23
steps in both, also inside the measured windows. The rest stands.
