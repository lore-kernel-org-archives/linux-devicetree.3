Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5C4334A2
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790243; cv=none; b=L7lk6KQTJIJ5OQkZ9s8aFGidHTke8pZymhxkcOjf0sC2meMZoUmHu5kR3UL21Zwcx9MbAq8KhhBla51dje7pGh2Yvp5KsUIHpSMAKdt3ANrqnhz+7nLguHRSAblHaS9SrRMXiJNhO7NFHmZZYURwaZxNE/hC+5ML1TIHbyJ8CJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790243; c=relaxed/simple;
	bh=XrAFZS+IhJxi+kxMlYidEjTvpsk2txu5b59dVurg6+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9TzwKLpRMtZOBF+yyoSFfQkCfyrL8Z9Fr4zUx7APaPvL0E/E+kaoeCSch/Im+gzM0OoA9yk6iCtHKWbPej7meN/RsLSJ5MTqg8RuLP8S92s4l6o6Q8u/aZjcsO2Tud49BeyPCv0mZ1kxN/Tn9SsVvThh9fvM56tV9CKLfHiQ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ujv/X5aa; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ujv/X5aa"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3513956a91.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790240; x=1786395040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDd38SZH0rN9ZI+VsvQIWz/trEy5IHBaWNCDHbcZ/KY=;
        b=Ujv/X5aazGxrcUKwL53R8k9kPLYxWDrtLARF80Vt7DjUu74eMfl3GBeCCQHJh+ggCN
         lrGxREyzJ0wDbInQlbGONxJ5GfT7HxG+MFL24GadBnDrYprS0PimjBK1DIRzYiFljk1H
         srJY72leZeHEUwm2/DdSKuUPRwndeTHg3GEjcSMF1SV0Q1A98SjxOd0bM/q8PkOhK9If
         zKC7ttcB/VEbDkqQqtZ84/R14NmclJlDnHHeD5HxacDAh2VQR3JCqdf6U1fXmOaaeYQX
         AqFq6TYpGOwk44CwhmiltnjDxqByQmB/e9K8MlTo9yUY5c86FDiZfYo8dSaJHCOURz+W
         x1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790240; x=1786395040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDd38SZH0rN9ZI+VsvQIWz/trEy5IHBaWNCDHbcZ/KY=;
        b=ZE0ymZrUNL41Jp/uzdrV4/Np36Q67sbQBqO3cFDhwP3jMAoNuYUT3DTrc6NfktagdY
         OqfuE84P82d2qFuUKhfrShPoeRK+mY/j/b2y2GiccaRK/zmUTkIlDZkK9YYuMaAX1cgd
         SX1tgQgipVYNc4D25BfQ1OrWg6/PDeY1LD08W4L2BVIBOQvTsx3LjzaxvySJw+Aie3qE
         ICsJ8iomZ66Y6ZbE7tOFXUwJ34uCLsYLb3Hi+JiCnE8joG70XWgt8N6DJktN+m0qODJJ
         DTbRbggfEcBEYCHS7PP2I6on/6r2irlhkHpnUocOZhZRLxlHYZmrV0Y88v+UXg2E3N3H
         CjSw==
X-Forwarded-Encrypted: i=1; AHgh+RpkGdx1BHIIJWM0wfAxsK4JXeGgVMFNfr26c7wJV4HBYo537gdFZ0ILA/7XiYJwFn86Oi6kI5td84+c@vger.kernel.org
X-Gm-Message-State: AOJu0YzKz8261sVA3P5BhNvFQ+FR26KD/h/lgjRl69yoNzn+zIbTeM+1
	GrxXGntfsNsFfHvkZkuhK2pWpo8WAfSTRKNCW8UpvfspUeE+/fnZQ+Rc
X-Gm-Gg: AR+sD11sOIIfwNeOlOmoSl1NaDQR8LrWekmJsgASKNqehP59n5U3FC10lreXOKDIDTd
	B6zt69NpqRsZn1zBvBLZGiCQMlzkhjBNDW76fUKAZPoZFHzHwKBAZSC5gG6zYHjqRt2P5b6Taie
	6D/gYr+9n2mO877BV28yHMPm3ouXJSLEtxq41wrFoEuyBgfDuSzlTFNwnfg2eQRC3ax8zgO8pQK
	CNcwdNfNmERFU6jxJ/+DdFkw+CFx0ntwlwG69nTubkcGZnUyBEjJvhIaJKeJrHPdDLz2XLNJhmB
	dN/453K9O9xOS+q0u5PbTjNUvMCm7iqKpPEUeMwyU22U8r2nZYrgx4yCwpr72bpx0XGxO1sQvsg
	jhW/RYbuEb5vmCPyfEZEqbLDZo0PKEpbmtE+jiniPjDgq1UzT4fuDMxhj1YM+zP+3Q2hHb76Tyx
	t2fkWI0O4P2SI0qfyMz8zmOQlxIFB1poLAUzG9rRR8PGHWNk1biAc36nnj96TY+///gsc=
X-Received: by 2002:a17:90b:4c51:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38fbc3f9ab6mr10445999a91.7.1785790240510;
        Mon, 03 Aug 2026 13:50:40 -0700 (PDT)
Received: from Mac.net ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm33112324c88.11.2026.08.03.13.50.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Aug 2026 13:50:39 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next v2 6/6] ptp: ocp: Add Time Card V9 I2C peripheral topology
Date: Mon,  3 Aug 2026 13:50:11 -0700
Message-ID: <20260803205011.1249-7-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260803205011.1249-1-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
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
through SMA4 on outputs 6 through 17. Select this profile only for the
exact EEPROM ID "TIMECARD-V9".

Earlier Time Card revisions expose the same I2C device population with
different LED routing, so probing cannot distinguish them safely. Leave
erased, malformed, and unknown board IDs unconfigured.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 68 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 70ba47096..c8c28d792 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -353,7 +353,7 @@ struct ptp_ocp_serial_port {
 
 #define OCP_I2C_MUX_CHANNELS		4
 #define OCP_I2C_MAX_SENSOR_COUNT	5
-#define OCP_I2C_MAX_LED_COUNT		5
+#define OCP_I2C_MAX_LED_COUNT		6
 #define OCP_I2C_MAX_LED_COMPONENT_COUNT	(3 * OCP_I2C_MAX_LED_COUNT)
 #define OCP_I2C_MUX_NAME_LEN		32
 #define OCP_I2C_RETRY_MAX		10
@@ -617,9 +617,61 @@ static const struct ptp_ocp_led ptp_ocp_r4006_leds[] = {
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
@@ -631,6 +683,16 @@ static const struct ptp_ocp_i2c_profile ptp_ocp_r4006_profile = {
 	.led_address = 0x34,
 };
 
+static const struct ptp_ocp_i2c_profile ptp_ocp_v9_profile = {
+	.name = "v9",
+	.sensors = ptp_ocp_v9_sensors,
+	.sensor_count = ARRAY_SIZE(ptp_ocp_v9_sensors),
+	.leds = ptp_ocp_v9_leds,
+	.led_count = ARRAY_SIZE(ptp_ocp_v9_leds),
+	.led_node_name = "led-controller@37",
+	.led_address = 0x37,
+};
+
 #define bp_assign_entry(bp, res, val) ({				\
 	uintptr_t addr = (uintptr_t)(bp) + (res)->bp_offset;		\
 	*(typeof(val) *)addr = val;					\
@@ -2259,6 +2321,10 @@ ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
 	if (!strncmp(bp->board_id, "R4006", 5))
 		return &ptp_ocp_r4006_profile;
 
+	/* Older revisions share V9's I2C devices but not its LED wiring. */
+	if (!strcmp(bp->board_id, "TIMECARD-V9"))
+		return &ptp_ocp_v9_profile;
+
 	return NULL;
 }
 
-- 
2.50.1 (Apple Git-155)

