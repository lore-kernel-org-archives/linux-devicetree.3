Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EFB39023D
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273421; cv=none; b=aFgzBK8vnrZ/jLabOOuSzT2ca5n+sMwqVUIc01RJnezb5jS4rt5KIOVKg4/Q6la0KaiWWsXPDo4ncTM0QmH5BeJA2xZQMrJzd0spcsuZ8zX8fy/suUm7CwR6VnzdgpkE01uKpp+1+kB1v5qjv/j3pE3DbIdHzzu/G1k+M0Lhu14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273421; c=relaxed/simple;
	bh=gpPPIkHcIu98HxBXPnM4t+YXLE7AWWIMDsr0lEdjrN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzOgeZ5HWqrX3Bk4Gu9axS9eXKN8zcEN/BHF6HZdePhLm1DaUUYCKYbjBRc3k6TiU/lUrI0erVgzwfV367cgpg/c2mCg1GJ7/KW6O6cuy/Miv919oY6lVhtP6kz9nX9Sw6/KqQ59H3FhM0nIIcSlYsthS4C/mlQ8gZTwdVQeWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deLWHSK4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deLWHSK4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7645adbdso5347550f8f.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273418; x=1777878218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0ipNjroP5bTPdmX0Il5KSrax+33oGeqlSqXi4ynRBQ=;
        b=deLWHSK4atjRuqrju8YmyKRcN0hVL7dU/DnibmXnAotTQ2BgNK0ONSo8MxetyhPUyL
         ZcpYDPrja/Jtnd287bKoQ/3gtKclIL5gOg80j1fqreP9MuZHJ+HGld/sBS+9rHV0qhTo
         6cpQ7NrNeXGghPkn48ZFp3qMCitfdLEn+kRdjJD0M27icBLRWJrIs3EEE3AfOrf2pgCa
         k4oJDr0gW1JBqcW8IyIPPN8yie0Oy1EdAToa3Hr2EeVKw/9T1sbL9r+IkD0IOD6HMxX+
         iOhfEnsgCuvZc3wirpmE2VhUTz7QJbG16rawoIUJcwk44ACTQtbzXGH+rdVugwkB7rTF
         2iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273418; x=1777878218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0ipNjroP5bTPdmX0Il5KSrax+33oGeqlSqXi4ynRBQ=;
        b=b+uPS4cO2WEcQEaHiB/GSn+QCzVtO0ngmifvnRG25a3NLmb9IcYIyo5ZTz5xsxIqCw
         oedfKrWJ8BT2Ttsc74PVxbo/O19ZENCtLFqG8shFrS636U0Y0J87Wi6lc9aYO0aBqdcN
         PTUY4C5oKDBqxyyQ5fpX3/bhJTbzicB6te2txIfey/77AuGBp1PWTuj2b+Ru/wBNah1c
         L24boc619Uv1mC0krEioKKM4b6zvMsGSUMKlE4TjCrdyaoOVfXrY9NOOEEiZaT0XKjHy
         MN6GuDwDI9J5oo9rJA2Wdk2ZVhcnHA0GqBAXQL0Tvgawg9bM1gnuU6ALqScwlbEPTwTO
         +32w==
X-Forwarded-Encrypted: i=1; AFNElJ+uAQqJKl/T9la0SaZLljfX3+1zclcbabtPG5ug7E5xC/DS4bNWqJfQXbCbnOR+Gnxy3bi/MKb87cL3@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJVMMBDWp3nzh6+X/acouNJUa7/lVo4MS0DtMZegGebSeg4pr
	+wEo93BKCZRK/Yhdxeg1WSzUtzsCF4c5NITbfn+90Q6mvMXrqXpeGG8b
X-Gm-Gg: AeBDievbY1zfSZXi4VJgo7O3yb/ZYsCRMpVbvZG7/LJAPyfqDMij298JzuosRgpb81N
	r8IMk2hdPYaQ16htbo7l00vweAzEbsVBDwyV2HWkgrcRH5I7sOX5XjRf4JezHz4it8mk9PtS2qG
	oej0HF8R9AYThUcpiiM2DOZ6lMNQW/oyItsvybvHXs/bMlGtjJOl3+2Ni1OZNxN0mt3sbmxpUDC
	nZkc26fZsQ0dIViBX67LqsRW6N2UxA+KGb2Q3hYu48VpFZ+Oj5N+6qrJXuKgiZ0IrhfhuIBrCBt
	o5h9fTQ/z0XSyxtGD6nNe3iDU16yBjoVut4O34NstsmeqUwhoqj/sHHHSmbSOQsq49oAKMQ93KZ
	bCuuDkuuljOMiGG5QNEjtANsrJoNuSgUePe6HcVE0Ea5WAfEFvJMH2aZZ3BTfaaZ1cHNPX7kYyC
	US8Bh2yS7hiSXTQ8S+s92z/6I4Urmn+/reuw==
X-Received: by 2002:a05:6000:1865:b0:439:c1ca:82be with SMTP id ffacd0b85a97d-43fe3df2364mr68022330f8f.28.1777273418099;
        Mon, 27 Apr 2026 00:03:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] Tegra114: implement EMC support
Date: Mon, 27 Apr 2026 10:03:05 +0300
Message-ID: <20260427070312.81679-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for External Memory Controller found in Tegra 4 SoC along
with adjustments required for it to work properly.

Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.

First 4 patches of series are dedicated to memory subsystem, while
the remaining 3 patches must be picked after first 4 are applied
and are meant for the Tegra device tree maintainer.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

---
Changes in v2:
- rebased on top of Mikko's patch removing duplicated code
- dropped unneeded headers
- adjusted function naming to be SoC specific
- switched to dev_err_probe where appropriate
- made emc_init void
- header change commit squashed with related binding commit
- combined with related patchset for Tegra114 device tree changes
---

Svyatoslav Ryhel (7):
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: Implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Document Tegra114 External Memory Controller
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes
  ARM: tegra: Add DC interconnections for Tegra114
  ARM: tegra: Configure Tegra114 power domains

 .../nvidia,tegra124-emc.yaml                  |  174 +-
 .../nvidia,tegra124-mc.yaml                   |   31 +-
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1439 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  157 ++
 drivers/memory/tegra/Kconfig                  |   13 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1353 ++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 9 files changed, 3257 insertions(+), 171 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.51.0

