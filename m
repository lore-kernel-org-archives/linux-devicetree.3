Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF971F3B8A
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270654; cv=none; b=Ulei2K0oMRSswQQO0sP0RZLIKQTE7U05RSgXe6FfCpfDY+fRsskkNUy0eB6R6xBIZOdb1uD9+HF39DFv4xTk92WTfJ3zInvrOlg/yK72u5Ofab+1Fi1laJ4bcpobOGrdswQyGS2I27FhGPe0q6v/jxM/ZXS0b9cO/nc1Yf/ZPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270654; c=relaxed/simple;
	bh=0AOqE2EFjrAdGDKniFr//4Yf8j2JPet2JLUV7rVXlc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LKexrr/aafDZA1yuDRNNnVtYpq9Ffhe+wgnEa46FUZ8X/6v6BmjYEeYZ4zt0APNfR+n9yocK/EXvDu1c4OCglSJvOW4y0JgyI2ehKvGx9NR9+8Q4j9LwYsUfx+bPf5t50XSt9NxPevMcaFcvCgczIFGyYJbLYpgQJyAfNgQsTkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPxXMT92; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPxXMT92"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56b890d1687so67633e0c.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774270652; x=1774875452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt82d3IVq1vxclytaQLxZv+KSDc3G6ILVdEZ2/6IgDU=;
        b=XPxXMT92CtGhDEgecp3pjtXOm9q9Jf4tdSePOMFL1onR1L2ycGHVhToGlmuwVmmcwe
         xZ5eEwlUdqqQD/Znc9j1sB8R35oP0yP3Wrp8ySXWYeor6kQOUWbfhDD57XMh4PENPSf8
         m9vkl5lSIfNMw29KTkRXEPj8zwwqkNVm/Y2Kg/ksDEYC6b85OpCmT1/hKpAFRYHmASbF
         PfkpVp4nLaXsMGdtIakpQwU9v+3JHwUgmuZH3Ww2/QQ7OefGfBPf2BtZyAi6ilircwII
         DDmDmsvxk+cY0wl/sfExasCNLjDHk3SJOKzXv+WRMTTA0LBLY1Ggi5qm2JtHXgPebrHu
         geQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270652; x=1774875452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt82d3IVq1vxclytaQLxZv+KSDc3G6ILVdEZ2/6IgDU=;
        b=njI/rFI1EXL7okSdStFQrGoEK5Gzc+0yLF56WF6BPEShfycm9FpNxzQsLMthu/jr6N
         mzwEQ68NNJ3/9Q+IqvBhWvDa/P8iA60ZavWPmo/7K41Md1Lwp0RfzEOi6/Nd0N65BQeU
         Y7FyCxGjP4HOErqw8olF+0YCtlF/wJ0h3B1YQ+GXT7PdXeUP4NrDHdG6MmHbhkrVzhUG
         Z1DN9r//GCTBbxJJlq7yAy5TbnX6bXo3Iajkam/ksSw9AmDgYF2FwxPDTU9kQT6HdKy2
         JnpjDT3HlH3dKODYI5VaTiz5GGqFuOtRiKmCYRGwtWndxlLj1hND1Mj6LhAj/sO5T5+C
         DLQA==
X-Forwarded-Encrypted: i=1; AJvYcCW8YYUjj7RRl+WeGPax/baYy6flYkioSbShQ670Azqif99wxe0xC6gQhhEDft6E7ITDZgEEzIiVZ2Fv@vger.kernel.org
X-Gm-Message-State: AOJu0YyTqlAn/jXyTqM6Ew2+lS9q4x7q904gKvuzBz32xYJAPyWXQNQe
	PzTOir5bPadzz34HTSGa/JyDplY/RkI1STkvB1YjIOiPRDRcOZtFIa5i
X-Gm-Gg: ATEYQzyyVO15FZOccPGXhKfDn5qJgHK8FYeAoec/ocZsKVB5L1gKbu5lqAe3bE67kxX
	F5tpi69t9Q/DQCuzgIKehj7MnzOQ2YwlLkPb3T1PBEmEz1vyGd8nqQdTshbn3T0t2c9/CkMw2qe
	isoV+TdIrqhDYACQkW/ASGiVvh0kdi8KyrqNZssqbADv5zaFGJdvJCPe8b1kRDinnpm5cDx5FqH
	tbemOX/F2UO6aO3MYBuuUNTVEZ1v2WH22t3kAvoJnExHmiSzSZc/iAjvcaS+f131sNUS0v7UAJE
	KOw526pXBS+GiwSgUEoFPk/jk7DqkeqMnLqvzwKmcTLuJX2wAehqhkYOjhk0BdkZH8PAtVYEIgq
	kkt5w7qY/X0Sn164RD4cR2fZe0SaE9YqxkghZytNfDbAVa9GEtg4yhO01vYYEm1El+x4g76vVl3
	11TUxHYo7Al+FBjeS6SMF8EGmPbk9FLS9PY+/6Zrzy/Obu/BjTaNAJ+5jOWhN9CcadOsXVIw==
X-Received: by 2002:a05:6102:4a86:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-602aecd2a05mr5411035137.18.1774270651739;
        Mon, 23 Mar 2026 05:57:31 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:91c4:d341:319d:24e6:7622])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8539b1sm7498325137.1.2026.03.23.05.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:57:31 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky
Date: Mon, 23 Mar 2026 09:57:21 -0300
Message-ID: <20260323125721.692139-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to gpio-keys.yaml, linux,code is a required property.

Pass it to fix the following dt-schema warning:

lid-switch (gpio-keys): key-power: 'linux,code' is a required property

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts
index cc27d116d025..e241f93b2310 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts
@@ -47,6 +47,7 @@ &lid_switch {
 
 	key-power {
 		gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_POWER>;
 	};
 };
 
-- 
2.43.0

