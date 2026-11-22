Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327297;
	b=X1jwhKvSS0320bnxtzmU8inINDGmnk4L8NQy3/90+w/8Xi6YsMCFI5Orv33WVx5a+1Ha
	 PMnXbP0tpULoUNdn27vGVcZVAqbQHKeEgvpG/zM6GKasD1Fpo22DSlds1atJzkitmNaym
	 oWvZDZiyyDF9nvLGPGmWSMhKLcsdYUEP+cO+oUgu3cvzSH0JLeG9YW7fZLDZK2JVt/8Hg
	 JVpNSWYP0j+XERQpX4d9W+d0qxFQGtizfx32tlwuk8BuZlGN6KLeVuBdxKlHt9Lp9THmg
	 X7w2gbF6vZj7umDADV2IIpuDT5j9Q3rXJ+JJORfjPPNzEtIphpU4y2QdIjXn4WfKu+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327297;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
	b=hABQtX58T8r7mtvekNz/nUzJ4+/0gVbVxPEjnRJq6O0QOtvpoNJic41553fx/88VO0nx
	 560sldeSx886GoBG74/8HhowRhc3GEKm+Cc6sYgBmDjyxR7v/vXeJ7eGblr8nXUiQI6lV
	 cGJ3FWy5Qd7L/fxKDZL40MDlgz1mzAfmw+yPFHcXUCrOZvF6NJFBYnBiuym8QDIPCGPoF
	 kZIBzdLXEqMCdA9ZD9PjRSb0enBTnHw5BZwEkrZ7Kw3Eqwkgj7RbSNmyYpDZ9AO4LTy7e
	 KoYCXYmiRHaMEGri9vtOAf1p/mwDU14/AG+JsKzWxax1kfg9WteQhMo1NOpCLVj/SZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=KkTfomxQ;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=fLQGGXDe;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35000606A6A1
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35000606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=KkTfomxQ;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=fLQGGXDe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327291;
 bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
 b=KkTfomxQA+Lw+UGt6mfGfqrqL+O7y+gdHKciVqkqq4HgJ6+IEvzKT488HNQ8ciZsnzW61/u//
 JyXruTzpX36Fed3BJj1xD44cRP9UI7iKj6eqp4odXOKKoIHxHMkaD2ZXViGos90s9oQR7s7KofE
 VeRHkIS4RikulEOrC+dx4LtGefYW+r5Df/CRx2vteciAZ+rkbRMZH2AwreS7j7xE3ub9HMb74Yb
 1Qm7EvdKDv2UmHYHzWgmLg2dKyHm3UAugD72maI5Pwe3OfQ4EA9FWVxQY4OQPlp+rX4UBgM442Q
 XAbqWiM8PQkZgzsgGuWj8WNIucaEQZPElP2wyhfkUOYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327291;
 bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
 b=fLQGGXDeyjBqAaFMRWEylycd9Ktfb2fUVqBFb1Q016bGzMOiLlQqLdZ40NuN5I8USge7DfeaX
 KunysawPTw7W/LQyev1mvrBfv2fRkzODOWKt7XAS3QHFXWTQSA97eKveemknbwq6mJcCfobXn+C
 xelLJ7Hh901pNqJ4ajyVz78=
CFBL-Feedback-ID: 6b028536cff95ecda8c09374:9101f6a6405eef24968ec9d89ff35255
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028536cff95ecda8c09374
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v2 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
Date: Sun, 22 Nov 2026 06:01:06 +0000
Message-ID: <20261122060114.773624-4-jonas@kwiboo.se>
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
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

