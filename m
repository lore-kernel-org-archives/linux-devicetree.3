Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9777531AF07
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424589; cv=none; b=nMB+mfNpuGaj3rs+iepI4WaOSLoqtjyIF/N7XLQ0EfIBsug6/I1lwLFlpgRICjXaxMuuTKfhjMtojsWaqmAiP964sNY2BGHjlcSJ4rFggkO+AJJL6vDeTLsVBuQtZ+75pvMFhcR8KJxhnR6eHGuJmzwiY59/n3BE75vW9kh1Cf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424589; c=relaxed/simple;
	bh=GfzBwg4ZHphT0HU4JIpIzgvGvublxLx3VU0uduAtHN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvPnneVzIY4E+bFeby0hwcQV6uKexeeIQ2ceaSdFDYJ4iMWsQs7BwA+NnFl4//1H9d98GaWN+TeYym4I+2Xx53FGrRzdJoTecLTkB95KC/+bbeAaimzai/OFqoyhZB7YyvadG9PS7mbgmK0jtJL/CTwKE3KfSYzh6RZ24nohdgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SINizHnq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SINizHnq"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1921689a12.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 22:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424575; x=1787029375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/70XqHwKtpkb8Nem1mvPAp3age5VnZSIpQXUrCBp0Sw=;
        b=SINizHnqCGCjyEBUdA2HTT8VNbxB6jGkoPBjT1PkxzNvfoAEEWJ+EF440Pvjo9VdLC
         dOVcum7R+XjGAFnFDjGKkPSh7YMIhpclrH0J4YOZoqM5USz/Qr5M6M57AJZbThdo7LHN
         /IR0qIEUcuGSS9umTLdeex/Hhkj8Sx8yOjX295VvScNJxrF1KdRrWLLv6djCCFkM2psu
         m4o+XxgcKsusz5dZkl+JSqjikHyrEk/YdDmcKHpUNdGX2FbnoAHk86yPHtVBE+VC9YHT
         cmLW3kF02QFyaO2GqgCkdvJJkSB5sBan1LykDnxQr8sbKLgUgsGdeEc9NX5j7MX2OejW
         No3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424575; x=1787029375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/70XqHwKtpkb8Nem1mvPAp3age5VnZSIpQXUrCBp0Sw=;
        b=ZYyay+LJOxpGmPDCcZDD+xUUHKNSaz+XeAZX/FTz17Z2GumFMbMa2zaqk/uMq49G7E
         l8XeC5V2zf+rpJ3lu/HNym24IBq9migl7KFhqjYE/Z1krUm9Yhjw6U5djNgbXKGcVt4W
         zsJhh8WocccH6Osc/zRNszepXndITbB/rdFjQXpqGWrJl0POpTzV1X/aizFz5h8oTYbX
         /EvKwPMNidaCfzedKk9xQ+SagLm+ZK99aNL4dAqyZpUepNzZC6TdSKFKKCptA4ldn5Jl
         XZ9EBnvP0d/yJD9zOlLXKhFj2CJMzD962gxr6a4mSu/xsKahrFyWteE8wT7uF5dOCJa6
         KNGw==
X-Forwarded-Encrypted: i=1; AHgh+RrHdUw/K4HKLzGzodyiMUjuwFBPJv1Y4Iis3u+HeEI14A0nt3Crj/B1IJh2oSOwxoZIzG3NnAE67AsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxghdpLrrhta9ZIuWXx8aauLny08Jur8jhi1/j8w+dyfCJtJojH
	wV4/9slWrAlpiqrwxMPCh/2IoeAufdFPd/7yGDLE4gF7w0FvqBgbnNjY
X-Gm-Gg: AR+sD12Hh+uXO4VcEDk08s5kTvf9P6dGptAyudBlN6iHDcf0Mmjju31lmJiU9ik3gjO
	z/lkvwWeDLI+Tpk0oH8izALuUyRyIw1LoqJpjyPfB6eltj0KTly9+k3PqQ7RQqD8KC2MYv2OcQC
	FhkRVcisPY55yGBae2pcBzP7vhr0ayaYjgftnWri+eOZhOCNW0v2zWdqVRhNHsroaooEia7HnHs
	6JOVSHf+g4LBgMXbSFjdS4koRb2c5QGJBdhDn0/JZLYFgMGf3uzt2uMcDe54KS1himFE/BPEvIq
	WbJt3IfDbWqKwFYFGz6aWZcbiQvOdhpTk0C1p73BAAfg5jcVxUv52f0de6Xlmt3VJVHy11/6lDP
	9STKM62vxKdz4yYhwizyu5VGCeNr5X9YBaovPcmzXABVN45Eq1RTyB3q+c3FtrpUihTSABadRbY
	+svglZOA99wj8eXjX6yhxu2wcB992OapH8jsAnOQrAmWjE0i/+2Z3/bGexmI08SSsZKd/sFPZ+b
	CX6W+Y0YFsetomBOZuWpjbJoXRUYJckblalEulUGeAaPzVjKoaxU5BMlhZN
X-Received: by 2002:a05:6a20:2d13:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc2bac423emr1261864637.28.1786424574951;
        Mon, 10 Aug 2026 22:02:54 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:54 -0700 (PDT)
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
Subject: [PATCH net-next v3 5/5] ptp: ocp: Add Time Card V9 I2C peripheral topology
Date: Mon, 10 Aug 2026 22:02:44 -0700
Message-ID: <1931d6019cdaa80c681c38b6ff4d0359ec42230d.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786423898.git.ahmadexp@gmail.com>
References: <cover.1786423898.git.ahmadexp@gmail.com>
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

