Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A13191F91
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409895; cv=none; b=cdwFE6mgb2fs9+t5d0ieejacSUeq27GC607ZofzT2iPzidxmN1m/AUfO/gqLSvoufLLUDz1mx30ErNrqF+YSog4wtXd8ghMv0XnmLEBVtW5fLKklc1KnmjXDnvxhx8h2mrFFBI2Gs/5gjX33UpuvMtGE9cAmYwVSF1otmRpKdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409895; c=relaxed/simple;
	bh=qsbXpuOcVi9cj56MTeK+/eFhyj6nGZutYjLNfesMxp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/oTGgC0E7LjVufdCmqw9zd/RpuDJrK9bPSfG4/7qlzKHaJxLT5Moa/fNffctqv5D5Nz8Q0nsn+cIxZvqF37Uj3L5JT1SwWnilf1JS6R+iSGw+Qs4Z73sSVVZCCCDKkqmR/vTR7yPeNqfPcOcNqfVA6pgWIgWwu8DZEzn1V8Ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SI7P61jl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SI7P61jl"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so390112e87.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409891; x=1777014691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjBeGkQBcP1nglY4BuR0wBXskpEgo4GmwzySCtgIaXA=;
        b=SI7P61jllGAXMO46ful3G4Ix/gf728v4Nayw2VzCVpmeyoioMt5EFAtwtsCM4ww+wD
         y2S/Qb+43gwMCRS3X++egMpG8jvIL80/upD9iVT/uZbRcCvTK0anHzbHeW9uZKoXH/mZ
         eWiz0GuC968OxqdmV4+B6mhqQ2owgzCR5T+ndhiCtztXL7domQd+4c7qjmASTJwEDR+w
         o28OpUKUGB0Ur5kl/JQtydW6L861i6t9BUxXj7jHZ2xGsLK4yb/Xf27vXAQdkR6gXFxe
         wsAxdEwndX22Q2V5iKASPzXowQED5mlX1EH12HgFWOm/fIfN9qQ3/6hLksvnEoiCiMEf
         KHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409891; x=1777014691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjBeGkQBcP1nglY4BuR0wBXskpEgo4GmwzySCtgIaXA=;
        b=HyHqx0S4cOMfbhb3KqbLZeSbEFYqaugYpMPQ5ooLdSY/c/l1tPzlaOv02LSr5xz20/
         Tff+UM3JsYPx8qPFwBlZbTYDmsH0gqpqJAcfSWdcOXBPZADqV9EH8ala44tasXq4RhBD
         w70lkmxm+zsKSYegLVI9hAVb1xXmAj9NPGBTmk6fBOJmSghPJIhwUt8/qXvIaAl2ylm1
         j5k7h5EBiJJl5q0etc7u5NS1JXkMUx5QtffycVldwRvlJF5oG49ZJUTvZMkEHaJZ9aC4
         2L20qXapSyIF4OFibbVi+xEFdswabsJIJGxCmsL6MEGAPL/ZiVmNvv4i2Wc+b1UUtSgL
         cQdg==
X-Forwarded-Encrypted: i=1; AFNElJ8N6TkkqB8WHaWItlsrYUV/mXovB7h2esywOdp7ywc2UaoAzJDHnQ0B9kwBo0C3C3MQGHqzNNrvgbhb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh1EZQkH+TIOlU/aFhf/WSNFf3G+7taNHfKvN1XbaN1VWc83Wj
	vyjVXCbSXdL+5OB84aKj30sIfNyCR89LWrymJFv/D1NiOB4D9n4VQUb7
X-Gm-Gg: AeBDiesBerggP06I+ws3Y6Az5MeYVckBqgCDN2maM1U0i3p1tYWas3jssldJa2tq/To
	zHSNxGJzvA4oLa8MJl5Qzsz8wZVKreQHtkmeJuvIwBWZ//97ADDGtVkTM9F8rGTkoSV9SmAmw7I
	UYJ4Jw+LjQftGNEGDJwrxmhnX6xLHbsxtKc6L35aDUkQQEmSW5GqeCljv4wjcijDkp46StlbPJr
	oEc6jiAzkGI5O/0r/MM39UFRr8zK0KZg4M/+/rmEOsXH5XTpbesgoklXBFLzRzG4ak6Jq0gD3NG
	PYzWX31vmNKowRnuTVgmeJaj3m/j1rXFgvRwj/IyN11k0DMHzN1/tyfZVDQakIp5QPYuA2ZCDnJ
	0DXejALOH5LiPnkaqLhvPRoUMO29jbOx1vULil418STNtL17q/Rsl5Ak/XGC8Buow5Wg0TZhTP0
	gG3Ez48mRMu/p4gd9g0RmRlwk=
X-Received: by 2002:a05:6512:3d27:b0:5a2:b219:3eb3 with SMTP id 2adb3069b0e04-5a417308f0bmr463637e87.41.1776409890856;
        Fri, 17 Apr 2026 00:11:30 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:30 -0700 (PDT)
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
Subject: [PATCH v4 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Fri, 17 Apr 2026 10:11:00 +0300
Message-ID: <20260417071106.21984-1-clamor95@gmail.com>
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
 .../bindings/mfd/motorola,cpcap.yaml          | 416 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 151 ++++++-
 7 files changed, 623 insertions(+), 145 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0

