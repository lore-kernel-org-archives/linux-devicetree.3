Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DFA3EEAF8
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303984; cv=none; b=usO2k+/NfakjQCVOdb0v9Ax30jOkE+vKRAAOkIfsTvNwfsKjL5Tb/fWNopiJ+fUeIh3vdcpY4y5mKLes0Ins/GnHVGHFCuvPCNRfDTuetJOMZf4vmufVrvyFpPOznApQFAGCZQKIVZ89LytXgdFjlsrwmsB9zem7XQhrKWIXrOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303984; c=relaxed/simple;
	bh=uqSZ9vaYLLr+IlpI+wNqRUJ19lOtB5XlEKHqPxDiWeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYAIhnk7Xrm8TM/l6ufGfus/OijcKFxYAt4U7f1mB/AUlRj4+Cui/dEPqs5Tn4GDvJkflvm/ulSzaLKIdm91KNSBt4k8T3p+K43cOtGjo27dWnyRWSU7091dkP4bdOxn4tH/RRPFiQzGFqoUCc/E5qb78BrPGxD5KsaQkkyoJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouJNpdD8; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouJNpdD8"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso12813441fa.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789303980; x=1789908780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjCp7DsLa8JOzDd9QVc9nOTCPNziCux3eLTHVXVPDfY=;
        b=ouJNpdD8I11bkZFl2GYdEx2p1znfZF4lskK/OyWMEuhnduVqnlbqU32osjRApFaCBh
         Dy6/n3g91MXmVXfbECEf6anBgHIhvBKzoi/jtg4L+eCp1QCK/OYqlMPRLjhlmf+BCDws
         K3KavWc9QzikLiXxEIX2oJCTKQ4gCAZ3Dd8zrO1hoZeugtU3yhuWKSi4mSIn/Hkx721+
         9zg2/2csPEFsSk0zCHPVUTQ6kN8coWxkMJb/tq7rFiQaVLCcphjCv63JIjBLFx/tplnh
         B59Kl6rr6G3BGil6YedOs/OR/1fPNeX64nEyqLCauJ6y1JMViN/dbqjz58o4WG/bg2RU
         iGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789303980; x=1789908780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjCp7DsLa8JOzDd9QVc9nOTCPNziCux3eLTHVXVPDfY=;
        b=WPte5MGv6MGOG0aAjfpIbaIV4ME07QJbW0dyT1HBw3ZXzgwCM6UO5NlMYR0NMn2Icq
         YRhxzJughbXINjEXSFjCjBhX+jJyC7RBITqoqhtq3qoCcPHXlK8OScr1uPidAEKBvFns
         JdXhVUUKCNWzAznbR/cUgv0mJlDDH6fCEXF+vk5J4zVY4R7g3M6ijj1sTUsjk8JV4V1l
         UnqaminSyR2w7IaQ4ZS6YoAxFYIrlXtdEa61Xu+Q6989nvteREPvkflM8QEq1hqbQgl/
         y4jHth5B+AiVGjl+PX1us+WcUWF/FyOSlO7/8XZlRnF6WDYvVCkqtvKxHn2PyxBl1f+t
         MH9A==
X-Forwarded-Encrypted: i=1; AKwUvBzS7JVnBF364coYNno97rtZ6GV3USoxr9G3jW5CrDmGX+1WOktYk4dOUuJzCoNTNJjUjY0HUNfqw85q@vger.kernel.org
X-Gm-Message-State: AFuF++mLn3eXqxkXuTfkfX6W4HDY8MLKPpIuOM2rEYim4dJC8NJBVwvi
	TKr2mEGEeFbe6wYoAsobUZ3pE6hiwstTjTOQuxViJRz4P6+uhrr6z2A=
X-Gm-Gg: AYBFou0R0g2XyRdWcBLU4WnY1FYxQwX1sAsCC0Yhfd13lwCRJAj+bek4RRbMLZXqu7A
	xnNsLXRAwVvrmPlVIWBlNx5LdeVb60+bZ1sMbsWVg9SXkyBzUbB/IkZ8RjspGPYWHXKfbUoQMxJ
	b4cQV/5L1Dbcz2x2JLGrVIhqZpuGugQinIYm0BSvZINcikD938CugAc4C6P8e3tmgucnmaHz3vh
	8CafFrCIvqxw8akzbbZxbmhLuNhc+V92CEs59wjs9Q2TXUb9yJYUrpXBiy25hG6EeaWmqkhZclT
	GK4m0FpuufeMR9bQDKXWtPV+qBh/GkjOMavRHwgAgAJB4xpyu6Ht2833HJT15tIwlfO6+NJ6eCI
	0HkjC8KtG8bWCU2gD329EcOutikfE15isfgL4DZzyJ3SfdIH8ycsESROftXcj87GTiWV1UJM5C1
	s+dAmcoelk+zXB3VAca0XuSNV1yaNsbT+CKnlSEhbpPvaYfMPz0GfIicttIPBQ0vdC6j7Y/H9o
X-Received: by 2002:a05:6512:2344:b0:5b4:ab2f:5bd5 with SMTP id 2adb3069b0e04-5b8a02fa1e4mr5509677e87.8.1789303979805;
        Sun, 13 Sep 2026 05:52:59 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0469a8esm1762844e87.50.2026.09.13.05.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:52:59 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: arm: airoha: Allow one thermal sensor cell for AN7583
Date: Sun, 13 Sep 2026 15:52:25 +0100
Message-ID: <20260913145226.34643-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145226.34643-1-sochnev.v.74@gmail.com>
References: <20260913145226.34643-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors behind the chip SCU: bandgap, GbE
and CPU. Allow one cell to select the sensor. Zero cells stay valid and
refer to the bandgap sensor.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 .../devicetree/bindings/arm/airoha,en7581-chip-scu.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index cc564dc7b414..da159b7572f3 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -26,7 +26,10 @@ properties:
     maxItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    description:
+      0 refers to the bandgap sensor. 1 selects the sensor with one cell,
+      0 bandgap, 1 GbE, 2 CPU.
+    enum: [0, 1]
 
 required:
   - compatible
-- 
2.55.0

