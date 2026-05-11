Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE83C345A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490714; cv=none; b=p4PKq7mzxcRQge0TO0CaAMJ0zZHKXUX8AHqBsKw50VSG+oG6ZmwAb41vukIj8txqAZ48v+BdHAax9/WQVADIdNy4nSQLh5K90NV2ARDUw1kWJFEyVLWzr8NxlmykKNQZhHhfL8+031KQ8qogGF22TP6WMJ+FzQ2265sTMnizHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490714; c=relaxed/simple;
	bh=iazWrLtJH0ZvfQXHNMDmWoeTvLKqPTMtY7iZ5ZxXJzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTmBhy3EZUpGvQTWokmj+fIFJwoC7X8iznGsPGv4nsAy42eccQA7oblu0crD3VJO0sj+xGC2YdzHgCO1UkkcfKE97xUNrjEW5/W0zStJ4ArJqInTCM5LGqp7owxTtE3e5dJBpRblrO13Xj3yT5PXlppUeVqy1rqkQigNIeCBsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJNuZPyc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJNuZPyc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso1968006b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490712; x=1779095512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=cJNuZPycB1GywWBSMI9WH2uRmcF0kM1NZo56HHDH2xoWTYszJy/Khtvqxn1ffca3OD
         WmexjKGfbNHHWDok85UbaoJzNMwS5rgufEidM2pqkLdp644nHkUlQq3SSyjW55llbmpO
         lF3KqNOO4DXMBB7v7JP2K/FV+Q8k2A9yeIenySJgOp8Sp8r72wzW9jSok4Fybkep3zwR
         aBmkJD6v5nmsEI2gEFuEoptvovixVCugacdIPp/4CVzT5Ca9Jwc+3J8P0H0pWxL50Hil
         U7ysu0g2KC+n0E6vjOH1XuovAlDCZ1bkhGREuYVdRLUh99pZ/jxGwIpN6w1zYPMZ1pMs
         dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490712; x=1779095512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=geET+vcUt5Zd41setg5unAFdl2DbqruoYUEhM9z8lTWaGS2CZz6CbLkRhlNwdoRFmt
         o/RzUlPPtyg+7s/SKoomq9P0fufQ+ftfTeD3LgK+FEmrUWPI3Wf/Isw6T+mMh1cRG3Qa
         oE7uzD5+hxOfBSIgKGy1bsaNqeqi1GRePOci20Ne7737L2kP/ZfftgYvLiaewwZkFbF0
         wWRpSntloAd/kgoN9LulSbXuVkw+o3hDuwCDOdgdO+ewpMVhFFygzvrxcLgNMbEFnJE0
         NBvwh6OTFkrTQ0g1kjZAbL4wJ0keRNoisdK+FNGFj5f0Ggtl1+ydQw7hf884kHQpCeQi
         bSCg==
X-Gm-Message-State: AOJu0YyqXdIl1LvXgI6n12eEKkdv5EJhaIki8Nr1EyD9JCl9lF2lw4dC
	Fhzzx9R6K/yKZAvl2Dz/vCGG5SbFTgvGRQq52AVcGcL3JfZiwixwZ1Yq
X-Gm-Gg: Acq92OFrM1rp3O2OYGZ/Z6lxcIJW9x2WX7ANr0lM3yrds0jQtkmuQw/y9YUL5GDMOmY
	xvFYra0JDFNY9ISK83MxDC13fOu7/Dg/3hULYOodxJQY2ZnWsIhfqukH2s/9GdaxNIeFYHG4Nad
	GYRy+HusbIZ4xRS+uGDh3/awYv0cS4KiUK0V8QSWKYMcvpchNueJ4tmkov11748vkcIotLSHBhX
	3mfP29cSoERD5RMxi4jeFOXdQb1ms4PfnfO5jKR7T3erQbkLT38+bjIfTom8QLPD0HdQRQQBB/p
	+XlpBTzJ/Gsbd35xwFjNzhnjoDBWlOc8jW5+bzTvdfUde7Z9eaBHDw8ucdj5La30hBnVx0SrlSE
	pnkyRPr00p14bpE0QDRgsFI5WlLdL7QUqEx/tJjWabFX+Yl1eeFsY6E4cYlOKQf9WTgXGJ7MnPq
	LxbaWHIzOIndmgXAa2xnmg4Nw=
X-Received: by 2002:a05:6a00:a93:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-83a5bec54f7mr22142513b3a.15.1778490712503;
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 17:09:24 +0800
Message-ID: <20260511090924.269106-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
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

