Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351D322B8B
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954381; cv=none; b=jkOpDQbMWlOhPA04AjsHp0guCBveFjpqzjpAhtxmkz5xLpvrjA+1UHkA8WzsDJLleBwBhHm8MpnvmcNKPvi5LW9Zh/B6QfbxYNsAbI7qoBZrNmaCbvreW+k6ozBxC9LCAB0RC+TsMGSZY0n+eVXnDiDdxlGkHBamJeXKCzRl4Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954381; c=relaxed/simple;
	bh=wGHS/8ybc7EUGv5Q5/UTplRynVKohqZBmV4QNAVOMyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cce+BqQYXWvvR8tIZztxn24OMfPm1X80ehS+JJODhiDVzpRuiY2TOOXv3FLiwnhGX6lh0+RfLwqZLURXGh4DbXNyoF0MetpCv+wR1TQ8chV6NzOjBHOqiSI3u8cy3lkDg/0x6OlYFnbnMXoiUP+s317FFYI1KLsZS1sI7etmGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZrQeRsi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZrQeRsi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d146705b4so131984915e9.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954378; x=1780559178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlAhB5peqR2hJifZRkRvRE+msKrpP2rntacMYL+q5qA=;
        b=DZrQeRsiZeu9QcG58tIEEqO7wHLetX5rLUsHq3MtM6XD8CvYg1CTBZ809m9uupoDdV
         rrqtSocv2ZXTihxWbAYeqi98HXByCVAOuab6xStno1PB1sDN6HVH5nyPGctznYQoXHrE
         hTAB4cJUKNQzz1GEWBiH1PlmG8b8/6IWu9YiAoNWRhRlP1bBWPQiW4ZNF1eUU+FOICZV
         y0X6JjTK3tVuFE/RfcgCpsygDU87vVUIxpN/WYljTtICdlnah0DCI/07JJA3Ndh9cdeA
         /Zko0w0HqBmCXrhrEHaeRUVXn/HH6ZmYJz9Xs+TLJ57F+OSD87gC73tizthJWc/ysaWU
         Qzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954378; x=1780559178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlAhB5peqR2hJifZRkRvRE+msKrpP2rntacMYL+q5qA=;
        b=hatEV1UgvqyocrCu8nIYZzzvgCS4aYlCRLZavcF5p7ThOId2PsIfmDWDrfYT6P+USp
         Aje9BAVr/huYztDnsAnOsFW3EQPKieEe73TAWbbxmHdRUXYKm4bC7vZlbd4f6v3+Qqir
         8SEaqnDjtnPgG0BDSPJ8Wg3mW7gIB0DsbKohHgElpCs3uyBHVzgizPp/0ZEtZIgwEKKG
         Q2ggB9BUez5+XocwDJot6sDdKOt9PqjGFMisNrqh3SpDjs3m40gVZGTGkP+F8EfVeaWq
         cBWlnbW6vyv6AUtUodr81567rb05JEnFJviKijr9TCfhkVvFhy4KWHJ9+NLXIR/k21nF
         V4Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9zpFpiDrJm5hJy6vYVqLZNYE01H9rcDVDmahyJL80H1czAn/HjtdopbConuP4jLAuEzW3wKGyBTny2@vger.kernel.org
X-Gm-Message-State: AOJu0YyUu+K77TzhTpzMsO9rPWHSdLYvd00UkFI/c8BvDHxg0YbJ0gGz
	00GMgbgoJduqm/VEn/twO2i7JlpGUiXriMLpvnBmklZgv8Hu+TLe4xnr
X-Gm-Gg: Acq92OHCcAeYkNt/JgFjHHZwlIDPq/WOfYDgl/ZsOLtXyAytZlAP1cqseOFfw/yjMl4
	0mDaBkAoMKEPH+RnpU0RoLtTdW2zKSm2HSONZ/W7rru61rV9Bf+k4ud6jBIK/YYZQYFhcXdqfdz
	Zk8dJw01SKJ6mG/RyOmhSk81VDU9WQ7r4lLnR0Fa7Sz38WubKXpbkYWYI8bDTT5kLFlNa02Udlf
	HlMMsQc+syq0Fg8hl23dC/ZfwVaupefCXcLFy2Rfe6nOEc0Sz57pFi7XBv+wBImdJbE9Q2xfzhN
	WtJwGxtq37/Dok0jZxGnOK5LYsLVJrcS6DryqaRTk8Z2Kb6U8/+wbyuqNsOXhPB9tpbszcaZI75
	IqTYNCN0/H3oQGtlG0j1gAnxrdUrxrp4gnIVnyVB0MaIauW4D0hEH4xYwAYXf9ENXe2rQkuoN/L
	R1/ghnmBLMUQaQFKonsQWEXzW0eR3157owk9u9xPHlp6zgB3Vt4lzToBAuSRQ=
X-Received: by 2002:a05:600c:83c6:b0:490:5872:e641 with SMTP id 5b1f17b1804b1-4905872e758mr343078605e9.18.1779954378306;
        Thu, 28 May 2026 00:46:18 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0a3c2dsm10865885e9.31.2026.05.28.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:46:17 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Add audio support for RZ/G3L SMARC EVK
Date: Thu, 28 May 2026 08:45:43 +0100
Message-ID: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add audio support for the RZ/G3L SMARC EVK
platform using the SSIF-2 interface. PDM/SPDIF support is planned for a
later date.

SSI0 signals are connected to the DA7212 audio codec on the RZ/G3L SMARC
EVK. These signals are muxed with SD2 signals and are enabled through
the SYS.4 switch on the RZ/G3L SMARC SoM board. The audio clocks and MCK
are provided by the 5P35023B Versa Clock generator.

This patch series depend up on [1]
[1] https://lore.kernel.org/all/20260528070239.33352-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Dropped patch #1, #2, and #3 as they are accepted for renesas-devel for
   v7.2.
 * Updated commit description with clocks arranged in clock output index
   order.
 * Dropped assigning clock rates of the unused outputs (ref and diff2).
 * Added guard for snd_rzg3l with the SW_I3C_EN macro.
 * Sorted ssi0_pins.

Biju Das (2):
  arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 72 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 40 +++++++++++
 2 files changed, 112 insertions(+)

-- 
2.43.0

