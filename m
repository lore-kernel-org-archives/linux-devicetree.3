Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454FE44D01C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627996; cv=none; b=SRPlOuHu+lspxwBX6wEUmVX6N68oBUaYYitvh6B68UE29J7NFOACG1iQ200oanj+hHjO0/nXuuE4EYfXmCr3EK+2hFOQ6LRc5lGAepm9ZGCfKb+HhENJ4qcPmHkhG7fMw8ukkuGdrLu670DSjGL3fvEmgQR9osoRIP88d3Ks3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627996; c=relaxed/simple;
	bh=mKTuHoudPXtUD4fSIGLO2rO3jfWebdMkF2r5JFmyoqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T99e5cZaYIkDM0Utwwwhv/kJew4i939KRpMF2ZVvtga+T/CwYosA0TsPqlaXe0gHJz9KmqJO6iMyO1q/OhcPyEGek/0vzy/rYsnrC/JAX1HokVrXHZkiw4tq25f0kL1uVgpNBhueuEfm+KMTW9UtklbpNzUzuNcF71MxGEgEL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEO8jKBX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEO8jKBX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f785467faso1301482f8f.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627992; x=1785232792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoUmS0jdu/jOcdI96dGt2PLvXC9ansFuvfUj3r5TqFk=;
        b=BEO8jKBXIYIuFwQQJJPrXiyuqvyUYvuOxVe+EJLxf0q20J3uMLGTX0Fpv7tWtMhUsL
         GM4LuXqcN25uSNyMutUpEhm8Z7MI+r0DNhZsQkAYYmb8N0TAqXTtjWvnyPD2gz5xRq84
         yaE9q+84EwJXCM112TUISW0Rgxnijz80EParmF3tfI+5bGQ19xbiR3lMWPZQVfFQ/rsu
         YtTBgz+hx8K54fymkfX15Riu1llkCcjidNtbylgUajRqnw1eDA43rZfbVUvBbmKTUrki
         TtYFMSy2N85l7AsDA9+aTFE/kOQzq+V8qKGlM8SFmjpEYFbH9za+TDyYR2HJjgMxITKf
         dCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627992; x=1785232792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xoUmS0jdu/jOcdI96dGt2PLvXC9ansFuvfUj3r5TqFk=;
        b=aqunP74I1rb213JFi6VF8rV7Q1C21hVaMyjLIUxMJiBkgZexbwtBvy0/QKUUIcWoxU
         no0r8rxl+rWSrCv9ZJ+5lCLNDwrJBMbzv2eKDrQAu//iyuHBi8zSwxZTtHeiA/NlS0IS
         3RbeN8YZEF9/CK7u6E7qFBJHBaf9lNQGtsC6GACMbsmP5KrA3W4cGMhJlT7BkNowG0fD
         xPgQiX+Lo9nKQvN8Vy2TJCN8SdOKPJZiueFQiMdJL7ESmhkBUciag65Vvhb+4StfkHYR
         Wz8w3YhD8hIZsLPDsbb8H8woFL+dz36cqG4Ac0h2IIPrnpfAkPZhzEgm3/KlG2S2bk5i
         1+RA==
X-Forwarded-Encrypted: i=1; AHgh+RrZFH0AwpQrLdZCfF+7ePST11w69JzDlOceQH1pGtSXFOil0OlgS0cMDyt+wfGYfcOdNG4VaAWMmdwI@vger.kernel.org
X-Gm-Message-State: AOJu0YyCG7o2Q+o3IZtgjv9rAiq4AFKARkLx0sI44yOebvmRg8pw0I3B
	HziAGXxvzJ9ykUkRrYJULzy89ZOm/ccvhxC46Sfo9loFy8p8TKqRbtuCaDXq9Q==
X-Gm-Gg: AR+sD11ZKXaToL7ThLzDHZui2Wu/rH+0jx9g51gcinphISJ1KpIYonhDPc6aAQCsyyL
	c27hcSMhZWURHebYGa6JTzYkbcrLYqd3iFJ8x55RbYRyEfOfQxDKRA0Gc2RhGJpWyf1UWAb+JeF
	H3hAtj7F3/kCPJ6+rKEHhwHRSdXqU2J3Ni+yTKrLNRDHZA5FFF/oKLF6QWYkYH51YtopB0m0uOz
	IixW9kQ6qxKA9MyjHlG5ecUnjqVYp/woPvbto6Dmg5KIwNf+5lTRN9E16ClZrfDrk59ej6vxQ8I
	njQi+mbK66mdDrHPhymaHc3cm6Fczob5AVNj/1k+CLk5M/H3WtSj05m3IcMyAqGpiOH8ZSfHV7R
	BrQ5LA/LSgcazA0NvZ43xPQU15WHhHhOvtoLgHq7srzSVbig1i5GV51gHNYyukJi4ocbhLuEgqS
	SO39pVyoPgR3yFShT6Hcdipbg=
X-Received: by 2002:a05:6000:4a0a:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47f6230deacmr20810502f8f.25.1784627992105;
        Tue, 21 Jul 2026 02:59:52 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm35228691f8f.4.2026.07.21.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:59:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] hwmon: (emc1403) Add regulator support
Date: Tue, 21 Jul 2026 12:59:35 +0300
Message-ID: <20260721095935.439174-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095935.439174-1-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VDD power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index b7ab6069ec7b1..5a472760f8d80 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -19,6 +19,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/util_macros.h>
 
 #define THERMAL_PID_REG		0xfd
@@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
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

