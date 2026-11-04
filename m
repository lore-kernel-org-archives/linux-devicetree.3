Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829537;
	b=hHwrV1msx/8e6Fb25CwMTflj6m5UgxCYb0aX2ZP67dOBghBaGHc2YOaOrPszWUzbIGPh
	 3jS0Ly2Mn7xerZKXi1QuPKO8yUBlg4wUuMp7b3CK/ASDsEzPXCrY3imyyxrWgjLvpBhEb
	 tBv0rv8BgtRKBC8XBWkpGzp4tH1IeJy4uFB2acsaMAMf08aOvjFVPCWnbo3WTqQGNHxAH
	 Facd1O9KeO0Q4uVveBhrTZDez5fozxzvQ34/8PS5V9V35JbXrD2HfwcAWGl+bor/udm4P
	 gbYQmH2fncNK9Pr5AoABxY16agVS7WcBmYWYFbKOkzbL7h20kc9evGAwBgYJGrAXJ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
	b=tcFS3nHKC1gR5G2XlLjgo5njw9AJ3TJEHwtmB42BI/DjWFHm8d+CBwg0P4vu+yHe38zb
	 Lx0sVolBjK4AGN6dqmxCsvapSleR87FobiTkhJKhSEhF4SDrfEufy1l6tz2aKIQPH5b7C
	 0CXrqCEdGuehca/GN6WqNjc83XxJFKVMiHR5AIBDwLt/Nusg3sXy3NpoHRj0116ffy2sI
	 m+8w9P+QZtM//whgALeWrFbRsVjXigwJ3Ln51i+2Z7V+RYMdvjHXOqorSsOL21i/ULGRa
	 AJvjxHWSMZL7RGCzVprIlv7ZBpU+vw6GlCxSQr5LjbH4MJGfAw+DGcWmNFQNCw7aNOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX6QCTb+;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49486074FBD
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49486074FBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX6QCTb+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9562445e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829535; x=1794434335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
        b=FX6QCTb+7hQ7a49k2he+cXjZ+2kMQvzj3kmIs1IniS/nLeDTKVLHUpzkD1SsnHFDaq
         piKWHM6u4NhFFeoMQbWWGdYBKECHcIxDTbdQvL7W396dkj3SMzJkv/bsjHHi0l0EODUf
         QSuee+c+9eI596+lJ4l5R560zoZcph8gZe3wXDHdNLjNBDyr4MkFF3X9QejxJmmfJ78m
         VfQh+MXRA6rqfLdIM8RGR/Hh1DYtoqlmjwVs+beuGrN2r3nUcX0gEXCy/uF6KNSg45/s
         NP7K7fXkxDm9n7loE1MmknICig4qnZZ0BPAw+pt15CtvItWWKolSimPXLlQnOjHn3JKE
         ZySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829535; x=1794434335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
        b=L7J4nZ1psAs/BhK16iQJ+Bk5gRnRWtABaCW0h2oq2Csu+J0/rivEZNKzHXaz/hxPRh
         8nmGN9QIDBvNMFOz8L3gAI2o3lxg5YtoMPH6y2GKabHfrHogzHc43iFVmpXT+j0JDv0c
         kjo4znQBns2/cZ1YnL0yUmQ13PwZZxL3y0wQRCBALIYP7Ktd8y55UyeAL6ivkaPzRRrp
         5CRi/Q9jvPTcT5GrZoWOLvcZ2/SB5M0UdtJRYZWPB9yN2b0n54eLh3GACSnAS/ix0VoZ
         rTNEqQERtcCNFU2m85hYZisV4lE0QyfkMZ2O4Cs5ViWv3DqvaXubkCWWwtL1gh/6Tvh+
         HbTQ==
X-Forwarded-Encrypted: i=1; AKwUvByLooI3MV3y0r2VZAAcYJOMq2AP3f4Rs0QmOsfIZs2pkWddrtAgFWHUpiANIOb0zlJ2RtTuUzzAKbwh@vger.kernel.org
X-Gm-Message-State: APuU4Z99lVxQFYxU1libI7lJ/aK0BMaNFLxsDF4VBhd3lmEZuQfjTC4S
	LbAqRWy0xSXUruQ3HS/qBgZLc+7Zya9Xky53Ly6vDlLcM75HsiDKr/pQ
X-Gm-Gg: AYBFou06T/TaSSbZx3RquAYiqkBz6fkSizKArcij+DBW9opY1mQmTyx+DnGpGqyZB7c
	jQNM0kl0N0OdTIC/EOlCtvLWyJ3Wmfxun8BVMCziO1ahKb1aCDjnLiUMVT+4cmmcs+LtSID81lR
	G/j/Nskiu0VjCtDF5K8BlhNZFSPrAOTtLa8TwPH05NiVyqRLaymwVNy8GOX3/Su5lk/vROomPGx
	K7a619dRkGgBRMoi2BD/b8U/tMKxGarHRLWwsEISPQEqD6dUIFUrQdh9i60k47H6DmSluHuFyz8
	PJ+thAb97MdKMCcn3zYDIXDxH+7+K3tx1Enzl/2yZW5X7v/ZyGx6MRWOKRVRjKIQRdnX6AYfDSt
	kT6mzBV59ozfAFu+2s9c3SaQsL4M2HUFMpMmlTyRV/sfzWOGn4ocgxMLBB4go/Z48VxXbROnPfF
	Mk62i2QvQZpwfs+BLsOdsBHGP8FIZsSA2Y6IbF2IhWO6g/nHnKHoKq5M/TFb3CaBh8Od/c7l7EE
	dIzxQdLIfO5Q2KQt7+YNTuToUunTWiP+tZDlY06+6wgolNaEPjNxzONJTsGZ5mN/LM2kWKb348u
	C7M4DEy5wFA4fZdbRkgEmZea3cSydLh4IdcvIiuIXmSXgETw1pK1d0uRaycXauiqHH+iryTioUJ
	LJg8YzZc9YG6SnR4SiwW8hFS2KzqiWRdLGEyF9ywh6RTWD6lWnJHPYBsiQpM5HgD90sM=
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr393088445e9.18.1793829535234;
        Wed, 04 Nov 2026 13:58:55 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:54 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 2/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Date: Wed,  4 Nov 2026 21:58:47 +0000
Message-ID: <20261104215848.2087944-3-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rockchip_pcie_host_init_port() waits T_PVPERL, 100 ms, before releasing
PERST#. The GPIO is acquired with GPIOD_OUT_LOW early in probe, so PERST#
is already asserted when that wait starts, and the wait therefore sets the
reset pulse width as well.

That suits a board which powers the slot at the moment it asserts PERST#,
but endpoints do not agree on what they want. On a ROCK Pi 4C carrying a
JMB585 SATA controller, a pulse that long stops the endpoint answering
configuration reads at all. Measured on that board with a single kernel and
two module parameters, one sleeping before the GPIO is acquired and one in
place of the wait, timing the pulse with a ktime delta across the two
gpiod_set_value() calls:

  pre (ms)  post (ms)  pulse      trials  enumerated
  0         0          1-11 ms    5       5
  0         10         ~18 ms     3       3
  0         15         24-47 ms   4       4
  0         20         ~28 ms     3       1
  0         100        ~108 ms    4       0
  200       0          6-11 ms    5       5
  200       100        ~108 ms    1       0

Delaying the assertion changes nothing, while widening the pulse decides
everything. The slot supply on this board is regulator-always-on, so power
had been valid for seconds in every row above, the failing ones included.

Rather than change the delay for every board, read it from the device tree,
reusing the property names the Rockchip vendor driver already carries for
the dwc-based controllers in pcie-dw-rockchip.c. The default is unchanged,
so a board that describes nothing behaves exactly as before. Whatever the
board asks for, PERST# stays asserted for at least the 100 us minimum the
specification sets, which covers T_PERST and T_PERST-CLK.

Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
Link: https://lore.kernel.org/all/95aeecc0-2794-4cc6-a635-5c042afc1405@rock-chips.com/
Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 26 +++++++++++++++++----
 drivers/pci/controller/pcie-rockchip.h      |  2 ++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bd..5f78cd6 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -24,6 +24,7 @@
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include "../pci.h"
@@ -280,8 +281,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 /**
  * rockchip_pcie_host_init_port - Initialize hardware
  * @rockchip: PCIe port information
+ * @perst_inactive_ms: how long to hold PERST# asserted before releasing it
  */
-static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
+static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip,
+					u32 perst_inactive_ms)
 {
 	struct device *dev = rockchip->dev;
 	int err, i = MAX_LANE_NUM;
@@ -315,7 +318,12 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
+	/*
+	 * PERST# has been asserted since the GPIO was acquired, so this wait
+	 * is also the reset pulse width. Never go below the specification
+	 * minimum, which covers both T_PERST and T_PERST-CLK, each 100 us.
+	 */
+	fsleep(max(perst_inactive_ms * USEC_PER_MSEC, PCIE_T_PERST_CLK_US));
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -587,6 +595,14 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
 	if (IS_ERR(rockchip->vpcie0v9))
 		return PTR_ERR(rockchip->vpcie0v9);
 
+	if (device_property_read_u32(dev, "rockchip,perst-inactive-ms",
+				     &rockchip->perst_inactive_ms))
+		rockchip->perst_inactive_ms = PCIE_T_PVPERL_MS;
+
+	if (device_property_read_u32(dev, "rockchip,s2r-perst-inactive-ms",
+				     &rockchip->s2r_perst_inactive_ms))
+		rockchip->s2r_perst_inactive_ms = rockchip->perst_inactive_ms;
+
 	return 0;
 }
 
@@ -881,7 +897,8 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
 	if (err)
 		goto err_disable_0v9;
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_host_init_port(rockchip,
+					   rockchip->s2r_perst_inactive_ms);
 	if (err)
 		goto err_pcie_resume;
 
@@ -938,7 +955,8 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_set_vpcie;
 	}
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_host_init_port(rockchip,
+					   rockchip->perst_inactive_ms);
 	if (err)
 		goto err_vpcie;
 
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index b5da156..c773f74 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -315,6 +315,8 @@ struct rockchip_pcie {
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
 	struct	regulator *vpcie0v9; /* 0.9V power supply */
 	struct	gpio_desc *perst_gpio;
+	u32	perst_inactive_ms;
+	u32	s2r_perst_inactive_ms;
 	u32	lanes;
 	u8      lanes_map;
 	int	link_gen;
-- 
2.56.0

