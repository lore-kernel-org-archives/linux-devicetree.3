Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716202;
	b=ca1xWVp7SoGaMP8WsUCtwU2bm/OT4uM4MtoXvFID/pRxaW89sAp1tQE/ix+0vQQbxaR7
	 Q37x3GY1QAoiElJe401cptS6n+0MjI3sI25VvYmBhGkNpL4uKd4rJ9NbVom445v+SGyJq
	 3NiFTjG7FaAlRyo99zs/pDiV4a5VnsK2RD/z5mV2gR5mqH3Ybxwj8mlwC+RAZlkXMjDS2
	 io7hdTv/1LMrwLuHwb/Ie6BtZpuF5cZ+t+qNnt7Cmpmu7RFbtrh92knwkaOPwJ4GRiyZ0
	 GT8UcahiIBEDqotehtWZleJybd+dl775/UFcgVwOziAeOg2aHYhLyONtZ9T2DWvRijg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
	b=4sHXr5HqnxqtG/5B53CYOgHWhaG+b0WFq37coYNLKvXnppqfYeuGafIdz2IeccaimYR5
	 NPrJfRppXa0+tiWg6G+rn0IxMJEwVoGD7jlwHcCmgMYBk+76QgpnTfJIdxKsF99d+YD7t
	 qXR+BOs22cygyOKebwLgbIGOFOWuh4zFfGNH0FHT4Gp14O/1AwsqsPh3auWyLTJAtGhev
	 R/OuYRV+Fj9RxN0gNOfcFMbj7I8VNZWGW7hPxjkZJsjuERVaPni9L+tQxxPzj/lh5uhVt
	 mAun2w+HWRV11Nad9NsUVuo83N87d/12/bQpxceporvG5DM6Eo0tPeBLxHHX8QoFN3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NAK/uEvn";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019AE606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019AE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAK/uEvn
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so4468881f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716200; x=1796321000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
        b=NAK/uEvnGhKF+M0LNPHchp71K9d6SgR6eBnLmdYlhqJ1KvCK/46Wt1KOoRWjBXWu6l
         WOCZDbdb0Ovx0QxqWmOmyDm7ULACSwAYC5cMYH5V+tNW8T4mG2akD47or0ZbbjtYBulx
         6p3piW3ShqB2/U00vqg55ttqjeL9TdWoSiJ3iB4PZKI+JhQgrkW4+2D830//EvEuKmPe
         MqpRdoJt3vbGESd5rlyWwLEMgaExPGhDIC4QmXTiE4da0FtRAxOonWCdqLhm6Fwo3Y2E
         yU8Xig+sETNRy/ZZ6uPY95qiTrLgKw925GwiEXj2rtrZwMnqnTIfYMYDzpgnF0NVyISC
         Ayrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716200; x=1796321000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=byjiEAVbgVFr0Nir+Ue5CFd2zsKVy7OkbkAJjnT09DI=;
        b=CxSUTptL+DRUL2CnQqIj3XD5fv4Lb+ax4ae5g5Qgh3WZ8Tr2kwfjz8cgBq5l2UYGHa
         qa9sdwtfauI6HVE5n6frBHgNmGzn5CHoL14ZY3zG3JYrCPtjCpLL+Tt7fDF0J/UniNSa
         vIVHDTgm/1D6Az9obHs38HKvYaCBI24BrnRZ3SyecgHFtUfT1SI8Ew0H7nI32qhqDr0X
         +9SAJfY2a9sISUsUuIq79vn7CDcM8QJW/UnqqMgj51ECMLP23wOqSkYeITYd2pMC5Urm
         rzx5oK6G3S+R1Ji25Gkxw0rMIzinpHE8BX2jDFQmP68IZgOSU+Oejsz0ECaImfY67fzR
         LBwA==
X-Forwarded-Encrypted: i=1; AL+hErGLBxenFYyHH+CJf2CQRIlSlEl7IGbSjMG2bkqzgAsjVMQJSpcKEioaoEEM/9opZZ8LAADnX0Ydc0Bu@vger.kernel.org
X-Gm-Message-State: APuU4Z8XEH/+1/ZKOjlljmauZbkkAx4mX0PMDLer207SHVXPucLdpS8b
	ObvS23g7hCFYTetBXFtPcu475RkdLwlPP/fYuPAdVMcUe4bt85fP04o=
X-Gm-Gg: AZFdTZefvuiOoiC5XwCCEuDC02mycekp3GNsn/FBb2Ac5quGIe4ptiiIuvgWwGUsuRm
	TF14KNtA5z9oeP2HkO1wN9vvR5+ZxwC6hSLlgYdS+WwukncLiqn1JfpmD5Mr8/8UxYkxA8w9AL7
	OXbhqtAQa0uxkXEWScTu2lvvonbL3zZCbmQ0eHGgFrZKarVry/jdP3XBlr5/ihvu5sA+8ffuy3r
	vdNJdUs9LkOkhqWcoJ7sjYIuPaDnLI6hGCN5I5sKMlKNc7VXFJk93ul3uk5f+suwHHOzGC3AYSX
	4SDK20A6y2MN/n5OidtuYEIaLBVfNcCvvapBTWceg3qT9RsEMledYIaqC0TEkEVvG0bUiq7Byoz
	O0kOc0sB2VJsQie+FPnwm+Vkk2WCjsg6d7/mw7xWI5+EA1N/VSzVM4rIYFVWF8VORU3MTpDQG7p
	BMNEtDQjwzFClJ960yRL37GtK81Ptq3JltMGacu3embTKsqXg0er89+dsUsjmvyxIUZq3IXEkAX
	jtNrJinFwWja0kQGpHVEr3IWsocoq+Sy+4iu6Qj8p3rHSMHPBGUW7DYuD11vH8IcGQ4WY0ESXue
	dBbXiQpADi1tRJbt1xCb45CN1wsQlo2cihpzvXbuAuoQbeA4xPH+8plxznr8ttahn4SwtfTkq/9
	wIpWSIQ0fkyUe1Z1AevLRtkhUA2AewTGrAolQ/piXQdPHH1zPXkuSKJtCfW0=
X-Received: by 2002:a05:6000:1789:b0:491:971a:c568 with SMTP id ffacd0b85a97d-4abb3861356mr40253790f8f.10.1795716200322;
        Thu, 26 Nov 2026 10:03:20 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:20 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/5] gpio: fxl6408: Fix reserved register access and disable burst transfers
Date: Thu, 26 Nov 2026 19:03:11 +0100
Message-Id: <20261126180315.98034-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

All valid registers on the FXL6408 are at odd addresses (0x01..0x13),
while all even addresses (0x02..0x12) are marked Reserved in the
datasheet. In addition, the FXL6408 datasheet explicitly states that I2C
burst read and write modes are not supported.

Currently rd_range and wr_range specify { FXL6408_REG_IO_DIR,
FXL6408_REG_OUTPUT } (0x03..0x05), which exposes the reserved register
0x04 to regcache_hw_init() and debugfs, and causes REGCACHE_MAPLE to
group 0x03..0x05 into a contiguous block that regcache_sync() attempts
to restore with a multi-byte raw I2C write on resume. Meanwhile, the
read/write OUTPUT_HIGH_Z register (0x07) was omitted from rd_range.

List only the valid odd registers in rd_range and wr_range, include
FXL6408_REG_OUTPUT_HIGH_Z in rd_range, and set use_single_read and
use_single_write in regmap_config.

Fixes: 03810031c91d ("gpio: fxl6408: add I2C GPIO expander driver")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 8a7e70180efd9..9f80ea1214e03 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -45,13 +45,16 @@
 
 static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
-	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
+	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
 };
 
 static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
-	{ FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
+	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
+	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
 };
 
@@ -78,6 +81,8 @@ static const struct regmap_access_table volatile_table = {
 static const struct regmap_config regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.use_single_read = true,
+	.use_single_write = true,
 
 	.max_register = FXL6408_REG_INT_STS,
 	.wr_table = &wr_table,
-- 
2.25.1

