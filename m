Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699762;
	b=AIlUKFyBQTUO0wJhoW2QWoBI5BxQNh018N4NzHW2AGiGC+9+9Tc1IOpwiY6hLxBvw6Po
	 bjynyJJ+OersLldpUnjR/TBaLii5wWTaXb2h9z3Nt1qWDIi1qviH17+7qSeLqsHtYP6Oh
	 0QLpQlMFBOwOBVGsahoHjgRkgG3p1lOjBHkNU6QZjQA6LVFb6v6VGmTgnXDGuqQbRzBC/
	 fNqFKA67x/tvy6bc81SZR3jBvJvM7KJMhW3RISXYAS9/YakR/qwLBPwirCD+CkVqVNCYP
	 PxLYXo9ZMvNCziik3iyfCznRaBKnojhBiZKxUOi2McEEN88itmEipIlR+FFDMeGVUhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
	b=jjQxWqZn4PwOE4yYxVrGZowDBsv/pEGx63B9i61DDKkAix1nNB2+vlqJAFtVejDZCBkp
	 fQmDbqPV/IrljWCl1w6n2uY0PZA8tOLCa/RbavCgLP/xvwA2U4g+tKoPgpLvhvRnGrjfV
	 NFwS5FNDpOC9tQmw8k/41lKfqaebq8dF3B3EROE56Ne+aKuptkqY6HxU3Ki11bjeDFoEj
	 UZQP1u4L9TQUyM6nTPMp+eAOUO08WWxU2oXSc6VioXrvyHWoKIRseBCImaOxYArJgVKOf
	 7CXiCXU/EKQJcaT7dMCYjcRm0zTD05HixytyOOQBUVm7L8yJBALl4c3rsMDducJZx8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2070D60A2606
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2070D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1091996a91.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699761; x=1795304561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=h3uvQOmR0rWs341RwE/hWRujb+w/Acj48NC++U3xqw2uL8vEXibItmD4r/OnQqYlZs
         VfFM5nG7f0KeXDc8YqrX/nt8czV7aJw/bcr9d+RkZeT2kIRtBMRd3meIkWy5DHA0jBs6
         FHly/uqx7ZkK/sQwS4sdACutwS5rKamhGYtUc8QoiDWh9fReO3IkvBRnJEFZHgsDFBoN
         0FKLlJZkLKjehyc/AjjhDjTEfrbe2R21s9COVjlZ0+OKZ3CnE5Nm9vlS1ujHNsb7Ktyk
         gZcWSSqdYPtzzA3/yLLa08saFC9A5/y2sIKju00aLxprlEHL1J754FB43+vgCOCo3jIX
         WeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699761; x=1795304561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=npLFFmLto4YiEa9IPG81SUK9x9EoIE2HlliSAiSwbJirTPfo3hT7zoxKh1ESnNFKUa
         +FHNcHT8PJDtbuIS9meVOVauiPH4skvJEmukhJNAIgC3ASeud/8uBO+5IEEIwz4BliXq
         DMUXCvSw3lMDlMPfE0nHwW0nR/UVrBZ34aCuamQIBPwXUq2P2EjRstLTnDlpU1gRklZS
         JPs1GfAwU/PQy9FsK+jSGmBoHplcGIBpFst91NP9ilYHB8NPNuRO0n5QBP2ibHGnw2D0
         Tl8ZUyeI8Ccx/dS/jM0y3tHjq/0LFx6n2FX/OQn31xcwsF14kTUEcNeKg/NkQFeXZC+/
         Aqag==
X-Forwarded-Encrypted: i=1; AL+hErGa6ngDG2J0Xf7RdAmQN5OaLD1dHXFKz8xQkYEKgpDDNcj3HIxfipNaQBDBmrGDR7UCNtdsHwoRFq+/@vger.kernel.org
X-Gm-Message-State: APuU4Z+8mCjs16djcgj1OlY2newxfw2KUgE6V/7hQOcq1IJxOa+kz/br
	qPSHoBe6TJiw4GsHHx0dwg9TfzHvPtwZKi+w+VBlrRk+i2SRNErXeHhk
X-Gm-Gg: AYBFou0zgjyBTHx07LbuZdt1eRx7FUr4lVB1ksXLjqLyB+aiE2ria4xRbJer+a3AhbB
	fvodqGv8cliCbz+HmMBkttIpsegSql3AlOohhMmSf+syBR7FTZ9i99Z5yK1lu4ftHen0Wt6eB7Y
	9uM6XlRxwGT82KNq60ZU0AE0uN59UyTO+57B+n4+fBDhEXSTwwIQfiyI1clr8/HJw49NU/zUs/Z
	oDfofDW6APGQx/DLYS51dZHyhOcB3rDBfuxqjB/tK2RqptzfE3zX2zmjd+yzjIWccTQ9lK7u+de
	gj3z9zelDGYTQzcVLXoFvNME/PLSbR0/ekIBNl6/D0Tt8XyATfk9SXT8tOrrEk1FK/aUCrRVaph
	jS8ehEl3v4WTgu8YpRNHpLFNcEG7mXVFVUj7knJGlvtW7VKVxF+UriliXxwZ/Q3E+pqepxDBbQt
	t9LtQlhOkapBjoIHKLdIkC+mN80tNnNkvGqmuBhqZMi9FDO1Y8vcQu7StKhRQ/89OLoPxc6VaY/
	OCb9JPQ3kw1XTpDw5q4oueJR0AM9Qcs5Orb4Yma499MNBXvqPnV1IpUeVHiTlgOoK6WVk+uODAH
	njCEUg+CYZU3jGDz5zrY3AcEBssfH8JC8MJZL+plItZuLMHj433OWOrQ5OFF+zS5pkfWgk7D2BP
	xs9ScWO2wa0LY5aGDeL4DOQUAbqOHzAXfuREzMrKQg4apCVuagwpxHbzWsZN6rDqqf0CwWAO4+J
	eVRDICThKinpuCajJLqrKmJbc=
X-Received: by 2002:a17:90b:4a84:b0:3b0:ad42:dcb3 with SMTP id 98e67ed59e1d1-3b1b09fa377mr5893906a91.14.1794699761489;
        Sat, 14 Nov 2026 15:42:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Sat, 14 Nov 2026 15:42:20 -0800
Message-ID: <20261114234222.88337-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 27e31452544d..57d966ae9722 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,5 +11,7 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

