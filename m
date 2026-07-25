Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC0C3264D6
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785016696; cv=none; b=HQ7NI9Tz3t96sMUDbf6LbQfDnD4DvAiRIERXQIddW6LdKlFdIk/aHDNyx4IL/HahsGvgSYmEBbyyimzLxSTOx4vl3pBB/k9elPXdMBwIr6NNDmDktfFEfJ898DugABj5uBa+O+tSpswK1Zb7GAajBBe0SjrXVoZVv8e/qaikBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785016696; c=relaxed/simple;
	bh=Epth2ZLUWzDJnM1AjRHfGIIdlXfu5lcDmpaRuSef8Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yt855TTfp8HNWD0gsIm69dKwGy2BtsmwI/uiQMZAjKg6/LFnNIlVR7WlhehNxMMcw1R40cxoS5uM0KeoMSrbILKLu8/Uz/mZK48uoPhUFY8dt2TjBmVHFiXX9Q5Dk30SvUcgPOX+HX574f+Oh9xfy5BoeJxuWyb1GEjvRZqm3s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfcSe8CH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfcSe8CH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e27035206so1474052b3a.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016694; x=1785621494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=seeewYXoR94yHU0Jb4LssP0T9jXVvg/3bB6Rnh2Pz3s=;
        b=VfcSe8CH3HvkZG9ca7F46+3O8otYkw4pi99E/wp5zgXTYidfWz6rLvM05kWDikauNQ
         GmLbyuSOz5GwAcT2hFhro9dD87Yzqtp+nNsTT4Tb61SAHCKjDsU0Q8RY7uVflJE0OaAg
         6hPzMx2OeANW22TBRlffCzE4dzhM3DOj4GfYWjAQpq5QgdvRShkbLldtZRTv1uAoMeTD
         zjxlW/SrN5/Gfq/Yp6xbD8K2orVTrrYn4LPMIIvX75ayxns5XWlT3odh8uxyftp/v2qL
         Q9YNjnqeDs5RSMLyW9WEkjGaIccxDvxV+09VImVVTCKNhPlJEppA0j7CHG0lNOIqqDDf
         KOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016694; x=1785621494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seeewYXoR94yHU0Jb4LssP0T9jXVvg/3bB6Rnh2Pz3s=;
        b=NYzsxPXco0Ilpo1NvuWjslD7w9tkWIK0HjUxJ7YqfDDfj3dAP3X5XxEueDfci2XnVh
         ljHobKuVbhAd7oyywS11RYBP3NFfza6O/2nOEU3M/r3lWHahAXJ5huVj1v7HLgf6WI03
         EyBlZDpAL5oXGEkaqUGYS3kVSvnn1Mm0jbE4ziphAb3N7veIsn0C0VToRgMvRhbq0Wdr
         001tV/BUKX0rkkeFzzhre0qMUyMMoBrCjyEpy8MV//x03Drh8484y43zoNL9RFIoP5k9
         N9FarnZExkauJixt5gUgG4dwiaB87o3O3JiESt7hq5GybxfpxcNA+/iaVw+lUTLCq9lO
         1Nxw==
X-Gm-Message-State: AOJu0YyIx42exaTTRAX61itI6r3aWwkWouKbuHJ/8fYbvQVWGJjc3+Ah
	ljlchNzYHwp7JfUES0W/dIzVqPBI3onr/YR1v2LVHcCacrhuQK4k6pwTkU864Q==
X-Gm-Gg: AR+sD11v9mhEkB2AsidASpU5nlMp/OJ4A03NWMRVNwsrk6NO7MjSPCNJ7HuRH/P67Xr
	jpMhgsDayW9XBaqG82/aQfonXkVELRnbPbwgqVHb9nYWd/dbUf/7xiFpZ7mV1Rd9zGafF5DMwm7
	Pj1bw0znkC6VAHAv37OdcqUo584jb9eRQvUoGYF5D3DdTL/H5HtEN4ulE4GBFrzLxJNdc7weg1L
	XMHRj5QsD9CeqiDFXx0rh1rIpZBp1SUaa7KMFT1b1quySo5XT11VP3KVrVVKz/1cTbyOh4SH14Z
	twH0pdFbTPwoEjvBPXBuQWeELPtWO+lwbkI8SISgseERSh+DMHSowfr2qejWPEdr/Qp2mrB0XBk
	FBr9MDUroEm1dmtq/ftpx5Xo9iLkA2ieOi09fyKAYJKOiyG7ZpKxpUzqC0aYv2gMIBLuWWxAE3O
	fW9GD3WsvnZ61KSkWXMvEsoIAgOsvtQ/2/Ke24RewHzR0+WXpBFxQakFCC+lQS07XxtVRs0O9J7
	wPPI+VFBUyArFBlTwmtSUm8m28DFFvhojBTbrZbs81oRPbRKXTlWz4=
X-Received: by 2002:a05:6a00:8d0:b0:848:60a3:bdc2 with SMTP id d2e1a72fcca58-84e5956c456mr2427856b3a.60.1785016694068;
        Sat, 25 Jul 2026 14:58:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f3fbsm1375376b3a.19.2026.07.25.14.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:58:12 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: EA6300: fix USB3
Date: Sat, 25 Jul 2026 14:58:09 -0700
Message-ID: <20260725215809.9464-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 44cf867b223d..a772db0121fb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -51,6 +51,10 @@ &usb3_phy {
 	status = "okay";
 };
 
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
+
 &srab {
 	status = "okay";
 
-- 
2.55.0

