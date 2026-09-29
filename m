Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7575443C29
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700757; cv=none; b=QnJDA2C91Q6Ewh1cO3ZLhNWxgGWrnPkI/ZZ2S3UYMrZh57BxRqcosL2rSD7yh7ds3kriRQW7cTZiyL/J8/cG8614JizbQaNSVTZhNe2sPLKFJYN6ihpSegLsYJb4qK4T9VXxs7JTOMzPGSznrfQcC9dmfSZH3fEOgqniH7hzPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700757; c=relaxed/simple;
	bh=uLBhz9AW5lUeQ1VBBZ4BLdqgKs0ZrJxGiU4f9ODmksI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3aOe0KuZP7Zzq8BVWlOaKM7HJJVRmqnb7GJeMLYFOQ0eGx9eiTJOF5sfIxzGdCA6Pg6WkbUgISdldhjPENApqBMuW6olYVKeURW26bEdYYON/7tdLXLU4R1Pph5PeV1xXmy32ESuN3SgCV6AqPP9llkEzYnlkBvoi3hDa83GmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bClN/PGY; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bClN/PGY"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76b373054so5554391fa.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700753; x=1791305553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLqCht8vi02ko9LVVdoV/+Z17LWnTuXLunBgzjyMkvs=;
        b=bClN/PGYC/g+uKuJvt/1ji4QQXLAdPCYe0WOCi9dmxg9UUKokqS8XmHPjh2Ibvk0y/
         b1b8myIvZYo70GW7u3DXb4l6srFdRGA933Bbim995xLV0D9X9QF0s7xT/2YMeStk++N0
         YF3OgoooyNsZTQsgrWm1MXehoqNWOqu8D+kbFZ5DKrhK9ldEOD2cSni3KbEnlSoWwisr
         MzLULxty/GE5or5tK2RyQaF0cXGGeUJ+jzODCJrId0aZhNQmcomORMyruRkEA1+m9CPa
         odaNCYT29rBuVF8k4yD7GwAcucfPsaGPqKEHZs7l0v9bsBs2H2kdTvKC/fb5OZUc5yZO
         wXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700753; x=1791305553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLqCht8vi02ko9LVVdoV/+Z17LWnTuXLunBgzjyMkvs=;
        b=N2f5ZI80lSgROWw20cIutjUo6zgrzYLuud7149jWN4O1ljYootbdGkQfsS4qR5gqU4
         oIjwetx1H16s06INHf46DYEqujIRmrZ7FjyObyRP9a/DvdfTTFq+7rTeNFGNs37oQ5sm
         7ARIZHZtcM0rc0lkUyG1anBpFEPwjn3fc8WBq3GoVi6Hs0DYuItylrUvDnSBg6S+F6kH
         yjdekfm8ZVl3FBdre0+9zyKhS60/IcwPQfuiDkQ/6vPII1nNjCIXn/w5E4Gn/YBTvCw9
         o4MWWTbZvQGyrN7YIhbEEj7Ta7AYYaOASsF37RDq+7GeUV+7a8VTRtCeHq3rNxSEj4vt
         QnNQ==
X-Forwarded-Encrypted: i=1; AKwUvByue/AiTqiZLMqajNtUS3h9cSSwXAMdPZhBRToJ8Tz3eCLyvzc7WS7sYw8cyFtjio+MmRYGZwjhmvW6@vger.kernel.org
X-Gm-Message-State: AFq9FYLrbx2TcSfbYQk+jlm+xM/U0BQCFhOGZ3qQWcBtpeutIR47drRA
	r8r08rkN2vkHZWdjOO26Qp3qIt19H5DfcYek2b7Q/9i8nb9A2py2NbI=
X-Gm-Gg: AYBFou1FpEmtPSVQyQpzs+5hYIyKUim74Sq2waqA2dqWgpObAM0WdEXNi9k19iLWjCF
	WK0ZOBS/9tWD94Dr76eUMyFVIvcMVcT+D33WM13rwBjYojXGlbDx9kpJ05SK++zBBIF4AQfCzx5
	VQccNE6Kh6/OC8HLM6e8OskIh70dsNThFs5BpaG8AckBdoYj9mr/SGpsbUL0D2jvuR/czf+pmwz
	AyyX8CH1oVhnxez1zUg787S+edXKeUi6qJdOksQpxfSaodQ9q3BB/AEDNoxwpjnlAwJoBnCRz8n
	rPCRpFu5VswmRLz0W9NPgDOQo/fPYiAaP7GkuVlaN6IAAyYIhNkOGgxiWsd1WQ0QmONXu2EDz4V
	JD9nG8Lpwp+Uly12sww4Nzt9FVBwyQRgH8gCuaU/vxbMCiqfLneqXgq7pzvavu8Nu36jUCr5vQV
	oO+RX1LkpjkYsw699rwwmLjQvseuaFEpPT4aj4u8yPJcA7NK01n6mLHTH6u+Ry91ZWedA46Zo=
X-Received: by 2002:a05:651c:19a8:b0:3a6:687e:9cfa with SMTP id 38308e7fff4ca-3a7719452cfmr283341fa.18.1790700753249;
        Tue, 29 Sep 2026 09:52:33 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:32 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: airoha: Use one thermal sensor cell for AN7583
Date: Tue, 29 Sep 2026 19:52:08 +0300
Message-ID: <20260929165209.69669-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165209.69669-1-sochnev.v.74@gmail.com>
References: <20260929165209.69669-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors behind the chip SCU: bandgap, GbE
and CPU. With no cells a thermal zone can only refer to the bandgap
sensor.

Use one cell to select the sensor. The AN7583 compatible is new in
7.3-rc1 and no device tree uses the property yet.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/airoha,en7581-chip-scu.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index cc564dc7b414..4a10d024f5fa 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -26,7 +26,8 @@ properties:
     maxItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    description: Sensor index, 0 bandgap, 1 GbE, 2 CPU.
+    const: 1
 
 required:
   - compatible
-- 
2.55.0

