Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEAD3AE18C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743371; cv=none; b=YWR5Pg9bhOgN+xjAF+cIVp6VeoScSuQYsbvVDjrshwsGeSiGwHMYdnxB+9jlwa2pzW/Zf5+t0Lou+hHbGjPMJ3Piewl3yokYWVStdjqVWJ017XPaPfP1fk2xB0yjJDQ43oLMrbWtoUwU5QU+NBLLyXmRtwOlA5lBE9HKFzjQSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743371; c=relaxed/simple;
	bh=yHW1wsbgoNB8oOaneusOQL3QP1qAp1nDgynqeSs3TsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IoT/1mj3U+Gac8k4iTBNsVoo4V4XmPzgrTR7XcoZaFu6Gf7s8WT6/hkbREZ7JadJ+wlz44oiyzIOwg6kiHyQtWHvmWyzrZXkRS7tiVrXNX+nPsgZk1zwfHGspatwCGhpuD2C0LKHtlm7tZp7gHqaIEwnnZlSf1MrMvli1MDHG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+4tl+vZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+4tl+vZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cea3004256so32655845ad.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743369; x=1786348169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pW77Oks0DmStB3RhQ+Zqom030xkJ3DGvFIDhxb6Oa34=;
        b=c+4tl+vZ0nT9watw/Oqq+2hxYQdpegTv1dXsuQ1I+qqN/YhtdnLu3LoyEWvwcCH7gg
         wYUIfH8nm1Dh6hGUlVGNWJjehpwVvzLWTlYbkKhGKjNzS5VzcytughIOsFf4tosGWBMn
         j9IjST839KFSS5jItuK+B4pz+UjmCzmRHRMjyEfOhxYIDYbiWeJA+02KFAJFomDFqVPZ
         OGmaUQuTFgiL+0hOncd/xkGB4qVgisIWtdi8IgTo9y9HdsF5vRA4EUoOwPjJyaaL0xAA
         zVWZKQHcCMs7WRvx8qjxjzjtG2HPA2USYMdRgItSD73SQuS3cESMBs2LJb/6JlohLrOQ
         nwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743369; x=1786348169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pW77Oks0DmStB3RhQ+Zqom030xkJ3DGvFIDhxb6Oa34=;
        b=LAPLal4MKNwvD/9MKVYPN+X947N4xFnb5OanMp3RlZEcwBlFQ9blmGKqU0rWs+BtuI
         d3E1cnI3J5nYIyaHo9uuPmI+aYNnCyjGY7610WVH1IVptKg9EJRiZdgSIWDHVcbf7vCF
         h44gAMLYYINiIHidyZYypAMi3cU99ckLudyuRz1AI5xumBpG4FZ2mOdo6papXIUztSD4
         4amtbbw7ydXzoigsmng94yfWgJPONu6L99AOf35ONl2fS/bFHugjiZ6Reg0d4iIXK+Wg
         bkXFMK93ZB4nvfX5snQuc/R4IaTMfdsubsmvDEdiwWZ/RSd8lL/+CsYiYZoVHr1v3uM9
         wdmA==
X-Forwarded-Encrypted: i=1; AHgh+RqxXv/67qAqQxBUq0hlAEBmhFCmTHQPN4EmICcdUU1a/WOwX61sxVKAAdh7dhIb7u+r3/sFetv76jHq@vger.kernel.org
X-Gm-Message-State: AOJu0YyQi9DSKNIldAfcXk0TJc7uAUWxbej/wu+QxNNJ3vFm4geMhAzC
	OdqCgHHZr4nLK3sDSJx5ssJgPahYwsEDmToyPBiEQ5ylweJNtQdAMKTI
X-Gm-Gg: AR+sD11fKQlXK4A9OuSAeDRYngp90wS/9Jv4mH9l2ox3c8VN1ENutjL7uDyp1EJjsiS
	2k4NMqt12GS4ChYFcG1qSYiHH9u/LZ3JnyGy8vCOiQM3IRC7QP/QHWjAreylitnrrjWPW77tNtx
	lGEEW2RuhcykS0wLpwIwQuIaVraAJ1CBzBiWU6PjxwUS+AoQJ+u6qS7b3DYs7bfdOSg7Y+jX0/l
	i52vnaLLKn89tpXsWSulfXYkTgvslLoD6m5L+wiYZi+xvbMx+r0zW90e4mAFdHFPKHcWCvw/MOk
	ziJwrz2RyVO6RGeopndammbVi0qG/w+3PtpDgwSXaXUEhdYks7K63NkpyJVef8ZqWLdOCPspnUI
	obsNDk9C9u+MBNfJEZhLs1MIpyEFKs7XpWaTUCYcnzFP2MLFiqLCUbs8kFPtODiJPaKT8EOPWDI
	91dcW0ha6kSEJEv9XMoi/+3BQd9XLzn94a1q9J6+BnHd1/sStS2FE1as1sL9eiEByWFupblRp7i
	06/vcFzWIzWrH/wabELMdNx88aEmjLoKHZTL0YSPIpENbm0eSIjZxo8vTGW9dc=
X-Received: by 2002:a17:903:184e:b0:2d0:401c:2ebb with SMTP id d9443c01a7336-2d0521e93a3mr93702125ad.4.1785743368712;
        Mon, 03 Aug 2026 00:49:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120f2fsm33679845ad.64.2026.08.03.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:49:27 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 0/2] spi: ma35d1-qspi: Enable GPIO chip-select support
Date: Mon,  3 Aug 2026 15:49:11 +0800
Message-Id: <20260803074913.1656675-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver currently supports only the controller's two
native chip selects.

This series enables GPIO descriptor-based chip-select handling in the
driver and updates the binding so that num-cs can describe the total
number of native and GPIO chip selects.

Patch 1 removes the native hardware limit from the binding's num-cs
property.

Patch 2 enables GPIO chip selects in the driver while retaining the
hardware limit of two native chip selects.

Changes in v3:

* Split the binding and driver changes into a two-patch series.
* Allow num-cs to exceed the two native chip selects when GPIO chip
  selects are present.
* Remove the driver's upper limit of two from num-cs.
* Rename the native chip-select limit for clarity.
* Reject out-of-range native chip-select indices in the setup callback.
* Retain active-high support for GPIO chip selects only.

Changes in v2:

* Enable GPIO descriptor-based chip-select handling in the driver
  instead of disallowing cs-gpios in the binding.
* Set the maximum number of native chip selects to two.
* Reject active-high polarity only for native chip selects.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Allow additional GPIO chip
    selects
  spi: ma35d1-qspi: Enable GPIO chip selects

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  1 -
 drivers/spi/spi-ma35d1-qspi.c                 | 32 ++++++++++++++++---
 2 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.25.1

