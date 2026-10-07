Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9F45A287
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363320; cv=none; b=NAKIZOhIEaXoXLX3AqCUTwvbj311MfKP7ozd21tCs+zZynGjVakUy4QFknffdqkWrxHbyhZOLG3qihXc4LfiyORommJ4Vy3nhLf4fNjSWqOnZD8JoWUKGC/R9VAoqRncP83mThVtSHX0Hli4yBIhJPz/d7zm3a5Irle21Tou8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363320; c=relaxed/simple;
	bh=mPskxgPYuAfFCQnnk7Iss6E+WGp/8ax+HTOK+Gc69q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgX8cYOt9ienCY1aVUTjlcb1zJlrBDE4DprOY3yBTQbSNPcIZDN6qr7/pDylMqxOJdjcYqEhiA3jbWd5GsROpmfCOl4gifjL2hfD/o2Re4slXl6a3YSZ562RjfVCyI/qDK0cfjJhXatyj+ZR1tAqy+cbGNJpnL+7mHgqIEwpGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRksqhwZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRksqhwZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso9612615e9.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363318; x=1791968118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jterHqkHpEJwSt6BwIj0mPjeE25maw/i/K8J/m2dFZA=;
        b=gRksqhwZoSaM2tItOMQpnup+rLuQRgKtui6OWtZiht0A6lhlOpdFsvFODijpYrPmbq
         H2ISNGmjZ41kym3vX0HD1aAKAakmW0fjJCyX1h4EWY3Of7gRdlzib8QTHgov179HdRfX
         OHEvboFtaLpjaoF4F+IB0uhWY2F8C4/J3aSLYU8/KOtJAvtFoA+dy68ahs6RI2+ZKDRf
         dRQNH2g5+WBP34DjCK2ZEpG1M3tKvAESvoOYNtiL1k2ES/cNavi/RLwsHdcKgH3c217s
         OgAEPX+pVbz9JDXJgSjqITBWRZ3G/ZQc/PMPi7JbUxfTNE2fR1wLN5HahoDuVQP7OUyl
         aYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363318; x=1791968118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jterHqkHpEJwSt6BwIj0mPjeE25maw/i/K8J/m2dFZA=;
        b=izw8dsVijp6jrO+L3wbOUMVUt3hzPcWSThZQmy+dZOb12f646cEDYYpfuUki9M6Upn
         AYd0SPDeoQTPCje+XvBtnNbtz+67PpWnZk5vjU/uWsSO201bsYOAYEWIOA/80j0oQ0/R
         sTS0mFrjOrxi3j9ufrkYgz4jQSynp5PJerOjl8+FyJmn3raQGJkis3pTiWZX5d1mZ2JZ
         teubWF9aBwRAT9uxYwHQirBh0N0Bf4iqhxrUzpx0xN3sQhQk0XKGEB+QLlJiC4ZSTSV7
         iedGohVYlXg7iwgYGi5Lac42BbSwcPNK4hwjdo9RWy/gEek1rq2ApUvdavbYAID7mfTE
         hd/Q==
X-Forwarded-Encrypted: i=1; AKwUvByTlpbr+up2PMYy0kr0EnVqpuCnHM6499Fnn767T8wQI8Asn/bwFk0k67WubbpFldQMTl/MzLbeSA5D@vger.kernel.org
X-Gm-Message-State: AFuF++lV0ZYSW2thgaSt5ZfGJBGwZ3oaJWlFwzIb8tF6hlIcsRcdCQOU
	KEKLSw0f9c7pKYGFf/BA3rC6K5wrjF4JEIuJ7mVkpO7iMG0zU5NEFqfIaHI7cw==
X-Gm-Gg: AYBFou1utGGdpuQw/pWKvGdUbbFhSgmOXGpwa1sAFgSuNeNAnwxXShKDcfZCQZlhwBU
	Oi769FIdZtyUnteB6cd3YzyP/8IIeq1xG1Eo14KILH7/bG5UX131nCaiF0fXk7NZ+db3PBqFSUR
	3Wo/p/J+lcO8n7nbJSaqF07C35V+tJYC7X42+6ZdaLXeWW6jTVfdR9lYnEYEI8Y2e4me8EdNAfI
	d+OMe67Nen4Xo01ppvYGxdcwZ+9XORzQTMICH16USEspVPJ+AB0B10EffDMAZN1XWkoYX4kT0yh
	/iFOxgF83uc2jaMqN4jLS8ftuOgzH4MnH4DwyAmkjWbVLVqirSuSrgKMFHYYNG1sXBVN0cM1mmv
	sGiP96ffI3S2LwuJ5ZgZwnkT3AmGNazWmynY923W/QddPQmEbfEN0FLZp6HvTim5gaEToWCz2fy
	jQqyroOY45HMwZaMuZpvP6FIlUBx4ft6+b/h+JS1zw7FFxU+AHO2C3k2L+eYaZESZDkI0+tt2H5
	NEqiSfwcPbH5x1AzL0=
X-Received: by 2002:a05:600c:3b86:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18043c2a2mr27179375e9.24.1791363317558;
        Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current Regulator for Flash LEDs
Date: Wed,  7 Oct 2026 11:54:55 +0300
Message-ID: <20261007085457.98762-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007085457.98762-1-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT1270 Current Regulator for Flash LEDs has a similar configuration
to the AAT1290, but it uses a different programming model and requires a
separate compatible.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 65576dfdca110..a65d92522c9cf 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: skyworks,aat1290
+    enum:
+      - skyworks,aat1290
+      - skyworks,aat1270
 
   enset-gpios:
     maxItems: 1
-- 
2.53.0

