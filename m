Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425A33D6E1
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007293; cv=none; b=urgi81s6NCm3veaidiQxt/IQBpgsenFZJuo/YGFFllbF9+MFLG61gZ9Y9KZsoyX4C31TQMTtc9J8bc7W282RiQq8UpNkISHZBhzOylZJephnfsNFsgp+SkyYGOkx/vG5JArf1TBjBWzBB17aS8gIHYhW+WkOxy4FpZzjG734CFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007293; c=relaxed/simple;
	bh=Sej/nTgAY65Fzl7deKb4qFqcN1Mfn9gf07Gf13rhXxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N72FefANmM7AuR2cRWiz9JEThNh4V8zTP1oYhw6nAtjn6B+UvCjLn2/8fl3kPYNPIjFJlBKePzBWmIGDOBYUjDshQQIFIu9OQ794BrokU2KKjFrS48taX01a4aBC1SiCEHXN8uyZaFaUuCgB9XSWtbOqiS5knhQBA5zaRM/TtrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCxzoMbA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCxzoMbA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8484f229529so376706b3a.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007292; x=1784612092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLqt9oBztUbvRv8OAQ6eZQm+Ad2L2smZE47dXioClZA=;
        b=tCxzoMbA5WoZgJVCyKgOAB/UAfyO9/cXs2sqy4kM+y6wLs/GKH5so9QiPJGXEQu1Aw
         lr+Te3HKISnSqVIgtsiJ6+EfIQ6o3dnbqygKeFLnyOER3PvDZq1kOLHhSGzN9WMtXe6x
         s60ORXH2wMf61kRswaT6ohZC4O45nsCMBV6iGC8gqOMf32Q6xlL39OzG9Uzebm+p7wdB
         yaeFWFH+8lFg3kSMUmpagTcrDCAEP4d+KSTAAc65FzD2AlzvBmQTN3hFrrYM9a/yWOBt
         QRwwkkSR59e2rGNYFBZlF8xiYEmEa9er+419D1RjXJroCDU2nfSWMeEv9B4HccHsPgpV
         8LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007292; x=1784612092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLqt9oBztUbvRv8OAQ6eZQm+Ad2L2smZE47dXioClZA=;
        b=YkBrMei4Sf47R6Gt3kj9WYLZgiRU8ZbqqGH9OV30AY9tjUSz+7QTVSqugrE7pZyZr+
         72pIHQNX57J6X81YeMZJLjIGLE889MTG3MATJocyBy/Ta+5pD3Z9cJBQ+dzVkpo3IoXc
         7Fai1iYRNfm7Gp5emwl6mr0nE/0G2RKgL0P0Wy64e3Ig/7LNCojwp6djrg8uGOnyslxH
         G0BuF59f2Yeey6umHk8y8vHsYifUpVvK7xEge87afP0pr7hZBcHZv2nZYCXl2bjzNMZo
         RZgovYcQ8HMu/jRIxmiZJi7FJyMamz15dYi1v0+LiHmXpxD4K7AnrksBw2RiZwqP/+6T
         /zzw==
X-Forwarded-Encrypted: i=1; AHgh+RqgYhbqCgBTKpDLUAjqayBrXX9phT9CePb8v0uLOu2IBWqqAfmM8Ro19/zZimya9mTqvQcKWyLGrVo/@vger.kernel.org
X-Gm-Message-State: AOJu0YzrIzKiQcPGdsaU/ixI2mxRh9VEAL1LgDx+ivI07uAtZT2aPo+/
	n8WMkpSNxsjNK2+qivgoKidBL9oM/YmTddg5iVh8/9Zz8MXlx9m779dz
X-Gm-Gg: AfdE7cl8EELrsJJVRQFz2oYyyzcgtiZ37OEe2qlacbf/WKfl98BhWRGSMftbgMs4QOn
	vmDAl/Ivc9rl6PjJ427poGblzCYrM1F9S1OTBeYY6TEJIXJMgT6Y02uQWZqe0JAXTM4tQ6LHXfs
	W9Q4yTLzOIpvGgBNddYrAjNS9XLpZbb0Mb2rjnvK//xfwiMLxcDzO6Qq380KqXjeW9KfOZ6Lkgo
	/V8WPQEDJG4MMEWlJictTOkYymRKgh7QBoRDut6h9NKdMtczB+g/IbvmOWiOyAwQCyNM2VEs5Sj
	Uphys3/l51kirV06aHUjrlhdbPpej9cbsl8WbrIK0vly3wqZ1phDhiXtEmA+o2itXlmwg61ym7V
	XasOyQ6KGZyQagtv3o6PjyBV8RvdmVGj63HTPSDz2ZNVTBZaUQMFwjXPErrCqgkoYfneAbR0Tqi
	tIOXqXDB7dr/orbCk0iPOm
X-Received: by 2002:a05:6a21:b94:b0:3c0:9c1a:8950 with SMTP id adf61e73a8af0-3c110b34e5bmr12358936637.72.1784007291897;
        Mon, 13 Jul 2026 22:34:51 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm131882715c88.14.2026.07.13.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:50 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Tue, 14 Jul 2026 11:04:37 +0530
Message-ID: <20260714053442.265587-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
  - RK3588 SoC
  - eMMC storage and microSD support
  - RK806 PMIC and multiple RK8602/RK8603 regulators
  - Real-time clock and status LED
  - UART serial console and SARADC

Note: This series is generated on top of the Vicharak Axon v8 series.

Changes since v2:
- Moved 'compatible' before 'reg' in the PMIC node to follow DT
  coding style convention.
- Verified with dtbs_check: no warnings.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3

