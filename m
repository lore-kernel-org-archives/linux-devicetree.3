Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA702322B8B
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429707; cv=none; b=sH43sVKuleItybfbzgWk/b9LjaysCBjS2pIHp+HFJCZefmG8JGEY9U9195dRc5yZ9gRMP9cxv3wTPSTaySOa7nGbPvlWngBnznB2HLnGAGndrEgsTj56zJRZCu35GX38HGtcVkFN2gnyboVRHgBVCSFtNfZ8W5efJ6Fu4/DCtr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429707; c=relaxed/simple;
	bh=vFjMqoedNXI3dxHPj9c7YUFENQqetZZML12rAuXgJvE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ozeFSjglf5v8+W4IAO91uAAmqWRdb4ADbfWYPBYB642WfD6smnjuHaWg1UC+fRy7fqeofIQZdhSRJXJqVdebZoXqISqq6zvOYsnjqjdiZQJVSnQbWz6Pdkx8R96UvxhmAXy3eMqRZVPSTigzR7a9HhgNc8okThdrN7jdNjNPSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEP/TEeS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEP/TEeS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82c20b9fb16so1059260b3a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429704; x=1775034504; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvlxsqZ3I4bHXEeUCqqTryq5BgQFW2GJzRWk9m4n5Qk=;
        b=HEP/TEeSSDhQnyj5ZSA7fFeuHqMRRtT0nYCfPYkHFsiUftN5ld5KO/PTVY2V9k49Jy
         cD6VckBVKeYBwHgDRNy/FWZ1aR70LjrNhQhwj7o/Xd2eZhcbmP4/kiSmk7r8uoBL5+C1
         QxXhXoWTCF8SM6ly6Aw/QT3RCiDALuQ54dAsxItr8xSPWtnu54LwjPvvk8llE94um62+
         tdDi6N2XfmO2EaGHenT5IXtGWR8WZc94pf5EuzUxWUs4L4bIueKvPAATiqleRDwMam2n
         RoEC+V11Rq/0pt4jrzqdfLYGpU/ORBb7xwnw5pFuhgYGY8++Kb9rkMvAOA5KFRrFMqab
         i3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429704; x=1775034504;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LvlxsqZ3I4bHXEeUCqqTryq5BgQFW2GJzRWk9m4n5Qk=;
        b=mTxLRTYJsNHrUerrc5zCeH5bJSZZOK9wcDfSI5OYL0dAihNR+d9vM55z1zrx8JYFzy
         iY3/Ip9pUNrvVp7CjCLyd9a/U1MeO0uQoCBESJXK0qY527K8rT0/G5FJZfwqCHtnNnwR
         z0uRMUuVWlroHwv2psqEFCxzZAydUD7eEZZAP/XEeoRPYI3bY2JH18q4JgqHwOzIJ5cD
         1+sKBONNbBZkxwON+slEKMD/5klOsL2h4paoXRhwOo0PnJ1UPsJ/BVkaTtQppC2pwQlm
         a+44aDprGNNmIRT6F1qPAqvv2mPl8qjpgZXvRDoHmVb55hDmEMqYBMbp53bUIL+mpUDi
         AkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw8ENyurU88gQNibGyHQCk+GzwBgUQ9CqtwW0Ino89kEDyBVKWAPP23Qtgt0ImuZgggCrs4d+cCn0Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxlUeTIsxTPK9NL3Ck3U5Z1m4fycAuoIcsOtrOTSZKMFsnCD8Ay
	ko9Ul5J9fQRK7MdcWy6OMq6uL8eueVJTLZh03TKVfP1FlReLAgE181DR
X-Gm-Gg: ATEYQzwDTiNtu0ILd0QZcNOlgwrFwi9nM/77n/Q4xIxPl/vmoImlWPkbeNFdXKl3mJ4
	u3eqz58VSseKVdyVCx4OeJEW8c+RLwO1XPYROHj8eUyQU4USO6FhbPpSQtbEavcJnqot91QtcWh
	3jJ8y4Pj9TkrxsRwZzwsdEBdhx+0Y0LewSL1WYnQrmRbzNqoV+VHLkCdDCcja2NYdxIZHviocVP
	YjdbhDvv0wvWqjn5R8rVN2zh7yIajEMnZbzlsdVUP0wiGIPTSujjkqTp+QiyDWWYG0x+h/etlhg
	HypOfvWM/Rc15ZTqxB4f3+QfbxfquBCY8IF3dQ/CtLe8Q1bk0eDbWoaUxLzZ+eKeioBoGhHRQe1
	VQt9dU5eV1rSm1aLHG9OpXXrae81yUWASMn3w3DS7+PB7VH4rplrhkSCjQEZxh37Mcd2BanftWG
	o7LLHRD+imqVUAYtnweXGXZlzb4WDmohXosjCfXyEQzXryGenUPchfukdzEDr9tgY=
X-Received: by 2002:a05:6a00:94fd:b0:82a:7678:36a0 with SMTP id d2e1a72fcca58-82c6de9ee22mr2817719b3a.16.1774429704089;
        Wed, 25 Mar 2026 02:08:24 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:23 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Wed, 25 Mar 2026 17:08:06 +0800
Message-Id: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

This series adds support for the GXCAS GXHT30 humidity and temperature 
sensor. The GXHT30 is software compatible with the Sensirion SHT30 series.

This series also introduces the missing YAML binding schema for the
Sensirion SHT30 family, replacing wildcards with specific model names.

Changes in v4:
- Use match data (.data) to correctly distinguish between SHT (humidity/
  temperature) and STS (temperature-only) sensors in the driver, fixing
  a logic error where STS sensors would report bogus humidity
  (suggested by Guenter Roeck and AI review).
- Update YAML bindings to use fallback compatibles for compatible chips
  and add optional 'interrupts' and 'vdd-supply' properties
  (suggested by Guenter Roeck and AI review).
- Simplified of_match_table to only include base models due to the 
  newly added fallback mechanism.
- Renamed binding file from sensirion,sht3x.yaml to sensirion,sht30.yaml.
- Include Conor's Acked-by for the vendor-prefix patch.

Changes in v3:
- Split driver changes into two patches: one for DT framework and one 
  for adding GXHT30 (suggested by Guenter Roeck).
- Fixed commit message line lengths (suggested by Guenter Roeck).
- Removed wildcards 'x' from compatibles and used specific model names
  (suggested by Conor Dooley).
- Added manufacturer website to vendor-prefix patch (suggested by Conor Dooley).
- Fixed missing newline at end of YAML file (reported by kernel test robot).

Changes in v2:
- Fix placeholder "Your Name" in MODULE_AUTHOR.


Zaixiang Xu (4):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT30 series
  hwmon: (sht3x) Add devicetree support
  hwmon: (sht3x) Add support for GXCAS GXHT30

 .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/hwmon/sht3x.c                         | 16 +++++-
 3 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

-- 
2.34.1

