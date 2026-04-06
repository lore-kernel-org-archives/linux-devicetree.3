Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574995CDF1
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470657; cv=none; b=DFeIxxRtXnfwAQ3CW1QME86YfTtpOOGkTmghu4EmJuuDjUoNTDr86afSf+xBAJiiT78j/TiBdJtQG0hAvnjhr6iNiCi6N5SXzRzC3DQIIaZ8hP29HQxFj63WxxUS6bOTTiGcOLRnOEpCh3WsdQkGECjS9D3gvv7KJsSGOfps/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470657; c=relaxed/simple;
	bh=63elwyNmPr3tbn5WCA3hlZKwTsIPJ2+6R496IOmWyC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HekJSNfnrhSCvE7Xl8rJhSHpLUTN97qsuf4sHvpf+zy6aZApW1KoOAa2PBYG/BpdNbQnP2VQKHBKphDfmaJV02abqqGh5gH9rd4+m+VafODzorq5I2G0ebjRUnP4aFR3szKv0gvbCAM0lgTQ+hkLkoB881Omy6P2dWWGKxZ7bqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NABoEtZR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NABoEtZR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35c238f1063so2244964a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775470655; x=1776075455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoSsEM5O4ac9h2V33FBAbsK6vxbKDf/9prfLiXzD3QI=;
        b=NABoEtZRw/fl0esP2t2l+j1PxdFoKLiEKJjPONaVxAvUp4O5KfkHz7nVDk3VA6mr8K
         G9NaFz6hrd/lgLxG5T2SpytOdo6O+hbyPfEGIan93wEPubjU6XGhSH5/1OFLGxu1zBfU
         eIK+Rcq8ORbRS5F8Liq4UYTxOyCdHFiD/CyvqSBhcNBtoVeIBD9rY0J9t4kkayI85Dxn
         GBNXjQBLUgxDcaB2pUXE6lcsDo8mwoIdA/HSId8KPtN7moB2W9YD3fgFP+RG/TL/3y0I
         /W3HLKvUenaQFMKZg7B+rxccwnyJt4AKAvIGrdcgMbCTqVKJBrVn/vpGPX8LNyJeVXaT
         3UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775470655; x=1776075455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoSsEM5O4ac9h2V33FBAbsK6vxbKDf/9prfLiXzD3QI=;
        b=jB8tOVusK+5LOXG2IwYcheAOmsrtgsQFboRBX/giPc11Jq4Mo3T0c2WnU1h0FgSTzB
         hEyowsIbgp//00Iu4mmL+haxWzeqnIYi6Vjj3m3cbmhQ1Ui6R7dkG1H5lkMhdWZ1vkbw
         Y/q7+GmbFBUUeRC4gkd3h1yjf9cQhkYQfvCtyvFKhfuM5g3JJmK+KyKkX8FNXjKr3waq
         ftIlt5B9ul+APx9jvNvQhVnJWZhQ2Or+6lqf72beMNnguhu4SQpDenoNUf/SaxUTs8Os
         9QM/ePJFhpcGH9F/tW6zAhC8aFnPtOXqfxp1Aky/4jDdMPJAnFc6rNVgq9JMs/isthOa
         861g==
X-Forwarded-Encrypted: i=1; AJvYcCUl3kr1fkR0A2jVdHu3lQE/1dHUhklyDZJpnMvIv+LhCFBWleAorTkTJBuj3lewimxwIOdHtj8yEo+z@vger.kernel.org
X-Gm-Message-State: AOJu0YxLw4I+LKWMAhUVwW4ABBR3BzRlFj99nhA2oc2Yn2yqodPMydEL
	d4l09onrzAR8Xaab0L0KL5QBWdksdXpvT3J/oN80XSZuNioF0i4pNFwp
X-Gm-Gg: AeBDiesV4UMOc6+Qx2pA/eT70mPpdvGs9owhcPjOirlFy1+gUm0sxW2hdFkG2EngH5s
	x5DsYK/T1MS+/Plp4OwsROzQuC8q4FCOtc9S/Usk9UAitv43CJi/O3GeRYcs0BIzicOtktTP3Cm
	tHGVB4wivsbFAjwLOXpOIYrPownDja84RT+ShBqw7eUBegIEMzG8AW61xB+ZxXdtdiFA8C3IAOo
	OsbmylKmJHg9asSd291OG/2znefAAXIJhCdrntvkl2l58D1imQMZcNsw8wAq46s7ML07zCJk8xL
	f/HXhqy80+IQ5gQ37VdQwpIPqTuUPyf7qkcjHLmYkwRHYC/J4caoM0D9H6SbB1FAp6DHUJaS7w3
	K7fZvk8aEbC72zR/U3/k4m8B67xqKGI4130OxoLeijDa8JpBfpIx/tVVp8/6hP8aqnMUEpJM+KX
	shO19iQcyg++x81ypeiDe3H8zMb1hOdAVc80PMO1r5K24u
X-Received: by 2002:a17:90b:562d:b0:35b:c900:79a6 with SMTP id 98e67ed59e1d1-35de683ad7bmr11330437a91.4.1775470654643;
        Mon, 06 Apr 2026 03:17:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c94a:aad7:a860:f869:a68d:92e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm23332527a91.5.2026.04.06.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 03:17:34 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 0/2] Add support for Infineon Digital eFuse XDP720
Date: Mon,  6 Apr 2026 15:46:45 +0530
Message-Id: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>


Hi,

These patches add support for Infineon Digital eFuse XDP720.
XDP720 provides accurate system telemetry (V, I, P, T) and
reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---

Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260401104550.115715-1-Ashish.Yadav@infineon.com/
- Fix commit msg, added missing supply info in devicetree binding document.
https://lore.kernel.org/all/20260402-enlightened-analytic-leopard-ddc512@quoll/
- Fix .m[PSC_POWER] value issue.The divisor value is 10^15 rather than 10^12.
https://lore.kernel.org/all/258dd77a-a8d9-4540-a32a-91a3f13c6ed5@roeck-us.net/

Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260330102345.37065-1-Ashish.Yadav@infineon.com/
- Fix make dt_binding_check issue:
https://patchwork.kernel.org/project/devicetree/patch/20260330102345.37065-2-Ashish.Yadav@infineon.com/
- Address reviews comments for infineon,xdp720.yaml, Kconfig, Makefile and xpe720.c:
https://sashiko.dev/#/patchset/20260330102345.37065-1-Ashish.Yadav%40infineon.com
  It includes fixing of extra space, non-ASCII characters and use spaces
  instead of tabs.
  The xpe720.c driver file update with DIV64_U64_ROUND_CLOSEST() and 
  MODULE_DEVICE_TABLE() as suggested in review comments.

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP720
  hwmon:(pmbus/xdp720) Add support for efuse xdp720

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  59 ++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp720.c                  | 128 ++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 drivers/hwmon/pmbus/xdp720.c

-- 
2.39.5

