Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448842846D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687824; cv=none; b=hm3HExetOkWFSh2cD/gv2JZs8qbikhZOGXGad7ouo19MhOCKOGmrWwscPs3YSFnSihmZdfVVVyA1SJH/7u3XeBkMwDruN/k3lj68SYlGXmd3i2SPTDROrJ3NakR4hNn3vfCEHs0z4hjzuk4g5o/GqphGOgX3yUxFJ222ktk7Sy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687824; c=relaxed/simple;
	bh=J3f7LJju15jxQaJdaYGVXRXPQuK+swynKQurSfSniog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASvvf1gWZXv9xKv5RT78/EYyXO4Nx+3tCjijnXubooeE8ritLwT5wAbzZjBY2PW0k0e3amEQpPhvAmUdi0RnHMKn7rSUh5Ho52iQlxNIW5QMO3Ed9YGtNiWz9ofUGjukFjC3aIHhbwWqAJqWRj7iqcVA7qL6ofO8IP0/ww0pLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgn/NpGs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgn/NpGs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ec555a26so6103465e9.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783687822; x=1784292622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkxXpxlyoJyTz9+xOjOb/cHlUPzYmumvYwxldIGQL7U=;
        b=fgn/NpGsca2YXeiY8AMAYIAXieoXnUUlU3qmVcNLwj5Wfb+/3VvBJC0mlKjG+VW3Gu
         oPm+sJAPUN7Wefd8SbEg8CZz8YBQx25OcU3hAkFv5X1xrBs2AlQWO9Spy845vBUr2AdW
         vWx6VD3ntpOV+v1jzbW+8sSN19DVzfa4dlAwIidALjYTiqAZflDAfrDIBcmnFvjam00h
         aWGX7Xoj0AQWdhpVBFA+iBOvrDAB7nJUFVaXVnSam2C4XbbLT7zMggQe5A2cNau10GrT
         U2sQNQsLkp3EYfnqVrRTzaFYnZatGWMzcLOncyFI7P8leHYHVSqkDPVfaZl+VbSPjVXQ
         fRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687822; x=1784292622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkxXpxlyoJyTz9+xOjOb/cHlUPzYmumvYwxldIGQL7U=;
        b=WTVWbp/mPk9tygFcoMSPCEf09cjTDBWD1ZAUzWRFH9GCnQtdLIaHxOnT6yCX9VHh3Q
         8S7JmVfZg2UlbBJArHEL3jZy3uV4xBMYukOlITIxyJZVN6802CLTioSKJEQSSV9fyQ2W
         mmlthzUh8h69AOJRMrc+UJdACYJM87D1kf3kEms+5hhzvYZhDGG5hbuDgJELKHPl5ZBi
         A2UQp2Q4euXb+ZERrkvAzGFYfpuKTob6OVrkLwaeKoFDEPqB55Te36L9ta9agho3AL+V
         /xqcXE5pKfulyYMUFBwan/1ffyilXQK6007JimqyfJtGZaO4M4KO6QZRzlFj/rGHu1xW
         2IEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrg13DDPaP/a6IyImbCkhXjMrknaUjbkRI6PGVsEIa9/nyKxeYyuxy5bOP4QdVNLXVsMM+gYw8XCJ1R@vger.kernel.org
X-Gm-Message-State: AOJu0YwmmcTNjxDRJPBDF1Nw+hYXjKYcG5+aHrQqfa1Ka0eAuXj2UPus
	KFPX2u/+wsiuT0zU4eih2zclVeJGy8R5e7r7cbiaQlV4L3p5DBd8XR9d
X-Gm-Gg: AfdE7cnzEwsQOGZ+s0lGmnl+Q3XWQ4zStSKUXiSG/+y/zy3WXvsRLL7eYtHtk2BmaOV
	5fg5QecZPJccrnIvkQ2SXEh9LhBfZ2TaJVev+oeH2L9OHt5VVQ0FE1yeT7ogut1g4F6+aDzDQLZ
	JI+vv/kU1M9rb4HGSv/OydXa7dQGQ8yjnv6o/6VbP2yJM9e0mGmUAiXA6M0abPKt27/lUWLxLho
	QLyPHJC/egwfaB03KghfMDDRvDaIwsKzFd7+TYJBSyeaqY3R8dtpMgeHRB+TKVFXU7V4Txh1C6/
	ioPbayoy0goTyGKL5ru3NMwp4jx5V7xDRsYNLolVnj+xM90v4krGsVkhAnJwi6KnQ4P5bjyrf81
	NXF43jIEnSCXiVlNvdoWi616x/uvWb0vZSq67icbP6Sm5WVlxoV86rmiWHflZCYGM+rVmMsXSdk
	KfqaWsO7n54D3/Ow0jnZYNEcnHwF7M2chmWWBcDQyCEhM4vMyLeLIs
X-Received: by 2002:a05:600c:620e:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493ebe7afadmr74080665e9.15.1783687821335;
        Fri, 10 Jul 2026 05:50:21 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm61218665f8f.26.2026.07.10.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:50:20 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Fri, 10 Jul 2026 14:50:14 +0200
Message-ID: <cover.1783687321.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 552 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 487 +++++++++++++++
 4 files changed, 1046 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3

