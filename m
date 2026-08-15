Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7341DE8BB
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754919; cv=none; b=t/GAkq3F/BKcNVpsW8MtF76WR+8rJOfz65ZQ8bJ6kfi8B7lMXWIt5AMD4B5XcoELq3BbFqUH95ZcMUMpBGyn9sd6alSjLvgEA5qyrz35TqzU32QU/541Sj7xAoxnOW57RAjlxIbvn8rN6TEZE9Q+SJu2UGx3ZuEeakxQCLbKgWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754919; c=relaxed/simple;
	bh=hHP58Dzogqq3qk/iH2DesTInIac5T9EHPwPG0TV9ehQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gossEKQjLSW6rLvbQ35MqLlBkjBvPhUdfMhEIK5E7iiKmbxfZLcujrl1KvXpgygNr91lcuHrucwEwRo4kG8o3jCxrsfaMOATQSdWYgTvzWrPg1LKP/2zp6+tcnzfeOTQUmvGf5CP3PTtp6LJhDGN5cpcb3V+HzKRFy15oE1eiSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpoyMGTb; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpoyMGTb"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb34c17b96so1228047a34.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 17:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754916; x=1787359716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qyi3VLCoapD+ocuJZoWd2FVKtPCQz8fzYPrWe0rNHc=;
        b=FpoyMGTbc/rQFApyNyBkxV4Ama8YEf0OCeMKiBwDCCdbdLcYmXi7CG5oS7WBuyugfi
         QAhGn31tgBpfASk2joJcTdvcuGUd4PztA/skuKXT2nOr7eSoCyxKgufkGYGaexuDzwSi
         gR0+Ahbajd8jhmXtcOsGrl4H92VAd8vruNcEz9B/OjxUc7FqOwVzg7+tLCu/ZbngafZP
         vebtTbzZzjPKPhsxqNVlWt7HDDC478E9E6jY3X9uJM3t6855VVTXYwL3M/mN0HcdsstL
         KWUnpW4r04umXrjVFTuwOz652blgCLVM3bMuyzYonpz9KgjI30hEKOsqxlZjOpay6uJX
         D+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754916; x=1787359716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5qyi3VLCoapD+ocuJZoWd2FVKtPCQz8fzYPrWe0rNHc=;
        b=XAzQET/elzyRL14yLxaGSsWL2gknQCQI2iWUYOj1BFksA2Xf6AlbUwj3yB2fFMQYa6
         Ia2MFSFhxT69Wg7rMyWgA1Bq0WocG7NVhYpGfrxqddyGFMFNd68y7DvWVtNLjIT2KjPi
         9YcHCBwEzQw9pz4g52RZOYCv4ocXkE55JToSo8GNK3J8fKXg0eMOVZAeePcNICJjicpD
         7dYwM9mYskUTTA8flb+00N6V665PB13VmtrhIBYPPpADnlKru0cCWoYQNmkJUQGBZZr8
         YM33TOg9448Q4WG3hqxhl55E9GHRyHmTOoihsymEOCFPch+8332bLsBVr3AfiKvu7Q5R
         vlwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTaE/PkvQnz4yTu/GTs7sUf0pyf2z/Vpe6cbmkpMft06aU89oCOVwO6vGhfOWGYdtRRXNVKpg2X29r@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJZ0WgX9DhVdC0B0TqXGu30n8N6eGcOw5ftVuWKY9AzcVa47K
	y7tvVayYhIQ8eyi0iBsoe6B1htwgFwBZyyV6/LZC6csWoJg8hEk6gNUl
X-Gm-Gg: AR+sD13eY3s27Pvbl3SfGk0egWqN47VhLsXURsHxto8eDTqYtmjtN+DSt2Q0AZgMmIG
	jXcLN81WZbbIid+gZwHo7qlYcAtCj0sq3MvFO/0EmBswZgZn7h0Z72zznajSd9Aoe8Ntj/yKc71
	0qk47wmmMwBETbyvCyncrdsF5ws1SQhBjZYIyOhWubCRxNXNk7xw7/Nvb87dHRUQ9DTaXgs9cnI
	tyZUv4Ekpo7PC8ASD7dJg191UQAn62XVL5J3tVA3f99RZWQGZ/DK1KVrOlSvyfqpwNRM1Huap0C
	rmb1tdNreQpb+dglpFBekb4d52JNwwyG2U/xkrqpAoDzQlow9tDKYCSOS3ll9D1BasW6qN8xppZ
	SK3FnkL7SX3ZwDCqkKf0bftFY8DBxjBNttFNeIU6q0hBMZq7MPgcHzQ1riaG8/drcQByXSc24IY
	4SP+hJLZcaekmfkIW2uwLkJC8fHkJ087jZO87woWRGUXCTo8aNTBKTEJaER+Z6C0puLUwGf4zbi
	rGx2jW2+/as1I+9GPZLurWGdyqmsbvz/1ZwR+620dLgy4BJxKplJa/l8m6vlsC4c8w13xlDIt6h
	YiVo80Qu05uHU95HL7R7rnB0/PWH308EZ3ESczPjXwKKuHJyUXUmqJHeoVzSqozWwP/9Gbt8uTH
	oCGmSs45GSEou/0B0
X-Received: by 2002:a05:6820:4def:b0:6ae:4d57:a5fe with SMTP id 006d021491bc7-6b0d6a8e814mr8699779eaf.20.1786754916100;
        Fri, 14 Aug 2026 17:48:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/3] of: mdio: fix fw_devlink for Ethernet PHY
 packages
Date: Fri, 14 Aug 2026 18:46:14 -0600
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBREr0L+2p8AKoJXMS5qmcoXLU1bK4Zwd
 6suX2by3kIBXhDoWCzkkSTIZDNUm4L0oOwVLH1mqsu6Kdtqx+F5eUhkN7zZKT2q/DCvHukuduR
 U8aFRrelgsN92lC3Ow8j8K5zIIrLFHOn8X7LsBh2/AVrXDxRpqZqNAAAA
X-Change-ID: 20260814-submit-phy-package-fwdevlink-v1-76a8f9efe539
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 netdev@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Ethernet PHY package nodes describe resources shared by their member
PHYs, but the package node is a container rather than a struct device.
fw_devlink therefore represents those dependencies with temporary
sync-state-only links from the closest existing ancestor device to each
supplier.

For OF MDIO, that ancestor is the MDIO bus class device. The bus is
driverless, so its proxy links never reach the usual driver-bound
cleanup. They can remain after all member PHYs have probed and
indefinitely prevent suppliers from receiving sync_state().

Fix both parts of the lifecycle. First, factor the sync-state-only
cleanup already performed by device_links_driver_bound() and expose it
to frameworks which populate children below driverless devices. Next,
treat each enabled member PHY as a consumer of suppliers referenced by
its package node. Finally, call the cleanup helper after successful OF
MDIO population. The real links from each member PHY retain dependency
and runtime-PM ordering.

This was found while validating an X-Powers AC300 package whose input
clock is supplied by PWM. Before the fix, the PWM driver reported that
sync_state() was pending due to stmmac-0 even after the PHY had probed.

The complete fix was tested on an Allwinner H616 board with an X-Powers
AC300 PHY package. All five real supplier links targeted the member PHY,
and no proxy link remained on the driverless MDIO bus. The PWM supplier
reached state_synced while continuing to generate the PHY clock. The PHY
negotiated a 100 Mbps full-duplex link, 8 MiB was transferred in each
direction, and 100 consecutive pings completed without loss.

Validation completed with:

  - arm64 defconfig object builds of driver core, OF property and OF MDIO
    with W=1;
  - strict per-patch checkpatch checks; and
  - the H616/AC300 hardware test described above.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      driver core: factor sync-state-only link cleanup
      of: property: link PHY package suppliers to member PHYs
      net: mdio: release fw_devlink proxies after population

 drivers/base/core.c        | 74 +++++++++++++++++++++++++++++++++++-----------
 drivers/net/mdio/of_mdio.c |  5 +++-
 drivers/of/property.c      | 14 +++++++++
 include/linux/device.h     |  1 +
 4 files changed, 76 insertions(+), 18 deletions(-)
---
base-commit: 3da8c3c8b8fa99505624b65ef590482f48e766b6
change-id: 20260814-submit-phy-package-fwdevlink-v1-76a8f9efe539

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

