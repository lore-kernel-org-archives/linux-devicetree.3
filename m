Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003733B969
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292553; cv=none; b=XUjhwadUJ5AiyrchTp8547R3Y6bfaONznDw0NYAFaWymNanHuJCOo/9tU5vD1dcEzjC2oyc0BH6EiW2SMI3GmEYi2lzR0Dv+3UdKVEHjFGpx+oid0ET5MsQXXREz8NGEhe4aQbl7BoMBqLhTYbV0sS6/CSlwDdR0dtPUZj3gOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292553; c=relaxed/simple;
	bh=OME4iRZ9Ykq7ao0fF8hkOXAZOgTqs3ImOztunYTtt98=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=RaMIE13xZ2GquhG4Ubu/h7Iokfrc2WJQz7VozrrQ4wKyqmiYLWleYIRYpUrgFVxYOlPHWH/Ht75s+TVEdqC8DkyDq4ZAZE7CGNrSpHYzlXAeSa2f58MUB8U4VBoir8I4j2yxRQJD/39gaVMioeRiGIy7YhpK30zkwwtk3azL72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvLMhsli; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvLMhsli"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so59898105e9.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292548; x=1779897348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLqtTlusJPJ3GUT/Wg/5pbHzqJxtC12bc+X9tA+WV24=;
        b=TvLMhslixZgBPKYpA7Zvc8fIcGicTv7G9TPiPTDGLJ3oqrnsUog/FnaQsZc5iJHZAI
         9zdLGDfR6XcaXz1f+vhYh8/W8gDYUVmL/jJsHAvp73kfNeEbdtH45JXUrFCQEzHSi5Ve
         j70fiJt/iMTdA53zqDG5+7ZvK1LEC76QOJtXaslXwsthKs59COS/v0AdsoPR8h6zk/p6
         XnIr6I4HD/E+y62wrYc+fH/jPDHl++rNkvjARaHDGpSx6P4vjGv5cwGTCqp1RyJ4Y+I0
         cQNMb92Pypr+v6KyN6ZuI+tBTXC/5zg1dv7exKJNrnIZzE++cNzj2xidVvjJK/zoVAYL
         ApHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292548; x=1779897348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLqtTlusJPJ3GUT/Wg/5pbHzqJxtC12bc+X9tA+WV24=;
        b=nPC2JWZh4pdXGu+Z+34US+iv1iGNvw+ezTS+TTtjKEuZ15ZG8JJIihxaZmOtM9h8YS
         QZSr7biPm7NyONpsck8C6BncQaTgjSBpaRiAYjPWldGXfJTkV532r+0EHqExtDAJprNS
         91dQJr8Ezs/+Yp08zsEyEW6OHoRB+CsfuanKgbggf69WXcmVFMdccmEpJMAYdpJ4qgVv
         VhYSoG17IMbALAMsBqqpJRpXmoVZwQtDA1iEJu2Gn4stjGAbN8Cexo63BxQ8fkzp48p2
         fInRLFUNS7Dhsn05KWclxaZZcksLNMsx4qiukdknQKCgpCb50qopMNLKzscFp0euIPhB
         xG6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/twHbFBY3LQ25Mj2WyjjKkzpUjqNoKarSMm+Pb85TwmfhNGNo+bzKWaFVoRZMGbZX2jT2w6CpYPttT@vger.kernel.org
X-Gm-Message-State: AOJu0YxIdQQyIv/2qu9KWEejFTLymaFnR6QkcuDu9gC3XO//SAZhNIy3
	dKhb3Fn7/bdw2FR9evyHNnB1hdQ6nKBOmsWTSTT4tGe2bhp/To0XfZ7fiX98KA==
X-Gm-Gg: Acq92OG3muyfZIveBKZOP25pbBhavDvpsBHBDqUruf6FWC0lvPyFK5MYi5YfmON2hjZ
	FsNkp+CoCCRH5v29in8T5aeyoO4iGKBaLNY33PQDnxzozd1aCSpuie9EUd9u7bg0UncpI/36XuR
	yJ1OH9AWSVMairIz9tGhTLiAUFpA12vBVfne2HVeQuD1I415GQdz51S4fWD5OMcHoshT32OEGUU
	6NYDrobXFqXGVzL6/XsfZxq+tscN3tw95f0I7dnG+ZfiUqz/Lqqzpo4ZSfBz1n8b4QIv+2qSisV
	iSxSdVZFVGGYqETf2tNHePyXunf4CDXuAxsAQLZaA1E2WO1mbnKr12mG46i8z54uXJae15mlGKj
	mQuSJfHDnHIoiGXbBU6ko906gRidTglTsHUQDLkGu47WO2ui3xqFPmtTLLLTDP7E0MUfTBMrelJ
	HqY/zHWuv/rCRqY6oIvo2r70x1iie4OIoTXw71IYy4yPCu577bMhLEwsK5pJ4MMOs=
X-Received: by 2002:a05:600c:3506:b0:48f:e44c:e058 with SMTP id 5b1f17b1804b1-48fe60e13e7mr364388525e9.1.1779292547501;
        Wed, 20 May 2026 08:55:47 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fed253f93sm132123215e9.16.2026.05.20.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:55:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 0/7] thermal/drivers: airoha: Add support for AN7583
Date: Wed, 20 May 2026 17:55:13 +0200
Message-ID: <20260520155525.22239-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series implement all the required changes to
support Airoha AN7583 Thermal Sensor.

The SoC dropped the Monitor subsystem and only provide
temperature reading. Some generalization was required
to at least save the common code with also the help of
reg field API.

Changes v5:
- Fix alpabetical order in Documentation patch
- Address suggested change by AI Bot
Changes v4:
- Rebase on top of linux-next
Changes v3:
- Property use chip-scu for thermal sensor
Changes v2:
- Update DT schema patch to implement dedicated schema

Christian Marangi (7):
  thermal/drivers: airoha: fix copy paste error on clamp_t low temp
  thermal/drivers: airoha: fix copy paste error for sen internal
  thermal/drivers: airoha: Convert to regmap API
  thermal/drivers: airoha: Generalize probe function
  thermal/drivers: airoha: Generalize get_thermal_ADC and set_mux
    function
  dt-bindings: arm: airoha: Add the chip-scu node for AN7583 SoC
  thermal/drivers: airoha: Add support for AN7583 Thermal Sensor

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |  14 +
 drivers/thermal/airoha_thermal.c              | 380 +++++++++++++++---
 2 files changed, 327 insertions(+), 67 deletions(-)

-- 
2.53.0

