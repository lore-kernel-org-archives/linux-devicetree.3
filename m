Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05CD4071D9
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833306; cv=none; b=LttIe0/45/8HzT6Q/dWXPX5cjBnsIQzSfA0eUE8vtzQ9mGysOUGRLCH4ncYo5O/6r67hUTX8Q4xw2jzSl3eVnzv9yU3HEos6CGbU+jEjtC4YSHwt5RadQoS/hSIc124ua8ReHzW/tRxJf57fZPVd8Ky24PYTr7odUCi72Qr4j7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833306; c=relaxed/simple;
	bh=eEcQmBPCvUB+6qPL2Lldpzqrdikone0Q9TfnXXG9Wsc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hx6q0XsgdazgoHo+2OekMqKJHXZFXA+XxyHKdPR0pmWB8PcYrTgFkTRG37tSL/r/rNl27zRsVoPTJpJUu7ofARAtUnFuPtPSWoK27HQaSYSUtiewWUl/+V3Sy4I37ElD8ytkkEdZOdjUOwzSbD7oeG5/0GInRLtcMshx3ZosgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp/ThcPg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp/ThcPg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso4456435e9.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787833303; x=1788438103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4ukql9tjc7O2uHiUIhyqjgrtBoEY/j9Aw/McRizAKQ=;
        b=dp/ThcPg19QFxxhDI8Kl6TweGNTfSPCHD4A9bEXDk0ArsHvM987vMfPhgFslJAi1WC
         kFK3duPO3OjrvWNE4m07kOUqGklAf/SaHaumm9HK6MwarffV9YQiSM0jfh5EUajHQbQ1
         Hrru5iP99X/2v4MED/7r2kswf9JlwfSd0Sn1PRtolOy9g9RZK5auN9EYzDC0/QPT4FjV
         A0HG7HpogGelx26i19URKY1lnLd+80JsKphi84mJrBOp+o04E296epF2DQK+D8L6hDtE
         HlfilLUu9USkuPjiR8knxUVSdkDr3GI9Vuxfi4y83Fp8ZKqmUN5UZ8wqjZWloY9A1MU6
         CJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833303; x=1788438103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i4ukql9tjc7O2uHiUIhyqjgrtBoEY/j9Aw/McRizAKQ=;
        b=MzUMYCHfvwq959NgQHMOZBDj9H2o7p1rblTVLmWi6yGDeHCmAryS9bRf9nkygsmDOW
         94SHl6yAZAps8qc8+3eCujZI9BAVNo/MAJ9KS0BqjdI/hRA2spqdESjumycXwQYzOTmx
         9WH8RnDGnaAxOO8xINUNwzsBVG00EFXJyyPyDFkm1QPn8kAoIrrnK+/KhinkH2Dz1ewh
         1FN8ToJsejG9YuA+WA2fNwhAMzVgrveznGYQUK70Mi111SJ3dTivQVX0xa63/QU5uRis
         Clzr5O4czO7OoCYfb1zWczxl//5V9p3MTakbP1Y6L1R8e/c2YJt1tob4xsPq86iOn+bD
         doNg==
X-Forwarded-Encrypted: i=1; AHgh+RpMn9kSYg8igVt3o4BrYtyl8tBKllxUbvlbsynE78fmsG6HgwFaFIGQNSSXTZvJSIMpfEQZMJBY+LSi@vger.kernel.org
X-Gm-Message-State: AFuF++krNMtVn/95VJQKkTp0VwYQbbcVuTUgRDD2ewpOwjY7ls4cjw17
	/6UK+umjP5Sm9llAJhc6RvXffHTlxP5M+P0Ncr0MvavTHRePVMBqYQaE
X-Gm-Gg: AR+sD106lzpxMP+NOUol1UTNw0Ip5g2dX2q+x+irUOO5AdOF23C445F5N2G/Tutkg7X
	oO52lFS3nthTY+pXnUaGBO/QgGE7BtSdhGecRxO5a6X5Lw4AJ60FhrmWLmCOrZqgOfCczaV9Dri
	dVI+YWV6PaZfaXNtA9A8mLhrvZGJGWf6+YyulIVoT7/DCorZw7035ySLEnEA8QDwdQ/Itug5MV3
	VHibUcwiJ/wKb1oy0e+kcNTwfgq5PyGEN+u3xm85nc9B9pSgB7umgc9UKGs6wRE1RAJqO15ABb1
	NHDljgCeHPnFBBkTweNVSger8MDX1DHtW1IylF8SSYFfoX3TfTPaJA8CU3jt4fS8PnAnu7LvA5D
	4t7VFa2ooyCfLCfqiylALXxD4Kt6uWBw4Z2fWAxR8QJjc70KLyycjf9WVrgtmzqiNpoh5BOLld4
	YsCaCmJf8JfxFxaUjV5IrAYbqPmrWlZt3/oVnZe2ge2FwJ7pjtlZI3wgpviFys/wjZXfPas9DUN
	Bja1msZyF+I0R7T/0sXZeLmrfIP60s12sSa8OjzpRPSkPKD5YoF0Q==
X-Received: by 2002:a05:600c:4e15:b0:49b:8e8f:a409 with SMTP id 5b1f17b1804b1-49b8e8fa4a6mr49907815e9.13.1787833302721;
        Thu, 27 Aug 2026 05:21:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm50099535e9.0.2026.08.27.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:21:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Thu, 27 Aug 2026 14:21:19 +0200
Message-ID: <20260827122127.18874-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  13 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 815 ++++++++++++++++++
 8 files changed, 1283 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.53.0

