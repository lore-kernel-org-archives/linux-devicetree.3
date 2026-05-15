Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1263812C2
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883736; cv=none; b=tTt2aQJCAnD5U0yA6HJyMYK7p7/ZI+hSEozAc2yxKgn86fFHgDBAGomrsFkkwWLi5LVXncqcHhKBEWJ3Wsq14aoWsYakDM+YIgSgPtc9U/NFeXHZS0qdAAXiaLmca4j8aKw8/1mxlborQywdZ3kOxedVhkh+pBWUi2czdQ76tDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883736; c=relaxed/simple;
	bh=9HoFIWvMx+t3kfwrcyvOsuK+wni8VWqYz//BsbgoorA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qtdJhNBrEl7a5Vsi3J7WFcnSfWoNtOoDshKbwIzF5COqdzknqrUYONoshY/ofuCyy4WHUaCxz+obxi/LFTRZGMDUNA4R0yYYXDttfgzDFyCrztoEUaBHDB916mVuAsT0eElOs78bITqajE2HbLn2ltEtwf5R0yOtqvLJn1/XyxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFsVQK3H; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFsVQK3H"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcdd1b492eso342587a34.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778883734; x=1779488534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzgPino86LaQeP8b63WXKQ8PXEYI7/0fnGLVDfvDc4M=;
        b=ZFsVQK3HnHG/psndD8yOO6seArZBMt4CpR6eN3udHN4k/IoeOWRNLOL/8zABnl/eCo
         uFDdppa7Nm2EKEYXlXroQ53YGjfF6N2S64a1n1Pvn4DoIQcj99SyNZlH8GA4Jf1ShWcr
         ALBe9CeLj0nKcsLOtNSZvx/LX2htVnkHKcqGI575qVCOzy1wpRYRPDwhyWhY8LmCgp/m
         geC0V9w0wtro4Q50dgEPvDpbnfkPXdO2x+HnD5h6QjQ+e9UHxq2/qt/j/Au06TROOI19
         lxo+1wVKjvnkWH57o4g31NJ6KmRfaznr9dzYhudOTB15w3D6ja77k0oiXyegLAMvihUm
         Ovxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883734; x=1779488534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzgPino86LaQeP8b63WXKQ8PXEYI7/0fnGLVDfvDc4M=;
        b=SoBA9EZ2nero6PLZa5vYhRg9fNR3iaUOuffJrJDhFs1qI3q3Li2Erf3XV/Mh3FloG6
         NDjx5dJTqdvOofT+UPRv56uq467WVwa6emKqC406iGLLvfYtZUUe9r/dEMu44h5t1NV7
         GYCBBm5s7IDHolTu4kz6SiR4q8ConJ96YZNCOZyr8blcLAxwA8au8Yvka9DVcUNoQFMX
         DyWfBBcRKUgRamPiMd5N74N49mJX5+Qg762vx3yw8d58AjDI+TeYEhrQI5A+BSfuTsaj
         9czxXo2ryHn2v2qgmt0sqQkhScioFgE8GXd5qCVlEUVowEHNkaowsCAw+ZJsE5mZM3CC
         uB+Q==
X-Gm-Message-State: AOJu0YzoI+qfvk2/TBC44G6oXURVBujnq87h9yQDOVIRcf7E5yUiwJ/6
	3wAwQg0oR5FmJWd5qeBkn0aq83ihahZaW/QWZy99kWjm5CGXmzFIr0Vlv8NUrKZC
X-Gm-Gg: Acq92OHdN6Aw9N+vgoTqBHsU79Na37yf0SVbztN/BZPNIggj5H5/0JcZOZ3oUl1zscV
	kikqmUogc0a2XdkbqjEsZJ6VFdKNgQVsFl96VRWyoZig9yoGe/v6qJvsEUH4wM1ClDmZDzw1VMW
	YQ+gVHw7W6CvF4a3pZOvFhldtvc8/pOzt1c8YpUB0RghCG7NAAfSDbU8xwbK+cgHNq77NMmk+Js
	5VwKb3Rm8QKAy/pBe/txQWwWyGLCtyXcqheSFBfqd63EG0S0igYQ71RQF2WPHJQ53vHDUtuBVf6
	hnExhN5+0bayxU9Uwqx6gr5Vquc126XEyIDpfvM078LdOCXKlFaAn0juGd8w35+cGjXC1jPvE0C
	oNyEMEuRl/1fSN6ugKwNm0fO1gyUhHCPwiOw2P4emYLeoH/+DWOOK4jmHdQzBV7WuZdLrOTAyrJ
	vQUujux7mJVO2JT6MeMzmCdn+ntKU+pezpjK2x1RqAnYG+6ykpQ1co
X-Received: by 2002:a05:6830:2a08:b0:7d7:f70b:5b0e with SMTP id 46e09a7af769-7e4a400124dmr3371261a34.12.1778883734287;
        Fri, 15 May 2026 15:22:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:8c2e:6a8e:445a:9169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e568c0d889sm980764a34.9.2026.05.15.15.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:22:13 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/6] Add Anbernic RG Vita-Pro
Date: Fri, 15 May 2026 17:19:41 -0500
Message-ID: <20260515221947.299229-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 SoC.

Changes Since V1:
 - Updated documentation filename to matche compatible string.
 - Corrected order of allocating IRQ in charger driver and switched
   to using devm managed function to allocate work queue.

Chris Morgan (6):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: display: panel: document Anbernic TD4310 panel
  drm/panel: anbernic-td4310: Add RG Vita Pro panel
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../display/panel/anbernic,td4310.yaml        |   64 +
 .../power/supply/sgmicro,sgm41542.yaml        |   99 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    3 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1317 +++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-anbernic-td4310.c |  291 ++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1035 +++++++++++++
 11 files changed, 2835 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

