Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=QZhE89QCo5l/Aliz/RKrzvt6D6FPGO8shrTDxE5ltmgH8X8Al20d0tc3jTQwnitFY7x1
	 M4EcFttM0mS5mWVk5FhsemBkmbJjKF6lopgmi/O3UQ5n1R1L2uS4yt+7Jh9CsvY7/C6F0
	 f/D9DvNtD0MWUPKANxVbkOoEY8SxaalzaaUKPsLHILvga4CmzrmsyoEi/43c3I0xo1Sg3
	 bt9sQnE6oP6T8eHhU+Q+J83qihi5ccV17tl1wKkZ4/n3R+hEHyIH3sB2UuGaid0hVYMxa
	 LpvhbtbVQwgiyrehID16znswQuOlu/UdMxXhxgOFz8adw63F0bRKATHTysiTI7MnK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
	b=bd2/wtfMSJS9cMVvwcvcZiqagdvFe+BILkPJMgKlY5Kz4swiwl7Pae7jRgAiB/OPtQkg
	 ytRofOiAh2Cl/QuMD0at4EQnpbJfbRkMkSWECz0GgROdbnJy5bpBwqGVjrOJqh3P/wiS3
	 gPYkXDZThJxz/iMBNpjqJ5dsug6ZJJeXaRNsvvvWrdmWFUvRhGIePRKrWIOe10Zxvm2cH
	 bob7utb94ADKGYx2bpC3mLbU+bFcD+sYc5zlTeFsxb77KVTvMx5mZpIHuJUNUffj3/MnD
	 PFqecwP+HMZ7d4AkaEZyrmhO7xzAApBGPeA1giZ5m6HyiwY4E1sGHY3xnuxAeL/vnxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AX82UnaH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2222606D823
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2222606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AX82UnaH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso38255495e9.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703926; x=1794308726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
        b=AX82UnaHveKFu27kwlvcNVZuKPygPezKyBWWrEMVqVO5FG/Zo0PMTzltQpI9KqFKxV
         A1o+IIr5VeLE9Pj91JlS/ogow+QO3x1IFrYSFIV2jaz8DZQqGFgLmhegGNLQI4g8j+AS
         KS2v1FvI0x+REACEPa3W0dxoH0uDAiyDkFCZCfRD8VfuAKf7zssMc6S1BbiF6PyMps+A
         P+bPCbb120Si8hiwz0h57KzA/4s2vDnZ0LYzeUg5bqrxCriIbY0L45etqSwBqPUjmeXR
         Zd6yogR1911yCkFHxUaX4KfrM+ljgRaHKJA5WeN+CVkyk5Xw605Nst68l4h0aWkSXQA9
         1Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703926; x=1794308726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
        b=enkzOaKECDvO9XAHjeQxzi8+Mm9dxaWKMPVW2nb1oB/vvWgV4OO1bviurVBOuKFcXF
         TbaMWQHw5GxTG7Sz9fnZ8KB/xxG52govV/tf8vp4lH/lCJzLBXWcCAo7/5vPBoJ73pU7
         lrPgJHrMVOXAukKHwzmAmNSMTz/N7lMT+31BGeeMip11Dxm6KBECwr3XPgwDWyLQha7X
         l6za8V/9fhhh6dRHwuArhjh+YgXVy/5ZqWSgG5ysElX/Qs2biqnd+oVnCjPFHzpVc8dR
         M7tj8IT+qDOWNz+yzvbVYZalQgJWafE5kV4mHQlcW4a3y5hPoTn1COUb8edmIAh7XlCi
         0Iew==
X-Forwarded-Encrypted: i=1; AKwUvBycX/qBPeLOrdag6Vm1+dvA1NcrlK2Ftk6IMGO53ZOhKO9A+SqFg46V1WWmiqk8b+PKanG1mCwethbP@vger.kernel.org
X-Gm-Message-State: APuU4Z/nNL6C9SqQzv9FPlizwLxqcjhkiepJepvr5TAwQczCK+GvXd08
	q0Omv/ZvSfZhAX6dkna2K9r8KNub2n5MSiS5LeUhNOVGOGZ7dgwMQDEH
X-Gm-Gg: AYBFou0VZX4+4H0pMzfyh1HftyCw1IaDgA+2NEGYMifYUQUoZXS0+v62oEGI3hH/c11
	d+mWugPcFMp8j59mywQyhf/tGgtkqJ4xA7CVWVilTtRiWIKDesshv5QdnGU3ZpIBedk8QEMv1c8
	xlYqCOq/kh9/eihEIHi3hA78znuoLkbw/a5yvXwJQaWP213/B7sVGcnLWMkPiA26TX56Gyj+y32
	GUHIhWI4ovbVYqiyA5SZg24T43W62Kn/DdXLiN9koxhSjgdo2Vwa92ly5HmI3oHTLDMrKy2YS15
	ZCuHA/maUXmIktjnW6WNHUyalysV7/SLAi7ZWRhniA4zP/EsKXm5lpsIsdeD9wVPX0AlV8qlmu0
	5eLXORBJfzfUXfN31xfBWP6ddFUDFR3fpKJfr+Z/IBcc+bYmYwLb+pBBqcFf9+Q1PRV0T6fDRxH
	kWecFEQa1wb6AgB+uQ1+Dn+r0317AGCuEdcTxzHPDWjkZwmGOoy8p0HfBlYX3BmeqrIMNq2O6bm
	3/Xafr+nlm9Lsm7qf1uEwzXqeIc4iKJIqXXBx4f1nACBEPXfhVjTdE4rpV/6YfWnHLybjUtltKf
	Cwzqo7mJPH6mKNjQRHhHQJ7iq+R6JFK3p9E4gTjkBvFnV7pusc3NAvcJTO16fT+GASWCXWKSV6P
	u6q7VmfyU+PexgKJQPmXMmD9k6OWy2HWit8Sp16pzF015BahcapJC97WSmLp9u8BzVAA=
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ac187a6960mr289278915e9.27.1793703926209;
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Date: Tue,  3 Nov 2026 12:05:21 +0100
Message-ID: <20261103110524.2812831-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

PocketGo is the brand of handheld game consoles such as the PocketGo S30
(Allwinner A33).

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..f538e6a27ec0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1339,6 +1339,8 @@ patternProperties:
     description: PNI Sensor Corporation
   "^pocketbook,.*":
     description: PocketBook International SA
+  "^pocketgo,.*":
+    description: PocketGo
   "^polaroid,.*":
     description: Polaroid Corporation
   "^polyhex,.*":
-- 
2.43.0

