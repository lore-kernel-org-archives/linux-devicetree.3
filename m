Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788F38C2BF
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207200; cv=none; b=GVZrr04iBwbHdAactgHarRkDIZld9J1vmOU14/6jpK9jl8ncnfVn+iJDZ4F5naEyk2Zvs8Zo6mCyW4mwWNuY51zDZSq/w9p3NKCHMkkgvb3SOhy4x2vSgjKpDMOLYR6V+1kyeCoWVF0g7C8lXsY0DdTcPyYGNtTihwA1aEKhxxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207200; c=relaxed/simple;
	bh=c4Zi6ltrQ+IBdJXq15zuCVA7w7MPudA2PTXVoYz4SWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MaOQBqwXa8wTfXlBl/5HGd+A73uasKSfehj8LO5LpV068jYQh8gF+jHytgwW9hJTolZMvK871eAlNlrsBaUvahO9cHEgXh9GZ8Fu13Rv/sYJJL6B4PkRaCSkt6perZ+DTdbNJQxLJZCo7YyIGwsfJC0+4wrEHgBuzym2yIAslnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=bBn62jGJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="bBn62jGJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47db714766aso423726f8f.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207196; x=1787811996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/WL/Evlk6Q4jCM2DetE7l0dros1woCfma76X++TRb4=;
        b=bBn62jGJPemg3tDvF1WF9v+g6D4+RwMa7Cg1ocqJN8A0TBUrelPQhm0QpQsJYAlp0n
         aQdLx4nY1+F3NurusBEr4zN/wsjPrK3aikFhRUE2AX+5kDYMG8seNCyLL4ZnNKbMUvxZ
         skLofLu3EPnwA8S5nXT01Sm8byqiP6IFld+bX8RUe4x+e8XQAp8RyKVGVjZkkkOCdGnS
         bSZ/seunOFTFmwh1k2p1KEhd6u1vKbbfbqbu9nWJwDjYy2GBh73wptRelIDc7VvWkOAq
         Tvv1m99/H3x9YopigMz6eeoXrUn1vIYxOOoohpNSkhOaBC1OPKhn3AMg1Mxq5DsHZ3Ck
         +SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207196; x=1787811996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/WL/Evlk6Q4jCM2DetE7l0dros1woCfma76X++TRb4=;
        b=r5WAR/dzeYXDeq7vwamTFVUApu66iRiDOqMV0MHTLwXIFkQOtfPFJhnsAcWVSgno8D
         aM+8bAPUNdTWZ/hyZd2DeRnB/Re7JdsVeqEVKJU2I+xIVEXpRmenL1TK/609fD215AL0
         n85/Gw49JUUklHllN15laiCItzD2iHReuQnIvXA3eu0ZHnJpvBdJ6cLQVeVDV6TyZZyD
         lskHmOUyo6o1sfANU0aJsGICEeW0bcvkOfddqYQriDJljw4+d8bHHtR7GQHtrpDFmpTN
         vaiMNRb9nH31NF8kuijTFO1nlkTJW8AQ8JzYM+GvP2KoRTusoT6sZNTWiyfVqs+CqQSj
         fdKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb8HTOuqcwyxdpxQpNluwFFRPZ9iM+5WL12IPb/fEzpRhD2NOWpMzWwRwy0xozTS4UgvWinBtWyEcx@vger.kernel.org
X-Gm-Message-State: AFuF++kkYeEK8e4KNRJrX0P432qT7KiHbua7fE5zorlH5/tnRw0tXDLb
	7AIWYouEWNsebZutbe6Ts0Y9C9DKxE0B37flPIV3dHaH52ck/k/gG8gsSrnLXmeNP1s=
X-Gm-Gg: AR+sD12TKsozLa9cfpxQQaQPFM0Xq08jOKE/GJfr1x/KmBoxTbmaN2qBwPHpgPgGNb1
	7+l1ubuud54k6CWUoxkBVBhMukiLubBBI9mxKQVwY9yffli4sz1dN8tNpZb/1H8rh9Anj2NBdCW
	qRL4Jtr2qlI+RYwLkc2SGvnMn8fjTB54emc2e6I1HI/t+pOtoQtZx+boFWvGJO4wXSXnafDEY34
	Dqd6cNDQ4CGhUXiCrO+blt/IkLBAsPeNwBOz5PgXW0iOw78VcJasBybm7T+px75W/9VXYpn7iEK
	2KlqcCZzq+HOB093MXPI+NqLUPAku0SYYICpuDvQ+f9Aih7z7uPV74gjEWQMRdNd5JnQHrYEalR
	atStMsM2IHNGmymHM5/XHmE/QDgutLC4xsFuHDoKcmRxCVl2a0maIdHJ63lPNb1IrYavcJA8UOm
	ah4qqiKcyS5SIWH2BEYpSWzRDI4wOv3TfxRoxMHl/yabhsly/xNkyHhJuVFEd0xIgsPEm2zP2F3
	1I=
X-Received: by 2002:a5d:6f01:0:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-482b74dc7a7mr6325494f8f.0.1787207196081;
        Wed, 19 Aug 2026 23:26:36 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:35 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
Date: Thu, 20 Aug 2026 09:26:22 +0300
Message-Id: <20260820062626.39218-1-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the ESS Technology ES9039Q2M, a 32-bit
two-channel audio DAC with an asynchronous sample rate converter,
controlled over I2C.

The part has two control personalities selected by its MODE pin: hardware
mode, strapped by HW0/HW1/HW2 with no bus at all, and software mode over
I2C or SPI. This driver implements software mode over I2C, which MODE = GND
selects.

Three properties of the part shape the driver:

 - The ASRC in front of the DAC means MCLK need not be synchronous with
   BCLK or LRCK. A board can feed it a fixed oscillator and never touch the
   clock again. In that asynchronous mode the part requires MCLK >= 130 x
   Fs, so the driver installs a startup constraint deriving the maximum
   rate from the MCLK it was given rather than advertising rates the
   hardware cannot honour.

 - Selecting an input format is two registers, not one. Register 57
   INPUT_SEL chooses which port to listen to; register 1 SYS MODE CONFIG
   enables the corresponding decoder, and at reset only ENABLE_TDM_DECODE
   is set. Selecting DoP without also enabling ENABLE_DOP_DECODE leaves the
   part hunting for a marker with the marker decoder switched off; it finds
   no valid DoP and mutes. The driver sets both.

 - Several registers have non-zero reserved defaults - register 88 reads
   0xb8 at reset - so every write is read-modify-write.

Everything the driver exposes has been verified against the silicon on
hardware rather than against the driver's own read-back: each control is
written through ALSA and the chip's register is then read over raw I2C.
That covers the eight filter shapes, the modulator bandwidth, the IIR
bandwidth, the four signed 16-bit THD compensation coefficients at both
extremes of their range, and the automute enable, time, level and off-level
fields including the neighbouring MUTE_RAMP_TO_GND bit that shares a
register with the 11-bit time field.

Two limitations are deliberate and worth stating up front, because both
look like omissions:

 - The programmable FIR coefficient controls are write-only. The part has a
   PROG_COEFF_OUT register described as "Programmable FIR coefficient
   readback", but it is not a RAM read port: it returns the last
   coefficient written, whatever address is selected in PROG_COEFF_ADDR.
   Measured by writing two different coefficients to addresses 0 and 1 and
   reading them back with five different sequences - plain, with a settle
   delay, with PROG_COEFF_EN set, with the address written twice, and with
   a write-enable pulse after the address. All ten reads returned the value
   written to address 1. A get() built on that register would return
   something with the shape of data and none of its meaning, so there is
   none.

 - Coefficient uploads pulse PROG_COEFF_WE per coefficient, as the
   datasheet's sequence specifies. Holding it high across the whole upload
   also works on this silicon, but that is not what the documentation says.

DSD, DoP and S/PDIF input are all implemented. DoP is detected by the part
rather than announced by the host: AUTO_INPUT_SEL is enabled and both the
TDM and DoP decoders run, so a player can simply send DoP-encoded PCM, which
is the only way DoP works in practice. An earlier revision of this driver
required userspace to select DoP through a kcontrol first; no player can do
that, and the result was that DoP-encoded material rendered as the near-
silent hiss the DoP marker design deliberately degrades to. The datasheet
attaches a "data must be provided on the DATA2 pin" condition to automatic
detection; that applies to identifying DSD, whose channels arrive on separate
data lines, and DoP detects correctly on a two-channel I2S link without it.

DoP was verified end to end by generating a DSD64 test tone, carrying it as
32-bit PCM at 176400 Hz with nothing selected by hand, and confirming the
part's own DOP_VALID flag and INPUT_SELECT_OVERRIDE readback while it played.

ESS Technology has no bindings in the tree today, so the series also
introduces the vendor prefix.

Karl Asseily (4):
  dt-bindings: vendor-prefixes: add ESS Technology
  ASoC: dt-bindings: add ESS Technology ES9039Q2M
  ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
  MAINTAINERS: add entry for the ES9039Q2M codec driver

 .../bindings/sound/ess,es9039q2m.yaml         |   61 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9039q2m.c                  | 1259 +++++++++++++++++
 6 files changed, 1345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml
 create mode 100644 sound/soc/codecs/es9039q2m.c

-- 
2.34.1

