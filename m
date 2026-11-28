Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795838122;
	b=bw7R+XAEYnKNxtJ8it+5YzYDZo8Ihlg3nRlaz2ZSpsC5Wk4NlMJiQ/Z4HEu8Wh5wzOYg
	 Ygfr2sY/Lo/APpgzEiLYBE/6ibb4Mvbb2iffcMu6c0WUcvyGsnJRPSyLrLNshhPd/kslK
	 taJ5haQxhjP10sT/FTU+EbQozrKiDu9+rIQ0kTCGy61sq8V0ealDpZfQrS+Ug/qwxS2/V
	 eBMP3NIM4AK1IiGvjHLmaWO/RmZsP02pfYUnn0bOXs1ZTqFVRZBBB/Rxt9IT9sYf8RBS4
	 aCqkeJMU+/pOr06nc5gYO/OMpukAlA7pw1XNuUpGnzFtsiftdWwkYgUgzlm3NVShkMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
	b=gB3YqAlBAxAX2K7L4+5JHgoI1pCL61q9wKJVS3/RP0l0eDErP5BaXKTTCU79YpXkDV8o
	 L1JIIgT6q4jUrt7qfgVk2xyJo/MDQt9r98CjASbKjO9eIeEO8fFfJTxnTXCedB3clrriz
	 RSB7Q0HJ22DYrLRySxHzSkGuuuPhIJlDB4dOrUNjOBWBUQPKaeJX/KYrcaJj6f+I8wkQH
	 2fssSyQBU+dJb7LXV6k67s/ekJudyZPny8V/98WiEsf+JdKiU4f8bY7nuSP1icLqkzDWS
	 EEgKhKzTrx5+6HQXZZhtGDgXRVvU4w6Lkd45Ty0NOMegMb6jelwy2Htj9WHfpziy36A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBlWkLK2;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC6606A32D
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAC6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBlWkLK2
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f01f296937so64899855ad.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838121; x=1796442921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
        b=uBlWkLK2waP/TSyi4w4kaGHKIWiiFOGOwrqCs/uxDqONP5YWBZDqvVdRr3eFUy/zUE
         zPQ3gR/OSMtJrWvrt/AxCXtnohJbmjUfHYkBsYxJFo3E8ZjdBlt6o2ezX7t3BT/7XVLS
         D2zjik+AszPtgtXNxPkQF5HwyQa4K08lm9y9FLIqk68KnBWvusWbO5QsZ9XXmikVGCCh
         IXRL1jti3zy9+Y52Ee38/msXCuZcjM67dHd8NcmJS1CVJcaQ6FQ3Kw2H8cz4THlyIylH
         hzAoTSvCGwqccxQgBPtHVfRXLzXMBoPUumqxeRSc9NkGvfj4sQZ2paXDvJHVCsThjMzr
         ILhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838121; x=1796442921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
        b=aN2kt9ySlKQ5WQoGImalbv8Ud0bN/Y/ZO4htS3XlqSAtW3XB5ewgN5SSnIl/a68ja1
         61cHsYFCxSGXyrqoOd1UJG1zQNfKX2nm341dlpbunIf0FAXMj2g5DtqnqseDLE4tAw6c
         q+pMn9fd+mChmZG2HkwcYRDPNc20mdQUauplVYRXBQPhr5i5vUjO5Dp+GSc9CRhPVbcy
         KmTY69Jdbop+sO7Wn4U4aFVUi7Eu6DookwXdA745Ksk2DIN2pATRGicQ2po+MU4WOIc5
         s3eiRcEiGdkmOYngn8eF9CkZ+OGw83SKKVk3ykyp3QolKtJxBsvzkyLKF7uoOkeZARQH
         z7uA==
X-Forwarded-Encrypted: i=1; AL+hErEJAjXLCfgseuOY1eht4Pl1NGprdKMVqqC1BTp4IxJSdSis+0bCQvDbf5fblUqrVCqn2kVnEQBET8dV@vger.kernel.org
X-Gm-Message-State: APuU4Z94hzI6n4wCFp4gBLHG+T4m2ob+sXCWC5t0YB2lGqeAQLDvHHzo
	RZv51x5rpU/tCMRg4nfBsjPN9yuVkdN6YZz0JQRic1ql8Ivl0Lw+Ebvn
X-Gm-Gg: AZFdTZedF+qYdmoGjo6vne+qog2a8ZQUmcikYvhRenggjezfjPMVKtqdtQWndduBgn+
	oF2d8lrK9mzdwHw1E7i1qhPRnoazpLUIk3q7PGsMXkGq2bLweKCIivXvlB0IZyYCuvLxArpDPza
	F7YpmXWJKeY2vXgC57TM25COvN7Wvn11U2gRmG3sU93Vm6Wp6JglC5dEx17tMp94T6IgOUHzP+s
	bUlxmkCjomYRpu+hX/Sy66JgK9Ne3imVwU3rliJvPkR+/MCCkX/TjrK1ys2juuBXyFXLDOiSkyQ
	eeMdQPCyx7V8fhJAWdH6k4+f5cskHl97BnIF5Fgt6Sclu8Sg9Q84ll+b2haVB04Co+itIwgeotM
	pgdvVn5O8572EoUkokQCJR9bixRTwHlRvBJ/u8WTK2H5AvhU9q8dZNdSAoyoMpQf/5kdYUekRzk
	fIfVICfQT+jWO9Ep7SyHc5+QZeJemD8aRyA4uBktdeo9ejVbj2fEUeb3+MAtNEi6rnIbNG1BXlU
	2SO2wEq6TUdxLaDbgwFN9ER235Y/wECxKgGeylpV9JlBPmiKCpJ1dC70akIazlGqjt3iWHUnhVb
	kC3leh7rmpqL3iiVKPVZcGMMAUk=
X-Received: by 2002:a17:903:4586:b0:2f0:1f25:a4f1 with SMTP id d9443c01a7336-2f03f1cf6f1mr284743595ad.15.1795838120840;
        Fri, 27 Nov 2026 19:55:20 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:19 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 3/3] perf: arm_pmuv3: add Phytium FTC310 and FTC664 PMU support
Date: Sat, 28 Nov 2026 11:55:04 +0800
Message-ID: <20261128035504.760778-3-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261128035504.760778-1-idleassetsd@gmail.com>
References: <20261128035504.760778-1-idleassetsd@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add PMUv3 device table entries and event mapping initializers for the
Phytium FTC310 and FTC664 ARMv8 cores.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 drivers/perf/arm_pmuv3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e0783..42f043444c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1559,6 +1559,9 @@ PMUV3_INIT_SIMPLE(armv8_rainier)
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
 
+PMUV3_INIT_SIMPLE(armv8_phytium_ftc310)
+PMUV3_INIT_SIMPLE(armv8_phytium_ftc664)
+
 PMUV3_INIT_SIMPLE(armv8_samsung_mongoose)
 
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a35, armv8_a53_map_event)
@@ -1613,6 +1616,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_cavium_thunder_pmu_init},
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
+	{.compatible = "phytium,ftc310-pmu",	.data = armv8_phytium_ftc310_pmu_init},
+	{.compatible = "phytium,ftc664-pmu",	.data = armv8_phytium_ftc664_pmu_init},
 	{.compatible = "nvidia,denver-pmu",	.data = armv8_nvidia_denver_pmu_init},
 	{.compatible = "samsung,mongoose-pmu",	.data = armv8_samsung_mongoose_pmu_init},
 	{},
-- 
2.47.3
