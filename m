Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A7D3A7F7E
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857156; cv=none; b=ZjTvodv5QHdQt0IEw/5MrDQBiGiG9To8jMYWfzS1LEDmYOAN20UhnDzBP7B+rjvum+2XkdXzzdT/5l6ki7kqCjZUAV80IFTPe8JmC/Ru/BmrWXUc55LWJPNsUkypnf6H62rCI11ycJVMBlCS7xIqoopn7n8vw4IuHbzt6x57ajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857156; c=relaxed/simple;
	bh=Px5tTQrrJPVZPpjYyuk0e+sO++K6EkDLnfAUJ2HiA8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODJiM4rgdg4AfneDDEKSyRcca96AqAjQWx49UIWGPjag4JtTkLGP17Wi7ON9bjGdQ+o3lL03VYksl74XwnEUYPfz871LwsVdqbFnYIlAt4rzYgkZTEFoKpZyoE/K78BEycel/1QIy1nC/RpCs7i/PoOqk41rXbjcXJG8kKlWafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk+E1KAQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk+E1KAQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceaf8a1265so7699875ad.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857154; x=1784461954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=;
        b=Tk+E1KAQzPgBvocvOc2tlV53Y5yYuHWHTE73/jOOu+VWo3+kFEfCSwT9QlShdTs8Nn
         f2OZvnnElg7/bwmee5KVhDpP0rumlDkfot0WX8XPvyQUaJCckGLu3PAYH1F3yL/kZJZ8
         VctQ87gMB+OeyBcDrpqmoTG2EyPDvOGY5/qZKA46zU6rP0ixC3OQhMAH2KHg2q1NlAUT
         Y7z0Tznc5iIdIlh1l0419rkMJPvAqhH8XHfWaIKScAQR89ehYBIu0Wvyy2DLMFWtoVFH
         EwPQwNg2140fEUsOASrjCXPIDMlAsGfcZ6djVBAe+tSFoQIEvKgvZWKaENSpAXdqqszT
         ublQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857154; x=1784461954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=;
        b=Z+uOelLx4IlQA1myVwxJq4hugOt2yiEtc+1sKgFxdfRGpwBqRMZKq1hU6L6Jb1kRBa
         1NDRhEB8sORh/ZNW/4UCbKPlXiYW1fGr+VEIE7LcwICRsKjnkcIvGoSaUUvW5lywSSI6
         wcSojn9kD2YaCUSHdLvCatQqHl5xh2C23oLUnLMLWfnRGg+zAUd/vnyG897wDxh/hdcO
         Fg1Ab9Kp1aXrGg34gcIbnr5q2dXAVWij1vAvpHBh7XbSxkPbPTEEuMfyl0jPGmYLE/nu
         513gXP8GjLsOQqe5nN5yyAwGIeKWlfuvpUUFWZv8JwgjjTpJNsmnAzEIexz4kWirkRMI
         09QA==
X-Gm-Message-State: AOJu0Yz1lDGOmUi5etsCOov6VyXIsNvTCyItn4uUx0gNtAseN7KlGsOy
	eCk0Ox6Tvo9t1VhdwoMvE2xj6mWmdh7r1pnGXIUeJAJafMNU0yqsfvHo
X-Gm-Gg: AfdE7cmSqelbmXOYD1OpZ3NuBcUfIK94IxedVQuGZ8Hqd1andCruYPzHxNDn8tiJgij
	Ku5Ynx4mh1mCyRqAONnuJ4Jx0MiUrh4Beeyehq1Wnkd51qfaEnnHPUW2c9XF5Mdc9/NSLzw0ec3
	6Ek21nWe6zq0AuQImr6uz02bqSaaO6D1nvI4SVh92Bd3BwJ8czAc3YCckG65qCve35kWr7Uckql
	nSdu2nZzx8cKIm8x4K5IGaB6F7ufu+J8tUEXap4eqn39TFLlIMFktIGbIRp5fOjnFZN/ClqTjxv
	HWeCBVJUFokRf9m0UY2fkQTO/fVTIQu58DUcs1w3fPy9ccZbN/9k/JEA90DJmS+Qwk4Uy05nw6/
	GUO8wuNnZ0/vr4pF3B8zMUhskQsXCpJz/QoSznLNIX36sVdMn4OK3P2A8ARY34Qy1ok1Z29pddr
	6U+dUuDvKRc+WMMp2+x0o3nKHtbtR7eW9FK5PPvbktbK0pyxKbCQ==
X-Received: by 2002:a17:902:dac6:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2ce9f154527mr49451065ad.35.1783857154348;
        Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Sun, 12 Jul 2026 19:50:12 +0800
Message-ID: <20260712115012.91600-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0

