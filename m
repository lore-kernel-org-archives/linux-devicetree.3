Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795135171;
	b=x4fMn52098egD53+ytegt28UxNeWDnHQfwkhX2dQPhRH+4kS5uc9c3CmW4lt0W5EhlWG
	 xdERtjhruGUOiSFRE0SVXtj8l/wnPmVQ5qeWzvKt0rg5jzFcZ8NQrgETqvkRDOHx69BBl
	 0FRgW+zVlpEMEhVTs1LWYsrIUa1jXGcGPxT7rlK6+7iIzt1DwWhx9mLbT6lVhyE9tHFBI
	 yJ6ChxAhjJq+zOC87COb5MWkmXdFRrshM0qBf6uBZXxzySiMvLgZhbBk0w1kWEXPiEqlb
	 ghBhNjTBrVB+GjCJl3Q+ghqlDK9+/sLEUpPT9gIjoPjjm3lri7/1EVTofdvG30ltWmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IZuDFPuZy+7YDyaYmWtTAS/LnBWLtgyCl9nuFwPasbo=;
	b=dNx25o564ozqnHKsG2GECr8a6v2LYyfR5FvCqPfpOFKMUG47RoR6LAZcVXM3sZNzyzgQ
	 v4esv3Ry5OWj35pVYiRyeXgee3ZFwYoiSf9qT1m3x09OkdrGDNy2Y7Y2xwV6r653fRUeW
	 zWIu1rVzmSLN5ffKNV1yuNPxIX42CZ2mBN7hvSGy5d0yFaSTWeXLbuljmp0oUSW8+MHwt
	 beg0vBsQSVtugmOd52Cm4DNjO0FYmDGcmz9RB0XSWZ34EqjVt/+EXRJahpjfO4qeJcSOl
	 46JhvksejzeV4R5+6eOCl1Is5krkh93b+UfTdtJzIEkFF6hMNIBeR+Kj+OCmqpC3Jww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBL4u7So;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605F606A334;
	Fri, 20 Nov 2026 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBL4u7So
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795135171;
	b=AgkGixM211lmriFUuc6e2uwB5C79GOw16s1103bMB5x1aD5XjIhtdV2hyIovzN4SAQhq
	 WycBvRPlFPRHaHQzHcyrIppXS79yBMB3MH/yw/B65oLt2z9jEIX5EIlCtsheIwQy+lUoM
	 vh/0lEPUwAgau54PwGRbhiLrk8IJSUkg/k/4uJPTydRGPPpPCZd0wJrIqPjziR5+ufvyP
	 yHjbFFPttt4v5kQjT74Srwpk1NkK6UdAySxzm//q1OfKO9UVx4tZYcLmIDMWtpexFDIMg
	 VzzZXB2kBXcWr8jye+dJ94/vMSmklEQ3QlQo1E/3EBEoCQzMj7XsGlx+AaHx0ZXf8iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795135171;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IZuDFPuZy+7YDyaYmWtTAS/LnBWLtgyCl9nuFwPasbo=;
	b=NWfM6lJl4cbvsF4Ca4b2wCYF46NsAynnW1/nmu49BcxRI0bKDFOfQG/24MNqK2FWMKcx
	 ywYaxuNBlekz3HaytRQJ92SBOOfQQnGxM71y/U5e1yEPxZPAg0BNCfyVpOMs94msPzpf1
	 /ECPiIdflCyA244f6WC4D5d5tUCQ5J0XCKInsWzqW4x1mrvliT/xzJpEKH/9KjLQgBJ+r
	 B9yVTgMcgepqYrJA7xIE2FwQQZJZ6fXxFIjh2734v//6wWiRVoUKlFfIGIi1RIaH1Yoo9
	 xyPaYpqo2/U6s5laimXXw/xI0QgSVuYlH+mM3MpH1JEtTK/kc6ZsSbDZ7Tuvbt12uUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC2E11F000C6;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135171;
	bh=IZuDFPuZy+7YDyaYmWtTAS/LnBWLtgyCl9nuFwPasbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aBL4u7SoYSVLbleetqu7M97l+HFnavYAroQQUuYmyh3uIRwItbVL11bk8iXpGRbkI
	 RiIFf11tjVeDS+HLHzKWHvhtZHZ6LCIl4RcwyRCYWF3T1ctkXYMNmqWTgaAIvHDq7I
	 aMCOEjw49DK8q8uPZKsq7VwmrA2z8NC2sTnZsMw4pcLBgqwzwfjsMmZFWGmLGnJIH/
	 TgX8J3ydG5ElNAFQ3jYu7iv4DmGjnoz8zQzawidXZ1NA0GzI5QOXQa+X0ZEMV5xWuF
	 QKMYK/1x4w4TEk+exQQq5L8o/Z1qBx9fph8ur0dHhmQz5wIrqIhmp8a1xTEcwEje3h
	 ocbyi3ljFqbFQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 799BD425E2;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 20 Nov 2026 01:39:27 +0100
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Mekotronics
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
Message-Id: <20261120-rk3588-mekotronics-r58x-pro-v1-1-4e70c077c7b4@pardini.net>
References: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
In-Reply-To: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=tdZ5Gv+020lndTtofgOunypBXIjX4W1b3fbo3BuNVP4=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq/5a/6HsaT8egAyGahPN23aDtgjy29G7m4FCJi
 D26go1E+zyJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCav+WvwAKCRA7Xj/jnsft
 6RTaB/9Ktg5sIirrYbaHMSc+4QalJhLY8T+kttDKUDHfs7gWd0EQnQfA7UztvJfKc2Vowyp7QBM
 lUo0PlYXWmeeZaEFq7OY97tNU3x7dpqduzPHBHkicF9LlVzNauQehS7sQwUp0jnyjmMzETMBmKA
 JWArEIJPhJ2DbLWiTsPoN5Ksbzb/s01BzwhdNl/AkxPdtA2sH5jag1KKiYl0W1LMFjkNoeMUVgk
 OuxNPHKlmSUllj/xyB9fotXoEFofChuMvSGSEqPjqacpXjaq3Bl02Ka9J+CcDU4h0mT62ig4/nM
 JD+3ILiScXYq0K7WGpIbOOODXoVaJTDPCi6M7ZYPxSXGhk6S
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

Mekotronics is a Chinese manufacturer of industrial mini PCs and
single board computers based on Rockchip SoCs.

Link: https://www.mekotronics.com
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ddf06858856d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1067,6 +1067,8 @@ patternProperties:
     description: Medion AG
   "^megachips,.*":
     description: MegaChips
+  "^mekotronics,.*":
+    description: Mekotronics Co., Ltd.
   "^mele,.*":
     description: Shenzhen MeLE Digital Technology Ltd.
   "^melexis,.*":

-- 
2.47.3


