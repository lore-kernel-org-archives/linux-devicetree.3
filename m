Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6DF4446F3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385712; cv=none; b=oulqZ1eTM5BrzygCQ9v9KmI1bPzAVtcBqdqe+rWeeGUYxSs2UORqTWkDxlGA3VqpDz8Gt8TXiV4IOv4xbTL726HJxh1XgJqu49yvODQ+8Oil3lJiMz5nT54vztj1DRokcoQL6VfRGAw/fI0+5VwghejvvKcDwbycznx3+XyrFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385712; c=relaxed/simple;
	bh=2tYt6Xz3Ww2Nu03hw+VbVfk++p/qUxznZgUfL+6yi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GE1UKorU1FFdXY+YMui16g6l8zg72K7YiDZGwO+K6dAO13pPe6MAOE5IeaEc8pUtmYKZLFhoh5+ufk2vugNuEjhWWsZAvCmFIPC4KZy16cTcq/w7JctUDt2aeQ8FLJYxlQFlzMGtH/Zj2/V3r/bUlmUhrCBB7VTjIEvLhfU2ZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGoXq2aI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGoXq2aI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so766557f8f.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385709; x=1789990509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=DGoXq2aIZQWqUJjAUArkGHF/cCKgwHGvAOkMIVu5ysM+unvWLqUvysBdf1W1dmOs4Q
         1qaT5J8LxWVsJHGVPBH8C6KFG3LGYy8rl77Fh9iTZ1pPXbXXVwqzrKakHswq0t3kcwOY
         GEz9gYux33HBcob2QXyQKeoYuAgL651iJBMmBwprPqCuKwk/59++1wNVIKo1SWtYPmdr
         tHjmJBLthxMIP4CFEMqGeYWzcR+sR3OXAy6Fyf4elRDpBz4NvzqIUtqmbNTUvZLKKmbJ
         b9PNRcwfufovO3vlHg3P9Tbkk5wsxVGVdkzHCMuO5Ew0Afs+PRngxxL4yiHPrwy7SXhI
         6kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385709; x=1789990509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=TDjTOuRItqc9/lu7Ky98S1SZ74Ya5u162DLUj6kat39O8fE8O6RStP82gpOG468I+y
         B2EbOLv9poSwhlHBbu4q3IhZJy6s3hmUzk6ZWoeRVneaDayT79+KKwQzD000UFTU+/yj
         UJpyv7bHzt29lgO0cESsI09WnJiHXIxfXSvo/qMTG/h8oa1L4tQYzSV/HXvF8i2tbeDF
         b6zBIhlxcEiizx9ac+9roVCJC8FcP4Oj3KMjg+jB95H7TA7mvgzUh3Q/HroUDksi8Dh5
         hLbxP3KXRP2cnASYKjkQezWBN65SNluAAGq5daqSAK18vX1D/SYRcv5lBCzM1/W6Sdak
         QZEg==
X-Forwarded-Encrypted: i=1; AKwUvBx7Pg/a8UIK9+c9YoGVlVu+y62C8vN9IYaVhEGzeuITJIhjEFl9T368of8iQNBQKJKNS5PVdWM9S9kP@vger.kernel.org
X-Gm-Message-State: AFuF++m1P6PV2k7qpmJA65Rrpc5WXHVYDuao1aBkj9U3QVFxgcGafT/9
	8DRyn7H8VvwN0oC2r1waJiYqDq5V9DXfhgnJzTBfcvaGf4vx4anEzMsJ
X-Gm-Gg: AYBFou3PH1Q0zY2M3GeqTgA4wJ1bvF1fw5GDei4rXiGazhDNP20aavKJ0rYi0eOMtOr
	9i8f8lXGT8tmMC0kxrv3CCDXnqz1vwLxCDf1gdMCfRla55TSlJa2z5zSIz+2hl1LcyQTHsg2zce
	O95Sl9mnCSp1mRMmWV3ODU2qtRBZdFjYc6sk+o9Eg6OIKwgVfgpM0W0EoosECgNzZ6CKYqwUD+y
	1hQFitt2GrkdyLJbcrk4Q0I4VFx2Joy0GLCGOa/XeM3SrYMULifDUkEcAK6GoaRw1XhIAZLTgVl
	s4bJmblndt83rkniXDgcAK4Hzaxf3p1jOoCKyvnVl+qvZ2yh5KvwOQrq4hVLpYpJf7Ld9Hm2Bjv
	+n1SEksRghyVHcDnAPF1k5G+0KFteAW1HRr1d4XXasO4z0Bvj0v26t/OYDTK1TpXiTQuTTubucc
	Y1GtaZyX6Lpc2paUv5zC06vUJAEiJ1IOBDeU/dVmo7LVbBvvMqWOitlL3xaoGVY0WAgLzfFp/bv
	rVWbRivPXupkfLJ3iwWqt23xg==
X-Received: by 2002:a05:6000:2891:b0:486:f780:9be7 with SMTP id ffacd0b85a97d-48702ae4dd3mr2401139f8f.3.1789385709124;
        Mon, 14 Sep 2026 04:35:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Mon, 14 Sep 2026 04:30:09 -0700
Message-ID: <20260914113010.988-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

