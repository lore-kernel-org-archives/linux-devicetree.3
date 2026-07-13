Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934937F019
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940431; cv=none; b=RCPOY3qBsZqFDHRHSFGdywY7XoLuO6ir3V+QqWRlK7up7ki1WaH00WwbNlpAlplHlVzAqBUOLQG5tydb2ztt4133p6XfqAgHbv1awfdIf4EyHsgUazmW4QPjRnJ1Q4qbGwFGSncNGwSEVf0MtPlK8VdHUniz32dc5VWjKKCIN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940431; c=relaxed/simple;
	bh=1/D0dkm8m9RGrp6ShQKVDBrJTwtBulkbViZ3JXK5Fcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F56RIj0Ps/IpKjJMMTQwV2fTkIn2x3WFBdRrb2Yw4x0SQH176ch/xH5JGqv/qTePvH6iYUMU86ZXGcRi3nggt/7Yh7UgsaOuj2vAB6ApCq57eAoC/871WBE1NsNqVs7hJVi/EcNcF6vmJJYD+9vVK2n2w3pbhZlPlixh3kmyx/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=UBPW76l3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="UBPW76l3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84864086bfeso2968295b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940429; x=1784545229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94cpyEMhcdSe2ohP7oq7+bzKPvYKsok5hBaiL3mdPJY=;
        b=UBPW76l3YQKHJf6RpOROnJ/9Fe01D85f56nIexNINet5NWFyVTyeWXG0Z55zX0gmjn
         iPybyX79hW5i6lqIr9m+98kit89z7Ze+3gfrfObYpubX+FAW0jcx/QaJ8zwhVx6kuIDD
         w3ckC4snNVHF28rcluOkI9avPVTvdjDRsTqGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940429; x=1784545229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=94cpyEMhcdSe2ohP7oq7+bzKPvYKsok5hBaiL3mdPJY=;
        b=oWOAq0TW6hr/9axLe26RQU7oen1BZ+Bq7bHA18hbNe91PmnxTbYKzNEyWdFQKIjy8J
         9i5G+5vLotHWBDbdayt2O8RUpqcMBdlAgb36UFnDqAhuyFVpBzYavzNN8AKXmPB+XyNk
         4nayTiPlEUqt/RVlqyIwe74V+xB13oR1NDStC/Js+B2kxJ2XqnS9WZVflzHd+TtgnIox
         WX45ikuGb0anzhLT49P3eZjJyVmspdD/iMHgrJdbnWPNwGwlYeptW2LDVGQ4kJf8cZeR
         gAdSgN5IczsBlpHJpCALrzWnEy4TYBn+iBhD+090T29fBjFEmJlaXM6S5TncadBApmh5
         pCvA==
X-Forwarded-Encrypted: i=1; AHgh+RrziH5xfJRdgjK0405osPxCqRmqCEy0eC1xaxCZN8C7Oma+/6YfCb+zXPZc9cJTLbVaCj3ltBG2rBoj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6hdSKzfUAEtZUSFAGI7JH3PrJSDqOI7qPgAxe1frWRy8g1C/
	rryuhMdCH9AJiAjSj6/TF45VdkiYIhdZ2joWR0vqPuoG6SrWhCbW8sKAvEG62m17MwM=
X-Gm-Gg: AfdE7cl5EvTWdoyBndFfWoBPYdgz3Y0BTvCpsPP0ovQ2dO0G+ZDT1SZGOpnErHVZYNH
	t9FvrUYV33loxcVzl1f7FxetZ7lCaUbE+ROGqH7c7jRsYJBvpXmoqJgIC4l4etR+FFShcRbazjf
	NhE1fDHxdGBhc7hJBxi1eG70Cd+Kv+8m7wQphjYtE2Gg7yoZPY54FAcUgpk0+bCj0iM1vbvHRng
	genxwoNo1q+XKMSk33S/Q8LuWjP7tjlas/HEH9s8t0ySLP+ONsJEF+Vlv0bu7xXJQLWes0AqrfJ
	YAoq9VDn3GWSuiQhNTru7S6LBhbay2+8bpqm09mSOCemvr6bP3zNXNvPPviJG3ugta/PKcQoWpS
	yhuxMyLHrKQyU3CM4PW0/iKfMeJbzxh3l+DL0umBUxZQfVig7yZW9xOPPyqr0UhISoUQwpMCrsF
	VLfdkQAC4tZyDh8q+7hqiaBX1ZbA==
X-Received: by 2002:a05:6a00:a117:b0:848:2f84:735 with SMTP id d2e1a72fcca58-8488990b6fdmr7963546b3a.72.1783940429150;
        Mon, 13 Jul 2026 04:00:29 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:28 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 8/8] ARM: dts: mstar: ssd201htv2: Add SD card supply regulator
Date: Mon, 13 Jul 2026 19:59:50 +0900
Message-ID: <20260713105950.1346962-9-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@0x0f.com>

Add the fixed regulator that supplies the SD card slot on the ssd201htv2.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
index 5d81641414a2..9f0ce16a0874 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-ssd201htv2.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "SSD201_HT_V2";
 	compatible = "honestar,ssd201htv2", "mstar,infinity2m";
@@ -18,6 +20,14 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_sd_vdd: regulator-sd-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "sd_vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &pm_uart {
-- 
2.53.0

