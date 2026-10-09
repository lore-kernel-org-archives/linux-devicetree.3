Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B046983B
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529660; cv=none; b=UtLFaMiVZPIOxtcGUi4IV21THg+EhMNgZNpQw1sOPc9V2G+SyRFSETmxd0WI84Je0qmXKtnR/OkGTtlz/tr6mTt0fDFhWfbpQQlep+IDw5V3TOjwTlOiSWoFqcnk4ipwMnMZgc/2Jf79COq4S+/PJmoZZLyyovun0exSM5eHiqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529660; c=relaxed/simple;
	bh=rzRC9qMt8Wu9IVnepc7Mt/HIZ9DPyWfBZb+4RZC7lNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OhLWRNJD7SsLyKQKhJxbU9YL2cP0wb1Vr9NBAo9UxUy428ABN5TLNeDf2nZqShY4hP8OqXBvZiQ8sPutsqMoj+Ji9MoqO1IY+vX9dvoauGOlGQfIlFT6RhuOMNhZUIrkTiG6+q6agk2pAwWHETvaY1tuS91kNHUAjTpA7SboGhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rutxWqza; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rutxWqza"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso29327435e9.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529658; x=1792134458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwnmDHh3/boOKCuN1k/oK+tDoPsn5xW+z4VKugONJe0=;
        b=rutxWqza7Jh+XtqfgmENzZTAi0DG0TfQdNoDNJCOHXbVCG69fJo+DvVtzfL9a9J11A
         iuTgpDVC8kJnHLZI8A/87j69my3evr4BtkFpPB5lyu6h1Pof8xLSUFwhHK4qo1OI0jn2
         pchxl1LahI9VzDoVqibe+focdhaLhYdZG9D+CXdMkloGGYAk2U9IxjHyFT3ErdOG/OWQ
         NsMRR7zt/86KaHy1D4rxmhcZ8TNkbcZ97MNWvkbUXZBohVlRRK+mZap47pf33WpaCrrX
         knBouu6qJDgnUy0+8TYe1R0wmz0XNWBe6O5PC2r3IWST4n6idu431a4piToQ4otBNNFW
         +XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529658; x=1792134458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwnmDHh3/boOKCuN1k/oK+tDoPsn5xW+z4VKugONJe0=;
        b=OMDDg5aPvL/eYCuqeGFBGFR6p/s1Vld0Eri4ECC+3ikZmVsFN2G4httHWK3iKQ7FuF
         kSmNluVXzkcXVrZf+BlIPGttKtWq6wELKJpVYEJM7t/DImL636cxiHv02Q02qBscpcFB
         2n/aSCELFR4JmRdcvAl5rp/KlMBt1xBiIwe2QpWo2Qtucd7RkVLyxy3asSmr+eGJe7Gz
         Koe7l4voZPBIxWJ6eeqMK0xUvrmIkusOCiI19NgAVGg3OQMEw4Cb/aU13VZ65i1vD0a9
         y4cziwLomrx9bebwi7Jtk8JM5V/X0Ba0+NjuiPibQBf3a+kHEbtZWynGm33jt+JqTALF
         TNag==
X-Forwarded-Encrypted: i=1; AKwUvBzVoziloZ1f/PgsPd0T7WbUU/dqOp4lb+9XlGK8HvewpIbSfeJXSAg6st8+u6RRQdVkRV0O6qXaHSQ1@vger.kernel.org
X-Gm-Message-State: AFuF++lzBVV7QsmCtYxsntTZXl4Lrjw2q2XQYFCScRV+ks5q78kdzBiW
	eabGTkW+ciocpoERYXGPP84T46DBktW7AihV1kh+lvlRqJNQOwWnbSYg
X-Gm-Gg: AYBFou0ZonloTmgw+EA1DDxTx/XQypJXVVmdQRzKNSQ8aaDRThYfY6cfpGj3HV8mZrZ
	5jTL6AjiXZlWGGQ9CivStPusvgFsD0aES1MX1UzeJcHZ66zrueGTWP+KqiXXoeUgTDat6gFVKhJ
	hdbjzvXK3QkrG+ePMvdZGtCALsJVtrbPMcBU5B8jplXf/+xzP+mY9lXQTIhAtRv7YlybHCPlFAz
	U5SnVoh7DrEAiD1ycMsYRQYmVH7+BvXQxVV+AlOrIxqXCyzmASbcjuH+95hwTjGhViND5e1dRIK
	3in1LufaxjFOkrOTeZNMIRjqBQGbLhJ6IM+xj7Ip0yeVw9ExyXXcmHxmdY/URZjNjR+mgn/x1m/
	N0R7yC1iCFpg5f4LuL/JGLgF2Xd1grlhYbL1FypYdDACm+BCnUuPcFDySVFQ1d8r93WeMtn/JcA
	aFTAZSSzRirD2mZM9peL2kOpuN0pcxPKq+w3J+xyLpczWbO528H/7ITph/j2Qg7CfeLOuvkjJgA
	lxqFXQJCZ7Axpx4pzN795BWw2RkrEVg9vU43d0kHtR1D6iHQ6f8M8JmaP5zf0vrd5XX1or5mSa6
	8hV6ftQxLdkPuU2IRM+QqUAY
X-Received: by 2002:a05:600d:82c7:b0:4a0:1a18:b742 with SMTP id 5b1f17b1804b1-4a18e4463f8mr16457595e9.2.1791529657487;
        Fri, 09 Oct 2026 00:07:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-233-52-5.retail.telecomitalia.it. [95.233.52.5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm26176815e9.3.2026.10.09.00.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:07:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 0/3] clk: add support for Airoha AN7583 clock
Date: Fri,  9 Oct 2026 09:07:20 +0200
Message-ID: <20261009070725.13196-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 255 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 344 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

