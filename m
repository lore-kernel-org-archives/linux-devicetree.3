Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905347F789
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469013; cv=none; b=B0fQxP1PxFX/0vJIaYJKaPR6zUW+GBZBsPjmA43nU2JIwQPBOcKxNp+G7nMiSn7bevn3Y54zXflO+XBCw1kqxJ09hjQI9aYpHM2YBBqcMk2WtGICbtR9zwVIIqwCtzsl6TiPMqPVsbq8HHXZM8/ZZE5v8sLjAPGrT/wpflDm158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469013; c=relaxed/simple;
	bh=iI/cZyNcu0lJPo6qa1Mf+1HxYhdTetig193HzvnkFFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP+gyvoqhK9QbG9dcoxCAWmPszXrkhXOkUoq/7X07WHQgUAoektLruUbLgC4LFAk+z2Zs2hyQdmJbxik/1nSGuul4CWcByzGRpb4WeUSIUPTH7/LLV3oG6MbZ7ZvFZt0OAu5yZ60IgtPxThcLWswEsnxSGWW9ClaeFj0d3k/vP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FX/Om4cc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FX/Om4cc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so933725e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469010; x=1790073810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6/E0n0oXj35RKNOrfB7WlcbfXYrFEXx2o5InJpzTZE=;
        b=FX/Om4ccasHUKdq3CE7+HkdtNmuXh00AykEPt27gubR9k/i2aiNycm1Wj8qeu32Eqo
         +u9nkOu8IWZDglmWJWx0QX6xssDHhmtd6bqFQUuo96HRgs++MnrSALjif7g+p8Km04QT
         PLNd43g5ibrcthmckbSfTN+iRc7UaOWUEM9iB5KBZJvDBzikyVcCZ8qkS2gCcEAh3N/f
         1PtRWubbTIE+WW1m1PeoysDY+qEtcVYmmjKvgKK7zPjcO24tUhgMHRrKd9bv8MBLegnj
         FvWeCd9wGKT5TN2R4hsDvNFSrgS28QfywE5+UStvpN6u2c/mmNZMq+VJm6o2yNh52cc8
         ROwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469010; x=1790073810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6/E0n0oXj35RKNOrfB7WlcbfXYrFEXx2o5InJpzTZE=;
        b=JXpucnYx+4zLtZsDw8EqvZ7vnCwerNnoSnTpDzTNaatzyiUXzmYdKLjt6FYurp9zN2
         xtBKVxmG3LI4L2s5kVoGWU4ke+qzROYbAAHa03j0lA1kX5nruXnQL8JobmWRwvW5CtvP
         u1aTUWtRvLnjhhUMXG+D/Z87We2UIwul/sj/yWU69HrBMX/jBp28PJk6lt74NGFBSCB5
         3u5ph7mPXEESWRmLEOe5TtIg+PFcY4t7to4XrQ94A8NaV+nf3Y8gxrhxGv46ipa4/m+E
         uvA4JZuBX7RqM8X58cBBksqlh5c7TnRT6l4q1F6I4t4ObdHRty2f0MfBUfeCpEc+TcVT
         8PGg==
X-Forwarded-Encrypted: i=1; AKwUvBwR6cByu+iWu+z93970VMID1Uuld8E226YYBn1EvqPp7Xn1ubprA/jKBbKq0nGoGI39YQYMYr/ot7LD@vger.kernel.org
X-Gm-Message-State: AFuF++kvqPugezGMk/N0q3gp9kdbEALbImY2RbIWmz3p2ABzcEEaF1q3
	cPcXjjOVqtjo93nVcxlg5iXifiDPK4Y105PRKomLaW3vvE7IymVhOLZWVR7uLQ==
X-Gm-Gg: AYBFou2F8EYwaXv2IeX2wAyx67CvTJy3jz66mA2IQ0r0BGSxMSPEgB2yF49+34DxzKA
	jrq7nPX1HlXtSwVgcNtz0barwZ5VOI9JIaiOPpQIV6Hfy8sc3VMawCt+3zJZcDV4Qr8eDCPP5ll
	7tsuylC1YO3PV4wCduh2r7zj4yd37Z53w2GWTHeLf8Y1Ev/Z7WstaePgssloha+w2qplk0eXHA0
	3pXM8Rbs2QDUdmfdeml4WPlpmgoV3776tprC4CUYzlNeEecNVc0npxyT6e/NKMMMrUMG7OET5Fu
	waIqXTNQiY0K1DhSAGEiEblxydYbzzUUcs7EXOCq8b283LG7vzZ0yVrKs4Y5KvQNqaCl+vZIEXj
	zqGworcNiFgXUWhtO0EPOcjTzFXPtbMzAwsZP+HbWgZ+4rD9lVB+m6Ic8/bBt/1FNHafBLRav1J
	PALJtOeA2WbIXtGWG1QQiVPr/bBJ29EgKLafEtY/i9E2qIcrGBH2EEXgZYQ3DqTU+woGFgXFt/B
	qk02PXnEHqkIUaQLXxLhPlHdLcw5ivEHb7oEPam2vByiyWSu8zoZlolXD93+F/n5qDZ
X-Received: by 2002:a05:600c:8b54:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49e8222d27dmr8972995e9.4.1789469009914;
        Tue, 15 Sep 2026 03:43:29 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:29 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:47 +0200
Subject: [PATCH v2 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3576 variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1762;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=iI/cZyNcu0lJPo6qa1Mf+1HxYhdTetig193HzvnkFFo=;
 b=zvkAUWKH6xsfLa5omHi8dFMZ76+DIzxdxeGwkj/eZhqT0s0dXZoIPjUvdeXPdhzqLFeXe0dAw
 Nxt/00tRo0xBDfkMfHqcmLZPm1clsJ5PnYNVdOmNhuGDzExnxy8Wr5M
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The Rockchip RK3576 features two MIPI CSI-2 DPHYs compatible with this
binding. Unlike the RK3588 variant, each PHY instance only has an APB
reset line, so add the new compatible to the single-reset group as
well.

No fallback compatible is used because the RK3576 DPHYs match neither
existing variant: their control bits sit in a dedicated CSI-DPHY GRF as
on RK3588 (rather than in the shared VI GRF used on RK3568), while only
a single APB reset is wired up, as on RK3568. Falling back to
"rockchip,rk3588-csi-dphy" would make the driver request a second,
non-existent reset, and falling back to "rockchip,rk3568-csi-dphy"
would make it write to the wrong GRF offsets, so dedicated match data
is required.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08..92d0c961f4c4 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3326-csi-dphy
       - rockchip,rk3368-csi-dphy
       - rockchip,rk3568-csi-dphy
+      - rockchip,rk3576-csi-dphy
       - rockchip,rk3588-csi-dphy
 
   reg:
@@ -89,6 +90,7 @@ allOf:
               - rockchip,rk3326-csi-dphy
               - rockchip,rk3368-csi-dphy
               - rockchip,rk3568-csi-dphy
+              - rockchip,rk3576-csi-dphy
     then:
       properties:
         resets:

-- 
2.43.0

