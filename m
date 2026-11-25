Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643081;
	b=LT+PuM+8R0QmQPe5Qo8LPl5Jwh//uDPnG4Vqz1PuS5Fy/UQN7nIr7p0Mbk0AEQlHlzeE
	 6R3kesPM1+f+0lYXVnbxUikJTbabDfFV8qojqiMqBgzt5YA77O1Bp+pcqSSwAitZkO5Lf
	 +/8D1v6uUQ9vAYGLYuGiFMWOFq79go98w03m7HNiCETLHMAGihEVHE/+JvK0sMNEgi/Xk
	 Jrg/eH823OB2otwZUuhLFmhYAsKS7gJpEWa1KYq7GJnvEtJ2uawfNH89y8CBAjls2TYsb
	 JKnw3xxHP/spvWBWOKeT7XrxXGxRshxjVpoHszfXauU/PjElz7/MD5nZ6h4ZYVeB6Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643081;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xDax2k9eB8zfhF2fVPSL/iize1OKzF/z97ykVMEg9/A=;
	b=KMuh8v1xCpZj8LtPmfzj+zs0Hlrhu6dclOBJ3dUY7FpiOAUnjvgoE/irY6DENd9Y2yAa
	 I9QPiX0YXPoQum3HL+kyJjVicDSZAkOvXMxIydq9zgNF+R4A0Mq6yQACzRIU1T0zKF6Bb
	 8m5l/1D64UjtPx3FHKN5P7Gomgd8GBVNp8sLPd3N/WtDjiePat9+ixZ97ud1FLQwb1WIT
	 U1pZtFEOP63IYbOe4sva5ptHbTUUziwxy9f1vw7c2nO0G9CblEZzBf0LBa+ld0SDDmKYW
	 ShuXLd+3POn9HtCTMOXGBfKtrR0LtGmeaT+3ZWw44hYLqxQpsl5YhYoyzL1ZpO7zAlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=CTd08Z+F;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eM19iAYd;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C58606A33A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C58606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=CTd08Z+F;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eM19iAYd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643075;
 bh=xDax2k9eB8zfhF2fVPSL/iize1OKzF/z97ykVMEg9/A=;
 b=CTd08Z+Fs7APYhvlpd55Xl4k0d8sYFFmgKLRWt9eHgjKKgpmiUKtRybDUt8BYX6ptCk0qZRG+
 hFe7w5GZaH4AY7Wv6SRNlZ5gLA+3pPZLZOV4EK2fd6biUafc49KnNp17cmEQQVpatMh/S6Ovyuf
 bjS+oEDKuqxorSHfGx4i93xZ2aJC/G4g1DgMoKsjIQJD/9YNL0XxT4i/Vzh+9rRwza4yFD23U+A
 JO911xY/Fvyw+jEAfP/248ZOJUMtJGO8zauvdC2Hg23EYwRRmkYYrEdlcuycekbLGkbQAyKF7Op
 ki1eNIFYe741o23xs+B6kqsjefeoZ0G/F7lrY2eIQhkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643075;
 bh=xDax2k9eB8zfhF2fVPSL/iize1OKzF/z97ykVMEg9/A=;
 b=eM19iAYdU7qNDKsLYgURH89I0FjakWO4l7QOdMhIUSNsDOtx6eqSZiVBpTNZrW6fCghoGsTnX
 0D7ZFEeJUqOFNHth+pDZAQW7MoXxpmDrGKpSoVJ+ZzimYKQE6cYrlH5ZAhLkvIjAs1dKKKbp5hn
 0bgLLwAKXOoXjUWrrURCXXE=
CFBL-Feedback-ID: 6b0756bff930f38bf754f94a:26eca1fa36b2a9f48f4c53d40e9a50c2
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756bff930f38bf754f94a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.39
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
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
Date: Wed, 25 Nov 2026 21:44:13 +0000
Message-ID: <20261125214421.1580359-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Collect a-b tag
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

