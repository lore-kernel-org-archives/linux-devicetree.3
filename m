Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7424113D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928783; cv=none; b=ncc56lqAng59miwM/zd3VkawScxASF7fMXgWc708UaYaLH64MuMD7MNVaKECUN2NjhiMlQ72YVFHMi6NMBmG0kpDa/zM6LYq60dZ4q9FeV3jDI53qybGseqIroXg3aq1tCILM7+kRB4myM0CxKjAO5bjcziEJMENsTcqcmK9XBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928783; c=relaxed/simple;
	bh=0ocoxi7CHZcv4ySK2i4LPeVm3pWLM2FBVNGsTmn9l3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q7zPdDDumWIhkLxOOpodasfqP31Zy1m/F3g/tpfyj6TXN6zhJpMr8nPJjHrik8L9Vlz4fqdLq9IspAnudkUyoFmEBRRTYJbivSxHXKl6lSGKB+gYphrKCXU3QiboL/W3mjrljXpENXw0uhzDLjmWyuhvgOuk8XJgj60kkx/K/uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKGg9136; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKGg9136"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cedda2ce6fso1172595ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928782; x=1784533582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lcyi2dUUtvxrXwOPfd5hmyhdh03HvfTHVOaEJNs2rJw=;
        b=gKGg91369vBJ+Zq4kpCWMR0R4kE0KSZaOuvMeBMO3LQZjgyioBMNvWBTA+vgb+VccO
         6hgXiRmKPJ3PkKpkCcLbIDzVbhFTCkL4h2287WC7kxG4u31pwqIalzjynZdetaOoExpN
         V6GG4oZse2LkmwLEZPvppfZlqcve2hbdualnb1WIm24aMrKVIiwQfh7ivLgU4EXkvH4H
         EwQy3E8DZYR95/2IjN4VWFc7TEchs56FhK8hrRVxBYcX2VDAWjnPQ700yZ9GvmBk5xNE
         U4il/CsC1OmffuaHv+fe2PsBDlT/E2sITFwHeLmtS9wreUZKWRqqQPYqX0hQ3JiLtWX6
         6QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928782; x=1784533582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lcyi2dUUtvxrXwOPfd5hmyhdh03HvfTHVOaEJNs2rJw=;
        b=T5oYQH5k4xtv/yC3F/pH5VeNx4p1vbReI2msaoOLJKPEVQyWu2Y2dyc3Q2dM5DcfyN
         0ZUveDefdt07g7nuIVnrYDr0bVyAthbGybYXN9RkulYV7KyD2WJwyiYHk/FbB0xWaYGS
         UGtQRp1Qn2qNerTJI1ivxic2D+9HXZo5v222zDhK69ZOa6PPF4bKV2n/ZlsisWRNC2+1
         hxO88qC2BltLWz4p4noaN7LpScuNKByXCjti9vIMscH6oxQEP+V5EWlK7Az/3hq6TirO
         SWoG1QwQQqJ6OOsxC4B/AY4B91V9MG1PHyEfOmH1xxtqzxzvYYK5BowwzSzbC+srf8b+
         O/mg==
X-Forwarded-Encrypted: i=1; AHgh+RopipZwA0RBUfAMlUTnm8U8l2hYjRuyU/ZbNlvzkxcpjIxgtYTtMo1zrKa56piAkeFB1t/VwYH22ZA5@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrDEv3jx23UZEF8pXHRVV3+PM80nd9UaZz+ptn5YPDRpu2Xh5
	86mMej71KJf7/gKHyKI/TiIFG1nF8u+QzKAADg6cPVYERLXpLP6LkeT2
X-Gm-Gg: AfdE7ckSYTiYm5sXOQfGGuKoThCeyr/a58FlvqnGa+nV5wuZSC/juvOwbc8TiHtU64X
	wEp4JwrAFzMIgVbMrdJ2ps93M7gjo8w/LDe8hpswNUsshJoMtRb0cuxIG3FMBtUCSjH7IdJ5sdu
	Rtu1XghYfJX9V956OcNXZZj/1Ls3J6bhE0i/DbPVWmeeus0b7OCWM25Ma3tYnoALqaytc7p9qEL
	bflHRIe7w+0PtaFd5xV4hO1+o1WPYYJ4VCjgvmcIzy0FqyIr4fcURTfovOuw4eKTPk+dIrPwXsC
	y3tASSoD0bom612TiDLS9q6ujyMEnj7UDXkOkLve/7Tlyb3Ro6wkWRyZvNB3KRX+/fi8RfmUo6w
	FDq2NQ08NQwGZIR3A5u0bMptYcKBYZZmVPMAgB0qUPh/xaLVVCVxiJbU21yfJQjLbdsPDv7UMgY
	txkULy+mCaVwQ65UhKFCXV3w==
X-Received: by 2002:a17:903:120d:b0:2cc:864b:539 with SMTP id d9443c01a7336-2ce9e79feadmr90378155ad.6.1783928782036;
        Mon, 13 Jul 2026 00:46:22 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:21 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Mon, 13 Jul 2026 15:45:55 +0800
Message-Id: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds devicetree support to the sht3x driver and support
for the GXCAS GXHT30 humidity and temperature sensor, a drop-in
replacement for the Sensirion SHT30.

Apologies for the long delay since v6.

Changes in v7:
- Model the higher accuracy parts as compatible with the base part
  of their group in the binding: SHT31/SHT35/SHT85 and GXHT30 fall
  back to "sensirion,sht30", STS31/STS32/STS35 fall back to
  "sensirion,sts30", and explain the grouping in the commit message
  (Krzysztof).
- Drop the "gxcas,gxht30" of_device_id entry and the "gxht30"
  i2c_device_id entry: the GXHT30 is handled entirely by the
  "sensirion,sht30" fallback, with no driver changes (Krzysztof).
  Patch 4 now only documents the chip in Documentation/hwmon/
  sht3x.rst and the Kconfig help text, following how SHT85 support
  was documented.
- Start enum sht3x_chips at 1 so the OF match data is never NULL
  and i2c_get_match_data() does not silently fall back to
  i2c_device_id name matching (reported by Sashiko AI review on v6).
- Mention all optional properties in the binding commit message
  (Sashiko AI review on v6).
- Rebase onto hwmon-next to account for the conversion of
  i2c_device_id tables to named initializers.
- Drop the MODULE_AUTHOR addition; authorship is recorded in git.

Changes in v6:
- Drop the trivial-devices.yaml approach from v5; add a dedicated
  binding and a proper of_device_id table. (Guenter)
- Split into 4 patches: vendor prefix, binding, driver DT support,
  GXHT30 support.

Changes in v5:
- Move to trivial-devices.yaml and drop of_match_table (wrong
  approach, reverted in v6).
- Drop wildcards, list specific models.

Changes in v3/v4:
- Standalone YAML binding, split driver changes from binding changes.

Changes in v2:
- Fix placeholder in MODULE_AUTHOR, fix commit message wrapping.

Zaixiang Xu (4):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT30 series
  hwmon: (sht3x) Add devicetree support
  hwmon: (sht3x) Document support for GXCAS GXHT30

 .../bindings/hwmon/sensirion,sht30.yaml       | 71 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 Documentation/hwmon/sht3x.rst                 | 17 ++++-
 drivers/hwmon/Kconfig                         |  5 +-
 drivers/hwmon/sht3x.c                         | 15 +++-
 5 files changed, 103 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml


base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
-- 
2.34.1

