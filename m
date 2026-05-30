Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2561EDA0F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149430; cv=none; b=hQ00YSHCMKsT/XZIEgyg6M75pxfHPoaWP3kGRnsmtCfcwHu87UQkuSnGV5RdggP3NLe58K/PMNvCQjtO/4CI/syrmUiN+03nHHbOc2y5zHxeOQv9Jii5bovV98jNO1lt/1t0HUvy3ZGAUcrVmRCqQIT9IvARq4+H8NQ1NWGVYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149430; c=relaxed/simple;
	bh=hTQKLIHnbgUGFB2HzsxgXWD3DKh8vV4oFm4pcpt/dpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n8ygluIzDYjoGYr+yp12wWahvtzCctRa+Xuzq0/GCaNuWoop6WCvYHve0cKi396sfUrgB6aa/Euwmz6YbPFnN9KMYxAj0DhzhLwKoL42Na1OZHHzAis4uqsnTNMKEr3DG6i3FRh1hPS4L+d/9LaOTlam+V9pl0CkgvzPpTnh038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=b3rH5XbC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="b3rH5XbC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso105034f8f.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780149427; x=1780754227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=;
        b=b3rH5XbC7lIBvErkh3w0tgTzKx9fg8y94XmNk2kd4Z6/AXBFrTnqNXlWwqHXYtzCbo
         UZtvpcQgW3hQv0o3zlVzKDol0+4F5ExcWg8NLOmU8++Jw1KKaAJbTGM1V2TNYzeA9NVU
         K9nT5L9adYDYzE4vg5dPxgLIGBg7xRO/fdYyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149427; x=1780754227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=;
        b=NOKHnLDihbGBtcZbWFqC3GmtsMKfIgWu5BkgfteSubOOjXgCddDNi/7n27bjaov68Y
         Lucge2DBWAF73vBpKVojJeEH3TCUe7L+fl63sSCNbLOySJa9Wvmr9nbFnTNw3UqssQCV
         aUa+raHrJ16G/EioiTlsfbPSNoBRbh38f9d7Dy/XrYLpfalPAqbWAaHho71MstpSyest
         deUH2VyHZCp2BIwVPBHAxMHgNdwSpGVmemiRaOJfR2OX3Evq2ujxl4pGIOv+EHWmhWyL
         cmli45teottePVf8dMpcgMwuhDfqHfC8T9JGcpCPkWE9TcMHzR22caJO96Mvlr1c4RpV
         qwBg==
X-Forwarded-Encrypted: i=1; AFNElJ+DIQVq9dTLzd1i83h577Y8+68tTLGG9cqRHPLrhL5Aql/DjCI5VNj6+kM/P39qeg3fCwJ3NqqeLS7B@vger.kernel.org
X-Gm-Message-State: AOJu0YxqylJgWJTuHaL7wSJ9RgljFqSS/cyvRRAaxmf2hnhgzMzm0Oov
	lLd+/+Lr7GNTUHseM7qh1UyqR3L6JrZJ661/J6gKrDdbS8IVpVBmy4mbSXOpR2CNTRg=
X-Gm-Gg: Acq92OEvf/sw0fRuqm+bQo9yZ0298eMarZCAiOdUWfLq+sp/hGglu+Ffd9dtiraGpXf
	FLaA2ksS34+zA/x6MTkFUA9Vn+BfvJ4HIpesgTLN6WapWpgJ3sA6Q3e6fT/wptmg9YM7iRwEeRm
	yH8qgNev04puPn5/pfceJ85teruWkC4qBCDa2SQ4VaYDPlHE8vm7zXv+RRmGfhQrl5cNLtZ2c4i
	W6ffzrIQ0n4cO8AFwr1XYNNFVc5TXU1/22LjNLx69mhJUAR1yMzN0EPakZOov04lm+RNPcMMYEY
	5pFnH6/KhGsRvYLSYnhpIJFg6zh/S2rwcmCkXxwo66uvKKLxnp+1+HTDcpKsZ/JdQcGaqETj/Rw
	7hHL6JJjDJXP6bY/CDWMzlEX5QL+OF7uv81ofCsQEPhAUmuKECGxwT7G5YqYvwkqvjRHV8EZSaq
	2L2hxubY6jW+wRCc2kTtEQto2SHIEPDkYx6f2Pv9eI9JS0gGooBrm0xGwJJqhtv/SenIltraKNC
	FhT2OGWr895ZB+qbqVbi4BCbUVyGG1/rZWaJEsb8XtwAWxhRA9RwDa5UzsAN0YMVdKalmuj2itA
	LzDZgsjHtqPWOXC56fhG4ftLAHQ87uXk
X-Received: by 2002:adf:f902:0:b0:45e:a225:6dfe with SMTP id ffacd0b85a97d-45ef6b5b552mr5701275f8f.25.1780149427200;
        Sat, 30 May 2026 06:57:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm12101711f8f.9.2026.05.30.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 06:57:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 1/2] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Sat, 30 May 2026 15:56:54 +0200
Message-ID: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..b3416c928c08 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
branch: stm32mp251-sdmmc1-power-domains
