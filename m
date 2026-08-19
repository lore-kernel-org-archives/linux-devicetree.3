Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8E425CEE
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128600; cv=none; b=dZZu2rYd2J8mMrpkWmw79V5UOSVhDBb03mhZH3/jQsNkCrT/UaVImJM/gkLRSq1fbhGVnSvR9LAHvkFjYjJWSyDkc1GtLIJFgM+hwyOGK5xA+mc8n3hIunRZH0/oY2YVKd8ntqidIQrix1r7wao0RMaZOGJnPYFPdE8i31MX88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128600; c=relaxed/simple;
	bh=C7CfT3Nkoj/xkymMb5jnWFKRQ5cLGliAFf+ZVTuMiOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fitBOLowHmmUYfWxWZYrFyfTJK8VX9I/9f5EO5kQTZyEePU/CTGjRNZoxwM9yjnORzOc1RQY19VciYiSj8arsH8VBya0su/Sh6XtVXZS6wKv8zx3LsfElFv2j0SdCHdC4J2Ib3+6Bf2r7VELC+KqEpAw9BPlJzPaqnUKbkL5UZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7hnKfSa; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7hnKfSa"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so2498305ad.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128596; x=1787733396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Rj3sKjI+D/fIhnx0uthKRhFeAN0smVlqCx7Jkpt/N4=;
        b=l7hnKfSa73aXjU6aZs7110hpsasQosRC6svw5M6q8w06BJu4ajCBOamWz21v/Ny126
         7K9ajvvLIrqJ29rjKUMOpdSfJolPDYix21C0oVvztJBooX+cHD1wGKcC+aAs6UKnvpjJ
         FiQ2WKFpyJVKhLXD5FYLCTDxCLLa5fJWSD/2ModC90L59fPyJl+IuKG+y0Vmecw5ccBU
         gBeVTyTZWMYojYzYe8Y4fK7mGe/zrJMfsPFEH8cwccQha9BQScjVG4sFjXuT9UJgnxTE
         0MCUVUcSt/i2skLI2vYVo+b2U/6K1onjaR2hHpocoJsR/0x8pt7NFLUS+wfI20x4HotC
         iJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128596; x=1787733396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Rj3sKjI+D/fIhnx0uthKRhFeAN0smVlqCx7Jkpt/N4=;
        b=sVpHPyi02osVLgmZ+QWrF2w4aEYRfQWI5X8hxDrBbxmFLHYLFS7YAcxKoYCQAGenL2
         Tnn7xh2rvp/Y87fyNMmhUTTw6sX2iBpOzYb1iwq9iTTydjZq07B8kyz8qLLMra9h3ouG
         WGPX1A2paxOllot19AWP88aIC2AbwvJXydE1GrDtXxzOm2+p4ePnjY9s/65luQUQ/1AS
         2CFqel0udhswLyEZXWi6bwJfuHHmzM/kYjTZtoWMTdXrPPNbuUluRan9+NVFmx5okHzB
         gQhxVeB1cJ5wx/Cp6HL6pLVkq13W4+IFMaDz5AkiQeg4L7NKG20t+g6RcriqWdJJ8+OB
         bW6A==
X-Forwarded-Encrypted: i=1; AHgh+RphjX2VkgHy33/0TNrv600FqJOfhLblRA+/zsy1Z9DAxOqI88C3cScYRw4LYre93Q9JlvANIz/iS7Q3@vger.kernel.org
X-Gm-Message-State: AOJu0YwX2jnBQIp4+7UFWyjDWVdSiVKtOEhFagszxR0/MPGh6EJ2dFxA
	4xvVYCn3tcY/byq6oIUoyCZ9R8t9o5QE/MLHCyWrmwwxvBnNKcUzZ6mi
X-Gm-Gg: AR+sD11Cq/8Ymqsp62PgEiAWRe1+Qu+vsgBEECw1vU8AVb6DsuD7DuqSFhQR/rgVS8B
	eFTy1xQ8651mgeTmErszi2nscEr9MvowMsVBgQmvNRYUbiwoTck7jjwx/nD0DB8V+DB958Yk9pG
	rtS7L5P1pj5FNRFGzPLBbDZku/3yxc+V4NFESTsnEinXpd0pjrV/VmGOom5wFED1doo6ItN02Os
	10SKtej9WHnKg9oL4y9Tlh0nIojisiq3wbbvjnxgX1X8rqM/Z0q8fKxH3kbaGo1HfEWkA6wAa0w
	PdGbL6GP38AOSRKaljyI3uxOdFX6rcz3OewjPkW6AfIUt3qDWpwueIObiu2XxenIcmaQKSyQiU+
	zDv3LN7lyYqc3YZaBuM5OQIeU+qlrehzwUWFKChccmVHWigq7qscpIt7QgB0ZwmPniGs65r8mEH
	R22U0n46hyF8bCWP8Vw9FHyMliyEWYLYQq3nsemcIeaD9POWE2cUxUcuV1q0MGJbQ=
X-Received: by 2002:a05:6300:67c8:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cd00dcaa72mr6006921637.4.1787128595459;
        Wed, 19 Aug 2026 01:36:35 -0700 (PDT)
Received: from ubuntu24.. ([85.149.220.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm332268a12.14.2026.08.19.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:33 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Wed, 19 Aug 2026 16:35:57 +0800
Message-ID: <20260819083559.1303348-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
References: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0

