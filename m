Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513601;
	b=YnG1OLyOFaslxrESEr/5tCKdYT/BxzJuGFtb658v4WvJaZN5EB+GxJveq/kaRWeh0tLI
	 yb0rNMdJHxJ1ICI0WGJaBz+nrwdpa2zuytTTvaVquPCmHLSf/GXVQLnrAyEzCBdm6/GqI
	 SeUh1pMFarg5moSlZD2Sjsh/EWx5pVsPFc4puRhplLxBJWgruBQ9VvbsdAnMS6l/2yF3k
	 SPbrwxq7O4GCdiZBzFg+J65BFiPP8h71UoIG1fT+uOrwAWZS55eJYIVjd4IuszsGZhbLh
	 A3NscU0NbOCIMxVMhqDuG5TokfdQciKbI/I1bK1zr8zxn0flVTdAR+NjJ/rGFObqL8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GnZSqwlaadL4PUZcokgyQtKhCiqmTb5kZKgMwBNaw/w=;
	b=d+qOOtPDtRSj6tVaMsxSABCHDiS9RBu/eNlno27g744OaVnzqxyb3tYghzf+aA4kr6Z9
	 2KIViv6FuYmqO1XAt4ZHmEFLRkzP90fR69Lo47RCgvrcwR3yfbETeBA8VMNlH/72d60ZA
	 YarvJsZHAb0NyH9KH47wXkwfdrfc4854UhFrN1TzLB04u1KqL2iv3e4ktdlyRnj8ShO2s
	 HZ9fdqt5rDXni7CL8oVn0qIlsHpT/ScVvlt5Erx+fhWwTty3lyX/jVHEPpbDM+Y+zfXx7
	 VS4esy/4aSbXJSbrAszq5u/oWLNyBxVcgfAvez3Tk+pLUoufea+o20wY5Pm/o8BJiFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SWOat0uM;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC6660777CE
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC6660777CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SWOat0uM
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so24208165e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513597; x=1796118397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnZSqwlaadL4PUZcokgyQtKhCiqmTb5kZKgMwBNaw/w=;
        b=SWOat0uMtykoLrOOWFDDMs7TMV4cfqWsKi6cZpyxQ6x1B8U3bBeY+BrBehM1SdbsfS
         D9YA2Rztbp/ssELZIBseqhnvrukpJKgPTsd0HcV4HRH4d09PQrqo2sWs+4Ye7MOp7AW6
         aqhlVvcU4Ez3Y1U/3LpV2RfSLxOaliJc2F3j8hbjsRh4Aduo8iQN+gaTnzuIUFUj5LRQ
         q8EahHyO3QnDP9m/B8MINzZEmHfjVt0suVbJk2aDaZTgnJGvfafiy81Nb6XW1ImpTEZH
         mkzr500eodJoDpvBVMbm29YB9ImpG3eYdQxda8zcb3ZOtjCbojoIt5TZ0x7vCf8cC7lp
         Gv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513597; x=1796118397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnZSqwlaadL4PUZcokgyQtKhCiqmTb5kZKgMwBNaw/w=;
        b=x9MpF87ER2KfZLvqJe1DkkJhlDheIyX4V4rLHIc6PJAOOuatkcFLWRq/tHZS7dq0O/
         GUQ/VV6VX1kDVuu9oHq60J/gCP3QoSsue+5QKzoNtnoylw5vd2lolfgGQBRHwCymtN6G
         RbxS32i/ijJB1Opm4rCrnYWma59U6tyY92MSil3iYQU0zrp1HqrA/iS9FpUlWNpARD5p
         UG6wvwStvr4d0zMQyWUqzMbvNyAjtea5XrjC5UJR6XcIAqflLpLEkg0zx33McjQlDhJE
         tuJqTuZFGjjG+wjrpDRPQddDgCDFD5y/eTppr0Zsupjsb9dv5Kn8r1U7Ebs/IVmTiB7S
         GuYA==
X-Forwarded-Encrypted: i=1; AL+hErE5aPyUTQrF76kqaRYLnV+ZRF5XXFROsTcCFd73SxSpqm9bGaWG+/zEcwhJdPgwndi37Y8B8aQBACVI@vger.kernel.org
X-Gm-Message-State: APuU4Z+W0l2L7bjYsly70cAFES/tDnfACCaWPrzpzE1u5wGD3UEPGpxD
	e9ag6mTOxxIB+OSgNFEKW81maK7/J5ifsyTPSOxUPqaEs1rM4gSHIXZYCZ00o5YB7V0=
X-Gm-Gg: AZFdTZcDqRUtPTyJNL0KYqlUIHVHg5esF7+NMAUlEYYjslja8QnTrtLwHIcLiYTqyi+
	e5TbGMdxVvNFHMIdmObim+As9wlRhv2xkvKLtXhS+ZDDZIREuXX6k0vGP28ouzw/tSzev5BVfXx
	idN8E/0LkvznXJT/YV+osdjFjlT3mM5EFGB6Dk70znAzkqZ6Ftw7hIYSl6aPKBn5KqjlOd/36Bc
	/gP+acL+D22ODRj9TIFABFSJwxbjQhEwZKozZOcJkJxhnn5YpLQLQO2Bzn9c6s1Nb4VEH/Ol70C
	GHWeuG7do/nQY1ECZKVtqzY47F3piCRPrQ8OqmIAUbQvyh6fmXYfMzRyr+ou9ToOI+OIsir1FnJ
	ILpD1gbjTyKOq+L/QK3axWOqGdE2zp8cgBkv44vy6XrQMpOYYjFMTEYld0THSlnGME3DstzHiwP
	7Obo9c/f5S4nYpB0bLWn5Msbp29646t8ZQp16BFPqSdjq6GdtYLMqIMcv4s9BoFjhVBkAG8b/TB
	Aaf/SXg+dLWOef9Z8l3zwJvpcrA0O6YvbTecxCvl+ay1Jvy8y/1Xm214572zWn2RG7BcQOrefwx
	veORczJKKdpHJaQsg31ENwrTXyItWielByyc21dv7rwee5XOlqZMDzganGYPiUUmmIq9Yv4PEk0
	ktzXCd4uniV8=
X-Received: by 2002:a05:600c:530f:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb887e21e4mr276037095e9.1.1795513597154;
        Tue, 24 Nov 2026 01:46:37 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:36 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Tue, 24 Nov 2026 10:46:31 +0100
Message-ID: <20261124094632.8879-4-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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

Boards may switch the supply of the sensor, so get and enable it before
initialising the chip, and wait the 5 ms both parts need after VDD is
valid before they can be operated.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 8142ba741ddc..08bebc8eb5f6 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -27,6 +27,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -70,6 +71,13 @@
  * - MMC5633NJL datasheet (Rev. A, page 23)
  */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+/*
+ * tOp, time to operate the device after VDD is valid, per
+ * Operating Timing Diagram section in
+ * - MMC5603NJ datasheet (Rev. B, page 15)
+ * - MMC5633NJL datasheet (Rev. A, page 23)
+ */
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -474,6 +482,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 	if (ret)
 		return ret;
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable VDD regulator\n");
+
+	fsleep(MMC5633_POWER_ON_US);
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2

