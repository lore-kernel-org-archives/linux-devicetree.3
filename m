Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F763F789A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831914; cv=none; b=srtqHDQQ2nqRBGK5xy7aSFnBROslIa4WrAsuj5FSkegR8E33ccDLPH9zsN+MGet66YwdSLC2gWaB/UhxnLxRKHzuN1Js3PLUnqY8Y7Wp8mprC236Otmcdz92YgrxAZNx2jWu6p/DdlZj5ziz70QFHy6e10mRCjgjDLMZkg8kY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831914; c=relaxed/simple;
	bh=yvG+iUy2BtpefsQwnJB6MqnqmyYSKf2CEqQs6d1zWOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLhWfVrmzcP2MMNl3HhF2LYcilh/cVQs5D27oYaeljnU1OLNftERWYXjM+OIBUF1rxdiy9kgRTWQniN8RsxJikprdjixg2zqt+TMpYVcQV/ymT9IPgAjVOlys7YrN+G7YeU5ie+me3ijuKvuKj2wBHtQ5dp15stw7/oSKceq9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNs6uhDU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNs6uhDU"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3664df32e91so7751803a91.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778831912; x=1779436712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbBbu3VFnkPkbAFgdz3fGXOyT9/Bu+8ThEz8Gs0MIMM=;
        b=nNs6uhDUd8KZ3DNSjSRXwDneSX4yaldSuYpM3MFItiFkEsI3fzlIB0BIeNMy/oetWG
         e0viRgtJRS8tW4GpPWX3ZEcdPYBBklLK00FiCgCZzfPaGOT3b0iNwLM23b0kVH9EJLPW
         ifB3LoDZllnuQGYIc5Wc2/TG/MGVBBAwMWxIdYa0L66SNh6Hvj/0gCHwGQy9q2xsgUVs
         THv1XS0MvDooxFdf92nh8WJpIpLX1DKwIDpiSqI15MuRXFWv6g6lY4eDplmfV9AZRbr9
         1rnLAmTtMgsNl+CvLv0aiQZAaJFGuRB5ABUxvKdZ+1nXBhkPKMRyhMOcQlkAzvkt36n6
         OJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831912; x=1779436712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NbBbu3VFnkPkbAFgdz3fGXOyT9/Bu+8ThEz8Gs0MIMM=;
        b=C5ksGgtJ3H/QO3lOopihlR+fp4CChqbuCNil4qlJtz9Snj0TPac0Ymi3EEaudPw3C5
         rLuF3E0ifQmMe7QOxL1ZEnIi+mWr21KUAcMDQksFzUhkt8DF3arfqpHUV5efec4rmxJR
         kiW5QAj6ttEGMuF8cu3Q96zKPIOP1hXB1EZq//9aZfOhjQ+89ag+8fBrqoz57s4rwctt
         Vitfa29SdP6f85Kelp45LwLOJoWvPhyjQHjTA2rqkY9zAP5Ci6bVVEWQ4ztZDpgUWZgm
         IpwvCMtUBzcCwCbTz0OAaxJj7z8Vg2RW/jJSSqMaKPmkLzIx5GEfm7qyNVVJYnV7JZha
         gJIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8J+kvEWSgzMUkv6T4KribTr+CVgLu9+0Cz569nIFVpTLWyPDXv4NufTfIVHTsXhXZHFangtGfb8WUI@vger.kernel.org
X-Gm-Message-State: AOJu0YyVBLVy0y2+CKJQw0Vlt70+j06mDL+METQWCsn4Omnxz6DTuxi+
	S16t+RaUy5KVqGXyq9U8DA5KqtRWAqvhGhQXDJG4UG07rRNQ6k2QB6qm
X-Gm-Gg: Acq92OGxfpWYcuPFAcguLsfoEpkjAE1Y1OwiGWNeFT4/KS7jDx01XzcJL5eT0Hw+/ek
	+v7+34bU4FxjW0VpQsvkYcGIaiyUdniixOxWnZKjtjbCOSKNhQPov5radwsqKXlpk7zpvre6vql
	CCNa1imgSsZaORghibiWMPVWpitSOqZfyDw6s1SqWMLhTpLFgaF3EAIs4cgtYzGnPo2Kd2u90/o
	4a0UzFh3GXiFFypAe7CbLyDzzvry/6K3K9qWqUvwkP+VdMMQ27M9y5Xr/wFD8u8DBRUdDgxLgGc
	173nq1fkPYl3U8ZsQb5CVsc8XYSPw07NamJW3Wa9rVfrx9alqOtUdmMrYTNecxySJbB5LnCvFFt
	vLfuPHNw0ZoikNw1Fojz2zzFm5y5oBPtELB7CXFOxdc452R/0gjl1Abml5MIona2KUgxIfbpGn/
	G4g4ukw1QEltFfQgwiI3dYdTzPtrtzDm3XQXiORVVwuA3TlTqGFhNLEX5EX0SAvA==
X-Received: by 2002:a17:90b:1c8d:b0:368:57db:784a with SMTP id 98e67ed59e1d1-36951c97b01mr2852096a91.22.1778831912456;
        Fri, 15 May 2026 00:58:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959c7eacesm542040a91.2.2026.05.15.00.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 00:58:31 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pramod.nexgen@gmail.com
Subject: [PATCH v4 0/3] Convert Xilinx XADC binding to YAML and related cleanups
Date: Fri, 15 May 2026 03:57:33 -0400
Message-ID: <20260515075736.172172-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510083219.70224-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Xilinx XADC device tree binding from the legacy
plain-text format to a validated YAML schema, fixes a checkpatch alignment
warning in the axis-fifo staging driver, and adds a YAML DT binding for
the Xilinx AXI-Stream FIFO IP core.

Patch 1 is v4 of the XADC binding conversion. Previous versions had the
following issues that are now addressed:
  - v3: xlnx,channels was placed in patternProperties to satisfy the
    vendor-props.yaml meta-schema; dt-schema PR#195 (merged by Rob
    Herring) now allows commas in nodenames so it correctly lives in
    properties. A companion dt-schema update is needed to add
    xlnx,channels to the vendor-props.yaml explicit object exceptions
    (similar to the existing adi,channels entry).
  - v3: reg constraints inside channel subnodes used bare minimum/maximum
    keywords which are silently ignored on array types; the description
    now documents the valid range and reg uses maxItems: 1 per cell.yaml.
  - v3: xlnx,bipolar had a redundant type: boolean alongside the $ref
    to /schemas/types.yaml#/definitions/flag; the $ref already implies
    the boolean type so type: boolean is removed.

Patches 2 and 3 are new additions to this series.

Pramod Maurya (3):
  dt-bindings: iio: adc: Convert xilinx-xadc bindings to YAML schema
  staging: axis-fifo: Fix alignment of wait_event_interruptible
    arguments
  dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO

 .../bindings/iio/adc/xilinx-xadc.txt          | 141 ------------
 .../bindings/iio/adc/xlnx,xadc.yaml           | 210 ++++++++++++++++++
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     |  93 ++++++++
 MAINTAINERS                                   |  13 ++
 drivers/staging/axis-fifo/axis-fifo.c         |   3 +-
 5 files changed, 318 insertions(+), 142 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

-- 
2.52.0

