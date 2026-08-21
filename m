Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830042586F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300010; cv=none; b=HUfnGvuAzDzp5KH+jy//Se+OugbgbK9o54ZbjXtXvBUhGvC+6hN4y5yncFo06LqdUb1RQhrQHoqVtOFg4H2JcRtCzHJ2kYFY+3gGFiZ8UK7I8rJ1RNxv5PMhS7CM1kFmzCEMA9YVi/kgKhm/bvjbyVIkkKyrqpvI4mgoT9wFgEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300010; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRThpehZ99j0LaGbYFyZZJ3ebcUD+kb+Yc+x5y+Pw0VRpc0JydFbT4LppQL53Dw8QYNSirXQ0LI/iu/dYV68jK4CN4Qf+WSwBwMxCDCOVYkVihKWaSm3maT1fRmMPBKBHlQbIDazIMcm2IUkuKIpPGjUAX4aaGJCT14qgBdk8LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQOqBzp2; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQOqBzp2"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso499772a12.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300008; x=1787904808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BQOqBzp21Tqbs8JhsY/vedKWOJ7Ry2oNulIN0DAA02Xl0ehEzfRIHoFtUagc00uW0E
         uvAPHNDdsfgtNXKFZFHq0FhzW7qCaFQo5i7P1fooDI41/eu1js9XFOVA55RAhd9d9VyM
         WZyYb6cnmifY+hFAMERwU2Z0qDZY7i36UL0FH6okc4/7burdC6Bdli0ezPsn9jO/8z9Q
         GPlk+i1YW1P5iya7oWp//iGyZ4dJmPu6LsDBpCUlsuqo992RFxiONE/0DP1bOLDblJyj
         gqf80xw1iyHP/gj8twXq/pHhat6BkZNtobx6yflRCACgChpWxzLz0rEtV+sJXLHqdJ24
         ai9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300008; x=1787904808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=qhJr0YkixU/B9LHXNUfHEmvGjzzE+EEQU0ecpGG/O00usladndtMpfYMxz/Ke1diqd
         DCVW/zOSFvnUEdRzeM9+Uh19VUaCBzI0h2d/12ffd6vxgxSy+Oln2Q0MenoCPHSk2j1l
         nmw/owNmvy9pd48A1GSgMylwH99bf6SciqbUGDxa2fSZ/+QUOKB63xhsA8zDI+liZ6nO
         Jb53h3LwT2fh3MNUszQnG7P8euGnIVVlsiwEGs580imImKofy5rtVgKQs2k7Khx61BBq
         Zm83Srr51MhLjpxWldColCoBJCayOQa7uWu4sdEk8MjjE5090eI6+oRSZs7bUfl6ExAh
         jDRA==
X-Forwarded-Encrypted: i=1; AHgh+RrCqetP7HO+iMQubCSGYv4xK3VTm5XqgP4ynrEsAtNshBc69Nwm+mYsq8FmbWAZVZjzeWOxlqwzjjc4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/PPwdPvkVglwkutitvRVjKIdH264Zv/z36wu9dSotJm/AuJIx
	Yc+B11l0cwt5w5vsko1rEnA1nBzltjcgEwHGr2GroEKk70vDpm86DNb+
X-Gm-Gg: AR+sD107p87p+OkXIZJO9HZ+UU1AGp+9p490xTQ47+6O9RA8av9z7OSS7RSNi/6r/+o
	daaI05awthB5sRZ1ztJ4hKngzoC2DFGWDys3R5D5ZU8ZtFdiaDO+ooyvype0AZjWVtL0yMqqjO3
	I5nmPtikGJ74JAne1zDkwZWfV1oDyZHkPf3JyhGppRiRxRuEMRmak8D0ituzF2Bp0bmNmldW4Yz
	6CR1CF5K4734rqZGynCOdiy4rs2ymWXOJhEORW6N1grB+4NebrWhKPAeWROqrkM9gFWraK4vM9b
	pabhnicmfAME7lChN6BA0AaiIeV7fBwwwU5Y9t9dVmWch+bv/iNOv+oYBMb+nuxly2ODg/kPgyh
	WxMP9DyqW2SycCWEbTuHIDtGodaaoiwJo2bhwdrAxjAcY91QmlCWByzT/8nQ22p3mQPeDMKcz+n
	JDogaHeuWkNJ5ceQ6IB2vnMHYcB4zC2T6RvW5+sT0VzhOUMRhttU/j3xcZ3pe6U8l8rC6tRD4MZ
	rhgEjZAQ9p1EqlVXw==
X-Received: by 2002:a05:6a20:e212:b0:3c4:2cf9:28ad with SMTP id adf61e73a8af0-3cd3000a175mr7931614637.12.1787300008489;
        Fri, 21 Aug 2026 01:13:28 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:27 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Fri, 21 Aug 2026 08:11:21 +0000
Message-ID: <20260821081125.4522-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

