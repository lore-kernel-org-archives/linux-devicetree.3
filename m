Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD03FBB5F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791319; cv=none; b=nbtfjZ9csdmm48mQKtDF/SenPNifF0n80cNsmBsXRebxaNtQTG0DgQTJLRpPA+m13w9vlvzYAOsX4G/hm01nAtPOfM4iDtYS2Lw2Ax6rqwA/egV3VsEKxTnw8OEXdpVCu85CrV1Jv9rg7e5Fx0P+6HGvLAlf3So++Va9aXCCr60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791319; c=relaxed/simple;
	bh=AZzjqtGd2uyaNC0YwOJ1usqM6sGXD4XHnvbkMzDVHsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ITHofcnA9PVsi16G28IOfvavlT7yk8Cwmri9BXsL/TNZ0qzQWhCAyammppvLPmJ6zye5Xl4cU6ZwlWQBKRZsGuxopFFIgCg95G53e6bB36Rbo8z/jGRUsJ3eBScaOOjnE4V+n6e+M9Bdj+lFZO85OZzN0dhxjf/gefKWbp1bLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHkrr+Gq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHkrr+Gq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-beeba001887so120097266b.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791317; x=1782396117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqWrw5Zm6IcTUSbd0pVoLa2mAQQgXMRFds7fJ5WZYVo=;
        b=EHkrr+GqYEj7odISyKZq1/gFzi3oOH2X14s5KmU1vyZBhWsEoNLZoLyOdp5So1CAL2
         I+SAHprT8QYtcTKslSNNeU6L9UCZdvA4ymsitjCzPpuquBYBeqdP9288akjOEL5FyNUI
         ikoZFg7sUKxvYSeGwudX2vj/Nprm/mzYCMxOVy5gB6YXybCruxIBFdnnAmNqCUsWAryA
         En1In9uuDIEkA8P0R7xemrzlgUQytGOW/wwjYh80LaC0v3kYqbEENsiUY9I7RjHPPBjQ
         i27oSZsqMgLXWIpDrydQRBeI1k7hMLNN+xuspQhk+/OJLjCahYfHtk7EORugjmOmnuix
         xmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791317; x=1782396117;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqWrw5Zm6IcTUSbd0pVoLa2mAQQgXMRFds7fJ5WZYVo=;
        b=V4RXtkXLWjdmutsjyTn5DgfCsXktdsk9uBEjF14+Ml6dp6bXnvInHDgl+pNJa8LRcG
         awwV5XJxUgaPilc8ZH2c9G9q/yLOpK/GwxJWc390wgfPShtFrCFliCSSnbBTVOrspeWc
         oje+kJJTYg9tNR/akG4A5ln5l/RlsUyjre/1GfwIxtvrVl6zDjGmPf/xiIJ5ZUhsa8sg
         TL68THStBftDnEfTKoOc8zdV3Qjyu7hhwQh71GBT5yL6Z0s5NKSenk9bN4i04EoYaq0h
         M/K2cxobbfQHjn2AI+OUTh9C+NiQkFsSgoYtoIFZp5wyff27xFu981bSUwuVtHOZX2OF
         jldg==
X-Forwarded-Encrypted: i=1; AFNElJ+aIi5q28AMUgExEVzVhTJsGpO1unBzBG5xVU3ovcy2UtOD0tNOTaf72ptPRoQns24Jfo9zl6TpKa1O@vger.kernel.org
X-Gm-Message-State: AOJu0YzvV+oQTgWKeSz7JeNegpKWqXo/cFrhuQQDQzKayHEB2H2aRuSH
	aU46Hzn+VrUf1ur62QBIYG8CDVGI/zBwgbVbiHcDCpYbiwaAK/gtmb3INohWKQtuePk=
X-Gm-Gg: AfdE7cnvTN7YEUr6CV7viUILlC0FoUdbREJ4jsR0Uig0oCJe0fvHd6s1U9zWBW6AQDZ
	pq/3gAeH4iO/xvNLlGWHtVDaWLBHi8oiqFsxIRys+1+OMJZIhhyzNY4doh0ZP4eKFqf92o0MPyl
	p3Aw7e8DZ4C5cgaa3apZbl03e/pLtdGxDnSHtF7RKWbwRG3fNlX5jabIby8mzkz5wH0hidmMHi9
	GqSZC7cotkTr/dbryhzoq1F/Wvs3g4un9hALtzdy5lBacM5OTZYauFQ+Wt5QawIP78rUDh4u3a2
	6MtBf+KfhzoBuifqCNFRQP2kozKEsTXtd8w0dhTtkYBGqo30EWQwG2RLrTuQbjoS3i2/76bQte3
	RhLUhQl18YIsywx92wzCExawnOeXTrOEgaQ70z+eWaG4y95Gwr52IIjjelbjn2vsEfgzlxiIAhZ
	TQ6B689MEbzSG6VVYU6Otx0fwFrzi9XWWneQ==
X-Received: by 2002:a17:907:934e:b0:beb:7979:47d9 with SMTP id a640c23a62f3a-c074898f593mr220079066b.8.1781791316348;
        Thu, 18 Jun 2026 07:01:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b3ed0d2sm27901309f8f.22.2026.06.18.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:01:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Kael D'Alcamo <dev@kael-k.io>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Igor Reznichenko <igor@reznichenko.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260617143245.372182-1-igor@reznichenko.net>
References: <20260617143245.372182-1-igor@reznichenko.net>
Subject: Re: [PATCH v6 0/2] drm/panel: Add support for the FocusLCDs
 E35GH-I-MW800CB
Message-Id: <178179131510.245596.16459075760414662708.b4-ty@b4>
Date: Thu, 18 Jun 2026 16:01:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Wed, 17 Jun 2026 07:32:43 -0700, Igor Reznichenko wrote:
> Add support for E35GH-I-MW800CB 320x480 MIPI DSI panel by FocusLCDs.
> The panel uses Ilitek ILI9488 driver IC in DSI mode specifically.
> ILI9488 also appears in DBI/SPI panels, but those require different bus drivers.
> 
> This panel driver has been tested on STM32MP157D-DK1 in addition to TI AM62P EVK.
> The panel works in video mode on both platforms. Additional panels using
> ILI9488 DSI can be added later with their own timings.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/532701ad6e239f1b47bebaa597e159c282c6c6ac
[2/2] drm/panel: Add Ilitek ILI9488 controller driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/99e9aca83bfb867ae780f58d076bb89dd5c2681d

-- 
Neil

