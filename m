Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078553;
	b=k2WZSf++Evvkyj/oet3ZoOeembXC3Ju35oHoY/+4Yj7oEj1PTCt7REFfWw/MYpe2Ewfy
	 PknqCBwWAolBGmqkhBWHSaEMq3mcMW1YaZc5z1QAsuE78ObAoEkYE62J8lNtIyWT5AXR5
	 B/3Xb+1vvUPV2TBISHKa+BY3UCwDWHSF9/HUw2TqKBDEeO1JKBNPd4ouBJsNnU+D10ikl
	 WpmMkoDJ2kmUW43X/ZFIX67S5QsQLJg8lQzNPDOS0wH/j17B27Gtgv1GcymeRhdIM4Asi
	 w7CPqEDK1c1dAY+bQnyJF0y6NvVsEN35GYL5OiJnPEGgerPSsk1HPpHJtQ82CxqQFuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
	b=LOT19vwjT0OsNevG/fuV0ufAAnJAoJdFGAV9pfaXAvjdB2FehNO5A4vKmuYfzGi+xCEz
	 c/l00saNJ7rA8jmO9Tg/mGKMHEYgKLyXbG4xnkWTnXshdxZ99NrxEf2mzdrEqRjpaQhNX
	 XmteOL0PLTl2OuwgDf2RjIo7bgkwGcgIiixcvQnDDZlYLJpH+xJ4Ot60k2Ru0zXK2484/
	 Grbe7M7LTtVptj9Jovhh9CUPhYi0Jbtt5CVQW0pXqldnA4mvDSKmCZhzoEfyD2zORouyH
	 ukXWDppFW2+g2UU2x8HF1A6WLPX0JDo9IedGj3nnmXbmKDQYTo+qPM0EznoajZOqPRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KOIzQ/+f";
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AA606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078AA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOIzQ/+f
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5364648ae07so21520921cf.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078552; x=1795683352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=KOIzQ/+fEdkTAOL+C1skF0CtA+qXDHNeAhH8TF4W6lk63VPugQqrK1E3ZM149eJzdO
         OIksuIRu0wFTbeCfak1jw03THgJVXsndZ7qFe1N/iBINRLl365K2tieBpE8SHtWSPaG2
         rV+EOPSJ8gzFlpS0JhLIqJHIIxESkVbj965jaCiJZQlrItZIwYGoClYs6pvzINShmb0r
         D53nJ50fbFDb/a2P3/HFm6frO/TuKzDdSS0h8nTpduR8zsCW9q5yQZ2YdyadQbXhGa6a
         CVbvAb2VMn1T9A4ckA+LIDmwSVv0e37K/TIs/h6G32pa+wSTyD9rOi+xqBFJUt2+LVBD
         fFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078552; x=1795683352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=Jj+nN8t5zFKLLkNA8z31gOv8MuYZtmAALG1u/8bmqmLj/83jGpAcQlADTWIfzRYu15
         Efa2QmgoswoJYt6FAgDKcgee6C9ZHGiJcjp12fHZPsNJFPWcddYDrW0YM6GV3izE3cPM
         nX2p7hy22Raw3fJo22P5p4S48ETuHSy8s1VGwHiSFpWc/1zGGMghlPYY4OgeQ2O0zsbV
         5aU6XiUG37YB9OOv75bVE8lTEBwOtQIFV528fP3YVY3ur/AoA31APZ4Uvzm+mp8VWwwb
         i7wrJrNHL4j9JeksTzmXyunlHMQlfuT6GPk1kDY31RjAKd3cw+WBghUNwOhJjt7jdAL8
         7AEg==
X-Forwarded-Encrypted: i=1; AL+hErGWKfnXAKdrfHhF8KRfbV/MhregFbqb9L7Da47+7e8QpweDSQL6M6V/Nv/frWgjiIT3Nhc5ijB3nEY3@vger.kernel.org
X-Gm-Message-State: APuU4Z9okgI4EYyJoYxpcZKAtqIla8DkJi3GpFBgTtH/pwi4PBjCrE+m
	gWjtrJB4sn7vRcAOBLr8ofjDd0Bm6HnOVh9O5JFPDpHUeToNTyV54pkD
X-Gm-Gg: AYBFou1KGNTuhiuOoWQKgHLQxDQBwoLLudZfjJib6J4xdLY7lei7dDVUT0IuVwX7+zr
	cIrNA3N/k+5U00qAG7N0j5BTbP+g7nhUl2fMWdvNn91dm/mr+LF4fAnb4xNcjrMClzCJlYuVEPv
	IoisZ6aMXA+iF+shQAwdpSunLLNrvVQCc8CRqjueGIYYb/b/yhF1+zg283PVC1SfOua8yOQ87jc
	X7STZaC+T4OJJjRODY7D3oXVx8yf5sR2eYNhxPMgrXiCCda9P2M0cwb7PiJ8+c+0A2DTvmTr+9m
	7b7jw0xcAbCl65UPD7WBOjsK4SHw6h3wKblSm5RpRjDJrDXWOxRSxRpFid+Pac38FoVGT2563to
	x4UdCAkEDCLM20/MUhq3W4rytfavZhNFn5u3DXPoO6hhYKPbJPuDnXnkynJVfVWpZbDuzSxItCo
	R+bRzsIGYN9haouvV3GEPR1a6hnG6e5wzCMuZ0K1I4CwpISZsCljClJ2/VfxZec8ThfJfxbg/nD
	RJl+wOojtnOwqfuDvbe2ZdvvCLxMXnc0nUsaGANOhcWw58jes/ehpxozrUZ3jsveubSc+kiX9WQ
	as1J12x5g9pPF/F0CN3w4/wSu5m/foFcuN/XIJWBOJLq8ib1Lb/hgdCDFN/oDQr16Ut4qgeSYO6
	ziN34SGMNnH1gMfr3OpLc1g6MlXME9aSNm6UzBIO0S8u4/xXNHeuS/vq66brpsUgudRYr6QkLB7
	MNLQ==
X-Received: by 2002:a05:622a:488d:b0:536:5ee8:cca9 with SMTP id d75a77b69052e-55d5a4d14d2mr88338551cf.12.1795078551785;
        Thu, 19 Nov 2026 00:55:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:50 -0800 (PST)
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
Subject: [PATCH v2 19/22] ARM: dts: BCM5301X: Archer C9 v1: specify switch
Date: Thu, 19 Nov 2026 00:54:49 -0800
Message-ID: <20261119085452.75708-20-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..c38396ac1288 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -120,3 +120,41 @@ partition-file-system {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

