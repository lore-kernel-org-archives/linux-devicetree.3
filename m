Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980912;
	b=I9EmLC4fAboCU8mQ3qXgxol7EWJkZbXFqAzQ9EirwefkyGZsm3FW+0T/frMIuoJ3dIx3
	 4YnKrX79oBjplyHR2RsDOvAkIov3XqFR/XKNRLv9ZXo/xdjQpxhNHiNAT63fF4Thb9uJ8
	 uMOws4ep4WZDmbvI1Gxix8Evkddv3wft99y3FTHjGGLM0Onkds+OLwDcJOD46G5fI+6hN
	 0zd8FzmU93Z6UrEoH5oRnbKXtTjK6bQvKOkr+SXcoSKG8J3qouIonawQ0z1GZ5uJUlIYJ
	 iZ6tcHkHaF/roLw4dlDbgShb1dfz1Qxd5TKyRypAA5VhA+wFImTPSbz5ONN83+T71mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g7LvXprZ/vz+Q/G9AvsSv7/CGyIQlR7jfrthV6hVVOc=;
	b=1q5fk0lG0YBm+pKdgQ1D5GsYATjqGc8pL9S7+d/GRRBRP6eyPWt/aiIezPmz5j8dysxq
	 NAX0KLGrqeZp2uXp6YPAS9GmE2d9gAGSnnNFocsAguGRzbYoA1nVpJsem6nTLYOOKsrTP
	 w3WES1TCZoT6mNHWYMdBL1em+f4/JLhtwyUzl/pEqTwiq+DSiKYbqIOYWdW0dCTxwURRn
	 9sgVZx2axCaKrGxr8OIypvq5zOQ77bygMcwefWwnjLv38qan+WVSbPdSc0EWZyYTHTGH2
	 IKhtpWC3l3m8THgGTVpHvWnqF+MRZIEGdd+M1Y0Ro31nY8Zkc2YSVv0gZurg+rr6i2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVy4BtFO;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26310606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26310606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVy4BtFO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so446493eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980911; x=1795585711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7LvXprZ/vz+Q/G9AvsSv7/CGyIQlR7jfrthV6hVVOc=;
        b=eVy4BtFOcPPwN9iPhv0NzzUSeKKHjpTQV11gnk8xjuSXKmA92VrT0txfLUcRsHVGx0
         63GrPGo7zw6GBKe7DApkC5hFjnUPBOaaQWCT2NDepN8NNcZYSo6NWhhDdo0qdHnI68ba
         2F7leBDmtVEKJJ2fPUPz5jXSxyM91qmeNcHjVMkgZNrzPZGT4N1nx1RvMPFdjWUywuDO
         6r612nUh4ufW6wP5NiNO8PiNbFmPiD8L0AIFkqMWQPZ4W58+IGTf5tomhLFPnH0xdWIc
         v4xrvtnD5IacvgMPFsHLui0zsF9pv2L7LG1kpHvG/dB9UT4+If12fVRtl3T0YIQfe+EM
         LFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980911; x=1795585711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7LvXprZ/vz+Q/G9AvsSv7/CGyIQlR7jfrthV6hVVOc=;
        b=TLZkxystRESXnYyc9cA9zaOyZ55XjQbKfZ6tSeaVwLOCyEH8OyGoMtgAl1ezl1wB2s
         JsLoJa/ZzsqiRFt2zIlcevU27kjsRUyKsSbHIaD0EEw9J0+LJUG1Gs/eoAcwlbZyCdym
         hWyc+G2Ml0yOVDwAkCYYZmPu3gsezg6SFB+TUoywSYNKSornJ+YLbouPQCVSXLQzjqpY
         WTkKQPydPsRHoxGbStrRK5jw/YQWNN1jHxdR0PRJLNAiinJtroHRUBKJAAFv9mc5i1yF
         xJ6UKlEuvez49b2Sz8rtktiGh3UfIAss23oTYNg50FZd6wn4Thi8E+aZnHXrQhOgBlZ8
         Fb3w==
X-Forwarded-Encrypted: i=1; AL+hErHqgTG9N4bmMD4T5XNgBNY3JRJHBVUz0NrvZ/BXh7DzVUhhTlTslkrTTkcVF9mcxNyI4BTth935Zbfo@vger.kernel.org
X-Gm-Message-State: APuU4Z+FqNeUP7kMpXE0qCngmew6pDDvvQsN5UPpxThWxwdqo6YfyI43
	91kd3rk7AWlO91R8TEsRvOcSFnCJ7N7vlRwiQGgyzuJ8+JORsIMx8F9E
X-Gm-Gg: AZFdTZe8AVzCvcWla5Pe4QQhjLQLkrBqJarg70FZWqk2gOAIDC7b0qqn2SWP/ls93HU
	T6Lpz14qCJSkeFYyvNR7HCTU4Xrd9AjzPKVsGnvI1tOvR0rHmeiOi4YrEyxehg+syhsWOFqo1uQ
	3u81SsNW/3lJrN3l8Z9VxhnCFaZAZyDzgMRIQLPe4qMc9r3Y8aSuipkqhp1h06jsAUewqUkqvmu
	DuQHOkUzlz9eHol/QvO9euITnG5SPgm9q9D+23HxgdmoFeZj6kUjPfAm6QU8Ud4qsFETCTEYPUU
	n43CAluyo5GvfCa/r3rPpbtyzAK6iKRIoZcc6dFDp7wGMOqFKfiH/df4U9WYo14ulMe8f/19PKa
	UzOsdUIfuvs/d+sqgiXVKQRzq+9xSouCSid+wBmqj++KmT43cJMxwUMWzE18FDooBLi1tJOscoH
	qeM0/nyD5eC2dJnv2yAgF9ICp8lo7bY049CJkCWgdxwKVpb4FQCnY8MIEjEfRmiENg0lmpkOMJD
	8oUmknObvtrnpkVrxtzzjtV+q+Nt9V5w47R1CzOSBgv03Vcf/Q9ZVnjis/apmWCIP/VlcgYx/GB
	GanK2owFYcJ4UZlMDnq/ATvo6Kpnrj7PmU00eN2EdjWUTtEQHoYOM0k+96pMdAtwoM4Xcd9M9Ga
	O1x70o4sY5SK9zoLDyDMKUk8bjnMG0KS1FaeCghB6SWKeQu7KUpHJ11ch0Tol732yvhXxpZXG3g
	ByOw==
X-Received: by 2002:a05:7301:da86:b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-38281810090mr1512676eec.12.1794980911310;
        Tue, 17 Nov 2026 21:48:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 10/17] ARM: dts: BCM5301X: SR400AC: use gmac2
Date: Tue, 17 Nov 2026 21:47:51 -0800
Message-ID: <20261118054758.132233-11-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

Use switch port 8 as the CPU port instead of port 5. Port 8 is the
switch's IMP port and connects to gmac2, which is present on all
Northstar SoCs. Move the nvram MAC address from gmac0 to gmac2 to match.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..60661dde8ca5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -128,7 +128,7 @@ &spi_nor {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -161,14 +161,10 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
 			status = "disabled";
 		};
 
-		port@8 {
+		port@7 {
 			status = "disabled";
 		};
 	};
-- 
2.56.1

