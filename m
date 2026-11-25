Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638107;
	b=RzBrtkTh1613ecU00wafs/KwD/Uul+NW7Ljo8L4mYrYQasD9Hjd0N89MeAciFsLEyl9n
	 +KE3s7nJlQ8lVQHQ5oRJXYbg6xJpYjY66SUOPlfwKxM5PoGmSysajFjoUCBy53MbPKd6Y
	 0H3nwFwiiM1P1XizIqs9vfGbGyCdbzOy0LTjwQCwW3fF6YG1D2guirs6In1nR61EFbTbI
	 X0tm8OA2lMOxRAGZSBDyicsG34Fki1D6AOGOKdLxIR+JzZJ82c8t0uFnSm4iEIIifJ2RU
	 hJo292wyPggDl1Sb5IwVQP2mB6qL+fDOcPnUsPIO+Gl1xqtX3B0+l4ExkSbKdDvUVMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
	b=z59YvuiLusCpOFBa3TAr4KNqML8ise77jKgevaQ4SYySh1uEyQwKBO7D6srlQL7ahfJq
	 R+b7VkQnd/9E2BVMtzVDM/J6Pgs9Rl7GEK3l6Kq0LzreZ0AwWXbGmQAoefXEJvn+hN/WY
	 m0ViPhi+ha3/7XSsDGldB3bjp9qVEViXDhkDKS5g59tEaE9pbX0lCAU+DtlmPRU8aaH7m
	 L3eP/xEyof5k6p3RAmc2XAs5yajN8w/uCfes7BxVgoAtfN7Av9/hF8tiYideGusaWZsyx
	 Hur+JXfH+9UjPqF0CL37BKGT+BRRg2O2HHB6wm3cYXaaKT95KV26sdEilEWkj2IVe8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yvL1qbup;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD05606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD05606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yvL1qbup
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b190cdc9feso3782843b6e.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638106; x=1796242906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
        b=yvL1qbup9iqNKVVTLxLarpET/deJHiZWhfe/gHkYx5+N0idKilfWyv3K/XqdT+n2lZ
         lgf5muna3z/KdRp5A3+UrrU2U4QC0wrFU1txXmSQrcRU6MUd/8AxqFTA/VZNhycOu7aJ
         PTGdx1VdDxANBe8cmsOUEGCOjLvcD5V9nbJ3w0nNSE795XK7JHb7kz7J80xdbDadDxXM
         4D0RuiVWYPziTvo3JTv5rFl14ciQGGXpHJhr+Kr/smdO6DhvySOY/b1fCqQ4kI5LYLVa
         Hh/3m1kD3LcNoZIsQEtUSgj6KLUUshK68BWFUBTTsWdG8HRZacDo5K4XJoACvLIbxRiJ
         9muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638106; x=1796242906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
        b=YNmeVsfomEkSmsxerLowCo3fYD68Q61mz6sik1eXRsGkZsewz7mdwyduEpXHoEp2lV
         BHxQ10c1KIDW07R6scQ5XNhdgpglRpHvA9f0uJfUswJ2FEH9w7wUDnrFgDWejNjW7bBF
         2aLqGlwxHcr3frB+8DW6K0FbtaaHycv17/dgEbzCoaYQgKLpuX+/jrmsceNKorULkF70
         X28YuzV8/VACJYk/OeEyMBVa41zj43jvEAqCQETHfvcDK8+tORI/J2LeGQ6pby6cOYXM
         QfA+gUZ/HD87bAIng6zSJfVM3XBdu5aiTDpzg7hwj3r6ClCoVXA8cFn33JhFibh56TmS
         51Bw==
X-Forwarded-Encrypted: i=1; AL+hErGxAmQU9Ff5b1SjOTwiAWcOWUpHJNNnRQM6umChZQPpCN1BjlV9DSWlHz6P05Gmc6Wo4b350K0cBkel@vger.kernel.org
X-Gm-Message-State: APuU4Z8/XUZDqfALjKIee8Kx2F2Ak+fcKZKlMJYVqTDCFZeBj70rzaWM
	LD0IYQwVxuDU97k6kSjhv+oZl4iedcWgpzs6C72VLJLPPzqaBl4TJgNNY3kIPp9P7x8=
X-Gm-Gg: AZFdTZcjYCn9oW6A8TdjZJ+rCFl9lSDQPlrEWk4HoZvdvFGXsGcax2LuftptqiceuRc
	OXVXgbm18GGYQigTXUh5xVpDf6J4od2Q7m0tS+K7eVP/FS9HtpYYuOiLrTWLaF54ZptDYKEohif
	qMLI1rzFlvQiFMJ0/dcYsMl8NLkNTzlkCicuyLr7SIU4FMPlQeFeccl05Bqcp27Qg6UQoIK7gHL
	1j2LVNmC3eDRfOivfGWRkFfkGA5cu2+pWkRPj/l3LhR1q9mv8uYMkup6iPvSswil++6Af4Jd3Bz
	1grZhyAlbBuJgKocMmUjqczXIeO00qZ0MVhZz+PRkSQapUCmKdKSXmF8PuNa+PGGXupWrFMzz3H
	++UoXhTUjgk//pomv4plEDmctIxN4VJO50jP2Ui54+Ly5kvcsWPOj0l57P19R7KmDz/9cbj6YJU
	pxca4NFWOfqM4DU5rE8YwTAPoM+k98vb/UQmWs1nEq4uIqyS/zYIfLWpfYlhXc2COQeUtG8Kdvf
	je4+xvcbd75VBUZgJENAm3WOpvSe4nCsOCBeJutbUylP08xVwBhRBjdtLlRyJ4HNkeXp5TCxidM
	iRZ+D6VjeFVESCPPgJZI7CGZ9uzwi+OHZ88C
X-Received: by 2002:a05:6808:1310:b0:573:d802:fb0 with SMTP id 5614622812f47-57a09504ab8mr19901858b6e.13.1795638105859;
        Wed, 25 Nov 2026 12:21:45 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:45 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] clk: tc9564: introduce a clock and reset driver
Date: Wed, 25 Nov 2026 14:21:38 -0600
Message-ID: <20261125202141.1288493-1-elder@riscstar.com>
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

This series introduces a devicetree binding and single driver to support
the clock and reset components present within the Toshiba TC9564 chip.

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC, including the clock and
reset controllers supported by this series.

The first version of this series included a system controller, which
has since been removed.  This version addresses all review feedback
received on version 2.

					-Alex

Version 2 is available here:
  https://lore.kernel.org/all/20261120183212.1264522-1-elder@riscstar.com/

Between version 2 and version 3:
  - Added Lorenzo's Reviewed-by on the devicetree binding patch
  - The devicetree binding now uses @kernel.org e-mail addresses
    for Daniel and me
  - Cleaned up the patch header text in patch 2
  - The Kconfig option now depends on RESET_CONTROLLER
  - The Kconfig option can now be enabled if COMPILE_TEST is enabled
  - The generic gate clock controller code is now used rather than
    implementing a custom one
  - Only the gate clock IDs are now published in "toshiba,tc9564.h";
    the PLL and internal fixed clocks are implemented and accessed
    only within "clk-tc9564.c"
  - The PLL is initialialized, followed by all fixed rate clocks,
    followed by the gate clocks, to ensure each clock's parent is
    initialized before the clock is
  - Updating the reset registers (read/modify/write) is now protected
    by a spinlock
  - There are no more "unnecessary newlines" in the initialization
    arrays for clocks and resets
  - An update to the DTS file is now included as the last patch in
    this series

The version prior to v2 of this code was included in this series:
  https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/

Between that series (v1) and this one (v2):
  - There is no more syscon, so its devicetree binding and driver have
    been dropped
  - The clock and reset components now have a single devicetree binding
  - We no longer use a syscon-generated regmap for accessing the common
    range of memory used by multiple drivers; specific sub-ranges are
    instead mapped
  - The clock and reset drivers have been combined into a single driver
    located under drivers/clk
  - The config option for the driver includes COMPILE_TEST, as requested
    (last month) by Jerome Brunet
  - The help text for the config option is simplified, first suggested
    by Philipp Zabel
  - The driver now names clocks using dev_name() rather than trying to
    hand-code a unique name into a fixed-size name array (also suggested
    by Jerome)
  - Certain functions now always return 0, which simplifies callers
    so they can simply return what the called function returns
  - As suggested by sashiko, a counted-by field in a flex array is now
    assigned explicitly

Alex Elder (3):
  dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 clock/reset driver
  arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  15 +
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 456 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  40 ++
 7 files changed, 603 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

