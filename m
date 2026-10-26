Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975319;
	b=BNIs9uR4lyqGj3XsH2DNoMAA036IEYcMzKSs3CCX2MO0bzAkK1J2/LnuViYOPS9e24ZF
	 D0WjdrtitIkSLqymbvXV3KtCWYshG6YHYcW40LATNHpdLkVavbAZ9KOQmi+xr1aQinrvM
	 Lz3kih7EsUGrXnY5R3d2PyGy8w7wNXGPKZxaeoPGgz/l3EEoLm4seqkA/EmLlOC0k76h2
	 XknQwpa9wsizE0Gx6WeqyrHZarfJ1orL5nNcw3AAnvi3bMTPTrgLMXxCooQNqm9TOS16y
	 64+u8lL2tYzg4PrDkVE9zGnVXLymOOBcb1e7xyXHHGNnxCgAEYXnslKHiIY9xEKXkGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
	b=HHVubKe0cwLfK1f1bH4zWaY1z3QBZxMgEqfxSAVvAhxt+y/dap82cgKZEiQwujMKrjDt
	 FgtQf4lL0g7/nZO/DykXaGrh6lYwCy+qSKQ+r/W6cUVRtLTJ7rX8AsXMEGWO5hzVT3Rk1
	 XSJ9A4+/hk3Yf3VVtnKilHt80/Efd1Tj2eFwmRMuugcoil7FxiSQUHOhFnGsSENe27085
	 DrMkCqdYQxV3JOuXwbWQE1JU6ZESuj98RYkaPt2USlLp0b7Q8WzjOw7w2ALrYcADhdAK6
	 bENFYdHsbOQoiXO6T9gOc0/RU4uVCHVBHPWfXT7HrId953WiQKUfRTt2HxfbLX9Cikw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TYSWqhtG;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3CA606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TYSWqhtG
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2346277f8f.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975317; x=1793580117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=TYSWqhtG4qTa8bk5UMguTkT4gS//KTP9Ibm6N4gcxtB+VWTHQRCIpwxjj5VlrRqOPO
         xt9gYfoUj418wEuMSioI8vhKynhwvZEnd8dZwaQ7hr8BsBXBa6YZOVB+mekSID5jvUUN
         odBY6voH9byWTcNE1n3Fe5SyzFIhInSRmKCR+1WLcHIXqby40w4Lhs27pvksfOeXFmVb
         lOS7KxBNB+K0LhMlYMBcA8QrFP4pqOn8G+vA7z6FwALSgWbZV7T7jE+uL64AwrVvOCmq
         p95dx4hUy//JylXZgF6wT8tZuHeH+aP2pfoVYwB3xRPvq0yruldB3TrO4Y1kxqmjLnD/
         5C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975317; x=1793580117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=p75pLOBqPJ8sZodUK+bCHCUO/iknkRcrMosQti/LCpJGGhUUdSYmXpNANgcSgyHVj5
         YdPHwVFf2aSFNozTkborGYVfUk78cV3NZl3AfwQBNGAj3eWDUSn6dP4MWoxykKpKg35x
         DCf71qvEsQvlDFo/LayTRJdqe8UZ9WdTkqyuJaU1e1oMhNktAZWZyjQFbTTUYNE84Dmx
         rU0uf8J8tEPTadW8chioJXcqpk6BvUaINy1nFMRmKaly5wf3FE0Ok4+FnIQ+q72IdOSB
         We6WZcBOW4jMNwOb+nSUk9VgFHpmdKEkpYL/AgSd/bFAAE7hzYbEXpkzuBtldwtobcNb
         dpkw==
X-Forwarded-Encrypted: i=1; AKwUvBwj0F4aVYElIZ91gRSWhpZPKnDSZgCgAB+ZT+3ns28vk5s/sFjBXGOXWMF8cvzXQMtYDq5HOS8rMMEa@vger.kernel.org
X-Gm-Message-State: AFq9FYKHcBvCgEvkNoU6huZ46BJnAsXF5hOpZ0MwXt+Kh2FF8zPq2FZ7
	9pFWzH0wKUMRyJenmOubaZr//zoCBmFP8Ow0Hd7cxutmA11OJBhj2dnS
X-Gm-Gg: AYBFou3twWYLuBX9IiTTD5aB6iVtX3Kizu8n6yUFS2aTqCYAlaEOXLgcTNxiT0EbncF
	ZoMylF1veaR1QObg7TTbaSU31re/dD3ElpMx6VhBClCNCqQR0EG+vHzwp7szVusTC+h4XMi5ukO
	Z1t7fy4dAKuKAwAxp+11yian5exHEg/2yfPYDXs6pdAIarzdlESUQm+Czw/xpbhPi8WRMnDUy+i
	5/hNxejie/tDFbnk7VBZ2UJOUvkMRJlh6prf7B1U1729hkt2h4gHFZE7bFp1pYmIWq/oxwE+OvT
	PW9XlmYuU4DC0qyro6EQPpWxykPukT5FPrBL71I8a9hvy2UtQOy71jZBezErADJtFZ0eJfKSJRE
	+2zzM/Qc5gsFBcWQ35M7d935RunaZzW9NtuldIIvnCipTvQz3TQcU9VZpYAJ953/FpZCfmaDGak
	ksqnfq6GkxHBPwem0e0BPr91y0pcThNkDgenCw6RndWES9vrNP5UNt9jKsD1S8f/WxaAHmgaGti
	Jj2Iow9MhACC8j/BPbF2cNDie0FyqrkrUhMjCnmRo1BdchxHNrph3gCoK4SG6Py7Mb/Ml9oDzBG
	m0DIbbDui+W9OQ==
X-Received: by 2002:a05:600c:4688:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a35ae71750mr96046025e9.3.1792975317060;
        Sun, 25 Oct 2026 17:41:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:55 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Date: Mon, 26 Oct 2026 00:39:12 +0000
Message-ID: <20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
always-on before the driver stops doing it.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dc7ff108aa85..bd9c6c6fa117 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -154,6 +154,7 @@ sy7636: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index ff9d50942884..6cf5603c0752 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -327,6 +327,7 @@ sy7636a: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 				regulator-boot-on;
 			};
 		};
-- 
2.52.0

