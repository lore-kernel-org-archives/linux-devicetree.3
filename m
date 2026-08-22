Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128338AC96
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386759; cv=none; b=ljDGi/xqAja+/lEdgwFUuWItMG7g1rO2n6cEFmelQ+dncPT+lqRhrH0bvZr42kE5I7UkmqAQxsAWb+T8H0JuS9KyfPBrgFQ4PPuHlHMPUvyboCa+UKuEZ0S5RHx7JfWtS2lo22y8fx4Cs9qyW/7U1Pts5qpwu4DA2YQoEiVFpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386759; c=relaxed/simple;
	bh=MZ6cbLtgeo9DKcIey5QN1sTsqV+azxfLCKLYrdhdzIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JvL7I3ntIx60W0aXwmwIf8Ytcms71HA6S6hJUbSCCEID/PJiiNSIlT4eJYRGqGFRnsTepvNru6pq3WZZWVoTTvSF4kOg6MfFNvXxiZFhCiE0kQi3seluR4HMwSgOzFrTbT+TfcVjcmsK6cOAne/S4I2QmM3tf8YXOgQ/4dwjv/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU1PD9m4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU1PD9m4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1670dad7a8so322092566b.3
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386756; x=1787991556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8W+kWi80hTbgKc8WD5gFQsUGSWJf7sfWCY60HPdtDo8=;
        b=eU1PD9m4OKWGMIqje6W79jcNl21XBkSEoAWNXFCueEMWa104rk/pAtyXgJAaFJumhg
         ucvUDglTDUupW5I3EpgnqQTFcen//A7LRlGRoh7FEbx9MPm6WtyBqC21AG5e4aWKAUKh
         bjieIQ6lcx7FUkeIuVEcbzQF4jgFC0CJWEa9Y1md0JdyWj1OQ3riEgMUsnh6x3KJtSFM
         6lCB6depyv0llwH/w2MDknkyB3HkSE7NSUt/LKy4piVUwWDioCqAg8OJiV5/JtqFMZOJ
         PVbtQCKZAubCoPLxFnHAhtMJNrCERaDOun/deyMdxqEk3uF2FAVczCazzF+AQB+X47Nq
         ygeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386756; x=1787991556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8W+kWi80hTbgKc8WD5gFQsUGSWJf7sfWCY60HPdtDo8=;
        b=PTK08Dfo6jhJQZTY4NpPsVIwgf6FB4R6RNA445CEwMJc98pn1G7e4U9Gms6XaxWAYr
         +WSeKHerI9rFf0PNitbNsbLKx0TvCg58P6s+ZlGKpFFy0psw6JIlUXyBTZunTnRr5zED
         p1QRkkHcAUJCNVxR2/Ns2QooXmxBFd98fkKXFf/+qgq0AEfgt4aijzZd2K6x1wNHIq9Q
         ZUBu8O+lbyngkyggaF2gfoTJWjqYZxvvcoCtLdF5l0zyVWkMR5LivEoiRIvoT9LVXH0C
         90+NjYT7mr/cwaPdw/W33b8GoyPplW4hWaZ0VD/w2QXeZEp4yWKUFneAJAd/N3MBC74W
         ON/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrAFy4RO1lEr7SGvkCjhze0lNgJ0PKiZ8F6YKEX24mw54CR9WVPpD3vKk7loZhDW34L9YmMDX+EMBFT@vger.kernel.org
X-Gm-Message-State: AFuF++nfqspuOOV7yV6qrpNXYuuWUhAzcIYOPCiwxOteM6TgyY1rw8HT
	yjeLDwIglB5wepCrDOTfqaDsrvbPEiHiC2/e+UU/iWiK/+9Y2j4B1w4J
X-Gm-Gg: AR+sD11o/QAtOtySkggJBEf4A1ZFD4jXyaO/SEDVeAT9XJdeK+YnvRPwD9nzQKT4kTW
	MMQZ5t4BqjQ8pXPKBPiO97DfkiGb6x8yFdqidsb7Wi17Zu7Z6MmqCOApANRgP7+/c1Ma+0HYnV5
	LkQjGMPhYyynlLZCOZVHQt8TmYRIhWNeq/umlNA0lL+CVNln90GxyN7kjR7sM+A8R5QH4WxTG5D
	T3B/cpfR+UVnZuSRKxF9AhIv1X2wr5jzZ/AzgB8m8wKgTMxNzBf0o6qYZMhfWvANTKHjGtVNNU3
	2LuQPrVZ0N0AepAIwjz5H4X4XtiB05YwmqtzWWelTsCH8XOXTIKgfwNEsYetUj82PlfACY5tXGm
	IcXZ/M4/W8jCm5C78wYhGH+9isqsK2ZrUex+lrbVvJ3/+FowO5v/OdtTFYchCLICNGOcN4pci9x
	SB4RjHUSPA5Dv/buOUE0s2bpkdIXK/v4r2qd5R0wTN359rwNMmzdUe87dHtgO7nVs0xObCmZ1Gp
	7xNVvCIiL+qqc02zcSJ8Q7qGug8u0BFtj08wL3aSA2EVl2N9IrepFBCIS0ckDyAtUiCDk5mFxXY
	QJ4tQzyDsUBJPiVHPCOhhTrenH/jSjX6PNYXJa5HcXoEC4xrn8rBhuKLr3kObLk2/l8wbPyIGvM
	KwPcV2YxW
X-Received: by 2002:a17:907:d12:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c2482b93766mr1016989566b.17.1787386756173;
        Sat, 22 Aug 2026 01:19:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm295741866b.28.2026.08.22.01.19.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 01:19:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: Fix CoreSight CTI Kconfig symbol
Date: Sat, 22 Aug 2026 10:19:12 +0200
Message-Id: <20260822081912.88774-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The option exposing CoreSight CTI integration registers is
CONFIG_CORESIGHT_CTI_INTEGRATION_REGS, not
CONFIG_CORESIGHT_CTI_INTEGRATION_TEST.

Fixes: b39b46fb9c6a ("dt-bindings: arm: Adds CoreSight CTI hardware definitions")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 949444aba1f8b..345e93ca39f96 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -43,7 +43,7 @@ description: |
   connection. Any user / client application will require additional information
   on the connections between the CTI and other components for correct operation.
   This information might be found by enabling the Integration Test registers in
-  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_TEST in Kernel
+  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_REGS in Kernel
   configuration). These registers may be used to explore the trigger connections
   between CTI and other CoreSight components.
 
-- 
2.53.0

