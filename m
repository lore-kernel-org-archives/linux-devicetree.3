Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724548;
	b=gwwQAUHWViVk0OqzT7MxNM8rs8m6jpayf7mIvUaCTbJ/Mcbz+YptNouKSY8l+OLf32dR
	 1xL40uD2dw8uSWzLICClC+PTutq4OWCzcekI5cvHuewelxh0mZE9fLJgHXWh6YEQcH9jQ
	 xDyhelYpi8nfU/q/3XAiazteZVJoFuwvQxhrzgAq3kJfP2078PQI38pY6xOlh+YVI/n4u
	 XbWUdfyiElihTEyqonlh563BC5haCrK2xaMM3IiwpsrtE9p7vnks2i22F8SlaNJX0cg+M
	 xUG/qD1uDPG2CCxxPHBIEwDtGsBOVe9gpy33vKhPYEg/enUGvKeaVTPIyOoEyNDR+Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K8vXOpYPJvLf306yumbguV5Cmb3JESdYMT0CcHfak1I=;
	b=heE1hJPIet9X6YcF3MLAkDmRdVGL9DLN3T9S7XGNbcTNyI0i7WEg3Na2deXr3SidRDrl
	 5DJLvuY208TW8Z32ZMvAQJ52xg9+xs17K9fQB0yFUxqf7jqcv+cotDiytMNSHiHWqDG6L
	 l1afy9PFi/mTDPoPdyz+4hCwkcNUS6nNrc+tyMxcd/OXpdQD/xNhdIhyGjhZ9xs2opY/G
	 GqnUZPj3W3FozfRsXqFWSYKYaf4RCj4SBJmIaiI8XeVCVceWOWMLsCVDR2VEwMYfaR1Ku
	 GLlRz10vZrCReE19E1gHhNItxrRQV+hjyiSZIQTqw0h3j4h3tzoUVvsffY8xZBaZMpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hte0Q+Gb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B4606A339
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06B4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hte0Q+Gb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15628316eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724547; x=1796329347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K8vXOpYPJvLf306yumbguV5Cmb3JESdYMT0CcHfak1I=;
        b=Hte0Q+GbMa59QI6u4BQ/Q9hH8K18WTBYFPyIGfJrBmh72Khszw2FKp5dp5cglWFHt/
         BcrcN5zXWDgv2CD/zXXteq0xlqca4nTEGXqA9Xfu7wO9Qv3CJmwWvT1xC2CrdHqvuaZA
         7Nt7XCrqa5vNmy2MBP9zZgufn8/n5SMFVddaRzoAxb/S4Tlm4+v4K3zNTp05qE0tNe6r
         udFMoLNBPgGoI4yqVM8JMEdi/+Y9YqxJ7/4RpjOk2mpxHQ/19bC/hNVN+SoKRhVVYvxq
         0FMgQ15oAMmukcUTOtYt16+/xUImXhSLLTacV8NUl9LyCEB4sp/5kpaw+TF7uTkvlRCq
         cTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724547; x=1796329347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8vXOpYPJvLf306yumbguV5Cmb3JESdYMT0CcHfak1I=;
        b=T9te1Z4GNpxoBFPvfKDiKCNHFA/z3aVaesAtZnmClAAeU7gpa2z0K0NWBXiluGbXHp
         dPMvhWpx5Ao1WJOWbm8cehqn06sfuykJFhzhms3r/H78eVGnsWv+9m77ejwyAGtSiY/9
         XIbiTaw0qsQZMgOSs2q+VlwpHIasSgI7zbARRvR8kI+J6cZDay3JRhqyWZqiFj5ypwFy
         azRGPHbDI8X88pRAIO9GV6ih1iiJIKvEukvyPQ1WL7EPJZpn2BT+oR1Jp5yYyp+B6xul
         sliE3UQqMiX7MQ3I6MCbmgWc/KmH0Ih+lQgTniClsGhHlndIIUSva+sx1nQPjJZM1rF3
         +FnQ==
X-Forwarded-Encrypted: i=1; AL+hErHD94kIxpHxzlYPHHPkZ+qORq6JAvVP8rjhNQRfXa3rwsL3QwZXa/Gaf6NjTddGXR1CavEZlCXY5HhX@vger.kernel.org
X-Gm-Message-State: APuU4Z8/9HKaWT+FNi4Lu6/5nDDtWo3u0ctBJMy1tgHgNxfuEopBxVEE
	2C6QwTWQ6cTF7yrNKdCyKpt6Ye5zj2oko2UVu0QXw0DLyWCwSIuPyvak
X-Gm-Gg: AZFdTZdOyr9rtkaSU3ceLJIfRiddG3WqWJ/VmsN8Sj+N3N1NO8crxmiBn75CRy4pcyg
	Z9qTX7/4+RCQmsZCoFG6fAEYfdhgNPs1nBSSQ8LXytnRokhLYOc2b2O2bpcI1SCrHi4Ph4WsWJj
	lmEP0o15tF8i1k599hWah6ZWomJRd0Kr3yy1ZPN01H20fqS02pjpFR/vFxHx2e7V6yH+QUpDgf9
	cu4Wif98ag/0lnQQBpHzFN0ny9Ym3KuhrCa6sdiWYoQX0eJZMcFZHinYODerQS+q3vD1a6GDZOW
	gE4iZpCV4XEXXf1sRL+9HyI51b8Rmyq+dl82YXr4USvsjEBzbPm9Cq4NLrGqgoTW5W5fixLEQT9
	kK7B4mf2tJ2EXPH7q4Oc2TuuWpBJbA0VU502xVJRXRH9AkiXi5gdPtiO92L25TOZKcoDCZxJ+Kh
	fnMZipfFAarcSfR7Pizc7CmyYlIFxx/WZZtazu6YcSrCw/Egbq2lZ4AAHVbQFascPfM6bUlAMnS
	ERhXryT5cme06xQSeDoTk19ZvrU8jcZ5LWLzvveK7UkpyiCRud3duP2Fq/mXoUzwzpu0YAADnhY
	jsWJRLAz29jT7pVQf1M8vzr2OVLzf/boqhUGPA1+tNRlXKk2
X-Received: by 2002:a05:7301:550e:b0:386:e952:3455 with SMTP id 5a478bee46e88-386e952358cmr895091eec.34.1795724546785;
        Thu, 26 Nov 2026 12:22:26 -0800 (PST)
Received: from mrprachoday.bbrouter ([2402:a00:402:9f97:e752:d178:849f:9d04])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm73987372eec.24.2026.11.26.12.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:22:26 -0800 (PST)
From: Prachoday Sutar <prachodaysutar7@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pali@kernel.org,
	afd@ti.com
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prachoday Sutar <prachodaysutar7@gmail.com>
Subject: [PATCH v2 0/2] Add TI BQ27Z558 fuel gauge support
Date: Fri, 27 Nov 2026 01:49:57 +0530
Message-ID: <20261126201959.28743-1-prachodaysutar7@gmail.com>
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

The TI BQ27Z558 is a single-cell fuel gauge documented in the same
Technical Reference Manual as the BQ27Z561-R2 (SLUUC54) and is register
compatible with the BQ27Z561.

Patch 1 adds the compatible to the binding with "ti,bq27z561" as the
fallback. Patch 2 adds a matching I2C device ID so the driver probes
correctly when the client is named after the first compatible.

Tested on a Kneron KL630-based board with a BQ27Z558, using a vendor
Linux 4.9 kernel with the equivalent bq27xxx changes and the fallback
compatible in DT. Voltage, current, capacity, status and temperature
read correctly through /sys/class/power_supply.

Changes in v2:
- Add patch 2. Binding via the fallback compatible alone left
  i2c_client_get_device_id() returning NULL in probe, causing a NULL
  pointer dereference (reported by the Sashiko AI review).
- Patch 1: drop the claim from the commit message that no driver
  changes are needed.

Link to v1: https://lore.kernel.org/r/20261126191906.25708-1-prachodaysutar7@gmail.com

Prachoday Sutar (2):
  dt-bindings: power: supply: bq27xxx: Add BQ27Z558
  power: supply: bq27xxx: Add BQ27Z558 I2C device ID

 .../bindings/power/supply/bq27xxx.yaml        | 72 ++++++++++---------
 drivers/power/supply/bq27xxx_battery_i2c.c    |  1 +
 2 files changed, 39 insertions(+), 34 deletions(-)

-- 
2.53.0

