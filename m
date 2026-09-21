Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5B379C36
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973099; cv=none; b=udwMcioG7rGtEwjlV6eL4paqOJRsGjL564TETk8YG2oxlQ/ZtKCJ69P96hwTW1XCpCl+uTGlqrHQjcbTrk3+fh1OWi0r/sgDxTPTDkUY1Hjs7bv2RkJAiz2NSki3hcR/gan3yqw+7nUSAdA/q3UosPBN/dmgJMrLq1p5Uq1zumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973099; c=relaxed/simple;
	bh=Z5Dxc4ZUwLw5FI7SOi1+ENgRdo5q+LxBgkmihu6xww0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aW5fpH1YJLEkgBR+TAMNV8KZ9gJ1kiFyBCSvSoEykRdkE+8rnGAFa3I4VDzPeW3jROpRLjQT//Mis3AsD2sAQOKNFIJgSoQoRcvzdpN5jvL+2GXDsBOWpIggoLJ7sYoR3BCNfo8mAO44wVm4WEWV/RKB4mS9qk0i7doCIauZEq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hhfkwpz9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hhfkwpz9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3D281C4CBC2;
	Mon, 21 Sep 2026 06:45:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3933F60339;
	Mon, 21 Sep 2026 06:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 854A210328203;
	Mon, 21 Sep 2026 08:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1ky/EdIk6lo6ktUN94uOMEwEvf7fiSyNZIxxU9JsyMM=;
	b=hhfkwpz9jViN/7ttym6UlD3h9ZCof9xotK88U/e98owTE64bvSfYiro3ocM3GF/frUPADe
	W3MTY7xPYZNQ+jHCpk9aQ8U7KmpeSZjZSrEynxWu8SUl5+eaNoGKSEO7HvjGJYkv16DOzz
	pSyqMjRfVIV6TrEU3KpdTH1VLTkLRWSx8aP4iHRP8yeBhfqQgYim7LcgR8XSHFWgU3dA4+
	5zX4nyqrC5MNTE8YLA5f01czv/JgsZoNzVyRtZ5vhv7OgsM8n6cmKE+h5efNgpy1srE3NK
	9Oubm51Y5Rw5UzsMfXk6/4CAeBAGGWeAhZ7xQHuRDZPurRCSsVP8TosOBKEebA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Mon, 21 Sep 2026 08:44:44 +0200
Message-Id: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7RimhEJceQ/CopRBJgJtWiQaw
 t2tnMDle8l/f4fIQTjCLdsh8CZR3JJAXTKwo1kejNInBpUrnddUoOcQHc6mKHvCl49rYDOjnZ6
 oS2vsYMnUuoO094EHeZ/tpk08Slxd+JxXG/3sP9WNkJCrmkvWVCk29865dZLlat0M7XEcX8KHn
 SjEAAAA
X-Change-ID: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jacky Huang <ychuang570808@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but at this stage it does not work with the current
clock driver.

The clock controller registers its muxes with .fw_name parent data,
which requires every internal clock name to be declared in the DT. As
the DT does not declare them, all parent lookups fail: muxes end up
registered as root clocks and most peripherals read a zero rate.

This conversion exposed an issue with the WDT/WWDT parents which were
actually missing in the clock driver. I am not using these clocks myself
but it is worth fixing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- New patch 1/3: register the missing WDT/WWDT parent clocks
- New patch 3/3: harden the code
- Link to v1: https://lore.kernel.org/r/20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com

---
Miquel Raynal (3):
      clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
      clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing

 drivers/clk/nuvoton/clk-ma35d1-divider.c       |   3 +
 drivers/clk/nuvoton/clk-ma35d1-pll.c           |   3 +
 drivers/clk/nuvoton/clk-ma35d1.c               | 637 ++++++++-----------------
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h |   4 +-
 4 files changed, 197 insertions(+), 450 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

