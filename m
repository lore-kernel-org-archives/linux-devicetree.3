Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340043;
	b=nUY0fGzn/xq4oZc3f0ylpGT1KAfwnyWpDsgvhGPb+OdXNZIKdAeJrUIQYigKKtnBy50x
	 VZOVVZPPByf6kwxlHlv6U9LaGCU83aRBNElB1c0ul3u2sfw8VbaNrlAvhRYF5fI9l8fZu
	 QpLSVHdQK1RWp/3ux2TaWDRXPuurd031CyE+9VTBHrBbyt6Ji3wFGdI0RH4vtcXBTEQXg
	 heK4qad2kfk7nA89DhMOo8O4+EOWGKndcLbVWlvKaUozgmTL5VdHFMIRhVRelNQNMmseZ
	 BHQ65fAu+73J+PUKAFeIpshvYzNefgenKn3L9+JYRRiUs6tZehagUfAy9CGTiriMLRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8Adj46CHkt5BTEnwxKrgv4J66DqTqr/m5dlLbJAPcdc=;
	b=bx7SwOPUcBGVMpPgem0orTIN3WUEB85PankjMX94ZLkeBQWCvUly84jZ2kc/CkrjGGIx
	 gwMTFr7BfdH1yBPrm5Y+5uAMb+SumRSQyk7Y8n6iqn+gd0qFouXMWiTs90Z6O6BFS9fyc
	 CgCm1vn0mmPzBg3ZblPlyPFEWgLiBYOjWkdFqyZfC0Zol8OhC1nPog3aZJCsk1ymMqyhY
	 +8GZSCTU2FKi5wSJIyZAjALRY1lqLO3SQseSqo+i+kp42G/TUdPF7KzoDpJc6tuFHkCs5
	 ykF0ke3R/mHHaPTg52n3HcRKf3eT6voqiAFMg+d4/rWbNRxJB3NQAxRkHaozKKZfXQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HilBxi8o;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A7606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HilBxi8o
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so8715665e9.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340041; x=1795944841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Adj46CHkt5BTEnwxKrgv4J66DqTqr/m5dlLbJAPcdc=;
        b=HilBxi8ovaRJ+edYVVn/33ianMSG6DhJ632g/fxumL8kIlQjBogHAoMpHYN4dPq97t
         ocgSnyOOnAHF8+Z/33K5dttZLFO5rcYC4OpQYDnZGYp2Qft0Loy5tirwbZCTfRqij3Tl
         LC6PmaatIdqjEwd3aZL+ziQV6+tZf7vRE3zQOOR3g/awlp0OqhA/sxeHbZ7TN1VLPYFY
         MU5zss76q5+l8xzw45XKZPCEnljagR1ESyr4Sbc+TKubNKiElLZr66aYmFbGS33CbJFg
         19Oh2f1kjgXG+EJ7yewHY2WeIKERpEUMk8jt7Ixc11Si7rG6xsCh7QJhn8jZLTtNrmCG
         JMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340041; x=1795944841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Adj46CHkt5BTEnwxKrgv4J66DqTqr/m5dlLbJAPcdc=;
        b=WOsk5Z+tQfrJZgLybVsRz5npuj+rEOYBvDY3ZXyzlRT+JCz6MbZZsGIGGIdOpB+aPy
         UPS1ON6mPcNlHM74A2YBhZqg1b86AY6k5olt6SFnFFzzqV+wQMiQxo3zt5CETpdBiSpo
         OTUx809jKQPB/zc9ujXQnk6gtjaiar8HRAzZaI0obmf/c/D9b33pFhyrP9XEngkgpPz4
         QT5vD2j6V2SF9mLDjiYbogtVpVyjFNdMG5B5jFwRLP9rPgLjT7NBPPIr2YY2MG24zGhA
         KZaPm9PSYh+PvEzjuuYBnPPkA6mFfsqwNeWPNuiwwUSSuQZDqgaxXS4hEdBRTrk1myZu
         fT3w==
X-Gm-Message-State: APuU4Z9k6XqgOpJAz/w9YbtrNmBjePAtht/SFpVDu2hoWEqhvIlutWhA
	1RPGrQmzsuqN3jTX+jXg+tWy5j4r3IcbfkvoqThGtM4fT9rvcsq1riypXXYBeikUeLSl6c+xKfP
	ugYhQbT60/nUe
X-Gm-Gg: AZFdTZegFgn8b67BHrQV8jzrCwkTvjG5Ie8pgDaBZKPwLeQXGIA06ijealfVsIT1+MJ
	OQrOuhTIlvzbRDng55SPfBb8RqfDhWPu8SrvD74h3A3LLVg5yANVymNQX5qbMfftrUu+BrtZl5B
	JTLvp6pWtIMUDsM0wIVMs3eYMLdelA1GQIzdd26OPIGDk4Oz0l2ngUZf66iRTLATqicPwwT6bhR
	RvuCQw7BGyeg8lXuluXka/q72KPkJbKAKAZJDCT2RY64OPTUR85LjjVyfBQ8X3h869FrGAR5lDn
	wogySYW/zXhhdHBqITQndykVtLvX+7aQG8/+iXGFxDq2SIDM8pMhyglpnp3m+15Q62bCy+WcQLE
	1QRuIFvKHNXesI1DRU2W15ITE5OCKAn0OLxx0tRVBda1dKEOrDvPr7xpwQ+sXf/1JUAdpKBZttX
	2rUu8w8ljCc9D5GYYGEJJj+VEZAlNaWg1U6db3xvux66Ig2CfKBs7plzerLMtbnxwQX67QgCNPS
	a2kZHB3Enapug6gP6XGXZc/pP4LHZhIBgEHkcbq2f4lX2UdIilV7WPRGEQaD42Um5zMIamZj++h
	OUUOM9nyx346Meej/nG8MTvyrwAL8IfWiozfYslv11LDfH5PgzkdhoLRtoYOhAjtnyL4z3bygR4
	+6KjOkA4buzU=
X-Received: by 2002:a05:600c:1546:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb887c2cb0mr193806455e9.2.1795340041057;
        Sun, 22 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm16972915f8f.11.2026.11.22.01.34.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:00 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: arm: cpus: Add Cortex-M33 and STAR-MC1
Date: Sun, 22 Nov 2026 10:33:57 +0100
Message-ID: <20261122093359.69352-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

Document the compatibles of the Arm Cortex-M33 and of the Arm China
STAR-MC1, a core compatible with it.

Gerard Marull-Paretas (2):
  dt-bindings: arm: cpus: Add Cortex-M33
  dt-bindings: arm: cpus: Add Arm China STAR-MC1

 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

