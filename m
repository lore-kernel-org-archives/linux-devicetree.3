Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587531195B;
	Wed, 10 Jun 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101307; cv=none; b=WnEnRuahLCsGTB0Yq6GtdlL5fd/wggEfw3p/R5eiGFUJhERSaIYDCTKijkAVlpz/zsPBSOFJJ9+Ayv7ZxDDS3u33k9T5ycsOnP1YCzEytyc3JvkScNQryHgX5N7KjDp/r9nRZTibdyGh0FWzBKKw9p/0LJLGCP65kN93U34vDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101307; c=relaxed/simple;
	bh=ose0dKW198yieSp6oz0ALm77FZUIIKS7LfDBXIje42s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfTLNpEhWnyy9zDDsRNtcLbQ5lNryu+PCXBLv0V7gn55GdJXcnuLo0pvugVkRADuPBxL61PHe5YRG7LJko+dccBYjbrrVk8u95s7LZtIS+jdw8qtLeJyQieqJO/QUrGnyJ33jDlnRile8UadTj+nawZNYyO1gneIpsFiPBAPBCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=XcMbTFWE; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="XcMbTFWE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O4pONKxrUwGGpP5FKrvZrME2syuxBziNteMxDKQKVco=; b=XcMbTFWEV+VlA9OtyQs45JyHWQ
	hGiCYuGK/3ZeVrmmFzYN6+DTZTVr2FjvwoHw1M/V9w/ZELI4hh7jVVrvBb8PmEq+haKzZ6o/XTB3W
	+/Lo6Ux4mFnvCM8ko48SEMNEDnWtOUDxiwMcbQs+X4fnm7bfofK7yBroTE0+w4+96dGQms2RQgthB
	XjdwgtXj8p0jhaEH3Wfd4XA15PoRpqm7pXlr5dgElBkwajyHbLdckUhUuY8RZK/zmpXY+Ksw6JDXc
	XtFsioZzIwMKfXuddM1QYobHec5GQXy8vPiTFZdeyc0pTrnwp7BlslnK34tvQeyiyoCM6ouKAYgAi
	sdo+I9yg==;
Received: from [81.57.40.39] (port=46646 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wXJSP-0000000Clj9-27pi;
	Wed, 10 Jun 2026 15:59:01 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Wed, 10 Jun 2026 15:58:59 +0200
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Youyeetoo YY3588
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yy3588-board-v1-2-4bb7176b6826@superkali.me>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
In-Reply-To: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781099938; l=912;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=ose0dKW198yieSp6oz0ALm77FZUIIKS7LfDBXIje42s=;
 b=j7mepm3xjI6o003pNzkU6hBrk2GtmSuwxVGCYsh4/I/8Q12AaqxQT1FLHKwfcKwZFwWFo7k3b
 PcCzqzXXxy7BJhPvNRxUMuGYhUhgEnQZ2ARIpn2z2mAWzGMa9u3wBau
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The YY3588 is a single board computer based on the Rockchip RK3588.
Add devicetree binding documentation for it.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..e7894d2b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1347,6 +1347,11 @@ properties:
           - const: xunlong,orangepi-cm5
           - const: rockchip,rk3588s
 
+      - description: Youyeetoo YY3588
+        items:
+          - const: youyeetoo,yy3588
+          - const: rockchip,rk3588
+
       - description: Zkmagic A95X Z2
         items:
           - const: zkmagic,a95x-z2

-- 
2.47.3

