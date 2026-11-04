Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787464;
	b=dPXDrGUxQhyZaq9YjLQn1IINgBflT0HOjD6Uc5glIv97E3zJcLozkbqt/+vT0WomNjub
	 GIJ4EDDtOCvJJKmd6WLtBGVNcipTVhzJR0vZn8X5VKyuM7LcHUtvoyJVv/Y6QbN7Au3cl
	 K3dNit0frrsNcuz77EWBa7+Wk3lEY0BSSsi2Wj0S/QF1/dm5SbV0S8SV1gTVHTj/SuQGN
	 r0BODqrchS3stvqQ/Q+Tpn6dhFs7Q05M2B4TjSiaEsdtwl+L/HB8tAf9oppFa+sOjeVHf
	 RTZxVGvxPFcxdTNtKMpdK9MAjfh6yeJsUgD2TyayEsmxIjB/cONOod9ISEd0pfByLpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U9UqJ5usnXoaVC8QtHP+44Z4GZ6155Rmc3hUzLC5hxE=;
	b=fVfqKVpQq2yuuxboG+JMOT9yilD6/XWqViS1YhoeBau1pnRl/I4XZ0nh1vyMosZIEpm0
	 Hh09mBgJQzgqnjXXfxdQCOVpvFZQpwDGN675tNAbDKHhG9xJiajlJDO4PHVgcCPyO3N+P
	 HgyOVk0yvcK6HCEMv7lfuTe9b0+Akk2ljtGLhf8Lwn2XhOrxI4kyff87U+1XqlAguESIr
	 fjJQeDci0K/zSfHDx2yKgNeteqJRM2UG4niEhVDBscRJVqcgoTx4vDJCsOG4677FqEzHe
	 Kwo6C++kWR2uplF2rPpVsW1ipYJHCn7v2dwMYkRo4sEPJ6I8cvhT6P5GmqdBBUxOhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jOgHbxoj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBA4606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFBA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jOgHbxoj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso4422385e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787462; x=1794392262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9UqJ5usnXoaVC8QtHP+44Z4GZ6155Rmc3hUzLC5hxE=;
        b=jOgHbxoj2iLWtbcGzwRxSE0ua0Kttx7nbiqAklxyKq9eijtUnRF7k+BwiNn3oEfVLz
         bVuDl8AJURHh7GhBaaCcfSNGtmGpngeZMcLzOd9mXmyACHDxXdY6uuZUDguikbQ4AgdM
         0wsmCxf/PppzCG581cuYvVYtvHSt8MGuAls8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787462; x=1794392262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9UqJ5usnXoaVC8QtHP+44Z4GZ6155Rmc3hUzLC5hxE=;
        b=knfXZkK3Ax8l5jTukQ4XmZhW1kQ+CLYtjiEsDRx0fWNp+c2lamRwBN4eVRNvo/rSha
         n1QHpwKZKKrLeH/oUOW/4axZAbhjckcIvrp/1/NX6kGUx6+osavRzW5T9XJxHhKr58xU
         C8LbGIGrkdiqH9RDdPMxd7g9a1PoHwnB2YFql6jihVzJ8RpSBpDBS67YueWbJmkfDpPd
         uActXNC/ZU8FNN8RI4bYLRn7LJQUeTuhiRzT7VLdBgdPfLxgsR0auHhLyUeCDKyQcklV
         CricOFFmNGtIekcJLkrpUr8Jk+1URKFOCuOnmwEB/u91rA39ecEXXlDWuVM4YQ0KhUXU
         4rDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdtv+8Iuo1bLAAA//gh78Ag3O6owE02bSgTRLMv/VnKhHZI7NlE/cG91rTIgn7+I/awo4pnse+82xf@vger.kernel.org
X-Gm-Message-State: APuU4Z9tt6pKpWDbA8gUKBICR6teaHbg9hiZohvE17tTgTX9p0xydUiF
	IyM6dF8+4O9aVCC1O87a+IaspswOseo98mJ5OjSulkZpfQ2zrPu+7s6oqkJKEAjDtlI=
X-Gm-Gg: AYBFou0WrtNMQeDlhToLhSS/+wnPHZVX4t0DPaD0YrxhgEwKi55GT7/QUx4I6iMZVKC
	LuM8pvRZqfvTLlyJDIdT2FLdaHrRI3w4s3oztjdi914YxWy7ySZrNI7fm5Sc2HPy+xDHSOpUeJN
	1gR37xjeuXYJvTOJIJB00OPBXl68uCuJfA3PaMyn9EluXmWPk+MYOUyN6uI80gEB7LnCWesYw/7
	v/JYtD7kqN5pMDvfRYI8LZSddCN3qbOpTtu4cm09A9BX8hmy+QHH+4MkQE6HoJOVeNYdh13Znca
	riouQ9OXQ8H/lJhjrPDmhbMN730zEVeKPxm5c4w9r/BxZB5yhuZpNrQNh4NdX9EUrk7pDGIC6oX
	HgrKL+aH6qOdbvUIZgexJHaPv+bJZfC+F77gLvUzw+I/PGfRZjnRr2Qi+ys8sZiuupcC+zh2Ayl
	O15QB88eh8To7xG6FOcLD02aFwxOh9b7acpRtxIfWc6sHjOU4EaNTzdol/pm1dd/HtBanxz4jY1
	mdxGqzvvp89LnothDQy3LGLrf4V6NGFvwvT4adMItEyzwOPbcl7V1EsungFgkhk9jJrrQHy+1oK
	346RXdN5TkhG8HOzcG+1GVyvJ1FMd8pHVSQ2JsDuQJAuUdB/qS7JmhWFilKENLk9X27hA331sT7
	LStI/EI82ABgzCx0SqoAemr0IA7IOL634elCcj4dlRiO66dsGLKt9
X-Received: by 2002:a05:600c:34d6:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4ac150b2192mr366110145e9.3.1793787462248;
        Wed, 04 Nov 2026 02:17:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Wed,  4 Nov 2026 11:16:54 +0100
Message-ID: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and
deprecates the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters, set through
the deprecated properties, assigned-clock-sscs or both. The dpll_disp_ck
SSC registers are programmed with the same values as before the series.

Changes in v4:
- Add Reviewed-by tag of Krzysztof Kozlowski
- Keep the reverse Christmas tree order for the variables list
- Check the range of the deprecated ti,ssc-deltam property
- Drop the checks already done by the clock framework
- Split the already applied check into the disabled and enabled cases
- Keep the reverse Christmas tree order for the variables list

Changes in v3:
- Deprecate the properties instead of dropping them
- Keep parsing the deprecated vendor specific properties
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  9 +-
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         | 21 +++-
 drivers/clk/ti/dpll3xxx.c                     | 96 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 112 insertions(+), 25 deletions(-)

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

