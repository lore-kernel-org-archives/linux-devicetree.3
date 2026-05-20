Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5915371D00
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295755; cv=none; b=I74OwEy/eRlH29bXFy1Bcq9l3sXbKQh5Pim/u6AfioTdG2R73ItXAl29Lu4b8dk6gkE1/6WULY0j0/JXXO6eBDOezmXdJFrmmEYdYvteECozzDk+5idlP72V8iwV8TKdk8JKw2yXQyuJtsOjjAX9uEzSFUJtytXgGNefURmBgGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295755; c=relaxed/simple;
	bh=1wdbQGuw6HvmZIeFn+pMLa4ccPKyAcHlFLo3mDEmmuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exvA0Ij+FkjlMCFo6DcjvcE9WIRwrJhhYvc7HEwB1wKT5CCW1UhoffMiU4C3+4NJw8lBp0W67M6C+wOBoROLIugBbAihrDO4L+T4pXQl0b4i3WJRcDT6E5eEHmBesHY0VDb8ytpFri3kq9EZMwrg7K7qy+7cZgn04uoEcqKmE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfKLfiyX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfKLfiyX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso26552875e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295751; x=1779900551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9V3EBCqEjOEBqzqMBD7+ufR2GQPQMJRKrFaD0tdiJU=;
        b=DfKLfiyXIgG1aD37LJUqaHfLFOJZ4FGIixMlYb3lhoElmalo7j92dDiIPq6z1mCox4
         8zsZ6j1vRBaYTp0BELd6E4COLwbIilwmjuXzQdYiwkI1Y1UmP/QuIvjMESlNuLFSIOuO
         UL5LCuPIrhJJP9ybzR3WjOMikMt1SP6/RVsP7wEyDtvBO3bgBOEEDr3U26xTXuNO8WN5
         SVX4sYKWHcKoR2PzGxx9XiCGEiFqDJjkhwYSGIMufoifkU9ZDCr1zl2CaRTcpRT0PHpG
         g+1HDIfjNT6r9KaXuZCk8Vn21v/GOAGfnYG7w+OPmG3hYJMEczEJCklQnLcPzfMNLKOC
         JrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295751; x=1779900551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9V3EBCqEjOEBqzqMBD7+ufR2GQPQMJRKrFaD0tdiJU=;
        b=PS/lCALPSgQxpnEBcQdubavZnqx3FSGbWq43mw1A7AwzIJdD+GxhZfDG0Cedjg+hCP
         v8Bz1rpiw0EomluFKso0+EGIZf3IFCyIlsqgj38RN7lylyDkBiJj26AXMss1czt0D6rw
         gRzG4lAIxc72cBiDQxdZUMGCpADb4K1JoZN6i4kUW15xIe5UsYFHbK80lCAQ0jYSeuJ+
         f/eGwZZo3U2d3qy8V3eyEizQPtkk+arWAPSqLDCCs66KPvUIriHkNOF2CgMMHkNUuaZd
         JeQOVXlczlFnMaz6UwY9nBbJFJxio7s1lmL/Bo52orommYYSoG3m2iQdNMUjHNhqhGpZ
         cTbQ==
X-Forwarded-Encrypted: i=1; AFNElJ88unDblEgOPU3PwLU9aoZgyN7PGexppGz04s9SDlcRrZ+Ja0xG1gDTgShfRHfVVBKQ3yNhYRB3PcVa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3advNYMBKjdi41BpIkUw8jZb9E11bPMhuV2UcGwcxErGUIRQG
	I2QFzETlhCClBf3iV24sjOtcwSU1UWxEGBKRQjdoA1RY/rCsj/dXgVXR
X-Gm-Gg: Acq92OEuKNgO+IcPB9HTZm0gtgByLpbM1M38XFvpJWEHsO65UXqhWhSzrId/o9U3rTs
	AlSQZMBOrvlv/JAYkz69YvUdZhfocWTbESWYUiOIRJ8hhyO/3ucY8SR/HgPCaxQFBHakf6TCtYO
	iLMj9cLR3A8I4OnpQzg59q+Ma+uXiJdrtEF9DY6IFyGVdTOcfrfx/QnDLu++pgmTfufYt/ZqhU+
	1ITn02/frpmqUQsPud3oStYnwrCMhKsheIyCi0hc4MRco1yU0DVBJ9vPwlKsC4B+Zy/pZKKIZ2H
	B2IpgD5Xg2Th2TJiXftO7BUFdgTRrX7Hiw7owEN4wrTUH9huVH7m1fN9H7D6WB1nFz028tbnppa
	WsXvWKErR2fICuNbMgIMc23HwZTFjL/U/ivKcpdJkByPDREZUbfd2RdQWx8NDlmiKE+M6fCcl5G
	ewrCP1Mp6gS1mEltVOi4l5clEwqCF9MJlpP9GvgFa5DiHmcJk8Oy/6bJ0M+xTbWICtMT+pqIeUT
	EAgF5fGlb0nMyJ6UOLGZt/jSZJ9/7bgH8+eP+uz7cwoIS4=
X-Received: by 2002:a05:600d:8:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-48fe6325213mr316461235e9.22.1779295750801;
        Wed, 20 May 2026 09:49:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Wed, 20 May 2026 17:48:19 +0100
Message-ID: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
features for PCIe lane control and supports multilink operation with
two independent controllers.

v2->v3:
- Dropped using linux,pci-domain property.
- Switched property to phandle-array for renesas,sysc
  to support multiple controllers with different SYSC register sets.
- Parsed controller-id from the "renesas,sysc" property instead of
  using linux,pci-domain.
- Updated commit message for clarity in patch #1

v1->v2:
- Dropped RZ/V2N DT binding patch as it has been merged in the
  pci/dt-binding branch.
- Dropped un-necessary new line in schema.
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Added locks to protect shared lane configuration state and
  prevent concurrent access issues during probe.
- Added cleanup action to release lanes on driver removal.
- Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
- Renamed num_channels to num_pcie_controllers for clarity.
- Updated commit messages for clarity in patches 1-4.

note, the patches have been rebased on top of next-20260520.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple
    controllers
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  34 ++-
 drivers/pci/controller/pcie-rzg3s-host.c      | 232 ++++++++++++++++--
 2 files changed, 246 insertions(+), 20 deletions(-)

-- 
2.54.0

