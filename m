Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB63EC820
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497444; cv=none; b=qJ9Pg42GpAxWiGTGzYp7PM0pGfToq6L5iyBGehxmXH0yXJ4VPwHYNFlDXFCqFaP5cDIbAL2RkvVLhEvAJKNVyqj+e7EJDsNRwfbVd1jyHM7uUVbLCAkOgzECaOAcb/q45XeHnBSv5A7htJPKK+uLwzlFKFclzcuxqMZSwniR2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497444; c=relaxed/simple;
	bh=gxL7KiVYuyQ+WBQ7itimHHbc/gK0nyv2aG47P7bsJn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIaf0609FYN5+ovGOXFK+SHnWw8dVP3/fpGl51lPEh+wJMx21ElUb2b/IaMjTneRqtcp68za3DizbiEdB3NO2qmMFOANCzA9qKuQCPqyqmJUupN306Q3gk4YdprUyte74dyO+z1DKDfp1zkHjJYihHK257zzAXB+ZZ77A+DDiY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLYQ8VQY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLYQ8VQY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1207890f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497438; x=1786102238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6MkhrXl+YCwODYjVYYcDB6PaHtllobFn/tSmynvwR4=;
        b=iLYQ8VQYZ2xmXonuPHHoKYtC0KFywenSLp+edG7IYA4jwYtuemhO1hkEQYUleD7pUS
         MKJGAAFp21zf2XpXi0cCKz0QhUoXrdExYUtpjPcwxwJrC/EBTK0xPRogofdkkx491j2N
         m6B1rKA1tY5vnmpPSJWOLNz6RKo5QdY3avpQ34j4crk3Yvi2yI3BtQvI2FQp+UwpkZ5P
         vgbYtwn96+OaaNcuw24sSYuWNhT6CP9EEf2R0o0tMFTLUQ1slLo6kkS6FpDKmRtWUKpr
         IPJyHvC7ujeUh4p8DxbfCsTUu7FS3WZ6iPmRNsEFwZ2pir0vHR5QbTCzGcLyOrI8qKx0
         RJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497438; x=1786102238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6MkhrXl+YCwODYjVYYcDB6PaHtllobFn/tSmynvwR4=;
        b=tSd7fW4CGvxKsM/K1cfnkBmshZ5E2lC+9vvbF+Anrhl4H1x/QNZns3LPD2wTEuEmDC
         5Ncl2lrjoZ9pgMhcrQSihcT739TlS6uErHMVOUbIXtffC3LtBIdUrFk0MCExaZZxWWJO
         bX5rIlVagoCbN+VOZ7OlWi8ffi+koom9gw2rhXYxkWLF7dTRfvrYD83/9qpvMDvhrbF+
         eglun+Afd7DyqXqdZNixllTDQq2dxnJjQ5k2qLDbmMa3eEAKPrJfY2QS79i3tBa2NFdx
         wqJOgeIDAhhXBOYyx2G35aLqP6c/RGV8UuYTuN33fIyIXBawzXHfDMeJTqxb6mK1qXsH
         Yg1A==
X-Forwarded-Encrypted: i=1; AHgh+RpVgAhDvLPuwbFn42ADwcHUFFk7pnVvqiRS2NC0Z+mlHxHwwgqMpw2QF33lWTlFYl0KaUDogS2D7yax@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/PlmN+qqEq+8tyRQ7JLoNemZlKT9JVbdel3H2Ch154bgZy6s
	94eROiAVNwoyM8o/KpJMFbFgUGheh9cMJayXz5KZleNsG0RdkGMRgWdv
X-Gm-Gg: AR+sD11vusClQNx6DoWoYgs2IwaqN3uRNOdnk7LuY3PfZ5YBYZi1OlIDvadwn+u772A
	HnpVIlu0RClqdGo7XNecz9O2Cl71GSzJjH7IIPOBpPIAw3H1HxibTeo2i7ARDP5E62O1wh4aqYd
	xcjG/V2ua/RDLJs9wwJKsuCGw+AlsSWt9DRT8CY/YOt7bhaHiLwu/mwVF0vqNiEBY6VddQzhfz9
	2AZjQJb5+ml9No0ex4Mgjop+EC/vORh+1sCQAEORZCuJJx7QgXYxzgvvAvfdbI3ceobj1nYeTMR
	qVFAmmVULyIXLaSXABaI9whd/wbKTrYiPXjhMj9AvrN+x6EjtOEo5PND+LC2lZHdz/Tu9aKpugA
	ce9jQiCkc+Tj/IwVGS98z40bs9NiXuxAWUDPYI10maFmi1AH8FHg7tG+PrAyejRCWYMD1Vlg+2e
	hX1+JIhRfwUvoel04jaLh3FTmolR2v7A/qWL2CN6MCpqZarIpIolOEWBX/cQrhWGA4Shh017WqY
	OLelS4kiw==
X-Received: by 2002:a05:6000:41f1:b0:47f:96e3:5322 with SMTP id ffacd0b85a97d-47fd33839b4mr3064738f8f.7.1785497438291;
        Fri, 31 Jul 2026 04:30:38 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm3823656f8f.22.2026.07.31.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:30:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] hwmon: (emc1403) Add regulator support
Date: Fri, 31 Jul 2026 14:30:07 +0300
Message-ID: <20260731113007.145322-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113007.145322-1-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VDD power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 8b3173da25973..a0f8d29eb6c76 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/util_macros.h>
 
 #define THERMAL_PID_REG		0xfd
@@ -659,6 +660,12 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
+	int ret;
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulator\n");
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
-- 
2.53.0

