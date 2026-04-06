Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211339D6F7
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513150; cv=none; b=l77F63tVx6Qa4dB8o0I6B43yWCiLe1WG7Bp+RFJxcbQwvnSfLvmFAS1fKW1+FN+U10OrJRrv6M8sqRk9DJdtgEMtiCcZvPnhfjhm8/wj2reY9seZphgIdxRSj3GoaQFhc1Jx0neBWb+kyUH+qz32/NmrERX9fcs27ut6uuyjqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513150; c=relaxed/simple;
	bh=kBZKR+bWkQM8x6oXrYtc0d5ZcgZu9b5HKN7QZBTO9fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+fiRXaHs49YZgdyGdCpiaeoyUQdmBwlOhsnowOvsPyK5MRIabsTl5PUTQa+ctKLXH6sG40xSt1G8Sl1Psz+RIjs/CzT20czv+o1jQMeLKcxyfCF0FHBAthKehbgOHqeNryrljFGHvk374cxzpXU3g+/bLa0p8GBHkfNjfzRzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC7A4xvE; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC7A4xvE"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89fc349b5ceso74342916d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513148; x=1776117948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=bC7A4xvEE4Lhfy0bAkBmfZY29FjUcsGSProw+ZKnqH9wOO6eeCG9k22Q4lBOhEnQfB
         Th1door26lVkCFKORtTT1oUVFocJW2SJGa1nORaiJLiOV0VxSO+owu0srO7TDwWedDED
         X9v28pb1tO+EwoWMikLSzC7KVWzRBelFirE9R7ifrF3zv+C7XVuxsjiN2R/TSZcqrDpu
         UTg5a++7WN0KqZp4SBcPGwuXh5wNpHWozAtkKhlbKYoaLjg7JwnMYrTB+wCtjiX4UcPM
         Ape5YG3mmAEcLexn2Qbd1csStxMDX4bp6Cyw3loJhdC28sR7Bi+JiYwyVpRK3Hud++Uy
         wEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513148; x=1776117948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Td81rvi6BN6rG3HaFnKoAMNTBYMk3Ck7byeMWIO0c=;
        b=TROV8rl71GNPpR4z+CN53SaKtg18x0myANMTdrSK83ks1OIWG0rsJUxqyAB0poYOR5
         P2xEjSRkiCfn+WQZIiF9pykWDRnh1ly6iCuLzSFZIApiCaW7wt1bhhURZkYXqRwHMe51
         CdznC3jcLfx8Wt0ITZpzf5tr0DASs10V9XyjKh1fdocJqauqtQ05sEiQODvS3me2j1Ug
         insmFq4RTzdLDQcmiAm7fvCK1jdGpO910t7aRy4o1BktqMEqBxFmbyo1zjg7b9KGjBPG
         ucqKxel1GXvWPynvoRnfjuZtqTp/aSFnFzhN2BD7K1qsI/PopdOWUqZkfxdSXoup82S9
         lYnw==
X-Gm-Message-State: AOJu0YwtLnY/ATRIsM1ZsFoTESo683l6JbpPOh3y7tpeniNzIXMX+foH
	Wq1lHELjBWTOKhmfwm7jVVSN25slLAR+Vhgn3cQkRk51tXlTcMtfphwwZWyd9Q==
X-Gm-Gg: AeBDievHloogqc+1FMn93SL/6D4dE5lKhphLxI1/Py1nDLy/xRfJs5hcnNZv7b7ns9G
	QLRFgjdLaoqmjr68HmCealT7xcsi/cIvTqwZnIYGkUtshOTR8joohOQuNoBM8yLA9XPzJSLpdVZ
	qsmXB9X05fgoYCUGh0B4rAVW/w4rA8Q6UMQ9GB7ml2D3MivnPQICWnOL9rWakhaO0Lh/0JRsGLK
	SI3E+azcltHVlP+TAFEwHEJrNuzuqYH8/lqEpnNssAZKDtcINffWega8Lo5Ju1cQxhwpReZTfwb
	CW+c36+XJB+uvfcj5F4vob9YxKxYOkUGbG6xyTB0k3VlUIe9GlzQLaHOu1t74Z5d29YCkznU2yp
	mJNE+qchjZkz7k+lmN/4sQX1daiXPBpwG2msAQeJWQqFCxUBy9LRQfiOIrvU2I/PJvukJ1PH9f9
	M2neuDRsh/vmoBxb75NGdzpfhl7oQFwxnxiwMyG0cqTuqNl0g1mkS2wOk=
X-Received: by 2002:a05:6214:5d8f:b0:8a7:3405:11fe with SMTP id 6a1803df08f44-8a734051359mr226337586d6.14.1775513147649;
        Mon, 06 Apr 2026 15:05:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5933333d0sm149981886d6.1.2026.04.06.15.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:05:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA6500v2: fix USB3
Date: Mon,  6 Apr 2026 15:05:28 -0700
Message-ID: <20260406220528.101340-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
to do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index 0454423fe166..ad246f9a734a 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -43,3 +43,7 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
-- 
2.53.0

