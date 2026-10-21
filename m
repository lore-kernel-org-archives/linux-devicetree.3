Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551733;
	b=CZjSdHFEaoER7Ey8KsKfEaKLUnkjWBgR5lo8V9GKh5+xxrfjHhNbCdHAQxPMtK0SnqGV
	 lrqJ027UGdYZTdcWYv8A1n+LeRwiFQXVG8Aw97HvLS953WVAbHF2RRC9Y7gVtUA1a0/P2
	 yRmZQ7KV/ehjJMpGd9lbQSWJdcJMZ0BhFZwT2asXTtLqennfVJPegOXmC2DvETvVqG4ty
	 txr1xCDW8SsNJcLNZduKkZ4Qh8MPR4kZgYTpUgx45wuWfGCOwKKW05Ug1VT1bM8Nvf+1y
	 nIpNrtnz0dOhh+dgCqxOaoBsK8ZER7Z6LFQTG7tS7pB7z5+f7u/8X65Gwtr2i13QuGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=sYgdukCmCibUvpEBINg7bzOA6USAWShO4Zuc75pQM4P0Nb3+PUM9zZ0o9lO6P/Tr/KNs
	 ImlrqIQ2eFXeQ+zvnHFLBRmrBKEPTTWMKuc2wc3zBOrB5XnjFBRONzM3TIZVLnvFMx3oA
	 iikadBU2Bv/r9tych2JgTYzySmoLdPsx95rvq20R+sR6e045AgNbSpIFkvI+2NmafGoYv
	 menjeDKe5Jm4Nai+DnjMXDgDikKgBi0JZwCkhbSyIgph+E1vW18LdkdNj6jvP4KnWXZ0n
	 /7ZIeajRi5irOEvEWSBgbGUHoMu1gnJA5ZVR2EE+I48hlaPePStUevez+kaLD5//atw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B47606A32A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B47606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35ef6b49813so338382eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551732; x=1793156532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=X8kWAAgGwp0SKv+CFS7ojR51KNSrqnta/qAkbfHkLtuT0riX+O6xGeNfLd/TJMB+kt
         n//S5DfSTuB3UBax1bjyFY8/IedkMSGEBMUZDVleIyW9E4urbhooEfjcQcrDYB2UmeDb
         KXJdCDF5wSU1ufbez/VijPdHZeBSZ41H+EOHQGlh1gTl6qIfJv8VTfND/LHVohkMF1SK
         ScI+He46Fa3sLjoabRoa7RO5t95OBKUFWrkUzn9Xgglz6+Ua2q+pye8dDH5hpJ7ZPO85
         5wJ+jvaQuRjgGQwXvGDv+8FXxSdf/OLIK6nthEo+ioQZeF+YFfcjXjLPkkSix8CrD0zB
         8u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551732; x=1793156532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=Mb3UaCibtgbwptYhTK+bgz+KoUoC4r6q5mh3RwrFjcbwLgZu5Kyhtrtqokbn2SznIS
         DYVhyW21f0hcMQLXMoCXnGB77AQWdFwQlOb0blAENFoDCwNQp8djUHV4OwgoQ9hDKbXQ
         Avrrk4Ek0Bo33CBc1rEZTcojGOabNagG0VlkU9uHvHMbfGJ+Ytcql+tX8JnegpAbHZk5
         xHhxKfYAbxgdfg4Q+2Bb2FyDgvSEpNImImToLQHSBaP1rFW5g3tW4vMr/DmklhK7mo6J
         Bz70DbFh2oOclxvESwW7KHahhMIqGSWhuCDkNr1r4KEDBmx1biV0qGaZsmPexeNtxCqL
         UAwA==
X-Forwarded-Encrypted: i=1; AKwUvBwS6nv+h5appgzsMDcpxAxTOXwpVdte+8rik7XWMK+lGyIuKUT3kpwIqAKwnfN2MZ1WtM+Wcf0HUDfm@vger.kernel.org
X-Gm-Message-State: AFq9FYJHaStlp++QfO2bxyCW1J19zIRGoaV+rWGALMiF+NXZQD1xHYts
	22iI5lpDjgUGPK2yTpq7SMLAD3XOIG7Wxm0ae+XGUWDDGjg9dTBoE8W5j9jmYA97zN9KrUy0RFH
	7gr4r3aU=
X-Gm-Gg: AYBFou3pWrhjqeRQOnEzD2bTDUlTrNmeaEpifxRldhKiWjvQrZZ6liF7FM/Y9NNMxBg
	2Zy3dvg+YrGUkTbtyiayie0REO6tZpT7CHCRDtL8V+NGpFp+DhLXCZ3N7hx22UkBE/KCeBAItyU
	vKUBdMjgTCWWJU9P0P8gc0ctEar30qqB5PAEJVVkfzEw5IbHf2gPzriw5VR9cl3ap1oERsMkjoc
	8a/Bjb1rZ7yab1U83NiQ8hzabb+UlOExoxdIukGdVjRlU9K1NCG4NxNCk/z4kZH67ccOFik7/+q
	T4qd2g8cfW08c9C6NzaAJxW5ErC3qg1ip9Sgu/uK3kO7XjRS4IuZ2f4BHZoXKbwtadvyvcdr1qN
	1gEDCWal0a5kdWXFiLo8OOgbMdA2Pt/dT0FP2+BmRBJZyky0WV0Iy5+uSau99Eom6qPTti5GeUX
	Ob2LEtp7d3tdkYiV6rDY64z21x9kViQ/Lc/NvQ2mmObbMJJMyOfUFQ9oikN0GYC0c67BrCkzQQd
	m+zHVe4AAMdkJR9nZTOm7gZDe15cmRBgk+0bdhzwjR0k1uT3J6dUs/jZcBzov1cznVVXzkGQKZP
	UXCE
X-Received: by 2002:a05:7300:80d6:b0:35d:2c2b:215a with SMTP id 5a478bee46e88-3674f11d996mr1956331eec.35.1792551732270;
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:10 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:05 -0700
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=rko2sOAQYQ6YKmixqBcMieuEhqCema6ugmvbB19RSjqYLJ6NH3/YxenCEWl9qOkYndCiSaPqT
 niDkVQkKgGdD5uBHGU+odEvuQ/LIugQuoWlYefGKh2frpz7WWdi9J/6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

