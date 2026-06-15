Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA69267AF2
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493006; cv=none; b=guHyZRwaBv78wNjZUaXxZyW2hui/bK7ApzvF4RVhR12gEPAjQPqi3+7k4VbUiqC+As9WP/jI7OTk2tytbegFS5nn/9XSfy/l1yeU3PLFu62R9f7Ct3Tg4HfjgvkpTR2d8x2NbIry18K3F8u5Ibhrj+MnqVML0jS7rUEHCZ+GcHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493006; c=relaxed/simple;
	bh=ftnfRqKQGF+gCKig/xlsTKVM77LzuWvchm28Hr+03Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJtmygZMRQjD3SwC5B/5jBXaEbKQUb69j4A+h8VAuDD0DWiG1iVwWipWIxvL06kje5P9CWREkoD7oXQj23a+7gwbjzX2th3c3JDCdnwkI8djftZNcZPQ23vOs6Ae+Q7Jgufxqp0p0QuQK56xOpyaeWGO/7p36YFh/2fPaT4ABnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWOwCrkh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWOwCrkh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c2da7fa321so11753875ad.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781493004; x=1782097804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPv9qbew9e1DSgufo/PbpMXCaxQHydhgHfSP+FS94I0=;
        b=bWOwCrkhA4Mx3sUme4z16Yw54wP/D47A7xDQe/46nq0bzKJReRq0moN7rODgCMfg+w
         cEow/+YCs+lsjfkOkeyjo/XMcc3I7dGRLfYNMOlNn2HGI+GbOmqt8Sq6fROanvmfY2Hb
         BNbUrHMPbzJgiDHlZYT2kElMzyfp12rhvUst4edaR7wGp8Z3vR/jujZ7n14dn2IAV9bj
         nrUMLe4gGMJb67hyr/pjJmSOByyRlkMgeImhhJuJZJIl59UFwLdticCwrYm9NW0lKbWR
         3sydNPLbJi1Qm7/W+KCNZq0Rlyj6JT7pSMMWYhnSNi6BA7F/RLJxgA5FvOLKsrgC2/YJ
         obGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781493004; x=1782097804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qPv9qbew9e1DSgufo/PbpMXCaxQHydhgHfSP+FS94I0=;
        b=W97ikPQD8K2HDkFX7V8YMQavVeDy+TqPs4lv2d5RXsTv/dYN3x76PgL2M1rA0l4yO7
         +flvRXt1rYsiAQwSsvva5tbYJYO9ViW7RdBIGu9dbDjHTAmddAKH7W2Y1kOMR7vn0+lL
         Yn3Uy57/stNavUKcKKiAlRBf5n9vczcxhL3YzDPb2pT6A3i2I8WEEJQi0scUh/HX9+FF
         EUC+9ZK1nJnBdZGQa8/Dc5tdPSiGtHxnDb6rGG9fUoOAweAcTNrQ4BYMn+yVLgDy/4cN
         upnTkTY+oariZIVzD1RrQZF8LjUoXTAdEqZkVJ0ALuLdlHiM5+N8rCBPi3P7ng4n0aUg
         2vXw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vb6t3916CX79oEsWYqcn0/9lr00uiM0n2PQiPoAWILJ00sdpzvWmhOxIStSOVv/+kL0MqWycuxyIC@vger.kernel.org
X-Gm-Message-State: AOJu0YytFchGcQbiRiD6D+SDO4RHTCg37UEU3YNcajuUCaMCXKtxWpT8
	VXWlMv7iVn4R18c3eIAZZNbVfxiyNVclXzxBzr/0sz6c3XziTRTiMwDP
X-Gm-Gg: Acq92OHDzHAZh5kqNctiAikVRkZqONVML7bti0F4VvrLc5FAuXly9OZSRLyJZ3FU7UF
	qyvKJgM+974n/TTuqcn+eIWDwZYYj0x2Zyfo8JpyN7iqqvWm+63JSflZWh1zWz2mv1y3qoArV89
	gQ0enEx4ikvT4FqnZL9MT+xb3XM59IPpIIJu8oakmKga7yeD3hvW/4Re04zKZlbtyBeUZr473rn
	krxP567w8gx6NaG3oB/s0RZjDLff+qW8sFzclq9xtR57TB6358DxPxdpYIfU9Uhq2hd/Lw0v4SQ
	1zRfIoevgcQ3ICAML8fTjgUf5j4CHIB771rrm367h1YVj3rlBbUPQZZyPvAltE5G58tFCxBYIZ5
	S8R2aw3GlyO7W9eZcTSeReD5Afkr46EDQb7Rm2u1Q+020sqlG33zJULv3OO8c8GEzcOABclemit
	LGYvJC4Lh8lfUMZQRcnXg8kqw4Q608y/bq4fbFxKAmnxp605Bgw2NYi/WXcJdHKItSnQ==
X-Received: by 2002:a17:903:1ac5:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c4135e86ccmr125588285ad.35.1781493004531;
        Sun, 14 Jun 2026 20:10:04 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm99211095ad.76.2026.06.14.20.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:10:04 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 11:07:14 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus/lm25066) add current limit
 configuration support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v2-2-59be46e67d5a@gmail.com>
References: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781492996; l=2425;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ftnfRqKQGF+gCKig/xlsTKVM77LzuWvchm28Hr+03Gc=;
 b=04dCgBvPIV3x5bnW2/gCETCI9So7ct0XgH9ioM5J84Xdc8W60U2tVHhMGQsEX8+oXlJ9fiUAp
 BnBDOheZQXGADOqUEfxnWtL2yjqn9bu5wpHqmzeyHfpjQsI8PbF6zQl
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add support for the 'ti,current-limit' devicetree property. When
present, this property overrides the hardware configuration pins via the
DEVICE_SETUP (0xD9) register to set the Current Limit Configuration bit
(bit 2) and Current Limit Setting bit (bit 4) to "high" or "low".

The Bit 4 mapping to High/Low current limit is handled dynamically on
probe because it is swapped for lm25066 compared to other supported
chips (lm5064, lm5066, and lm5066i).

LM25056 is excluded since it does not support configuring the current
limit via software (bit 2 of DEVICE_SETUP register is reserved).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/hwmon/pmbus/lm25066.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..c8e7aa7c3acd 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -34,6 +34,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_AVG_PIN		0xdf
 
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
+#define LM25066_DEV_SETUP_CL_CFG	BIT(2)	/* Current limit configuration */
 
 #define LM25066_SAMPLES_FOR_AVG_MAX	4096
 
@@ -484,6 +485,42 @@ static int lm25066_probe(struct i2c_client *client)
 
 	data->id = (enum chips)(unsigned long)i2c_get_match_data(client);
 
+	if (data->id != lm25056) {
+		int config_new = config;
+		const char *cl_setting;
+		int ret;
+
+		if (!of_property_read_string(client->dev.of_node,
+					     "ti,current-limit", &cl_setting)) {
+			config_new |= LM25066_DEV_SETUP_CL_CFG;
+			if (strcmp(cl_setting, "high") == 0) {
+				if (data->id == lm25066)
+					config_new |= LM25066_DEV_SETUP_CL;
+				else
+					config_new &= ~LM25066_DEV_SETUP_CL;
+			} else if (strcmp(cl_setting, "low") == 0) {
+				if (data->id == lm25066)
+					config_new &= ~LM25066_DEV_SETUP_CL;
+				else
+					config_new |= LM25066_DEV_SETUP_CL;
+			} else {
+				dev_err(&client->dev,
+					"invalid current-limit setting: %s\n",
+					cl_setting);
+				return -EINVAL;
+			}
+		}
+
+		if (config_new != config) {
+			ret = i2c_smbus_write_byte_data(client,
+							LM25066_DEVICE_SETUP,
+							config_new);
+			if (ret < 0)
+				return ret;
+			config = config_new;
+		}
+	}
+
 	info = &data->info;
 
 	info->pages = 1;

-- 
2.52.0

