Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434266;
	b=xoRisIHET1ENtbIH+XgtdLoTHlwPavF8eG8QpAoyhCH0Q/Zy/TGpRRZAtwNt80tdsm+O
	 RkDKpU7Q3ysPv4+MQf1oH74UKK5fX8TdRwuRJY59S3i86xgx5X4O23p9wyF5hnI1KirNX
	 9xaiSyFGYV0J6MqJQDyeuHNCTe7T4G17bij5ULUH8BKjHsenkvfw/lOh4IXXUcwY/kGzb
	 lGZDvS2AE6shXIuEq1R35o6AMLdmc1KK4UrsABsq4nylo9Ot+RNzMT3H7FXBC4DwMrfwg
	 Ui0eiCCpYfVDjofs5dVoSr8gswUj2cOBuIeqt/9XWHiqjM3Tknh9HpeBtAQnBpmkt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
	b=Iru6UEXqncYnuUxOAATl5pedHUq6aYcnBchGBmMb885jfJW518qXp3iadLLRSrJ+v65G
	 ZAW5NhoImJ6DKDNXGLlp7SSJdj8OpjEzzdbXL+5BMYszKVoCZegOt0Kr8oJrfpnQm8Nfv
	 tfuCx9kkaWgkL/x8AQDuOiesx/ACybBWR/dXD0FfVxuLat5cj+hPoidQfEj7NP4FW4VIi
	 wy50SoQbeoKAH/MxIYyohaTc9JThfRYBU2skCkhc3UHGXGJO5PbgvypTa+cDFHUyiuTFF
	 QXUXpgUCmg58SmAxsCWld+ofleJQ+bG8Cbip5xddTTyBIc7hMaEC+Nkgww4WFaWSWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rrVIh/Fd";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504D60A380F
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B504D60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrVIh/Fd
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1887402a91.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434265; x=1795039065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=rrVIh/FdrV8ih1hGXt254oV79FoZzhocTRet+LuCZ3i9sYsg6p+u8oviKyhrfht0Rc
         sUWrD5vMUOiVIOWKbVngXvsNsYnNk/f5YUXMJ0JYhZKgUXEQU2mimkGc8UHmU5wp1ftU
         ooQ31v06a6Pb/+YxXeU6izgiJ1wqCOP4JRMtqxJ6dYDSwyEQ9dsLyu38XxJRbDwnimD2
         xb7CC4Jf9cQpp69hjgOCbvPdsYZF9QFGBVjmhUmfyo+e1iL+SlJuyKlFE+q6nF+ZiLfd
         R3WlcvUfeOIun4ydxcXV/PTz4IAnxeaPjqZX3JHef0iPI511canOs6fHg6KrqIX583Ak
         xkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434265; x=1795039065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=ckbWRK8kG7b47p+FhMWnQ1Th3tCbssW/VHVXOyxu9OLhM+SPDhQaPVQ8LzddRNRBIX
         2CH6itLZkl1AJdks89jR6A34+hDu9Y6b18CugeBbvNA1XCvOpydVQ4dRKn1YaDMv3Tie
         vCwb7hyMyUCovUYjoxVhPPO0kglKubbepdHfhrZs6UmVqXoQ2TjkARa5URrmIWX2zODU
         JgZezLFsH3oDvUfo/2DIxTRQhgYjoCRpYCZM/XchaLsUGx7ItOKYqYNLT9WQTRq1n6H8
         TKLP/LUeVYNKkejQb2Ksusu93GB2z1GcD2NiW9YogW/p0DR9diPBv44rVP3PRH8Mq2Zo
         yvkQ==
X-Forwarded-Encrypted: i=1; AL+hErEdXqXZfLmqHKUBJ6ksj5eyD8K4qw+2HaRDV++Qm6S7f71JwI1fQEha9C7ReVL9ri51qQ4w00EWlJEG@vger.kernel.org
X-Gm-Message-State: APuU4Z+mXJt7rU9F2Hwnn6PR0LEBS4Vc+LOGaETyqrPFa9YFHM1z48e3
	KO3UrmExB1IgcrubLnVaRUQLZ3TaqRXIdAYo74HroMyyniQOOxBziTnd
X-Gm-Gg: AYBFou2aSEX6wTcskQ6Uy1nPWucHKPs8rmTteteiFH2j0LC3uyb0+sMGodvMVLFcCmD
	xdHa9jxKWjmxvmDOp7gMTTh4LMHAI0/FA9V1je09KfIWgj+PMUfGJalYt/myl1A+9ck3aTb692S
	bf7yfHpZH0ZGYx/IDXyuEVOwEsqzccZx+TJsJEvLIUo89ockykdwB6wyMyJ5KzQetV0nUf0MT+x
	44x5vAC2A0jcTgveNPBhbfXrYWftq7Wc8SRzSBEfJ4JxKnif8ygkFtyppppY/ZCoT3+MswjHK7Q
	FLqy9d3ld6zsZW4j+/GeWr1Eo/GiZXOPv6fqusAZL0cluyJ3ruh8Otao92q7URrwkP3z9JxbNbW
	Y47Ia69VhFCc0SGHvvWxan24lBaatO8L4t4VHRoto4IxhBs4MFrYr6jjy+MaQ52doQ4OTLLikLe
	LJP3TdoCKXmyQIrQAydaF1dHwVZKZoKrqzC4bSOmIgDtrBAUKRyq/dupeVxddCMsmbxEoTFBBeh
	95g/3lERAf103ONNMAJagZteVJVO7C3dMmUiqMTRPA5z76Fx439WlJJ+YQOhp0l7ZtqsncmCYwz
	Rm8HNe3kr+XXnBU0Etjb4p/aA+Fm7XxKZRR+MtnIwCAF9aQ8jwqn6WUZO/bI/Nq/b0RNJHDVgoH
	crLY6qwat/EYhWrxHDGc863NdoGiPJyY3Le1Pju6ClkZp5MYr2n/QJVhChAOW2AYjaurlEp31DS
	Wvq5+9M8QkVivAXKWzDRshMxA=
X-Received: by 2002:a17:90b:2e83:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b182fe6fc9mr3518665a91.44.1794434264676;
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
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
Subject: [PATCH v3 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Wed, 11 Nov 2026 13:57:27 -0800
Message-ID: <20261111215729.10683-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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
2.56.0

