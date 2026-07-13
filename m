Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B47379C43
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940418; cv=none; b=oGVab285rZNSWIsUDRvwmIx1EbyL6c5dmiIh3ZshC3KvNb+tTAWL0htB7f8I2r4MiW3jzKhVqN1z3W+MDVtf3Uklbo/NM//YgGYrzDYT77CNhQwUO6gpUYdcng8kBnR6k2TWmJyjR29J0fblqfN8xjEAnQFaEEFG7BokfRSZe2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940418; c=relaxed/simple;
	bh=x6lJHFXHL60GFi7hGaxbTBMSrwAi3nW/WeWDhNRtjkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKQH76lAiwMGFaYwhLRNhwg0xRhBsaRyUkzpoPFlmAuLkGbVY91Rt5SP6nLeaozir5DSeeQIhFSvueyJ2ZtD+5jg6CX3JqxtzWkA7x/AZz6jHgJFsntwTAWKUl2WrCp/v1+pG9ATm4ONVY4L24NECPOU8HBjx6pJVP1HG6vH7js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=iZkbkNep; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="iZkbkNep"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8487b7b3fc7so1086895b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940416; x=1784545216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mraqavKEL8rZFk/6+m83umFrUpJ6nJzwQqBUF9zz+s=;
        b=iZkbkNepBsxiC8pM1CfdBoNpTnp1oY2q0cLlREWpRZX6p4Ig9t9LwBeeR6MX+k083C
         jkXzJnTcpMUIJkuFoHQnf6RNvujZ6UfrSw5OiEOEmrRjw9GuyVmBgmRgs3jG8RYW3M/T
         PkGjvj9+9kzM1NgEgml0k3yhA2bIrCaEV1m5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940416; x=1784545216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mraqavKEL8rZFk/6+m83umFrUpJ6nJzwQqBUF9zz+s=;
        b=jL68JMRZHJMXw1gLscLoNUog8OsnGGcrcknV0TaIDmPSF1/v6nD7jVCHCvVJetHhVd
         qVr5ykeuJqNvvBS224bw9eZjypBMrgJrd8MdJCB465zXN7fu1TcRxexjfunEPIJ/Y2Wa
         qV3ncS9hBiXzmCXKGnuLj4zh3KONNSiEhkVjFo4UJAi4w4KPiKtnqRjutvXPEyAa6pjS
         2ChB380wQWNUmLIXJEXfJV7tbpzrNPcpq9NpgHULuH+c9eVQtw9eG/lgZ+a/Cx9dtltE
         XHQk39tODAgFou4zz41ZB9rHENYhsog2YjRKblUIg4X6hXJYDuyoGJs1J2Gi/C8Q/atN
         1o2g==
X-Forwarded-Encrypted: i=1; AHgh+RreMQzy6WNaZZHQywuU+Q+C613rR93+zgag7UxXNte0G4M1bcEH9OJmSYv7Ae4Hf+YXX+VP8YOrmbeQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Q2u11UQPa5O4sQstg+aOmKn0r5ut80ygie06cBQd9NLxB8cb
	nZAjKy3etLv34M1rb4IxCoPUTQqv+eGZl6h0j6RnHSf5761DDH/ZVvO+g2WR31G3fEA=
X-Gm-Gg: AfdE7cmXXkGAjF0cYYotujCWaV3kGtg2JNsK6SvhLjnGcMezZED8yXXGNzlecYJN2sf
	sXR5oNaJsfLtl0vjfVoyvvDfvhfkalormkkaw57qMfG1EZQMSJdC3tuuYERBryJHZ+rtZ8PPCOT
	ALeRZohvqV2POtZe0Nn9TadU9t3sUuYnzmJnydqkYUSPfPkSAw2vbrZqgns8WDEdUeTXPAILzET
	s4CvEodPcYTwTAmHYOK5PQvcbKuxX3T9uPQ0cKC4WgFn0b55cHowEEDNs/A8X/mmvnDmcsT6A88
	Ob28WzGLpMD5APc/rLKKAZIE5qVB7C5wHXCUCl8eU3OcHuq4aqhX1J5cmSFCsi6WvDmDydsxTxP
	pBYbt6YZXYgInLBkVZwnJu18rKVLTPK6FYjAt2KrIUbVz9jYS0epdmIzMYx0Av3oI4uFfoeaRtU
	N0nQOdmw3CSMXhpv0l3bD8unxUYA==
X-Received: by 2002:a05:6a00:3d0e:b0:845:f107:38c8 with SMTP id d2e1a72fcca58-8488975ad8emr7159281b3a.47.1783940416384;
        Mon, 13 Jul 2026 04:00:16 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:15 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/8] ARM: dts: mstar: unitv2: Add regulators
Date: Mon, 13 Jul 2026 19:59:44 +0900
Message-ID: <20260713105950.1346962-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@0x0f.com>

Add the fixed regulators for the core, IO and DRAM voltage rails and
the GPIO controlled switch that supplies the WiFi chip.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../mstar-infinity2m-ssd202d-unitv2.dts       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index f02de5b475af..5e79819a070a 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -39,6 +39,38 @@ led-1 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	reg_vcc_core: regulator-vcc-core {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_core";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_io: regulator-vcc-io {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_dram: regulator-vcc-dram {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_dram";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_wifi: regulator-vcc-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO14 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &pm_uart {
-- 
2.53.0

