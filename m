Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BB44D01E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627829; cv=none; b=UWu/gIHXcLcWfmss+jw76WK//d0Nm7jCV4yysgQPBE6MEFlYe4Rq1otnidaAsCOKOIy/+ar76bwUqvX6nxieFByulmwQ+4nvol3j8YFgEgK+i8NR9RLRPE0zPVUYETnSMokmbGPK1XSb4uxlHhGLXbpni5oB0g/ZSsEXuijqrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627829; c=relaxed/simple;
	bh=zZG0SwXpBaudvhL8T1nanzDcag2V5GkwhlyQJoKbJVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iBNZBFtG8TvIv9I98uiqYva4T0jDrERi6vtbYo12JMf5vC3+VI481MtO8jcQ6gMDqcp6OBXSbDmWHIxUpuFp2a3uxb7xNcDpBKHxze0+yU7c1mhhjykrDyQSQqc2n9cBGjsqaJ5D+cH/W8GFh9G7LwRZQwf5baoJg0u8T/+Il9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUj44CDh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUj44CDh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590ba856so19699835e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627826; x=1785232626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cGDwZcLwL8KiYreb24CUFPP8K2PTwnHJJuWk44wG5c=;
        b=JUj44CDhuKTiTTOJyxA8aHtxzT7D2WFNmg3NJbUoYfVWToRui8LJVoz0Nw6nMJ6fzN
         BsAsmquaf9zbq8S82IEC+1xqCALMRnkVdqzeJ32gwa3jFZicjUY2UEKpWWbwL6TU8JDF
         uLTnRjVTIf7YYP+QjRYjQf1prWwk7WpRrDmKTzSDxJA4yeROAfV9k4Vtu1q33tALDMXD
         l4mTYHu0VhF4pW4EjFJ9Wk4rVKO46Gd74vknnl0S2SpQyDvkIfX7OYK2dp2jb874t4Sr
         cSgP/Zl2YKLJpIS+UvZc00wABo5nf018NmcdAwvBnzehHjAlxkI/E/7s1rW3tCH7AyuC
         evew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627826; x=1785232626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cGDwZcLwL8KiYreb24CUFPP8K2PTwnHJJuWk44wG5c=;
        b=a00j96q6LVA5UqBRzxNafWXFdYp44ECcxDzyWmxO9MY02B0gZN13mn/xp146namUrd
         WhACgGNqdlaZIDjVWz4XgCtwyt+Pic67oECi4rDgQ3MonfjrDckFJKkXXrTemQSesve1
         NTSdgqn5Kf/Konzi0dMRiVJWxfsN/r5kmBVqaIpeWufSd+V+D1rLB7+52dKAd3efgSDj
         OQm+MVElXSDuFU+J5dhRk/TnAutMeLOAIl9cIHaxX8RdHS8AJil1x5bSP/UgwlKzs/cE
         UnpLHHC3d3YxTAGWf8yW0NNN+Fdjw5GRMT1PCRFusYBftEUS5ya0P5C20nyn9PjmRMK/
         q9nA==
X-Forwarded-Encrypted: i=1; AHgh+RpvBzHbM5Ap40/NeiIsH/pEEvI/buUcjRoakO6sCnGqm0/U3sdWZKAi/ziy1NpnUN4Bl4RKN6TYV7eP@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKv1b5Tr/fAmwkLC+2A8HzqwRKpJKE4aomzy6ViIpCIwPt69k
	AWqC41LpNR+u8NH9CLhT4kkVB0DuV2fWVRCvEg4VeKiD12jkz1sMtCuL
X-Gm-Gg: AfdE7clAc4rH4jpMWg1vkQk2VJ0qHOidB7yFx/ye8tzKZvYfeZwNzgOM9UB+LrIyLhy
	3G+MTuHlv2L3SfxBm80ecGwqUiAeuVwsIiddrh2BHvWySX8lJB+l8KrT7zlqaf40THQG9yuQmMl
	8AVT3dVYEst5QCj+Dbd0Wt5cNRoIVG2nr+qr1CzEsHFA5p8mG0B6+UqIaUGB94ilmBUSjq81PaW
	ydZOuhprUjJk4ApIT9H2DgqfLy2Scem5N7S7qbhjiNg5PLOD1DjHLwMrw5MCvsnUxvB7rvnj3z/
	JmeUlYCiguVaKOUIKuhYXZ4UeLtgHOBlB2EcrRdDKa09QwL8wG4nyolnT5oazgnCjPIA4jugzFC
	gu+7Q2yP2jBYavJtRXihKe6jm3/7/0ELD0QgqnIjJWYI4YEhF//iUKfJCxT6BtNfKnQi8l4s14l
	C7yh+A7OYz3kYZ8b/qbJ11R7I=
X-Received: by 2002:a05:600c:4fca:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4954e1d843cmr165855415e9.10.1784627826040;
        Tue, 21 Jul 2026 02:57:06 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Tue, 21 Jul 2026 12:56:47 +0300
Message-ID: <20260721095654.429346-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Changes in v6:
- removed address-cells and size-cells from main node
- changed macros formatting and OF matches
- factored out common devices and made device addition staged
- dropped cpcap->variant check for 0
- EINVAL > ENODEV in variant checking switch

Changes in v7:
- adjusted spi_device_id entries (name/driver_data)
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
 .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 143 +++---
 include/linux/mfd/motorola-cpcap.h            |   7 +
 8 files changed, 571 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.53.0

