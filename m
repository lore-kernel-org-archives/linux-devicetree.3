Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E352DA769
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532914; cv=none; b=EAuhZ/FdmPHP9UHhBfRHlNkTmsFFNs4/xGNDU5UYmIql/QGBdQ4NjMi1jod2p9lWH+ptIKuEuNpup+h5iJs7pCGQv5iqju3dCDMTBzPzA3DpGGdXgV2ggKDhlP/lZFjWBmpv64+zICibe3sqOkQftGqbPJRd0w511BcuiSnq7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532914; c=relaxed/simple;
	bh=fkANkZGrlPyyPf87t+LAjl2jdK/qL0Ex3c77JETrFyE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rL5eFXPkWAlP8TA3KWiEbjwMSTB569yjXnyUZ/EGMunZIB94vA6mCm14ZPB+S/touQU3JTPN69zm2l1PG3CaJWkK5Upt6O673KrOQk9LaWk963qicoSFxnLLZDDMs2xMr1SI8IL5CH3zdwos3hSJ4He0jFO4IuvMjMAwXPKG978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=D9MydwTy; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="D9MydwTy"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c741692db4cso259903a12.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1774532910; x=1775137710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+h3PhzbBEUuFG1BSZSLnovJIQ8tNsqLyZwY5UDDcc4s=;
        b=D9MydwTyDj2CE8tQxaRsZUKh98sjs4sPVs+L2sS0gqTUJMqgH4Y+p9VXi98IDxlgYX
         LZBSSUs2dmTDHcaIu+KSBqQPm37TuTfCMLYkLtX8UQocSciitxk2LP+PNPa+khzsCa/T
         3w5QBva58/2Ve3n4ASw4CrOFhquUDC4kywgytBE4JoCHaCL7FqqQFQqNjlGrfKPnMxlH
         GKjt/4bMnoBhUw7hYFMEjfkyCpQcU+5BqDi9d0W6CxAicGgGDIi+GIg0x1hgZnKk+M+H
         w6o5utn6JpvB2wY37V805DoREx1Dd5VtniezougU3BrNA+AKoaOnB27MS/921haMMzS5
         hJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532910; x=1775137710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h3PhzbBEUuFG1BSZSLnovJIQ8tNsqLyZwY5UDDcc4s=;
        b=q20LkzRlnjOp3zM5yMAXD8jxKXp5t93+bkkgbkk5Ykjr6uJbfeCd/2O3lsf6alcS1J
         W5UFfaMcRCE4blZsPfNpec9SV4yWjIIScwGRN+VonS18fX2I9vZWFn6SkQH1rb4iqJ8A
         6qQ3Y4F/CnRRJZrSNBVGoCMphdUVeEeHCokGMP3cVEgMR00hZiSO+H0jTgnRKqLFKmfm
         s+AAv8eyf3stcOijoG/GP5BCuRM/ZUhyuG0HLcPiHEN+iaFJbvT3zBUMZfeLVx4cK8Lf
         Od2RetZxHhOGIdliyCYXLDdBy92IecY+dBaZKiyUYSgqgZe3+vaGKxSXM67ev8/e4M6/
         IokQ==
X-Gm-Message-State: AOJu0YyvDF0zVBuWaLgvOCs2nNNcYoNJWueWjOZjZ72f+tJpdkVgZSh6
	zRPqCgoK0dkMosbPFWv2Um6YgLX876IMWsePjEsi2HnLhX+v6mIX9JMb3ILN1z22lHk=
X-Gm-Gg: ATEYQzyNiE/ZgGhZaPzeTal5NpV75WaI0AlfSkKb13R9UX6ur4gxuaQDI2yBfn0A1G4
	rkM3QLXdbiFcMgHUhE26vQixxOrs9ZM8mL9XnlUU+mCvMSonSZ2iioeULh+KrvUhawU8cAJhp1N
	huuffu/crNHKqcOAd0MqLO4mzjKjuE9463eqPiKZvoosDspW6aTZSuOTQDAROkbJrn59PJKj1nE
	bIOyDZHjoZo0WIdHEUUHzbB2c8FZtAgSmeLZaUcak4OQC3wWc4aMHodyI8bxCiv4y0G5JTByoIB
	U6jk7DnA9/QXj2gHcKqU0zMZYwiHkcUuPXs5e1SxNM4UnDsgHkfB6cJTnyHxyNyXgYLugsOU+iP
	mqeBCOWZEZrQwzHHQjWkeA9zH9sfFe9DGmyH7GUZnj+gvAAhK2DQcwHoAcPxAzSP7qnR9rITg+v
	pwLMWmjvYAIe34jQ+vYyvFLzDPvEBcf51gzCYVMqCo9eEh0xw89CH257x+cxn02Fw=
X-Received: by 2002:a05:6a21:339e:b0:39c:5952:eab8 with SMTP id adf61e73a8af0-39c735564dcmr1832586637.15.1774532900411;
        Thu, 26 Mar 2026 06:48:20 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28d6sm2706683a12.6.2026.03.26.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:48:19 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v2 0/2] Add support for q50sn12072 and q54sn120a1
Date: Thu, 26 Mar 2026 13:48:04 +0000
Message-Id: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQ5xWkC/53NQQ6CMBCF4auQWTumHUWoK+9hWJR2kC5socVGQ
 7i7lSO4/CaT96+QODpOcK1WiJxdcsEX0KECM2r/YHS2GEhQLRohUVuL6TVNIS44hIhzLZKXJBp
 C7W3heacun8qQUnyxrbRQ9qbIg3vvrXtXPLq0hPjZ01n+rv9UskSB5tQ2vR4Utaa/OZ/ZL2yOJ
 jyh27btC9kKL0nlAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774532898; l=2270;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=fkANkZGrlPyyPf87t+LAjl2jdK/qL0Ex3c77JETrFyE=;
 b=QKSSsi0U06Lyy2yupRpEXwso8Uj+nschuIGsT4CNzi11AkUy2lp8bG+pGv4Ri32gd0ouUv0jX
 8gIek8OSF38BfYKUdxawPHq0WDE2bLCPkOmfkQ8TOCGJ+WO9gTqygKa
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The Q54SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q54SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q54SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

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

 .../devicetree/bindings/trivial-devices.yaml       |  4 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 97 +++++++++++++++-------
 2 files changed, 72 insertions(+), 29 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

