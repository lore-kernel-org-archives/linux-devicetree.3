Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C53A3B42E4
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309470; cv=none; b=ouyuShNFskoE0tS6eDVF5motiflU1kvHJNf6ZKu8dZSwBpdsXXGzj8fSMQqXCL3N/90xgOn/dWju/QjXLvmErc/VxUxtvlAaR6tRTVxTDwAnUIH8fEzWFkd0PztX12yCve0dPja+5axVN6VVS3b5YrlnFmFVv7ikO1jSCtjGVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309470; c=relaxed/simple;
	bh=rb+aNnHYdNqy1IYBy9/+KLzknx32nWz+/xZ4/3QurYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+GitjB5DxXMkC8SLzlEX+EKaxrGLyZXv4k1Jd2UdgO8nZuCp0pgqaxpJGvJcYZU4zpNsxIIkidmzvsegxbeievVZkUhXxdE53uUi1f0Ziodro2C4nZ2/+ybXEa0lOkZhg0ur7Edk8vrIo2AI1HLCH1HvTbOwkLw8q7bLIfbD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIZCsvib; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIZCsvib"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so794255e0c.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309468; x=1782914268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=NIZCsvibgY8eFMchwY0YhjUkHdTLhr/QQgus/AwA94x+l+1+a3+d6a7cCbsa8svLPw
         Zqj74HdqrCHsSaNZfZ0a+caxmVvZJlJwghtCpRjZeuxMuKgF58N01LRKQwKeBjGCZ3eY
         5GavNMdb1K0bn9hayJwMrmJYheErIM+QosLDhVHYMSpmHI5okaAIQrCAgj1tyzgZCI0h
         JPlQCeTZerH9IByJk3j/ZY++ub7MBvoKdb6/F4pg72uGzp/MZ+Gw/2a6aMnfI65K4AdH
         JQFmrLWMrssKP0haUvUWz87z5Z0S6v4jDrV28enVGIlB9fb0nBjAFOvcKjhW+sNEggMs
         Qvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309468; x=1782914268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=PWlAJNeCnyOROsM1WNwAaipHmMsH6gbQYi101PIX06NUrnO12C6HQPaJ+zieqLObwu
         2MvgkVTcBmyxXmfHSazmAd/SmQJ0Sf6cdHYmaBRip5U2s14g0XofdqCjUqKd0qBjshfW
         XQFmGqCzijD+/Blq09YplBdnp9D23WNTTcsiVcdhr3TzekmPEaYtg2X3ccxFoKDvlT1K
         dOcRAFedHnlICxsT2V0kz8sQIgif1iQCmhNntlUkKoa0cVb5Ox7oaCnfyvWqn3KmdQ6g
         DU5aUdH9Nwb0OkbnP87Ovo84zcQ5JFhlE0LOZR0RivlfVYePrd41Xv0/RDkpQN6zrhx+
         8sJw==
X-Forwarded-Encrypted: i=1; AHgh+RpsWriI4HStdllTYzczcnGXyUIsahkYuEglhJvI3ZZhxfE1MGeBJdHJ8fpn8ElImPckd5TSyb4Fl74m@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3Khs17hsOjVmPhN17lTokSYc1lZuoPsfF7pDP0hDJTLTnITA
	eqKCf1bx/WJqbmeV+KyI1rDIKimoEnDEB/IeY1/IHaxc5zGNdiZRX1Sk
X-Gm-Gg: AfdE7cmingLp5e/a2Epia4tbZETLUQerioeam5Mu2oxUviQaI7yZN+Y9ZvJl72Gxpgs
	x8Z83iCSOcvzq8QXPfZONmjPnfeWvy5zN1HlA4bgA8THMzvx6GOBm3PG5Md9dcpjuZ5JI4f8qgO
	x0RvqfoNIjvGwHUOScXNkxWBScaB4NpZrtI+V/l7QuDX1uvOIe+9W/aWg7ZnPt/7QTld5Z7rV3g
	VMNk5LdsUKI0db6I2pchKlW5N7NKdOUoy9uctq7VGhtqaAeBTpz2b/qbb07SIdPnJuc5iiXaQN5
	oe09hLTq6aW15Uk7HBirSWuJvOUobrYdDahuoACHYuIG1wI0kqZs48T0xVXWeK6Zai2AOmUmXNd
	4SRLNKkRaSbHdk08a+rqwLbVZGQLzNZMIF3Y5EM+6pmw4VrvjtDXKcZ8dNBtQDYgJkpufUpbrMe
	ur4QUmoXJJIp9wNO3YCSv4CE82hDkCmRT7YvIC/UhbRktGbg==
X-Received: by 2002:a05:6102:1611:b0:723:b92:31b6 with SMTP id ada2fe7eead31-73115d8fd1dmr1491466137.27.1782309463680;
        Wed, 24 Jun 2026 06:57:43 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:43 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 24 Jun 2026 21:56:42 +0800
Message-ID: <20260624135650.727077-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0

