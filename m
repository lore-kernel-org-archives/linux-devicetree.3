Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE21C3C73F6
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716757; cv=none; b=BRyppc8yUXBRq2JMERaZdpCZSHEH6NWF6fFtM0EYri8TafBo6/kbb/EDqUWwjkfFcNNQ3L/RiGcwBA2BsP0JtpmE7yXoitj62TC/9jCw0hFBs5Ry5c1vjqyfNrFrdSGI9vLFeK6ewzVMg9fst5R7JdVRx9B+Bh2vIH4woquofdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716757; c=relaxed/simple;
	bh=mzH/5XaUhv6NQCYgufBy5oWC9jpITM+/znfPg5sAlv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1vk2gFN4FuVH5gtV8gGPCDkkH8S7gN+ujsZK/Sw45p49GMFsa2YjBhYBfINEkEpntO33fDidaPX/1UaebfILZ2NqCl6eqK4D2E1IbKo2/fYkJuKlzMaW4JyLUDIgcL8RM47JhK3Ifg8gAlbJd5Zg+3cthp3+F+L0dB61Kv0ugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=D+SUdOLd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="D+SUdOLd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso27535855e9.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716753; x=1789321553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfiP06w66PJnEqo2UKKQtS6GK/rrfhVqIhL6B6Ho9XA=;
        b=D+SUdOLdyIGNFF9OLO7kNZBN3kfBiRVuBDM2Ij1okCk5SUwaURxQ9IKWBZxdEEAxQr
         zf6rwpKqKIMoF4v6pFvHv9sez/4JUYtmJsPJMIG+CorOgO4NrdFIHI68v38iJW6xQ4EB
         0pXk8PCNNdbUwDiP7XcL/+rbDdtii0RSONnKC4ciHq79UUnF3V1DOgvn7RXXd7FoCNtf
         bw+WeqHiGwZ9IoeTPoY86zdwgtlM2yQKby6qM10Ou3WJRZ0DFOzNUJPE4DVLgmk3awN4
         DAhNYtG1b96MqnB31ULK2Dv3NyltEQ/LJovzwxvlwzBPaTNKJ6YZF/Uv7FyeynXN8F40
         +RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716753; x=1789321553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfiP06w66PJnEqo2UKKQtS6GK/rrfhVqIhL6B6Ho9XA=;
        b=RRPgjvXSdY/vqIuVgqmIQLvbmlLXrfheSMQ3qOmlA9gYNKhMi0ig129mmmQMFtjTrV
         TEciCSx8GbCKyu/rOXMwT1MiF3M4stHz9vx3oLRSgofsNpFKzg6urLbigJ0NWVlmQjln
         nRBhv5+uAJH1voOMktKbW3Nl6dcS/qSQX9NnviIP02z3U2KirsD/o7K4P6aF5c5XpQVE
         s8Ri4VG66a9TB/N9FR02OeEj6D+8Sun87m+6HfuKJsf0nD6njSLn88DmFvfXzpj3y5Li
         wpd7pH1/tJt5X+4XJKUqpwISDaXEo7RVmg0KPP89xZYZbBIH4SxhkDG8C5nMTU1Y3wJL
         oSGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzndHZJZaNR9bgRAcd15RCu8N+XZQdDUQdtLYUmmnvx/4iwGPP3KQwTmyWcHL918iyzAC10E6x7JoH1@vger.kernel.org
X-Gm-Message-State: AFuF++n7TR2WY6Olte0Dfy4B9YJ3T4h2CHtLc1vErFNhiTMSVEm5353J
	hyhC38lD9fz4Li8sVW346tsWZoW4F1y8nFSSz8bZ+WF1idqi1QbaxYBmKc3si23Do4g=
X-Gm-Gg: AYBFou1BPVppzybOaUlOE7mh5m0Jg3I7K/ep5ZscqxUjTLUo1arvXXgRRTykuaJj2aE
	Z2hzrdmRQuBK+zYLDpMZq15xyOYH+JHIliXItkCG22Ch2NgL/MBttBfr3JwU6q3w9uN3iW1N3Hu
	OwPNi/V5I0EoKtvL3wnDE2xXLWpWSNxKSvGaKceKASCs7NqIj8gDipaxy97aJqoDzv6k1Vz1lF7
	GW3azQE6znPQqo3MksuauZtnmIccsQ9BCoSehFnKsR5ShV0jqjTehf1aPKar3eDGRszFJA0CL3i
	IfYPZejU0P4XKjxZNu7Ermc+jhCw1tV/rCrxPJWlleqxBOKZOBOsisOwN/i+vUtkHzGljdc6rkH
	jmkIDDT1/t57z7ZrBjg9UZsNT5JYwhim4v0VW4eornkEqv1Zv8Zy0Dyo9KvCxUzQ1bnHjjc7Cml
	oEYpVDT1MuvjMLL1xiycNsv6htPpz7heN7iTXorFo=
X-Received: by 2002:a05:600c:a05:b0:49c:f501:e428 with SMTP id 5b1f17b1804b1-49cf82e5b1amr170477405e9.8.1788716753028;
        Sun, 06 Sep 2026 10:45:53 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm245418805e9.0.2026.09.06.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:45:52 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 3/7] net: phy: air: type the buckpbus core on the mdio device
Date: Sun,  6 Sep 2026 17:45:39 +0000
Message-ID: <20260906174548.4106801-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788711797.git.f@lex.la>
References: <cover.1788711797.git.f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buckpbus accessors only need an MDIO device, but they take a
phy_device, which ties them to a probed PHY. An upcoming MDIO device
driver needs the same register access before any phy_device exists,
since it runs precisely to make the PHY presentable.

Retype the internal helpers onto an mdio_device and keep the exported
phy_device API as page-selecting wrappers that pass &phydev->mdio. The
EN8811H driver already reaches the AN8811HB pbus through an
mdio_device, so this follows an existing direction rather than opening
a new one.

No functional change.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_phy_lib.c | 80 ++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 5141db19fa5e..e314717843ae 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -14,31 +14,32 @@
 
 #include "air_phy_lib.h"
 
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
+static int __air_buckpbus_reg_read(struct mdio_device *mdiodev,
 				   u32 pbus_address, u32 *pbus_data)
 {
 	int pbus_data_low, pbus_data_high;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -46,64 +47,66 @@ static int __air_buckpbus_reg_read(struct phy_device *phydev,
 	return 0;
 }
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
+static int __air_buckpbus_reg_write(struct mdio_device *mdiodev,
 				    u32 pbus_address, u32 pbus_data)
 {
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+static int __air_buckpbus_reg_modify(struct mdio_device *mdiodev,
 				     u32 pbus_address, u32 mask, u32 set)
 {
 	int pbus_data_low, pbus_data_high;
 	u32 pbus_data_old, pbus_data_new;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -112,23 +115,23 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 	if (pbus_data_new == pbus_data_old)
 		return 0;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
@@ -144,7 +147,8 @@ int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		ret = __air_buckpbus_reg_read(&phydev->mdio, pbus_address,
+					      pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -163,7 +167,7 @@ int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
+		ret = __air_buckpbus_reg_write(&phydev->mdio, pbus_address,
 					       pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
@@ -183,8 +187,8 @@ int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
+		ret = __air_buckpbus_reg_modify(&phydev->mdio, pbus_address,
+						mask, set);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
-- 
2.53.0

