Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7402B175A8B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249155; cv=none; b=Igb+eutcF4i0WY0PNqjILWty3xX4obA1ykeG1j8C0QR7iAFpC0vLgJH5nbrjQ+x7IMs4TFXfdDo/sIWJUwA0U7W9t4kj53/GXqgBfBzs47ehp5tZz2eBCuj99POHBveKbkIxWR2UQHGv5i1ufyXnr0w+lkAKeHRjt4ppwdtSRFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249155; c=relaxed/simple;
	bh=Gs1uXtSJ0z15SoILWoSeyMVBihbvo1q5CUXREEbILQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m0ogG1kaK+MhCisyGi/nY7uAGSkAX6sDNIzeHQGBlG3dLN8kECMSzMSMcoaI6hyijSnM5GfqL8Kr9VzKBUgH1ntMvgM2k8cQDZhxNalsCzJlPIQPV51qUPy0ONNXOHAJ7FHu25mSx0JK76NV9kRgplYtR2SnGCxDhLNoEC2eUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZVWrB2/I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZVWrB2/I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3e03939so5426315e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781249153; x=1781853953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7EX7vcwLIGLkhcOTF+L2EBQ6wXAup12KuoUfnu+n/g=;
        b=ZVWrB2/IKEX+tSO03X0rtvBjWAfGh3tNf4e30iLOHvA1O/oLCXMbQrAo4kFdMdodc6
         MdA/MIzYDqFYEzZM3oKoPDPKw66srUBCwlfTnyEudDjOW5gbuhiAJa3XQv867qyBotm5
         VVcmDhbNtWImK1/EB+u6FkUZh6Cv0rP8rtW6lb/gUCEZoAz8/woPfVt+a27Tr8j78DXj
         9cXRuV4e0qNpz4ELhaB5ppDJdIzVkXJ9i4hFs7rgfwFW0gk9Bc4GXTPaUlvzGxFG2leX
         /f1PZ26pDjV559U2uTwL38n5+16yLDZqR2aOPbd0TN1Qc5I5d2Q6t8VR5tReNJR9nEkw
         +18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249153; x=1781853953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7EX7vcwLIGLkhcOTF+L2EBQ6wXAup12KuoUfnu+n/g=;
        b=QMj/sJa54Ho5HIIISQMd7orUWKyUFgtlNHdVdHzW6VBhwEQBV4RyQLeSb7BFyU7R8O
         euRRu23C8ePm2x5QmGGkT4jVgaQ2nWg2u4ECn4XzmInvkgnqdqDyvnOqneo4ZJqTfVby
         Lpi6WqsDx2Xavtf+8v5vx31oqiosQF20XcwzOJntH+YQlmGAMGN8GgiK50okKKvizNLL
         05rWRzxd2P/6CWPzLwavFMsb7iFck7UMluq7utOxKI5p+avWitoHxFQTfUutNmbv3XKm
         TU3FqL6pNxlaxGrx4T71U/VURDW+lff4Y8lXuA4MJWuTdGOz17OAM0rSuPjR/EqXs6/E
         N5tA==
X-Forwarded-Encrypted: i=1; AFNElJ9II3HTj9fwVFhw1ycSpX/caSzmoTHBzsgdaUAZy9iBvnM5sGKgUxRTgOAh59jIifkBeTDzvxjUWRqY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DyB98tjsFF95+tBcyKXVZkKImrVMtGQiHCY/cJNMGibPoCfx
	BmuY4XdmG/FC4s9jnn4z6zNUus3NGxHPIzit3SHe1OCSdNvfnVvUFf8DMr6rgFDM84w=
X-Gm-Gg: Acq92OF4KiYSs85DWX03zq11WrpJ3PfS2A9S6iuKS1j7jI1xVluv2GhOdjuG9lDDmLL
	FD7nyUNQYQIgg7a2oc2P5bQgvDMxeoBUlk6ykgX2YMSp4nx34G7ySY8Mb4qOjbHY+UYvtGoZ6aI
	m2NpXLkypwOUYbXpeO+Hh9z2oda6QwxwEJCCTKW3SF0wAhyClVW29fAVGiPZEaqxnU6xNHgNruU
	e6MlQry7uG1zc73Vi8jee7Xz0x6Yr4HwLUOmvozA/qo1hLmMyes/qrbseBEQjhBph936RS4Wh8a
	gJOwf9/y6ZQia8TBlmZcHEN1gq/5M7w4xEzcL+ZhQKdFr/hprs7mwng3wBGgYj54+ePEnRlzwsQ
	KQtFy20Jc2GnqYBGpsJh9GCCMb52hp07coNmIQqBv82scl5WDGR7Z1M1GNxtmXnb2nIjnHiXgVc
	7JsH0Luyaxsim3YeFh2eXyCcrpdX7NVIaFsIDVHOgyUJUgyyy4FQWxnDx2+YH9cW8lFFjgEQCN/
	L6iNuKXGM76INGKP9bduDc121GMNaYPy0A4pEQ=
X-Received: by 2002:a05:600c:5010:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490ec4e1c7amr13862745e9.15.1781249153014;
        Fri, 12 Jun 2026 00:25:53 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83d8f9sm47864355e9.9.2026.06.12.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:25:52 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: aspeed: g6: Add AST2600 pwm tacho controller
Date: Fri, 12 Jun 2026 07:23:40 +0000
Message-ID: <20260612072341.278591-1-gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It use the existing ast2600-pwm-tach driver.
Placed according to bus adresses ordering.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..818d486b94ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -102,6 +102,15 @@ ahbc: bus@1e600000 {
 			reg = <0x1e600000 0x100>;
 		};
 
+		pwm_tach: pwm-tach-controller@1e610000 {
+			compatible = "aspeed,ast2600-pwm-tach";
+			reg = <0x1e610000 0x100>;
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			resets = <&syscon ASPEED_RESET_PWM>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		fmc: spi@1e620000 {
 			reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
 			#address-cells = <1>;
-- 
2.51.2

