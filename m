Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373170;
	b=h9/xCWBT3CqCMIv8CFikBToE/yx5TXceYpBydNaSNM5ebYx97bzXKZIvBwrhJw8RjWsL
	 tmJSxJC1uMvV5M4kl5WBydnufrIj1X73iI5L01HXNuCaiVCOhZmuIlCuG78PETH0ysu/d
	 NG+kWCyDjBl0RMWnKcDqUC8PE4pdlnnjGcet6y9E8oIjRTmowNjo5PEMhAxar109kjsu6
	 EcICLeEgwia8Y3sByE0xfkY9NsbH6ysQbsWfEVlXoEMlJHzmaHVpAPpn3AbmGpcmPzTSt
	 W28tJzrd1ROAriS4zSSjXUbk3OSk6f3rVTAqIMcsCOf4AeXU6vxl/bwFZixjNj/8/Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373170;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=S38kz8DMqbgEZVQZq3PeZnDsXM7CwdLW30hq9lNw370=;
	b=tS6nhl6cjLpTkTQ4Bc770tKW3u2fw8DeKlk1mNHhGfY4q3hrFz9pre4cpWOh8MhReCtY
	 Jk6dOGWqsCQvt/GQdj9vMfAABSmMx3Re0g7iDiCoIcbFjsoLCppJPbbqXXO7+21B4a7zL
	 rnngyEPlyu6/zqCDqC/qLzzk67E8+VYRgW2Ux2qVG1HD3LAfip5cn7okR/w0c9ycVs9I4
	 zjfYQ7WOYpOdkw4hOh+WfKMLZYkZutyVUb7rAMNk3nyPlgdLE3tJSAyIMRTBgRhr/OHe/
	 qCvBxVoZug2nrnVD7wJLcCDEKVCeKtQSlEEkWaFQmei+ZbMb3VCpYTCXDqtLIeorBCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b="OYT/vbId";
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=YXQmbV2I;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0E606A333
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E0E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=OYT/vbId;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=YXQmbV2I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: References:
 In-Reply-To: Message-ID: Date: Subject: Cc: To: From: CFBL-Address:
 CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be; t=1795373167;
 bh=S38kz8DMqbgEZVQZq3PeZnDsXM7CwdLW30hq9lNw370=;
 b=OYT/vbIdb4gPkk2riZ5b3H51SgrVnbtKWp75lZlLGb/319QWzoIhKk+4bYWOG/jnDaLpLtSrM
 D0yn8ckD/Iobabqi5Nvv6qNm/inqeHTekwvUJFX02bQK6x4SvKvLy24gFLaQ4UDH7W/KmjpHflX
 E2X3oqjI5+xkfyxoAC3LrzPli/b+ZqvvASZr0H/3NteuSRoFwadbipYYo0KvWci8kebZZ/E/XLH
 VHpvjsDGNitww7RAjikjmOfwY9oAv/BN32iHmgh1jQ0ohUEaQ6GLiE0/8qntKyPMxedEPm8Moqe
 b6sPs+kDY5ertk3a8KCyY7c9aUMMTK3MoitaXgU8CCiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: References:
 In-Reply-To: Message-ID: Date: Subject: Cc: To: From: CFBL-Address:
 CFBL-Feedback-ID; q=dns/txt; s=default; t=1795373167;
 bh=S38kz8DMqbgEZVQZq3PeZnDsXM7CwdLW30hq9lNw370=;
 b=YXQmbV2IqjIFXGf15m+vAgCvzfxvUlQJZa8NZyU5PmTq+bjPtzHNDdb+8jZqB9/HVpDQZCiID
 P5Ilx6G6+0kH66+S0FQRy5yrxyFaokvj+Al+uHlnWsNN0x6ixhyMpzDojYm+8ejqBzrHxy/tJ6y
 K3rjn9f8C35ls+A1wGVW4nw=
CFBL-Feedback-ID: 6b0338514432eb7754305b3b:6b29310fab77a2f0093031b22dd678fa
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0338514432eb7754305b3b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM Forge1
Date: Sun, 22 Nov 2026 18:45:29 +0000
Message-ID: <20261122184532.1300004-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122184532.1300004-1-jonas@kwiboo.se>
References: <20261122184532.1300004-1-jonas@kwiboo.se>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J
triple-core Cortex-A7 application processor​​. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 49c61ee985e7..38ae73e8a34c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -84,6 +84,11 @@ properties:
           - const: armsom,cm5
           - const: rockchip,rk3576
 
+      - description: ArmSoM Forge1 board
+        items:
+          - const: armsom,forge1
+          - const: rockchip,rk3506
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.56.1

