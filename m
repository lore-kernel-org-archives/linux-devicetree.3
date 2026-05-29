Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AC1C3BEB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017413; cv=none; b=Uw+M1SFlmT+8LlS9RpD6z/QtRBOUo5PavO3k5YgybNhtu+QQ/4WScVZdE8r/a9pciQZ3BMUvC1VBqsBxyu2AoluxxBo9Gk54AjJKDybaKyVSBRK/pNHTiqcvFW+tE2+a+l1B4ylLYBafpo5D626VlLcXGOkShqiUTwGsetCp4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017413; c=relaxed/simple;
	bh=sKg6xoqq2s+ZZcuSNKhLo4WCT4rISU2pWEoW2HBRb+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pGn7X8ctj/iOnulFZKX1U+w7x9VDWr+CRDMhv1dwF78HR74S5uE8aQreq/aqLzeMI8fNozDlTGKM2Zle+SKXalUBlkNikidJwKgwD4SBs8WAWAoPRYdlKLoFrdg2V2kdKv2/RcTCcy7zBz5ue6ds/vwgYWSqJMF6kGzi3ecEQ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3feYz0w; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3feYz0w"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bd266f6fc0so66290145ad.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017412; x=1780622212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDATUkG/OtxlAUVWKXX5mKstzpi/LS1mSaHeR98JWp0=;
        b=o3feYz0wg0BP86kBDfLGCOfCBFcdqHotfqStAeNzeC72X7lwjKgka7e58vHi727QyS
         74bipmcYMxQP39guIeScFgk7aXnz7ThSmZ1Oh7j5gdMapyrPJqbl89lo86+r4GXPqykl
         uMcFBg9NAqnj5DguqbjWuB5yIegaCUquCluh1mCZSt0zLz16NP/SPHDXM0MiZi/tsmKy
         fQXbBaMQjm7r/pLDsTI9qB4j/MIbgmUzmK8mhp8GUimYswcxktMl/IgExHkZI7T7GOUJ
         UqwSOxYYxN0eQAzKeBKf9mfKfcWBgppCibrCVpd6bLS9loQYbzg4aCwXlKTvukff1DRQ
         /oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017412; x=1780622212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDATUkG/OtxlAUVWKXX5mKstzpi/LS1mSaHeR98JWp0=;
        b=Zd4yNE2i8fXm57CcT1dOtm9ae3xoIEkdGNQ/Riwqeubae0/zBhCfVCYeeyOykMoHBN
         RPy0H+h8Flswj4zG9hRBzbInF2wMuFV7jMSkwvMuZe4Db+L36mUKk9QyLQnH49dj43iG
         jR/HwI+r5/6ws89kOa307HnE9BNemrJuyEPMV8gfbXv+a3fR3wQTVDdeDls76+bhIKwT
         iEhjmsVqqOSX9AcjtKYB0c2m51OVmFSKGmTOB1eJbmWItxdZlPONzqXkezJlZJGVxdwy
         QHrav4rtqH5n0jsdDAMkFxIMhzBfp8G8YRHzo7OEab0CGUKvePhpDOF66uUuRD324Kzz
         NLjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W6RRNolVGoIhrXvYC7qRDGMNVRKGSUpHT0mWIDI2E03HkcU+ZWJkGeSyT4BzScslM6UfEdpull5cn@vger.kernel.org
X-Gm-Message-State: AOJu0YxjqkIFjSOScnLEfw+SlVy/7UURezmfUGO4NGuWANzRLbHA3mI7
	P1XhhZR6xxt1d1POBhFLtlF2UYHfgpUcllqcVtWsEsuCq9DuQI3/2xU1
X-Gm-Gg: Acq92OG2hIoL54z/3HJGrhk1okMa6GfaEztzyYBbFjDsp2W3Kewj7BeTrjLu+mk1WPA
	x6El9zSEs69oyIBtCiMcnOCFbZ6XN81RGKVqI3BdeIYa8JzQPklcnd88IAkpvUy+oin0qHnSHmR
	1wxFeta4okbTbNzePvkPL6gazlY2yyFOqg96Sh59mbip6P84etNe4Ly3JiFB5mu3T5Sb7mob+/l
	D/HVv5LI9nD4piuQEk6d+SIS+i6BXMmMGytV8x4Atr+PAY7qVFvY3MS1o4d6Y7zXgJhm7QzUHcB
	iQ8i6oQeFqpYI4n+3FwRdKYR7FlsZVGeE8P3orr3PveO+fnMX3pRY5Sxtq3WWbPeFrv6Zxv+xl7
	Z6ODFHKDu4Cupb4QtczvVw2f4beLqJnpYWcRd8HCCaNcQQ4PXhaQzHnGIvjFw0kXz9FRxekNtfI
	hlKpTMUZiwc5uBTRuv6Y0v+SgLiF5qzeFbPe1lCgM6jRUIZI12S1YW0uCGlDTSOiZxnryLrDkk0
	PajHCboPBaT4E4Uvwefz0UR
X-Received: by 2002:a17:903:196b:b0:2bc:7d09:dcef with SMTP id d9443c01a7336-2bf209a2d71mr9668965ad.29.1780017411611;
        Thu, 28 May 2026 18:16:51 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm389235ad.4.2026.05.28.18.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:16:51 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH v3 0/2] Add support for Microsoft Surface Pro 12in
Date: Fri, 29 May 2026 11:16:14 +1000
Message-ID: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v3:

Rebase:
 - Rebased on next-20260528
 - Removed ice device tree changes

Device tree:
 - Fixed C++ style comment in &i2c9 to use /* */ style
 - Flattened mdss_dp3 port into &mdss_dp3_out directly
 - Whitespace and formatting nits

Changes in v2:
Ice device tree: 
 - Updated to use 0x0 formatting

Panel: 
 - Add edid to commit message

Device tree:
 - Fixed formatting and ordering nits
 - Removed extra dmic audio declarations
 - Added suspected devices on i2c busses
 - Fixed incorrect usb regulator
 - Describe panel pin regulator
 - Added defaults for volume button GPIOs

Already applied:
 - dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
   (landed in linux-next)
 - firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
   (applied by Bjorn Andersson, commit 667d05a09db3)
 - platform/surface: SAM: Add support for Surface Pro 12in
   (applied to review-ilpo-next by Ilpo Järvinen)
 - drm/panel-edp: Add panel for Surface Pro 12in
   (pushed to drm-misc-next by Doug Anderson, commit 02f48ffdf96c)

Pending in this series:
 - hid: Pen battery quirk for Surface Pro 12in
   (acked by Jiri Kosina in v1, needs a tree)
 - arm64: dts: qcom: Add Microsoft Surface Pro 12in
   (reviewed by Dmitry Baryshkov in v2, minor style fixes applied)

Will be done in future patches:
 - Camera support (pending purwa cams patchset)
 - IRIS jpeg decoder support (pending purwa iris patchset)
 - Accelerometer support via ADSP (probably userspace)
  

(Audioreach/ucm2 changes for audio)
https://github.com/linux-msm/audioreach-topology/pull/32
https://github.com/alsa-project/alsa-ucm-conf/blob/9577cd31121546b288759097901025376141177b/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf


Link to v1:
https://lore.kernel.org/all/cover.1778498477.git.harrison.vanderbyl@gmail.com/
Link to v2:
https://lore.kernel.org/all/cover.1778822464.git.harrison.vanderbyl@gmail.com/


Harrison Vanderbyl (2):
  hid: Pen battery quirk for Surface Pro 12in
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1194 +++++++++++++++++
 drivers/hid/hid-ids.h                         |    1 +
 drivers/hid/hid-input.c                       |    2 +
 4 files changed, 1199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
-- 
2.53.0

