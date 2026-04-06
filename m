Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D90314B76
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464457; cv=none; b=hTmKagktnnCS5UeAn/NaBHVNiU12aTDk7StLoVQeiD58vz+HvyPHiT4DsQQdhJYGfQEC6HWpWzsygNu0fXfQ26w3hjJl0JMmpAySSEhYYgqm6r1POTqW5co1rEp6MaX+YLEC7lf0Jd0zJr66nBXaExOpBDuZUEIK5DT8ZL0qNJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464457; c=relaxed/simple;
	bh=PKFdbLOtezmddcHtLj3hd26ATJxGdOHkO0A6JXK5y1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpsQaLtWrI7TPgDokAvVVc9dQYFIFc2LstSbz5RIMIB7l1n/jFvbvtngRlbQqpR/6cFpkAngfLim1y+NtjLFmzyIopXJvJWT6wcQ3ZIqo5DBTW/bSNCgtclaKy8hw/IJzPCMZkEgeePxiVPy5ZZz1XQORgLq936qP6YQGDEdkN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPrg17J6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPrg17J6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so24998545e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464455; x=1776069255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B403X2O1b8FGNNeGhrK0Mv2epOELGQnn1++DaG9H56c=;
        b=nPrg17J6MUGv37+qQEBDroKwLphphUtKoDh3nVw3Ad2Z8EWod3JLAuoNG8JsbrcmP1
         Dpf2rYSUfoGwdiG5QA9/S8QBIw0XHADUKuK2i7kI0ppxF44Zh2VpHdmuLgrOXzgyAPh9
         xj8r34Mvyjm6F8hJI8aWewae1FuuSbK/bJX10q4ARY9kGB3z7II3Ba2E11oruGHwagmp
         7pj1KqcqxzrA/2aJG/7TmA06GXkuTtMbDqWNMUNpyybL8VW4W/SKYN9WWmPxgjJkKsXF
         /3aYIU27H2QqTrVLoZfoYohKTgpI4dl4sRn1sWUuKBzF9kSiaf8qljt2rzfH9iN537bo
         13fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464455; x=1776069255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B403X2O1b8FGNNeGhrK0Mv2epOELGQnn1++DaG9H56c=;
        b=cvR9MXx/7KNpQ8U+X4i80twk+OkYUNFo3cREiRYeRE0uI+noFvR5AZfuGhD877IO5L
         hltv5gBrwF3JUucQ3XC19Pe0ZgBDqz8IOr8/yTFGUaOxYJ0bIpn+RIh99DNGpEWTvTZQ
         NKrh8Tuh/qGRYjZ7dg3of3TVOTidbDa5KlnqC4iPLzqwzkdPH/XY+4+eoC5YzuIyYnDm
         Npii0XA/3jDXHDfNjkqXg78HZp70o1nMpOEfOCAUQydbXNK76u+RWMvpaEdLSOA5nb+8
         l12Sm1GmAOVXpUcAMQH/qvgniQFTTFHm0pBCICymHxUCoP5mUhDAL/xkQRf9a3wHVzup
         29pg==
X-Gm-Message-State: AOJu0YwCgF1kBXqf0XwvSacfvluepItKoaR+1eGtzTVhIamAsv/jA6tB
	/I06ibvwTz0wmN6rcslT7ER2EmYQw9wrmzQU9TujveDiYo8MsHSX4qVy
X-Gm-Gg: AeBDies5b8Xoh416Chak0JSe6pSTKxHmge/mqdrNNPh4tx/vvsELGIgbCC8qvapcuH4
	Z4KLLMmL6xdV4m30uJV04zQov1O4Dp3G513a8OOXeoVfRUxt8CF2J6Yo5C1Al0aL78rREb5zm/v
	hERZ4dnXwC5AaRP0eoywfrMya1c2biiuDxWV95PYY0xoMkms+sm9QU1FkHgPOpdcNKvRCih+3V1
	BUuGDB6zMo5Dj1ZQQN7HHoQot/EH63dVNsYv4quqKS65qzP3LBc/qX/B8DlWLQGToaQ0OKsWoNl
	kA9R6twn2F7JUwUlKPSpYn/QMV6HmrDXObnDI+TxpKLdgYHfPONWjxRUY86E3w+bSsUjTx7ekNu
	gBAcL1e/AIppdozCkkUuIImDPAfY3FHWKUfs0I8WnFvKfNVv/dgu4kn+CD6NB3VfTnCKvXXSASZ
	9Jtfyrc+dPn9Rl
X-Received: by 2002:a05:600c:4753:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-4889976eb60mr170893355e9.13.1775464454721;
        Mon, 06 Apr 2026 01:34:14 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/9] ARM: tegra: lg-x3: Set PMIC's RTC address
Date: Mon,  6 Apr 2026 11:33:57 +0300
Message-ID: <20260406083404.31359-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG X3 devices have the PMIC's RTC module located at a non-standard
address. Set the correct address.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index d2a5904cebed..60e8a19aa70e 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1297,7 +1297,8 @@ pwr_i2c: i2c@7000d000 {
 
 		pmic: max77663@1c {
 			compatible = "maxim,max77663";
-			reg = <0x1c>;
+			reg = <0x1c>, <0x48>;
+			reg-names = "pmic", "rtc";
 
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
-- 
2.51.0

