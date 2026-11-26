Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660741;
	b=Z5GLZpZ3L9pTh+FwJrWLaryJ8S0mT78FTLxMjCjHe1s0AHOf19pGpn8n1CqORBoE7LEt
	 3z6xTzk4r8Z/Ff+7nSLz9MTJRwfj2PcylIHm1ATAcDQlo+Pw9Y0LxmJGWNEFNym+ndoOb
	 opiSYWNsbPCnRjB3W41QLfKHcmqfsDvPgdfaIi9Tn5kRW2evprEVaaLrcb9eiezjenjVr
	 2h2TP3UUTp/HWTuuEx5WgV123kR/ZAY/KAxBsHK2rbygNG7vDEn6MlW9v4IXIqdT2Ord8
	 B6xT0v4dpkYb/Nn51EEaLVoB88VaTd8HuNa17tZxRK0MpUtue/9/+bQ/phCAC9h4XlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bm/bUp7RlKkBT/8X38VbZu3Ft5/2WN63tbel6a0QUxM=;
	b=JplACY2+hdDNc901HzGECcTFkTeUK7W4uH7mo+AXePEf9DBPSnGVjw0FHSMIENnjfiY8
	 nwCm4F0FhfIVYa53AMyTRBf8xAP49jZZ8YkJbHqqW1Y1H/5q7XJkBHdpoNJ52XrgEAWKX
	 Isx4MkYpcDepeoZx05oOnLHehWfjLboG7x66m+Fnv22BrbTVZhdvuX+VTSUOSJFA3NNh6
	 kinIxf3fYTgz+7sG3YylUzFi91wj/qjzuaLRgesEWQGc6N/KCspTB5/jc59t2G8kkSzTc
	 ivXVSudIwRKH7zcjvpp5VtW2rIJAxZ3ZzM8zPjRQ29U7BPs7j/OPqg+MKCzwlaeoDPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8t2buJZ;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4124A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8t2buJZ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso3493298a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660741; x=1796265541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bm/bUp7RlKkBT/8X38VbZu3Ft5/2WN63tbel6a0QUxM=;
        b=l8t2buJZHeLyktmdJHxJyyVosC+gpje9EDmrnIe5yh+iPn3Owev9CG/8z6Juz/sitc
         YqgTxAizJiLKaVTKv+KmDwCje4IIUFnV2KY04RwzPRZcoruu+Y3f2uRvBON6pqcbC66w
         obcLB4FB8byXGfRGZQj63Yep0sxzSJuI0Xo+IMQpD0+lNTv3TxZGSnYRC6lqqLgmSidB
         rcM48TH+UgkTDGbrWc5aEWUmneh2mUZSHAX6CGLKcjNX56MMv5oT1qN8+gqy1LuvNHuv
         gvr/6Sy1KWs4NkcciRaiobW7kY4olvRci/4jQtEpJvSlagqBJs9jDc2KUSaMbelWZ3+X
         Jo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660741; x=1796265541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bm/bUp7RlKkBT/8X38VbZu3Ft5/2WN63tbel6a0QUxM=;
        b=FgzAyYsh6rgeYw4Xlzk/96WskLPFbTTVI7EGeClU5iUv0h9jG7tbDKJLWkPfNJDoQq
         QqwtZoqQ0AJAoYPJMLgrxrTRDRcen0+nN5cLZzQNcf0lDcaQQxEDn9PE9/IH2u5KmC73
         BkDQ9lsxd83F/3tteWhRB+j/4jooxJ1U8kR6dfFw58OsvrgdldIzeVXbM1wgm6atNtOi
         /xq54RbRccvln/kjGeKLj/u/ITwKBCB+R8hTw9IlNtFoFZkq3vDpariVIipc38vW/yUU
         KzpvRCH/dfEuFqHiDdWxdO73S7g52/SQ7Y3QKM0HKREXvwZzI953+xqHBdVI2+Du3TPH
         kTEA==
X-Gm-Message-State: APuU4Z+y6lWgxPEDthgK5RkCDfV/t/yk83FgwxSUXAqVVYNoxGvIham9
	DwKw+g4n0QDd34ZpCrsRGHtSgpIC8lB3t+YAKhzHfbNcAf5AYZ3JmJ074MUNlw==
X-Gm-Gg: AZFdTZeumL1//81jdzPP+/N2x8cn1rUwPQzcfcK+Ya7C1IiR++LQx833MPh+MeU9jp5
	QF32lDyPiqMjt1Bko03HEw3T2jiAXXdU5PSgPQlIJkft5Duhf2y7dW5BRpopJt95tPzvm061b9d
	QJ5W5UXKdtbbvv8T2dMjzrC68VndF0amHMO9q8AA5mGT17pMqY1zA+vxcx61vcwRsk8cRfkT7a+
	Blzo+yXGjpnir4S/TNRQvMqSAVZ5LHZUgexOzRVD7jw2TlM1HFETlbWzHQZV4eABGQwYdk8zaa9
	u4OmG/+k6fnmcuCiS3DY3Dz6kfPKHObCvk8iYnpB5vmbUBqNghmJTcdubRw5IRsmXfF6Eq8H88/
	DypmxwD/Fu3PjRlm0P0qgA8Cco8ZHB/ZAYTZ9BBoFBhxS1k0zS6obItBpMsvGPGSpZgK0aobHkP
	MfYyMDxMpKqEfCTW4Eo5Whjciuo9FyxcgLVC2voqaIW5mJQaxTkYMIFGgHCMZcT6dS0YKpNru7H
	71/J0QyhvUR+zcKFckGlNVBerUsiB03rNnnO455wFpyWk6bIYrBZN/f7RrGE13TIGp+bKZ9KsAl
	ONhjOqPpaAkOZghbJlb0vIhaYqbkOCW6OPxtxpc8OR+W/OGGLKN/u0c7prYGSGkj35jFqspz1fQ
	glsjqXeeq6QoJzysZqIPqVaVBzkFudPSmFFUt24U99b58Yn9Pi9GpRVix3Rr1gdSsUyUnVPlI6b
	WHgw==
X-Received: by 2002:a17:90a:ec88:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b41c7b572bmr17367824a91.5.1795660740619;
        Wed, 25 Nov 2026 18:39:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 1/7] ARM: dts: helios4: fix board revision GPIO polarity
Date: Wed, 25 Nov 2026 18:38:50 -0800
Message-ID: <20261126023856.767961-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
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

The board revision is strapped on PCA9655 I/O0_0 and I/O0_1 with plain
resistors, so a strap pulled to 3V3 reads as 1:

  R1.1: I/O0_0 = 0 (R67 pull-down), I/O0_1 = 0 (R66 pull-down)
  R1.2: I/O0_0 = 1 (R110 pull-up, R67 not fitted), I/O0_1 = 0 (R66)

The hogs describe both lines as GPIO_ACTIVE_LOW, so the logical values
are inverted: R1.1 reports 3 and R1.2 reports 2. Describe them as
active high so the logical value matches the strap.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 9c106633b2b9..965e9972c9d6 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -181,13 +181,13 @@ expander0: gpio-expander@20 {
 
 					board-rev-bit-0-hog {
 						gpio-hog;
-						gpios = <0 GPIO_ACTIVE_LOW>;
+						gpios = <0 GPIO_ACTIVE_HIGH>;
 						input;
 						line-name = "board-rev-0";
 					};
 					board-rev-bit-1-hog {
 						gpio-hog;
-						gpios = <1 GPIO_ACTIVE_LOW>;
+						gpios = <1 GPIO_ACTIVE_HIGH>;
 						input;
 						line-name = "board-rev-1";
 					};
-- 
2.56.1

