Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213F221FC6
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336509; cv=none; b=dkHQ00mssdFaZXhOn9rX/k/UDIGkLXhtjuWWCVOnEBLdQ3zOFbJVtaNnhOwkxjDXpzUNWa2fVxKtvuHgw7/2C0E8lrgAWxe6/SdOTqSafceaLAZeEEsvn/Y9NHXgf/LWFQUrR1rXeBujYx924GriBC88tPBhf5JFyL6lHI34xpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336509; c=relaxed/simple;
	bh=TxzwFKiJIPCCxZO7aT5q2yoHecnvGCv7WOi02z2Upck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8FZxHSLk0xD3niGRS/CHn6Gj2REccsfWSLQFPWxa38MX68cAum4jQsHeaQigeHnfdV1WEn6BSqPTD2h3p85n9FeLJl18QzRovTwKsqrHIRcgU/28XlaF+vAkkjKiasoPL4McOzxOIoggFVosGNNDPrGWvs5tmEfF5HBnp8Qs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psnXqlbx; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psnXqlbx"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12713e56abdso7931579c88.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336508; x=1777941308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=psnXqlbx4GgKxUZsDXj1DNfxvsfMVngcafyqc5kn4NRsTGqGmERr9IA49Wc8K3ea5i
         QsQgTe8DXkbEFVSGCAcB0mXtM5SlJ497ZSwcfi5Q+rn4f7TNCHlAUaLRxWRccqTDrpbY
         9p2TyvvXcKfqv1sIaPFT517190+EB490yIqcnndnBadDjTXjKUzw5o41XdfcqN2G5Wpj
         YJmtP/AS+I3+8LPnTXr+iHriXmFWxt/iHfdg6p8y7sWKc+1aZRKWEKk4C6GolqyHyrw4
         /g8gOt00CoB6LpZamTEPnDjMPIYuw1eTm5+bYhTk5qzEpomuKGB6bVGXwgkl9kSEFo4S
         8Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336508; x=1777941308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=PuXe34mpPEGssLNrveazb46JXkNX6jJl+l54W76oG+Yz8wuEA9B5iO0dpHhKa3azvo
         EfmWY7VPzEIUEDk4xlkoobEqRPKjayFJ1AlzZcEYzjcot9b8eprd3q32Eczl6NJuD++o
         G/mXXa2Puj8ll+nPADAWIiLOu2rGT29Tw8LFC7NHJmiF1vkxtuMNDnbYLI4mc1lvyvjI
         4QfiQpurixuR+kliBI6npA5Qgv8M3STJxB+jjQFkIQwDzifeuYbrp1XNjHyh58rxTlNo
         izsWqlOfkrMSquYZ+SR9CQXpN81Zq2MkozvAMPe7qmNp+ONr3C5S99kyI9BIHZeAFSsj
         kYCA==
X-Forwarded-Encrypted: i=1; AFNElJ9JMiLFt4qVSmlth0hChyOsgny+usGBVSrYC5nsZHjukmDOR4rLf0+ohMBUitNDkOOVQ5HWIeFU7a3E@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbtf7scBCif4JpjRVTA60Y8DmOxmrIcWaGlyeMdfP8Js0x6Wy
	/zoTkaFkVwD3gw2x2G5D7S6Yo82TsBwmUnOochi3ixlZjXpI2iK0OoeD
X-Gm-Gg: AeBDietfYksc08xqmBZ0eUNssNXOgqCcr7pnNYZdpmi/UeIwicZSqQ8YFYmo3TDJ3nH
	zcCi/aZHlaOrICRODVC3DEyuOFjzgDmwFnqt279RjhOrzxVDfsxFYx2IY6zgs6Hj9zTffDscYqp
	G5I07vrVL4vIC6jYEfeXpJn74hgKFhnmB7GDCkkDEqjKZxJSkW/ko+ArryvU0DbtVlP8/4/g4Zs
	xYIxRRGuZhTBkhVE6N3CiiSEKCnkdPzikWn8OuED3VlB38UF/+jXI9p4esRKAwOICkOHnT3eOEY
	4vqJiXGEobcrQ5B//3gvT3KxdLHC6rCwZ7sjwLtxn5FxVnHPg3xJYnsASLTAS7qGkg2sksc5lX2
	KrA+M1m4UU6ROuCpljIqrcj3ZntjxUb09nkpWXdweXEt7LMCpJvINsSBcd8pB0uKZeiY0nbV/Ez
	w5AvmoAKvZhXkWSB27oMGUgDAGEyzE+fI=
X-Received: by 2002:a05:7022:4389:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dde46dd17mr78361c88.7.1777336507716;
        Mon, 27 Apr 2026 17:35:07 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:35:07 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v1 RESEND 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Tue, 28 Apr 2026 08:34:12 +0800
Message-ID: <20260428003412.322032-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index d2be996dd4ea..5db7d91c6a34 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -487,6 +487,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0

