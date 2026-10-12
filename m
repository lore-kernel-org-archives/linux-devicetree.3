Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E631049B45C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818655; cv=none; b=YrxY5D52l1sl8iKqS3DXisyiwp8Tx/RkUOGESyjK0ID7G+0Atg2GueUzm2so2/AbQCOs3+rgAmkmbG6snuELwqnlrMjE41xgX5L/keDPsoJ31amYiTGuHvTCzLpkWuL21QffKdCuYNdrQZyQnSRTEyj20o1iDE1gim4Tqh1YLzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818655; c=relaxed/simple;
	bh=BPhVdVn3lLt61EeSVOe16izIdtSs7qr03SzF+WwtHCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRluVA0z/GtcxzKyrg6OpSwnQBw8qu0E4I/IAWSPxAISNfEtviA0+TJL4LJC7z1gIHJpm21FKJSy+dTTdt/uMBHTSbSQx+ZVsWGbxH3BmAxvJtNLmKN2mLnYGMGl0t6i8sNmFpTgZuDMHqgdm0QMIu1dJ5qFP9XhmiYqv6tj0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=bOwDZSC2; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="bOwDZSC2"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso21848936d6.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791818653; x=1792423453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6I52eyh3zXooRwST5ZWSSAFFlPV3h5qGgt5QWGPanM=;
        b=bOwDZSC2rj+c3ezEzOHfRPBhGeCI8SfoxxyWRcika+9MFYhfPckKfWNqrX0bot4NT+
         Fbgwk4zI2Un7rCx8rgabW8EKimZr12QCZS9K4zXS9vjOpQbEs4/zSb/FAPM5wz71hN0h
         CmQOM0bVR2sIiqrbK9LaF1haZFtMBbm+iXycTH+ElH7K/xBTfK1oCGuqsFIrWKRP8OP6
         hBUWdIZsC+NQa8+QBLE7MLLIU5aWNjHKtw9lfnPQ0ZhFLP6wK4mwKZAKmQ44k7GY3rat
         AUxX+bflAbSkzIth0S9qLb/aVVK4mLqTbHUTlSV4Zt3X6vZFll8dK50RLj/PFS3Z5Rvk
         yTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818653; x=1792423453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6I52eyh3zXooRwST5ZWSSAFFlPV3h5qGgt5QWGPanM=;
        b=ueO+ILS8K5/aBp2aqBNtkf6ptINhgJtSQPibPehx6nmlsDLL/+3uCkGe7b6+cvuuka
         URsf22/+s9jQ9FaiIAgwJt7rll0peYTQvH1EjTBk/j9Qfypn90uZj4GKbgocCe+qkVhI
         89FlGjPiLVyg5xVYuiZXEmjdhyOCmgnpIWk87newm8AfUdf8rmbFcNgNObOqxVUvr1ii
         bLKvLVU2PLZtRGQ5oD28hq78uoSPvyOrD39Q+0mIYXxevXoD06IneTDH08eryxbILa0m
         QKAYGnvyvQgDiKuSV9nDdwUf5gpNCoSSDx5JowroJPURZuUkV2ahSEXn76sbinOK21W3
         VZyA==
X-Forwarded-Encrypted: i=1; AKwUvBygdBbGlZoZXv4EreRAr/R0sUE5DVTLeh1ulG2t4QNpn/kZNjQeMjYIZrEJgAMNUdU13f/timYsuyL/@vger.kernel.org
X-Gm-Message-State: AFq9FYLOwhVXiuSpwGGvucNd7Tv5v5QdpLCZv/V6xHc/4cZAhpoqXWD7
	srqs9l3k9d9MkNwfVIpAGBMhUEegmQzLgm/3QkILX5CUZYXO4+NLMDAY4k9Ahto6EBs=
X-Gm-Gg: AYBFou3wsHqjuyg2efgLnWxDkoe3S55tJOxNGyMOHf6/NldkJSTh5ZdOmDfabJco0kR
	3Wkw8V3B2CojB7ZNcgrSJkFi55yml55PynylLJhZ2PbzySFJuCw8EjdgegUN0Zx2JYve+B9IZL9
	qJ3r4wizQ26p41xtqzibLFxyaxvybsqb+4Xf+GJbJCLBJDJiUme2Gvt7v3bNLrPFE/tcQPAyKTM
	vWerC/lQhcMzIMyj+c1RUdK4g+VMK8AKadF1go++TefmNZgBSH+3MfV9IE7zNygURiHiaSMUbDo
	67Q1Cnq/6hXMHnM1K1lhIN1LtY32SRohwgI900b5ehZi7mR0UwmtW1xO9k4bXA+i28bwxBvJti9
	PQekzB+RIYXPNrlG3UAmG3D/KcWTBnwIouf/P61snoPL6TVCL0zx69P/O6Uma2IvDzRBavdbqw1
	Ji1kOhELvRpdMi+JPTGvJFlHtkwAGysrr9iZz8jWY3TeJSyvZPwEhh6yNi5s/YIBojvO8BzxvH5
	HXwz+curebjBA==
X-Received: by 2002:a05:6214:2b8e:b0:91b:8d97:122 with SMTP id 6a1803df08f44-91b8d97039cmr23749566d6.51.1791818651854;
        Mon, 12 Oct 2026 08:24:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97178de2sm659086d6.0.2026.10.12.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: introduce TC9564 clock support
Date: Mon, 12 Oct 2026 10:24:03 -0500
Message-ID: <20261012152408.3729237-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock controller present within
the Toshiba TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of clocks.

Both TC9564 PCI functions can provide PCI endpoint buses via
devicetree.  Each PCI endpoint bus provides access to one of the
function's BARs.  Subordinate devices (like the clock controller)
can then be defined as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the clock
device node.

					-Alex

NOTE:
    This series is built upon linux-next, with this patch applied:
      https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/
    The series (with that patch) is available in this git branch:
      https://github.com/alexelder/linux/tree/outgoing/clock-v3

Between version 2 and version 3:
- What was formerly described as a "clock" node is now "clock-controller"
- The clock-controller DTS node, which dropped its reg property in v2, is
  now a sub-device of the config syscon
- The config syscon is now (also) compatible with "simple-mfd"
- The clock-controller DTS node no longer defines a toshiba,config-syscon
  property, and the config syscon no longer requires a label
- The clock-controller now requires a (parent) clock property
- The header file is no longer included in the binding example
- The binding example now includes the definition of fixed 25 MHz clock

- The clock driver now gets its regmap by calling syscon_node_to_regmap()
  on its device parent's devicetree node
- The clock driver now must its parent clock from devicetree
- Added Brian's Reviewed-by tag to the second patch

- A new 25 MHz fixed clock is defined in a new patch, and is later used
  by the clock controller


Version 2 is available here:
  https://lore.kernel.org/lkml/20261005230927.2000398-1-elder@riscstar.com/

Between version 1 and version 2:
  - Previously, this driver also included reset functionality.  That
    is now in a separate reset (only) driver, which will be sent for
    review separately
  - Dropped the "config syscon" devicetree binding
  - Reworded the clock binding description to focus on hardware only
  - Clock IDs are now consecutive (no more commented-out values)
  - Get the definition of of_device_id from <linux/device_id/of.h>
    rather than <linux/platform_device.h>
  - Dropped a comma that followed a ternminating empty array entry
  - Config option COMMON_CLK_TC9564 now selects MFD_SYSCON
  - Clarified in config help text that the reset and stmmac drivers
    are the "others" that use the config syscon
  - Moved the clock devicetree node to be a peer (rather than a child) of
    the syscon node.

Version 1 is available here:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

Alex Elder (4):
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock driver
  arm64: dts: qcom: define a fixed 25 MHz clock
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  65 +++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  22 +-
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 268 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  34 +++
 7 files changed, 409 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: dc44eb73f8da11f478815bc29b6509a6a4c5c35f
-- 
2.53.0

