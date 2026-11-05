Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912461;
	b=lrfxC8q6uKCi4ve5XpvUq7DoJD0xBbgWpqfh3oVGjA2zgLspr4nwlUsiGdmkBceStvjJ
	 3x/RK/Q09/CveqAh8FHZcni1liiim6DziGR1unUueU0fAjEONgwjMx52k+fx1VGce6o8m
	 WbgDSvGsf6MCVpzJOWJ/tNXrWiuk7p2/8WjZHRyWrEN/OBFySBMgNnTMq663Fit/P1ZMw
	 bTn++nJROadjkxC6VNssO9XAspnJyqWTL5WfA8FvvXpxLDD5dVSgN3JsI1X/pZ6vWlpi1
	 UMdLXP/9N41fHk1OCfkMYV9NeWPv/VZ5jkmc60i02uZR5dhi0PKC5JZ8cYqsu2d01vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912461;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7b+CfX8248YTc0cB7f90DTUeLWviHqXuubKAwrMY9UM=;
	b=Sy/iZE3jma2tV0hxxFS5UkvOyWucb7ga0AnovZkgAdb9gbuFrmeBUlZABtDj1306cP1V
	 CKEtpmpLwqroAP+NRo6MHDAKD6j2tczAAhMRfBUmqIgKSTQ/Lap7DmILRx4qrqh0cLApo
	 Mx8LQN/xidwKG5frTRztDJCj4Jw0VPqtYSH0q9ci5SPP22iyfIf5urryTxR5DunhHCjGA
	 rg1jy6XNadW4+7xWVjeptj4n75fMvLG3vD9VUCe/fbtbuXBcHjpwtbSD2oKI2gUkpvG9q
	 043eqGIqgE0znN25A2BaoTqTpgNCmkw7/k5P5KThqsxBo3iee3D1G8IykJeO5JnZjHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE115606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE115606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1570607a12.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912460; x=1794517260;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7b+CfX8248YTc0cB7f90DTUeLWviHqXuubKAwrMY9UM=;
        b=mdJAD8uT6W/AGPUBZfnnHj6/X7rSQtxTM8GizrygkMRA3rPtzkoRG9v7hUP8x4BwXi
         TO8xxtHmS90cpoobWfXnLDVyYqtJH1fu96Ovf/LXIvMSce90CIo/fsjDsvCaP4TOiEJb
         cCNiBSCQvHbi6h3tiN2WfmHpZbJew/Z8/gpnpxxgxINMvbiLNtmLlA2+Pr296oe9zOhQ
         4YKA8ipkHpaUq+ZPS3a612Euzn7x3YRx3BIpJWiQbO5x49q5Kdnqja5L5LFQqH518/Ad
         ArV3pqodihzlAtW+QoARVk8Z0k4sU91CRNoFeu+4tXuD8mmidMOGHP3NlkKope6UHZCn
         ce0A==
X-Forwarded-Encrypted: i=1; AKwUvBwhd7kGMmNoQIlJjCDhEiS5gXWJDIKxwv8Ist+TjD+X5Af3A9/ml5MGQoqrrmbFV3036juVnBGACDTA@vger.kernel.org
X-Gm-Message-State: APuU4Z/MEcoA7sZCi/++bSYaFgdApHh16YUzMsaLitPr+wduG2hW+IJ5
	3YLl1Xxx/b+X2MWmciUhgQJNqwkMOza8VNtkK9+aaTxE8TEn21HdAboULNiei/lG
X-Gm-Gg: AYBFou2lwEsAcOs2f3Cxrc3iCbHdTrs41gzLY5WomTT5KjCtxD506y38r/n6nWbVe4o
	KcWcslzTY4MNOQdsj7S/ckVqToWgLucA++aZNoFTQh2lHhHMiLmzL6Tw5iHGpmRJpCCjKU4RSSt
	YG3GEOKcH4mL5FCo98z3wX/ZrBASKS/9YpkIlZjVGqXatNAGv7VuR4HoidQfNDwarUBU2MABrqw
	m0wtDdu00uOQ/qWsAtIp4eGJmETVip3d3FM3PkMTZ3vd5Fk2wt9kofhg8LaqReuB7Q88tWiTfKN
	j6KnYUYJ1T+GEvjOCLgC0OKRPvIHsB23K1WgOPMRPKLxdhjMpsAwL12QDJmCjC3FEN9Hqe9Syxl
	cPlhZeb1kTrqMhRIJDgc7nJIWZcfX7C5EBxBumVy4y/ph3+86Df6z++04CXJusReYvXV8EntVVg
	qLAsaFZqwQQ+y0S9kxpSmNk1coM57Gy8MRAHWoFUj22S8MoTt6EFFgdEYHil0BRF9sFPPRiGPbF
	/unmLcFINTlt2/nU/JsNrVgeyzQpyWluJLmre19OOiXWnhsgzVfBaabD2b2+QU0D2qeSy1Dg5ZG
	hGIXAf3+TIDLNhlHddM3SRLwYqEWNWuUOhLEv3z1fF3r6RV5qjAvkazefmnHHj+OlKB08TIKu39
	oIrnTKjL9V6Vwt/EtMK8z/uhjRn4V97N+iVMyjduc8S0=
X-Received: by 2002:a17:90b:4a89:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3b0db6fbf17mr231668a91.53.1793912460255;
        Thu, 05 Nov 2026 13:01:00 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42932sm647666a91.6.2026.11.05.13.00.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:00:59 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so156958eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwLAg6x6lZEUtxIr1xEEtfN4PJKjYpkVzVp2eYo3JzvDh2XFva7oI4uQQBiWD4kk8j0IN4F0/6EIfwx@vger.kernel.org
X-Received: by 2002:a05:7301:7187:b0:36f:4569:7392 with SMTP id
 5a478bee46e88-36f77103af4mr423739eec.41.1793912459132; Thu, 05 Nov 2026
 13:00:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev> <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
In-Reply-To: <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:00:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5kwLxQZCRF9+ywSavP0G3K0ytvB5+NbmrWGrtLbOnw=Q@mail.gmail.com>
X-Gm-Features: AclHuK9lRGyMU734A3a1_3WSwAPLqlbO5flD8SV-l9TZ_P6sYsnX4mVcOu8Aedc
Message-ID: <CAPY4CJ5kwLxQZCRF9+ywSavP0G3K0ytvB5+NbmrWGrtLbOnw=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Since these two resets are always toggled together, consider using the
> reset_control_bulk API for both.

Thanks, v2 will get and toggle both with the reset_control_bulk API.
