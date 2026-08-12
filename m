Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B537B00C
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544258; cv=none; b=nDeAz9CASDB4hM3aGS1KvDrIkPCOEVaL9kDT/BogMAV0+DFYwQFw5UZMPLhCP0qD93WWNYfK7aQvoYp95f1T1FTAN1Ide2i+RNPx2dbk2rvnn46CWRlhHA25qdquzvI42nGIvkYQ3WLg0QDF6OnivgrwuAFYXKS88nYxJVp8eUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544258; c=relaxed/simple;
	bh=GfzBwg4ZHphT0HU4JIpIzgvGvublxLx3VU0uduAtHN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEK9hWQpFeNDqG++whYXXN5Jv9Tmvlzi7weXxgNuhULkpoeL3fIaCu4wiVdhXVH+4xaQ7Phkumd+1rONMD4Nczlbw9bi8V8qW1LVRDaB0MIM6K8nQllxEQGE1TsCceMsn5l/dShIbJn5MvSE/6Trb4Wv5AvBzyLKPqmaJF7hVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9PEs6sS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9PEs6sS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1422709a91.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544252; x=1787149052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/70XqHwKtpkb8Nem1mvPAp3age5VnZSIpQXUrCBp0Sw=;
        b=J9PEs6sSN6TRv7rae6EJnMJV1fJFkMR5LYzm4yAseH7WWu7D6IEGn4UMhMFbnBnNEw
         3LD4Y5sRVjilCXbsYDSTG8bNqYf7R/2mp9h7FCTLFSehkAKqjPteDBJY+DDCPN/OkMPQ
         67DJ8HDWqbdEFE+flPmJHuFFa5V1nXHtqGD8KSfx4vzZ2+Y9nI2bMbjG97XoKZ+u7KIT
         dhHZsIrfYfHSvcAOYJg+Zkga6+y4BYRTZXvoamsqw7DRc/l/lOFl9cq59v05q9OmMlxi
         O71c3KI97tJsjpKj8L5aXBb1CQORjUjGjCzcoeLecuw4nAaCAhCjzvtajUCLEAZeImmm
         0SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544252; x=1787149052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/70XqHwKtpkb8Nem1mvPAp3age5VnZSIpQXUrCBp0Sw=;
        b=lZxDKHRNvwGPSEr2QMt5zX2h/1Oq7B5YpyMgeBfA9iqozjERstL5bKWWqMnCXqjUKj
         DA1TwvfERloWAFJuT8dlAQMoWob0Qeh/NcrH6G+P0Nu9MAgPGWLvlDVDGjluhCrslkxa
         BvCfN99cVNdlkHOK6Kc7M6oGn7ZhyX3orGq4mqhb5RSlnko5SiwobnLJoL9jCPU4/SDJ
         16sNv0PHbabkqr4+8iORlhHxWmlaNbYRSv0T5k94jZoJZb2AQPyNxnNX8iJv3fo7vUf/
         8um0JMzqHt+ixzh6kj/tvwQHawXlJrtUpuffTjAz+9PeXwJGZ9i2zMxg9Nxk/F06Ehma
         /Rgw==
X-Forwarded-Encrypted: i=1; AHgh+RrvwDIRdGfQjjBDfV/TuT1cWLIZVdhd1ujFy1d9ccWKf+kIP+/nZi8B+aA/Aqkx/EQnrwYcmxGfKPQ6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KjAWRSzvuxcE4qI1mH6BblaiaVWnZc+4kE8LEiSQIw8adSmF
	4JPRa8C5WomWLLOphAl1rLrKaIxh8gHif0oY+AtRj8qUPWGnk69nZcwH
X-Gm-Gg: AR+sD12awUdG+NojMgYy3mPfXTJIDKO/bcWp3jeHro/1RuB7fB0Mfk4Us+UZnsE0h2D
	9oQtX3kX7cBs8w3MsbWwRgcBhbFU24eW387HXF27WYM51DqcUGt7/Bb99+pt1Cej5K45XPsyOxN
	Y6q1jN9trHgMrGpvV05oV/eC+R5MCazJP3YD2FKe132PRnuVIvHdMeYE4B5TewxaTWn/TThfREz
	FkZAi/WKptYFTiFZvWhzkd8BUEyGC5cOc1y6+adLETz+wgkd7yE2tNrr312YPoZsiH2hMGAw94K
	C4kZz68bY36cKtz0r7PjXVNMt7G6WereOyCsZOp9/W3hex7uXJM6s56/Mu7K/VJbpwDoeoIl68t
	04r9jrQfss8J/dT4leOT6YediNYAirOeKYCUxesXYdfzt1Dwsi3nYjXJlzxYJP8BaCLFfileXvz
	hiRTda04hEpm/I+hkqAHbZZVivBT/8ergvIkyvVmwpWyCczGzJqI4hjv9KrRzATsLV33R5xKRfp
	FMZDNuFklO1BOUlF3JzeMU1Q6LCMbux8UxIC9GhN95bXtU/M+5nBebl6Vr4
X-Received: by 2002:a17:90b:3802:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-393014f2d24mr5947349a91.15.1786544251973;
        Wed, 12 Aug 2026 07:17:31 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf361d57asm11963071eec.6.2026.08.12.07.17.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 07:17:30 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v4 5/5] ptp: ocp: Add Time Card V9 I2C peripheral topology
Date: Wed, 12 Aug 2026 07:17:15 -0700
Message-ID: <1db6580bc69f73f7b0273b0444484b1f391c8616.1786543681.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Time Card V9 places a BME280 at 0x76, a BNO055 at 0x29, and an
IS32FL3207 at 0x37 on PCA9546 channel 1.

Describe GNSS1 and GNSS2 as RGB LEDs on outputs 0 through 5 and SMA1
through SMA4 on outputs 6 through 17. The board uses a 4.7 kohm RISET
resistor, sequential red, green, and blue output wiring, and an 8100 uA
per-output limit.

Select this profile only for the exact fixed-width EEPROM ID
"TIMECARD-V9". Earlier revisions expose the same I2C devices with
different LED routing, so probing cannot distinguish them safely. Leave
erased, malformed, and unknown board IDs unconfigured.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 73 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index f2c2979daaf1..a843198796ab 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -353,7 +353,7 @@ struct ptp_ocp_serial_port {
 
 #define OCP_I2C_MUX_CHANNELS		4
 #define OCP_I2C_MAX_SENSOR_COUNT	5
-#define OCP_I2C_MAX_LED_COUNT		5
+#define OCP_I2C_MAX_LED_COUNT		6
 #define OCP_I2C_MAX_LED_COMPONENT_COUNT	(3 * OCP_I2C_MAX_LED_COUNT)
 #define OCP_I2C_MUX_NAME_LEN		32
 #define OCP_I2C_MUX_COMPATIBLE		"nxp,pca9546"
@@ -613,9 +613,61 @@ static const struct ptp_ocp_led ptp_ocp_r4006_leds[] = {
 	},
 };
 
+static const struct ptp_ocp_i2c_device ptp_ocp_v9_sensors[] = {
+	{ "pressure@76", "bosch,bme280", "bme280", 1, 0x76 },
+	{ "imu@29", "bosch,bno055", "bno055", 1, 0x29 },
+};
+
+static const struct ptp_ocp_led ptp_ocp_v9_leds[] = {
+	{
+		.node_name = "multi-led@0",
+		.function = LED_FUNCTION_STATUS,
+		.function_enumerator = 1,
+		.has_function_enumerator = true,
+		.channel = { 0, 1, 2 },
+	},
+	{
+		.node_name = "multi-led@3",
+		.function = LED_FUNCTION_STATUS,
+		.function_enumerator = 2,
+		.has_function_enumerator = true,
+		.channel = { 3, 4, 5 },
+	},
+	{
+		.node_name = "multi-led@6",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 1,
+		.has_function_enumerator = true,
+		.channel = { 6, 7, 8 },
+	},
+	{
+		.node_name = "multi-led@9",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 2,
+		.has_function_enumerator = true,
+		.channel = { 9, 10, 11 },
+	},
+	{
+		.node_name = "multi-led@c",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 3,
+		.has_function_enumerator = true,
+		.channel = { 12, 13, 14 },
+	},
+	{
+		.node_name = "multi-led@f",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 4,
+		.has_function_enumerator = true,
+		.channel = { 15, 16, 17 },
+	},
+};
+
 static_assert(ARRAY_SIZE(ptp_ocp_r4006_sensors) <=
 	      OCP_I2C_MAX_SENSOR_COUNT);
 static_assert(ARRAY_SIZE(ptp_ocp_r4006_leds) <= OCP_I2C_MAX_LED_COUNT);
+static_assert(ARRAY_SIZE(ptp_ocp_v9_sensors) <= OCP_I2C_MAX_SENSOR_COUNT);
+static_assert(ARRAY_SIZE(ptp_ocp_v9_leds) <= OCP_I2C_MAX_LED_COUNT);
 
 static const struct ptp_ocp_i2c_profile ptp_ocp_r4006_profile = {
 	.name = "r4006",
@@ -630,6 +682,19 @@ static const struct ptp_ocp_i2c_profile ptp_ocp_r4006_profile = {
 	.led_max_microamp = 8150,
 };
 
+static const struct ptp_ocp_i2c_profile ptp_ocp_v9_profile = {
+	.name = "v9",
+	.sensors = ptp_ocp_v9_sensors,
+	.sensor_count = ARRAY_SIZE(ptp_ocp_v9_sensors),
+	.leds = ptp_ocp_v9_leds,
+	.led_count = ARRAY_SIZE(ptp_ocp_v9_leds),
+	.led_node_name = "led-controller@37",
+	.led_mux_channel = 1,
+	.led_address = 0x37,
+	.led_riset_ohms = 4700,
+	.led_max_microamp = 8100,
+};
+
 #define bp_assign_entry(bp, res, val) ({				\
 	uintptr_t addr = (uintptr_t)(bp) + (res)->bp_offset;		\
 	*(typeof(val) *)addr = val;					\
@@ -2230,6 +2295,7 @@ static const struct ptp_ocp_i2c_profile *
 ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
 {
 	static const char r4006_id[] = "R4006";
+	static const char v9_id[] = "TIMECARD-V9";
 	size_t board_id_len;
 
 	if (!ptp_ocp_has_eeprom_data(bp))
@@ -2242,6 +2308,11 @@ ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
 	    !memcmp(bp->board_id, r4006_id, sizeof(r4006_id) - 1))
 		return &ptp_ocp_r4006_profile;
 
+	/* Older revisions share V9's I2C devices but not its LED wiring. */
+	if (board_id_len == sizeof(v9_id) - 1 &&
+	    !memcmp(bp->board_id, v9_id, sizeof(v9_id) - 1))
+		return &ptp_ocp_v9_profile;
+
 	return NULL;
 }
 
-- 
2.50.1 (Apple Git-155)

