Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98753E95B6
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352305; cv=none; b=dMo6YQB2D/I/5UKsScBBZYnyJg+++Vxuvo8B95hhbugUvX2qURkrE8GaS8aSba+t9Curvy4SPNCWDsxhv64O6woNNDCnhq8eC7AnwffzUcG3k9spuyuRJx7QK2PrWZD1NcRuGdq8MiSyUZGwJ3sLmxv9kSyQy0xOLokl15JFXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352305; c=relaxed/simple;
	bh=YmH5NT1h3YC+K4Nq6anzE6uxklzwUGPRneUbJJptAPI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g+qQv02oDbrTBGKubcQgkJerFrZyzbcH1RoiNAVWEACGrZcSZonphSiwQq40k/70zeLIHIgzgNZrj0Lvs9CJk2J8kqC8eHlnKnppOJGN26Z2jpSORHgt51CsRKyF2yQHSlkKWmaIx3W8XlSB6qtomnqtnUCWD9Uzf00nk+2ZMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=43Kle8uh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="43Kle8uh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so37646075e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774352302; x=1774957102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=355qHMBuMuTWoaZ72E3VJJAus+s9skXoXEPDnMR6Oys=;
        b=43Kle8uhMphE7bW9jccIKXON1aMpC9CkWYUVKH/PGVCWJ6KhmRv7RfV0Vux79OLjQe
         ocINYt4XvY9RD0QJ+mmWDOlyqAbgWvVF0ahnXEQYQ4J1CZJ9YwQtWTGDAk/UC6JXRhwt
         E3yqdOEbq7BkvvYe1ZO1g5jaAksMfFkAtYKKpwCTU7Vby1RVQIOfU7FZGUp4Rq5Zu87U
         aOQJPDp2rq1lmu0lYlMnX3t545A44AsmvkhvcXtoAT7RnsWN7a68PpM0ISwlhvwwNoo7
         tSVD+XCD3WkhSaGvRk5gKBzUz/c3UZ2ovN+jSwyF20Wg8coSfFLBAEbcUjJlUZ2zp6jL
         IYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352302; x=1774957102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=355qHMBuMuTWoaZ72E3VJJAus+s9skXoXEPDnMR6Oys=;
        b=M/8HbllhAS3waB5ouHgkujt1+TCqTIUAc1UeWWh/dqgMKT+jEGEpjU0gYGnkXm13gX
         iRFvkj48irC3c1Vo5o2awCRqOYGmvxzxZhAKmkAD0+kWIMm0YzpzMKqsR5o3vtW1Q23M
         8SrStQtkwLGjj6qSw0nFK1i0uFa6Z89iwvHg73B/iI5IX5GQ7nszFAf1zpnzSknmaGnv
         EJkgZpj+S7egnOJ1zE9D0AFI11Y5SOvczPeab+LmeJu41Jk6TmdZ+yDSyXcFXA7GPVMV
         pQ748o3qgJ6Fy+nH3ztpVhWEen7AMlGuNdeVTmj2NLnIxyMtf9leque2Gg5J3h5BUHHT
         4U1A==
X-Gm-Message-State: AOJu0YxNiOS5tnJyqyyjqdlLBvASYoY9LUCPXveUHsslqy/RDBzT9CQe
	kcSDNT2NWMDIrxQXGs4GQxl3uhBwaQjy5LfpBhoZ2YVP+GWAiWiVSiWecdKedQ8ua7I=
X-Gm-Gg: ATEYQzy5SM3O9cum2pDn07ywKr+eefqKJIJdxZYZ4yWIWjM63CwXL87Rs9Tyo/jz+88
	tQMqjTd7Y8wk2mG3vrXMKdSTcUJGNTvWlwc6BJrOvsgUBeQPSosHHwOz5Ym2KwycKRPg5G4Fl6V
	DnfUSsR4aDE/+3oc3yOpUXhLS1NLT4y8mFjFOKY+RVcaKq/QIvWIc0IDD3t4nOGIvI1uSypSBc7
	KU8PRfflIqg7gQLLAXqaFQMuQwr9wI4l7xGODmTiapj8ILgpMPjCzEgxyI6kwgKYfC+y4J7x5PL
	cCdCKjeWy/Ofet/1uNunlrwCbiN7hgJ8xUSvyhtbYbW091QFxh9cbCvPjKPxV68eDLQdDokz/iq
	u4uL76X7OEX2BYopwYPcRTHsX0u0wQTZ1FssfAT7v/shqMbs/45v002x+5CScpdB76R/1qsissl
	GYjfPzTF64uL8L2UycAtFXgqODF3HMfvTXE4Xxur66TmP+L2hbOXYHWgcshVKaOrKRwVdgp0H5D
	oRj8w==
X-Received: by 2002:a05:600c:3b8c:b0:486:d76c:fa51 with SMTP id 5b1f17b1804b1-486ff03ffa5mr211986125e9.27.1774352302120;
        Tue, 24 Mar 2026 04:38:22 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm20846715e9.1.2026.03.24.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:38:21 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v5 00/11] Add support for the TI BQ25792 battery charger
Date: Tue, 24 Mar 2026 15:38:05 +0400
Message-Id: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ53wmkC/2XOQQ6CMBCF4auYrq2ZzrQjuPIexgXSQZoYwEKIh
 nB3qxswLN+k359OqpcYpFen3aSijKEPbZOG2+9UWRfNXXTwaSsEZCAgfXuiO+aowRAWZcaZZa/
 S6y5KFV6/0uWadh36oY3vX3g03+u2MRoNWlicABBZl52rR+g6iYdGBvWtjLiWvMj0Ac0ud2hzz
 8LVVtJKGlgkJQlYZYKEnum2lXYtzSJtkkc0ZI3zuUj5L+d5/gDOnMM0TgEAAA==
X-Change-ID: 20260303-bq25792-0132ac86846d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3906; i=alchark@flipper.net;
 h=from:subject:message-id; bh=YmH5NT1h3YC+K4Nq6anzE6uxklzwUGPRneUbJJptAPI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQeKl/yo+hLhH9nyYmY9Qd4bA9oB4R4p4joVN2tusQ6c
 1109py9HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEx1cBzDP+uiuRPuC10p9DzNYS/LntUlGPHyo7rh9BNcBhP0fGeFezL8T2/esPH
 +rKVGGQY7fHcd+5ftIb3w046zD4uOdvNrn7V15wQA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

This adds support for the TI BQ25792 battery charger, which is similar in
overall logic to the BQ25703A, but has a different register layout and
slightly different lower-level programming logic.

The series is organized as follows:
- Patch 1 adds the new variant to the existing DT binding, including the
  changes in electrical characteristics
- Patches 2-4 are minor cleanups to the existing BQ25703A OTG regulator
  driver, slimming down the code and making it more reusable for the new
  BQ25792 variant
- Patch 5 is a logical fix to the BQ25703A clamping logic for VSYSMIN
  (this is a standalone fix which can be applied independently and may be
  backported to stable)
- Patches 6-8 are slight refactoring of the existing BQ25703A charger
  driver to make it more reusable for the new BQ25792 variant
- Patch 9 adds platform data to distinguish between the two variants in
  the parent MFD driver, and binds it to the new compatible string
- Patches 10-11 add variant-specific code to support the new BQ25792
  variant in the regulator part and the charger part respectively,
  selected by the platform data added in patch 9

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v5:
- Added non-OF match data and switched to i2c_get_match_data() to support
  non-OF platforms (Lee Jones)
- Shifted the types in the enum to start at 1 to avoid confusion with
  zero-initialized data and non-match cases (Lee Jones)
- Reinstated the const qualifier on the MFD cell array (Lee Jones)
- Link to v4: https://lore.kernel.org/r/20260311-bq25792-v4-0-7213415d9eec@flipper.net

Changes in v4:
- Avoid additional data structures and pass 'type' within the existing
  struct bq257xx_device instead (Lee Jones)
- Move comments for new struct fields to the patches where those fields
  are added (Sebastian Reichel)
- Collect tags from Sebastian Reichel (thanks!)
- Link to v3: https://lore.kernel.org/r/20260310-bq25792-v3-0-02f8e232d63b@flipper.net

Changes in v3:
- Move MFD cell definitions back out of the probe function (Lee Jones)
- Collect tags from Mark Brown, Krzysztof Kozlowski and Chris Morgan (thanks!)
- Enable ship FET functionality at init for BQ25792
- Link to v2: https://lore.kernel.org/r/20260306-bq25792-v2-0-6595249d6e6f@flipper.net

Changes in v2:
- Fix an error in DT schema (thanks Rob's bot)
- Ensure the broadest constraints for all variants remain in the common
  part of the schema, per writing-schema doc (thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260303-bq25792-v1-0-e6e5e0033458@flipper.net

---
Alexey Charkov (11):
      dt-bindings: mfd: ti,bq25703a: Expand to include BQ25792
      regulator: bq257xx: Remove reference to the parent MFD's dev
      regulator: bq257xx: Drop the regulator_dev from the driver data
      regulator: bq257xx: Make OTG enable GPIO really optional
      power: supply: bq257xx: Fix VSYSMIN clamping logic
      power: supply: bq257xx: Make the default current limit a per-chip attribute
      power: supply: bq257xx: Consistently use indirect get/set helpers
      power: supply: bq257xx: Add fields for 'charging' and 'overvoltage' states
      mfd: bq257xx: Add BQ25792 support
      regulator: bq257xx: Add support for BQ25792
      power: supply: bq257xx: Add support for BQ25792

 .../devicetree/bindings/mfd/ti,bq25703a.yaml       |  73 ++-
 drivers/mfd/bq257xx.c                              |  54 ++-
 drivers/power/supply/bq257xx_charger.c             | 534 ++++++++++++++++++++-
 drivers/regulator/bq257xx-regulator.c              | 121 ++++-
 include/linux/mfd/bq257xx.h                        | 412 ++++++++++++++++
 5 files changed, 1156 insertions(+), 38 deletions(-)
---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260303-bq25792-0132ac86846d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

