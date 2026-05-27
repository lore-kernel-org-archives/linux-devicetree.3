Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641EC3E714A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872963; cv=none; b=J/FtWMUJ9VSbRyaj5sIoQa5pl9KGDfVij6vZky1B5JOpZBnvyZGV/ACmOGoUDSbr/5iuBxqpfihewmcWrA/Z6vbKTvPqq4EsZ8CnC5tDIpaikZkyhYhpihPooKMp/MCYVxPpfepZGYg0JV1xTnNNJrcx4ZsRPDkZfW3smJf84+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872963; c=relaxed/simple;
	bh=mZbell9oeefD+kmA0lK52fWnCxropHDov+bmSUKtTuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWFQ/tNEHrvP11VXWytjU9SNx9eWTSw9UZFccfD4RGkPeCVWQvlUxgdDHx1/M1yKrNrOqMtRa79+fwCUgS6dEGfLjD4dlW755iKtSOycAHHGEsVncKbaPAamOgD5kmyI59NKhwKmzxXKWigaIQhlbcMh74KfeAcKGEcw1WRehEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=vBEawJrD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="vBEawJrD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba856db1c0so84298165ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1779872960; x=1780477760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOwRvQGChrpZIdqN3+3ZoW+e1ryNG27wl8CiHOr2R1A=;
        b=vBEawJrDjr4RNZmmIHVe+4sxyJwnJ88fijiDL0spW5/i7mouzN46k8seKz8myh8DxT
         L4jRJOWqAM2IdEm9bfHLvtn6bIADUJkY5hpCSRQXtJnwbZy+oi9iV4cTIWTzDl3cqCMs
         XLsd95ziNQr9EvatmhoLesnh14d4aa7HGn5ZsJcuAvKclyoSHt1vVKJqBlGQVkEHw3qW
         vWBqtZp8OpPEUinRh16BImqQt/bsZGfVLewlpFYThHJmlvYaiMVizmmpoWXz8cQygZBV
         w2dkkxQS2OOZBahXX5bGUBH6t3IoCgjozZeUX+ffakpkqEpuS8pbfQ6LuZhtv231bIO0
         3V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872960; x=1780477760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOwRvQGChrpZIdqN3+3ZoW+e1ryNG27wl8CiHOr2R1A=;
        b=m/ElCZDWHaHWftVDthzuxtYjreL4UfbHujJMXTY9mxagI/MpdHsNFFVHiLT8r2k807
         SZd4xRBJ+iP5WEU/kUQRlEagk8Bd7uIco2hV0wTAMKED3/Fwrjl4RnoDUwtsol/Le85Q
         xbeRFCu2DOjPFW3kjy7EbwkhTO+OTrtSEOF5R+aCMjqAWWhneIjfeYHJwHxpfnsPA5H0
         S9SS8RWlc9yG4mk4GtXR0cvim5HvoKzvT26t6S95fars3iT/fvw0/vYfO/BDPMkHVRXl
         tXm8agHYPUbWa9c5Hq7SCziWa2LJQRZkDLoLyDcBFj61G4Ru+0NtUk9YVMO/sVa0JicH
         Drkg==
X-Forwarded-Encrypted: i=1; AFNElJ9XJfItYnvHJEn+StTfOVs/iLx5JomKFVSSHgN7ctz99CGjhjKVSJ8vpgZAvwvAeETtKROgIdMMbYRm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yqwPxY7u9N8XaILUhp9LXcBg6k73D3+ezoppVvEEquG0F2m4
	lgqrsmOaemIxC5O/3TptI7o+ha3hRMkOYa855st2EyjYWGmmbxyY+K+hx2ZE7cJJpw==
X-Gm-Gg: Acq92OEVGGTPIUyuPZxEsIXOLICMEHlyN3kplrKaIttu9ZTIe8e1za6A131LReQ1yOl
	466GK4/MP6BNstnNlVNxYfsHbdIzLEaGniYt0+w8t/VbcVFpyN33qESxiSg7/sEK1ZUUk9t1zPu
	WE5iOBSIPUYKXOPGxQLi226hvSg93rdkvnAIq8vDc0PwaRagiXv9cDqHkzqp/SAMkuKUDkD4TXE
	7h/fVJN+PRziEMnrrXnSdiu2T6I0skwJ5xhCbSwMl/EZ2JzoAS7Vi60jeAnQI+fCsuehVhDd3iG
	zXLvco6lHfXoaha2e5IfgaMOIRIe/IQhuod+RA+tBYKmkVlbJcA9X/JWAm8JjiPi6CtLnHQ7MXi
	/zD7/yvpzPnEqmdxxhK6GRoQYeLwnW6rizA5ZaNBXnTERUXfojYtr6Cf9kS2coLQ85Mng9wuT+3
	ubiXf0sZLK6ZMyNtg1zzDH6aE3PAPc//m5t+LW8nNj8XHiY/JiDwxommotzfTj/TTQ6hX6HjZSH
	995qUsYByoNAJ3zOWnAbElszZ24Ytkj6tRLd2Q=
X-Received: by 2002:a17:903:2bcc:b0:2bd:e5d4:dc63 with SMTP id d9443c01a7336-2beb070343emr252025575ad.26.1779872960628;
        Wed, 27 May 2026 02:09:20 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bed2061c59sm92430365ad.2.2026.05.27.02.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:09:20 -0700 (PDT)
From: kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH v7 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
Date: Wed, 27 May 2026 17:08:49 +0800
Message-ID: <20260527090849.3647601-3-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527090849.3647601-1-kaihsin.chung@synaptics.com>
References: <20260408083217.1915419-1-kaihsin.chung@synaptics.com>
 <20260527090849.3647601-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Synaptics 4384 Bluetooth controller
by adding the corresponding chip IDs and device tree
matching support.

Signed-off-by: Kaihsin Chung <kaihsin.chung@synaptics.com>
---
 drivers/bluetooth/btbcm.c   | 6 +++++-
 drivers/bluetooth/hci_bcm.c | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index f9a7c790d7e2..1164cca40324 100644
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
@@ -515,6 +517,8 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x4106, "BCM4335A0"	},	/* 002.001.006 */
 	{ 0x410c, "BCM43430B0"	},	/* 002.001.012 */
 	{ 0x2119, "BCM4373A0"	},	/* 001.001.025 */
+	{ 0x2128, "BCM4384A0" },/* 001.001.040 */
+	{ 0x4119, "BCM4384B0"},/* 002.001.025 */
 	{ }
 };
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 874d23089b39..783346a4a59b 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1609,6 +1609,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4335a0" },
 	{ .compatible = "cypress,cyw4373a0-bt", .data = &cyw4373a0_device_data },
 	{ .compatible = "infineon,cyw55572-bt", .data = &cyw55572_device_data },
+	{ .compatible = "brcm,bcm4384-bt" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, bcm_bluetooth_of_match);
-- 
2.43.0

