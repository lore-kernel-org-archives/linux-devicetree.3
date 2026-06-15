Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483B3FBB7E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538502; cv=none; b=XRUoqVbJ9fai/xQ1n8HxdmeMick8CEVUBwpvWMc5G+YaXZ9+1DP5woWlXLOP1cOwn/dht6oV6bTRN4SO/5jykJadtz6pt0nH8MTuS7sw/oPhEXY3TgO1ND8IRdVYU0Di8UPXdBfMnBK3iVTrHDFwYJUaBz2rJYG9g4i6oczbdaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538502; c=relaxed/simple;
	bh=9AQNjOJK5XErQabY8MlMHTqGBlzsAUQVv7/EoWhSEbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VUvUJLtpk0KkrClLUY3cy+2Zt5/jFIQUWWFJcO4iiqcPUxUutqW2PLnD7c5tBplNs5D16GX5gZCDXDPeFbnlDXN/xHxqaz6+7jen+VapbLcdQ3YjMLyXgZugXKblaKBi+OG3URhS+Dmx8WDF8EyxPDX49pt4/l/B6eKcOYWqvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkSSk9kx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkSSk9kx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eec22fab7so1513610f8f.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538498; x=1782143298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GlvO2NvI7uJOjmN8ub/e+ys3p07eKm6QxwA5qBV3O6I=;
        b=dkSSk9kxddAC94HcDJZX56QPB/0GDtEkqU+BWBivECIuJxe1xLnDBTx+GdRcvJnCT5
         SLaC4+6Qej10BS9zzGie48MWvCKaRf1h0w+1a0AGQMtT4dLpwAmudfakKGrRX5ZNpqj6
         8x604rDmcjAYPs8mw93RPahaBJKwhDy+QqiKZAQQ0KT3sEZMvL/AyQi0gJR2xnWl8jDL
         98/RFRmcY64roC95zj0W6CTadpEVPNmVlKWmBVPA7Ovc3cOAksUbaM/aV+Ct9r1HnSgz
         Pv/7htGKtmnKDrfnyJXDl5eZX5PUBYQR7l1/gB9MAi33PNIu3DK7kCxUEgh9ECQTS0JY
         2UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538498; x=1782143298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlvO2NvI7uJOjmN8ub/e+ys3p07eKm6QxwA5qBV3O6I=;
        b=TCggzJoQShjzpsWE24GScarf4BY8wiZto1ZVqjc3QwICTI055AR63SNy/6d6RffAyg
         sDE1rnQPpCCvQqUt8LDZ4LcumptCiVV8BMH9C/7/UVnX7Ex9HWhj/KZ8X3IPgJhr/6l2
         uxWiod9x2abiHtZMoBUBTbJfyq2dptTF9g2pF+cCkfsgUNT/nGzOBzIf3cMEDcBt3Y3w
         ZHuAAzHi5m4tSFb8t3nXxKJAl1cy+QV0UYRdZcuqdMSOZFUdoH/xcD1KLkapOLkNPvB6
         HoZzF/GjUxAv0Dkmq0srzwsw78BiuYiZd+xoHg4GOpgRIS2/cjgF+o9u0k+EozsFXNi8
         SI3w==
X-Forwarded-Encrypted: i=1; AFNElJ+h4N+8t8njOgNSKEcc56IpRHJOJM5V5WfConpo54FNVet44X9jZ0BqkoU7xtOptPBtBF7E0kHVqmuH@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfG68ExQqEJwcIxtHNZFPdbrMXeyXbgJk3sPgRGiJxuSARjWC
	Qn/Z98Vf+Y8+ZoaWx8lTat1wqWXhXvBnnix6L0XcCgCZO3c1NuB3tEiR
X-Gm-Gg: Acq92OF/XUELMi+1nXe348ZKuMaU39SBBteJeAzvaQAXHRnS1GY8nHXkR1XCm775BWv
	3CS2tAjD+mKuWr5JN5ggUUMJ7yS3I0a1LsRsuJgU+G6CKnI+8hLoEu1ZpDODIZkBlQ/POrdGTYP
	G2leN5nzHAcXI9DO8nM7iVEDdWVDCnLOSp4W2azULJXQS85TJ1/30C+d2/Bmwo1IpZqPAL0y2sn
	DwgwQqapxdWs+HwBsRKpiB5NKcREwlzJEOFIiQv8y4ZJjRJ7cE9TeFT9e0nxR2+u3VnzEkr1nkS
	bun+y/taF/yQFzXXZVib0L11VqnqpXtjoz/Q/5RSWJKa4j6yAu8LIrVeCFv63j8pBXtbjzbFTJz
	D9DkYnQ7/uiUD50nS54BKtwv5jYBThlHQmUW1buFmrAVf1vDrMq7++WnLGjHtk8VGFIkrspNrVr
	dTpSKx+aDb3pZeT4pa4sX9z8L1sGCvSHGgIh58eppbx4dmIvnOuCBTxsNZrzpOPJJ0DRQOUb69w
	KJzRSvNNNwpNC4KAAu7PCXTDXJp/9n5toTI
X-Received: by 2002:a05:6000:4284:b0:460:e00:121c with SMTP id ffacd0b85a97d-4606dbc6792mr20607488f8f.28.1781538497778;
        Mon, 15 Jun 2026 08:48:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 16:47:53 +0100
Message-ID: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the RTC IP found on the Renesas RZ/T2H and
RZ/N2H SoCs.

The RTC block is closely related to the RZ/N1 implementation and can
reuse the existing driver infrastructure when operating in SCMP mode,
which is required on these SoCs due to their 195.3 kHz RTC input clock.

While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU and
RTCA0TCR registers present on RZ/N1, those registers are not accessed by
the driver in SCMP mode, allowing support to be added with minimal
changes.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

The series consists of:
dt-bindings updates to describe the RZ/T2H and RZ/N2H RTC variants,
driver updates to recognize the new compatible string and enable
support for these SoCs.

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Add system suspend/resume support and wakeup capability
  rtc: rzn1: Sort headers alphabetically
  rtc: rzn1: fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Dynamically calculate synchronization delay based on clock
    rate
  rtc: rzn1: Use temporary variable for struct device
  rtc: rzn1: Consistently use dev_err_probe()
  rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
  rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
 drivers/rtc/Kconfig                           |   5 +-
 drivers/rtc/rtc-rzn1.c                        | 182 ++++++++++++++----
 3 files changed, 173 insertions(+), 49 deletions(-)

-- 
2.54.0

