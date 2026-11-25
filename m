Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580143;
	b=L2Pa27ccLPQvmBwgKcV+x8bRZ8/IbnQ3AszQTZzCdvpYKVwiF3hozK3B533mdFKdPiRC
	 Jwq+M2IBAF1kCvV9Mqy3PWwKC8RDPLxvMnSS6sig1+Ia2LYWUjTP4o3xT42jc7HIH/FtA
	 jo37jdW/uz0ZA3TONslzXPwYLq3ZB11fRfzg5EIgB46wGaw+Uw5VBLxOzKsqppMrk0wvu
	 AcGEYTs0G+dt06N3GdY2XdlWNC8HcgFOBvRSA3EzDDYMfJ8zn9kthKA97GY3HiEoz+O71
	 9tO6c0aiWuU+kIw2IIJbCPiWL7FcZpvCK10uJoyK0C1cgkH2GIqoQsetyWRTmmwRsLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
	b=TCbBS0Hfbe6Cfc/P1pMPnRK4TXUZMIQiWYXthO0d5Hwss6+IPpyS6vg2tEc+oy4jCKJL
	 ukIglkehrAC0kKdCj3eSqn46fJwRTAu2hkQ5DZEXHWClxWfsi7JFvw44oXWij/fey6+rL
	 6IKvrubYQG+F2kMekrgxIyx94AkF0kceLRflnn7AqHIEEB79jPgRhBnyYx5beqORLq759
	 upUEvOXcXTxnkONsyxuYA+QAidRSRsuAilOdC7oE6zgXm2np0oi9dhyPXddQeo6MLNY1Z
	 32nuVYpQuV4XP/Od8CLgUMMbVw8dqj3FyWmUll6BJ+T7xWAjQI6fpXC8nw5bAdBLu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFAd1nxk;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C0606A337
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690C0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFAd1nxk
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdeaf4ea5e0so252811a12.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580143; x=1796184943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
        b=jFAd1nxkyDHlYP8vDA8XBLXojJOHRjb9TlD+l1dN4S2F238hvJZizt+W+ul+5yjyH4
         EV/WIbFPzT4KcJj2m80tv36HJePWxGNGdG4IpKm0P/1N7Yx3ec+t0R3Duh/RyH3KyMiv
         0kzjA3UunV872M6wvtFD9DgjGqiHSQW4ddx/U5m/ebXuQAc0nwCtaIVte/JeQmX6Kl7M
         2iwbKCUwxKn0CNm+8xA+Yhd7GeyhfpEzLb9CEXK1JSBONuQqqJ+fCt/Szqdl7oBVvmy7
         a8PYSDaF1C4Hvxc2m0Lz2rATzoucQA7nDp3T3RT9gtlK8o3fZGD3uTmaHvg01ZccX3NP
         4GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580143; x=1796184943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
        b=Fg/HDdExQZqEQFmoAkV6prD0CKhLqU+3bz5hR1MYEh8iPHw3vZhHw9JlV65//Vwt4X
         mXZ55SeBlxP3BKWSu22LF3i0MvEO5okowcYb4cbyF1qFoabsthWVoBHgcejg+PMdhx3E
         CWU/l6sePGcXqtdRx5+IrbXCQgBmvES4z+cPy/JdYHIaHcs9q7nloPruKFkO8uEl7EpQ
         TV2tcwEz+qJdQKE8gql1mmZBBDn3gwQ6xR1pWoa+kjrLZ1/PkFM93yZoj3A73xmWfsmG
         2YKkQG4fMQEntngW1p/trzquPguWKNZZRaRLR+WHTUQwVZo1O8izKAP3j+CO5Efjd6Hd
         IFqw==
X-Forwarded-Encrypted: i=1; AL+hErFKNtFWM+eMDRdQZyApsd4LlAzpZV5f0HI5zk1Pg2yQyZaFcpsJHR3iRc2O+9GLFqnqhCDUcL6M4tx8@vger.kernel.org
X-Gm-Message-State: APuU4Z+lLii+CYoF04+DDK/18SsZxB56iWGoIAzFecjRiumzsL8s4+1h
	xTq5LH/fOArCoDnK7UyyjcofblyVg1UV+da9DINCRJtzBRywcRdkT4eF
X-Gm-Gg: AZFdTZeAmY+P7oGQlvgmhG/LPl3rzajOPccYzHxaJt9Jz63lo6rODHf5pO/fre7LLEI
	vVYlfPTLoxsBYCvR1k/2uZjm0smxIgNtVVc2lU+NZRSgom1Se7Uaj6BGqU/pp0ze8q+myPrrjKd
	j6Gpe+8URgLC4SxxzweSyhyB7awb046vdKVN1U+tXzWDHQOFEdIp2H3SCacAuzqvdp3zCWTeVz+
	TjiUK6CgG9v+YZLRaBPXlzHmVzTKHrGHcUF+6G7hmjawJuu+kO+F7TMxNb/ES1OSEZmKODlYmig
	imzbkgSTXhri1G0JHxDssixLKqGQanQTPhqKTJHfp7JHtpJlZToJ8lEsp0pStcMg0OdY21nV+tw
	s89COZr7ZcWeYLGAow8waPUgVKGRYT4RpanZIWpmZyQtFeuxRrXBdMlftqBIdP5/yiFkUnD1Emd
	zGpj+8fgjzN9C9T+VbS2RU0wXUKMr1Ez3oIc1ck23X5vBvOVSDrONkHhuYU6q4PwzqIwhymSrPY
	VPBkGhArALUtrG4Ge1IK+33mnlRKqkS7uIcDcL0rB6AoXrOFsRWGCN8HIFjVX8CgAIJKTZlUsh1
	s69U9gAFi1aJA012Iv5JvjgerYYI4JBL0UjKkOdphCggN6pm
X-Received: by 2002:a17:90b:3b8f:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b41c95f0e1mr11207523a91.34.1795580142737;
        Tue, 24 Nov 2026 20:15:42 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm27848549a91.13.2026.11.24.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:42 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 3/6] PCI: spacemit-k1: Add device id update helper
Date: Wed, 25 Nov 2026 12:15:17 +0800
Message-ID: <20261125041523.242588-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8a3cae32609f..f20c74eca73e 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -55,6 +55,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -156,6 +157,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -171,10 +182,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -384,6 +392,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.56.1

