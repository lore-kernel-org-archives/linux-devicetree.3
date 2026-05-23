Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385837F8BD
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526281; cv=none; b=Zw/GbcmRMvoL+DOV3rkwEoJej49QOtGr9qgFhLTbEfFIL3zXZHTBxoLTmgKwcZZRyqzeMw7HNEGPZ6JDlrDAjvXC23mk/c9CmKyLXwD+vCfNmDAgAwGgxmsjat8o6/lYnYNlQ2QhAe5KL20GpbaHiAjbBvYRCmWTD3EMJSMxSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526281; c=relaxed/simple;
	bh=YlpVUBY7qjHm3/ZERt7CV3iv2qn0LVcIMaSVXRO4BdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=czU43iIKjZuOYZyR9azsU3ZBHkONQWyzAQVYJvyJ4j70lz084JYuzJU88xTDovUleWEkJwu6ROxNx2QtyTqSABhWPKhK1HPh57nG3Q32pqQJOaz3Ewzb4USOpkUZbFm3/2PM1NdxzYS4Oi7kdR4H1ChC/AhdykOpdXcjWNADliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rheejzAD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rheejzAD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso9374709a12.2
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779526278; x=1780131078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMVVhkCyi3BTFhYWA2PfziVCVQZjQefJnSrFOyQ7TOs=;
        b=rheejzADHtw1ekI6ea1X3SUvldIzI4pCz+KFP/YnAucbaT5V1S9SGi60tYrUocBqbu
         G6F12JB+2YkiIPnvVqnecRWlGPCHMDykEYl34Kk1wFy9XvOGd8t7Mh5x1D+ixGtztaDy
         LxkSO0EFyW5ZHh1pRN5LQ0qWIe6g3nMjSBrMTmns/jT8SiHeN1nNT7mqaUQTu7OO+gj/
         Vd4mslHtrrtLDdUN88IzykX/MnhkZzEJGGLjc1ltlCE1WTTUw7/aOX4xPARjsiKQAGpo
         VMkoDhT+LlVZCy0NZow3e4FsT8lokAwprsDqTPnTphIpgdBmpoxpc6XCTjFB4wZ65SwS
         10Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526278; x=1780131078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMVVhkCyi3BTFhYWA2PfziVCVQZjQefJnSrFOyQ7TOs=;
        b=BMovMMlle63p4VFl5saKw6xsHzG2nbGLpHZQ2CmXd7wCJ7Q5pjQ+Jrp8b/p6wJEPIl
         y1UO/ZK88A9KqLVK89FPkUrdlG/Kemob1B6hG8ZukN9BukSSRIgKvL80ohKD42t8fm+a
         HfTslrUKUZIhC9auv4gWYvIAFIb1lPloh8GnfkyExB47INIL+6BQDXpb8jZ6hZli+e5u
         qBqLrhX1QXAi4nZb5rSvYQi4yjH+6WtvVJ+7SkDuc8bE1bfiY9OKv38XTjE2a5ePujFh
         zPnfsL0SI8SE/LOGbr1ZqKA3NB4UFkcff00Qe3zYtBicUVhHEvzjxq0zW8AB31MrYwNj
         TAog==
X-Gm-Message-State: AOJu0YwMqbtwAm1AoA/adqQIhHraUpSMGjIhO5H1Rhz5j2bbh53dN41A
	xamneVJRCImX+IbsV0pBNTje15wQW0mAMfar7bhzPg1BnKAtaoQQNSVuppDIrA==
X-Gm-Gg: Acq92OEl2VUDCP4QpKMJc7KQTH5VE+tdOAthqdbe153C6jPZMzBABlDJeLxV56G5s3H
	y6UWrqcKYsSLke5uhzEF3F46s/A+GrlkDC/lx/m0fVPDqodCVcAWeumkLi5xWaJBrxSVvGRYrH9
	Wdz3lFD58XZGHP0bN3wkxYSaSAn9XsyHZiVGDcWAK+4xiwn9LIVHdgyTnA7wwd0FNG9vbbpJh2A
	MW6XsAYBpvLHQu5rNNIx54B4oOQ30mgHqyw1Lt2W/aGeAoG5v2pvn9GdxAGexWKaaq23cDLwut8
	M+k4HGlue/1SREpEO2A9C8deqJ2lZzuQRBEM6T/sfRuWZbIWk6LaRLKS2Q12sAUdMAizuU6tfXH
	lUq3Y0x3YSRnEEH46FGOaETV/e9AqHTrWw+RiSANxvAwJ81d8nxHjtnCYpf9LapCiVzfnzZu7g6
	vn2gU5QMYge3BTNBtM5I5p0SA=
X-Received: by 2002:a05:6402:40d4:b0:687:cfde:ddaf with SMTP id 4fb4d7f45d1cf-6889c440492mr3668932a12.7.1779526278408;
        Sat, 23 May 2026 01:51:18 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1f0afsm1642658a12.17.2026.05.23.01.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:51:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/2] power: sequencing: Add support for Nvidia Tegra modem pwrseq
Date: Sat, 23 May 2026 11:51:00 +0300
Message-ID: <20260523085102.51000-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patchset implements support for the Tegra-specific modem powerseqence,
which handles the registration and unregistration of the USB controller.

This patchset is a part of larger series aiming to bring XMM6260 modem
support for Tegra devices:
https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/

---
Changes in v2:
- previous phy driver reshaped into pwrseq driver
---

Svyatoslav Ryhel (2):
  dt-bindings: soc: tegra: Document Nvidia Tegra modem pwrseq
  power: sequencing: Add support for Nvidia Tegra modem pwrseq

 .../soc/tegra/nvidia,tegra-modem-pwrseq.yaml  |  49 ++++
 drivers/power/sequencing/Kconfig              |  12 +
 drivers/power/sequencing/Makefile             |   1 +
 drivers/power/sequencing/pwrseq-tegra-modem.c | 209 ++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrseq.yaml
 create mode 100644 drivers/power/sequencing/pwrseq-tegra-modem.c

-- 
2.51.0

