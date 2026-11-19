Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101677;
	b=aI3/gC9wKW0b3KmMRQg+I5Mc+EW7SAe50HypbznqylCLY1LrH2kWFM1e5Wpxgkv6+I6d
	 Wi09kjGT9bMiGZUdc0vr7ddOUMoHwQ+qmyTFk71JEaLK1OgzwX7+fCvuxbCvDHu/+pxWn
	 dSnU4VwVKcqQh+2rIvYthx4VEx855ATE8Gfq09lJZDbzZSBA7r0d9sA2QQPJdTBAnkvEt
	 o3r4KfTCJHWD4dheZErhMT78bX7CrouHrCIShAMiMFjFIM2x1pT/2hdVEkXGtGkqp4U5L
	 /9H1jjD6Y/5wf+CbeRWUR0lBHt+YAe0zV+aUmsXbj1qrts4do1aeXYVpB+zK5Z5aiZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101677;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
	b=o5Q4tayXEDXOdZ0ymcJtnBJt7jCdEhH3bC7YQ0ijor+MZIzh1iNb3zw6OAm/CyCtpFbb
	 3Ho7RD+djE1CaC20a4PmfroNAmmctYYVvT2i7iSe8jS16KqQQg5DSeAAfDY1Brz7RJeQa
	 ZwmO215OEGUdiKlY2lIyhSiH50oobLEkgmche0hfBQol8x1+gyVIRtPBfTE9NsSeIZ6Fv
	 h2cNr0C9TlRwD2SvfIFlhLsG9xvnbtlxtHwAvJpYiT3WQ5yWwGTYdeHULkcXxQk9ij3MP
	 KCgwo7VkJ9UNDzfYH2hyUs5VEdvQvfYhHrUPpnico251vDLKo1DTzojC5Ptffhs+YFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=mGU5wo7f;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=p17Z2sO9;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892A160A3804
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892A160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=mGU5wo7f;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=p17Z2sO9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101676;
 bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
 b=mGU5wo7fb5JOeRKlvzUSIvu7MR/Pn9Tccs5FbF8OMdNgtcsF2TmgpMzu2yMVN075R+qRA89Tq
 F8SjZ5AAunfQmRsbOICqltZBAQwiPE8la/SJCuYCF5JxtjIAnafw5zZbMGHRBovau2rIQ7HLPO1
 Vui+UElyDOKpaIb7UH+yFrwk7G3E+QZqiyGrqmLBDXrXywyHOj3tEpUFJd1Twv+ofYCJK+zrX97
 8MIKXNI+lwwDBuyZL123MERzeUS5LvORt7fdSxVn5uE8+AsqUc+P+XU4hk+mragS2FsD0BajYTO
 N8OQcp8KxSK7tINc1NBzNsdqb1xHoE6vjv94jNbzH9Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101676;
 bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
 b=p17Z2sO9yr0AB/7xepvU80pfa3pPzhh6aZO0zQt15AtGjQFp/7TF2CAq8okyBQqPpz4uy+tPq
 36Pjq7Oh/CEthONaD+88Z92PpamjvHpPMv3Qr19DvF5Hns7K1g4U03jr0rfPi7vzSXWNktisAwj
 kXBvzjLmy/73IN9KH9fRusw=
CFBL-Feedback-ID: 6aff13e883f3cb488062ba87:e2901e9a9683cb47dcb4d9093b60c712
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e883f3cb488062ba87
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
Subject: [PATCH 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
Date: Thu, 19 Nov 2026 15:20:46 +0000
Message-ID: <20261119152055.556266-4-jonas@kwiboo.se>
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..37321e23b087 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,13 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1

