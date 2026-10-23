Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743296;
	b=0lyDlK41eoHv5xLqVK5p+J+PRLyAfB/uYiueFxCiww6w9r3+PqfwZnISvfQU80DgLUsC
	 JtnL86DgxFPuieW9NGhTo0oIrukD8Pf2Nu+IW0A3AHW3l1Tcj0vPh1Ai+z5tzFLy2f6LG
	 vuEojLA45tNGBQo7RKLjvovtjPzOo4I6jpYKycj5qhMy/ys93Mn/JQWB4aSoeoMFlevfk
	 1QdLZqrxM8oRrfpsZD4dk1Tx7OtxC54Hrq5mzbVlD4JpSyBIY/G4zNdou/mWIVxc34DcZ
	 DJGHogDn3kMOjYiPYAupw17XEROUt/vUrWYdZS7Up1IpQSdBsznZNISegftSPMVTv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UGEEbQODlbgW0yPm65/XdY1OQhVeHk40cgCxWPCDAvQ=;
	b=nJckhBzHnzJSavomnNaSqia2EBHcPiiN4K1O2VckiBULU5eWgBolHVYdj9mWoSUMCfrL
	 TddpFJhIgQkey3pOIi3mrqVX1A6XlXq2JURN4rU5M0WD3/IpeTCJpJLtZpwghHKEEpngA
	 a5wawuGmOltdXzfafbz4GWIhYuMcEOPizOmODFNrWj9ZFxDj2tHefNIDiW5fLA+7TDb2m
	 +u7upTNkA3jKf7VK5EdZ0CEHjXgPEUJQhqe6fkkJQvh2lHGkWMqvPFGdtl+f6KgTGlh4U
	 v89icbhr91mJOg4LSYwp/OdDwD5h2aXXhRSRh4hJK2TdUOtiPP95gi8xZIcb74Isvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=RwWSAlOZ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65846606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65846606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=RwWSAlOZ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a218b13c4bso477455e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743294; x=1793348094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGEEbQODlbgW0yPm65/XdY1OQhVeHk40cgCxWPCDAvQ=;
        b=RwWSAlOZ0lTu+017KZB6a1UjhzgaO7n9HVMaX17iFwvj2CJyXZDUspatdQnBdBQe5k
         7OEqo9jjaTVb+z+ZZocORSeA7Ugb/UKlcGyrXJ1o+IeferTmxiNUqMCb5/yLtGasl8Qw
         rb8/0tD7iGGDO/IlC5HjMzKuc/777xosMT9jzMKaD7YSf6llXEjq9U0Q7KW2jup2HbrP
         DizD/FKCvUn5vwuHuixUeWObzTOGBo8IFvYCApRPL0vSPnzkuRixXUtkNtRiHo6R7PeH
         OThHsOypvriFvPvdzKp1lG57r27Ex4R2niXj5UWWGx5NL1/HDd++Nx1t+pAKXCbaQCUD
         IWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743294; x=1793348094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGEEbQODlbgW0yPm65/XdY1OQhVeHk40cgCxWPCDAvQ=;
        b=VbRmZIJSgL+XMNhutNzsY8hoVhH+U2z4BWzpL6To5u1unR3gilRhE8Ekrb7YyEkLTF
         otpZI7M428JF4/OSBGOEckocMOKJ9feGbx1oZTLXEUfPYRLLVxL+rPBCd3uru9FjBhdx
         uP2exOdHNYLK7dnEMcIycqti3wmYAaWnGmSjlUCr1SWkr0UeoMcCpWpoAmIME8k4Ql4i
         Nbk9GQno0QhlyFJI7/lT2Wr9+/eaM/6+bl/QTpm5Kb3uCIaROE7zAbilmoD8BSYjfY2M
         TVeZpdJRWTpltu84VmcYZjJX6nu7ai1QJJXBZus0ImiJ+rrbPMoyMieat+oepecY8lPw
         aFGA==
X-Forwarded-Encrypted: i=1; AKwUvBzXbQPJbBgeU0fRW4/RFu1Zl1TaS4qAPmQJ9SR/g623c1gktgZMvhzBg2N5VX1w87aCVKqduMCcpwFa@vger.kernel.org
X-Gm-Message-State: AFq9FYIgAeNiV/d5vtXH8UormC07bXV91UeN+DwhJk6jmoWsPHF2OBOJ
	nlX4VyONkCsG6i0UkMZjVCKq9ZfNsiUyB2fi3YmQr18O8YnvjAzRoh2EbeF2ezMwV58=
X-Gm-Gg: AYBFou327GBVbyXDleK1DJ8+F9GQ3p6Afu6HU5SheXwESsP8sI6CMK/sNmw+zshBBXZ
	FrhYHltKT/sxlL6VrU54v2EB24quMo65Dv5hEGCHXKtHjRA9p1Ad4m6DHM/A0Qden7RR+8p1d/k
	ElGC0DH2ZfgitFctMxnXg2F/rwoPc9NeI72WKN+h3j8RiYTFPm/MzA0ezEJ6KlYPFUJO8ZHtmC7
	KHJrrrJ+6ZtFs/lxdGf9YXh6ZQ2pf+z+saxIydMr+EpS+dj4jiCculOcQRya7o/kHXYDwwuWcg2
	eFjzfn1JUAzJhnGZd3NpLheoz1YaZeGSH/DsG0ky5v8fe+1Al+eGe4+XgboXPrGr7k9594mBn3K
	bcQEjVde11cllCNRMjIBCwpqRzkfTsYZdfh6RCyLqHXCOHEvqWaBVEV3bU8TRVTuhwXkYZYpTmx
	DaHk5dQWU4xBsWkPqzcEvJlG2W+Y0vZ2r5rX2GfO5KPiPYIpcFhPiqrb9Kng0/25AnoHZ4Sano+
	a+XPQb5FnM6QKB6i4XH811AqIsoGGUqGq0vhhA5+YCBuNxB7jARDvBIwKwaH1mZ/bzdsOVBp2ci
	05dLMGzxTZFpbE+/DBtYrSzYvXs//Hu+cQ==
X-Received: by 2002:a05:600c:3e15:b0:4a1:dc8e:edc1 with SMTP id 5b1f17b1804b1-4a211b4ab4emr23850455e9.0.1792743293730;
        Fri, 23 Oct 2026 01:14:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3804450bsm3520690f8f.30.2026.10.23.01.14.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:53 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Fri, 23 Oct 2026 10:14:51 +0200
Message-ID: <20261023081452.44118-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's I2C controller is the X1000's, except for the register that
holds the SDA set-up time (see the next patch). Give it its own
compatible, with no fallback: a driver that doesn't know the X1600 would
program the wrong register.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index b61fdc9548d8..43de2856bf0e 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - ingenic,jz4770-i2c
           - ingenic,x1000-i2c
+          - ingenic,x1600-i2c
       - items:
           - const: ingenic,jz4780-i2c
           - const: ingenic,jz4770-i2c

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

