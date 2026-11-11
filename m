Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434264;
	b=FeLK2bGzMxyDpsqrCigjj755pFyQzAUsZaPxwE21BaVms6/cj5PM1k4uVI7QR4E/euSE
	 dUy3aqjbPJm0fvppDuuXawdSdxaNSGRZ1pRJlbqXN0qmwFUsB06l0+aTHHxEYGq17VjA5
	 OoiTCXHdWv0WBpfQxDPZ1QcbwKwTgsLb6sm9qI2PkWIypAdrptZ6UfwG23zuDI5IQ1NQz
	 xAN+q2uBaDh9oPYLafFxdmn/OvKGrkisCd4z4mmrp3Dd8l0CIlTULkGC3xycIA9AKskUc
	 QS5yx3Nug0GEzd72dArxrmAZf13+02kXaYPjYOVQNOm+peaGmnhkSbhopsWH+EaHnfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
	b=UVxkQhfLlA44Ix6N6wQpotOQ/EYiMugmI+RRxuEq1Op9hIhnphuyZ+jOhlfGe1FFb3R5
	 kO5zTNdmCuvE6RRSiVJiNrzRzK8R4wktTMuX7gp+VglHrJNJ1U6PO1uVugaXjvGz8UpHJ
	 2IL1x8dhijaIvEl44GaHe75qx9LCLxDnVgnYuv0UlrZ8fBO25jjOb4fpVpHyWH5bj826P
	 0rxdY/YQj5sgXC4SS14MXtaYfKljglEBhPqWizg7jDF0pxV9QtCKILbOJJYPnKQisVw++
	 M76iOjXXKUFxzkMyhajTQJi0c6ufmRpzyKdG26N41vfaX5tjcFTrfqtVCNLuG8LD/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B360A262B
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66B360A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2106661a91.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434263; x=1795039063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=VKJ1JhnHMnZGCpinQvAzVFJUC+MbAAWmd2u5CI3zAOXpLFiDx7qCSS5UpLi1NaBYYP
         8jq2SRgENOiXlwWGjY49oH4aMdu+O0hzKXwExUAzMNnLbozVx3eyyU4T638F1VUbmpnM
         6PL5odfyF2/P2ZtBS32m4knDnod0K0NDyVKjS7kMrNWi35aTu5TwNxgQcsMEdh1H9+O6
         nL8I6S6xfDpE0Gnnzy+IKFUPeNVSubrO1pBsr3skACJx1iDKO/7OHCCODCaABc+8d1E6
         /oibtIOK4J3BvX0UKCjoPTtSLLF/oSokhlSC6CY4EgPFqEZbGVD4bcPp5WYsijHc6ewt
         Tu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434263; x=1795039063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=NHq53yjY/H481Z77Wgpgrd/nSpybiYN5PW/Taj8GfUBUm18dEvDgVMv/wsMHEQFNxF
         QfAOzjPcktrYWN2MkJf4c+A+2mLI3CaBwcRPoCyklzPMLX57F2x0W6kEE0Bgz6z3dZFw
         nnZAV/qpgIHH5Vy/KsbP09rGVCtaf7XWHEYnbTonVvIw2GK8hSQsL+wSVpQJWnvqkUB0
         qMA71mbMUAbmG6Vlra+EbxfZPrGyvX44uvXWbGKrHsHb/qDwwxrxXUE+mTTzWtGqFOVT
         cBM0Vi/pv1yTRKNmmDvdkMObtwjvT3rtpsxHX9UopyaiWK4VBFz7NrbY5x15zdXsD87/
         el3w==
X-Forwarded-Encrypted: i=1; AL+hErHNndH7OUZGfaVfbuaTdYocY7rpyphnKyykhT5ZoRzvPj1w8ZFxEzxrfqCOnR74stWpM9fitW44rDc7@vger.kernel.org
X-Gm-Message-State: APuU4Z+13zpD5Pbui4RDYVE02XHs9BHCHp7zf3CR8v3Yt7nVZd3esQlS
	tSAgRMim+at4FnNVlcAP+dZt+aE7bjgnMWnEmQtd9SGhVlqVtTUH62K1
X-Gm-Gg: AYBFou0ZCLuZKVD+3SpmcuWHuU3iFyDaqXXc69GjklEonQAMfyAuDci4lEHV42ZNAqg
	/L5q2B1zvm5tJqsmZ8DcJBlzP03CnBpQBU4J/kWK718l3euDVS1GQb5qzQBMvmV7+NSMlOYrnSt
	AaPIIAZts54YLZObP5fz6O0UK262p0FU8Kcbn7G7xV8OHHFF+Ioqil+AaOOv7ru5PWyz4D3wKOg
	4ZDL59D1tgP2sjkj5z78MLLEFvl5BQRCgIRYcG2N5ahnqjzP2ncjOEZ56tQrECmh1kTz2ba5mI4
	T5fcpxmh4wkuFuDI1SOBNNtwRuCwV+sZEWrHwPAI4IZL8ptSk2Z+5WnBLxOpaGA9ow6DRnmMElU
	4qtbcJssPlEBAoGmfCP0uRmRJDe1ZhIUDhLscjdClo5iOFh2I7Yf70krIkhYzuTxjIK7njN97iA
	aW9EIdr2CJfVFEOVwbk2dGxn6OI5akW2HE8nhtcI/pCKEll5DK636mYQ+Hj3GvQUxmRt2GY5Cwk
	z8JGGuxnkXLOvU2vsh30PuC8iN8odAPg6fzXZHytNzqHW9Gp6W0LmhOcQ6K4ZoFmKFb2kjxProe
	5vdrtqJ59OGiZjbifXNTWydrgmcyKxQBzW4m2VEy+KtdywIK30IwDgelUcpxtakOS72g4pVj4mH
	VNXGzHV/wOTTH745ULYS3s2KyHcEYDllgDanuM0rueEgCAJWbO+dV4lDBlgqXHSiFrARH5JjJrg
	LGvg==
X-Received: by 2002:a17:90a:c2ce:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b182fdb069mr3632430a91.62.1794434263235;
        Wed, 11 Nov 2026 13:57:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:42 -0800 (PST)
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
Subject: [PATCH v3 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:26 -0800
Message-ID: <20261111215729.10683-5-rosenp@gmail.com>
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

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

