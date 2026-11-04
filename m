Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753018;
	b=fWTeGVgFLSWirNI2diThW9D8wr4S4m478daIXBZx4u/dl27KmUHFXlmV7QesIY9O6wdt
	 /BGqcXib9izEmLkcW2lnUTBf1CXlvBAOTqxb8e+AKFJSQ+yyNcJKbr7CEqfDQSJDqYH1v
	 0GaC8JVQFgB2TQ4+lOyf8gStfshzJ7ipJiRR+DJb4a4G+MgaH8RbR2qTpE6V12DkoHIpy
	 j1bSG7dfKaS7mC1uwjLHeH8VGNaHA4ObXL+s2USGInA+QEWz7NOmqRem+dad1yBD1hpeW
	 r2XfaFedx5BNzCdthGgmv5Iuen3RJZ1bI+nDEJNEnDYmULrczXXJpbRakNZCZPijlSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tHFmvMsmtBZ2Nyxofs/T2sfmpchIzAj9501V/rD7FGE=;
	b=Z3ASgufS559dyjO5GmDT5W21oI0dWP1iMpIidaFtUcrSKZVYtqd7gJfiPSjOcbBTT0Za
	 Xns5/CSdRbyPsLjBQVO0415YxNHJLa4m78Bg/eY2MkoGspIjZu1oHY6Kirf+iMODcHLo4
	 KOv0AkWWomdvtOLy5kQmJk9PXHtHeu89dvAcqAbVk8uETljKCxqMQOh32b3DBLrU1g+By
	 12mvd1g9Fd0lMASSf1/uYUSXe5qeS32J/2NfICEfbDhC1IE9+btq4y1KlOxeNmUbthTer
	 EzqQjU+HhxXJPWiZp4HcnCXUixPQnVx6+ZYreF85nPtm/XzDoA0AbTvs0yy2m+C14UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MC3EKk2D;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892CC606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 00:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892CC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MC3EKk2D
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49de8ea072cso83066fac.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 16:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753016; x=1794357816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHFmvMsmtBZ2Nyxofs/T2sfmpchIzAj9501V/rD7FGE=;
        b=MC3EKk2DFXOr8vXA3yOdjcQxjOu8JfFq2gSRGvZ+ssJeIfU7Umeie7mcJs3yFI0MUd
         J0ygBKYV6YkY+SYCTbrqgWjbbY/J4IMwR9EfMBlMfwe0d/Yc+5fsTCLswKXyPN8ntc4s
         hs4ruH1a48OHncj/NuAGiEyvfpNwFF+Z9APLUPUaaMu4S01yh/mDQCJuawlhwmz2vO6A
         CLIKR2h2tucnPNyKVmFnHRXyObC1LmDhBCI6rODtDzT+B1q5D0llbjhFVK1cr3hiB42u
         1SYiVYcMfR+QqBe1M7G9vvLrPgbQD3HnHM5NuL/smT0tAgVMi+FV/j4UnpXSmxwC+Z07
         T0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753016; x=1794357816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHFmvMsmtBZ2Nyxofs/T2sfmpchIzAj9501V/rD7FGE=;
        b=DnIC73qGU2yTUCJkm/ipyXRzu4vSEOjOAuOcl80hntvRLxxXAHR5xJyvAIET9wtmDJ
         hMCTqQavKcdd6nyLRZHUt2bOXrdjQUlYOs761bn253EzuhChJLKgohTH2V4YYje2ooC1
         R5MOXTwCAA2qjeDEA5ny97InaunA3UMNGjj55d5bu9dOV0S58TFCYWeI1x/MectU+MEd
         5Io1Au6PdJ/lndhiSuBjqsS1PQO9ERNU7kqIhlireTJ3UCUW9Pd05L4Gzy8Xs3BGV+oj
         QBaRFvL7qh+Axo9ocbj2gXb1zcpsho7qWHE5/KaEVoRxI3cvKrF2fHNW698m3m6TIj2l
         E7xg==
X-Forwarded-Encrypted: i=1; AKwUvBwDnLyFlKNRATApyurDZ4f/2wnsGCwxxY7ZrJD4bt5+RLFQSNk4omsEZUEx+SqoWI7j2y4iXsYv/Vlx@vger.kernel.org
X-Gm-Message-State: APuU4Z80XfqHZ2eH3cmQ8Npd1pX4svSI/VA2DbWrWBLmXkqKOjF5dnVl
	C17mm/Y48NgUwZ+1sRfcNZMgW+pVEI/YtcXFY8ao8EoV0dpFhhxSEFPr12/Eob7oKGM=
X-Gm-Gg: AYBFou3HB7uKhXeUv812Q+iLebrAYgW+lCWqTijTeVuIdms7i0yjdbEK5L8vncWGq9l
	scUZZgGBvQ6uX65EbTScHYkNN8FJSHooYOV+NdgAmVL8oQKIVwCpU2aGgEVtOwTc4RWWlyXQ9Bb
	+ftcPzYBgyJyvRdOj6avOp53IHNMTyOgQTfmDC0ObMXLcFpdIlDlJErIKR9Gifdsy3BnW93iJRv
	NBwcigt6d2nvTqoDbDIMcvnvBwLRyzTxw9UABvpqSbtjnc/WeD+a4xodw453/480r9K0CK+U9ej
	l2EOpQ9j6DH8sNwb07yp9IseQn1jqbR6czfDiwsybvueQ0guMh/LxkNXFvXSctc3R0x5lSWP8r0
	kcM7dX4Al3hrvCteM8MTTrhDRFiyV0LC4l19Q9NBmWYSHuCYk7QrnmXwvqibQSVzF005yk28/CD
	SiGk3/MqEL1mapOWVfbTLaGkwEI6kItGkmqVzO6SYlALn9YmDKKKj6wCHqf+mGoaSySL+ojYfH3
	G3rLiI4WSnRLFpEzjYyt5Dv7i5YyoVG4atrGuSDH+THwBN4nSyjvLFy2SxVe1UA3xr0amZjVt1m
	CG+2a9aHSIwnF/RAKSlPZzsaa6aRAZSlTg==
X-Received: by 2002:a05:6870:c69d:b0:49d:c3f6:4194 with SMTP id 586e51a60fabf-4a90764b95fmr9096189fac.9.1793753016228;
        Tue, 03 Nov 2026 16:43:36 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:35 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] soc: toshiba: tc9564: config system controller
Date: Tue,  3 Nov 2026 18:43:27 -0600
Message-ID: <20261104004332.2141282-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
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

This series is comprised of some code that was previously sent
separately.  It now incorporates a new system controller driver
that advertises clock and reset functionality, as well as regmap
access to its address range.  This combination is being treated
as a new series.  (Details of previous versions are below.)

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC.

The system controller driver adds the clock and reset devices
using the mfd_add_devices() interface.  The clocks and resets
are implemented by drivers included in this series.

					-Alex

The system controller, along with its devicetree binding are new.
My hope is that this new model addresses concerns that Krzysztof
Kozlowski has expressed in prior versions of the clock and reset
code ("fold into the parent").

The clock controller driver was last posted as version 3, and all
feedback from prior versions has been addressed.  This driver has
essentially been completely rewritten.  There are now three clock
types (PLL, fixed factor, and gate), and each defined clock has
a parent, and the is_enabled callback is implemented for the gate
clocks.

The last version of the clock driver is here:
  https://lore.kernel.org/lkml/20261012152408.3729237-1-elder@riscstar.com/

The reset controller driver was last posted as version 1.  All
feedback received on that version has been addressed, and it's
a bit simpler than before.

The last version of the reset driver is here:
  https://lore.kernel.org/lkml/20261012164354.3872326-1-elder@riscstar.com/

Alex Elder (4):
  dt-bindings: soc: introduce toshiba,tc9564-config-syscon.yaml
  soc: toshiba: tc9564: add a new syscon driver
  clk: toshiba: introduce a TC9564 SoC clock driver
  reset: toshiba: introduce a TC9564 SoC reset driver

 .../toshiba/toshiba,tc9564-config-syscon.yaml |  68 +++++
 MAINTAINERS                                   |  23 ++
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 288 ++++++++++++++++++
 drivers/reset/Kconfig                         |  12 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-tc9564.c                  | 135 ++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/toshiba/Kconfig                   |  12 +
 drivers/soc/toshiba/Makefile                  |   3 +
 drivers/soc/toshiba/tc9564-syscon.c           |  42 +++
 include/dt-bindings/soc/toshiba,tc9564.h      |  46 +++
 14 files changed, 645 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 drivers/reset/reset-tc9564.c
 create mode 100644 drivers/soc/toshiba/Kconfig
 create mode 100644 drivers/soc/toshiba/Makefile
 create mode 100644 drivers/soc/toshiba/tc9564-syscon.c
 create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

