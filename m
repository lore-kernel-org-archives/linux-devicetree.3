Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FCD40757A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538510; cv=none; b=q8zuHSnuDG8lNuOpg1T3tRh8tnXzY3CAnAmHegPnxoi4tiAuJM6bQB8vAZGGQ2a1712Ea4odfVNZAZwQXJcnkJt3QvrfI2emWIomZLsayKCL0JngZOa0huPLma3FtAx7sv7d583cDEMqXpQHu2S5ZV1Y0nri/eF/DJoRdgnIjF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538510; c=relaxed/simple;
	bh=CiDfEf26POXCK6sG7bX8RsZVbR23ICwwiGimYQovRxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTgF/T8DwMbntPYSXu1PJBL/OoRfGtvGp9HdH0SuPj8CelNoENeMZmUkaeIt/gyCGM59kSGSmHcH+0oLCl3dQAbeNDHnm7AYoE9cbHqeKRhZFum7L+Q3esmvbQ5lhtLJqpYj8d+GA8ApEEw9YX1QFVIUCn+uZ9+18v4dHprXWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS/PqKPF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS/PqKPF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so38993725e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538504; x=1782143304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3xnMJuXedyX5T3l32zr6oLIOA7EY/mLz+x92qm9VdE=;
        b=NS/PqKPFZk+C72Auc+31VXA2z14ztxDOpe3EyZjfTGV3slATadewo4AnOmHeSUEVsN
         GO+FaGNMooO5FOhKgnCLzz1RAmuQ3eGCdOZy+5xVbHT+E/qA39y7vhMhqr++xvgxJGlz
         w0yjjtScLfjF6SfBo+lvq3QsvcIoNjmzzOrelSHzC8ndiEjG37VMmzHA6IBRdJ4rVYCO
         m6ANkTMjpmMlDLFhUy0hiHcfDUF8zvUpHeo9957dMFW64yYJE0WmTRq3lSBLILM4if5m
         L30jj5bqrUPiC8wmsNGENDjNno+gSOYADyCQSUc3C8QEZvHS9Sb3tdRl+lb4W0hICGB8
         N8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538504; x=1782143304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3xnMJuXedyX5T3l32zr6oLIOA7EY/mLz+x92qm9VdE=;
        b=Bj368meXSLuvr1p1UwqNo8iWcoXw/5fkDO98cwWzK0vv4pu9DRunLu73FiKPtLzPOx
         /y0aZNCVrpxesZSPBtSy8L802TEvygk9zTKcMMaWTN2GHE1cmzwnk5WKfrN2D1jkfdJs
         i817x9vhM077iEo5W1nkKubBWVfa5YE76BYJwkjAoExu29A8zT0Xb2f8QdyOXn0+MIu7
         4hOZAkOosz0HY2SxcsHSKM3+9ZT3hBU7/DfmTD9oEmrL/PcO26W+pXBnvSV/Eycl6i5A
         qL9RG3fjBqEh7cUcoXzkILZWt9jZgfj6E5k1RvoIvtfm4NX5D1x2a8LBjGg8Uv6LwvCJ
         YSAA==
X-Forwarded-Encrypted: i=1; AFNElJ9TApaMcHCU9TY1hsFcBrFVz0p27h+BCGka3r2PhLglRvXeUFnv/FCGj1GD0RTp3mx0k15rNrOu7N9e@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8uesg2B+WuVPDSxdwIXxHNJU8J2cE4kmjFun+ybDtBoxBdv1
	06GMRcFSZAWLO/VzgInDErm10T5X0JcvynXabLW2LTwQLUOflHwqctQJ
X-Gm-Gg: Acq92OHiRnDGCOzAiPkPNbkzCFje3KRtDaNBPBv3FxR0vyRRP3nYksRY6NdUmeF80bY
	/0fLyuegJGmaD8aKOYy2ZB6Vs5KtSLByZCYrZEQkLpZam7bTqmM6oVI07w78mYF8VJnUny9/Z79
	BIr3O8i08U+uJHCIuxk/FnrlXiJQwOehlbSIkWzwy4VaS6U5Zq3i4hzZur0hdELlw9aFngxO3AM
	Pbk+YbWev1UOHO/V1PykwCZL39K8sgyr15O0bAQGD+U+pDQaCSwS+0QuuSI11Hb5KwfFQJGsT7r
	45724RoUFNKNoNQXUX1hawnB0isQxM+JZxqj1fCqMbEWONlVb8xH0NwqfB13uyXCnWCqxJZfuis
	HCp7PRWgzk+9XFJcCLOvaOTc53WhLZfOshl0xtIvLglJ8LfNqkWYCm/NA9OBb+PY70ClhtIvjMa
	Rjd392Slzy9Pg8052JtVbYtghwl+ioFeFCHdcjrNvxqqJ6uXMF3vDAvgxm4LXakS2owSinxOx41
	/QJCrDm6H6B/0ddvvLiSCdijVMQYCfnqWjm
X-Received: by 2002:a05:600c:820c:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490ec4e75d9mr194107115e9.17.1781538503048;
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Mon, 15 Jun 2026 16:47:57 +0100
Message-ID: <20260615154805.1619693-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 364afc73f8ab..764f8b9ff742 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC found on Renesas RZ/N1,
+	  RZ/N2H, and RZ/T2H SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.54.0

