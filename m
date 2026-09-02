Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3846D2C0
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346000; cv=none; b=NAQG+pJ+xaPXGNHP5Cs5thZwFO+x+lUdvogcAEh3H/8mTehiv7JxyYpyfhbBnqr+V3EwQRZvCfVy7ENN6ZxJfYi7mJRXt6gGFcu/w4BJF483p4YfEZRa5MQgyEDI4C2D/YTYCs3pykFU4O5H04FrS9/5bEzCrNqxiZn35wLqBfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346000; c=relaxed/simple;
	bh=t7So/hJpcinLCb+BvLi0qm1Y6xxkkDWkVdkrkM+CkcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFLJb1Ho5P1Mwww5g8f1weg6B0QmdhI2kRUSq7tD5jOVLjD6K/wdOZ50u3mq6SKWk1rUs/V6y3mxscfqS9H76Vt3zMe86GDbcgbAE8/oyD5GDFYNlstgsbVKe4IjKyM9Y5HfPdLjfgIbTZ/BaWqs1ieIEWnIPb98z1+9gayIx74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=gNitublT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="gNitublT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso8414495e9.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788345984; x=1788950784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/zkz19mYdkeVUXbqG+wllW7/Eig24aofKrfzLu9lWI=;
        b=gNitublTOxiAxNv4217Llmd6q6deaO75rEw4FF0muK8vVkQVpVytek6JLoI460uvZQ
         vS6HY1z2+1QW/2V/nPJjOUOooptiDjiHGXMGeK1o6b/rAgVoJrwybenTGA8ENgDWfrq2
         ULO8oDdl2ypqjeVXK5Ur9csLboK623fM/mwb2Qou2jpjPYIpHCahXVn01bN5z4eMfERl
         Da2DLu8PcjZJMAsO3Ore85XxgarsQFPM53p/xqCDK0sYRQ8RxgNpb8Xw2H+heu+67nRL
         EjMlT7pGxS387WTAsFSF+miYwjz5PcsCExp8ScUNYhQZMavhDpo6fH2tdJi5YlEX9vN9
         02Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345984; x=1788950784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/zkz19mYdkeVUXbqG+wllW7/Eig24aofKrfzLu9lWI=;
        b=s17neNT2Ro4yPtoTJyuJCtj9/EdN8sAnAQfWD8TZBy+BvoIc5fqvoTXwyeRrVL7OJp
         q1j8igKuJ1ANpfYY1wJc+8PAd6yKaTvNU0vv25vtqe14+0ThNZGTNVehwZki4Nf5Hits
         aslkkPCRPiB8gWKqY9k8AA4YKke3cuAcZgS2MpfsNBCFbspmICapCoR4FU8X0pYJOSv8
         XN+sS+QDY5wzGEo2IEZrifegbmSHGweVWjTrU/kbILbcYd6bjQVx5DThLCr2AW0rsuSb
         IE9DbroAG/ApsnPLQQ9Kvl8CYPyGC1vQPgmUsuJaKR/MQUK0OA6kE38YSYn53CBrH4NF
         hQwg==
X-Forwarded-Encrypted: i=1; AHgh+Ror0HOnR8Ex/oaKZYMW+isDWMx1raUv5wQxab/fSu/Xl2flxfNeWQvOCUo79p7iq8AB/RF85i7uPWEd@vger.kernel.org
X-Gm-Message-State: AFuF++nxuxCpp+P6dLQPK/c8HJDXZnoRUwn6iYhm7a6M1ukKVo1DBgEd
	pcXOC3vctNPhi1ztx3eYU56d3/WGLvY9QPLVFbVOehMTYz3s0gLcQF7WRKhAvL31S0g=
X-Gm-Gg: AR+sD12whQFygW+aaZy78/wOsUBVsKytctpcLsyFQq6gtaWkeioIA2aa4mNSyKirWxp
	wF48OaUjHzrcaTnJcHIxM/7L3iNOiUh7ri2pAj7j9xK3NfiJ5XGh2ajm6qrMjclE/A3x+g653Hi
	/mvRLVHBRqMB5eev5nu4N0HhHy4aa7oOvkhQMBQ16khtXmVUCU1DFy+V4EctWDNrU0O0TKpcVgO
	EeOedKymlLXkB7ukv+aUZ3vD+xeCHVihvDLELNOckp5FXanekOxJyyDM7vyaViokGNr1VbJo6Cf
	2tVVgVZ1LGHvxTu+EBTUXuWW1kZmfcssLmUzNC7YCbP54ghsjvBqW2BSUgRrScXM88ugiaCyV1t
	AS57F6rlJuMxXiPeKIIVpyjtthh2CKoNaFlCt2gJHV6a+Iw945zLnXMo2onarDVbmvcNxVut2eC
	hNcuOIZvGL79Pe+9s74nXrJ3oPQyktkZm2OBshHunbNzhcej5wMnHB7OD780LcEp4HPj+Yk2hHl
	wQ+pQdz9PIPtC6V+SBHz0o=
X-Received: by 2002:a05:600c:8718:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49ce7c03f46mr34819935e9.3.1788345983519;
        Wed, 02 Sep 2026 03:46:23 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm20127665e9.3.2026.09.02.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:46:22 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	devicetree@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 0/2] arm: sunplus: add SP7021 LTPP3G2 board support
Date: Wed,  2 Sep 2026 12:45:43 +0200
Message-ID: <20260902104545.67794-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the Tibbo LTPP3G2 board, which
is based on the Sunplus SP7021 SoC (quad-core ARM Cortex-A7).

Patch 1 adds peripheral device nodes to the SP7021 SoC DTSI for
peripherals whose drivers are already upstream: PWM, watchdog, eMMC,
and the L2SW Ethernet switch.

Patch 2 adds a DTS for the LTPP3G2 board itself, enabling those
peripherals and configuring the board-specific pinmux and Ethernet
topology. It also updates the defconfig to enable the relevant drivers.

Tested on the Tibbo LTPP3G2 board with linux-next 20260901.

Andrew Gaylard (2):
  arm: dts: sunplus: add peripheral device nodes to sp7021.dtsi
  arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig

 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 301 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  48 +++
 arch/arm/configs/sp7021_defconfig             |  30 ++
 4 files changed, 381 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0

