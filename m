Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743298;
	b=0bGgsaeGeecE/Xv6PEh3zrlUGpAzeyPaaeJv4CQw6q7XWKDaHz6o5thHgR/XiGZ7+oMI
	 kV2hVOD4xBLSupoL6WDFSPuXFZmhrLaQqHfufUuOhZqxVG5XF2/wfvbfuJ9rDxIx2WEYY
	 aBzVH2LKr5fO+PHRL+pfL6EJrMSFIm6V5t50n/nSMqHoa95XciaYI6UDSIKWTlhiwZqCj
	 rDcQL9x2nIuHLZzNfCSYUM4XfnuQBrMex3AtmpLs18kZzWXRYhyr3bNQMnJnzsS3eJ2oe
	 wab0PNF1nd6cVSIf8+tm/jMog3/js6Tdj/pNJBcQqOYu4jtsuveekBNjKCpTXSEACpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
	b=498yT57WkBl8AI+zzwo+ZOoSuje7QY6KEfvA6Jl1nW6AO3hxHz8nhiYvzGv0+OmDqLSJ
	 ER6dIomWpIprbtrnWgH5VPfhrSUy/G9feb3qGVbUR5rubkjuSOi7Wgs1nDgnQ8Q7T2UHl
	 DaKg4ZJU1c04nJuj9nlfGQHHjCMiiQ1DtQgLUJ/dLvhlAafE7e+wf897g9gjpNeDRbg5a
	 +H4Y/gnWlxasWvdhOKMkzPJmddaxQ9dyiE+WIMnlL/2tzsCP0m0ZIjoZLRoV4l67jCA6A
	 dGjhYKsO+TYbL2Zr1vjU3P+ZhRr6bfsLkn6PP30ir4a0dik/xPJzwWVkxo1HM6o3hTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=shrSCUWD;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D55606A339
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D55606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=shrSCUWD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so4474025e9.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743296; x=1793348096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
        b=shrSCUWDJO3P86ZUe+xzX8Ud7eisYtxJcj9uofLLJ0hu1+6qrcydcuj5pCMw+qhbFW
         BMI0NjQs39Q7yR6s3u2OTCVxFEHFRoi8rKQLw9LG3unM0mx17deWNESOuTc8fuWb0enT
         RKgXziX0Frbk+5yG7fBd5NVTFRtmN8EvtT+m/hPZnmJCEbvG1XAMiM+o367yoIGYIhVU
         3zUaZbsQh1Jl3L6ZkLQVWVQsxo/yq98347ztXF1kYqZet51x0PMy/xMlABoYRbGIkbcW
         9SB5fKsXww1kAs5iIf3XcCEu/z4jKS0D/cIvYdeRGcJYjQUPZvZ6V2DnN3Jar+4etsSX
         TWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743296; x=1793348096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
        b=u5V8Mgi5HuRxLbyh2oPBT4vNpFINq77Dv2IFTp1YJONWkUatFcfC6m4a5jyg24Oio3
         tYigAhpylm3X6i5qawamk3fQn6bYS1IPPboyzIwfv80FziDmZCSfp9M1aX/HJdjcilWs
         EsNHlg+7MnijgipogTE61CxudVO1RczYIm4h530n7BdKhP8A9SoR6YM1IMZ9j9Z9krHD
         9Jd7azrm4NIwV0OvCfIuX0+B+LI/RQ9wT5h7Cu+RI0J7+uKqtXH4ONWQFd0GCkFUBc74
         WNfD/UgVxp/lgsaMSjQh4V+G5oO/ugdurz1GdQ/rr0gXLFdnvtiPyRqBgUmfgmf8/oIo
         ijXA==
X-Forwarded-Encrypted: i=1; AKwUvBykvF9GvKKsjbY7TNHxCSKv5077HNNlsxOIYu07SI90VegFdDxYkjpg7roHDrk7yl/lJ/lABGsjFrE6@vger.kernel.org
X-Gm-Message-State: AFq9FYLCajdyPAFhrvrIRNrlG5/3e/RFP/gozKUn1hhTTGfuDWgRoeMo
	aE77OeC6va2Q10Eg0Ntma57xnNKd3ynDBvWwurZlpec8Lsy4E8itjvvLhd8LZmS2Fqo=
X-Gm-Gg: AYBFou30XyarsA9iSbJ/liyg60DmkVxDuTqNvH08jV6a9O6ZogwGgHjYltz4xoyERGx
	qt5Z39vnbSl55eOhYcLV3F4tq22cMyQ5ey46yqMKyHp+2iUvBbRhpKVJI2OtibqohsMNyVilF09
	le1S5ca6H5KLNfwAw33CS5Tnm8UkrRaTDuTcNV7l+Bal9fl06k2jD81EeTB6wQ2gI6/EO+/ifWe
	BM2dX3sTFUuhV983Ryc9UY7dtQ6pJTDTyc/Eknt7E3GS3Cl5FJ1COLrdNB3/0xpjOLWhJFEpKMC
	ned+MHIMNfm/hgNX+/+fnCetltppEZ2DxDwW880tGx6avFNPr2kjpP4Vvn/YQa9IoEz/uQ9Z46c
	Yw/7K8BhNmOWhcYo5vol5u7vjNdBIs0+15m+ls7LAWrzqVptwvxDrHvx7IhJ22Lo7TP11uFw0QU
	oUSHKVOwuhk8Mam0BrpWR1H0KVSJupr5A0b40qMlTb5XFP7ymxMNZuDyyEUgLN9acROpWHRZ9KV
	3uKhpbNbXGAkw5PvXUPCjAy01of+b7Yn3E0GXfk06IPz4X0kYYSFtWK253JfdJ4lAyOUWLI95cz
	4AOoXVG+ew9l
X-Received: by 2002:a05:600c:c87:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a211ca674amr24100465e9.16.1792743296063;
        Fri, 23 Oct 2026 01:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm55750745e9.13.2026.10.23.01.14.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:55 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Fri, 23 Oct 2026 10:14:53 +0200
Message-ID: <20261023081454.44350-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, but its bit clock divider register
differs (see the next patch). Give it its own compatible, with no
fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d15c000f14e1..9ca75fb80f45 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -24,6 +24,7 @@ properties:
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
           - ingenic,x1000-i2s
+          - ingenic,x1600-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

