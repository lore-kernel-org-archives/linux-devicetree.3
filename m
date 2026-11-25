Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606770;
	b=p9uLZX2iCmG3PgrGC38SN/MAjNmGEQ0XcjBCdrWRUb5EhgvzNvKpqkbGiu8UAGvyqf2x
	 JALwkflhZcVhJDhD0z4UArp8ja+BRo6efKkXwA8Aq7dj0MPWokxa2BkbhhfmIldkdMurB
	 CrHemd6dL0HkDXEZlXzfRCWeleqfs+g7I/24KaSOgpk3f2bmMOKs98z7keiq/RJ22A6dd
	 1/VzOuiGWvG9VCS4iG3K3VUaTu9+0YQcKKNJNaGzh6ZFrFSFWc40pIXhSijptraceRqAX
	 kZa+XNkhpqyqerXYiVTAkhShekBLBbrlzmnUnLm4Tpm/pTRJBpoFdEAq6a6/elP616g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
	b=HOEtZZ61VyrxtPE3eJE0dBBamJWl9iGaNzkYsolcCONAHriB/NlScegkfN59mFUxESJF
	 pyEPZUtwr4x5FvqlCxx4Du4wQplfMaRznVWEG5wlfaZnSIjMrHhvVAQlCX7/dWzIAIv9w
	 N16e7DEusHx73JHhwtkTCnpHT1mCtKghZjNXX+KAq9DkLC3KMID3P6PD7lJhmPAXlkRCv
	 sCKphniyibyfTys2dg+TZ+FlXcDbXuDhbhm+WJRlv4YIGqucm01dL717UguCc9b/x4AlI
	 lnFUASZlTy1dtrMVIfUHpKHNvfv2+OLNqRiJvdLoHB/rvZJ1AslOrx+c6OFw/P4mhnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLdYuZK2;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CC1606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CC1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLdYuZK2
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3771488c88.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606770; x=1796211570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
        b=wLdYuZK24CLrvW+n3f47RCx3wU/MjXXoXy6OmrDfjffZia7mG/ZtXo2y+4VjSEqov4
         362CWzCEW4NW7oQeTW6YHV+nNfj+jRWKGsvupR4DLAfo25g4bAm327VEN29pmgrA6MyI
         vuCEKP77avX+BtUayj+j0ARPSwS6anO8okAQJ1qz6s9H5x+HxuFyvf0jpr9vLhtnii+T
         d0sq34o9fC26729t15xhi4Uz0++eXq3KoWJsuhezvOQoCAWpn4stm4c/yCt5L+XPFujZ
         vaMukgNhHWo5yKN9IdR7Hx04yga4V7KqSx4hFCoJXS98pNGi8LseoXwZJckBhWAOgc2w
         1nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606770; x=1796211570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
        b=oWEClT1J5PzVaXjbt85Ywi1UCYaHXKX4P5uK2hJjLktEVNMvws4PKJ3k0z2d30Pa9r
         xmcIP2wjIHpYCWqAHmSnTXrF0NOWaebbFqcH2ShW2nFzlZUR5vPByUgzFi65mnXHBODO
         C5qDDwzt7VQyMFqynDLi641jYEkzGbyFnMGMZYwvWELesGdzklWVtaHicD7FHOyTKncH
         KDEXfSpkDi2hlDb25e1JTTkFqUCxzpX2wCaA/6viiUNL/kWraB+jOSxW3+MhGIImdcpD
         ySa+7f3kYBd1hSw//RQKEK45PvBLwtMwseF0OB7RMDtxNFwFfD8FO54PrkJbHJ1epF0I
         8JmA==
X-Forwarded-Encrypted: i=1; AL+hErGPDbwin8PiJary0od5187jKPRd3KZo0/+YvnM+KVWn/FR+3CEI0vP4Nr+n5GStFIB7HxU5e6dmV3DH@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDWhTnfzdB9OPchIrc5mRKJFK8ey2mFwlHtFQCtCMe8SjvrHa
	lIb8HYoG/3SxIZIc58h1kiEHNWzoZ1wiuv9PYj7YAwHNJyeZCgubfhlb
X-Gm-Gg: AZFdTZfTv7ZJH91WGoos2J2sOU9qNPWXzp3VnaROPSXNtRdkK0tjS6PxfI65GJK2fJ3
	ht2yRxQc5I/HwCJI8r5u1JOZLUtsXVhBw4bGh3lNSjIaEHkXiqfCdDLyuZeCFy823tx63GVXhOn
	mLTrJwC2MY+gENK1vYvyOaEaGXIumXAZ6Uob91JrdGFvb8fJkMgNVdjR/E3fxuhaupUgKkWqiGH
	i2bgWoaNIqHgNErKhYgl8ZY8MUrcs/3AtwCn7G1CGnOOS8BuF7jZdN5shhr+4Aw3fOzLFd5ZKHA
	Vjoe8Ofscw+qh21ZwhCNhRRbhSgaJpqEh6gBIhg5PX9HMZUzZYdHHnP9XCTpNnmy6SOVO8coRMe
	8+AzVFirmVNm8kyrik174PMZbl/1EWn72bm1bdrH0DcCH4xns5g/fUMkwOgyjji+Mqt7tOxOHhC
	TKFVY678gaL5KFHL2tO8Cqw2xOnXiamomy8/1zxQCFiKDuvv+a+LD1MCHLynygmtDCPV6xu6zKf
	WsRqnzOQLkAZu9M4fKxXy+GWHlW0eMaP6jHMToxfjo5pwsM+vBuizAdMpdp/j4Y9oVAHOzleoGm
	TZ5f2LG597WZvZhP1ENVgZC0XTV7E/S4pEGvvJQCj25A+1Y=
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr17106600c88.4.1795606769639;
        Wed, 25 Nov 2026 03:39:29 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:29 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Wed, 25 Nov 2026 17:08:43 +0530
Message-Id: <20261125113845.297658-2-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125113845.297658-1-dineshkumarv85@gmail.com>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
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

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..162a4a9d8c18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -68,6 +68,8 @@ patternProperties:
     description: Analog Devices, Inc.
   "^adieng,.*":
     description: ADI Engineering, Inc.
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^admatec,.*":
     description: admatec GmbH
   "^advantech,.*":
-- 
2.25.1

