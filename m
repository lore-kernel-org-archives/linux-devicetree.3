Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE23B4EB2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625362; cv=none; b=Q/meQD2verA7n+eoEXxO6F/6XfFpNq5dfVF/S3ElHbwcfh48XXmWWDEvt/MEfWbLAg5sxBDqOWU1jVo2CtjJ8EZszDrpK2qs0kbwplGzw8PMF6vkANFJOV8pAKDHyR+stasboBUwUlOT9hTijvXhnXX8yUJTp4Kw+1CJ1sTZhss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625362; c=relaxed/simple;
	bh=dPCjt2VVOrgeOOiej3J1U81Vg/oNhi0nOgkXTTXIb8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NOdMAYLNXTX0wj89OH5k76Eh5gaOqrUltMhK+9GnE85vAayT/z9cn3ZU6mC7bYwaaSKnXIQgAuZS8yy+jukRUZbPgMZhCDAWCHDS+ZW7SYkp62UKP3wKRKDXzTTofGYU8md6Qk5RiOnEGUHIFTWtqUGADgsvJo1LBd3tew0/Tqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbmW8maq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbmW8maq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso1502295e9.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625358; x=1784230158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJQOEk5yqB+dE9SiEhcvYRxkNhnNp9MLYOiszo4g7GA=;
        b=SbmW8maqe6RrhgpI1e5+/YVHoWVT6bJS1yzE17CVYAatNWNSTvVGo8jQj7HV16ezzp
         2/iE0NlcPsP5qF4gAXdCpjQLe1tN4j2RutsWj6ZnzBl8wPdBTwqa82SURrq41I9UDuBV
         dDlWQVhlmpBCqE7Es/3Py8uAsOcfg8WQUUhzN1rMmfgFNsO0uxEP6gYU4YksJi8KBKpk
         V71oiAedIENv1hFGDQYTzCYl6T2r8IDeHOVnM+m8uV2zKMvLhybd56WfZf4nrHycRIWs
         zdDIXlmF7OiSlYUhvIN+J1ohyqUGlYblQMFQEpzl9GHFeDefRkKi6qzd/qo+bHbsI8ZP
         MOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625358; x=1784230158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJQOEk5yqB+dE9SiEhcvYRxkNhnNp9MLYOiszo4g7GA=;
        b=DQo0ew8Vnj9LQj7eKQYxsfSoIz7PcgaLLVuKDHsekDJk3S34JDs4S7UaeX5d9Twp4C
         jHAm+Ky5yBedztHt2BMUkEhcnqP36SQyrzaJRaWCkx3Gwo481UfZt87HN4pno6l50bP2
         KUcWOE0NaduGZvUfNBCwROWSNriiK+XHT6UWVr7izBJuKEiXTcvkZKN2AJTFGOq1J85L
         x/F8jOfP8le6KRQmLd18YxR1ITdWTQRA1cc18kzORKhoCox6ExuMAcc8qm8jvT1VuOGW
         K/i9bcVaMvK5FCV5aNt3zQQFmo4oEpE0Pu9fqEzGnkYBHgoOO4s96fXxNfSSG8N1B2ae
         OH6w==
X-Forwarded-Encrypted: i=1; AHgh+Rr6sZ34SDBoSx8AxWpdKRh8oK8xKWpE9rQHyC3y0ngxVisYzxn8UbkQIjH8SibtQM0GeodM2xr6WGQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3PEIVjWO4RIrdkvcnmZe6KUEwM9FeUVxdSNKut+Zheeuvs09Q
	QERceaWRRcQXLnt5WsuqAdQDZD6rB+wji8cYc4fv5OUhkbn39UWHn7jS
X-Gm-Gg: AfdE7ckp77r7GniFUpC9fFahtgBT0ya4nlUb1WKaM3QXn0uTbpOuQM0UGFi/19HRBaZ
	CBYlVNcoLyvhKjiHeEWdtAXcGDw/RtTFIkif31CVSJ3jz7hwqUXyR3JwEAIriu/ovXpQNSIT5Mh
	Zt46gk09NqwHKdfFxTMaaaMUHNm+MCnvvaIKngsDiGOroTsUiwZ6Y3gxQALc6FFWP4gAtQj6Nf+
	wGBsnmLhmB7QdmO8nBHxnNltARrERQY5TwFLHiVNeGLFq4bzBAAwSLdTsCWzi9ao+cfyjhk1aoT
	e1IDlIiUl+25dJJHiAe82BsNInGG5Bs5ihGcB5asWmmJpTpxghwA+bC9kT9ACPVEi/gzUpiDzDl
	5BJmQ9FfBHqaaBNQ1JRY1SZ3pdAdD9V+Vqyf5ATWdvNe9c49efRHTlzHibNhAPxRQzWV4Dd7Zz+
	W+sLGhdc7hGuZgsSaVA2B/
X-Received: by 2002:a05:600c:4e93:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-493e67f7c3emr78360215e9.0.1783625358090;
        Thu, 09 Jul 2026 12:29:18 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:17 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 00/12] Add Renesas RZ/G3L SD/eMMC support
Date: Thu,  9 Jul 2026 20:28:57 +0100
Message-ID: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

v18->v19:
 * Updated commit description for patch#1,#2,#6,#8,#11 and #12
 * Updated clock and reset description with AXI master and AXI slave
 * Added else condition for reset and reset-names.
 * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
 * Retained the tag got binding patch as the changes are trivial.
 * Fixed the clk_mask for non-DT platforms.
 * Fixed max-divider setting for non-DT platforms.
 * Replaced the magic number '9' with ilog2 function in
   renesas_sdhi_clk_enable().
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400 mode
   and non HS400 mode(uses 1/2 internal divider).
 * Updated handling for clk divider.
 * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
   hardware tuning delays
 * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro
 * Updated suspend/resume with scoped runtime calls in suspend.
 * Fixed extra space in HS400MODE2 comment block.
 * Updated the comment HS400mode2->HS400MODE2.
 * Dropped the updation of clk handling as it is taken care in
   previous patches.
 * HS400ES support is enabled based on of_data.
 * Fixed the space in HS400ES comment block.

v17->v18:
 * Collected tag
 * Merged patch #4 and #5 and updated commit description
 * Annotated the empty sentinel entries in the OF match tables with a
   "Sentinel." comment for clarity.
 * Retained the tag as it is a trivial cleanup.
 * New patches drop struct renesas_sdhi_hw_info, instead using
   renesas_sdhi_of_data and tmio_mmc_data.
 * Dropped clk, pinctrl, SoC, and board dtsi from this patch series;
   will send later.
v1->v17:
 * Collected tag for binding patch.
 * Resending the series as there is an issue with patch threading from
   patch #14.

Biju Das (12):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
  mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
  mmc: renesas_sdhi: Add clk_mask field to support flexible clock
    divider widths
  mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
    ranges
  mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
  mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 ++++++--
 drivers/mmc/host/renesas_sdhi.h               |  11 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 250 ++++++++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 ++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
 include/linux/platform_data/tmio.h            |  18 ++
 6 files changed, 385 insertions(+), 87 deletions(-)

-- 
2.43.0

