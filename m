Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE93F7E6A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354907; cv=none; b=gnWw+FhE9RSo71Sf0dkikxQJ6DaSKbc1JhDWzh95l7TT8yqI0dXa8/S2I6kV14a9IMEOviuhbRzMWsxD8OsUS14Oto/MGtCZK4pxGkpxmVSri5gaEpoHYqPYXe1Scw49kV7lLSXln/cFhzRzviPzI2hplMrLGLC+4RgUOjBAEx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354907; c=relaxed/simple;
	bh=WaY8VA+nf3RFgcpab7xjAIIY3896A3XJIbzzMAno0dY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tH1I0gNTcXZ/twnF9sZLOJP+wlzLoRknw49n5vCFa6o83IFQjhBpEWGz/+X8HidmYuYgX90C6DTTpgFP0RXzW7pI/HcbMF3AQHYm20DZofEz8aBN5Rjpr6Jlb+UzWMMHXsJf9/50Kul3E9OT6Mvz2lYUb5c2zacrfY5MTqFCp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+EsBxAf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+EsBxAf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so3121422a91.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354906; x=1774959706; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8wGyax00Jc300F8XlSPyGvsy9TDxm6JUE4CSraS8N4U=;
        b=O+EsBxAfy7rk2C806V7RJSh0W5ldGrt2jQYpUaaHUCR9Kj+LlcRmBq9nFeYhS662Up
         HzZKN7HKgRra0+uis+ra0WpY0mYVeo1J9Vw/i++ho+64n+o2hq20YrFyXJtDBcXfYYLu
         LsE2zxxX7S58XgvPua34fJljQVyzwgscm7dvEVkR/2AXAzPdhNhjekFeXJJoZi/eLDhI
         L/k6sMapd3S0K6D+O5hglL47UuKIDa5dmIG9arcYua5i/QEFC1sN4nGFOenM29MguZxq
         EGwvsB7PJgytecgDmKXRO4o0ADBiqrhilBIYREMpfMZ7ucdARo9vGjgFWf36wM9208yD
         Sshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354906; x=1774959706;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wGyax00Jc300F8XlSPyGvsy9TDxm6JUE4CSraS8N4U=;
        b=OLv/6swSPtu93WpSRseTSozQKqYipSyc7C/a7ZtSxVdARSP8Jcy9s0Ifc+TXvDuSQr
         onPgiG8m1pMflEzBN9AlpmW3SRpjUWZuQJaWT4GbcfUDg9rLbZHMITJvBnbqKc1/BlL1
         LZ4phr00yDKr+6x+DE+Xw9RniSasxaskuVMFjRxpoG/U2FIOFZa/Hzmj5IZcV9yptoJ+
         tdEGjJV5WnkXKDwpMrOG10jyVFTjBsVVVuXRiRzgHyqvzEhvjKUA616j6bD73Ci7Yvw8
         BEmSl9beucebIpD571S5SI4N2WVYnVE3kzK6rST9ifWc5qvIMeTRAbR6RNrzsNjIWyVh
         6Jog==
X-Forwarded-Encrypted: i=1; AJvYcCVK2gOihLwjchqoCbN8mDBj2j6XXnqHyuo+If/RqKZ+09jZ7egOV7uv+s2C9CSeEVdTSzxjc0Bpvomc@vger.kernel.org
X-Gm-Message-State: AOJu0YzKjtq6KWi6+BxuinPdhn0NABEpKhfqg2FMcOQPtYVjHcyU3SUz
	Sd1c7TL8IT8NgGMv5vftihw/zzrrQJ2wWK2bv7bAKBZ/b5NiY9cRysnq
X-Gm-Gg: ATEYQzxa6Iu+OKr/EnyixkWw0IcXC+o0grjJQOalpK+5LexS6r1nKi/OqpdULRIfhV0
	xXSeKwHhCATOEcji0ubwYQomskL+GiaeAuJmlUSSIVc1Ck2aCRoh59bdk3HAC4nX8vr8PrFnNG2
	3etefhD8boKRpoVc7p6AoHBX6vor5WUunwc7FQlkD8eydnkdCs1rij0we0nrkHp4h5Ad7tvf6Zg
	iVAz8aGz0+JbnxgdFf9l+uKdyUz9+4EzOhJvH5WJXI/HShu9LKh3afmbHgZO9GADffWEwyL4XEU
	jk8pB87MryJMXwrx3gYbDDNOmi78Wy3Hl4rHCm9MiBTO13tKo3ORGxCV2AI2DFiKc1V2g3NfSH4
	u7rGJzIqd520h4VVUW2KyyrDbTpNVsmnfyozwVfG2tn65vcw3rkrZuIyJmMIr/qDNSYY0XJnAMy
	MD01jl+WpAYCajRxbqzDW0WzBEA0pTmrKSakfMVDegxrwFXtVD34bNekGLjOW44dI=
X-Received: by 2002:a17:90b:5390:b0:35b:96bb:47b5 with SMTP id 98e67ed59e1d1-35bd2be5e99mr12538215a91.15.1774354905768;
        Tue, 24 Mar 2026 05:21:45 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:45 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 4/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Tue, 24 Mar 2026 20:21:09 +0800
Message-Id: <1774354869-119736-5-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add support for GXCAS GXHT30 sensor. The sensor is software
compatible with the Sensirion SHT30.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 64404fe83f0b..0bb81af4396e 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
@@ -946,6 +947,7 @@ static const struct of_device_id sht3x_of_match[] = {
 	{ .compatible = "sensirion,sht85" },
 	{ .compatible = "sensirion,sts30" },
 	{ .compatible = "sensirion,sts31" },
+	{ .compatible = "gxcas,gxht30" },
 	{ }
 };
 
@@ -963,5 +965,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

