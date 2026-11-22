Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327295;
	b=xPWmqnJd55QhAWVwbk0HK31Nse3xoYcyC7eC28VOAFzYA2Rmx4Xm6Gg41hkbyRkSDSzs
	 xDCGFD6SC70fbaKjTf15+ZYg5SB4ELR6/YqK1A3WWsoSIyML/lfXMB/aFq5y9dLWloG5n
	 a136ES21k/IQ6v1R+YbB/BIvqefYva8y1N3JAJOG8CfiUqOu5/cr2o6IFA5iKiCWEl2uZ
	 9im8l3py/akdGBq8dzIizMy81lzdmh9ChUriNW3uDeuSDiaQ2qwj85aBs0DIFh30JGKSU
	 QHPXuivgpNul/6CDOKmHy9ao0WzUIxIoEqb5ntpaF1hpqTQSQ8dyNi398pwWZz8I7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327295;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I4XSnmsKc9vd0wX2hVPb8MU2OP+otyYxWmumfz9b1L0=;
	b=kyg83tk0+vvEC73FVCgERuPX/rH5sfx57JLYczVosaeCaP9XrATLexyLBcIH1kcToDiB
	 2JFHAODQCi+Wvhon0sJmlzEWXM3kITHTFVU6mVHfxmi/j4QOHQNAPYDLA8hraVtIatMf7
	 flp15f8fEq2qy5gupaK9IJHFLQbgLP27v54pvsJwHAPGmqMd1lYQDtUrlJKmcuufcO6lG
	 R3eVMMut4C/f3gNjy4zgcirb5koce9jFkPs9kAP/IHsOLU+s9/KN++MUw5inwEEBXfbqu
	 oLi8mls6U7+h2ZZFTzLMa3eZQ4E3+vXB0Vx2TcPO7UfLvYwI2jMwpDagH5w9U9k34ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=MiQ4aTH4;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=oak+hHfn;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51D606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C51D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=MiQ4aTH4;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=oak+hHfn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327294;
 bh=I4XSnmsKc9vd0wX2hVPb8MU2OP+otyYxWmumfz9b1L0=;
 b=MiQ4aTH4K8yedUF5p/c2XT8YgJbnxG+REh5yvZD31bts0Sh12VNkWEUDrxRASzaa0h8pquZ04
 Fm9+yoZ3nqQLTHzGxgnzHQQ/BhinhISKC7xltMMQMrfDDnOQ2lC4lWBuPNgZDhshilBRqAeTQ7j
 qjy5kZrIYxY3rBVwJQGp2C3d95Q+g2MtpvapXicrWVWRxMXs68eGFuFahJXFA/DWzqHVx8b/UZ+
 V1YyhCvN9SWrojQ02nEj10wVWgSis17/inWoqrMTAaw9tYuTAm++5B4wtaJ2GlUV106VRSNLW10
 Kfltl/ESWj4QQXoY1B2foiB7aokQx3qrog8loUZWWcCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327294;
 bh=I4XSnmsKc9vd0wX2hVPb8MU2OP+otyYxWmumfz9b1L0=;
 b=oak+hHfndNP0o3UcQA3pMn4LN3bT6sPUc52aBuMmf/qsRd13IGCeBktMW1OH3yoSqMvbWVMNW
 PA7IbvOnKhxvEdi3KhaIZEJ0A5ufGuXdzOJweZP23qdM73TOD3jTSW0f/hH2HnWPvb5WvRtYYpO
 h6Dj5W06hmwKAwheXb3bgDo=
CFBL-Feedback-ID: 6b02853ecff95ecda8c093dc:65d2438357532dd46d95d8c19b5661cc
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02853ecff95ecda8c093dc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH v2 7/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
Date: Sun, 22 Nov 2026 06:01:10 +0000
Message-ID: <20261122060114.773624-8-jonas@kwiboo.se>
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

Luckfox Lyra Zero W is a compact wireless development board powered by
the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
peripheral expansion.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change

As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 651da02cfa51..49c61ee985e7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -866,6 +866,7 @@ properties:
               - luckfox,lyra
               - luckfox,lyra-plus
               - luckfox,lyra-ultra
+              - luckfox,lyra-zero-w
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1

