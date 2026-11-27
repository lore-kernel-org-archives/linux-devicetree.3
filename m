Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765674;
	b=O1dgt5gFOqnJVo2jODv7Y6A4Fk3cytkNXMS+lSu8HVzH9TIdRBV+daWf+aTjYDgj5f/r
	 2toQStxFd9ZdHzGPz3KbHnHXum0ygged+EKO0bdZbJpW0ZAxu/ROWTw5XAulTteGyH7zN
	 bqyPHl1XH4rj4sjP9uR3lJj8aFpDfJjzLZRyYc8TdUub7bjLzgPjhZJX0kTsrz4YEDumr
	 huhXtubhvqFWQTfmX8OtpsCQbE2eIu5FMaKl1f9FK3aoOQwI2os8CF7P/nYiH24SXUyuA
	 zWietO0s4chEYguyiOrfm1D8+/m4xYOdZCIRQGs/eaKreszc5IatAPuA/AJyLAhZSKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
	b=N3vFHK5G9hCPmx4aUg+NyHWYTON+DY7riq0AzZt4EQOuMixIYgJ6IzG6+JgczGDoBqh7
	 pt8T9/L0NJwR2oyoZrt80Lc5nHkFB2IplIPHybRQ0LTDTOiphSusrSe6u100NpPnGkmEa
	 N8vruQe3Z8UPa+M016iW8mGQGsrSt/uTmw9fQiXTMaoXcZKzFyxdgW4FQXjgnhfte5zD6
	 yrfxXwVIm45ZMHLD7aXMTL6fgE5QfXRQAVAW6cWpBJdRJbcJrFKcrgbh71NriD0ipU63l
	 g5DjQtJd8eUmLobMHMBo3GdHgO8LUOLgeAGFt7fsrC5wrEqwuHChp2T1LdBMd0bd1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMy9e8A7;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C4606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMy9e8A7
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386d36ac055so367221eec.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765673; x=1796370473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
        b=PMy9e8A7PhenkLoVFKCtIzYIZmYyQnPnkmacehevaFEl+DwoyBN07mWiplcYJwnnZs
         0GgXdJi90HKlCdd1gAOFI9wrPZ2AeSJsN05wQqPMNwDi3KEr7c8o2qj0NB2Jqpc3/Wqi
         iaD0Om3Rkgzd/Y+hbNia/yIGIFtewxmzBnzCkNHSZjtDbN3yPWPsNFY9OOsXyd1sdB2F
         aPeCb+bi5ytFikCjYe/IX+NvICTeG7FuUtK1KIuxuUcWjRo8qxwRGBDderAdAwF4Istk
         1x5uUv6Ycdt/g2lxQhS0gcqGBRmyY4YbRxTEsmKaStSUEvufpxNddUlI+15h4sM4PRCi
         wLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765673; x=1796370473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
        b=zxeR7B601wPONYkyv7d5Wx1GAp5aDWIUGtOrIKbyjQUW7aeXSorrSjpcK+nVy8nTrb
         31rPeZ9f2uN3EgKRHCVNCxv/iYcuwfbgBeS/UlDxPR/pBLI8YRwhbdZMAXIEpRrR6yA2
         Xkxjkw/kSywCyZy09b3ZvexjaK8OPz2v9v1Ro9RUdoZYv0U5fMBI1YVNmxsYV0u8ZcX1
         WSilXKwUEUIbjx9Q90kp0cGsHn/CSbcnl+jtGNsmvy8w+WAC4/due6WrWHrTt8/5AOw1
         Bf07gjEpquVWNh5FaIs22jwpa9kGsGWoZYZxCv0LEkn2WNPFH7NdJkWvnDMjJvgh5LAk
         EERQ==
X-Forwarded-Encrypted: i=1; AL+hErGCfWKkEJTQX+aaJqM+vxfRybh0RnPyObSbUF/lAiSYCbSAkF8q82sxisMoQodF8hT3ThIognVfSF9p@vger.kernel.org
X-Gm-Message-State: APuU4Z86z/PA77gPZrxi5CP74mhqj2XcWIKcPQzbDbPXWDGWNpaBRfR7
	+Lm2IUi00+3dowbSXJS2b2Sh6S+/sMPGFqICKJxw3qSfRY6IPS0nEn2u
X-Gm-Gg: AZFdTZeB6IbJOaUzRKILm8i386H0RMAvpEmgAkTttOh2LwqqWSTzGmN6USKDnZwqDpO
	jfoAuaNwqXmAGRU87iFSshxNPhaPNsXOJ8NqoTPEkbgzF4QJARz8pYvMGjmmaBfO6FSZZBk7Z4q
	AJMC4zgZHMolASdf9mMOIxBWh2oxubae+aRTEXZU6FtQuxHVdMykziG0sPVgrO5IH7rwSGy+uLM
	lXjBsbDxeSYpWRFX34CZi1sDbnkTlc3wHYU5AKU47Hst9KBrc2BsMjz10JiR+uneoVjYBsMgiRs
	N3nZ3FON3z5mbMa/d0aZFUeTgW7zqp2bITZyV75YWWRCeJrY/f2HCGvRqWYx3oIRoVagWzAI4bU
	vq3kTyPWLBaiqyL+mSqrSeHSV6DSzRVuXbYLhn1wMqaZVd8axto8BTHiizVFNNFwb89a1B8kwsP
	PjJ2ROjGVFmYr4X8+dGTTfRHOMkzp2zenK2MHaBUii6OEWjUM0V2RJlIe355CuT9lhyQJQci4Du
	a+Xvd59ZfNOK8YNMeKj83nR2yUZ9r0GwOiHQqzW/eJjMxO9JcFamPvrT6Cbmz63+GQmjQoZztO+
	pYlhvOquKMEyh4nwr6nSHlRWQyDAgGnrAeAqzHt8DsBSSJmpw0ecuiT5SuTBdC2AkvCFk6yaLWh
	Xqi89H+cp/WYSLquE0QTj
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr26742968eec.0.1795765672594;
        Thu, 26 Nov 2026 23:47:52 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:52 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:37 +0800
Subject: [PATCH v8 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-1-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=1350;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=aNt6jFbb1EluDVRLQW8cmmY5lEvfVnKHFjZpwctNRG4=;
 b=/TCcZP1Jwtxcsr499CMyqjBIfHlVD6fhzK+HXpcYMhrJ+L+QrrJw9QVYTVXvoidwRkIabtG5d
 mEbIDCqjHhqBq+hZHZviYPfidoQJ5XIYOzDrekMItz0qTcSXOyruzbw
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

