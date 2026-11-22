Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327297;
	b=o1dOrYu2FPs4uIj3Q4O0tAw7mX/FLcuBX+hj4VwlJWCa1vmwHd/TXi+soi0aQa+jdND8
	 r95zMCPSc01uRPfAVovh2ATClspzt2GvjXGxZvkOHlih1xicbzCidGPAd0FIv4vUBmEAU
	 5uNumx+S3J3UAzoqLGGnKx2bosyNXv6fp2WUr8V0RcpD8OdJAJ4M2afYUVXfiuEWBxAf1
	 YBx+Mc5/exrR/a6zLQR7AoQDR/Ta3m688fSG8xeZuzuTC2D9cpvIUAy3PW+97J6yOXVez
	 pk1F7mhs5BQLoV4yVggvYR71k2MylByyexmszgSAJrKlA3p9B/2QKE+cizjtaLxNN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327297;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l3joljTh86SrgqgzDwpfUEKaM0c8d0FKMsL+NNKPMFQ=;
	b=10wTYNAGg/3TTl51ESTpXw8qKI2u5woJFRXiLocrPSoNylNZIgl3mMf72kxQQFKWpHOP
	 HZzK/MRRVWMNUlcv0MO71IMjYtyJWGd/bJs0QFubgLp36mrkS3XmXlQp3AkmD/Qnx/jpj
	 AHJeQx54zniL0Deyu3cGx55VAgMn56pzezA4jxtPAtni5J9/rtxjNiCPrUx7x5CvjSm9K
	 sJPlhNrejpCPlkh3ICjqSZD+xmZNUKIfsheMHXpskH7h2Xojx6fLouU0ndZOrvAcoB03X
	 vA8hSxZM8+iWoYAujCUDx/KKhSI8294olgC1YEJYhYjTJhX7VaEDFFtj7VchFFEgStQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b="I/Xa8BIr";
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=iL3SQrZn;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D6606A682
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F06D6606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=I/Xa8BIr;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=iL3SQrZn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327289;
 bh=l3joljTh86SrgqgzDwpfUEKaM0c8d0FKMsL+NNKPMFQ=;
 b=I/Xa8BIrxDwfBz4KqzVIeDYN371k2y0KJ0c9v5yfqHjJlFtz+QzTtvF8iCF0wu2/kNz4y8ASN
 EsgqaqaiDRknpwgY99i9AyFotSw5oMGP04xn4vXKqJN9GZ/71lJaCmmtVg22jxVJ8ylvLqfRB2u
 U5F3J3zYrhtFvEykd1UMrb03ik18OepY3usENiKHBhUSuT4RBoXqUbCsncRxwvql/PmNRRzU/Gg
 pmhzonyQmJkRB8SlIMP1scee0yVPdvAHziEEja/hZ2SwqkNR28C46O24bcMpvmUdEPlD+6Q11gN
 6FhLE7fL28u8+jHtKWEWEZocfdnygJIKZ1XmiYPOqtGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327289;
 bh=l3joljTh86SrgqgzDwpfUEKaM0c8d0FKMsL+NNKPMFQ=;
 b=iL3SQrZnTAP9XI7yfRp7STp7FrO2XaeaHZwmNhTFrne/OcmPZ7C1y6BUjODUkJowtMg4c0utT
 SovF/dQcXzSfJjA73c1MQFRRHrt2Vq6lbmLTslHp7M+kFkISXLqdrzojOaYhyyPfKpZlqNHt9Jw
 jod0v/Ve6UuhzN6tL8CAjlE=
CFBL-Feedback-ID: 6b028531cff95ecda8c09342:2df51f67f4fae979f4232f86c9c7a8f0
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028531cff95ecda8c09342
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/8] dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
Date: Sun, 22 Nov 2026 06:01:04 +0000
Message-ID: <20261122060114.773624-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
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

Add the GRF and IOC compatible strings for the Rockchip RK3506 SoC.

Table 1-1 RK3506 Address Mapping in TRM for RK3506 contains following
related entries:

  Module		Address		Size
  GRF			0xFF288000	16KB
  GPIO2/3/4_IOC		0xFF4D8000	32KB
  GPIO1_IOC		0xFF660000	64KB
  GRF_CORE		0xFF840000	16KB
  GRF_PMU/RMIO		0xFF910000	16KB
  GPIO0_IOC		0xFF950000	64KB

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7c138..3c1c3dc1b84d 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,9 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3506-ioc0
+              - rockchip,rk3506-ioc1
+              - rockchip,rk3506-ioc234
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
@@ -93,6 +96,9 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3506-core-grf
+              - rockchip,rk3506-grf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
-- 
2.56.1

