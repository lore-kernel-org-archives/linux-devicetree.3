Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CC3859E6
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390808; cv=none; b=WmhNDEBC6n4FFbS3BB1/QqFhXdxj/HYC1oysJQlMU/bbSLCLjCyKgu6rxTK6/cK6OFoUuP0YJ4ce8l+v80V5Qb9tEdrwPYeTP5U0tNzi/sbYSF6ktDq5VNq2j0xYQBpqflMFoSr8mTAMyRRdQYwy2ppr//wK8fvwZV+QMlcB31o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390808; c=relaxed/simple;
	bh=TaWewZmZdiyyYEvO4QXn387rDKrFrS1EPnJDYMrcQhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsrEmnq7Zpk1ST3kimBGMT3borl7dDemTWlDvvqfco//jYXaQL6b+gy9YAjtPEL2iYYCVGf9KhjB/YcacCjHs4eMVORvuBIQHdGtkwAsWK4w1TA3hrSNI+KGb3qINJyv+q5keIajI8pHp9m3ONIJnLyynQ4ndi484db0nbPyOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKlg5tMj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKlg5tMj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so1183175f8f.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390802; x=1786995602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg0u8jIY3RdcCncNxYq4+4NKxyzf6tm+h7D9IVK82fo=;
        b=BKlg5tMjWLiVi9FOvm3y97U8uzf0AWuwDQE6pshs9iyngJp305+damhIhBUM41cBgJ
         4TLc7dVgv1LgHGUAEjx8nq6JT1HiYhiyS22eLF4GDWPA6KZRcqQmxHodYLL7s1EVzmVT
         VnUONPmJglLQM5BQZk5di0tU4JMWgbQfVw+Vk9jqNYpHbaO+TAiJUWsp+BdYaC7hBLXT
         qoXwmsbIGtmuVh86RfBlv9YfUfayzubC/Ckau2JLc0KgtJ1RCYnoeWIHyf4VswzKozzX
         v48AQE1L30lr7tTVEpLcbXrOc1N+kmcMdNSMEIhLKwu+XuJV6af1eIYXNBNgeSx+VsGh
         tb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390802; x=1786995602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg0u8jIY3RdcCncNxYq4+4NKxyzf6tm+h7D9IVK82fo=;
        b=Q9XsPv5X/LiD3GYyS4W0QeRhNi29iB+/Y6ld/vrlGvYe/n9TwtKqufOiwd67+3wqRS
         6Xhlencx4ptawahu4JDwv6+5NwAgDApq7JhM1Tpm371jmooITjTkglmUme03algFGdBP
         69RIswrYS6mVE/52gwioguTts3Od4o7mS6f7fmJ1IjDq5DlPTrRqsfxON0CjQ1ALlQQQ
         eCdo2hQ6bPbYZVOEFFrYks8KPWsGKEdO9aSxkrPbqQ119mY2vuv58hP+jaV5bgv7Zvk9
         kvvwLYk2Fc4ines5ILOdzh2roNZ45rRIel9wayrQ3jhA00ryuGykuz0GNTZav8Z7xOkB
         LJHA==
X-Forwarded-Encrypted: i=1; AHgh+RqMUI5h9mWIMOQGp4nE4l0/h0i03sx+sSDX8B608sFJ23lRrK9sjEruNiiPuR2DErpK12aWPYwHKy2L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fYVQmqrTbhRcc2qjDho8S+m+UNSQgFvQH1filnEuDhRueWsL
	A31luIW/pUV9d28c1IutNUHcrNfxtbbR+aZoAI3bBQXA8//OzE2UmheYCIdqPUuw
X-Gm-Gg: AR+sD12jjHG3ThGIpegxi+ijLh1ilFgrWL1VPSVhCYieX41I6jk4fjYzZftChgm9er1
	9w0TvXcGGqhL0jbqeeQza0Bp5L4h5aYN7EEHRiFmS6Byyr+7n7nRuigsriRdEHDu7qN692/Dbl9
	1On0ja5bHHFku/jkoJsRvpR56gUDrzHrDrEU+u+QGfvAHzLGUkAs0t3tGKx0WvPeJngH4pToQiu
	1F4p3nPVNgGSNfCYyVRrli10fggPCvgYLdDtyMgm2Bf6Mj+mVyzxHfXNyV6ezaaPxxLjUhRF2i/
	Ws+1ktOmjemhKvs9hB07MdhD8GcFn1ninUKF5oUapTHiLiBkL8zQAy7LqegJNkTiFiWXkj1HdDK
	++9m0ab4hmCiK5+0ISi5AU1/sr2NzQ08DgV9ll2TP/GENpz/Lom/zUxAAcpr6KFNDEyw0nDhcUf
	2KVk2CXhmrUZ9qpww2f3s9dv+47qVNtKsbW+D6XwMLRkBN0uJWBugxNtc2TqMe5Xs=
X-Received: by 2002:a05:6000:2588:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-480026d7a50mr37788215f8f.23.1786390801677;
        Mon, 10 Aug 2026 12:40:01 -0700 (PDT)
Received: from antoniarch ([78.213.94.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm39291689f8f.14.2026.08.10.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:01 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 0/9] rtc: abx80x: add support for abx81x
Date: Mon, 10 Aug 2026 21:38:17 +0200
Message-ID: <20260810193826.210683-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
This patch series adds support for the ABX81X RTCs, which are essentially
SPI versions of the ABX80X RTCs. The first patches (P2-P4) contain bug fixes 
(added after sashiko's review in v1-v3), then (P5-P8) we have some cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

Kind regards,
Antoni Pokusinski


---
Changes since v3:
* PATCH 2 ("rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()")
  New patch
* PATCH 3 ("rtc: abx80x: add mutex protection for register writes")
  Replaced "guard()" with "scoped_guard()" in "abx80x_ioctl()"
* PATCH 4 ("rtc: abx80x: properly handle shared IRQs")
  Disable all the unused interrupts in "probe()"
* PATCH 6 ("rtc: abx80x: use regmap instead of I2C specific API")
  Changed the type of "flag" arguments in "regmap_read()" from "int" to "unsigned int"
---
Changes since v2:
* dropped patch "rtc: abx80x: move part autodetection before RV1805 configuration"
* PATCH 2 ("rtc: abx80x: add mutex protection for register writes")
  New patch
* PATCH 5 ("rtc: abx80x: use regmap instead of I2C specific API")
  - return PTR_ERR(regmap) on I2C regmap init error
* PATCH 8 ("rtc: abx80x: add support for ABX81X")
  - return PTR_ERR(regmap) on SPI regmap init error
---
Changes since v1:
* PATCH 1 ("dt-bindings: rtc: abx80x: document ABX81X RTCs")
  - added missing "spi-peripherals-props" reference
  - added abx815 compatible strings to the trickle charger enum list
* PATCH 2 ("rtc: abx80x: move part autodetection before RV1805 configuration")
  New patch
* PATCH 3 ("rtc: abx80x: properly handle shared IRQs")
  New patch
* PATCH 5 ("rtc: abx80x: use regmap instead of I2C specific API")
  - changed regmap_read() argument types from `int` to `unsigned int`
---

Antoni Pokusinski (9):
  dt-bindings: rtc: abx80x: document ABX81X RTCs
  rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
  rtc: abx80x: add mutex protection for register writes
  rtc: abx80x: properly handle shared IRQs
  rtc: abx80x: add irq to struct abx80x_priv
  rtc: abx80x: use regmap instead of I2C specific API
  rtc: abx80x: replace read-modify-write pattern with regmap helpers
  rtc: abx80x: create abx80x_i2c_probe()
  rtc: abx80x: add support for ABX81X

 .../bindings/rtc/abracon,abx80x.yaml          |  18 +-
 drivers/rtc/Kconfig                           |  25 +-
 drivers/rtc/rtc-abx80x.c                      | 663 +++++++++++-------
 3 files changed, 451 insertions(+), 255 deletions(-)

-- 
2.55.0

