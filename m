Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395243;
	b=xpco+Beo/aw1e3dBZKFnNOAJcFLQ9BefwSK4GIzlfWWixH+glfAAcpXYBepuvzV9Hi2Y
	 q0ml+KYRzBUmZdgledQ6P1p8Iwd33/ZswBMPez93qzsp4AkthrGaUwr5y3EnAhLyU6j71
	 7i6ZOJHP0m/YT1wsWWQ2zcW1EjTYxo6QBdOVSOsX6b/C+XaH4QqDYyV7fwLthWF4AdZFN
	 yvqamilEOwyiG6Luwk5KWBGdYnDJ1T5/EY3l1ZsqWmlt/yAkHanJLCg5Qdd6cn/EZGK1n
	 osc7Xz8KNwasqBZvi4kPdUz+WN511IFLZo5SnUGbgdmp0M/VBpmE0koJHC4twXLpSBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
	b=Sjvt+AFfoJuWY28lJVGs50MKQ/z2fLVcxe9PMaavIXxGq6TQHzuEdZpCYREjnBlG+tp7
	 r0AXhvL3/wHXkQtH9cPAZ47azizqixlOAu8B0mqM2aunIHgnI/7h3JANhEA9jTSL4Kbu2
	 pCXX8ZgZUJ53xAwtICCHsNwQaFI18j3tqLjdeBjZFcjnPNDPyOxeRhDdVYxPzZOYVf6RN
	 pexf7SnSIlbCBbYJdpy2NOBxUoxy46Y6FWxl7b5X+sxHuEwpaHuBK5duSrDGmQvmbGpQ7
	 ALsj36m2/BIdYV4Wvch7bL8iYE8ewnx/5UxLfHSmxA2nlqudMrG73L1+cxsj1zk3Prw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="en/3dGrF";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5393606A32E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5393606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=en/3dGrF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32625575e9.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395241; x=1795000041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=en/3dGrFdvJrBqQhikOW+PJ42oaQqIk3OzHx9RLAfQDkUDn1aTsV7YsOZ0bPdfl4bQ
         pGNdLFmbTpKjWEAow8OWp0470oYPNjsmPTKJO5OttZRd5Hgmpfs+N1lRF21K7PdlkRQe
         xjFDWY2cvDZIIadt6edcvzW42VU4opvLx2F6Lf75Zexq6WKtFVrdD8O2g5SWjQg5f7b7
         rMgTdL09UL8EWI4FsvF9Jg45Wy3hHi0vdp8QKobs4CXFQp0EUyIURJXlBSTMQuEcW2Re
         BiyOeIuI9QRrChoN+zNRxRIDgPX1CpvkfePHqsIxEaQU8W428VzcuqWOVtk61X7cWXH5
         v1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395241; x=1795000041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=Bf05CSP8i54/zFUZw9LsisPK8RN+Pusbg0f3Anu/pAwG4InEhu1wNSqo5kccwmPCVv
         xP31p3C3tD703awR7gU72bGCiK6eL0kaWfZUjjlrNjNce3YyPuKsZKOjho1KNZ/bucVP
         GAqxNv4c/KTlcfJhYzOdJoJtu9psKw/nrfL2WZMCiqkRd8xJl7EnOzpOs+fgN8ZkhTTo
         ky7c1pQg0sRzc/jFxbD/9ohuGGN8G6q4zF/quOXKv4ABvlAAafLuWXnNCBFNEO6Lya1I
         bFv72QsAAylcDTVf0kLdESVVD4/f3/9j1GX3dfr/3cH1g4l9NGTV6egJbFRAb/n2ymhn
         +hfg==
X-Forwarded-Encrypted: i=1; AL+hErFxftxN1NYmAkNDzAC0hxWfWtdmMNWjUBqm8Zm4+dmF2FrqN9QsYIvcmHptbCd+WnkR3DXJJigEmbF7@vger.kernel.org
X-Gm-Message-State: APuU4Z8RTZArzUzFjHwKzZ5B/PzRAsF3yQzqYM5etUfIu/6IAGkR83/t
	42KVD5Xbx7o0HBG2I+BvgSDi3RFm9dqJ1/mgeqxUVpS/sGWpJ+qdHx90
X-Gm-Gg: AYBFou3auDF21im/EEElCULsFza6aTaYTnrKhgeP2FYcg9lhgplH5OtS4JOvIwu8Uh7
	RcYiFWI9wfvk3yiv16EkVKihbknNho9XyQmeTVp6vUvN4ZZXrMdNRSWvfG3H6XM2fN28NVBZ62q
	rapzhw2JrrKMr6MRcL/F3VSse3FCGhfTax9IQuFXq3aNd2pI+drxi/hcL2zh5MOqtJGdGyofIMO
	nQEostit6a2e1zJTppTPfxv4I+NqlsluNwQrGiDEaLDXPzs/RRp/tqmJEJw+/mRfDXpmeKNR+nW
	JJiJCd5FQub4zLbZMl8kbRr8HagoOrjPGUmKwJKsUw1CidfVXBLBu4uoi3ZzneITdCYM88ncdSG
	6hAbJpPT8FgtXnVpNUAaaMvLe075mgjTSFWFT6HcNlREeBdvf4KrIvBMwqwvxp4/nXMsEaVoTii
	/UL9oJdnFGjAopEQdOBh1L2IS4/DcowbyhlXLkX1u1GM3QSKJUlB/diVqHy09fSJTUbhDpvw6Hh
	+K5mcY5kijg7fjR517fQQboR8evB9WABvxXJFmHgt1C+c8J6zqSKurN+Y6o3tBhDg7P941BQXhy
	ISlqVC4/ZOaLn/vRefBV+l3D1fyoYHOhaqg4RiIb0LCV1hVg2ZIFLp33vAS2ajhsfxO3mj2TIIl
	6Q1SId5DUS9TdO2N+ywCgcifMUqpreLCOKnYs+XtM62uMVAMBQ10QlDD1kBVExYiksug2WEu0Nr
	F3hpO0+G+b
X-Received: by 2002:a05:600c:5247:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ba0937f143mr36040755e9.21.1794395240926;
        Wed, 11 Nov 2026 03:07:20 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 0/4] watchdog: rzv2h_wdt: Access WDTDCR through CPG/MSSR syscon
Date: Wed, 11 Nov 2026 11:06:56 +0000
Message-ID: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

On RZ/T2H and RZ/N2H, the watchdog debug control registers (WDTDCR) are
located in the CPG/MSSR SYS block rather than the watchdog register space.
This series exposes those registers through the CPG/MSSR syscon and updates
the watchdog driver and device trees to use that interface.

Normal start and stop operations use the syscon regmap. Since the watchdog
restart handler runs in atomic context, the series also adds a lockless CPG
helper for restarting the counter. Existing device trees using the separate
WDTDCR register region remain supported.

The device trees for R9A09G077 and R9A09G087 are updated to identify each
watchdog's WDTDCR through a `renesas,sysc` phandle.

v8->v9:
- Rebased on -next due to devm_kzalloc_obj change
- Added RB tag from Guenter for patch #2
- Dropped WDT driver patches as they are now queued in WDT branch

v7->v8:
- Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
  restart handler" addressing Sashiko's comments

v6->v7:
- Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
- Added new patch to drop pm_runtime_resume_and_get() &
  pm_runtime_put_sync() calls while accessing the WDTDCR register.
- Dropped propagating WDTDCR access errors.
- Dropped converting WDTDCR handling to regmap as this would require
  resource address comparison to get WDT index to call
  rzt2h_cpg_wdtdcr_count_start().
- Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
- Added if regmap is available, use it for WDTDCR access
- Updated commit message

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
- rebased on top of next-20260922

v4->v5:
- patch #1 is new addressing Sashiko's comments to avoid potential deadlock
- patch #4 is new addressing Sashiko's comments
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.
- Added review-by tag.

[0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: r9a09g077: Add helper to start WDTDCR counter
  watchdog: rzv2h_wdt: Add syscon based WDTDCR access
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++----
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++----
 drivers/clk/renesas/r9a09g077-cpg.c        | 35 ++++++++--
 drivers/watchdog/rzv2h_wdt.c               | 77 ++++++++++++++++++++--
 include/linux/clk/renesas.h                |  6 ++
 5 files changed, 130 insertions(+), 36 deletions(-)

-- 
2.56.1

