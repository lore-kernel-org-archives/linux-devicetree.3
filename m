Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446470;
	b=k1gx0sjG99dS8hMK+Udbp9g0tO89/4zoFX2QEx/ILAytK8STsx9QS5wWIopigRgLU4ck
	 c/oT+nbVWj/+5Jd/AZaC6LVcObH3IDrJY7Yhe6SCK25Hdt8XorC3+a3Jyx2Zgy2LF0bN1
	 LHtNYVt8rAWZ6fYLaD5XqEssBZXIotV5xbFnpuFKurehH2IirpGr4TYZ4voc+6+LxjVxn
	 srcSt6q0eB5rnYxWIP9qDFGeCInumtLMIskrcg8c7JsNcDNRtQVOMJm17aOvnsUy/AoJB
	 vGCA2QotCwiFQbJKan+7c2cs8exyCy8j3pi008wu8IVwQ9DWHfH1UfZOnXC7A4NBqeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446470;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=asoXMPMNvjoeTqlgLoucGjPdqO+L2q9h7XtQEksccjc=;
	b=1fLEaDm3ZQR8ZSGy9s1jEPRUVoJXl60rV3PGAVBeectqjaCvvCa7rmrFMalIdqzbN6kE
	 TQOWUT4cWjkk0EX5rnAkXUlZMpmdYDfphx/aRdl3TDeZIohT38SrWazKh/IKkrEyxyNKA
	 9cUOwE3FMacQ9Xf3XUvcZl3LTJObBblocxHVrcPZ0w9RPUyyUxasB5Oo9Z33TZ9kM6+cc
	 4/Duu4+B4SqdF+cLLfqGQYU7htv17sd5xe/C44cidh5GhDlZJKDrNadl6cPWiBNLQqSAa
	 /wRkWuFYf1v+TlftZ68+3CRYESp3oUZNQPhIMKjqGwJSMwK496kA6ym7KNkzJMFeC0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctfbiD89;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E1606A332;
	Mon, 23 Nov 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctfbiD89
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795446469;
	b=AnC+qB0r+olFhYYIiNIyr3kyaCRkgEDCaGfRXjDHhbNpaq0IiwrStjWruO+vIfdXKNWg
	 UM7P6xhcrqmLw49TRm5KKpXcBJIREcOOIc4GXPjfuVkIZS9JHF9Cihv6+d3N8YQBmxLoL
	 T7Imz38yhIeTbbcemZRCMojT+jUZenR8EfI61QvUnLli+s6WuHzbkns1IZUEkj9+2OSqd
	 kvQzhaRL9kyhrcL4Z5MCg4EpdrE7pRwO7hOqK8dbYXHqd0E4fboxGmILTubKR9VugKdYZ
	 8Hqs8nKibBwPMJBQk247qRloivf3DqKRQ+h4nwfAj4VStEsZCgVnmROVws/xDDI/JDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795446469;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=asoXMPMNvjoeTqlgLoucGjPdqO+L2q9h7XtQEksccjc=;
	b=eTHFKoyyE/LzEb7gwF+EWEdoiigp8T3jZADwoo7tcmS+0+9xkXLRm2qAm7isTkCRqZiC
	 2eNmNTaT06ec4OnJh7B+aMXD/t4ZFxCJf9n92VNF/emY+61JApuHW2i7yU1QUngeixFXt
	 5egqpeyLjALiNd9heG/uHDkSWa9glMRey0bsJl1GgS8HD8TlPbp7hH7uQfTdynWdHjibz
	 +QXqQyxix+/9jftePopkovZlCxEQF/Enjna6VDWGkc2OOijz24ZfP9N9W6B4vPZzcKBJZ
	 tzR/x2u62BKK1MT38nCZCQzkFUF9YvBf9Ie1CHOOuVCnx9oAp1rRrB5fACXW1FVMhVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A13D1F000F4;
	Mon, 23 Nov 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446469;
	bh=asoXMPMNvjoeTqlgLoucGjPdqO+L2q9h7XtQEksccjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ctfbiD89wSPMm1gC2JwrbGTEqCvE6wihoVnYhcJv5K8p2hHhb3wz6H/PMRxa038sv
	 xK+kiVOXhTk8snf1DyVDpZOJgxbq1M07bFFYgFQ8TqRzCgQoK82HOQytpZaljiloWN
	 1pOivsj+MJ3EYJVB5/U+Ddq2DJwEbrwm+QEHSEUGJC8nw5NbcdvDMjvXypGXPgiWFu
	 aVfos2iy3qjMkI+sfXYglv2pTrUIEhbtUtsVrr3EUi1EjcR5vPl8YuVhswwq2TtYk3
	 FxXPh5qRqtYo2jUfJzvOPm01RzUnCGHNei1vQW8rhPhw8tqSE3rT6F0oYWfBlCNcxc
	 ORlAavwZOn8CQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8D014C522;
	Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 23 Nov 2026 16:07:27 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Mekotronics
 R58X-Pro
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-rk3588-mekotronics-r58x-pro-v2-2-2a3430cf5f88@pardini.net>
References: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
In-Reply-To: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=5tvM2v/b/zAV6i3N+Q541Ucn1iSwSgwcNGoUzeuHrDY=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBrBFa4T7h3xDYAGt7U028mkQDIYNCB6XGbMwBqY
 OOVPpqmQFmJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCawRWuAAKCRA7Xj/jnsft
 6ZJDB/47TCHhmYrhrRHjpapvAGNrJ6mfW83UpP5N+ScNANgPQkOz5pGDsFLxFSgUeeUS471ODaH
 6/MLTG8Os2ucJXb7tcS1wBzSOdUJgXZs2vEcizGqHaKMQZiBOJuFoaBbC50qJBnKjrAhtdYB9zG
 SovI0aWvZnyyJvoS81ER3wcUul/W+dJDlfkEvum98GwIIIBrzD+dpqMwKalCw1sY3lgkp9kf4Ln
 6nuJJGiZyNTADJc9HQGtg9bizAMqVEZx6AZq4X1OqMCeULfVhB8bj7WDAxBLKrkYI34ItMZ05SH
 uoG4yPS1si5lJxII80hnj1TY1YA5Nx8Q2BenbQvvdeQTFS3x
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

Add the compatible for the Mekotronics R58X-Pro, an industrial mini PC
based on the Rockchip RK3588 SoC.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..e8817cebdba9c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -864,6 +864,11 @@ properties:
           - const: widora,mangopi-m28k
           - const: rockchip,rk3528
 
+      - description: Mekotronics R58X-Pro
+        items:
+          - const: mekotronics,r58x-pro
+          - const: rockchip,rk3588
+
       - description: mqmaker MiQi
         items:
           - const: mqmaker,miqi

-- 
2.47.3


