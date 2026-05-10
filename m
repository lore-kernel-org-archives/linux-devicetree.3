Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9736683B
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411313; cv=none; b=cCjH8bQ8Cvyf0t4/nVGz9rK28A7Wsyyg+q2viLLE2ebk5JkbIl+KGDgkh2X7EQFYn8NB6ZfGwTyLrkKSr9r9s6lWXhdqNZpDbCBvJcheXBYrL8bcgR8Ihj9OFPUrJAou5arGfhrBwqqbZPaMPnqjTfA6vdFMPB36rxFMqn4SVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411313; c=relaxed/simple;
	bh=VZr/KgDt/hGxG6GZ4EDdLnrAIFerfJ7PgEKpMx+t91E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1j3vZQt+VwcPE9kbAtDUOEb7nt5NzKhoUBhygC7aYkHQRpzMQ8AMWD909/dPDmVsSVcITJuFMDYHjq8mHyzQKGStK/d81VapfILVNCcrzidEebhZMwAfqum1xvl6VeK7DTM2i8klWABgg8QJ5JXOJVH/MzToiFpdNPzBHywneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwL/I45x; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwL/I45x"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so4499351a12.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411310; x=1779016110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7VsOIce7RBjPGjcbUBZuNu1NQetW/4tiS7UIOUx/bI=;
        b=BwL/I45xrnylbMqje1bY0+ecBHS2i5T6II4g3p6x4SZpptZPt+nVNYhzfHK/36i2n6
         SzuZQGyctdMCvxKzuISXL0tZ8V3+e4C9x0eEQ9hNfyACkkyBjn/exrp5kCFti5eUG3Cp
         KftpP95gAb/SKaXLrdXgJk0ZCD6p2aADJFWkgW7dHKQtjUKcFQXkE6hv1rawZcDsLHpl
         2+M1urt3dFs4U9HdEhYtyPRXQL1pysQBahEVJ6F0OEgGC8RHA1U6FzF0Xwkn0Dtz4Q05
         jjBvhpFFSca6cXG7mlfyQJMPVwLtSaFj1We2WZE2ROIvG/7za6csN4Yrn4NfS7gcDkvR
         Ablg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411310; x=1779016110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7VsOIce7RBjPGjcbUBZuNu1NQetW/4tiS7UIOUx/bI=;
        b=moqftFvu3neXsXdKXgM/5xl+FHv6wZqej8rUuNGkVpsobwHFk8Od0aQ9OaMvjSGyzb
         S50QIjHWvhhxKFV5WNUlK1KcE8OfWU9zZfTwcmA+D4I48wEl64YUYDIPPrhLjr7jMlh0
         On5TjyJA80gnB1yBUv77o+lWHafpcWx5x1YfstQE0O+EJJ9CBpT1y+kXOcft7/jna8nG
         bCO6EfgbCAucVR+WUuzvdwpW8b+akIfubxx05VOtdwyzhNMbOWBM5PZyZHcO9aKTvUpj
         RhHoUl0Cs/wdznn7iXzWpKW+wDKsOm2XXl0ysAZUKx77Mnfzilf+qYoNncwf1y7OsZTo
         vKDw==
X-Forwarded-Encrypted: i=1; AFNElJ+GKGWA3vYpF5tQn+7T/2RmoU3ZGrAbrDmVhBCAzpS22dMhwFs0NXD3k7nGxpLjsOZDCgtY5t6JdN34@vger.kernel.org
X-Gm-Message-State: AOJu0YwMkxt3C7TUnEd5sDCbnhPXZaUrb2qgEprH4ldpLxfLPVgPzB/w
	L0DNraUK/yq4ZZFiSILbmGrpFBXoqvP9rm0ynWNSUY9RuBAR8l+V6ZEu
X-Gm-Gg: Acq92OGHTL2IvWY3R0NaZu17ML2u0ZP4uAoFutdLTxiZ6EAeXykcRnjcXMf5u6s0k1x
	UVaGRh+s7cRvNsXtSWqiTZH2kEMv/LkmKTt4E0/morTfUY9wg0rNJB+S+Paf72JAqxTyu7SQalC
	GtCVLmkLhYitM+xZegAgNKFOQSPU+fvh1nzKFplNa5+yUQV8jyPbnoKIWVSNGyUhHBy+0Jdk8u9
	gm6xxfwpD2LHHNWRnCM2UwL5ObVTQxtZxdEp72nYkv93S8B30tQb03fb9+PTygn3qlRVw/ZiIMN
	4W7zV5UhkAm1GFpQYDf9ZHckwv+iWvfZHG3FabFK1FAVYgxaPmbJUlpvCH5lwuFIGB9aUTxYa79
	Vu6QIFKIy9AOKPgxmrTH13wrl1XaN/c868QGlR13UFP7BKmdVSsJJc+lxs8+OrXfDB2TWGzlSHI
	6/Q1pgGEXPGxqBEm5aL/3W6dg=
X-Received: by 2002:a17:906:f58e:b0:bce:e7ac:3682 with SMTP id a640c23a62f3a-bcee7ac45c8mr61385966b.33.1778411309862;
        Sun, 10 May 2026 04:08:29 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Sun, 10 May 2026 14:07:58 +0300
Message-ID: <20260510110804.33045-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial goal was only to add support for the CPCAP used in the Mot
Tegra20 board; however, since the documentation was already partially
converted, I decided to complete the conversion to schema too.

The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
from TXT to YAML while preserving the original structure. Mot board
compatibility was added to the regulator and core schema. Since these
were one-line patches, they were not separated into dedicated commits;
however, the commit message notes this for both cases.

Finally, the CPCAP MFD was slightly refactored to improve support for
multiple subcell compositions.

---
Changes in v2:
- fixed code style
- rtc conversion was picked, so patch dropped
- added audio ports description into mfd schema
- splitted schema conversion and compatible addition
- minor style improvements and typo fixes

Changes in v3:
- added regulator node names list into pattern
- filled spi_device_id with driver data
- ADC patches were picked, so changes dropped

Changes in v4:
- dropped regulator patches (applied)

Changes in v5:
- switched to MFD_CELL_* macros
- switched to use determinator of model
- switched to spi_get_device_match_data
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: leds-cpcap: convert to DT schema
  dt-bindings: input: cpcap-pwrbutton: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
  mfd: motorola-cpcap: diverge configuration per-board
  mfd: motorola-cpcap: add support for Mot CPCAP composition

 .../bindings/input/cpcap-pwrbutton.txt        |  20 -
 .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
 .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
 .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
 .../bindings/mfd/motorola,cpcap.yaml          | 419 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 172 ++++---
 include/linux/mfd/motorola-cpcap.h            |   7 +
 8 files changed, 611 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0

