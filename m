Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231386;
	b=nMw0Go5hL6wY4asA81rW5mdGwSjJp9IohdFon4HQn4HzxqzcCkZ7vXk1OZ4gN9ELx/nJ
	 O6AKm0iBbMxAPH3U7OEID1YBDJsUUZqT654sACT46taYBeG7xH6PPXY4HihitKkDbu4uX
	 dfwaHSv+HN7ZTTipZ4OlYpa7hhVovQv393EeVTJ8CjqnY2rtR1fUotANLBA1JWkV93w4Y
	 96Th3zdtgoc6qn3lkU/DCv5OUzhzPPIdXGYKHUpeZJLC1jHQPtblVDZSkkPKKob6+pkF5
	 6adnREbKn7DYrxrdd4xmhk6YBXhvW9wp3kyQ8mavDpteiQuS1rtuLllrGQdUQPOUtwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
	b=uMMrBC5Hl42mEBrT6yPGn+LdFSVHXHTSzMPlc3+zFluIz7INs2OdwKu1Ydlr6GKxibcF
	 7ASC+sV9djE4DRNHK25OSu6aMSmJKhKZTVQS0KGCqhVO3YgPnxMh6SA8d7GN4O3Yqovvx
	 Kxa750thBb0rf4v9SnrxU/v5TCqA9/k+N/Q3NUzRxNNCUWQtdakonK7SCkW8ce1bL3BT0
	 yEg/RqSRq9+F0VJ0iGY8B8hYvCB6F4ysUCgUXRWkmSDmuKtvQGG3FdTiWtk0T1JIy3VNU
	 RnFzz6xf8X3Pv50HJyqKvkMUbnupjoxnmJqOktKHHCrOKZ11but1SRAyuEYBiU0Y1mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DhbqdIST;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7026606D81E
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7026606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DhbqdIST
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10260165e9.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231384; x=1794836184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=DhbqdISTHqi9/Qrm2erP+otVKZ/GKoXVYTzI0mDD8dzKKOk2bTA3XAqVHTdt8jz8Bs
         3lniUKiPn7PK/8g1HEh86/lxDxd1eY5alocIc5OAlms4m1RgN/P2kv/zz6O5NlSc9hIw
         WVNz9mkw5dW+WQfBn33R5DydtwtBrFNu2SrJpgRLs3BQZZQzYFeYWeR2ye06kopsy40A
         9ra87uxZ3AD6ACCufHE8xaiqiEUMX3LLxibViSRSv1cYpfBu86Nw5hCGI7RUeoeH2zJJ
         FIzjtbIOiTuHeydUPqEweAI8u3nZdqGBssPMprCoIPZ59IXpu+5zrQ2n/sRT1nr+FCN5
         Du5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231384; x=1794836184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=LXjS0V8hLcKxGBzEjeBRJe6nTD35b+JsiK0W/jAUuvNyRm1wmMXKCbdtDV+5AjIguw
         AkidlL9bW/Lt4qQRTquQSbVaiX/rEq32+1erVonBiC4puA9xRMg5aKdzhx5/wfcC9sov
         OMttkNqajhGphjwQS2YXnzWImxiz+vKBLb1MT7dTEWLPXobee45cLIyfz829QCsBZdLz
         PlsXNYaMu3yuaYvc8jn72FLDhIRloROYDvQ+bYMGJwsWpLYMFwZ32rUr7CNf1KcprtZY
         4sSIEB/c7aLtfp79cvUqDjrKkrlRwqwlWQWp4/8KulkwyCiYtytxqoItsVv+34u4MEbT
         zTiQ==
X-Forwarded-Encrypted: i=1; AL+hErFkwy8RPRwMKbXYko9tMvRkF4oEQgMaKn6S0mu0WuDwvpkwxt1szPUF58/xLyeLCqjVkhSzB2arwL4t@vger.kernel.org
X-Gm-Message-State: APuU4Z8xAAV/KO3UCRhWYVsUsbRlHoM/oo1vK4UxoMDyT517o6xWKV9D
	Dl/BK1cZ99DlAWDRxGysFu90NH8StxsaDzFx+8fF3ZTwc1e0CkH6Zf0M0FwTWuwxOUo=
X-Gm-Gg: AYBFou0s31Hh3PKSMJQj6hksZ2yg9NLPBNIHHiz2qNxPT7NgpGPTyseOZeeKQ6ROWNz
	pGUzNNdabw3OrZyeomzmHjqTJ8haLBmPpVZPpdz/xf7/2bfZX/DE/u16sGEplihXox/xEeenjil
	dwaREpCB7kOf0vgusBiRUq5pz32l2y1/wNkOqfW5uuWR9yTUIFnVx6a97x1N5s1m+hHGQzwKiLK
	CQb1fqG4Q1SKRkMCjxpXI3MRhIU1LNrNRjvXEA5NnwlGolL3HBH6DGhqZArfkWrfF2XTT0Gxhgt
	gHgZcsERj9j2Lb+kwuK5XHYSa3AdchQqu+RAVnGEnLIi5FQLXLi5nZaE3wxOwCb+VlEJO4XsqmD
	9CfdrePff82F66OZybIDv0080pBgWD4npWHesZGPh/2FGJodP6B+hAdhHUfk18zMoYOdYcFGd70
	rs5UWJqnkQLucefPpsf9c+vyL/dKd1adBE/CfEeMphRnHC2x8aQSTmlyIp3T1hJQhLY/pLmV2Jf
	xq0XZ1fMEeAqNJeaU7PJalap9glEDKcc3z3DSqw7w4kVh9N08SFKQwdzfI5UmSRrGNpCJcbGb3R
	KeP/cFlaQCR+0dOakNsD0iP6/di2NHfnF1KcDrtjllyVnt20EPmDQkpMS1CBVlNLLH6LFfEQTDA
	v7VJgkrB4Wrwzh9zzUu1W9vN7zVhcRqJKoWxjnLPUIqGX95HFTRQnKF9EjuaD6zw9PcVapB0k1K
	xNhfmTjgIEXilVl09yQl1ux0xlzg==
X-Received: by 2002:a05:600c:a312:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4b94d7632aamr58126985e9.2.1794231384302;
        Mon, 09 Nov 2026 05:36:24 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:23 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Mon,  9 Nov 2026 14:35:06 +0100
Message-ID: <20261109133609.810876-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
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

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- No changes.

 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0

