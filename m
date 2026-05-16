Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B379735E1B4
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922541; cv=none; b=XZ/3Pf6p/DI9jq1HV2DUw97ZeJScA+j9Z1SwltIM7xFWttBa1FQ/ZJtfFsxCSrhnzDboTXfMYkuwzQ5HvlwBBl+8vkrKh2X1nupjB/j29svcRd/V3+JQSnnsBoU3YswW5/9Aw9gUwAJmzBpK7gty3IIWSC8ewQ7sOcHww2jXvQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922541; c=relaxed/simple;
	bh=4LYuI7PmmbBjpToaTIydk7OPdf7o6Fc36uUJ0rUUd9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjqRYgzaykHgiPhr2bDcICI61hE7FTLWt03WNwa6fLRCUFhJE5uITeFYubHWQ8tTv7QaDG4riJKo2n1nrT7S3ersl0tdeU1FxufUeSIh2sqHykRfM3tt+UrMoU17YoA1wHAleNUnZwCXWolBYr4DlDEANjl4OCGZfJgWleF2pNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTwbfqWN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTwbfqWN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso1788098a12.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922538; x=1779527338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPNClhCqmVTU7pENbyz3GVKA8FIVl5d+7UyL83c1D7w=;
        b=JTwbfqWNVHJsADUYJXFAR2vfMG6Gms6NWSpccZA6qTdwbzl5LFZmqaV7mBayCxop8F
         rUeZdmxWCZgjLqmbQBfzMAo+7s+yTJ68iIESv34RKuew78Pmoi3KPKoDWAagdFbnS2u/
         lqXa1gzpWfVFoMzxECNZIOBHrheGRAzVAcTVyThm8qRn5WEupKIFBLpAZINoaJ3WN/1R
         0MS2VbETerNuHCfAmOlRfxPQ5erI0NcvHwfPXoFRYV3KTYjeSDB+HRrOIPBJqtywzOCb
         MwdFtpKuRHBSXDTTWwz+4hnwJoEDqZYVscn9nu7x+m1/uoa/zaab7Ft5JM6IhH+oNyuK
         pXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922538; x=1779527338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPNClhCqmVTU7pENbyz3GVKA8FIVl5d+7UyL83c1D7w=;
        b=BxHjKDW2iVmwWeFhHZ2IyEpDpFStiJlPpcsxyLhMzCH/NGfJHWWFWvARST0vuZlve6
         e9c785Z/77Jgrnpa2/l25mpfobM/AND4Bjs9S4QUXPQt+QOPgAzY7kNIHCrA0Lg5JCKL
         8zogsTynnKucEbJHeyRiY55OqU5TaQ8PUXcCAtOYXoNNfD6q5S1DM88VnYALEI0BA89J
         5pOqGeY6OL26yIPNHrQgov1tGTTmhojT7qCVsvzn5UD92URWNU9BntxOywDlbEBX2LKT
         T0kB5GLl0zWp5ISGozaXLCV30o76xaK2xPoV3cjd1LDEuKnVe39LVtEtQJKkLIOf7wVT
         FwZw==
X-Gm-Message-State: AOJu0Yx0Xiw7HrVp6WKnRByZMjLh/QdUjQ6WjzwHDwCyBOHKeHt9G/ca
	POyxz99ZTbCNgtfwMk4q13JkKpgWiPcMAvqwRT1UYvuJ5jZLjRBykAxwEaxQMOIT
X-Gm-Gg: Acq92OFRz6Pmp2qy3oZX/uBMnG+1nr6la6+k50iANq2bLK79lkLN9oo1cjh6MEpaPUA
	z1dZlIthBYjryKUIrM+ja0Bj2aDxa2Q/3J8boPGOEgjHfIELiJ5lMewt2Tb8mZrwI0jJLDEdPr7
	2u9lNsENEXgv57jzsvx/hHmbYE3zo9GEV0mrfs36fVWCagTO5e/iF09xQOwAK5m/B8oJqoPgG1w
	a8DvQvrN+R3S30UvrirQ4FVa1p7J7dRZOWe9ttULgITgfHbS5roq447pfypqM8eNhT89HwGE3rO
	JN/DcuHNGqVWXyaSbvFi1q2mriYT1bi6dZ29Rod0zaNeDnLUTJTrp3UeFVC1XyVKxcLvzMdEFPK
	rj4WHbq00X77lwzyQp08+wXfHmD86cJISPqHf6li5l6iyJ715Rr5FeJl5i8JpRnTzjly2n0sMLi
	nD8BZ9Rb1+gmDgeNjjncyLDxx0KkJjUqiVXDQUQtABQWEyqhWs4YvFw4unU3HHC3No8OEV+Fw=
X-Received: by 2002:a05:6402:11d1:b0:67e:53a4:5807 with SMTP id 4fb4d7f45d1cf-683bd08ff27mr3617514a12.18.1778922537621;
        Sat, 16 May 2026 02:08:57 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm525848a12.18.2026.05.16.02.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:08:57 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v6 0/3] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Sat, 16 May 2026 11:08:50 +0200
Message-ID: <20260516090853.2873223-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v6:
- Patch no. 1 - no changes
- Added a comment about reserved gpio ranges (patch no. 2)
- Removed "output-low" property from "hst_bt_en" node (patch no. 2)
- Moved common IPA properties for sm7325 devices to soc's dtsi (patch
  no. 3)
- Link to v5:
  https://lore.kernel.org/all/20260417084749.253242-1-zstaseg@gmail.com/

Changes in v5:
- Patch no. 1 - no changes
- Change vccq-supply to vccq2-supply in ufs node as it's ufs2.2 (patch no. 2)
- Val's patch for goodix-berlin didn't have effect on my touchscreen,
  therefore keep the touchscreen szie (no changes in this regard in
  patch no. 2)
- Link to v4:
  https://lore.kernel.org/all/20260305093941.305122-1-zstaseg@gmail.com/

Changes in v4:
- Patch no. 1 - no changes
- Removed Konrad's R-b tag, please take a look again (patch no. 2)
- Fixed vreg_s2b_0p7 regulator name to spmb2 (patch no. 2)
- Switched bluetooth to wcn6750-pmu (patch no. 2)
- Dropped qcom,local-bd-address-broken as it has no effect (patch no. 2)
- Added wifi calibration variant "Xiaomi_taoyao" (also sent board-2.bin
  files to ath11k) (patch no. 2)
- Link to v3:
  https://lore.kernel.org/all/20260224114424.1966947-1-zstaseg@gmail.com/

Changes in v3:
- Patch no. 1 - no changes
- Drop unit address for framebuffer node (patch no. 2)
- Add Konrad's R-b tag (patch no. 2)
- Link to v2:
  https://lore.kernel.org/all/20260216120715.3432191-1-zstaseg@gmail.com/

Changes in v2:
- Add Rob's A-b tag (patch no. 1)
- Add explicit framebuffer_reserved label (patch no. 2)
- Use memory-region for simple-framebuffer (patch no. 2)
- Fix reserved-memory naming: make node names consistent with labels
  and intended subsystem (CVP/camera/video) (patch no. 2)
- Convert mem-type value from <0x02> to <2> (patch no. 2)
- Fix s2b regulator comment style (patch no. 2)
- Remove unused gpio-reserved-ranges entry (<32 2>) (patch no. 2)
- Link to v1:
  https://lore.kernel.org/all/20260204115645.1343750-1-zstaseg@gmail.com/

Stanislav Zaikin (3):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
  arm64: dts: qcom: sm7325: Move common IPA properties

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |   2 -
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 908 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7325.dtsi          |   5 +
 5 files changed, 915 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0

