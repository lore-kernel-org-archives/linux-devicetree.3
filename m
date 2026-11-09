Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227040;
	b=ylTdckv0Ad1w1tp5k3w1B+os08uxibSY0EDbKlAq+Uw5n4BwjMa4bqLZYkB3kI3sAX+x
	 v7x4nP2D410B+l7eVmkkO2yebzGcDVvMU3hZ5JQmoIJNZnX9ytamP0/MYZ9nMIoGv6tbG
	 xW9Lh3GAF7Z6Q9hQrbDj4YfResjJIQr14rZkS9ENyqZTpvhxw6/GdWZ3NLSBXXA+0iEz7
	 7de6cBRZ9QMpkSqDyeO/N0JSwz0PzWx7XOae3FOAfUdInBpCryPLFp3unRnVT59CSFXFj
	 YYFUA2/RctHr4nOj45mtBjUw2rz+lWTlKsI4fiTick2Up5L4sm9r+eqfAoVjX/4K5dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
	b=AUHNuykTsPNMLEitS3gznLwUBI8NWfaPW6Fa+AEEQ1Bxjdz0/xg29hGrdFGeTrBUWiXw
	 rVmx9rgwUQUNkM6A8fM0VPOeiS86L6B4FsDqCWH+LzmincbgYJQyIUyv95+0uHBN6t2E8
	 L1Y4Ud4kyQcPs0F9oKRuGxkFALZHYgPp7KIIGJJbtxly2jxghM9IsbkZSCq3qlxY9Jbj2
	 nvdvkUQPpTVouICzVZNHLl9iBkwDHOuDM9sI1HoSoSQaTpsdB6a9OkPsP0yEGJ9/JUlLZ
	 FAm7hNSc1m5gKVPpFpwyv+5e0Nw4mo8Hb6zIvUF/gyntcx3WE8lt2fZUPk+ek/t2nHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Llh3Zhni;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501D606D83B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C501D606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Llh3Zhni
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9585135e9.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227037; x=1794831837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=Llh3ZhninOo5lJzJxM6gigKSI5ZEtS1u/dVU2HlUp8JckOS8+NFZQj4GJzxgzcbyP8
         GbhVb1tYWKiWLmQUqVj959tf19bXwmp/LsVYqtmCobexCP5/X8h0oi0pQznDmhE+bwB0
         m4dsO38EOR3DL/EKKi1mTFdRmRNqm7NlgXAF7+D3gb0IZVkrPq5pOHTslK0QbcwE969u
         kuHwvGVyHH/Goc/ncXSLhEtajn7U5qveIrF2mBIAm0b9zFCldRbza7yNtX+FGKFE4uXF
         XgVFsosovIY5GFiXWhHoIkW98o6G6GULF0+mFDM/vuC5LJtIq+1/ntDD6h6Nt7zNXyZ5
         ATwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227037; x=1794831837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=ocaLJJW9IYBRg5BJL8B2UMGgwGaEcvxB/4UMYsbvvB7n6SITKf4vloe2HpkwVkotXa
         +KtgwMs8deUEJcwodRbQ950Nh0PF6/Qu4R0Nv7pX1z4p8C70aVsHeJYeqbGqGEUjFDFu
         7BX2vq0ZN7NFZG1DAu3p3aSUjBnoml/vpSHWv6+hizOf4WSr0m8yypOynemGkltNGkP2
         65ZareEhC8azIR+WuA3fEaZCd2V+HMlNhQVpBQeLe0PnwLhkW3CqVArFPELABGAZtlGn
         ng3zzwuaULSQqaL6slO8nnHzM+jEAe9xQunv+UBvKhSu8lFtpEyAly/rCeo2e3RCqFXv
         FDUQ==
X-Forwarded-Encrypted: i=1; AL+hErH+I6z7NB4rmZA8XpRZHZJpNREkPAK176Lsjc8fDQxRPsPj2Ls8k4RFe7oxCqd/24xzYlCDHH5N/igl@vger.kernel.org
X-Gm-Message-State: APuU4Z9QkTS+8Dyly5wLBR771w/iUavU+O6uzBf/vEK3Sg+luX658R29
	MJQmVKVBa8Cok6taetWU+okiYYeSYomMChA36fCQcL4ELapAFhCq+/D18CZcGc5zhz8=
X-Gm-Gg: AYBFou2NvUVDTtiNqIxiytNYDciv8oVt1l457yqBQdk4eQwixyb/klXGX90j+FK8ZbM
	wTwmGLkG//bpG1R6q02iTccUyZ9Vd4Uc49pKcJiGHUyIT4BVORyBQn3jQ4XZ+F9kWgCu1PQiNQe
	hIoGk6gw/DOxPcsBwUa8GpmNFQfa386zTpiQkuDV08M6HxoLwi+QZ7LDEIbirxDl1F2yxbzn/Xd
	5utKtIdeLGb4KxumLN1vI3tOUCsD5MYde89LeLPIv6/FZ9tdNDskvOSdNPfaZL2lZAE6MFV1VpR
	EFu3GuY277AWeMINJu7F80EfkKcndFE7hsZy7thMgU4XZMDOHSmMh96Nxgv+WlJLdO1FJ2hV2kv
	n6MP1LviGBIvG0MOU57vJVY+0EyILIMKB4T2v4qbI+mogI5BM8FEFWzKayxrOgORVgEJUzWd2WQ
	Svr0wlTXhoopHWvBPtymxRS8QsJr8S+Qa5kEwV0ygKmiDMUd+1L8bK42KnTgOP9pSK5G2Ryb0xf
	uZyLR0iHJ9PIVTKRzNZUYw5ZqNIhidma/TBkNr1w1DdU46Bdj0gEWvhBMz39wc45HdQ8XJAzaFu
	5E6vz9cWTcAZF7fRlypdyCf3rY7t4xfph1qCFKUF7Wz2XQB7uKQ/bRGwPhYj5NtGCQUxj+VgLfr
	O/ODezGbGXw==
X-Received: by 2002:a05:600c:3e0e:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4b963c75b42mr68468965e9.21.1794227037216;
        Mon, 09 Nov 2026 04:23:57 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:56 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
Date: Mon,  9 Nov 2026 13:22:46 +0100
Message-ID: <20261109122250.720757-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add youritech panel as a compatible

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..6f29ddc1fd09 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,ili9806e
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

