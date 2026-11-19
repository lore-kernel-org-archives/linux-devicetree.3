Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101673;
	b=3qQWXK4HTYh5c/7pTVzHN8tKHmcEXeKfTL7gY0eqCzplm0PiQ0Q76kCWB8e4pquyfPO/
	 cyPyWlNUd4rcEkrUK8UKT+hkHyRDo6n6tvPgvLp41TEySidq6BrPTn7Mxk/YuH2dBV6jl
	 /8OegnTkWhTRsqcn0w7tPGGsLjpwrkPCyqEMhbSEU8Tuy1iXAbfJA7xKxZrggW1BaUZnD
	 GsGVxJRF4jy2dfhV7MwQhosjvPpnhf9B60g4eYu+aOaxquX3lenNpS50uGQGF3EPoaoOt
	 sS7nu1NDDbslX8aLW7BXWez7wKczaNf2ERt2n2tClWMPkmtmXSqdJDVcm7G/DymU+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101673;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LqXHUUaEAYAv/Q+Al8HLAFSVcPECY/QLRNGskJYYfIo=;
	b=lLWPf+Q6qvwWzb92Tp8ehnPPNy3gnpUEB/YPkGacHyCcQqRPx3I9cjSCkCQyhO5tjP1I
	 EenNJQ4EkHiuomslwvKAHnlYxCyMrdS66tRB6lbNwY37iIWk3Dswy7LDZYVJVvLAg/V+F
	 sdkjKaBPTodW7Y6qVY1TDyfV6xSVBU6oggTfA8prUhAIUD9J8HnYwWdY8huF8Tez6An48
	 QtLJ63MjjFOcunpMVP0bGGJ2Dq2bVhDEO/gXZpRuR+ofdwtGdfJTNd4LIq3XI1ypih3l/
	 F11gJ84Xkw/Mmafvx5jA8DgKFt9lFZHyhDoRM95nEjodsGjNjBVlbP1IS8XtMnpWhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b="zHkXB/+a";
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=nLoyRlvi;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB360A2613
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCB360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=zHkXB/+a;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=nLoyRlvi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101671;
 bh=LqXHUUaEAYAv/Q+Al8HLAFSVcPECY/QLRNGskJYYfIo=;
 b=zHkXB/+aYATomcDevXEbPHBCEvQatg51xNqqI+dSLZ43d8eJXOjydtg1KEilvphHIsK3QdQHL
 Ue2AkpVFAqV6mjEOiHWS25TkYiBVZgTC17fePY2F7zb+RHPNvH72wDb1fbpgSv8vjdL32cmnrag
 0tHCbkynVV54pbUjaSO9CsiyNby7FrXZZk2+EqWER+0SUIe25Z274dcOvHwrHQnrWNAprU6erHX
 MbVvRwLpw7g1LT65rVS0DuI+YEyuxURL9Au8BgWUrdnh6On1Mg8CqiON+FTNbphMO0qn45rdHD2
 EwH8gPoMLOHyMFUtEcB1f5uXAMc/thYoZ+QVA8HItygg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101671;
 bh=LqXHUUaEAYAv/Q+Al8HLAFSVcPECY/QLRNGskJYYfIo=;
 b=nLoyRlviPKY5LWeSpR4+KGPX6X9wQVs6cc79lO6MTxTGfUD1itbQXNGOJ5wf5i4K/zTTTs+hP
 1ykg7DPNP0f8PYRvm7O1r1ThkmVSlpUOIxoftUeeyXUoRh5Egl/PHmdCM09N8NBeos83TigdsVO
 myTzciIVp27ZVzmlwsgLfW8=
CFBL-Feedback-ID: 6aff13e483f3cb488062ba55:35c3a38be5423f5ccd1bd3436bbc3bae
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e483f3cb488062ba55
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
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
Subject: [PATCH 1/8] dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
Date: Thu, 19 Nov 2026 15:20:44 +0000
Message-ID: <20261119152055.556266-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
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

