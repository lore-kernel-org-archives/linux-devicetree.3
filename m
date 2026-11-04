Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790417;
	b=w2fFrn4ZiyQYwUTgN+u5bpakHdfKDsbzIH/o1RWxZH5VogWeDT9qjgQGK8OCYPPCoAM2
	 NqVpisDeYbWncpRbUV+NxLWBFOoBrBxkFJ6yxsZ8x+sbwYrPk4QQhh9Qdm0jAXhtt6Zyi
	 +1Ssew6WBzYDHKW0QvouezXgWMPv87bM+H6RfxsEoPJJ5FXBmu1SGWLsELrprWz2JUl/4
	 GE7g1XHxNqda0CBjAenTalXxobeakc4DqCRIq/4TIY7rIqhlZZAcrcsTCRHrrOLyPezug
	 uEmiHzY0wEs2Yz8u0LDzO8tFzz54VPhCWYwsKc9GY5+Yq9IQRZG7dR75YO5mDP0xQ7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790417;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=28vupFRCAsQEK/lZrLM3S/FU2qxtBOxPy/hwdr6RjB0=;
	b=RhOPqtKepmkuymval34IcHhOjoNxJS0o1w1CQnpaXtV95MrY94iWLnpj3LJ7pXKopffN
	 O7MVmRRrvrL36W4xeFaLDDGHs1JiSgGIA77i7Yug9s5IKurFrmqvnGCY94jK1SFLYHBs9
	 AulS+GjyIvq3mGjJU2Ir8UJqHunY8XaXjZHQP8K5ITbAFCVB26SUtrHOcuhXIp6lEvwQu
	 pj4IM4nh/uMXYt0RuehvzWnh+KheBWLZNiFuc56GjAfh6Dv560/akuccQbzADMqDNeKlS
	 p9+JQkM4aWIyuIb3J3kJ2hNBMvAjZ+8cCz/Md4aM9nTa47gHbANV9zRBfOsjribDf8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=VmuuHQbT;
	arc=none smtp.remote-ip=95.215.58.154
Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA34606A334
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 11:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA34606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=VmuuHQbT
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NghsSAOsNM1EUmMpvZUVbGu97ngzH5wIbFHRrtkfsWY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790413; v=1; x=1794395213;
 b=VmuuHQbTlg+J1MQBsJEYvffYl8L/eFSy2iRFOOTgbf1RriM0GgVtjYcAzHj8K8liMzXLp0xY
 X7UvzW0FeMQA0ujMXfAl02p6bdkabBDH6HoAgIQteeVE3SXR9wWAX6Hg9r/qDFa1gFLKIuhoLZ3
 S6Hfc6a57zfWNURm+cWYLUC2GUJb20T20+K2nWWT3nCdvScVLjCG/SE/HHhbCEKXI6ToSAN8gZv
 tZshpbNTzv2694g8npfBMz+Gb8zE+X1TwASILLEAG1Fl0ddEy3pJKKOsraaI1g8yRFbg4XiVv1W
 +Hx98/AUqhZ5h5armBFDiajQI4i2wqLDwcl5a+rOfE3jA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b32100028a2df84d;
	Wed, 04 Nov 2026 11:06:53 +0000
X-Mizu-Trace-ID: b32100028a2df84d
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Wed,  4 Nov 2026 12:05:04 +0100
Message-ID: <20261104110640.1132917-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
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

The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
Add it to the NanoPC-T6 list.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..97d414024119 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -406,6 +406,7 @@ properties:
           - enum:
               - friendlyarm,nanopc-t6
               - friendlyarm,nanopc-t6-lts
+              - friendlyarm,nanopc-t6-plus
           - const: rockchip,rk3588
 
       - description: FriendlyElec CM3588-based boards
-- 
2.55.0

