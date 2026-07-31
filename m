Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06E4519BD
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523806; cv=none; b=KyXpg5ZqAo6SHgZCLUuXUm2Qh6xjS9yqw8uWxk1Hqtx2HdwES+W5CM+7IZSZcyUNfh39QUcaHzDv0nq2xmv/+bowHuRZ6r180iY8B60mjI34IpovnZW7sqlss6qVHd2NUG5UeGzq2faKAhAlPZevch7hpZTKDyLfW1iVFCAt3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523806; c=relaxed/simple;
	bh=+HpLF7B1OmOHTjGfNr7/J9YbTYjSw35ySUr9qOfPZlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMVV1XfX7ywsRUfrtHnIllkUpWpXEZZ3M5R726WlMmUKS+g5+B0TvtHWn7BZ3IxCM1h2pAJW3nE2EJJK1u4nKCMV6PJxd4B7iNDTPeQL7+p08ZPz0B+F+KOefdxj4mZZsvDIvP5zaazfNo8UBc77faDiS+MkBC24wjr9ouBWIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INjnWPXd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INjnWPXd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so605331f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523803; x=1786128603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/dwrQc0AkWTja3JDMgvLCLedoVDAqUDFupO11rwljE=;
        b=INjnWPXd1STAQlqlhSnG8tp48rQlf2bvF9y6mlAcGxPziAPX+waxUszZaQa8Z5OIRc
         B/M0tA2LV+IxuWIIJpFrHdZZET9kS+hNXyjAaLwfdhRYkm/yfMgc2c+vHeiTTXykdhON
         vqOPs6MmfhN4qpdc9k2GoXN35X78MLc90NEdwL6a7l15rfA9w/4z58xlV19KZP9u/ydC
         aZ5E1wa5Ig4jSvJi3SHHzfJCnOvtDG6l20nhRS78zv5JLm0DCIWXIZ9HtKgkHEkwliCL
         3HTRNXp8NUrs6rddGHNQ4Wb0Urbqq1PLSUgBRMzLFWw0hIOH004NZViYhNWwzb1OSueb
         dFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523803; x=1786128603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/dwrQc0AkWTja3JDMgvLCLedoVDAqUDFupO11rwljE=;
        b=SHk9hx3/QcYXA1GdvWAX0eQcL3JHNnIaiiux6+AaY+AXnHzyK1sXhE5mI9JcIsao8i
         19kYVVJv06WqsDprrfQpR3krLzk4ayXhDFolnEl/s3j7utzJa0Ql9DNZi8aKuInCK1mQ
         /ZKxqOZ96E/SLWwL4dFSkEGrwwX9JV5llu0EdeOg6MQ5gjGSetpEVUL7HEBudSE6hWBo
         8c+uXNRJRjRzh1hSmziR0KYPOGHpAgQDdZtJYJpLC6bQYKnsqotUWUB94Kql+zuGTPF3
         zMtmiqbHpCMflm6li5KkHyZPbEWi55f5PFxU0ObeZxq6h832GpNMj4DB7h/qA/BTcXm5
         fVpg==
X-Forwarded-Encrypted: i=1; AHgh+RqDcQKwNmZj7L8ZaY2cjJGmb8eAwIybGvRsSMkgpibU2JnA3CHF3wIYq3XeTxZiTEuzscDnHGdxxJyo@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZVKVRZBJGQnQ3BgIxfOxq72V5Jyj+bXbgXsNN3yLo13Iqtzs
	mIevSsVKOFZTJfDH4Uzz98rwNWdsb/PLMbi0u9L6GpCexzGhPQH2czRE
X-Gm-Gg: AR+sD10w/n6JLeMD/Foq5xHzcd0zLS5WsCohcNLBYng+gZP0dOeOx9+3qqhVRNoW85i
	BTsU/7xykclhyNO16jg6iTpARS0g2IeY1BRRVUP9+gukt73j+qy4aeKzcC1xOjWXoow2fdSA9eY
	4AkucaplARi+3WJThPGrnybHdaECwHISFf5ITGWkRcCwqJJFNF/EJWsNsIakQhjclWitCzlc1WZ
	B9OXp5IRHQm3yj/ojybZV26531+xSe3LHZe3bbQ7FM87LwziKgH+qjuSQ/TSR6XLDgrdOTxjo0H
	+d5zOD7vqHjThtaXqd7biLgLrhTRtqxUDKSdiW3SeiI7kvrN7G6nHVPPMJSFtU3dQ4Oo4lPgGGy
	Kd2xrt/UCiAptyCVtDvO+2IzU/UTuREJPhh5ppekFqx3QRBByxXnLyodgP2u5025qUz3iu0ZVci
	n3CkmN/+6HLaLqFjRLgVo3T0ZZjGNs86p/+rzFbcDmmEkFqjsxdQBhbI7+SgPO9Ky6
X-Received: by 2002:a05:6000:2f83:b0:47f:934a:3029 with SMTP id ffacd0b85a97d-47fd731c35fmr1567209f8f.60.1785523803244;
        Fri, 31 Jul 2026 11:50:03 -0700 (PDT)
Received: from antoniarch ([78.211.133.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm8741488f8f.14.2026.07.31.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:50:02 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 0/8] rtc: abx80x: add support for abx81x
Date: Fri, 31 Jul 2026 20:48:23 +0200
Message-ID: <20260731184831.44037-1-apokusinski01@gmail.com>
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
SPI versions of the ABX80X RTCs. The first patches (P2-P3) contain bug fixes 
(added after sashiko's review in v1 and v2), then (P4-P7) we have some cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

Kind regards,
Antoni Pokusinski

---
Chnges since v2:
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


Antoni Pokusinski (8):
  dt-bindings: rtc: abx80x: document ABX81X RTCs
  rtc: abx80x: add mutex protection for register writes
  rtc: abx80x: properly handle shared IRQs
  rtc: abx80x: add irq to struct abx80x_priv
  rtc: abx80x: use regmap instead of I2C specific API
  rtc: abx80x: replace read-modify-write pattern with regmap helpers
  rtc: abx80x: create abx80x_i2c_probe()
  rtc: abx80x: add support for ABX81X

 .../bindings/rtc/abracon,abx80x.yaml          |  18 +-
 drivers/rtc/Kconfig                           |  25 +-
 drivers/rtc/rtc-abx80x.c                      | 639 +++++++++++-------
 3 files changed, 427 insertions(+), 255 deletions(-)

-- 
2.55.0

