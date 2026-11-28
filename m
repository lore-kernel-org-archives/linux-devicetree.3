Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795892444;
	b=28nUYgfKfh3Rzr7lVQmHZ10AagHglkF1SblVuEms4X4xeBa4IURCym9MBumYR7+mBbd/
	 XztK6sA3o8VDIUvUXx+Spt8WYmFOvTTgXrCJ0ujQbvJSM3QvtGaYB0K5RT61uyxSHFn6i
	 HsUGPtGzNzLQtjYJ4IKC8CSwlrECmLV+k4mizY2OVyGWbGCNu8IrV97ftHjMkSl9zSCPo
	 HS2xQwu29neR/J9kXjg3B3qZYvfkYuxHTuc327/9v1m0pVvpFLSUN3ApMrrnbIhqxKqPN
	 pHZpPaD0oVUVdVdbx2Eh7CeNAvm4VM3mrBjB7TGEZGfUI8nsayJb6NY7BcHIa60OVLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795892444;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SLC5bsnISpXa2recJq5ppSFtP2i8GI7OvgAQeWZDbMo=;
	b=Nh6rOQ9il6Q1RfVo1Ue61y/9TniHtenIpSUIO7aWHhJb+gUFt6jFtCRLH0e/Wlkvsfe2
	 QpedlA3cplV4CYxxnHso+RwBLU71/JCm3oSh+f84cDCb2jM34FI2jEzxHh45nvTMt41rc
	 7O4vSFOdZ3yrw06NwdL5abHLb/xwxXywGQtDVaNMvsTIhcnW8lnx2nP2ECI2sBKKbmhyF
	 59jnh51bv5w40DFNLBKuZwMf/9gYeAT1rDg/HO/Vl7OZixGvGJkF1OPrPpPJKD2gbrIfk
	 U0NPHTayw09MO8izT6lMHtnX3kTcudQvDBWaeLPcmaW1lrhM2xYScqSBpQeILJgsQjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0D8RZox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B5606A31C;
	Sat, 28 Nov 2026 19:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0D8RZox
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795892443;
	b=zSGZ0GcAF6MzCvhSUiP7KG+sn37yGffwQOBoofb6hkt6saATz/cnOrDWh+5p0MleVy7K
	 Z/Bp+3vG1Z41lU+xPPB3AZQdgzSR12VsuY8ODhrDAm3mSjAS8XhMpDDqxsNBR/Xi7tHhJ
	 15HMe1jMPNncuIbKy7eitWAdhA23QxzorTzOdBSNh/u1kmb/oG3Fvau1vFKS7bkjrS/mM
	 FqfYDAbS7vATFTlmMg3e5dUYR9Uiie2Y8lMG4KbM0f1iSkY20stfg8zWwvLjSa9+RJXe8
	 OeqPdM58JY1G4z/RGwKMqAsJwxcKOBM+HG3L6yAzBpjQRCIKF86+cM7EVFvjz+xEMww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795892443;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SLC5bsnISpXa2recJq5ppSFtP2i8GI7OvgAQeWZDbMo=;
	b=wQkZdY7a5P3xxbCPsYJAEKLBrbU+90FlTQkkpnFRrgQhitzBeNaE0mVszXIPSqxIE7cZ
	 9qh1uzqO7qeX40Iapm01nv9tK6EdhQXPXxnx0gP2mTruDTsTzm/9GhRkHWJBVZHiaFTFy
	 JQ33VZcZwQ3rEzh72bORWDRhetm/4GA+kt4PKQLlWUkacC6SqAF+X7Xe2DmGQETev4GVt
	 rs0or+X6ixzeDD55+rrBKil1E2TKEHPxV9i1s+vM3g2nlmsL9UiOWI9sUJxbvQjMl/4Kr
	 W4UVxN7U/UFXQfanddkRZyTNn23cnfGrneekyJ5Fy7xGjROLlzSJJWybZVpvrTH7odA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 538CC1F0089C;
	Sat, 28 Nov 2026 19:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795892443;
	bh=SLC5bsnISpXa2recJq5ppSFtP2i8GI7OvgAQeWZDbMo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=M0D8RZoxjgtINBQsDrroN9Q8PiZQtQY24KjrG3sNG6Q5KtLbNzagrsFtbi5ozI333
	 jvTBKsWzsha1UOpKoM5dxxd66UZDjT7coWQobc03kVVXoc754iWV5BtBrToCQBQhDB
	 sf8HtqaTcOxBth6yxqJ3qAqke2JIzub7swKMX/8PIqVuH8mnqn67tr+6tLEEEMRsL9
	 fbtEh+zLC0jz2gyW3MN6uANTfGdV1OfcKWS7WVBCYTeClFXC/IomqOeXjbEjPhRMIm
	 fjrfzunqV5p0ET6aV91V7OAq5ywvLgc+oGqsUPkvcYSdxgyN6QBqVDLmGj7HDiUdZ2
	 PDbVM0b24GCbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8FC34E1E1;
	Sat, 28 Nov 2026 19:00:42 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 19:00:43 +0000
Subject: [PATCH net-next] dt-bindings: net: sun8i-emac: Require the
 mdio-mux node on H3 and V3s
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
Message-Id: <20261128-sun8i-emac-mux-required-v1-1-187490b1aa45@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wrCMBAFf6XsswsmQlv8FfEhl1NdoVFzKYHSf
 ze2j8Mws1JCFCS6ditFLJLkHRqoU0fuacIDLL4x6bPuldIjpxJGYczG8VwqR3yLRHi22g3mMvl
 e24Fa/YmYpO7nGwVkDqiZ7odJxb7g8n9M2/YD/vOTQYUAAAA=
X-Change-ID: 20261128-sun8i-emac-mux-required-b2c7a3fd62b7
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795892442; l=1385;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=9uE/k+HI8ZaqDnoeVabbl4K8WHCPMxQEnlQ4YkoyXj8=;
 b=mXnMXngTFwXiwUUyox16paN3Z0wX47wsfhaLelZoR282raRhyipPe4LSU1AmEn+lJQdd6Uk78
 EKzD4qrSZjEAqxEZolecOTPlV2eyoz/lqpQtIzT1/TJ9lxQTrmEMbl0
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Commit 0569929d9799 ("dt-bindings: net: sun8i-emac: Convert the binding
to a schemas") dropped the mdio-mux requirement for H3 and V3s, but the
driver fails the probe without the node. Restore it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Found by Sashiko [1]. dt_binding_check is clean, dtbs_check of the in-tree
H3/H5/V3/V3s/S3 DTBs is unchanged, and an orangepi-pc DTB without the
node now fails. Developed with Claude (Anthropic); I reviewed it.

[1] https://lore.kernel.org/r/179551897695.3135.144965187993855310@kernel.org
---
 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 2cae0133b3cd..661bb5a16013 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -228,6 +228,9 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+      required:
+        - mdio-mux
+
   - if:
       properties:
         compatible:

---
base-commit: f89726ffabef1b08c52e6163b7ab94b0d5f15503
change-id: 20261128-sun8i-emac-mux-required-b2c7a3fd62b7

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


