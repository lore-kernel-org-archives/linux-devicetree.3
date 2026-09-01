Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF33441A508
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230017; cv=none; b=ZtLUmxYWzstE5m7O643Cs6FEUAqH5+PoNq+oj0OAXw5i8tcvEbx7agKg0QuYFZTKS66CNFBnA+JvXIPMub4Wz3oEkNH8gO1o1lM0uHHwW0ZUYjelQjRtBrX1hfinMCzfAP67P8RHW19VPZYR7t2tw0jIkho7hscOsz+8ZBxQ50c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230017; c=relaxed/simple;
	bh=8urEIkOEgNg/W0WfryJCD+eWZUJUCTF8wpI/6h2nZwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DX5hxYL9J2CK6Z13ny7gh7s6nuvvuWJBQ5pv4614C0l7sw+CrncMfYRbBQ8gvNJGOYmZHchoPEDhAKbdFzWWJAMReDXadAUswxd7gjzu5brtlv985NWMZ6zRxb8ftWAbhMwJOR1W9HIsF+nY5zF6x2pOOa67W7NxsZRKRA1ZboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=M5RsaTMq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="M5RsaTMq"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-853c07a76adso4436411b3a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788230014; x=1788834814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=M5RsaTMqgK9nMKs3Dn9KF5gvzLPK9Jb5Qw/svqH6jK7k178EADKUYb79jYvty32VmY
         UxbyGIZxwGiRzxf+rr94C5+D+MXxsiIlad98TbmSyH6XU4EiNQL7/rzHOVp7gsmNjNh3
         wV8RODOwsHWvv+lTJu5IZJi3VGnoPnop+i58QJeMJffBlK3wjciqHdebbq6smF6IRY/Y
         w9uhf8zRrgWBCbwiVC6/71MYYnD+Zy3t7BcheaWZ/Xe6MjdDWPyMn9npV0SOJV8JHIXz
         LhIfRPdvvH0Cid5LUz9t/43V+2jLUxPxtvZ+UwxbdDOJ9yccdC8rsNSJZeuK6vu7vyVt
         dQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230014; x=1788834814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=CZj4ySeRX1X9jgkeG1kHgyltZQziD6v3xVh5gl5ePv9trH4mD/TY1LMzSrt3j5AgyA
         AlrjddN2oSccAHAHB/M+jT0PZqrCt6DeWdpFJT9ulIYwaNXvmZuv4BcVjuUbTauIV4dk
         cEeZ3A+rsvl5kEU/WyPO1iKtxb48Ls5XaOF01xjl3HZ/ReKv52NA4lfyxQDwg1uSugms
         fSYuK9Ghbyq25qIayat8Ykyz5LOI+FM3eefjVlzazK24cJUFMdahqr7cal/80mhWnrw/
         PmosS+1yqUbqMW4K1mDxqu/sbnvX7CFnd+7Bc5U3DhC4zf4k1q+lBG+ZgYyTuWiqTVT8
         xHYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ron9T6oH/fTUZsa6Lqr3P5hpo/2wU67OVTJYuO/lUsZFjzWl4QX/99Fy8ffifzWkVceB3pJEU5Hv2t1@vger.kernel.org
X-Gm-Message-State: AFuF++nFTC7RoPi+vFj/wrJbJEIh3krb4bYoW0/oSUakiuT1injJCvc/
	q7yW5VyNe5h9r/xCvu7qzjgDCfqp6XBMzn3nbXWO+pk+w0IucLvLaVTu6X2tSYiquQ0=
X-Gm-Gg: AR+sD113w3PY6l/IsB5t8pB14COgUw8/7b81p3D9X1nQE7UVp+asrRQA6lKNUiRk/lg
	rplHXXKZGciltQVWfSWfj3Bzde/vgMCZ/YBkM3r1XDqmtzyjsf7IIGTpp47cGSrLRx39hZml93J
	+CzIhVOl8DOEP7VP5Zs9MggbGQZLj0FrSDxIi+rpduUhm5bGxfTW94Kdgzc6BjEcLDweiFql6it
	bxuxfKfUz2TSxrcEmsFDNjJU1rqxz3Lpp/mH/ye1YOUlrs9aKocKEz2l25Zi7Pvd8sY+6EZD8t6
	mmGOzpLLuUllDahCE0ELf0xNomIV4KJOPlPB1CH1cQ9nHfqTvDN4BWcs7hyFdojHx2snZv0AFxi
	P2b+r0qvGgZLkIranKclsR2QosJyibYKgKwtGsIXJL+6UsMIJkZM/PvnrqLIZkZabobwjx3MdaT
	DskqrAis43hdd6Be6eUAbgoULCHUsJTdVgLYmcZrgnLnYwaW6T1xWCKo3z6OnOJdwKAFijItI0w
	rb+2nl9STlG3uTbOdyYKRi7/NGw91Fuk98JknHGEt4r8kZHSSYXk2t2LE+T/yATqP9s+VW9p8em
	ZC6/og==
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr52877351637.9.1788230014187;
        Mon, 31 Aug 2026 19:33:34 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm5005565a12.11.2026.08.31.19.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:33:33 -0700 (PDT)
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
Subject: [PATCH v2 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
Date: Tue,  1 Sep 2026 10:33:00 +0800
Message-Id: <20260901023300.1382808-3-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
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

