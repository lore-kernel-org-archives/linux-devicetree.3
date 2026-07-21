Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307183B3C05
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627992; cv=none; b=RxbnEc0nFbxXXCe1h80tSMtTKnGBBDCKCuMK6fQOlO/HX4RRylcyRUlKCFOY8tPJDMYRbPMqcDsdidg8np6gFGuzXfBS2vnVZlXe0TN2Q1HykkIzcKlAqMWcledfqGsn049Q3odQ3FdyJl4EoXBy4vu7dqeunnqcdKVqNWnmhYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627992; c=relaxed/simple;
	bh=AubZwRsDaLot5csF7dYq/1KvYpUc5OiagEGEhDhbY8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iQQBDxlqGr31ABeCM1UnGkIj1CTpem91za4AdClf6AhjFVl0IHuDp2jTuRhd2dn55K5hKYXt5BhWhnVgV3fa0WmySh1DvPuYsyqLtvQSx1o5Kc7nzgmCrUgajFLByTSS9vbh7JmnJadJFj2YklQLl76Yq/4zDDV6b2VLjrIj7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtV0JGNw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtV0JGNw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so14596545e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627988; x=1785232788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bP7FEQ7k53ebpzWmJzqXUez3bdeDukLwJkEZmOrlD0=;
        b=TtV0JGNwVLYzG9uLrxN5iw/+D/zu8WRJNwp9Ly+LXrrHNxamQKg0+xKgYn0T6dDVvq
         2WnDoA4Cshmp3Zsf1wr3V7/yfuDe57il/mqLvD/dxz+ifuj3YKinzN12i6M/XWUfM9Wy
         SD4ydFkul5kNl70+eG3DPzlJCQ2A7H5xeIU/GXT+Kmd66R2/jlZEA12RoiqNVdkJHtSW
         Hc2dO2nDThBqyA7YORfC0IhSYqXJAhRIOOMHCrp1KmzGl6xyhWrD/SS5iygL83LlGdce
         e883Sd0AWCdatR++zTePE7TrV6/ngmU+lP+pEQaUqgI633CXeNzRJAw1OudnesSyBguB
         scJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627988; x=1785232788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bP7FEQ7k53ebpzWmJzqXUez3bdeDukLwJkEZmOrlD0=;
        b=A1SJLtBR6pI2u8fu8Me4PYUBpURpxQMzh9yZ4AtvVfNns1ngvILh0bah40DFACYUE1
         rpVGyvzDOG7j44BzeHmjcfBiBfI7JhzNvQKaMjSfLg7Fsnt4Ck2fTrOkAjtXAPn2842b
         XWSkGVp/MEyksc1w/3EFcR70c8+DSN7jzb0rHgDyI/FhFfnB01i242X5U887iYhByZoq
         LMDQYPFQe04IRsrsYG/0qFTh+PSRQXZnS3MsuZZd+hhEE9mrxqo4Xsn6h3kb9Lw5OyCU
         iD3t0DrXsd7/zfp9YCPJiyIP5Xadb4ghUy9mRCm4UIKUH38UY4+FPkUEycrROdoRKgKb
         c41w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+rH+ke/VhgbIZZiJCD5emBUHgslLwUM5ggtaisAlKT/kc3iVbHiEJIJpx8q8JWfjJl8nua3Rgzv/M@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTRrso1NXHSj7JfZWUla0CsTzmFP3to3cz3d8LO3No0L0cN0m
	46AlsOCOjzFZyBsLZ5H5FTTPoJ4BOJExdmveOMhH4TDhVi7vGkDbjsoJ
X-Gm-Gg: AfdE7clA3BBt9oaJ4YHB5UQ5JprAIxpI6Ea2mtwXNpiVfxFSlvI+PloFmOZIHzqYkt1
	NA3nrgV93ym5VimMwvHOKRaizK4bayqtmFBN8m3Jce0QkPwBrWo4mc0NaDYEM6+E76HAEwnPzjW
	t6RLRdtHkS2Zx7LraZfauN0ftK2K+OxKipJGn5vbnkZ9RqCxYhwph19OT5TQ05/DYA8Grpz6dOy
	2atMtDrn5o0j2b9XlvG80uFj6B/yMMT4895ZxGn6RIs+oVUymtwujHBbNg4yRWGBsjCJuLY9dXb
	a2p8bkmc8EF9zLQh65PkqLNxHENnUOq/MHnRMaOrvTmSUvfa87QsmfJfUC21laObFdZMoleiYE2
	jNmDO4MVv/oPxurzBCzgKwqoAyj4opxx91Y9T6XFqyXkcfCfwdQ/WVAcV2YgQ/n7oGYBKMSxwf7
	9AGop1fAuD98NsuhW17+2nU0vD1PkqtG6svg==
X-Received: by 2002:a05:600c:3143:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-4954a3d0cd7mr209723365e9.2.1784627988145;
        Tue, 21 Jul 2026 02:59:48 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm35228691f8f.4.2026.07.21.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:59:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] hwmon: emc1403: Convert to use OF bindings and add regulator support
Date: Tue, 21 Jul 2026 12:59:32 +0300
Message-ID: <20260721095935.439174-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document, add OF and regulator support to EMC14XX thermal sensor family.

Schema file was separated from LM90 since according to Guenter Roeck[1]
these sensors are incompatible with LM90. Proposed schema has basic
hardware description. All registers Guenter Roeck mentioned may be added
later on, when/if driver would need to work with them. As for now driver
successfully works as is.

[1] https://lore.kernel.org/lkml/a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net/

---
Changes in v2:
- schema separated into a dedicated file
- dropped chip id check
- fixed match data casting
- adjusted regulator name

Changes in v3:
- fixed number on channels for sensors in schema
---

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 drivers/hwmon/emc1403.c                       |  23 +-
 2 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

-- 
2.53.0

