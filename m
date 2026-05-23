Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605C3644BE
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525049; cv=none; b=vErf1NuuYxBxWCzltOZQEAkh7qy4aB5hSo8zAcmLah9JGQwAoCgvN4fd9OMCApWtbH6fufEGx9oRmpvPfJHm2fwpWoW6JTl5tEaTa0j+mqRLUAcvgGoEs90+SB5LMw3Y1OY87BG41jQiAzvge/n0ViTmY0/Zkw1fJAmVpum4unI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525049; c=relaxed/simple;
	bh=O4o9ol0z9p1ozuLH8y297KGzgYwC2IgBRXVV6czRJHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvOeOgHj+ZrDp4pVKFDcG0quXEDySRHZL1H4ldM69NadZsgK5K/XCrO7zRCARZEqDDqQny+aD6muE96Xh69r1jcPNl2r+kcMJk9YWFAhPLqvoNUd9xqMiYDnhTdB5x90okK/nW9K7E0Rrb2NfA1zSCqLFv2erhbTYv2ZzbeOyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imnVYIMh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imnVYIMh"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so13273025a12.1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525046; x=1780129846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWj8ptSzNBKrFt1mxoQKUyY2RzDOkBP4g8UuTE+1+DQ=;
        b=imnVYIMhBy80+n7Te9lWyG3Wzocdx/9S3tLruB550EhYCV7vdCLl3PxPqaWxqFBIif
         8zSzmZJNXVGN4nl1AvL1qfzzW7mFxt1jzmKAELjnhYDomx4NAyKpxtj4HygbSVD+dIkB
         omInIBLYdW4t+mCSCmAsiReu8LQ+EbKwV0/T4Pxn+N+ACD3UZ7Bmwns83CLVbXtRlK7s
         1B3unh30uHX/yvuQDfOw8ddYGp/ROIu+v4DBbRKpZRROBte5CUYv9zZBnD1C34qbUzwH
         4R7e8DfybL1GNBFT4ihZbtbnQhHXPtXtNT7MprS/F9vl7fpYx43K1nb4VFuPMba9DzSf
         sCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525046; x=1780129846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWj8ptSzNBKrFt1mxoQKUyY2RzDOkBP4g8UuTE+1+DQ=;
        b=o+IWVybNS0eOV4ejxXhqQ8IE7LdBv2Om+Q4so2ci6K9iqCFB/EUnaee1uG/FVaPU6V
         cq5+D3LeSe11eFGrHx0cLVIu+jDJsbC3tpkq+Gv9WVaDq9cIZcFsjXe4vbjRjnYbehP8
         Ha/wB8USIX7sKeHJroqovUn+rUX1gHlkUfyCFOZGHgbmffbKqgC58nACIYT4IR/bMR+I
         Ixkb+Df2eMUzd1CAsXHE0HgJOTKQSXWUuE6oFN67flQhLW09S5+uv7ZVYqPobpa9OlS2
         GWQH/VTBoP0BQ0Oe4wmgZkPP4BllcDfv1zu/bI4lWhbPlMbNk1zfwiEL58rGBKzIc0fn
         +W0g==
X-Forwarded-Encrypted: i=1; AFNElJ++hFTCLbL/4v687v0FxBFb/8TOIPMJVfVOywttq8rt/aEhXoiR8sGCF/z08CpxnXozCcE5b12U3ZJp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9lwK54qhblGdnANfWmyHqTIIUgclqtxR+9W7Wh+/Nh57/Mku
	Dq1dnj+Ecg0lEG9egjnI4qelrxdGh/JkfS4RwwGuDPpS27kbRSAje6Eb
X-Gm-Gg: Acq92OFN1DKgvsGvrfmT1c55bS3wehVXxIcR5r8br3tYQOuwEFDBF3FfJkcBMO1Vk9I
	QJFxjuc1aXz1iNDS2JXf05scndvbgYhiR3sXWfwZKZdTt4/xWhHIF6LW2Yludt4Se/Z1S6WoCcC
	49OAbFcIktoEywmAVxskkj8fKBG5sPPf3s5Qmv356LvjltYIPLu0ZFS8ojwqkylSx22J+LJB7c/
	D4m++rsUeyqE+mGe/PlpaCRM9gK+BvHyt0yI0ZxkAaRGJrx1dlCTAA72klKdgOQXP18XieNvF1V
	u2klsp/l/fnPf+au49NGCkMzW8QNEPqxQmoRGlgpAGFpRi2Lqx5fklZfQXd9cG1d2t0D65qljjh
	h4JkT3+eZW8P5cRIvxfAMJJTk2Tykzbfl+2AQCp6SK42Q/gUAPj5x8+5ONptNJctiNqXvbnvczW
	N4VFEWV9nqwt9njC6/t4OMZEQ=
X-Received: by 2002:a05:6402:3719:b0:687:285d:44a8 with SMTP id 4fb4d7f45d1cf-6889c453fa1mr3595245a12.14.1779525045838;
        Sat, 23 May 2026 01:30:45 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] usb: chipidea: tegra: Expose tegra_usb structure
Date: Sat, 23 May 2026 11:30:12 +0300
Message-ID: <20260523083013.46372-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_usb structure is platform data of USB controller and is required
for proper controller malipulation if its init/deinit is externally
controlled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 13 +------------
 include/linux/usb/tegra_usb_phy.h    | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index a19cb3b33bf3..109c4afdee4a 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -16,6 +16,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
 #include <linux/usb/phy.h>
+#include <linux/usb/tegra_usb_phy.h>
 
 #include <soc/tegra/common.h>
 
@@ -23,18 +24,6 @@
 
 #include "ci.h"
 
-struct tegra_usb {
-	struct ci_hdrc_platform_data data;
-	struct platform_device *dev;
-
-	const struct tegra_usb_soc_info *soc;
-	struct usb_phy *phy;
-	struct clk *clk;
-
-	bool needs_double_reset;
-	bool externally_controlled;
-};
-
 struct tegra_usb_soc_info {
 	unsigned long flags;
 	unsigned int txfifothresh;
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 6343f88df5de..ba74b7ebfba0 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/usb/chipidea.h>
 #include <linux/usb/otg.h>
 
 struct gpio_desc;
@@ -62,6 +63,20 @@ enum tegra_usb_phy_port_speed {
 	TEGRA_USB_PHY_PORT_SPEED_HIGH,
 };
 
+struct tegra_usb_soc_info;
+
+struct tegra_usb {
+	struct ci_hdrc_platform_data data;
+	struct platform_device *dev;
+
+	const struct tegra_usb_soc_info *soc;
+	struct usb_phy *phy;
+	struct clk *clk;
+
+	bool needs_double_reset;
+	bool externally_controlled;
+};
+
 struct tegra_xtal_freq;
 
 struct tegra_usb_phy {
-- 
2.51.0

