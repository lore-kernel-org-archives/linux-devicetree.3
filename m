Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A993154425
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343678; cv=none; b=n9u7slCcSlm1izgmbtFnKOOUJ+KLTjBqwRhz9xHbFr0haHaYScGNDGtQAQF56luRKThbDE6vuRC2QwCDQwHTn3hgGSV5/kI93YEasms7KERWIwJUrDoWHoTKvX4OAGgpfnxWZOMQKFzUZZ74swPBMnareDWVC+0EJbm40hzRQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343678; c=relaxed/simple;
	bh=TxzwFKiJIPCCxZO7aT5q2yoHecnvGCv7WOi02z2Upck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtL0zvPLbUErXWtJvuKEmiIsrpaFukkawXtb8f32ubVm+7RnWvayGHevLGnebG/FEDgHVXTrMKWYgwHrckz9497n4gagxM3UgDAxK18wl6Zcvil3qVmqb3yJAukrFJaKWZUtpRY4PnIX/UP555uRlMHtGxhh78fQKiIgVUxqhYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHpV3t/O; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHpV3t/O"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2de831d2b20so2392088eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343677; x=1777948477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=tHpV3t/OU5Cxf7ggLAG0a4Dgt/Pq6L8FO7fnmr8gMG5PcqMsDaUg+P7VOXxhKgiaeE
         o9j16f7bj9Rot7xjFMNoX5rtsCtlYxj+mPUyEhSZDlK20opxziGzs/0X+bWwmD8LuQmy
         M2RA1GDUrHbu7nKu54U2vt4/DF1w82HOyhQsd0XIx23JTsRAsXhzCnQTlDocwrTQCarP
         EDbPAiiiiSgPci/WwbypRSSY7ZWND0F7G11xHGiDIJo+SPnre6k5APgpS/uiA5fR3uCz
         c0GFYSzqPJXXLEeKEuXHAnQlsK/Ej6dX/Olypl/0DQrU2kSiD0J1pr7mhYYTzk2EHftG
         uWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343677; x=1777948477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=bIkvFIp80yJeqWcjSE3Z+VUxj+Fb9o2gLwIqtyEYcM3Uzk4uTmpsYyqtzzGSgUeTZI
         dSEI5KHtjEHmUA1milGQ7mKz28cj3jnXNMvmRO2PMGIKXiN+kqWRJGDnl20aP6T/LK5U
         tjy7j5RrDW/EIt26BeTOcdja6MK87AG9IcssrDTX37A5ETdOcirSYpsbv4RKNE480ysc
         oUzvpTKRGg+tEuLwHiJd98C9zlWIws3btxVZU8jir6IpeN11AjZbwt2TGyV3EW8bQEoX
         TKk7xZBu4cWZ2ogS4TX0wbp0Ty48YbTyUSNgNBAlFL+I6TuskUAFvnS6PO1nPd2HBJV4
         bH9w==
X-Forwarded-Encrypted: i=1; AFNElJ96TgrOmf7TmqPwUZw7NP7cnJieLWkrPbnUulvFgvz60odw5hl2Z0vgSp/bDl+vuT8yKH5PKOPbzdS6@vger.kernel.org
X-Gm-Message-State: AOJu0YzSe3nj+h4tAEtQITLcMlozBlo+JHUwFjFEMovbXMfyGhdETU04
	Nbq2SVORi1NJG0W5pVzRE9R1hfCF15WvcRhDAUmpE0gG2WU4fssngIEU
X-Gm-Gg: AeBDietai+LGY26zg9NVXzkFZerBNtuOGvGYCanmsoAL/uXN3H6zUqjc+rxki19L/8x
	hJY43wyJcGU8txPFdRSxniIuUU7hdoKv0CNEL6uKXilThpF5+LxeexB6mxy/Wqi/SuXLiIZAV3c
	rc9pb0Cimw+VEIN9q7mmoX8y2aXtZPS0M+gC33EXtPH020RflWziabzpwi69owug/sQThyDQT9m
	CL6s8SKheMtAYBya4PToolQKDFYB0j0pvLk6D+H5Gto/pJhQoFGeM4vR4Lp5xIZImwgtQv+0KJJ
	sR8umbYzLemkYDtv7vojQepjZKZWUnf7y3TLtlJdU09C7onOOVjjPK6NVi23JXqXwidmDRXfi2z
	fo40piC+AuAO7zB8xL4vtEqtz02SOYxL0ihAyt4SaUWVBJoiO9ZVpmNC+KAgMu5mykq0vFzvg+t
	0ciM1STdz4ojenM8ceiZyhzE3sz1JAepQ=
X-Received: by 2002:a05:693c:2c97:b0:2c8:7172:3b7b with SMTP id 5a478bee46e88-2ed0a0f0da4mr814244eec.18.1777343676781;
        Mon, 27 Apr 2026 19:34:36 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:36 -0700 (PDT)
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
Subject: [PATCH v2 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Tue, 28 Apr 2026 10:34:01 +0800
Message-ID: <20260428023401.330308-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
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

