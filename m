Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65841D23A
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695298; cv=none; b=rbz3ZZ3YcBeBGFHnjpnM7B56jpLHAxp7NJFICXG0aHhviBzqpJE+YQ/kES/w6vkkPzV+3tjwhwb0m4xLly/pmFK7OcoByZFHZbNDQGu8DQEySqL1iLxIORl0HcX7ohFLeqRY/hF+shNFpDRrCFdcyuCI3xqFatGOy81KEOzyKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695298; c=relaxed/simple;
	bh=kEwHUAh9ewS3dJDyKb1n4yEAHcPYrkol6ClYvFyrCOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=QBZC4/I3hKozXIXxc+AhBtGza9HUu2daFuzH7HfGJxNgEuKt+/9CbDlWqFO4kke/9coRIt5SFq76WFkdzSFS+uH0veA9y6GcV5AZNhSxPozPrB67aHt71tY2meiVKdA3QSnLP4DCei3JEZ3HnHyodfp6z6x7hXtShOdmUcFkE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loMxWZ5c; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loMxWZ5c"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca7d1dc4554so215666a12.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786695292; x=1787300092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4ghwLD+QfPnlvCNwm0Xh6QvcMbP7hR78uAWqfejPRY=;
        b=loMxWZ5cd77gkDxeJIOKjFjSnadZslfPmOjlR8fGd3s61UO5egBUw1x7kUOti+YcLY
         h6FmmFUj9A1CMnttjFuAVj0o9d2+ZIZ0s/toYLGch/+TtOqCpeh4HdIOZDcTGQdsyy83
         G/SKiCFgAA69e0OURZUgEzxzQ1bKlVy4DPPrVL1drHbGKD5iSEy0JTNxd0i9xgpqmITX
         uM3Sv0FIGV1l8cu7Or2braGOTNTwVVR9glPVR88iYkAfOqA3sU5bMSeXZcN/TrE6iJzV
         kU/m2jdQeQ3ugkEuD6vyH2v0BV9H5iZfSwsu/CXxvc4baXVLTsE73S5HzBDY4cFCJgSB
         qc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695292; x=1787300092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L4ghwLD+QfPnlvCNwm0Xh6QvcMbP7hR78uAWqfejPRY=;
        b=rJwdYnjw2IYeb3rsDq95L9kPdQkPp4Ffdze4vUC/T01HbBxMWDz4QeHnQEKaeUKXca
         gRt5KoGTu3NFDftIc7a5lGAjFJDwjV+9ACRE4rOYEinwhnFAI6sGkgUg0+dmGMogU5lv
         bSNOxK6wcPysNbEAICdND7/p7TnXpBofDCLVHT4YiTTKPNUwMCbYyNenL93yf4yW2xOR
         OugWYqdw7vQsB0a9ROHsAgtwJhv/6Djb9yAqce6LfZFun8p5WsrgC9SSlV+rmsey6X0n
         y4D28ejV8DNn8KUm+9EaQxn2ihbMjj7JcK4OdYgWxOz1lyMt+cDkP29+l2v7fEDFDLyb
         7PrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJl+6hjkxd1taXQGHyd2Gn5P4mSNvMVHSK1HczChr5E4G7arRJQLbTNmYSop1zsXYizgB9zBEvWwrt@vger.kernel.org
X-Gm-Message-State: AOJu0YzOF/xJUotDVNxoS20dWFxmhbegkDQIJyy3zB+S0RluHw8fjlVP
	XxYzf2QScb/5eOKSR7Z1v/hInGEfufkyA7aRtJ8Gf0udWJ1Dmc4aj2JwYZsVkn45fFYIbg==
X-Gm-Gg: AR+sD12RRAn8ejQdiJMQE/I9CU2x7d82Ak2Ja3NviTl9MNt2+k5yd3k3N1KgOijkEGX
	NnsXCD7x1nNFgVnkW92bvUSbyJqXlDWdNWWKCc7S/UE/WoVd6gYNjEd/eUspFpSOIB3iyQZn20L
	1+909H//mWY8rbaxPtqWybYDkSajiDOD6WdKyCJO7grGc90Rk0UICLq0lF6VbEjlzTPQEoTw9W4
	QQqqRHdoj3+pxflvSdjbr9qjsSSPRlEuDIWTtSbKn3Qsie7hQF9SuVE1w0umad1YmhqApLQQObc
	g3MCips3UBm7A2qArThcB+KeQDSucpbGw4Fo1w/ZYAogFg02VDDtJUQZXbkJ9lKS42QMGIONHyv
	MdI7WTIyfVgF5Y3rqccGa3gAdApk88kv54H/lOXJsgi28wbM+y18UaoYVgs0L/tqYyJREJa81sd
	oPytpbubzZeBX0xFHcX3zaoAvHp0WgMcVYXC3peHguQzC7O074/DxM7WlEfQaWZhiZfWigqmzm/
	H3HAw==
X-Received: by 2002:a05:6a00:929b:b0:847:9745:2f8f with SMTP id d2e1a72fcca58-84fde20af67mr3537676b3a.18.1786695292078;
        Fri, 14 Aug 2026 01:14:52 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb39esm149986b3a.4.2026.08.14.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:14:51 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] of: reserved_mem: fix a few reserved memory issues
Date: Fri, 14 Aug 2026 16:14:40 +0800
Message-ID: <20260814081443.1061046-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

This series fixes a few issues in the reserved-memory handling:

1. A region whose early reservation failed was still counted and
   initialized by the late scan, handing unprotected memory to a
   device. (patch 1)

2. A statically placed region overlapping an existing reservation was
   accepted, so the overlap could be used by two regions concurrently
   and freed on init failure. (patch 2)

3. A dynamically allocated no-map region was never returned to the
   buddy allocator when its driver init failed: only
   memblock_clear_nomap() was called, leaving the entry in
   memblock.reserved. (patch 3)

Sashiko reported the original issue in [1].

This is sent for review now; given the v7.2 release is closing, there
is no expectation to merge it this cycle.

[1] https://lore.kernel.org/all/20260806100605.2C2C01F000E9@smtp.kernel.org/

Wandun Chen (3):
  of: reserved_mem: skip init for regions whose early reservation failed
  of: reserved_mem: reject statically placed regions overlapping
    existing reservations
  of: reserved_mem: release dynamically allocated no-map region on init
    failure

 drivers/of/of_reserved_mem.c | 69 ++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 14 deletions(-)

-- 
2.43.0

