Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2C48C8DA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985739; cv=none; b=CEqrMWX8N/S7td45vI6ykyOWCAOfb0srVVR8knoglnDSBpIhjHUnM/V0Fvzy33pWqFINHtzDdbwJ7AGWOXWBJJXNzggOCpqIqY2sdk2RfE2QNgYd/aqqtR8zevam0C6cZgg0K0XVmOpZyJbB6gQsViu2TyWaRNK5p1bqEAZO9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985739; c=relaxed/simple;
	bh=Lu3/5yHuoogzBqicGhxPgGA1aDVYvg1NFiEWlLRcr8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lswddV7QRZplQ2vbTyMoSJUR9q6D1ZNQ6rAkjx4Lkoo+822kV0W4yeHnaFot4WJ0RIj3sgemsbfFSIJGenZgi8neTlHJRWJEw8jBo7gpt34PfShNlFueSEqBOPASp/Sj+MMmNQUiMuh09iwrtb7uumO9ZPVwn4wsapUz9gSk6sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFQeYm4K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFQeYm4K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1304953f8f.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985736; x=1783590536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x6ovqqT3u1g/52da0/4nr7vRP4DjhNe/AZQZOSjueM=;
        b=EFQeYm4KvPP5W+didPgTm6ddMVCOha3R/D2ZEOtgTSnuQRACp6v2FdUBEH6d4zUCBg
         DA3eLleQNMgV/QtDK/R8CW+8Y8Q3tJW5DNqUnO5GhsCo8fNkAwV1VF8rKhplKyzDyLSf
         QdPl7+rNIMSOkpDVI5aWZqMIHYFPTNhKs2MfseiVC0+nyot1QQtInIvlY+cPmoghpYd8
         RVKnxBlN63QeXTlfGjrqL0dfXDcm4k3xxYiYk7qvyFxc66paW3+2WxqPsb2mOwBxnv7F
         +4vqMqfEyP35eOWk8FZb7FqaK7cahcyJ3zN3K7RT+QRGT1xrbOgFMmJZg12PK4sGpjWZ
         xS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985736; x=1783590536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4x6ovqqT3u1g/52da0/4nr7vRP4DjhNe/AZQZOSjueM=;
        b=pxe1ecyHUPFWpkEHxg62FtUNOc81lsPW7C9yCiJwP0Z01XIHks8RPmRo3H5RZjmEzT
         xev/iT6jMizXdnx1PA7OhvFDtTD+yWCDy6AODex9gwMFxyf8fFXi9jsLG3pu1OsP1GuT
         CHLpWEhRUlmXdjssskwKmHLE44e8SpKY4c7/AaI6Qp/oa9ol0UCa5PSl1NYGOfkZw668
         RcgK+cqkdPosHG6wiJOQZsrmrbrFLm3btyVKhubvU6415IIqBoDxNWwdU3msFRQS4JFF
         J3s1YWa6iSiG5WtEL77E0fgAQ4nRWyRdvgZP8zMxJG0f9vZdlM1KCed3u7ovuk/uZEAX
         +Mog==
X-Forwarded-Encrypted: i=1; AHgh+RpjgdH6rNTwApphSEKCBMX6gbDaXboHN61Ms6YTsIYsjFEFJg+xnJ3qY9GirQKYQUQi1pmpL99TQjzw@vger.kernel.org
X-Gm-Message-State: AOJu0YxchbYRSbyP57e7l1M8jTF2iHu/Q37bvt87fE0lPVv5IvUEp1RG
	0PVY0v06rgTZUczSEoMUnk2nW6Mp5PrajOg0O84VfZYy/+poFrA2a4v6
X-Gm-Gg: AfdE7clHWxaL0/ptlVHe+qGTE1PU8qQxp+cgETjIFzRrQmKuQXizlQO1VoQjDD9A6r/
	3gC6h4LQaWZBrATEg0mjkFCNgIXghFt3btHyju/csmxuGEssFweisqnJcGHyc/OIXvu+73PTVSX
	59HEPZs9F0Dt2KLxjGBMvJn2LQCy+NVKDPGxgSZ1mmvU60hZlf7fnsAXJS38oYmqmU7bONlWazE
	UG2EgjYtCCRiGw0LvKBwZvUrGCtCyJ7Qr5KUkAcJWjQQU8q7mLXrYy1GbjXUTjE0UeNWr9QY2Gy
	K/rjJATS7glYEjVjrVZ/aVNW49C+plAqwIsiyzUxAxVbB/61at9d0t2CrluulGP/GUnbBFfLMSI
	EUnEBTSN2qGseDBzfOnYy3gkK1RZ2uC1o3O4zS9oV5yNiW7CJEmjFa4NPQwYBP8qW7r0U3HojC5
	kn05Q09Iy87ha0MjN83//2T157AUKLO6zVGFyoOy+GQhPFRbNYEDurF7+G2XDFPIYgtBJkGUI4j
	Ofh6g==
X-Received: by 2002:a5d:5f8e:0:b0:46c:cffc:7638 with SMTP id ffacd0b85a97d-4775a1010ccmr7965353f8f.30.1782985735640;
        Thu, 02 Jul 2026 02:48:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-477dbe617b1sm7381364f8f.16.2026.07.02.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:55 -0700 (PDT)
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
Cc: Wayen Yan <win847@gmail.com>
Subject: [PATCH v6 1/7] thermal/drivers: airoha: fix copy paste error on clamp_t low temp
Date: Thu,  2 Jul 2026 11:48:29 +0200
Message-ID: <20260702094846.17325-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702094846.17325-1-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In airoha_thermal_set_trips, there is a copy paste error on clamping the
value for the low trip temp point. Fix it to the correct value and actually
clamp for the low variable.

Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Wayen Yan <win847@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index b9fd6bfc88e5..439aa011b75c 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -273,7 +273,7 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
 
 	if (low != -INT_MAX) {
 		/* Validate low and clamp it to a supported value */
-		low = clamp_t(int, high, RAW_TO_TEMP(priv, 0),
+		low = clamp_t(int, low, RAW_TO_TEMP(priv, 0),
 			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
 
 		/* We offset the low temp of 1°C to trigger correct event */
-- 
2.53.0

