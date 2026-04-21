Received: from mail-m3274.qiye.163.com (mail-m3274.qiye.163.com [220.197.32.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4040DFBB;
	Tue, 21 Apr 2026 04:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744177; cv=none; b=I2rAU4nk0kxFDOJXoceiYjNgtANPQmDd5oKlppkEueSwnvCjYEcadaqyB6dr4svCsLRHh35z/QrEv/DFjxmJwNexnGzTOnSXoJm2cjEEKEwXGdCfXdxjUgGH2uAv9iHBllbWYlaHrpvTKSrxTZeO/Da+DUGv/y/mgVfucX2kdc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744177; c=relaxed/simple;
	bh=kuQ9mAJhHO3toVWCIzwiPfdzjzEd/llakKYNNlqj57Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cLwlldxIB3gBe7gNQTj+OiGzm9TnUQ3SICC/WTXAYLUnM8eaYTklb/PKTIAXnWlRXCWzVfttNLRq3Snqz3YLcEVfQjiO4gyGbkvUcxHwDpQ0s3UWlsR6/X8pB+AjjFRa73ZWjMhpOmh5dBFKeK2gHIbtQvDoe2UOQJcLWQHlc4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CALqJQmg; arc=none smtp.client-ip=220.197.32.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CALqJQmg"
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3b7d20866;
	Tue, 21 Apr 2026 10:47:04 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/2] mmc: core: Parse property for aggressive power management
Date: Tue, 21 Apr 2026 10:46:49 +0800
Message-Id: <1776739609-122962-3-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1776739609-122962-1-git-send-email-shawn.lin@rock-chips.com>
References: <1776739609-122962-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9dadef263909cckunme87b03509c077
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTktJVkoZTk0dT0IfTkxPQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CALqJQmg0t0xnbTiLJuR/8cJWyEyrOE0wya4UBAeTlwdmZw34wvCE3jHNi63ebIiJ7poTOYcvGmtUJS7XZrl3DUiqo0R8bNZf5+Snp+rtlA5k13xmcmijRHBrPKLr4Uel5P1PwbJOz7wxP3PS6zn0XvXsV5zUgbxqdb+qOqv2XQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Q5vdkvi3ASXv4JcxMeZ1av2GN07KB77EJsVrauqVbFM=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Aggressive power management is a framework-level policy rather than
a host driver or controller-specific feature. Currently, this
capability must be enabled by individual host drivers, which has led
to inconsistent adoption and limited real-world testing. This
all-or-nothing approach is inflexible, as the optimal setting depends
on the specific product requirements and usage patterns.

Introduce a new device-tree property "cap-aggressive-pm" to allow
platform-specific configuration of the MMC_CAP_AGGRESSIVE_PM flag.
This enables more aggressive runtime power management strategies that
can significantly improve power efficiency in certain scenarios.

However, the benefits of this feature are highly workload-dependent.
While it reduces power consumption during idle periods, it may also
introduce additional resume latency from low-power states. Therefore,
it should be configurable rather than hardcoded, allowing different
products to balance power savings against performance requirements.

By exposing this as a device-tree property, system integrators can
selectively enable aggressive power management for specific products
or use cases where power savings outweigh potential performance impact.
For example, it could be enabled on battery-powered devices where
power efficiency is critical, but disabled on always-connected devices
where low latency is more important.

This change provides the flexibility needed to optimize for different
market segments and user scenarios without requiring driver modifications.
Existing drivers that previously set MMC_CAP_AGGRESSIVE_PM can now
remove those hardcoded settings in favor of device-tree configuration.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

 drivers/mmc/core/host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index b7ce313..abe61c7 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -400,6 +400,8 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "no-mmc-hs400"))
 		host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
 				 MMC_CAP2_HS400_ES);
+	if (device_property_read_bool(dev, "cap-aggressive-pm"))
+		host->caps |= MMC_CAP_AGGRESSIVE_PM;
 
 	/* Must be after "non-removable" check */
 	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
-- 
2.7.4

