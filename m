Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA5372ECA
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706345; cv=none; b=U7KOBWFcu4ORgALAyRz7ITv9Eq3eUfe2jMnLt07LUJS5cGcHQJ5xNBbXrHLCHnLUhJwUWJbKTJeMON/xXq0NSLAJl3fHYzrw7rnK6s5Q0XMRcsgzLWTVu/YycU9S986ggFuCcY27Fw3SaJbhE03zGrEjxnt6CzKdzjkemIrVSwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706345; c=relaxed/simple;
	bh=8sTc3ePfTO1HkNzwXZekmT2AeOdDHgPOdpy0VtjDF3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tABLMoJrsFzA6Ch32prkYCL6v8JXlNWipGfzpTLZ8rP8prl0hgwDtn05UlRqHYuaP7JrDeZWLAZ6OiGANqOcZs/G0WXCwZeh76nvzQihbfIj0ruVZLdtfF1V9lchaw/Cbw/0zRwD91RfP1OIiG4EeQTde52Zw7XUz545uSjNdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYL6qeQO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYL6qeQO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-366375c4076so3978891a91.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706343; x=1780311143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTBVI1ML053TliZ0TwngU1Pm81C+cTmh1wKJVMjMXjs=;
        b=GYL6qeQOgFsAbiNfZPuEXAjds/fXUhR18YR02uFdt3cNwpb59TJGKqrQ1LWb01TyB5
         7fM8s6jY9s6hRF1PEOTNNWrOMlp/71VAMlyiBZaNb0bEDtUOkARkr9L7G0H3UMMEQ4QU
         nnYR6eXyjUFM+H1fQWBR9a06hfi7rsHeifeoRriqkSXnmd6WHEKl2uVXPYWj9gUp9Hik
         yH5AFeciNE4ho56S1pThyVgSTGmR6j7fi3qZ54a6QF+TN/SyFAgDIFDxg054ortvc8pu
         UOH8OrWchUFBrg+yGKQmtUxpcuTjDQ9bCm+sSZbTqBGyVcQ9JlUPOXCpXkYZeD4EQJs3
         ha4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706343; x=1780311143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTBVI1ML053TliZ0TwngU1Pm81C+cTmh1wKJVMjMXjs=;
        b=l3eIK+r655xJMSVWGDPUD2cpMyGPp/oCQ3YY7CH2oPhFeHrf58lrvNtclmJFDQtkJQ
         SZ7tmUqaxHmZyANSfD+t1u/3GSDPkP8LczDMj2iwmGxA/9CIcr3+7EUOeeUFsl0d8CE0
         c4fT87KPxUQ1LsgZjEvv2oD4/OBY29n9X1Jk38DGCHb+xz5/lwIoguzu2+HWrRLHEf81
         6SznTka+nkkTTrVNTn2WGMt2lrzEVcSttZLX91dP3EqSdFlGjy6u3Nv8xLSOupIXNADP
         qii9EGXIbproK4nPBVfIMuUcXsP+K8eVDvvB0YK/q8DCfrOWSgRw9LM6RB8n1kl+nY+9
         Ieug==
X-Forwarded-Encrypted: i=1; AFNElJ8sSDL70iO1DY1QR5zp+V0tYApdDBEE5BGnfy7m7dGHZ2UnqnsNbCnxzJQ5RuabDY042gjBfy3URDv4@vger.kernel.org
X-Gm-Message-State: AOJu0YzEbsJPS37KLAOmB8Y+ifugtkinBXg+iYrt1l8onhbBZhQ5wI4A
	ueBHivQuC/QsQoDE3bDwO+5nXjJaErw7aBxKgRWzD+n5lWuCVMjaX94S
X-Gm-Gg: Acq92OGT18WLzr7pVT2P4N1Qo14XYJde4yM9gXKqNXcbGQvGUUDaBF2mWP2px9rA1JA
	sq88E7NSCPB62QV1r8kmRNod9xtojxeYnrkBD0hIBqV5hBnUi757RC+mlWwjQXhrvnLcX76q2io
	cZTYDzDKYnnacRTNJdo5gMngf+ZF5GG/0UJuO4FtLz9zoW0lmzjNSXRAIjE+Sewmj01/CZvtMF/
	O6wqhxKk8q2Ise/76tRtgdysVnhdWxBzqjJcYBDixEjwFy8p3HqBmtXdSjucitKMI+HSi98BIFI
	mWBGewQBEvWgfIlrIqFpiX/RMmfG7l7N7dBWjfefzt2USj1ByNETzfv7mw5giUR3YlkW6qrRGwP
	K6/SY6Z+PUmzeFSZGv+ih/NfiKinQ12V9JwBuxorEc4fGvB0qOmKuow1nDoU3vUMddeTX0QPF8f
	/4eelADgZZcT/3fWkaMM95Ri5F7T1C7nIN5JnDpZKysasizejZMdG6WqxbL4BnSeIXK2SuKgOWt
	/uxh/0SpjZSVupEmlpNzXWWy38djnZPaHzsP3Z9d/m3TPOXjsJf
X-Received: by 2002:a17:90b:1b07:b0:369:a9e8:dbf5 with SMTP id 98e67ed59e1d1-36a6749ea42mr13009276a91.3.1779706343136;
        Mon, 25 May 2026 03:52:23 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:52:22 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 09/11] iio: adc: hx711: localize loop iterators in hx711_read
Date: Mon, 25 May 2026 16:21:25 +0530
Message-ID: <20260525105127.180156-10-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tighten the scope of the loop variables in hx711_read() now that
trailing-pulse selection is already handled by the callers.

Also replace the 24-bit loop bound with a named constant while touching
the same code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 4ccb0bf2d71f..e5d842853b71 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -23,6 +23,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 
+#define HX711_DATA_BITS		24
+
 /* gain to pulse and scale conversion */
 #define HX711_GAIN_MAX		3
 #define HX711_RESET_GAIN	128
@@ -157,16 +159,16 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 
 static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
-	int i, ret;
 	int value = 0;
 	int val;
+	int ret;
 
 	/* we double check if it's really down */
 	val = gpiod_get_value(hx711_data->gpiod_dout);
 	if (val)
 		return -EIO;
 
-	for (i = 0; i < 24; i++) {
+	for (int i = 0; i < HX711_DATA_BITS; i++) {
 		value <<= 1;
 		ret = hx711_cycle(hx711_data);
 		if (ret)
@@ -175,7 +177,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < trailing_pulses; i++)
+	for (int i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
-- 
2.43.0

