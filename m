Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4CA44237F
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828604; cv=none; b=ayfz1QNvp9h0ZmRy/DNoAaFIcrXW/1g5JcIzbXXO7Vv9ONwEo64pCOIIFzKjKL3cc3CeKMY2ohFBtEtF1Zovialoz8FVVuM6RXoQYDWh8eAuf2D+/+0OnO8NJR/JMh3YtwvWyOYkOVtDryd9PrIxSpZA76cZ0IFSbJnrlYaa8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828604; c=relaxed/simple;
	bh=8urEIkOEgNg/W0WfryJCD+eWZUJUCTF8wpI/6h2nZwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URZ92ju/lQe69CxsvjwPT//SFdy/r+foK5wsHyLUQRbBzYx8LNJJDhXaPg8NXUiLdduPA8fINCu6LogeD4l3CYcRxwftW75LMsgaXVtqVsd/zRwwweJT5i5I4RD0FDvM3miiJYl+2jzzIgH5yjLLmb2ZC8TxNP31Aljh7dpeKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=NB2GU9cd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="NB2GU9cd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d58efc7356so23833225ad.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787828601; x=1788433401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=NB2GU9cdGqOurno5IEO8+wdLCK52SDYGmTwVmjFAd9O+6gTL8v9GxibsbPBXmdjTdN
         qIPkVtdKxQynXVjbH203cfXvodknyipvgZlFUpGq+Tc74agcTFN/ibhMe+TbPIEwz2Na
         zwp0RGZ0lwzrs8f0kB6NL7QfO0gXqqUkTEDHRCCw9qe3hXCvSnkrnblXFB0pkRljy3jY
         Q0cuYdFQifiAOswl7YNd6cC3EOc6dcAfStTATXl1ENSZZYVxIgTma+P06jJ7h6kZmaeS
         dvTUl5qmn5I2xurqcarfGmEh9sIxfHG0lBv6Rte4jahLhBSNqg30zoyu3H8zXaDFdZwv
         8Qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828601; x=1788433401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=HmXKGWjWZplVr1XIM2slEQMtRIUzTsHOLXJZNDXa9RxaEgNrI5/sYN0TyMaY+c17Am
         2kf9caZAGeU9Ua0sUj6mXzLIm+1eqEpD4tOkHKKY2HupqcgYiGLVf7oY423H4zC6dAlh
         Drbe3AQPXNmxwNyIjAFpOwnw7VNn7yKMaxsW0+OS/c0D7y3QOPMAC94UCv1GQW7VzIKV
         sW5teinVAK3EsJIrw7iooHxQ9Po1dqGnsG+kWkmi0pHox5tM1JDVF0XJTYHWL44aG08w
         YL+VU70IVim/pAir+TMs2TFgGRDerEnnRgdxFsDU5+KXrDyzQY811h/Yh3dPrMUdtEwY
         XU7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwFNU6WZdtqY1qrvo9ZC9ZDtr1fm3SZJUfvPqmSW/cuxqs2ebN0mKbIRMFhQGIh1to3/3q9tr3nEqp@vger.kernel.org
X-Gm-Message-State: AFuF++lbTP/pYGmtLKBrXOeGsViMUSFA9I1y8MMJfALfWsr00eA+/mh7
	851p2HzEgnuK4hWSEzy7T2dc0G19duCvpuqLq/kd+dTuNpsmqEV3/eqeNMkHWlWHSRE=
X-Gm-Gg: AR+sD12puF5r4owbtqovyQ419Y1DYygVIfV8yotbXsRqmmK6npQXoe2haRdAk0/mjwT
	85QvJzPwJMEz6UrcEJPd+RUDVJXeVh2vLMCL+I4cbHN782xi5MdKQvDIu3BGpKCGdVbo2leeyHF
	NYATCe+G5YrVXMj365ZH/JkfmEN8LXutHkQ0EIR+gA/boJoPwkXsKHYWQAxStTeJsOwI2xXy5RL
	dm0GH09JTHXGDZArn/Ay/pK1CtvYAcEIyw5frs6A7+xLAqvlyZ+XTv11mMFEbLoHSLS+pgLlUdS
	8PsOk9Cjjr8pZjsSYOCRE0lr/lAHZDJ4H9AEsG3ZxIpI7XT2rp1xcm/m7dRAMQLJ8YH3LXFgcZQ
	/jcFisC4Oigk45H7wmc4fL0G+UXtK9EJzMl6FKjxFiUYJwK4VT9SU0EuNkej8u79ea/0y6mYRfM
	VmdLlMurPEtYAxtRsAidkcNptSXaOkJO3edhouNjJ9z1sZBrjvy1w3wHzWeLma1DvLNL2nCsiOq
	vsv0Rm/edez1YdCVpgaBUZV4PgQt6KKpBWlOlQQA7l0X8LlMfNNOR6mK9e/d+ub1nPk4U1mlBF2
	PzFdAf8=
X-Received: by 2002:a17:903:1ae8:b0:2d6:f3f0:3e7a with SMTP id d9443c01a7336-2d707957143mr256210645ad.3.1787828601192;
        Thu, 27 Aug 2026 04:03:21 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c4bea8sm15081585ad.82.2026.08.27.04.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:03:18 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v1 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
Date: Thu, 27 Aug 2026 19:02:42 +0800
Message-Id: <20260827110242.1203546-3-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Synaptics 4384 Bluetooth controller
by adding the corresponding chip IDs.

Tested on the VIM3 platform. Verified that the controller initializes
successfully and that firmware loading and basic Bluetooth operation
work as expected.

The VIM3 is a Khadas single-board computer that I used as the host
platform for testing the BCM4384 Bluetooth controller.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
---
 drivers/bluetooth/btbcm.c   | 6 +++++-
 drivers/bluetooth/hci_bcm.c | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 463d59890bef..63c4c788d9c4 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -31,6 +31,7 @@
 #define BDADDR_BCM4334B0 (&(bdaddr_t) {{0x00, 0x00, 0x00, 0xb0, 0x34, 0x43}})
 #define BDADDR_BCM4345C5 (&(bdaddr_t) {{0xac, 0x1f, 0x00, 0xc5, 0x45, 0x43}})
 #define BDADDR_BCM43341B (&(bdaddr_t) {{0xac, 0x1f, 0x00, 0x1b, 0x34, 0x43}})
+#define BDADDR_BCM4384B0 (&(bdaddr_t) {{0x93, 0x76, 0x00, 0xb0, 0x84, 0x43}})
 
 #define BCM_FW_NAME_LEN			64
 #define BCM_FW_NAME_COUNT_MAX		4
@@ -130,7 +131,8 @@ int btbcm_check_bdaddr(struct hci_dev *hdev)
 	    !bacmp(&bda->bdaddr, BDADDR_BCM4345C5) ||
 	    !bacmp(&bda->bdaddr, BDADDR_BCM43430A0) ||
 	    !bacmp(&bda->bdaddr, BDADDR_BCM43430A1) ||
-	    !bacmp(&bda->bdaddr, BDADDR_BCM43341B)) {
+	    !bacmp(&bda->bdaddr, BDADDR_BCM43341B) ||
+	    !bacmp(&bda->bdaddr, BDADDR_BCM4384B0)) {
 		/* Try falling back to BDADDR EFI variable */
 		if (btbcm_set_bdaddr_from_efi(hdev) != 0) {
 			bt_dev_info(hdev, "BCM: Using default device address (%pMR)",
@@ -514,6 +516,8 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x4106, "BCM4335A0"	},	/* 002.001.006 */
 	{ 0x410c, "BCM43430B0"	},	/* 002.001.012 */
 	{ 0x2119, "BCM4373A0"	},	/* 001.001.025 */
+	{ 0x2128, "BCM4384A0"	},	/* 001.001.040 */
+	{ 0x4119, "BCM4384B0"	},	/* 002.001.025 */
 	{ }
 };
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 9a103db7e355..e70b9f3fd968 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1593,6 +1593,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4349-bt", .data = &bcm43438_device_data },
 	{ .compatible = "brcm,bcm43540-bt", .data = &bcm4354_device_data },
 	{ .compatible = "brcm,bcm4335a0" },
+	{ .compatible = "brcm,bcm4384-bt" },
 	{ .compatible = "cypress,cyw4373a0-bt", .data = &cyw4373a0_device_data },
 	{ .compatible = "infineon,cyw55572-bt", .data = &cyw55572_device_data },
 	{ },
-- 
2.25.1

