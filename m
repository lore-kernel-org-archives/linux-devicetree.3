Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028415;
	b=eIL8LDdsWLxJp6TV0CzwYefCo6rm676ELBvT1VMW66KxrWH2G9FZhUaVfHPFIo2Pm2Pc
	 8wUQl+DCdJCpy1xB35icgtqqtWVk8kZ2gzqxBcmZVfrzHbh8jxFMe5TFJ4/37bVbp0/Jd
	 1k52ATpp1WCvgKqT7Cle0H3sg9L7P4gb1R3oydbKQxgXgQnsshOZ7kBW6pVQCkheGaF6B
	 2zrRi+vLqZn83NhmIGn6hFlfBYm6jkC1FFc5JREx05UrqN+TABHOBUlBCnq2OO+/iof5q
	 Q0QNziE2q2qhL/bVoLIuzVeyM/ScRMNlvuE+qW4GE1NfHn05Db3HuOyFVSxArMqWncw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bME5B1SZGTcUgMRsuT3S3lxxmltA7QzLm9Ooi2WbeZg=;
	b=yZw5+y5Sb00xGAOyM+g6ocri2Hlz/OeH3nmLMWCGdK1UYGH/KHdDx0talNon7Z4c0TWL
	 wOesS1gW8eyY41I6PUq8pEak6IYdV1fiEhLmF7Pc2CUNdGDTeIr+iSKgPmeirsBCfaTig
	 ZjX6P1JHvEIR8hslYJbmihkE00Ft2W2m7nA+3pkpgAFoTVb8Of9TUNiNY92QYHLvYP8DV
	 4zGM+1yDxZVAzCVoAZ5wYIjRlbTw3W8Zdk5ej1zG+Dt/kXXBTBSEA9EBS/oXsQbVtuIg3
	 T3qRi/y07xNsNZ+DKMzkFVqUOoo2hhvct0iXdeNYACS1JlYWB+1zq0ZWePjxoyQknCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="LJJ/Cj9c";
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595A6606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LJJ/Cj9c
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-539a57a0b1fso1167145b6e.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028414; x=1793633214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bME5B1SZGTcUgMRsuT3S3lxxmltA7QzLm9Ooi2WbeZg=;
        b=LJJ/Cj9c2TatSS8iFpIxd1CiCvosdLbySUQ+nrT8VCE1Bc9WT360oz8zrKU5HBClm1
         f5zVLzb55CBYc8IDgJmBnpQ8BJdqPpBlqhmFjga3l8v5f7MCuu53zKL65xXq/6m9O3xc
         aViZU9fATNgl4JTFvwIqgQb65uTXCzkjDAr42bw/LH87IquEbFKDLElDddNtssPblcf5
         ri5debILSZAGH6laEV59X4rKQGDK3UYXBPJP3eZfpn9ptHmd2MrPBWni2t94ibVqkOGn
         /2FByHp7fWSOvS/FAGao76RKr6nX7n+lEfhP7lhS/zFGTXkg/tJNirHm/W3K/Nf1aScf
         IsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028414; x=1793633214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bME5B1SZGTcUgMRsuT3S3lxxmltA7QzLm9Ooi2WbeZg=;
        b=NahcJKpPXtGzaoQ3L4Krv5NR/TOS6OlKm2pxjyduiBSul4rrYgBSL77hAqLi4q8Dp7
         EWdE37gBzsiuJRbQwhYWTrA/4kmWfGi8GUcHsD4GdNcw55eAJrECaJNnhIvLv8SbLQhJ
         tre4rliPMEB2jNKEaPV1I1cPjOzyXJJsFydX7VMSsDODwoESlpqOcfxs5LqWlDVfcd36
         jlKbdoyulP5qgc6jWxiFA8l03e3clpHagtEOPzpwA94iXuAfezC4yy3JWdKQTINPhO5e
         ar8aZRfYLBstFydcJklXUaxikJefZfJo8ER7H+vQHvdTMR/I4CbIT32v449WmzbZDHmD
         yo/w==
X-Gm-Message-State: AFq9FYJsN39yAjyKKQz0S9nPvDJixdz/LEh9c+J5MTgsrKX5FxxZxdTT
	QnNCRuemw0+e+B4ZLWcGsrDK5h92qogNAKyVUlyi0nm6ogqVTnY4oRP1Bh/EUg==
X-Gm-Gg: AYBFou3P8bMHvFuKPw47fEFydv9AQpN6OY5m1D8QeX9FaZB1dS8mG7TpE6IUoUTsolE
	Lh6o/37a89mnYNbdhFdAYbTFUCG8CMIvRlPwrPXai0U7Mpq0i93Nkeagd5Pwf08nIo2Wwei1dX5
	CC39bvr4Q6tXDztBaIOX4BnTXJ9xmF0IFRTFOYUAu7aydMnthQYbAIh9CEMltMoIPIPL5+QweM1
	VrQHThVPloBi5g3rcU+fGRX2LddelJEKOwROhWTixoHMYN4Ul4zKdvhVeoyDA+C4e/Nk978RePA
	O5cpA9Zb6A0z83V2eeHV8vNRW1e8X8b9WkYeQIxvRe2RtTzZe6LhCGo5PaSxrR7PJzp5gNbSLsa
	W5A2p0ehEi40Cpyung/grdBPMTgdDtyFmy7wRiUFgDTOP4rW9Z7pxmDfFwA1kUrn7AB/RVj/BJN
	v5krxtTbIRSYOCUZvHgBqWIG7eO8FXQ+PaFNiZN3q42YrWMZt5SumLGw+YN7uCDgpgjFpSG2Bjb
	LJNgXk5PQi184jKCZiDfVbdkAkJTcCpelptpyX4iZdCT4C3ciYEcaMxlJnButQ1ptvIaMVd9aWv
	qLkAmUDOVXvF+tOIIdUCFAiVXf9LeA==
X-Received: by 2002:a05:6808:c3ea:b0:4b9:e5fa:8a17 with SMTP id 5614622812f47-55c002f98efmr4375364b6e.28.1793028413958;
        Mon, 26 Oct 2026 08:26:53 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424973bsm5788711b6e.6.2026.10.26.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:26:52 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add icm42607p IMU for RG-Vita-Pro
Date: Mon, 26 Oct 2026 10:26:49 -0500
Message-ID: <20261026152649.1576867-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.
Orientation is relative to panel physical hardware which is rotated 270
degrees in software.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts    | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 358dea43f9b6..15d724b72ba1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -819,7 +819,18 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
-	/* inv,icm42607 IMU at 0x68 */
+	/*
+	 * Mount matrix relative to panel physical hardware which is
+	 * rotated 270 degrees.
+	 */
+
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		mount-matrix = "0", "1", "0",
+			       "1", "0", "0",
+			       "0", "0", "-1";
+	};
 };
 
 &i2c3 {
-- 
2.53.0

