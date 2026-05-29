Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB73546EC
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017421; cv=none; b=qj+p9LIZbDPBmYSBgDX+qExbMawVaC2SPllUkzC7si1ESEIYIzvg171YssgWPHYkuCGWq1JEpw+kU+NLkXaEOdxC0ljZswPrI/5fI2xibu1qsLE/9Jsokhj1Xj1jXI3fdb/XAR8hKgkg4W/kr6TWOL2QHEOwbUpwAebk3Z/5k/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017421; c=relaxed/simple;
	bh=CxUfExcfC2j2CyFdQwOjQt81avvtetK+adz1mptIWzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ff/Y3FWrFivQuAi9K2h67WxEmvS5UtPR/g+cYtl/VgrsrkzIWr0i1gp4xKdE0d1oOlKlHaeGweC1RJV9gMTFvZaebfe3wXowCuuRtPf1Hqws9vBvLkSS5jtNEQUvUXxQADAsZDW5EkYSw9OR8W9GHR1H24f2xr6e3183VmWjgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfDc9UsN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfDc9UsN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bd80b3aa13so89519105ad.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017419; x=1780622219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTrHHzkteJU5+guTlUWUv7sIeJXFzgiaro9Wp8NQxuU=;
        b=SfDc9UsNygQ6PZda3h0h3zgrgHD9hTRT9/cWQdzgv9/U5GhSJWla5FetRuFUfcW/qY
         AfoaXWt5Bac1/hN7KQ665LNA7RpqLeMjNb9lrCR2kveb2d0qeNbCN00FFREYOgs4st+1
         Z1jwrkesGyfH7MU4rVBjR2+2cML5wxO7sXel5oo059R5UW96eNJEDv+u/PGLa8E7C+o3
         XjYkmOnrm38OWWvMz9tyHKPzCQfarMKcrEs6cUmmYmAGncen7BzdBPNdMQMQlhQniR/0
         OlHjVEhz9FkF1tSnHcPQj4v5Wc8t/kimmpo9jd5OSFneCftcIqoAZiwrpwXlpQd6SqD7
         riiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017419; x=1780622219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTrHHzkteJU5+guTlUWUv7sIeJXFzgiaro9Wp8NQxuU=;
        b=SHTetceOnys4uj0XpEss5IYJu9lFMldC6KyOntc0qG2yG3fUuvMWtK62JT9NBFzeqh
         u0Vig3toTS3wg1Alu9yU6o9HU+DWav/Q0PVCpzwE6w6gq/M4l1+MnUmdcK9wUHdzYOcQ
         dAZcNUmKoBDoEoAqx0SX/8reISiZd1mrjRt2jOoS5ly3Wd5WwMnG0jLvf5dfF7btTShB
         7mXeUG1qWc59YODLzi5evA+oCJu2W9sImcIBKy3ZRAQ2UC1mFrU7Sc4JLwqZ8+gc7Hg0
         nQA2UZ/2IxHm1GYH6jVWGDAiJ+wsn4gwcSIG8ROF7ud34k0ssmZAGS9ISWaIUp5USnp+
         Mriw==
X-Forwarded-Encrypted: i=1; AFNElJ/E9IN/kEc0cxrPG3RlmtxpFA/7f+QXkFmOfM/o3fhC6S/LYtrYXNKdGgL7w9uCUEuHLifn1mwE1G5M@vger.kernel.org
X-Gm-Message-State: AOJu0YwzC+zyJAatEsKI0SGHia9+JmetusxTt8JBDEaDXKMedNO4a+en
	EEfoZ5R+beDqBldo8BtwjTWgkUC57Xx8TcruqPShVtWkc8UGHWbcDipx
X-Gm-Gg: Acq92OETBHwEeD69CqkSUHl/ledBV8/08chufe4HHLU3GRa3ZKOJbfgetf43E7D8E89
	tbAQO2QZQLmZUX08slFfilWK9XjUOv08vrtwJAUgl/tf3EAxYfNnGK6uFdlPSRtwJaxZzbpzr4L
	AOP4GWMlBTF1mb2oJ5QyUOS96R8geFNV7vGIN/SrWHIbL3an9VZpK+d1besGc7qGZbCrz5IGDpg
	1uytKIhp9CY9oVrE03c8J5IN4yju+MCZ4mfaULXQWNN7ZqGBHArJ9Llwv+kkACLFTXAnJ4WRZr8
	AKwSumSNkNC3mTqNu1p5/2tcH1cIJPzeg+teyWaXTDdnpUym0fxdVA6bki5vl2z7Taapk+2QycP
	9BApCLwFweJkEqcrpVmiEL+OdQGOFc/IJjUcmoLK/ApHpa8mWw7IGXt4VtgNl+CJ26FoHGpN7gb
	8joKiAbxhH2Td1JTTEwbOVyHXBPWaJFBR+MzBi43o/HF/BzDpKDCKnoVOM7A0BFuVcFclY+jp1G
	vRTNkpyNIFN+pEJvASJTqFl
X-Received: by 2002:a17:903:32c4:b0:2ba:de0:1eea with SMTP id d9443c01a7336-2bf20645efcmr10040375ad.18.1780017419264;
        Thu, 28 May 2026 18:16:59 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm389235ad.4.2026.05.28.18.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:16:58 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v3 1/2] hid: Pen battery quirk for Surface Pro 12in
Date: Fri, 29 May 2026 11:16:15 +1000
Message-ID: <20260529011619.9586-2-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
References: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pen setup for this device uses bluetooth for
communicating battery levels and status instead of
reporting it over i2c.

Without this quirk, the device either reports an
extra, broken phantom battery, or hangs.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Acked-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index a1cfa436344a..c383778e241c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -463,6 +463,7 @@
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
 #define I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM	0x2F81
+#define I2C_DEVICE_ID_SURFACE_PRO_12IN  0x4376
 
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d73cfa2e73d3..61ecd840d0bd 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -395,6 +395,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_PRO_12IN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	/*
 	 * Elan HID touchscreens seem to all report a non present battery,
 	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C and USB HID devices.
-- 
2.53.0

