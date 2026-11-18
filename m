Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980920;
	b=4spRfDVpFbLEVW4hD2ftjv94LxpvjzALB+Z6pBrrR7eZY43F99HiFkeKsibareQM2oW3
	 85aw/A0dnSr+xGc/WDdUuPo7Qcq6wqo9IgqRIa3wPFxSQNlTRSkypxwz8YexNAiyFup/G
	 j9MRaMWX9iGo4HSkKeKieIQ7QovNUkmTQYyFzNrdq1YUZ4674Yj91jcCEXXjQEwNHi2Ec
	 d/HtZS9wysApJpvssVFrwruygM1N2/k2xybQfkukwjPDW7QEO93hpIvqTaI0yv+u8By92
	 VBaoJ9hq7FcNwzsph08oUxR1AV8kjgLPHVEmykDdqVR0vDjLAnaA6pWBKStq9yQjV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CF3QnG0pChhA7KqQolo3HBzvxghNuVczu9hR7QXwJUQ=;
	b=olwXBSb09u0+6p5jbKUbvliFNjCn+g9327Kjba4TYUPM/DdePPmuq6laz3w0hDOWAVTr
	 ttZ0zXZzNN1QT0+woHE1/Glnhi0KefyznREw2pGt13/6gtfQY8yFebbwoFQwY/OykErqo
	 8F2wY6QAznkre7/ejaR3egefP8gq2YJb07K6OR6XgWKtjBt59DKoeWfxjgPEG4O2VMs+s
	 2X1AzQZruAee8Sj+hRe3VZQQZ+wjWwEm/wh5arlX+K0y1PblJgN9XscQM1x6MikyfLAKh
	 ZHLhuxT0gcKirtgBTdKoiHBsaQpC3JKhvOIJHcs2ASXoDC4g0yN4WPHULIn/3gvuQjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEPEVhwN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3594606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3594606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEPEVhwN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1460304eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980919; x=1795585719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CF3QnG0pChhA7KqQolo3HBzvxghNuVczu9hR7QXwJUQ=;
        b=nEPEVhwNsIJno3CQR4ZEa/RcmPE1rJtFDUU810z5FIl2ilKpd5asBxskAkOoLRFc8+
         bAARt9888Sn/b4OTQnC9zkLH4PGVfG5hferez8ATt5ONZIS3GN9QXfkd9rWhXqRV83ao
         c5iiclwZqpmoVakpc9UQLTCWIllFiVujQYW9ccAlBul5VHgjkWQkVrmFrOKM+v7KuzGg
         tWgNgnsvZJqB4gfa9Lum3VrDF38WE15BFJJOzyGibFqV96IyBxKRzplazw4fmweg0tuQ
         +6KHBtCbpvX2zzxe9hzvYsA5r5crvN2+PteeRiKYOF9dAAM2KDh8WV+cd//UH4o136gd
         +OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980919; x=1795585719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CF3QnG0pChhA7KqQolo3HBzvxghNuVczu9hR7QXwJUQ=;
        b=jcyTuCGpg7kOTYE+dUOzfJDSzqJUQtToOx4K0exgROHXlxVp+/I0VI8chiyyDWwNpc
         Lr43316bwCwrHLi1731cCHgy1w17uEHuwzdIOA3a8PUezv7j3GmBLPWjg6alSC8mqRy1
         Fza4MTLWyNrQzYpjx34hcsAaiV/YJ1BaeDLCjeaLlsSfvZmZ6B2xXBGTYwLD0UyXbekR
         KcwYFg093Ipveso0THQhogUhFWRmcJ2WQxAPjpHrLmzXFNz81bZyWqOb0SxGiQBFyfvV
         V/xZJUW3ulglBRUSFszERz63j3kD/OscLc6ts5tDhHGLlpuNetTAe/MCO5D8dPMX7wqH
         3HKw==
X-Forwarded-Encrypted: i=1; AL+hErF4Rk+Cb+wPOLV8OnBfIb4e6E0m/oqoZjEulVzu1oEvtSIfyaKG5lBw+QHzk0iTt9bIC9JYKoKXZCKY@vger.kernel.org
X-Gm-Message-State: APuU4Z/399Ud9Qnzk+I9tIcT/cWXbBs/6rtphT+DzciGkgbVc7aMWQ3e
	giTwrhGU+9mYOzUYttCkkUD34/S93cH1/ggUwjwBqNn3kBikkZX9e5/Z/Qvhjw==
X-Gm-Gg: AZFdTZfDyDabB9VGduXNfqIdxIIXzWEth2rP+AFu+Syt3VWBOob6umMgnKb6JkkRCju
	aLuxsNV2j6yv0Wq0BUBLmy24E+Q5PWaMq2+nCDbAexZwczyjiqLOcB1cVE0PklgVvm7ajkMgLLr
	SWekBh4tHawmIveDG4c3P1jIDV+a9rQTFSAJq2U7HYJ2mzJy6OAgIYMV/vJEHvfqfYL2GvSKnGi
	Jo4++oJJZblUoxWYBKxjL2BcIVs9vppqLvqkWrOpC0an8TivEay6IVCKfk2em84Smx/GaS2KIVi
	CnP4Zk/dLSnkRGv4FavJyhLve2whaYXKRSzyW1EsVoU02E9m22rUCtuycFDJmRG45D3f3Eqh89+
	aAtvpCrqDhbk/wrmbcGChxFvNoQksSAbDvCzJ7A4wCRxKlNN0yti4iBnDBzkJ+cYYYmxos01dqf
	W+RMQWlhI1NW1Jopj6cdDT+3nOdC4u24LSh4qsrPzjcODEY3zHXfabyyDzh7C4IQPxOCs4xmSht
	uzgVYIlRv2Sz8qUEdHLOqtXt747lsAtgICdxpuWesTCXyuFef+W5hiRCoaFdb9OMSp5Ix97o5YG
	+9vVOLYSjqp/ttXkOKb7o1VYgQfZHBRaIC7nnp96eOIj4R/2DdJ6t9kw3PMU6MA0F+SiYaxCNrh
	75BCqXjGYX9CuF/WPYcDrC/Arp3bX+9z8nzZ5ahBUOX3zY5nOxspNDeqQmjlCc60IlvFBVa/z55
	93wLI8ntcIJF0at7p06/WXpq8=
X-Received: by 2002:a05:7301:714:b0:375:9a26:cbae with SMTP id 5a478bee46e88-3828121b85amr1544754eec.24.1794980919148;
        Tue, 17 Nov 2026 21:48:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:38 -0800 (PST)
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
Subject: [PATCH 16/17] ARM: dts: BCM5301X: BCM953012ER: use gmac2
Date: Tue, 17 Nov 2026 21:47:57 -0800
Message-ID: <20261118054758.132233-17-rosenp@gmail.com>
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
Northstar SoCs. bcm-ns.dtsi already links port 8 to gmac2.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm953012er.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm953012er.dts b/arch/arm/boot/dts/broadcom/bcm953012er.dts
index d939ec9f4a9e..96b93b65536b 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012er.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012er.dts
@@ -80,9 +80,7 @@ port@1 {
 		};
 
 		port@5 {
-			reg = <5>;
-			label = "cpu";
-			ethernet = <&gmac0>;
+			status = "disabled";
 		};
 
 		port@7 {
@@ -90,7 +88,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1

