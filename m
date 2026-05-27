Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2963542F8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878556; cv=none; b=rj1N2WTJhVa10I6bEpwjd5t5CDQgu9rrzpzGtoRJx/cpRX5Xaxtr9bn/tWv58U2o/e8VtmB8pxJFYzR0j9xSUzLaM3Cq+3XfT3Dsfgfv1lmaIt5UxA/nk2E5py9a4NexHZjpTDZ1dznKudnwhmm7mPk8eqSONhxg9DWYfrSQjfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878556; c=relaxed/simple;
	bh=P3rw9sfkHkYJwvBawwd58N86GGWr7b1WNyNnVrQV4qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWFQxwCJoP5ZCSNyYHrP8XB0BUzbH31yB3ulYPzAGnc9CnzIkE7BsMSJ5wsTvT6KQY8vGuDbVg1G9F3Thhyu107jgg7lQXO8+/Z+my4/LoPk0CHoP0Tt47EqU6cQIgvsiCpolihutdXuEU6Vn8RfuOhNwn4O/mFSyczw9RnFIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzUlChwj; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzUlChwj"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b788a98557so74477715ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779878555; x=1780483355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHUfn8CsP06uZW2KYcWPd/uEBbB2UBx7qyNJnvj6SOA=;
        b=CzUlChwjfiZbchV5m1XbeNpnmcw6yCz+IjtNonv5I/ACYq4sCd6bbOC5a8QQXsdp76
         m2ok8bv4BcQzJS4wZNGtiR0YQgcluLUC7cCMk4sFJ40khuYbhXmtzjnJKY0OAFjKnXuK
         +tHiTO/x+LpbRQOC7fZ5BFez1FMe92Q0IhAslpglazhwrf9AlDjXiaPwGT2S2jITUlS6
         hxmAMGjkf1utEh3T29DsK7tMmQnppd6u0sOSkQYqqC9z5NhZJ71EYWLfBcN64+OVmhvy
         8+8O8foCxnkDx7FliqpfbrLHqX3DjUEmOa7HrR3CIlDL2GF1We+xIgLuPCO9DvLXb/12
         akzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878555; x=1780483355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHUfn8CsP06uZW2KYcWPd/uEBbB2UBx7qyNJnvj6SOA=;
        b=L7uQYUyKs2j/eHUnjLE5W0+u9jAxD+oD2EOoZw+KrUOuDAE8iJjxuoQlwbARK27wiy
         OobrSXFkz/0XY2HFfKDyL20V5zq9LGAUDL38fagRDXFxNnNVHyKQx7L6j/9BvRW/PKWl
         MLIr84jRwTG7oNEP5XmIwUdD15qJBZ1AWQKNbEujm3qoF8OxPAsr2zD/WPwGFCSQ3zkg
         MvjnfTpGoEWsFKmE/vT3+p+XFBGGXjR3y1sZYRYtKbs04+2oJF8tuTCo4ZaVIVadtjC/
         zk+57g6L3MY4JieieP0Ky5ApFge+5ldcfe8XEqsnbrp1xh+wcmhDmjiPm4RJA5ChQfQq
         XbIg==
X-Forwarded-Encrypted: i=1; AFNElJ9xbR5ornJeeCO41TLm1RCPZsouf2p4t+F8bB05DMFHNfSrpqmVUDHprqIwucz4fqAffHHH+6guJJz+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nabIULLuLkSEH4sdHMXDilulfdM0TACbN08gHHaejRuwHbaE
	mhV+yIYWslyn1I/qVdJIf0vderO9QkZPzZvDhigNM8WbN9NMx8W+oN3M7My0pXuTMw==
X-Gm-Gg: Acq92OHK/Pz5rErpxjDQs/Dty6npEdAJaeWhikmks7Nj4tQYt2FHNfGi81zh4nNeUyU
	S2cjWLO4wBe9ZeLB/RImyAFGN97SXyuxexst/gyml1stRQqOFceiqdC1A/OJmU9azue8lw5RShH
	D6JDbXk/v7n3gqCwpC5t4+Cwe5LkFlro4oU/jdOKAmoaL0ljcgIKw4ZS5K90tBBLzzf4+X/UGgE
	Hl8IA+I8g1v7vWJyfdUO8mYGQ/lmWRUI24vMBOD8A8iOfrjxMvcTijdykuKDfcGhBJc/8llkdAs
	rcUSANLHkWk8CHh+RlVPhBJJL3clLGS9pZH4lVFjfMhDJlTDFpzV8o9/fVvuKdpW93raZSsQpAQ
	zsr6fk5bA+31BsxIDVqp4be10YAa5gsp+QL2Q+5oT4OB1ub6QBK/TNB/GcEvABM8ekCp8LVsXby
	kvTFL9Nks4ChmzJUwXsKju1eHyqhAAFZbnV9H0ko2vZtkJ
X-Received: by 2002:a17:902:d48e:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2beb059944cmr252757165ad.13.1779878554858;
        Wed, 27 May 2026 03:42:34 -0700 (PDT)
Received: from localhost.localdomain ([211.196.223.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm141099865ad.74.2026.05.27.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:42:34 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm: dts: bcm2711: Fix typo in gpio-line-names
Date: Wed, 27 May 2026 19:39:26 +0900
Message-ID: <20260527103930.2973-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
Changes in v2:
- Fix the same typo in bcm2711-rpi-cm4-io.dts
- Link to v1: https://lore.kernel.org/all/20260527100439.2507-1-always.starving0@gmail.com
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts    | 2 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..5469fa663526 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -110,7 +110,7 @@ &gpio {
 			  "GPIO26",
 			  "GPIO27",
 			  "RGMII_MDIO",
-			  "RGMIO_MDC",
+			  "RGMII_MDC",
 			  /* Used by BT module */
 			  "CTS0",		/* 30 */
 			  "RTS0",
diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index 6bc77dd48c0d..1f4ebec68370 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -56,7 +56,7 @@ &gpio {
 			  "GPIO26",
 			  "GPIO27",
 			  "RGMII_MDIO",
-			  "RGMIO_MDC",
+			  "RGMII_MDC",
 			  /* Used by BT module */
 			  "CTS0",
 			  "RTS0",
--
2.43.0
