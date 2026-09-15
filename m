Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77134BE435
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495819; cv=none; b=lfG+t7cMV3oNL4JlUsiuR7gz88XdTjHLLRLGA7526i65T2usFCACluVycknwxm5vdPkmE4kp6XtgUNzMdaqtn9eiptoWhehAp4nZxT/jVJNDpnj3SAhbDCiOrlAcTJCe/8/PUQ8DvIwfeSXlOnLbuAAoIwuzQVgX8R23eDWzcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495819; c=relaxed/simple;
	bh=z8HNl0xymtC9OMb9m4yWES1OaOT9HUEDb8ymvvRc7Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7QvC20CGvrNOFIRJ20KOjb6GKpIbNRQwjtGYRlaS+4+6cVePK0bjeANCY0Skum67HNa8HMTCctAwW4mO71DUbo+o6e14nQ0ZwX+2R9wLeIMSkw8q66LJPqSt4hvViWBM2Qo0q0aGxzqGDYj9S9Ze1CfAN0eI3pwOX3m0arfo10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=SzCA8IUm; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="SzCA8IUm"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-939922847efso8449885a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495812; x=1790100612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=22xfVV5hCviOiMQtMKw9vaS9SNxAHQv+tM1KVgQ9uIM=;
        b=SzCA8IUmoQ9ZYG85USPg8wdsLibCOnCyr919jnxtJLMNW1VS0NgN0V0WGA1QODzXxt
         3+Nh5zRpDiS9gQwHs9zIGK69Eukdve095ubRQWxBTKxvlHeBQ6CMzBANGqeDuVjlxrYJ
         ERG25Fs6Ls1y3HVQ9OYD+OhD7zcPkrs0DTgHcSgsqxZBVeHAJiYxF+ztGHpo8V1vOnQM
         Q7OPuNuxm2Enj753hB19YdLKuqRfMlan26zciN21qhAT9bb5/CNXQDtk3+j/HMLo87PC
         6yc5MrC1oIszqvn2FB7RXhohWGxC54Mr5C+uOtSYZm7aUCY9yRMeDo572BTCmTnuerQo
         +LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495812; x=1790100612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22xfVV5hCviOiMQtMKw9vaS9SNxAHQv+tM1KVgQ9uIM=;
        b=A3dqR+yjhWGeGFecufqnXhFhl0BubfGveBf6mnP0Z6Q/HS0+jYwrYzsuJYvG5QhZ+7
         vXEa65PMrG3UpKFL33MAopmHax85AefKKnR+fwoTeE0jQp5mMQ6Li5+jXfgNJiSHzVy8
         unTH8Sxa9hRAMZ/H57pIFNz7R7AYssb0EZpLV9B1CyJVJKLiExQAs4iv/9Y7YkGk+Nc3
         UDKgFaX72ur7p9EvoxjawBdK7ytw5engZjAXX5ZfI6n4F2Axu9VlPoLDprBHXj9xDpBf
         c8Yy9pJ4VordTVSpHbQDWxG3ImlRK6AmlkjdgEwZTJe7eh+xThso/2zvzuMJdyknjFtb
         BVng==
X-Forwarded-Encrypted: i=1; AKwUvBzt90SXyeS1SJJSKeLsPt4nHq3Zs9b1LolwHB1SZnLF0SOidSh0tILw2lyVzMA6sijiyoEan5QlC3l3@vger.kernel.org
X-Gm-Message-State: AFuF++mjMEBCTxHXtG4uA7WOl3NsrxP16bK1irNbewqZAcxKxJTQas+1
	AUx+ZtE5fQMMTRZiwPJ//poeXywmrecFgp7yHj0MO3zxsVZRaD6zJtpuDqZ+a4DmXsQ=
X-Gm-Gg: AYBFou0YhQHoyEslwv3RSFcVCVUj3XCTN7ap76C4NQh03viMZ+bq9zbVdaAbF7usdEH
	1wuLxNoICE9dhURtX3krxIo3hF2JNZ1J2HR6leTRPrvXDmGDolqtOgG7P6qblieaF3YwwF1RLlB
	pO91OAKi2bpH+ArgKktkVvhXRYYKVz/eGNUaNvm9zDOtY3kAQG/7p4qzLym3GGChKiMykmmUR1X
	XEVEUzVvC7diR+upNAU8MWPb+t4AC1YgREGbtJNGothFT9hOmxm6DtMH7CPHanUevk8Zm6Dc33S
	K+U5JZ8mZ51bZC3JhfExWrQaTs1JtOHGQh0Xwmfr786bZQ53idEib6QX9FVLP6+S7WtMNOrmmPM
	M7TCA8yoFT+5gNgUpkYw6/qJORaaV9P+5M3tZMyt4muh+TaXrMYMUMh5XlDHqCI4u8yoaS+HHMR
	dkulO1GSItccd3iVIvflDCVEL6Q4rsg6tEqPeoa6T5hRBB3jGm3DXyV4kvSlcdj0IQ2eCKB6uDz
	ZM=
X-Received: by 2002:a05:620a:2809:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93a40752e39mr312131285a.5.1789495807276;
        Tue, 15 Sep 2026 11:10:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] PCI: introduce TC9564 misc driver
Date: Tue, 15 Sep 2026 13:09:59 -0500
Message-ID: <20260915181003.1633543-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Toshiba TC9564 is specialized SoC that implements a PCIe switch as
well as an Ethernet AVB/TSN bridge.  It also implements other functions,
including a reset and clock controller, an address translation unit, and
a few other devices.  PCIe BARs provide access to registers that manage
these IP blocks, and the SoC is modeled using a PCI endpoint bus in
devicetree.  This allows the IP blocks to be bound to platform drivers
using MMIO through the PCI BARs.

This series introduces the simple PCI driver necessary to implement the
PCI endpoint bus.  It enables the device, enables master access, and
then scans the devicetree subnodes to discover any devices defined
within the endpoint buses.

The driver is placed in the "misc" directory, following the practice
of other PCI endpoint bus drivers.

This version of the series was sent quickly after version 2, to just
address some very simple Sashiko-reported observations before others
had a chance to comment.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 2 and version 3:
  - Call of_platform_depopulate() if case of_platform_populate() returns
    an error in tc9564_function_probe()
  - Eliminated an unnecessary dependency in the Kconfig file
  - Updated "parent addresses" in the DTS file
  - Fixed a dumb typo in the binding
  - Note:
      - Ignoring the Sashiko report about the place holder ranges
        possibly not being updated at runtime.  (The above-mentioned
        prerequisite series will cause them to be updated.)
      - Ignoring the Sashiko report that the pci-ep-bus nodes should
        include a reg property that matches the node's unit number.

Version 2 is available here:
  https://lore.kernel.org/lkml/20260915031038.1087264-1-elder@riscstar.com/

Between version 1 and version 2:
  - Updated the block diagram in the binding to include BAR2 and SRAM
  - Use KBUILD_MODNAME for the driver name
  - Removed bogus initialization of pci_driver->driver field
  - Added the third patch, which defines pci-ep-bus DTS information.
  - Now based on the Qualcomm for-next branch

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813222943.1655453-1-elder@riscstar.com/


Alex Elder (3):
  dt-bindings: misc: introduce pci1179,0220.yaml
  misc: tc9564: introduce base PCI driver
  arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses

 .../bindings/misc/pci1179,0220.yaml           | 154 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  30 ++++
 drivers/misc/Kconfig                          |   9 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc9564-pci.c                     |  84 ++++++++++
 drivers/pci/quirks.c                          |   1 +
 7 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 drivers/misc/tc9564-pci.c


base-commit: 27b3028b7d65cbc44fc5b60d2e977ce55cf186f1
-- 
2.53.0

