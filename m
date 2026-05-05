Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5313C8700
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992866; cv=none; b=UD6fs8qfV2SxAPTHc4h/cc8352QNkMUHah9wKUPTZDLOveiW+ymG9zO+IocTU66cbmq5BCDoMg+lWFOAZDOOMJ00OGDDS60qDWyXA7wENjLl32bl03bjc6Xc0/8vBD7TWbczsdc3q3xTzlWxtxmODLzwQ13No/+sbdRBrbuAbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992866; c=relaxed/simple;
	bh=rJN52vTb2DVVuKymo7O4iUq004FKxr0emIM9+MX9QxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMXYDBNqxsxCVYHETM4keXfB90pDme4AoHMJeUoXD2yWVPp8+kLuldx1GnT02HE6jtXsv2oDIllkhpiNcALH+rfLSJyFmySzTUG2l6SMJmHcV5CuE7VBuSQQNM9F9FulSzfStObrc5wPxbXZppE+joh0iKgGO1ktIUcaRTwBqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G80iUVQ3; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G80iUVQ3"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12dca45ca21so7208169c88.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992864; x=1778597664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLqW9rxflpuyRlX0XQVgp9ELHjKVrvnXV/39TSeRZw0=;
        b=G80iUVQ3AgLw7l++g4FWaQ7q7K96kVthl8miu03B7UshH8o0JpUtasXZUbA86oV/ls
         IlhJ9px5s2hT44hNrJuAgBGrGibxB/CVNeC+8vU6lzrf0oTyaifPR502bi0dzQC7PTQN
         l8XCyLb6ASN8th8JaTbaKO/ugNOOg6hjx8D7yb5qVbIDiBL+X2JR0uqGL+QlDlb+vP4J
         Wz4PTrJ2wN/0fPWxPW6J3bwoaguVCq2XYbbyfSnHn4OAXFFMsw50lKQb5jRyd2xNc40B
         MB2PL/DBOIYJHA3/0A+SPmCThENbeTjfpAzNHOnAkoZqOQ3MV5wP0uQsb5nvxwBkWSX6
         oIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992864; x=1778597664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLqW9rxflpuyRlX0XQVgp9ELHjKVrvnXV/39TSeRZw0=;
        b=bHs0B+54hyR16wBSU1Qt+sNlFazW/38nxc4r+DQCykLvy1tqnHZEcBSa1x4VTOstrl
         d1avCdlfkUjM6obwCXAV9lQa9SPEphTr6dBfpcJ6knSWUE03X/M2WyavHqVur8UXlDO3
         tDC/CPYkoGTPKmEIYLF5s9zQVlUXExcFgTp5MP3aFqxFcPbP2MQxYVC8Owmc0IdvFe8H
         G0goWRcLjad2tW2IbSjZyhUgL2IzAvkXQxn4K97eMpyDyr2C9I5bWGKY34iKWHEbB/N2
         12J9PcALi1SbjGSXPFRrvN1wUV1RdLz+mQ3Jk9+7kKLMH2eGQb1z9u1UgNaRvfHnATbJ
         zJlw==
X-Forwarded-Encrypted: i=1; AFNElJ+IWGUxehvDm5S6cfd0u6Szkh+5aPSoSeAjzGBwJqTjdppyC7FlpnLGGHNQEl9L5FK52D0dRowGZh21@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsMEj2nHMd1mhFncY+8Bs373atAsNjXxtAcMyGb3C57gwQ9f4
	130q9VN3dfZN2bG+102njGM8Wl4o9ieYFdAGflrnA5GMNmxwC+i6g8TA
X-Gm-Gg: AeBDieuh6Yf6Zh7GR1Q3kzGBToqg7XX4YTJBi2+noeD3pfG3RO28AQqBoYTagB6D3JD
	6711uSzbu6ypw7MrHqP7mSksEzlZGH+UIwBmWX9UWNKXjilOAem1YsIpk3KWZDqmIcQOmgPtWWP
	xH6XQdfhvdf3nYh7R/XwcWAZlrk1Ly6XZwVYdmGaDV539mGdVEPSGOMDlmmeDjWhrDuhUOZampd
	hNCu1Dyubnu+MymV+Tbc+U/emdGMFdRTIPeg8XIrK7kM0/O2jR24AvR1VnD45bDYDmFFdnOLZ1/
	zoSQeVfB1vlG5UZ6YyKmzSnvLA+xQTDO8OaggC26LslBe/CzM1dxkIG4ZkQuWpw+pbS4YEaypLj
	QcmEZ20two27NppnvML7ppknFpIHIO7Xjji6PTkV+MfrtenkFiwo36UuZFNAJ7XiEv3UKJuHE1n
	IZwm0YCoLgdmMmkshiKWXzZUIvnXN2SLg=
X-Received: by 2002:a05:7300:5726:b0:2ed:e14:42e5 with SMTP id 5a478bee46e88-2f40a18f7eamr1466264eec.30.1777992863942;
        Tue, 05 May 2026 07:54:23 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:23 -0700 (PDT)
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
Subject: [PATCH v4 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Tue,  5 May 2026 22:53:54 +0800
Message-ID: <20260505145354.1267095-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
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
index 57d779e07a62..750f8d899513 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -488,6 +488,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0

