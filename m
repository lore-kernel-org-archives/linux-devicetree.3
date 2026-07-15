Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591B48B367
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130746; cv=none; b=IA3uIfO0uycJrg1yF8bIVqDfpZWCdzGcJvy/2bHqayXExyW/4lbqNShfqeGTVUUIfvaFSBWoWYDHLVBB6ylkyFr6oPJ/J4a/y1PPBg8pRFFAHlZHnwX/AsPpYEQu7MDYzshj9p+z9AlD9YuncsOd/5uZaGw8CckCCPWId6GcUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130746; c=relaxed/simple;
	bh=lIVOwdGAhhPirlQQK6szS6c1vrP2rs9gWB6YDMsEKPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUjnGLcn5HOVSJI/U0ATNHqDJk8DJojK/uDERmOA5M6vQszYT7zkcNzs5FCur22mGkvtLVNdayTtiipktgibg7lZDChqJ0fOgUWxW1lQiWGXHaMvGaYgxnhwppU0jAx7lg1DpY9/AnUaJdD3MG2b84nTUEUUXFuoxIk/Hu1BF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=LKGux8Lh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="LKGux8Lh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so13695165e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784130742; x=1784735542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgXC/MHby/wv6qNRBIevUa/OsJjo1nf53CtqCzi2LoA=;
        b=LKGux8Lh6n9clVWQwuTNo2VtSEgZKAgSWgrOF1asqJ20zBcEjsCY4u2H/an6r2eYQl
         VEmWBjgXlJkDwvij3iUg3ysCA27eF/dnqt3pO4jylmBP8Nz8w5QrdPDNzQc1ORClFDl5
         jc6hSKmHOYwS3ECWo3tHGzpTdl0VRGCxEwx6A5vIBVOmthB7iWB7aOvvykRAMiROPXme
         PwaTKEGw2SEvMi5uMhAmib3WM0n++bxptjj+ZsBSJFQqzQ5IbEvEi6iNyGY43ZwCjpUc
         0MxHVyuwijQuJMXSgWVnZ66UO5H33Q250PAmryFiPfrrOnuh7PesS2ogEn9DyTUwn8bg
         dhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130742; x=1784735542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgXC/MHby/wv6qNRBIevUa/OsJjo1nf53CtqCzi2LoA=;
        b=Fm5ryVx6BAx0pi/EeRspeVJcic7rKp1ATu8yB4X9fqhVIIEDZlILsuxU/xP9Q8rwKF
         0Ej4OH6DKnvDevKXe0N3pXJmas9cqE0mE0cpc/WNbwpTNscuI6XBGVNWNp+TeRa3H0je
         3H2HazM0MaQ5vV7mBVLiGMh35r+Ma9lFBEvqByIlfbs7nYbb62C9on3YGvEclGch7zEN
         qHWcRg5z18n3hpPd/Xk7Q2SWHxC0ggdSkzMSanddLHGHwWCZCm/sMzG7bes1PzZ2kLjs
         iiNC0AXmYdE3lDXvw2E+KeYfPdulDdlCTvt4NXk6QVM+x5TL/TfT01FpeHZpMMex6nKw
         aXJw==
X-Forwarded-Encrypted: i=1; AHgh+RodWXnqJFiSBnmvPxHf5V0/ybNxFRdqpTPmeB/QkbjKGVgitJJeLXWzokHDdSxgdahjgRYcVjA7LZhA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc56rnotbCAAydiWb0fm8m7p5yoj1Q82ZJC3BFM3jqMm9OAkFH
	3u84hAyILFtVb9xDl7sdES4m9gXcFpxgVRd/BrlOSEsyJkpgbbmStsjOCFGgHTIj9Yo=
X-Gm-Gg: AfdE7ckRgBEU7rqqu8jy4yTnHUmQBfcwEzJGfAz91leaaDeCj8sByjr6Rf4LexpAPCV
	Btuww3+0sFDtXlpAXztZ2UNLlqiphNAb+sC5Nni7hoj+sNyOMqfkRL59hDJyU/dxoPtJxQ7IBq/
	teJZOrCn2WFZM/N3Bkt3oy0t7xo2aEZjz2aBC7CAOasnaSOpKOwOrz3vu0yB0KmBRF51pUWxQP7
	gniWQohC82buZ/7HS3vrMqtbeQTNg41lOquEGfHWvkKnuqPxuB9zBmJjtX86EigzmzF7+sJoXDW
	Jx26JGIIVWC/0EkoysVKvQppTGLvAePClMY/Mj+WuHFpXh1jNzDmi0hemfNdXMa58VmlMJQENA2
	KYV8yrmPtG4TxOsyeKNc1KC6RFBwbgLnx0PQUziMdppnhq6RANGGItJrOyB+hUhlggsPX89kW91
	JNzwaaO4tK0+qf71Aet9NbTpu0qQ==
X-Received: by 2002:a05:600c:26d3:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-493f2a85ac7mr153944205e9.1.1784130742202;
        Wed, 15 Jul 2026 08:52:22 -0700 (PDT)
Received: from vkrawiec.lan ([2001:861:2128:c8c0:8e98:aced:6862:3133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e5c3sm16621663f8f.1.2026.07.15.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:52:22 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH 2/4] arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants for SYR828 regulator initial mode
Date: Wed, 15 Jul 2026 17:51:39 +0200
Message-ID: <20260715155141.128601-3-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715155141.128601-1-victor.krawiec@arturia.com>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using a device tree bindings constant over a hardcoded value

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index d9ff777b4913..813c3cb1b71e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/silergy,syr82x.h>
 #include "rk3399-t.dtsi"
 
 / {
@@ -448,7 +449,7 @@ vdd_gpu: regulator@41 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vcc5v0_sys>;
-		regulator-initial-mode = <1>; /* 1:force PWM 2:auto */
+		regulator-initial-mode = <SYR82X_REGULATOR_MODE_FORCE_PWM>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
-- 
2.43.0

