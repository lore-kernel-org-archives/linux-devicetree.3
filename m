Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB903D904B
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496226; cv=none; b=MYHgeF18glwFRq0rjcUVJa7HZUERfjyET6d9pDoRmJkfA4NudsNI2PIAZyi6TQ6mMNYZrSfbrAoPAgIxbYGgzbQBTXTmPlGLdPrAsVksHWzGssojGdHNH1bYK5eiDmkvHdAbtCzLJfTD2ojgukasEVqeBjx9GQBGb7MuxS4m3P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496226; c=relaxed/simple;
	bh=iazWrLtJH0ZvfQXHNMDmWoeTvLKqPTMtY7iZ5ZxXJzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r15kBdXyCzCKUiostpf9X+gF1et2FHRZD+y6r4nI2J/X4yxOLKI+HzZwUqQfj5n4IM206kAkQlLwVE3bvXwKQko6w2o4GYvOGoVylih/6Und82gelJAPUAhfAT4d1+yeWQeSK4SBRKz/C+hxdspncdPvvVUZSJK6KFwMLeCovsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1YBd4ez; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1YBd4ez"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso2647775a91.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496224; x=1779101024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=G1YBd4ez9CQtjhhETw5Njv00Z30Tw6REtL+hUEJGvTswY9Ln+ArL3qS/i4tRJ922/f
         PHiBA/ln6yrFXc87Xm+CCFfty1Ga8Q30lCnjFZlygxr6NF0QJ56c6YGi1IgSR0fxvTi3
         TZxpr6zk1s53HG+PVBMg2txKfcwAcsReejfTPMwtbIilMER1WcOWKZE/X9Z6u7mMjn+d
         HvQalqXYIF3FLUggh0eyFe/c07CAcEA/bTnKeDFL11/2/nvNDdM//0Zm8JaExAa4b2SB
         +M6al5aITPAQBNF4JH2sgtB235L20wp0pMOdGg2Ihd1NFKCzQk9B/d14O/j8PkgFE9ZE
         Gr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496224; x=1779101024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=bVfEWgeZHLE2ALX5q8nSCXW1/4biU/fWaNz/HOpDfnfFNwAeAh+ZRjBF3SeojMdoMX
         UdWe2XQ1hbQFC57e1dLUnL1BjPCPSn0r41VdwJLMuI9Ne6DUTIY2+x7I6lrL3kCYoJrS
         Y3pgCr0pj7hfh4WpObxJRKrVDGmnxOEbqTctTPxSczYFXum8K9Oep+N/o4gXn+Q4PUO6
         v4OGzif9XuQpQujt/hQYqYQdnfrncN98T3DYIXh0w99LgkYG51CMuTZwN79yPgS7wdpl
         S4u/Mg8mtfbWkxCX1aIAOh03WRTri8i+ITmCHHG+TtSv+l4rTT+MXvCQIJnBbC/RHf9W
         SVrA==
X-Gm-Message-State: AOJu0YwsYLTFYgEgcABNjBypseF9gUAx1K8a8KsQHndM2KY4RpiOZxrU
	Tch3FE+6GX/mnpfd2tnmdjn54UXT4/W9qkwdZsCYZaCvhVHPS9lNaNwM
X-Gm-Gg: Acq92OHbpJrL8lRtl+zdgaSdloE1hawI/hRp3EtihiLZFWbrTZ/dBTwK0/4DzV+u0of
	TvY3a547H+I0kBGLy6hZ0Z689x8tv0mKypYqueckielLZsrdsfEYbEZPN2GeozdOiERAOLmcTug
	xM6bHgkUYpa0FYnFLAz0r37rgXT7BHvfjybn0kEykyvW/mNeVyrdjVrMkVRcarpvoqwEp9XdCov
	INr8h6iZzOIVWLwMytRgrOOD7F0eKFo4RBOhXXK7P5/uPez9qXqaERLAlqAEvHSI7ItB8svSVEv
	Wom9kTmbyPEc6NxuKKOfIr4Xs9cKBLQyBc63DADaEXAgoQMKF3OamqHTlAZMxQxul0m65Su0cG2
	4Yl/HQUFssEmKo3L5ViM9KLCngJNPJRoc2QMw9sQFexahIZH8svGtXVUSd81MF1aDbNy2Xg2PWL
	uRKtmV1+xf6oFYQ5V9CGSDC00C3hy2tJrhEkoEtWs=
X-Received: by 2002:a17:90b:57e5:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-367b9ed8035mr11528030a91.13.1778496224312;
        Mon, 11 May 2026 03:43:44 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:43 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 18:39:27 +0800
Message-ID: <20260511103927.279550-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
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

