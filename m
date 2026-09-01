Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE31476680
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253051; cv=none; b=am1f70fstnYK7dE5EcmqqAHO3Pl3jlp1/XfYspB6RgRDQRszVGLBG6ej7ixocU8K5e8UdRH9v2EnQhP/Rfxc50QGtk0FmezGsiYjbLebz9g3bqKeVoocXt1u/BR8Mn4UNLk/NLB0jG4j/VzFAkY3H69rpSitjW3YkSEnt57q5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253051; c=relaxed/simple;
	bh=8urEIkOEgNg/W0WfryJCD+eWZUJUCTF8wpI/6h2nZwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d31u4McHz7M99Trr3G+kUz4i2rhhFAStb9dxuRck2vlGzoWJ2qEkB8KRAMfYAdVzkXiAvObNJKvDp0Jl6sNNSxZHKvj9UZzx/MmrgmDFnzk7VPbRV9GGbKWjWxayCwANJJneZE1++CqZ0yWuleqLqziy+FVz3nRKdRImpYxlhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=f4zT8ZWN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="f4zT8ZWN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d91518a63fso4979855ad.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788253048; x=1788857848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=f4zT8ZWNXTek/sbE/ZdVrZusr+BjcJ1JTBbqKvqpbvzVkbgFkXh5+X8nYPkIB128vx
         mftJ1+2TEL86o86E6Bn8m6hzTmZoCyN838tmT8aqP+SerkXPw7DerhTRIbl+OqB9ZzbN
         o9azDRFDATbsPwuaBXsooLw6HxNJp2peB1bw0aGOnsxQ6OOCUGuPxaTyk+C4fw9bCGBT
         q+0t/yx3dBzuo/0CvyxnQYmsYhWi1DGJWWuwyE1WqJiwNF2TiUYoXw0Ka7FGNZN4KhjM
         DUByC0i9oYiGuW3rnQq95Kg12AxzDSHyFxG8qhP2SFgm+oF5wQJMLVWAfz3HWdmz6IiH
         qP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253048; x=1788857848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=a6R3GjNqRnxTTshF9+iTBa/I+yKAYyscvL2m0FIy2xk0S2er5Bur+fDQfeLvufa2I8
         z3SSmJ8PDRY0nzjSkzroRMQ0nTJtbpWUyCMjXqiQUBrRVXGyV0Cs7UzD19lZQ0Qg0rt9
         +j7b1tC3C6LSEMQTHbrnSIhgfB7C88JCy24MQFXJbZLzIvRLVuzk7ElvuBFZZJV+3ZM9
         Nmh2zYD63CEJwYox4+KwXNM2u/4k6RPx4HA2Rs0TtzTu5Odousxufin5XtpoDwmesMy7
         Pq2wcOpuP12X003TDoS32qHt4gzdCTXw6m5kMTX/eH9MOepi0k1QjxFG/imq10NOoKT4
         DVVA==
X-Forwarded-Encrypted: i=1; AKwUvBz2s1G4QDfylhduaa1O5vJFEVhyhBRh6jpAnLfbdr9Zg8Cjwv0HQSgD5c6kwOgP7NhOPhdAoOW+Jysq@vger.kernel.org
X-Gm-Message-State: AFuF++kjYboVgShkxwCIhwpsNskszZ67osmtjKPpUz1v2H4byTmB1WEw
	AXEd8jsRm3yDepAHqq+5FCO2X+3IPjWw8ryb6YphNez8bKksajUlpD2JybXuKm3JWtA=
X-Gm-Gg: AYBFou0I37vPRNX2yzRIa3dSjyOZDaRyi9wkpAVPYZF2aqrEdiFv3r0yHIyhixyaOzc
	iawfLFeLkOCmdEaQVvrr3gtv9oQOKAX1BWXbm6FTEnlWjbAF98GPoNeR2c3Ia6KXvHVI3mQwzZy
	wSE9kb8nav219c2C4XHRt0yL73+8w6A7e21W0buco2ePHgMgTaB0tWG2asbvaPutSwoWwIThY0Q
	mH07wtAPn7T7mZLJ1+HAMK1ztNJ1eWIe0b1138uahSQZY8pzYgjJ3jHrbS1pSDeKq/CyAaZ55Ui
	uf8UPs5JOaLShdJJ6ekCiF574otUQE5nEA58wo9pMEk4t8X8Si4u4+E4uWPi5H2UQtEGUqY/kK1
	ysxa/XHDuqjud4RuFkAvCG3XW0D3+GC7J3iof4N187wbHafTZSVVreDH/2AZcWMhRVD8ETjvujz
	1ovTz7NjkKfKYbNhGWWybCubfBjd6yCMRGdm/TAHgJPCVx9wOZvYUk5j8HoUpcKd+djZGX06ZxD
	1DGBQoXTRb4GPAiXwZRwypP3zmvwr1u/cxARN/wpOJMuThB/U/ZxmW+REYmywS8gES/zpz40Tn+
	s198WB4=
X-Received: by 2002:a17:90b:37cc:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-396d0d92d0amr52298580a91.1.1788253047628;
        Tue, 01 Sep 2026 01:57:27 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf6800sm5934432a91.3.2026.09.01.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:57:26 -0700 (PDT)
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
Subject: [PATCH v3 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
Date: Tue,  1 Sep 2026 16:57:02 +0800
Message-Id: <20260901085702.1515378-3-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
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

