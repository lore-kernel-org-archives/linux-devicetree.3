Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446164;
	b=tkwU7Mo9ohqfyS7rXTdIly1jIr33EWIZxpCDfZN8BP/ktim5nGy7go7Uu0cJctPp85jx
	 zvcWA3tYfq95QP+rNUlDZ8BLZ+ygH2W57OKrtopftjpy+R7BcrsUCpVTp9MCZ5rjqbkhe
	 FdQTlhKeW5jExsQmqrByOUKUwpwamoCgLUx0U3VoGbNfGh7ovfiPDBTcVv8lt1SSL8JGi
	 PMxUFPR+HZiUHRHLxWHOpzcaQYTDA/aL+fatR2R6HXOwG6/NU1HerTqG7Y8jrC84tzimt
	 IXvxnV8Qd9KXWkbx8xjE19JdYtIX4IgPRVuR7nTOULok0GjiQrypYCxAXfHFpJNReTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
	b=WnBv2KcbxL5SBna/5qTFkSnswbC8iRn22MnMCncxcjNnaZwEBgg5Jux7NoX8IYKc1nTV
	 MQAALns+zDzIYwbnLGg/eURLBU+FgewUjzE9YF3QnYK6srYyzO0UVIrXvzpXmG9N6AnES
	 5zaqf6PTbn9GzYoKRabC8Qkwoci1uviAoFvS7i0LSOU7r0Z/xgJPZTazZfgKdquOGTmrZ
	 fp6VeHZqCv4CM/MLwcDW/nLGFsqDyCtWGzSz64eNwFuZLCjxS58IbpONDBaTrnAV1+i6c
	 hZ3DGUbY/nQ6ZfO0wnsyDScbPhIAuONlM7FMX1gJADJTyqZ9a+WYx+wVJGWbulWrwZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RX47pmgS;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D34606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D34606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RX47pmgS
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c515319dd89so382505866b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446162; x=1796050962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
        b=RX47pmgS6eAVp4IDiHSKFNIwzGNgVcBON8YEC3wo//o622kCQM3IeN5IuUOW5hjPzl
         GXbJ9SaVBehL2PXBdBdHrolbxf29Wn/fBJAsHrS42/jb6vpOyebIsFJfn8+x83gFNzKu
         k6PjWzTqsAonLARjKwB0E0Wk51s9IL/xgU07B6xwO3rEzy7xDaxZbPSPGASkdoBEWcoI
         Jbeh3D4TXoLi+nBGtp30LKmYh4H38s9Hxzv15C9Hzm+zX1/lkDwQ8VRhw44NUbjTHmhq
         CpjYxt2BAKB3qMzYKeqEITZqQSRdNrlgG9GKLU2/O+kIeCfyV5SoFGZqRCHeVOOGabau
         YCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446163; x=1796050963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
        b=BG9RhNHOR0RRhmjC2UZJzcG2QSZ/qd9UAz0WGX7cDy5aWsT81xLgkjU4etJwUzrHUM
         CGvwwImxYqMS7dulSBmjzjop1meTI/Js6ZkCFrDRHfm//hDcl/Lea2XEoX/QCdDesVl4
         dLhA3ac2JHZ4x52vAI0Fle/VD7+EqZwbuYifhy2j5m3TS+I8+xwfhiSQ077z2MvtoNdQ
         RutQvNdS5XL8g/4P5dEddl8fCbCPWHGb3MzTNBmwdgw5uGs4yjacvGvY4BGlnQbJDQGN
         Qbz8bGADdFMUsSEKTa11IQlW9v1Ldw4UoQWREIieLCcbQIxZy9B7q3hXgJI5iys4P3Uo
         x43g==
X-Forwarded-Encrypted: i=1; AL+hErHMSODMrv/8tUEosNLrj4r4GVTfrKi6EeOXB9ibKVZ8gE4hoFK+dGBM0JRIZ0uBB2HEW6FR1lc8Agsv@vger.kernel.org
X-Gm-Message-State: APuU4Z9q23ocvs0vuCLwmrQ3WdOdJEVthjx4PEShQ1lbWwtyJFTGZ72k
	v6C+5DmBsrCpPkC3QtdHae2cuzbRCH0taVkQy/2Qq6UTApJ3XPzes4pz
X-Gm-Gg: AZFdTZfMlZ0UjnJmzhAtZEbJwZ6C7gUlw9qOFqceguMHL5gA125Gz5F8mmR7takHP0e
	XXjC/aHKeWk5zvAM6LuHJAyBbPDT5mNxxxM+qDJAKhqIyIj7DB9dmawQt7oA7nINLb0c61zdUeP
	6SXo3ZQXtjxjz+vkjmLItuRx/vYfxy81ufv+V0c/ocKmI5pOtWDE3gtqp4gsm1sBt5Wr3htZFmm
	z2LcrIKwVSmi8oEr4GnfiDL82Fzy5GHcqxFusfH66tP4mKZQEstl5S3ClwYpYEB5xhfuIwhqiSX
	jFGqkdx5wEsUr9vRN0UDj6vbA5labQHFuv91JXAElXaPMe+Bhj1Txte51Uh3kwDyJLujML8xhJV
	QBLQzDuKTm+K0cgwjkKgwfZrVpXktCWRq3JESZrgSgW7OxbVgGmiCh1ql78GPLGQ/0FNZvDmwRJ
	ke6Ek+EKDzfqSSGeh384ZyGQVxOYnHWOT4ZRK0+02HbkvF2c3tFhjoK79WgpIYz4B2SlJroV1Lm
	GzE24eBxdIVRDOkdTMEqtZv6vIUAbQNDvRuh+Nu2qMSMEBiJZG8xAFnxFNURG5AvnNOChBIJgf9
	RksGOQgDSf8OYpJlKbfoLMyHN2JO91DOHWurA6rP8TqI2BE/mWvFHls31N5RM8btgvbe8wWCXwt
	PkOfqIOumVw==
X-Received: by 2002:a17:907:f447:b0:c51:3b74:9d07 with SMTP id a640c23a62f3a-c513b74a25fmr971881966b.18.1795446162362;
        Mon, 23 Nov 2026 07:02:42 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 0/5] mfd: max8907: Schema, pdata and poweroff
Date: Mon, 23 Nov 2026 17:02:19 +0200
Message-ID: <20261123150224.199601-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.
Add restsrt handler.

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()

Changes in v4:
- dropped in-supply type definitions in schema

Changes in v5:
- rebased to be applicable on top of devm_kzalloc_obj conversion
- added restart handler

Changes in v6:
- rebased on top of latest next
- resolved conflict with Lee commit
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 168 ++++-------
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   6 +-
 5 files changed, 349 insertions(+), 185 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

