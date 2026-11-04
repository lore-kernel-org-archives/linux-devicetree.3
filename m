Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823033;
	b=hi+gQgqGM+cHP5Eqgt7+OR/0wctxG1S5/lhoF9J8yBceFLe0Z1ZpS/dtqggeinHTUtcn
	 TJIA5UaqvHEGce4PYX2P43qF+/2G+KGL9o+HIuq2B/wIh24vSzcVdOvA9AZQWsj7r2187
	 /3qZU/1memo3UIEnzRrKZhYBbGX5MyjYlmxnBBIiL+gvJUCdOWLFiLKlalu2TTZ2e8Gvz
	 4HNR4BNc28BMvR5toneLFDsVoG2ShpHazOUpA8bX/a1VNOqYohzPidzbzxbtb+dqJiMt4
	 GvaogQosr2x6GVRtcTWvcBQ02ui3Bgq6rAjCBfQngE9pzMZDy9juJDGvcZ+tubUSnRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823033;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
	b=dYYkxPeGWcz22Tdm5gvRNTU3h+HYnuOxafBU+aRwOlR5BMuGKR8xAXeboMDxovST9MMP
	 hy2Aaf7UAa7EoBh7JfnUtMIlsokno8b43IJziNwoXt9K4ZpxGBLNyWO5KFFV6IAEmJDlr
	 2CZAocRRHv2LSua5kKwHj0jfJEuc9qHf4tI7fkpEvBfMUsoAKTS0AR0dilkVPrpNXprWr
	 83JISHfHLNA/ghGDfRiUzpZcev13nD7xouOvFi6fiUgmARH+lThZzCVODy5iSQeI8TNKr
	 /S3LCmnC/QClz0jNQzrdpDhRCnV/4A+Ybr7eyHJBXmVhR8MpflHMLTRJ1r3wR8KEGCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFB6607E73E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFB6607E73E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so782885a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823032; x=1794427832;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
        b=2jeZRASGyYBhWpnfHogrjSz2F/EqXpt19ct/V4WoDKV/Q66VTWRzEZwlTiQOWZo11k
         7n1nX7Mkyl5ke45QMc2imTZxGvJGQWDwIRWZ5EUVe6fqlFs6B3LcCcggDp9r7DJHh67S
         zMfXfSiEhlxAQFmyhWDCGsZ2WWNqVm0hFKwGrO23RhoQqxAhG7/7IyG1r9yJbm6HZHfY
         Da7RF/3HBx3D6X4z9FhNKTutQltGRy9eKwAZvKur5pvN5VH+cxnSjW1Oa1G+u0IuQ6DJ
         PTAWHdlCUcmO/pQQnlaiFXkuS/4xqil3k55MQSPSNykkToNfaDUYAMLJo/6TeTblOMhW
         ejZg==
X-Forwarded-Encrypted: i=1; AKwUvBw5p+ItoQKSnAPQSOcDxz3+wAOnutKWpPcV/Qq2tUEWb3tTSlkFrw6SFIfVxmZtEXs3dhh3C6Y4fUsR@vger.kernel.org
X-Gm-Message-State: APuU4Z/s/MqOaazbeDqYfg427Z9MpAQCVhhmXf3gyTJPdaVMrgT4Pbm+
	mWmI6jfczS6cq8fz6z9wcWKcni7dpjgoyepl4Zp67v1vDwqr754GsTLap6epXwCo
X-Gm-Gg: AYBFou2VGNJUKBfZpIFqA18dCOHVdFDuGBGl1s53UXhj26LHALZfxCf9zYfPNpEWGMd
	JjfcD3uFXzedJ76GN8/O9JKriE1wktQbEqCYlWAX9rAC9QfhUHB+3oMGBag4IUDWE/ltsYePWZT
	V6ur6svtSosJLk/Nmu+iHA8madY+vI8z75rkAD/0wvCsASaZeijJSURrFDw81vCbKeG87XrrUe4
	rXX1pVUI4IeOX1YkSzWVWr1DZ3qY4bIjzgjDitLaSn7L4rHixURcqrmAIGUHnLqMyuaaka7Edgh
	S3x8iZCyf87hAftOOB88koGZ9fMU/MAJklF9wfwoB+ueRd6sk/kOqEUHMn3i6A2S4Ju9kYrC4ka
	xiSKYhJ5budiU1egANillLgD59NZujxsW0xAtwV7Q/VKYS6u97qjJVehymsCiTscU1w7EAfVkVl
	NQsYPcLB1PGSUxpBjg3S1ivVMQ1s5PyrO7pEVTXrduMppXXchPThtndmhGbaXIuLX1e1YVfhqyP
	odh8CEnWjZK9a3snPu1NnSLwq4//w9/qK8vIKJkWkZ4MYbg8qK7gl2IGcdN2/BYyJd87mYzmmls
	A/WSrNyODIRkc1dkqIsxjMhBiUMsY2b2PPwHzS/wppgvnaqj38cyGxYW/8VJC9APQL22VViRWam
	bQ3FkBa1zSdu13ikBqnGv99JBze921plYq9PKp2Q3VeeRsw==
X-Received: by 2002:a17:90b:1643:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b09fbf8e31mr1944925a91.17.1793823031930;
        Wed, 04 Nov 2026 12:10:31 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm421073a91.9.2026.11.04.12.10.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:31 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso2619581eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwiyev4ulml3SIbSmU2LUFSnGsqA5Tt0OWHrzmhhDmOzt3eQ0XNnBJqv7OvD5hdj+xhQZjD8lMVutgb@vger.kernel.org
X-Received: by 2002:a05:693c:88ce:20b0:36a:1f8:a5a4 with SMTP id
 5a478bee46e88-36a4241f808mr25514235eec.38.1793823029345; Wed, 04 Nov 2026
 12:10:29 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
 <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
In-Reply-To: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:10:18 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
X-Gm-Features: AclHuK9y6rKZ3LjTVpypr_d_uuxBPp6tSISF5kZ9UZgLTLqFDDhVhOAbPmN46Wo
Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> These are reset lines from the same IP block for different clock domains.
> They have to be asserted together even though there are two lines.
> [...]
> The gmac lines are for two sides of the same async axi bridge.
> Asserting them separately causes a bus lockup.

Thanks. v2 will explain it in the commit
message and keep one reset per group.
