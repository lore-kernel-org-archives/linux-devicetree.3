Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C97413D62
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810412; cv=none; b=AAGQC8WUzh++epzxDXNxIpgJ+E3gJlcosXN2IW15E1OG57KG4B2IadPZMBT94uenl0u4cWwCJ4R/wTuFHJ4LjL3KhN9l38z83gAwdnlwPGkRgJmxgjDgPZIMOR14zuo3oNL5pCI6yCYFnpndzq8tRAuXSc7+0ksWc4STQbwO1QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810412; c=relaxed/simple;
	bh=DyLHAxWs9nq6ZjbHUwT7XIvcxiOYbz9hUehk4+JnrgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfupl52lKi72W062g59Yuf2XWQmWAg7hdletBTr5lMlu0SUL5W9f92z6SyamtCTPP7UGtUR177RHxUpsEWbUgI9G8pPimxGvgvntm5Sg5dgB2aBA7TLDp93r3gwgTOLtB03V1ZO7SZ18M+dP/YHqqFetdbWlmVzXYe/vqalesM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJBqeeI1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJBqeeI1"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4479256a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810410; x=1789415210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=;
        b=WJBqeeI1lr9ojngaUVF7siUp2DG1bHQxWP7d+tKEe7FTM5DEd1gxUUgdIEv64khyIq
         py+Ek2EBiaQ0jlIx6q1kSpHpCKW3DXbL39E9skdMO0Yf/puSEJxvjYr6mYz0d5OPFEHv
         cxPduOTN5m/5v4eQdk5jlQmOEyVp3C+ktxhcdemj3pvEM9q7L6yp9TPDJJY5r5ypef+n
         /Yi2sAAUPsnrKgFHn+SXE4B0XsWL10mpLo0lZWQx3QGw7b8nBXj87rt6EjhEtRf+RIml
         Lee8BLFiUcv6NUxht6/gA5F5lO0dvi+/7rj2yZuKZX9MTCyB+znNwpt3JGpx2XlD0lV3
         fCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810410; x=1789415210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=;
        b=tIUrlx+Nh0tOjS2UiQWMl71PWT35K7PGYjakgr0CXu9y59ihqKARTRt/2kuYxJDC/j
         J2gJCWNdnT3cHD2bnDygICKBdvMWN4mBp6btqLYDmNjdqOYrvp5USsY7gJofYIA9l21k
         XDvIpCGMN3AkgKT+AOQpL9FcOdINcCyyup8EnZaSsq2zOq0VQxfayzdO96UXhDRwf+HH
         3y8TBpq1cD9M+RY4c2h+VoC54GAs09DjLJ1l3sQXZknGz+sAOMUr/lUznRkRudjWpf0Y
         JF+kHwBOgVQeWTjM+pCGy7yekfWMiouLR/2WsI+O+8737fegd3A/lHFNm6gmdNDT4OOW
         Tedg==
X-Gm-Message-State: AFuF++nxiR0MzkVc6WyRTXfzAsFazECst1KNKZO+4BI4Iob1w56AsOe2
	dj7PUEg0ilpIvc/TIG+qSviEwNU8yLs1iqSWpRk7FsEZdImTtNW2+t3MnD0FFw==
X-Gm-Gg: AYBFou2AENZqj6PPRj1xnFn5HCybi9WM9Fj1Cf7PaFCIhqlKkuCi0c4alLhtYZZ8OlU
	1R9UfvjES2MIWJaBw3xs1O/vaRniELA/Gr+lI0OPrm+4ui78sVAjKiahZtzxdTgKj+YtczVAZ9O
	mCzk1Q4mV+ABrZY8p+9YY+JScxc1ST1FzKeTwblslG1zmcCKGXDPIEsv3gAiexH335EDOQ7t4rj
	i/UMOrUFi0MTXDlJnRTU4+bkUqhepZ70XkxcU0LXrVZa+Tf528qU+g2H/sk6gGh32QE77cWUqJF
	M2pyg+IpDE/aC82hqil00AOTi9AabCachQoQfqES/6Wo07tYMQDGXfGsGPYa+Ozv/5PiEQnyPhe
	pJ3GoVHVdStF7cEvhqsngqkkPcFG/hNQA28hRZ5NUlZxDT3+Ocj2D53Nxo1osS4hgSevVa7H8Kj
	u+GgUWEkUfu5YdL8xNPS6UV0jOsiaKqEVPW84b1vyUYCCP3VwbrKZPn5EweIEKiLXxlEHjBGVDB
	h14cCvtRbRWdY9KBoAXvcUv4AuY5nbKi+OP7x7POxvOFL2mT7M7af7YyPZ4WitaT/rLM3P+fl2z
	HhQaVX0IUpRiJyYIMaXyVzZgHcDtiHcjsfZHWg==
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr36435852a91.18.1788810409626;
        Mon, 07 Sep 2026 12:46:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm28219277a91.4.2026.09.07.12.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:46:48 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: AC68U: add nvram node
Date: Mon,  7 Sep 2026 12:46:47 -0700
Message-ID: <20260907194647.23151-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..42618b5d6509 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -83,3 +92,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

