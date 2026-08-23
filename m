Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60F3CB90A
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787486035; cv=none; b=J9msDyVcLQ8nMURIL6niEQigEmgR+BKvBpuJZYl0G/aDPwYp9oNVywk8Hq3T2Y3Ccfuvv+TMfoqVHETrs6XConr9ZEnS8onzaTndjLghlfnxKwys/sLPDe/ZXRtldhl23nFqkt4SS4IDTTiyAdECcVcYMUUT+UPdSauC3+hrqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787486035; c=relaxed/simple;
	bh=dVv3havpeDsTBU4IBCU9QgSQ+lf39jAeKDEpWEAl208=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEFDv+Qo/pZrm4Axkmu2WHqwkD1nDY0pkuNREcKYW8XHjwbqFEQVNWvvUoaQYkm/+1r4EG9uOcw1CyvUGvFfidM0Qp2Je8EP0bz6sczQrSa1E9b8WgPuR24hJtivv1iH0ZgWHy9L8ETxPh14SMxfs6MbZF1hAo6iSzTsX0AF8YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b02fc590so15658555e9.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486032; x=1788090832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jThRiaQ/26wqHZ1vL8lEl8IaaxJS8aQBBZUVqHcHFM=;
        b=KU6kGNrsv6j7/ilEQTCfAki+DG+ajEq4SOBNn07VIRBecxN+lDZgw39Cj+Ou0bGNt5
         Sl8YQkAlt4ufzFmi18+a02jZdRg8T3NZZfoZBm1fpCrQrNk1Fx7W8fA4p8YLs4RwWfIg
         FzfCM5F9hBH3ainlgUP8kLml3PJXqd9E3EE6I7tKf/BXwyvD493WaJYLLrjEwoGyqDUv
         zch2YfYiDlQQZjsNk7mFIQ0cqdm2urIpGfygzvV6mHyXynbz57jBPzuhB1/F8mzjbTRn
         me0zIhk5SVH/Ll82TW+zMcWYJPvisotZpwaF+XyQQsSaORNi346+wzVoAp/XGdT30GrY
         h57w==
X-Forwarded-Encrypted: i=1; AHgh+RpUccnzKfuBgtno8VSZU+Aril5VmzQYBCtjQUiHXN1D3isiLdej5xw19Tj+aEEwpYVs++/h47W08VfV@vger.kernel.org
X-Gm-Message-State: AFuF++l1iezxY9fiRvM50DplbO1ZLLDoAQpxBHLuvjTIOB+0Bztu1PEc
	XHDH7YWs7pB0HucZtcws1T9OR3AHWKlfRxySChVsKbHjIT+rhqWVH7sK
X-Gm-Gg: AR+sD12siyEx+D3xRQ2QzR1rSNgieeYKZQXVgnh2WGQ2ateAdtyMwPWICAUykyCQPUo
	K57NCJbCn2adlFAOf+vQ78PnsHpmHvJqYjn3p7xpdu++3qm6fP7VrydFgwO9MuTr4KgekP5VBck
	PEljaWYsQNGxv8+MXrDs6k2yQXM8dNioKKx2JSmZVrS4WadXC3CuFehd6GQZCENoLhv7pXQBEZE
	fnhxzNP2KW2qYnIarvVIH3YZ4y1P2yg3f3j3DyxD8mENgcrO5qFEjuQ2PttHjqLdWINrsZu+uBa
	LNdGRZCHOImewi9OsfI7AeXAAZlePZv0Gs8GkLaQkqWSySpqHR2uOcjWXUFGJ2WQgxGkNDRyvz3
	diwHKuLK6QsbskciF0NxoxCMyTY/HKmGvOO4+88v/njgqMcXink5zVaarS6CUu5I8uzUPZGD9Le
	y7gxo7bWqffpNnW0j05x7jRHq7ifhP5+QDW7TJVXMzpUXVJYoWQd4E/dAdjjPuE1RwSR1MsbdBk
	nEvZmQE9kpMLPvVfbrZyg/OfppniSyJLGeimK0=
X-Received: by 2002:a05:600c:6296:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-499b8327cd8mr242910645e9.7.1787486032189;
        Sun, 23 Aug 2026 04:53:52 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:51 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
Date: Sun, 23 Aug 2026 12:53:35 +0100
Message-ID: <20260823115335.102219-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
cards refuse that switch, and the SD specification says the only way
to recover is to power the card off and start again.

SD_3V3 is marked regulator-always-on, so the supply never goes off,
the card stays stuck half way through the switch, and the MMC core
retries forever:

  mmc1: error -95 whilst initialising SD card

Drop regulator-always-on. regulator-boot-on still turns the supply on
at boot, and a card that refuses the switch now falls back to high
speed instead of failing to initialise.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 75d81ad6830d..c94afaaf8826 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		regulator-always-on;
 	};
 
 	sdio_pwrseq: sdio-pwrseq {
-- 
2.55.0

