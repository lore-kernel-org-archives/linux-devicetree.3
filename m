Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2563D565B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956930; cv=none; b=eTyRBovibPSZVHjSItwLQ03sWgqRo02bK9FmrmsKMuJE0t0u+7O7i2k49G74dRct+/1kJLzFc7ZaC0MaOlwx7t4ABM0yxSGFPPYxu3A5klYoS2M+U/gkXhBiQAZ8udG9sP7yNgvN+WJr5LMzLc1o71BmLnxYUr5g1pruvK/mI30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956930; c=relaxed/simple;
	bh=udQQf33uADz4kDqhV8HES2TfPxczmIRxCcrxsfP4gi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6AndtJawotGYr+yQNvouaXpweE2Qn52DJ4nPu3TVsFUq8p+oPfnAJWYiwIr2Omt2gynM+9glZc4Oz5vVXpsSvnZTX8xRbmEp584V6ErpqDRNziqa3wgSxUZh2mMAX2DYgnoi0qK4eUMTQ/GBnYsEG7PvM2ufXQTw+PCcZ/4sHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4GS9Yxj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4GS9Yxj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so785797a12.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956928; x=1786561728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lou8x/c5K1Pc7pqGvSQaOA4FIVJQDpoBIG0cidJwwWI=;
        b=I4GS9YxjxEOxIAW/SQ3QcKZawJRdxoLAPnf7zcZti9GCA0HMdJmDPSnvtf5yntP4KO
         swn7vR8rdoVZYoAO/3KW1qKoKQDQbL7XWNDsBYG0/s6f6nl8oQgf8UEDMRMM6jaht9IK
         XGEZfz3xx42K7zXV5hHdgd055ER+tmePJ/QhZYtefrrS7tRf2YsGfXoU+t68tV7a3bCn
         AOUrKQ9/DoOwytsFD1W4ZgeKzBVvFX/SMbAW4cN4EGf4qRprij0nvyYKlhoNCSBpwCl5
         EdwJg8Epv+zNRO0O+uPr0axsWNaSsvrR70T8fVqSzoc3e84h0LW8q2Ey5Z3tSdvqvjW4
         x58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956928; x=1786561728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lou8x/c5K1Pc7pqGvSQaOA4FIVJQDpoBIG0cidJwwWI=;
        b=BNshOOzxNnM0s+zVPzFwouhZUAqY816UPTRFzZIvWl5phA5F69UNRjAYwOfOuB8bKQ
         e2qOiyUzzYzzwDko2zaYF8h0b7nYdI91Jk9r4Ldi97bWRG8PQlgO2syjJN/9OMuZCqfQ
         +UCRYBentPx05yvZP11LgcYJfbteCA+f9/7DtET4fo7RfEYvlTSMx2/A37rhAFOq7fQs
         c6mRIvjeLco6cb8qbnoM8svUHA6BtsGSezMJvlF1XjrnM/4SX04VoySx2PZu29kJ7Lqi
         Lb0xYrqgYogx4UjHO+XlPBG6RiWgKFn6BG3skiLmcz2fP6U7/G2gPWIGVhoxhHczlFGp
         +3dg==
X-Gm-Message-State: AOJu0YzOPEQkN9Z8Evgc2grSTT/VWEipVa17dadxEC7yTnJByaKWW1HF
	IZPxs9RpmYBC2IP8tVW52jcm2hgji4z+jMd4fQbw9bLAL5OVSJcp/3B4k9OyEQ==
X-Gm-Gg: AR+sD10NyEGlHrGU6Mdqq9OvixLU5W4fn/e88NIIwUE3chFN6kJ6K7kPafUXlGQb4Ph
	gLSsKIFIoN3ejgbGrfCSacmvp60sTgUU/nVhYt1kfMvpttxZ01oJM5LmXbFGucnUQZCObMchTZt
	JDCmwLn7JRZAF358TjbxmMDp6re9tAFMfqYk8xdwzZcvAsgR+lBeY9iy2u0mo35YmA+V8YfYNV5
	pfU+0WzYMvVsnn9wvQCj9UuW1uTgRfDYBE2CTRfCtEMZllDtepH2WHGYioycy9P/ctb5f0MPd1K
	LrWR6m+ik4mlEZQ2fDo/31lU8V1ofHhQyqv0wMwcfQPZ8Yr93DrUMpce2broaX2fR8xz0l0VUd0
	mZI7k9dQoynqkSx/mnyONNBNiQej7h4rJvx2Kc6KSN6G/Fgn7OomGowYjg7/Pq2n6+T2tFB0zyj
	YE8qlcU3dMBfgK2NOKxp9+V0OSEIE6g5JJSli96dSqjgtCw2XPAdmMa6mUbldIXCWsUb4fMnFDx
	7YQ7mmpp4g4A0fGt5IonKFGIWNetCI9AHo6RZu7QKJez4xM2TMQBYe2hE9ADTR6fLR8JE9d6EO7
	Zw/hsVXJa9HevEshs/oC0GykEPO94jwXb5Mlrq6i/rwo7c87
X-Received: by 2002:a05:6a20:734c:b0:3c3:91f5:82c2 with SMTP id adf61e73a8af0-3cb85e788b6mr9871329637.16.1785956928400;
        Wed, 05 Aug 2026 12:08:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707ecf6bsm2122724a12.10.2026.08.05.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:08:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: panamera: remove reset-names
Date: Wed,  5 Aug 2026 12:08:46 -0700
Message-ID: <20260805190846.8312-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reset-gpios does not use a name for GPIO acquisition. Fixes dtbs_check
warning:

switch@0 (brcm,bcm53125): 'resets' is a dependency of 'reset-names'
from schema $id: http://devicetree.org/schemas/reset/reset.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 675967a1ad0a..bdbd0f097925 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -146,7 +146,6 @@ switch@0 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reset-gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
-				reset-names = "robo_reset";
 				reg = <0>;
 				dsa,member = <1 0>;
 				pinctrl-names = "default";
-- 
2.55.0

