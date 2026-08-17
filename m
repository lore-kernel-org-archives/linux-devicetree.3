Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE5B3F482F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960570; cv=none; b=Ac8UumFt6DpG5nDm5xPK+1iuy2KF1sgE7DrXveKnGvA5apmIe85YU8jRspHiB+6XFqXg2jeao8wqMR0FQhlw4e4tXsyZjI/xQNpqoKCM4DfH5GxzPFyqvPqVp3KICXvIYWrH7i5d/q9InTR3xQGXNzczlsKm3RJ/m643zaPmb3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960570; c=relaxed/simple;
	bh=IUaOznEiLFw9B1qoV5N4+8o8B1KZmv9fq8ebecxotvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpP9ZbRN83/kGLE7jzdLRQ5AEUn07LoeHK3tHCj9rYV+7ICFks1opQz0mSzf+F7A7ORRs4dKxm1osBBl01uxj3bdEnHvdPFVurnGIqfdtWha883hrW7NdzN/UG4tuanlTI+LQdQ/foq/6CWWYAQtsH32Q8/l9PNXAL5pavIMlhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=pkH4OcBf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="pkH4OcBf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2149943a91.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1786960566; x=1787565366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Egl/2bmcS13RHo+tZQinMeCCoNTolmzmlsrAYIeA+As=;
        b=pkH4OcBf/UizuiGhv2BkQwBYipZSypOl7ATjCnXiy7Tz3JB64T16XUivClWw6+FizV
         0vsYBc5B+TYXB9+iv0Y8zDPu+HXR7qcb/9CbXQLcrfMX/rYkEeM6H5LJHMevE5+r0eiz
         XdFWwOkZdsm6e5Iw3k2MS+CI4w/6P6XPyH2At0iU9aiBF1sRcyDo4w+SM4v8hvXuKuuS
         KytSpJf5RYX7sQHhZLsxJ7fvBGbdqS0IXkCjsqysTZeVt1l9QOfEwzk+cZidFvPwfbQi
         mGbo+VcLDTExqxY6nV1bV2Oon8avysu+p7oZpGllrlT3buCvn+gHAwAjksnih8m1muu0
         caCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960566; x=1787565366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Egl/2bmcS13RHo+tZQinMeCCoNTolmzmlsrAYIeA+As=;
        b=CKJCbxlMhT0oh1VHBC8FY6H4qj3g4V93RrtsN9QqEQIv/c3gUau27UVXNfNrwTNmDr
         fgnw8Ttlq5QDWhIv5HEmY4pOotHTQgFNuEGE4eVO363MFpKhZhc6Ccdjjc/zZhGkOvhh
         Qksc3yzxc7Nw8TfIjMMgVgOxmfsKtT0LFSXE4IdB246fGazZwrQibLIeW23pTvM8QURv
         gKGy9mZs56csJrkVg/d3h+/a3CKfRYicivzigZ0T6u0bc9z1FfsCcDXltVv0Hq+eiQFV
         2L67rgmyF7UqCd2BcTDJ6AyAieb/HDvrWlLkAYVCMl2pFV9h7c1rlqsInrxE1jB/VQvr
         8qyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5cJdcu+YDdnRpoAz1OPJ7MYrsJTF27jRTERNkyZHe/KBl78KPCj+uUPCUHJiIlN4MkdDzKa3jTuU6@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvEFvRiOk3xwhswOj5XQHqu1ruEUYmoIk2d2raq/DYwbe6Der
	g6pvw/bZZSKg7xAqYydoia9qFBUSz/a1yigyCOgN1Iw1mLTzyNXjzmPF+3HqC6lA1mB40nvMBoS
	qifU=
X-Gm-Gg: AR+sD131GkCsb85SslqeBs0hmUwvp1cni5Z2uRhOGWRb9bqTSjr75KM0kxU7EiX1Bn3
	3op1BR5lherymD2KvWkpraEWgMbfkEkGajffb0ukRIq8djMhrthum3VF/gUoJi/bGSF+Ung9zXO
	9NhzNM70gT+gvmWpOjA7RQDS7i+M/ohdmT+QRu41IMDHn19sy+9kNDfJ1O1d7Xhwdhxp6bKA1t+
	twrwCtlZiUgLqdfjxH7o4/V0O+YSzdtvzGsmokA8N555fOl8WPPf1GNocaxGWz1qyU+Y8dvF0i5
	1jNjQK+gRSkxZTQkDP+lgBiaYCCicIthXS6WUp4SkuKIXI2v6nSgsq1gTmoStRtQL9LYsOCGbai
	6YsiUX4HQfqHQNMxr1F7Ss7Z5rsJHUy3ouX0uMH9WnNwxeIP8aVkZS3H1I+VYnW+e54ZhBErCy7
	dH/C4QFRv7jJptIVLJhOKEzohpubp/8HDjVGKgqbSZOA16wxhbpvG3qCmE8VVrC90odrNTMCkqV
	ycV1jWGdnClGAviIAcrkIHZpwhDW7U4JqYt/Rcwgjn++XCFDxcWOrtaitfBoj9RoQ==
X-Received: by 2002:a17:90b:48c2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3933af07e4dmr18029064a91.4.1786960565893;
        Mon, 17 Aug 2026 02:56:05 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b4383sm1692047a91.15.2026.08.17.02.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:56:05 -0700 (PDT)
From: Kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: Kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
Date: Mon, 17 Aug 2026 17:55:50 +0800
Message-ID: <20260817095550.648774-3-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817095550.648774-1-kaihsin.chung@synaptics.com>
References: <20260817095550.648774-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Synaptics 4384 Bluetooth controller
by adding the corresponding chip IDs.
Verify the change on the VIM3 platform.Verified
that the controller initializes successfully and
that firmware loading and basic Bluetooth operation
work as expected.

Signed-off-by: Kaihsin Chung <kaihsin.chung@synaptics.com>
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
2.43.0

