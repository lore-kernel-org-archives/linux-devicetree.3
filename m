Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A01DDA24
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775093368; cv=none; b=TwAuVuop6AbJkGaPwhXqIgKqDh4l22ENw5V/BLCf7d4NK8WGtX1hgC6Z2Mt2SSWYAMsUN7AvqmtgHjgPboZmahfqboSnlkVx0fiKsHVa1w6r+6PEKVgQD1S2vhrdofGIs0Ia0V3v3xcQRMYW7QHP1j2z/1/BrQpqF5SySTc8S4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775093368; c=relaxed/simple;
	bh=CVTAGvXAcTTKdnBCEW/DPOR0/r7OTp2WoP6L3zxM+so=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qzPfZ7QlrRCDnzHbWHOznWDIrnJ5xSVdthhtxwHm0SYeKU92ukTFpFSGSLK+/zXtLnmUwachpowXWSkPPQ656zhmdMX99mHOQuV+pzVikeHlyMp5xskQszOQ0dOqz+kJoUHXl2WUt6AZevgsZtXJ78us3yuTnzFD4zqyRMSjI80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=fiMDhWR+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="fiMDhWR+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso1405655ad.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1775093364; x=1775698164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPTQ0w7kPLOxaM6Du6HVpX/Xqmd5k+Uncs3UoEzlJv8=;
        b=fiMDhWR+ZMldx+qqqAEqaxEVsGhkKFlDVDyhEU51EUzLIr0wOoUy1+G+dA7VWzsVgk
         3c13yy1BQPw8jvNNUcvOuV0NPV+ct4j07IZFIm13Uf+YkfnSnskJNoSl0VyTja/aWrdg
         Kyfvm5RHDs1Xzm0eU6kb8XEl1bryR340fxtGG6kYlHUyYi25emaNq4nRt3/nwHI1mcLH
         0UC9cjxdXsDh2v/w78RkciosobezAyfxsJsuQ7u7ut+yxEbtIvQy/GE8taz0iP/vyZ9l
         tm05HRB4sth0A9aieIvX7CB27IMdHvM8aOc0Nf3Y4ULvaZEqoAloEcJTFQEBJkIvo6Mr
         uOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775093364; x=1775698164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPTQ0w7kPLOxaM6Du6HVpX/Xqmd5k+Uncs3UoEzlJv8=;
        b=ft9dd7cL8hPXqSH9WreYH+xMcCRvOY7/bv6x+XcK0/5Rj9HTZWraOCaGg3sx2Co5gF
         TbgtCV1ojlbeyBjHKsg3aZL3jVXXqxsb27wSp3stsQ2ERr+kPaQ7UegqeTZYsDVpH1oc
         jWx5Lg6eZaA2o8gR7ctlifseq5bxBH9BWApIfLhAJ1tTMQgvTZqVLwZzrfx94ZuPnVbD
         t7LVfi6R+61ZEdqDcrZ081FE3GIf/jGNVnF7pcZ/KIal/MdqGBZRSzVQix2yg5zn4jgg
         CeEMN8T3BZf4OOl8yQhrswKICxpYEl/fU82oklH+Jhbfr2fc2LnfpYTmriRDfBePwOYI
         IpOg==
X-Gm-Message-State: AOJu0YwbTMPKxOV6AllamwA9kNSNncXQYwFkWCNeO9Zb9IQDvgeDR2nY
	oWbe5FBzBm/bJwlWtEDnLuy+jgGAFyinVBuYrn1hgxhbK+L4qdKjJ2fGBwhWZHAW2zo=
X-Gm-Gg: ATEYQzz0/KNRIYBpkCWyS6hsE9WWgwOLsd8IwzSkJyy+sDxXeIz/cjuYGZof+jObqNk
	V3zn6K+LwKDq8R/ggOTzP1CG9JC46Ah9UCqPxsB6Q8sFTlavt9r7iouh8+6TfwhGsDgHvkbtzB4
	wGg78K1E+YomXz/9WP3NHLnzzDqfTjZ7MA3qUIXXdu+wXjnjKqtTQs9DJkExiQ855+Y0ma4UcZB
	2ZZI07Ei3fYjKj46OKC/Rtu1ix/Ud49gUXsp+4ZmxXMZ0sv3i3gQSQyR2D3mlNMwA9YRT6UKk6p
	54bX0SgSdEEN0q2lXSjglHbBGs/41wdYuWQyMXV9SIoRAALhrvi+URpSFMi+evCJTYULs8EFKmK
	MDq91FbvUorvNCpvEIS/H1swQ+ScrimT4iGzeauq1ArWc+eWtS98RiNxhI/+2J95+KK60TPIUvZ
	poByzoDaXme7TYux1iD3JzM7MIpWfoFw==
X-Received: by 2002:a17:902:ef43:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b269cb704cmr56140045ad.42.1775093364432;
        Wed, 01 Apr 2026 18:29:24 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm12045755ad.42.2026.04.01.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:29:23 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v3 0/2] Add support for q50sn12072 and q54sn120a1
Date: Thu, 02 Apr 2026 01:29:15 +0000
Message-Id: <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvGzWkC/52NsQ7CIBRFf6VhFgOvFoqT/2EcKLxaBqFCJZqm/
 y5t4uKm47m5OWcmCaPDRI7VTCJml1zwBepdRcyg/RWps4UJMGiYZJxqa2l6jGOIE+1DpPeGJc+
 BSaDa24KHDXV5KgNKobAtt6T4xoi9e26t86Xw4NIU4mtLZ76u/1Qyp4yaupWd7hW0pjs5n9FPa
 PYm3MgayvCRC1aD+EUORS5lZ6REtEaKL/myLG/cRcBEQgEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775093362; l=2661;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=CVTAGvXAcTTKdnBCEW/DPOR0/r7OTp2WoP6L3zxM+so=;
 b=3N9K7Civ36nMq9e4GqHAeIHPxLLTWjUmY2WoE3svjmkI6pi0wZ3S1dvcXz70IML8z3iDIPZPK
 99uIYiPepJzBsb6bs8iupR19NLX1CBr4f1iLdT9hJ2j2Le/ncbphuoy
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q50SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Changes in v3:
- Fix MFR_MODEL detection by using strncasecmp prefix match, without the strict length equality
- Move blackbox_read_offset debugfs entry inside the q54sj108a2-only guard block
- Sort the debugfs entries by the order of PMBus register addresses 
- Link to v2: https://lore.kernel.org/r/20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com

Changes in v2:
- Drop Q50SN12072_DEBUGFS_VOUT_COMMAND debugfs entry
- Add .format[PSC_VOLTAGE_OUT] = linear explicitly to all three chip
  entries for consistency
- Replace hardcoded MFR_MODEL check (ret != 14 || strncmp("Q54SJ108A2"))
  with a loop over q54sj108a2_id[] using strncasecmp to support all
  three chip variants dynamically
- Remove of_device_get_match_data()/i2c_match_id() early chip_id path;
  derive chip_id exclusively from MFR_MODEL hardware read
- Remove unused .data fields from of_device_id entries
- Guard store_default, blackbox_erase, blackbox_set_offset, blackbox_read,
  and flash_key debugfs entries under psu->chip == q54sj108a2 check
- Add dev_notice() when configured device name differs from detected model
- Update MODULE_DESCRIPTION to "PMBus driver for Delta Q54SJ108A2 and
  compatibles"
- Fix commit message typo: "Q54SN12072" -> "Q50SN12072"
- Link to v1: https://lore.kernel.org/r/20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com

---
Jack Cheng (2):
      dt-bindings: trivial: Add q50sn12072 and q54sn120a1 support
      hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 103 ++++++++++++++-------
 2 files changed, 75 insertions(+), 32 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

