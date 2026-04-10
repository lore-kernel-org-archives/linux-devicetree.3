Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511530B53A
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804526; cv=none; b=bwM0pbbTJ5rgIV0DHYAMgoqFDEcmcxFlELia1K5IyKXuoJIArY+UsVQMvhdBR0zeMCUorIcGeC45k9p/rm/FVGgI0B6yoxYBVRPUXiGrcvgDSFBOmqZCaOzGBKDZXRsbhGGczeEeSKE0y2Z+AQiNsAz6EqmjPvku9uUyzu8lyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804526; c=relaxed/simple;
	bh=7Y86DDo5VAMBiAxY2PuF300xq9sbLZaZNgSm5f2SADI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPcAAvuR/GQtZN3BhfOUjC9umIvZH6M5HEmVKKa2hSGnpxSi6Q93yqMjcShUheaSnx9/gxB7Jgw8TLN/9uq7KIpVA8fd0NXAAmHP99kHzBGe1D60AFUNreFf3PW1ah6Nn6CIHj9pUFYcU3FpAcPUNHm5EDk7l1jmhZIyw8ldBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crSUlu3D; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crSUlu3D"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b23fcf90b2so16765995ad.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804524; x=1776409324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xcIRlgzl419gPL55350Fr2NFng9A0BPZpNjuc0Pchg=;
        b=crSUlu3D2DMAHd5h3TmrIzPfZf/V7U7TsTh0As513A1tM65p4FfDCOWgBt+BWZvcz6
         K6PyJTHJ+q41o81twglu08Wzk3O6fxFt8yt90kBI7C7ox2TYNu1Y2mXYyXy/LYpjhphJ
         kXb/KgvRRiZ9380or/xkusa+lz8r30bTq1Bcbpk62t4YpAQr1Nj8z3SqYrkcVoQTpzr5
         yDh/wf88pNPgUjuvaeAblPTOkU1f33bdv38Ni6EjWV8YNLHfCb45UYyrwnJ+aYHq6nOK
         zDHfbboQkKiw7GyVjfzCOiCbtOZ+m/HRlkCpVdYUcZOAsPb5OGUMRSRmAedPrbSfcwu4
         Y1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804524; x=1776409324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xcIRlgzl419gPL55350Fr2NFng9A0BPZpNjuc0Pchg=;
        b=Xp1HpAP/h6d8ncyJE+kHiMNCXeUk5jukxJQpd+FrJLKeofaG2No4/uTxsQAMpOUx2E
         azT7zF3MQaAko8XiIZ+l7n5bjWe2CALG4zDAAVawkl8JEbvttcCmTTr7lBZWzMq7fqyQ
         z39CL4xIo2DI1mrIGFhDC5M6TauG8cF4Mj0a/gJExZZpYDUPKlg9VnZfBoyAHGmuLycS
         i6iwY9xFe/utp7QaT6quAgsUgv0nx6kA+LiRFNPEJQ4gtst+a8T4QQ2Iv6y1KrfC8Um7
         GJiJcd6v2nq1lYEMLQKl+zUJHBVciSEq75tqK3IxAbtSGccH80k6O3kmDuu8hwn9zh7q
         A1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUiB9XGh7oJ9o6lLAjeZKcE6J6/+kjhByw1rh2g1y11pOnZJdajUVd+nPTKYwYeiuN2jW8tT+/NzuWi@vger.kernel.org
X-Gm-Message-State: AOJu0YzqC5T5kMDwkRmkEofJb8+moCPJ1xNJ3niri7QiSNg0MdD27qS2
	bfERk5S/9ei8Tftr9b7wzSkmtsPubuuqcvNdeWF/V3TztBDO6zJBWSS3
X-Gm-Gg: AeBDievlWp9xnbfUTIbmj03NZoZobiONfo2HqzcLbw5vDp3TUprfWn6J3EuY+LJR6HD
	500kIHPti4i+IzfdOOLHj44F/E8SvU9PJOYzTN22dsidUVDjimTnr2gu6D7bNzEZQkhRq2win3t
	6JnBfpm1oslyhMS971bRjqeyDXk8FqJakkvHLafSf+3H75lJZg5vIBpku4bKmw/NDQ3m9ClUeDr
	R0J1GqS53ni27ShcH/t6fAlVFDyg7u/2rb76TUM2Kx5hCSZncOCfF/stiC7smXf+VboVh2rqAH8
	7jlU+wsBA/M31mvBkFyoyAupSsJ4coXTqn1HgHINIWQByLaPxlUHVyEDmUCkQrjZcw07iIiS6Ia
	dJT2t0yy+0SQuY/25WyYs7UOEk83lSofBJ79TcSuQp36qcjXvjupCibpc2f6yNvXZLjElXldfKF
	LlKoj4LX0ggxtRRjhPKytFkdMteyOQaMpJzhoObAvzz+Qoyg==
X-Received: by 2002:a17:903:32c7:b0:2b2:4d78:eeb4 with SMTP id d9443c01a7336-2b2d5a29f2bmr23218675ad.22.1775804523970;
        Fri, 10 Apr 2026 00:02:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d025:c808:7be3:a746:1e98:3ec7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f09e85sm19310315ad.47.2026.04.10.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:02:03 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add support for Infineon Digital eFuse XDP720
Date: Fri, 10 Apr 2026 12:31:52 +0530
Message-Id: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
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
Changes in v4:
- Link to v3:
https://lore.kernel.org/all/20260406101647.109667-1-Ashish.Yadav@infineon.com/
- Fix commit msg for devicetree binding patch.
https://lore.kernel.org/all/20260407-monumental-mastiff-of-sunshine-fb27ab@quoll/

Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260401104550.115715-1-Ashish.Yadav@infineon.com/
- Fix commit msg, added missing supply info in devicetree binding document.
https://lore.kernel.org/all/20260402-enlightened-analytic-leopard-ddc512@quoll/
- Fix .m[PSC_POWER] value issue.The divisor value is 10^15 rather than 10^12.
- Added devm_regulator_get_enable().
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

