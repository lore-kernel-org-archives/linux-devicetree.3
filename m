Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A641324C
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378786; cv=none; b=lS44PVwyjgCRK/tw1pBojUoZ7NtEih2m6SRnx1xNBfUxHLRWDxGt0ztVEzKwt5XyW5IvA0U4KmXo+6muUxbDjVFHqafUioOPgOfYgUQ88jVZ7wc/G1del8oFvK6mV9QgwrRsIupdph31Oiaks1LOdcPE4GXJN548UgFYXmojsdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378786; c=relaxed/simple;
	bh=qMPsGKiP1/3BxOxfOQ2894idq7MNjZh2VUDwYbD89Ac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PdzdJ17kZprmnAqefQsK8HK5k3LqsfDBK81l3QiNRoftDCvrSiXjnijJfzU9WjhKYGiLxRNfarKAKXS57+K9zy9xBWf7VPUqRNZqZx6TJiWcPtZ4qtY0MZ6B107T9rESpXxijMovXBv7X1n86JWw7v6mBQTCDoz5TL/HiR2AfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=P/V9GYMa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="P/V9GYMa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso7844112b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777378778; x=1777983578; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frMIZCIhOVYR65BCOqomQnYfaoTkq4t4Fqtd6/zq0j0=;
        b=P/V9GYMavQX18tTET6d6FkIXQLcYBlxDOLTIymp27PLBJ/Jc06zyq9Bdm2n7Xo4nCq
         /ghqlFE6J2RlEcPlrEAiZm81eXoliAQM0Q88sJ7Oj2G2lPmiYuroue5eeLcNHNOnctxW
         axjJwcspgpfi1XMd15qEuOSAroUF1n2Nv1lxC5NowFik423guUt6u6vsAKWevd+AdrSe
         CXF2PlpyeUVr+CBaSHGKjcY3ODf6C2AZv7wrU3knd//Uvwcxu9F2qidWc4gvzk8vVYZp
         8kj6ak9GxWXQhAiaNLdlcuIE8VN3RveCt07qVcZonkyU7TKm5JYDTjlJQH5Q5gZpcb2H
         dkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378778; x=1777983578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frMIZCIhOVYR65BCOqomQnYfaoTkq4t4Fqtd6/zq0j0=;
        b=enjXMiZqaFSN6JxPCRQh/u+pd5Eii91MYmjMyg2+oRrvM1Kl1A461hfLLQrNELbCOZ
         KWXu9VftYuznTc1F7E1kNFtlYxbFRSfVJjmoc+K3ihqnHVuLeS9TBa40xMNNGGjQQpvG
         JWE141VHY/A/osgoslTDK9wf0f9LYO1UGN8HMRTLn2omEnUugEYZvSCju5J7ds1upKpK
         U6Zbj2vixCVjXaptl5rC9QlqO/vILd2TAqa7sBA7Wd77UxUonl4Irn+tta54hiXxsFD5
         LnPdxVw+oLVScuMilZtiBhH4Y/0TRS3qmXOwugG//3cIkOn8YpPwhyM2gTDou7oY5bPm
         YTUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iafg/wjeHLppYfZsj2FRdli5AsmIkWurMmn2kq/HRU7sLP1kO5/v3YNyYxjEGNPqSj1qSCaXKdzpb@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqkPrcs54lRCNrxVk1LihYZH+Fw2D3rf6XmECOy7SK1+9xm24
	NCrB5VzNa32l6UVAfhdFZQ7EUQj9EH/fGqk9vIxmun+VnFTfSlETwjixDvaX2byVMBE=
X-Gm-Gg: AeBDievDeNw8t1Qw48e8x87d+o2jOxm2hBFQObSiNBQ5j4mZFpAsHb3bprkgqQ8gFEf
	NUsbkBEOLX2jg86kNXD9+R0uxsqvgFh02IVZLSUlE6499471IalJNDjuv2/VJNBkJaIXJE+h3kJ
	oV0eKxFAhK2TXwgpsf2cN1VMLWnCeK9qbNaPj67wetWI4gE6Opw6wfVGBvcr2bBeqIgQ0LKB4jp
	VDCy5yxnKVrjK/qcBODfUb/DVP9Dml6QDi9gXH4DXLlc71rGsUc91RZdsRlfwp88eypgZUGEGUW
	S0u+So4GBFpY9Irrqmv0txJ5j7fUEwCHmOj2BkJs8tlRV8cctOZQDVwCnQu7w/U2jD+nKW6PZOm
	APdXBTpIXs55pyUIGcuVf554WxjpNcRABudaglg0mOVNEmXuG0ktwMAgrRkQH6M5ATyBabmg3X7
	yFUm0S2Ejo/Nc5Ee5OteOo+rDoKsiCBmhyVRgbMRf7
X-Received: by 2002:a05:6a00:3686:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-834dd913b2emr2965836b3a.0.1777378777797;
        Tue, 28 Apr 2026 05:19:37 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf5705fsm3254587b3a.42.2026.04.28.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:19:37 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v2 0/2] Add support for LX1308
Date: Tue, 28 Apr 2026 12:19:27 +0000
Message-Id: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+l8GkC/22NQQ6CMBBFr0Jm7Zh2gAZceQ/DosAgTbRtWmwwh
 LtbiUuX7yX//Q0iB8MRLsUGgZOJxtkMdCpgmLW9M5oxM5AgJSpZox5HjC/vXVjwscpSNChVrSs
 SSveqhTz0gSezHtFbl3k2cXHhfXwk+bW/HNG/XJIosO2bkmiqaq35amxiu/BwHtwTun3fP8AxY
 ci3AAAA
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777378774; l=1741;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=qMPsGKiP1/3BxOxfOQ2894idq7MNjZh2VUDwYbD89Ac=;
 b=sHVziZqGCDAKtI4ZWL5Twa/Bb+yAp9az43in8xGZnkYxKfnqkYI2ShDthPW9Wfy+luRnADqL3
 Lr6+Gq3JMM5DQg6uGPop5/MenIXWUlZDMdxGX8MCQUEa6CD7jBZVAfa
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The LX1308 is a high-efficiency, non-isolated power module. The module
operates from a 40V to 60V DC primary bus and a 12V regulated output
voltage. It can deliver up to 860W continuous and 1300W in transient.
The built-in digital controller can store and restore module
configurations. The fault status, input voltage, output voltage, output
current, and temperature are monitored via the PMBus interface.

Add support for this driver.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
Changes in v2:
- Remove the unused compatibles of mechanical variants
- Drop the existing pmbus binding in v1, and move lx1308 to trivial binding
- Reorganize the id tables to be placed to each other
- Reorder lx1308 with alphabetical ordering in Kconfig and Makefile
- Fix undefined behavior left-shifting of a negative integer
- Link to v1: https://lore.kernel.org/r/20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com

---
Brian Chiang (2):
      dt-bindings: trivial: Add LX1308 support
      hwmon: (pmbus/lx1308) Add support for LX1308

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/lx1308.rst                     |  90 +++++++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lx1308.c                       | 204 +++++++++++++++++++++
 7 files changed, 310 insertions(+)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260415-add-support-lx1308-165a4206ab69

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

