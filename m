Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123492;
	b=n2MsMRGTAA4UFRiZheN9YRY01nZuu0IoLzyPQVGfPNXv8Psp+E8UpP9KHZ7sdSUu2b37
	 iqlF7Bh6t/Sf+JG4SABFfcjM+UlwT70jH63UJp3KemYtebCkYlwhOySQ2fEPOGXO5LMFq
	 LqxyJHRLcMQQ84v3jsEswVwMNKc/Ia7GCVrGuOdkfgAUCla/BJUTrdOqepFA0d4LcdJLb
	 t+3QwUhsIvxn3Vgf6Iy33wVw8nEhn0s14EMg5cmkfO+HxZ0mu3RUWEq4kyUXMMclPNLzM
	 wFy9cWfWV/xxwm39H5w/xv0L/0XzahCoIBxWWQCHkInMd52aRMtJ9kOOEB7WPdqkZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123492;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
	b=3xb9KzQZSEH59XJbFbEx5UNE+ttu2OD1qvu6oP37aBVTFHrIVHuqLG+NQwWNzeJa0I2F
	 2iYjyAuUCCKBOViTA5UfaRXjrMvj2c+O4b6WPbf0GHSy/RFVHqOTdv/QgEcMtaW+Pl8qx
	 jL/C5ZPPL38wGj+rKpDbNNkzLd6xrTev3BaQVuZI/JGd4tD7Td0d/ZuEDYsrqYR+YiNnC
	 zcVEkQDh00KPw66c8w3JkGFoIqr29YnEcFkaTEtMrzwQjdMtJUNutqx6k1TZ+XqF5YFRz
	 bYLfeaHRDJTUU7Rd+adnJbNQv9wTj6Fz2JelyYy3/JLVDnSSVMcDwWNLaWlhK6umKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KnNsRIn5;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817B606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 17:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8817B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KnNsRIn5
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so117600a91.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123491; x=1793728291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=QwvH9TiCDSV07N3cQI2UyZS909k3z3gUaUen0+onQHzIaB+qOz4OfZjviFPdDVDrA/
         rQ9whUMUT12Ni38sN002PQOOFSCSWPOGKn9DEkEfEu3dnBmP2gkCuBm6voNgpUcJ5VQb
         /bJOl0b3fC8gXKdUrrQjmYLbfpOxrTRWxQ+HJBdAVzh2BgsWFqOGeiucHzjxuBnBhMVJ
         Yq/JAZBtfdBRyXcKhky2E29tAVEMRq7PApvlz/CGZ+qgGk2rI+zGZgwfNKFvfWPqbGH5
         9sPWHlzFiF/KgoJ22fvpHQqPIkR9UEPG0UV79IxzWyw+o7U0dab8d1eK50tcal93iw+k
         /RcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz41r7QQbjYbf5i7+JU0ZvvNevGzLTz/ytOWUgv1+ix57zv4Ngeo9SgQH+Qdva/yrgqqnyTtFdr0dnO@vger.kernel.org
X-Gm-Message-State: AFq9FYKQNqTUUCr2Xe+aiaTiiVgWN/7fSw0hAuPNIbLhxlSFSZM+B8Ve
	vd7G8Aox5PPsHZEXzcMNFvom+v6JrvW0lsukie/P/sEN0CybwaWiNdgrxnKQVWb9P0om6GOp6U/
	8YHkpF2MNm/Abp4nW88kpuACuxCQDwHlr+1Lw1FxC+ee/rFQb3VNrgbFbVWzZOiLj4/lVs4SpWT
	3FDwDxdBAn3NO510QwxHu7kaL+gzNcokxKMAnJAyyY7XvoachLrhFYRRo+C/xKX36lv03SPmYAV
	u8Izgwco28mDCY3ygvE8upS
X-Gm-Gg: AYBFou0jn3BtSqgmYcKTrBGBVSJCHFMLx+MMcxxw3kveCOaQOFtoCYMocTTkR9eZcf8
	kOkf0JYqJjX0kEnyKshPIaOM/TLpRKsk+bslCuZZ3ePu11SJ53efExh37ZYtPFrG29InkDa0iGI
	odeUSbqlpoZrY+3LzeA/vqw5vC1P+ENeyzA7LXTRwkbWjzGsXUum89odMg0GpZa8ZZDOMSpHVhl
	zv6g7fXTENPtQKEQEsx3taSphKmPEsDKMz7PSvF8lMeuK+RJnFzijm/RJ94Sc/i7I+icNOw8gcV
	uP3+Unljz0M921AE+etc7qjLALG8+hTXHHWE3kXtIOiQP/TKyiX3md2KYt8QC3fdZpe/3vCuNU+
	bSXYqtVh3UM9qJgS1u5rTXWeQN587CbAdzIybt2ZN3jrj8S6aVxv5daQ/KKTYUBQHP4V0FH7NDV
	gdN0zw6zwFV/upQ7aOQh1vB3C58xDdJDUbIDwietdkq8k=
X-Received: by 2002:a17:90b:57cb:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3adeabde80bmr9769855a91.27.1793123491438;
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4063d1e9sm2598200a91.7.2026.10.27.10.51.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363fa3d3e4so4607691cf.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123490; x=1793728290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=KnNsRIn5rPXbYlRZ3D8CkIIIZ3cjZ2XNagJss9nCusmcYzYdSEeFZr4iGUEKO1j6Qa
         VYT0q6RqN4/Qi9WDHp8awscMrllkxaVsdLomH+XO7J7FpvuOB+m+Bit093azr9MDVum0
         q0643wT0D3JWUDFN60poZNns3i8L0mQmhUMiQ=
X-Forwarded-Encrypted: i=1; AKwUvBxx4P78VP78bY1YQ4iD/WAZ9WCV0Q4fMdZ+mRz8FS52zGP4AacRI/E+MRI4qVoTEi2Ajv3AYAB1RrxO@vger.kernel.org
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179701cf.0.1793123490126;
        Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179381cf.0.1793123489573;
        Tue, 27 Oct 2026 10:51:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
Date: Tue, 27 Oct 2026 10:51:21 -0700
Message-ID: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for the BCM5301x PMUs which are AXI trace
engines present in the chip.

Changes in v2:

- addressed Sashiko's review by adding the appropriate title length and
  group validation

Florian Fainelli (3):
  dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
  perf: Add Broadcom BCM5301X AXI Trace Module counters
  ARM: dts: BCM5301X: Enable AXI PMUs

 .../admin-guide/perf/bcm5301x-axi-pmu.rst     |  92 ++++
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  |  43 ++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi      |  15 +
 drivers/perf/Kconfig                          |  12 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/bcm5301x_axi_pmu.c               | 452 ++++++++++++++++++
 8 files changed, 619 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0

