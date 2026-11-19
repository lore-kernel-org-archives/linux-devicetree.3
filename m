Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078555;
	b=3f20tepwJRfcP3Dq8cZNjy7pDdjdFSrMP7OZZvjNj/W5URD/TQggdSJPsG6VvUbhN1YT
	 BcsnomBn5penRgbegc4VYBAE3rcjtRrqRDo0JZ/LsEBCkRpdAGiu3xPS902wSyia610lL
	 mDRR9f4E6th/BYNl0JTdJxAwc2Pc9BmGHjN+Xu410/66HbPmg+s6PaDyU9Qf6EYMHvRuo
	 TFHgm0v/71n3UKnTi8iXbi2skAtOR1oH5CGJhVDd+CRvtAelp7u6nz1vqIVYtd6XkQ5dD
	 iVdpSC5TbMwX/J5eE8VGP88TrhmuGGFQzV4rQZzr3toGbap5/UOvrYsRIayc85/VkKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
	b=S2niUjXCrS7mBNbjGZlWTgmca7vM8Hn2cIh79eQt37gDQ6kq9oOYkE1yZuOHgq4SqGNb
	 95jT8007rHUMV2/aewCNRWLTxsh3Fv8h20nmgZkZjrHsbfyxNjCg4CYz1NjX6XGObagfC
	 QHHagqwiJnecADuu7D49pk/ayCp8VadO8SnYKcw2U3nkTWMFCrFUWLXLZSo554y0erl4C
	 rv5luOQXiGPahDXBVVA/l7B//rfioOzNxizwcUvpmfnS3gFC6bBrP/9CkhDd5cXDPSTqg
	 W/izaoLpTgV0Fd3+8p0SmQcHCw8i/ONBQDc8td3DR6MAhGuJ424TU6QiWylT4e+sZVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1jf2876;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866B606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D866B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1jf2876
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5569551d19dso8014611cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078554; x=1795683354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=V1jf2876SSMSWtkiQispiG/ZsrJcAewikJUn4EujZdNjVWsQJELWmbpBNV7/T5+i94
         M/S+KA4Sa9ez2bhRCzo9WO5hDx33HslMt/92T7dVa/H+R3Og9AHQcj+7nbgAdFNM4KsE
         itTEqruz/f/bQE/3moEzlcEjzTCUVD8lZS2RJCns5CVNL5nIlkFvSTi9rqlWqbS6R72M
         KIRuZ929GQjCHQ60+Sf58FeNLr1IDgSe5E0QMgZ7EeiNyodvzD+zbVp/ikC3m8wwprM6
         zJMGdx35okNBobf+XkwFMAzVsAF1sd04ystToGDV+ksAn7OCddrCL2G44VBF+vrb3Kdw
         rT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078554; x=1795683354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=nNtUe30MZiZfeJgn71jcvOIc9LOUA+SBfEQYDiiZtHRBPHXJ03gB16TYpgiC9mP1Qn
         T7JFKCMQpThLycsuugievMlx0l0wvqSrHIVeOCoe5XaDW9UCIsh74whF3MWc1hKT5I9r
         WLdcsHW+792SnGeVQWPkOIxThprU31xkc9XvG4l1NOvTo2ISRD6lFUFNajbVtX17Ky0e
         Ip56dUv4Hi625gYaGUueg0coS58XkECKGcSG9LgvAiymIeNe1SQp4xf31K/FlnBjwDBU
         8gHpB4VPRaQscUhtrmPs5Ttd2aMJskfLRdVpheXT0/SA+hVjYbwVwzpa4skAlOLPymt2
         Enlw==
X-Forwarded-Encrypted: i=1; AL+hErEYyAgQZBBV6ALbZfYGGdwnGgr0JTRCHsjL7P9IJe+gB+FjECp6yHeWoCMe0zphhwj9eHXlFyEVaS4e@vger.kernel.org
X-Gm-Message-State: APuU4Z/z4G5Goeb6gMAhctzsZC3RmATshRJGNBUpgZtO/A/8gITxGgm7
	804gPbJB0LNA8Ly67gd76d8BP8euskeny+xkNtXwEJNSVNhXl5uOkarH
X-Gm-Gg: AYBFou2qdRo+FicOs260f3ABLnY8S2tL052TapBVt5hhM3qkgu4bnCk2AiO0C1R33hT
	Nez833m2SJA7a/Pbrz1L2BiCRgIY3uXJfNqDELtYOxfSrvJSb2CPDoQKUjait1WvEmVrUbBCcv4
	yf1WpS0mlI5/3qDczIltq5skhEBTIy/+Ep3qN0JN9LJncydtD8+JoVZRtxFLmloGSx1r573GRn7
	5+pgo0yI8AUCuyGjNFrShVsNqm7IUSVEFTI8lKOZZGmXhFguhirKjDDdBMLVAg37rLnOPxxv/sq
	QthDNrPKA9yfJgN7ThRiyyiXHvKcketcw5d/QeFcQPAqjJQ3x3Ju+/asfE0EdbDHyBkQkLc53zK
	WipiXyEb816eX1EVLOsbXS8+JYAgpwCqn1UJ79uhj46GCsh0QN/7XqoEQBklYrc9moAAGVK5xbj
	uJE2WtDecqX9deyxLxaqrUP0vFAiLwz+uxVQjo6ZhqRQCiDoZ1PYTuCbpgcpjuU0k9pVui7Z5M6
	TBEalc8IqpIkgEKA1sUtWly79PgtaULBVU9CKgvsZkxLkdtr0KiPt3kCItt5nB2Q4kZEVlCy+sx
	7my636f0LqsE+VtWeCCNA/XsLvs+5C1KmMGdx0eq0cs7AgR2+94lmivS+QhGox+ZHXsRyOwJifs
	yTSsxW0kKdOUVBvluKRwrrlq6KuMjZUOIFGRYTSjl1fSJV+hgIHmtyc1PCF2pHNam1lS+4mwWHT
	WMUVFd3Tb/ibPaxO/vxxvt+4HU
X-Received: by 2002:a05:622a:40d:b0:536:48e4:680f with SMTP id d75a77b69052e-55d6fc8839amr5194821cf.30.1795078553644;
        Thu, 19 Nov 2026 00:55:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:53 -0800 (PST)
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
Subject: [PATCH v2 20/22] ARM: dts: BCM5301X: DIR-885L: use gmac2
Date: Thu, 19 Nov 2026 00:54:50 -0800
Message-ID: <20261119085452.75708-21-rosenp@gmail.com>
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

Commit 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused
switch CPU ports") left port 8 as the only CPU port, and port 8 connects
to gmac2. The MAC address from nvram is still assigned to gmac0, which no
enabled CPU port uses. It is also the et2macaddr cell, which belongs to
gmac2 by name.

Assign it to gmac2 instead.

Fixes: 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..b64ba9afa736 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -121,7 +121,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
-- 
2.56.1

