Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B043E024D
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946094; cv=none; b=ltZRXgR56GTttSZXNwyk/yCLLNhhpNQQczuwynliWFdOuKk1PtmRF9JK48/a1dRxiu/CJNO92oQdrgUDGHwpEi49rRtD9S18oje09Ytnr+ALAC52pNfv+1g8mG0ogWlHBXt7VIflc1hLASGAkWDw1bc/RYOg86gVLA4EcE3BIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946094; c=relaxed/simple;
	bh=LxC8kMJh4jwFnRvJn3SSrwAQzwqAMDmM2iIR3W+ZNrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQLJXUyLYOdC7cPCAYNBZVIChhelq+nPRgvxt3RflRVoqrd34fwV0Ajnre142jII0dB/p7PWutsj98C+ceFBTIFsGpRIRILsmqrzho591eBksoRlWTu8+xYGvLBrBjLOip5iSgcBqzMwrV+FhrLZvJfV8Tf9rB/SWyUF1QLHH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHMLGnOR; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHMLGnOR"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd2so4963a12.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946081; x=1789550881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=;
        b=CHMLGnOR87OKN9QVLRG2LbnXr1ZVh8LNqUo0QLVl362ZE1cvGp9MQ0wtovL/MzOeRl
         xdN+oEEidaEzJ5I2Ps7uT5SN4n3d6f2MvgSnXlUPG5PRLElrPfmiVF/LKZcZVk1sjehq
         ehv6EIaXb+Slx132iBCdBV0yGhBEzSnyjXlriEXiH7nvsLcF1S7FrzOY80Un7WaUCHJN
         qyNyjeIyVvD/3ZMxiWic9oMe6E93QYRRq4mc4gKmFrLksyM/cSnS2az03qrHvmxklyhs
         1DJsdp4BoW1uBzyR4lKDjMuq9jDYoWyTeHnJq5mhL3UCUlbOObGBubGaaCS2pghcKcnl
         OY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946081; x=1789550881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=;
        b=fKWJ0IEY4jMB7ZC2XR/D3GOJc4ufksJyctP2FRMb0ZvTZAPJKokyHWVUvSo8UXxZnY
         bXsf85ZiqM1blCBGxiRkrN4yCv06dmoN4MU6ucPWSghJsj32cp0BQY8S4QiK1Lb3343k
         NDbR3VGa1fKOtMIxOOoxSe7KguNz/T9F+wYzMSa4WjLvLXso5108DLGXAz6Ht0eLuBON
         9ECtSncvFs1yEMXHee8vV7leVy6qFsK/JmmDOpxtSB9EUQjp/3TWanOAD5AH9psPIZ+O
         YksNPW9YX+u//kDnA4ZDiVxkoZMYxwVDEzlaIwQ0D+zQceb6CZXq6NIkGNflwYppFvWE
         UCFA==
X-Forwarded-Encrypted: i=1; AKwUvBz5vrhfWQ7q1d8qYDBTexk8NJyIpu5tXmgzVr9EMEAMDxyZPZ/2UDnqUEussUAziC/AVdn98iuP4cOP@vger.kernel.org
X-Gm-Message-State: AFuF++k0H0L+oT6qHo/3jGq15PNbsDkDUY7JxpgMsBPaGS3N85rlOrRD
	DiIUaUBGGOS2dLbTFLh8OGh0stnsU0pm8KNC9NCN+H1hCnTmEdGC6SR5
X-Gm-Gg: AYBFou3RI23+4Q7wYNLb6itlcDOTW3KHMSuWRdNT9LJfoFo6WrkDNv1MsYvc1gfazAK
	dw8ZY84SZYQnzqSHhaOhzVIJuoBBo2YryfvB7u0JD6aFC+31yZTXpQl1kyZJ8X3pqrN+NS4o7qm
	u53pbebpWoHrvJ8UaWzWLFKa2bDP59MHUEay3eQ67GPgIaBcel3L3Mvm1qviZZVwP3ebzrX1hc7
	wYa+sbQoEnmgc/uEpiC9ZQRV2ZYHuz4RHBfHdbltk18mAGkO89cFYkCWw2aFYGrVafL3NXFQq2N
	kNp3iUt34quUnmW39xQsZfb8KONrrNEPDVs/rxGufd1Gl5OcoApw1ikZPI2N0cRxIN1RyuWt5Hw
	VG5W5aALn+1+DVj0r6MWHZ2qmFFwH/wiRzy9U1jjZL3KF+uqQWucHGNI4kEJlqtGDBCzzA/dbdD
	YETRdTliYtsLHxMh7LBsAK3z7LBA+UvwIbR8OtdpSkFrzWgKB+0YBf/CnsAodtMvhxvChRFLaL8
	VMMZat3/tCT
X-Received: by 2002:a05:6a00:b82:b0:857:4dea:e20e with SMTP id d2e1a72fcca58-86942f3f103mr305995b3a.0.1788946081268;
        Wed, 09 Sep 2026 02:28:01 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:00 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Wed,  9 Sep 2026 17:27:26 +0800
Message-ID: <20260909092728.1859-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written; with any
of them left asserted the rails drop and then come back up.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..00cbb27 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,23 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written; with any of them left asserted the rails
+      drop and then come back up. A line left asserted by another consumer
+      therefore defeats the sequence, so every line involved must be listed
+      here.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +130,9 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

