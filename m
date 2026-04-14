Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC66C301471
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149931; cv=none; b=Sba7x+mItvStXfIldfauYMgvMZL1aCRQUZ1wQXtZv4sCKL6nIiagjfpGpLxH+Xgx6k7QD//g36dVJVdOzuGZwnM2Pln9MFroTlR8AWHMEqhrBobr5Ol6pUqkKD/aWSSmWgCeOFAUhbzx7gvCegsq8rNF8TjYvI5JT4fdkUHT0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149931; c=relaxed/simple;
	bh=JZKPGPIzQ1N7Z04TBth/ejt8iusUUpviQAq/IA+54HI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=neCZLOJDQrR7fq/NcGz0ByHoCjXcOUbLgfMFs6WQs1atqRWVtANwJQl+IPJJgODBBG7EtNznTBC/7WOHzb3f2nlmIeCPLAsdnnKXAvOI9YHD3SAOS/0mskbLhqIgLeRKXrVbnPuRHVDucGPpVQnfE55+kmtoJmdphHmoz18VyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=BZY2dhWr; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="BZY2dhWr"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso4542211a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 23:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776149928; x=1776754728; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNlxSzzZ1kkLS2ZGUkJtOFNbb8D9S8TiaVdklSubQ0U=;
        b=BZY2dhWrkDtGJXTFrfvPJyXwfjbERKxEZpHt0UKJCIQglpbunGFYq/r9aeRWUhSsJh
         +bBQLtf1IvelerZDVMoDTGjlRiAc6UmPQLkXDdX+XG2C1naPd+MXgSpqDPUseozFEVgi
         SwMg9eZjhCzkWQGCSROKtXvfgSC/oKtqZUsIJrKTPMr5AwCyJxNZBFK7BWZ2p1hk8DSX
         ZcigW1Fj6VZWR4oymNmurnZ/PhVEDexRD0Wh5zmeMK/wKcum3QCsG68TyT6rDo+nlKlu
         DEbo8sSxcxoii1KCfGFFmCnl0YBxK+MLQb7E4zBDRvd6FQXVaIABcf1j74Jk3duRHwjj
         nUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149928; x=1776754728;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNlxSzzZ1kkLS2ZGUkJtOFNbb8D9S8TiaVdklSubQ0U=;
        b=JKRZeth2wfTEuOXR0VHa6oSl50zaEdqmO92fgxcOUcXyuDLl4cKFZCtk9qgohT7Cri
         P9j0nkwcwK4BSThZ2XgzEQY+xXej4OXeIXWjZSajDupYyKicOn+i82o23GRKcE3hxvXY
         u2gBm6YJ5j8Ji7BIfePvTx9RQ6s8euqO1t6YL7HgQllII7+0Gg/iZgu5Ls+Ru73d9Koh
         MIrZDI+XwHtd+jOJ1ebAN88NOEOlTmWrzXikVJCKUx7tJ2ZANWD6Wm2AKeYRvlyYm5cv
         nGlNJ3v6pj6USufrb0AqzR+Z9sB+2DnXXABpg9m4wg+CwOZaSWznRbgYNiOfJlE+ExlP
         Z5rA==
X-Gm-Message-State: AOJu0Yy/Ipp9GfZX4ZOyWjpB/DHP2s7c4Mw7WcAFSUWAwO0fHiC5Zbo4
	Z/mI6K5MDBhyv+O5D+2kVxP8dHJZsOguZ7qQHvqwKROb3UsZbGqBGxHpUvL3yAUJojE=
X-Gm-Gg: AeBDietlyFMiIIcwZYG99rKzzoJ9DBVJ2f5fxYiclEDbQILhlWehnYFVCcQSlm22dvE
	xGtYz6kK/oUDJKY1WOGhvqJGHOMlZj8XKobsqcVm/oTIqwlxWrnZcbpLzYCC/zxn+FG5NWN42cG
	k2vj8W5qoK3OO4TCOTnaTclIX2b/PSxTK8m8XZe4mSQ9MkZ2Py8lOis3bU2PAKqxfqGM1Y5aWvN
	MKCO68GBNG0F2Ojo21M19owl+606IAunbI3hOsefVfX8zNF43BczfZ0344RpYhS6EwY01fspCQd
	IBsrhSO2im1Lh0i4NUfjojuhi9jh37QPUSCSKdFqEf9RQG5a6Llr56YZ0kXRXE/aDu2zyjI+6ef
	uiijiE69BRGwq9e/4cpnrbDuqkNm0u5ZC1hYFAwlkZRTJBZswq0CIm4jcl/cG4gffdkM6J6UkS8
	c1Nr4yIE/fY+SZDcKADQWF07CPm4crV93BLiyIn20Q6WETV1ni1KRK2umaqWy3Q7z5cA==
X-Received: by 2002:a17:90b:38ca:b0:35d:93ff:2855 with SMTP id 98e67ed59e1d1-35e42763a73mr16563622a91.8.1776149928030;
        Mon, 13 Apr 2026 23:58:48 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6eac8ddsm1019714a91.8.2026.04.13.23.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:58:47 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v4 0/2] Add support for q50sn12072 and q54sn120a1
Date: Tue, 14 Apr 2026 06:58:41 +0000
Message-Id: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHl3WkC/53NQW7DIBCF4atErEMEg81AV71H1QWGccMi4IKLW
 kW+e4mlKlLVTbr8R6PvXVmlEqmyp8OVFWqxxpx6DMcD82eX3ojH0JuBgFGgkNyFwOvHsuSy8jk
 X/j6KmiQIBO5S6Dns6fqn9WAt6WBkYN1bCs3xc996ee19jnXN5WufbvJ2/c9Kk1xwrwxObrZg/
 PQcU6O0kj/5fGG3oQY/uBYK9CM4dBxx8ohEwaP+A1d3fBDwCK46rtGN0gxk1WR+4du2fQP09+n
 InwEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776149925; l=2931;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=JZKPGPIzQ1N7Z04TBth/ejt8iusUUpviQAq/IA+54HI=;
 b=0pcZ9rrpD2/0wvggqmtcmo7abeKfmWbowD1udZKVAFk4ewqvA3Z5ohwV1iyREC7AFItdogMbI
 XMQeG+1VjqUB6uZRe/5xqsHcxYIwfzDytA2bEQo+soJKAaXSkAWNdLF
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

Changes in v4:
- Add null terminator to prevent comparison of uninitialized data which
takes place when ret is shorter than strlen(mid->name)
- Link to v3: https://lore.kernel.org/r/20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com

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
 drivers/hwmon/pmbus/q54sj108a2.c                   | 105 ++++++++++++++-------
 2 files changed, 76 insertions(+), 33 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

