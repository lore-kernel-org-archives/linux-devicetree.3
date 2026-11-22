Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362461;
	b=A87zk1AIePGLZftZuyXttcJTzj25NdNMPNZZg6H6OfzzVjcAEVyH3VZ1Q2VESRUnQ8bh
	 bJ0sWZMQQtlMQGsc8lgUWCXix6o604NnMx3/Zi7Co2icgZPsekAMWylszG/DMAvJd/PbB
	 zD1HqnGMcjTCExen0+9ZzrzVr/4ZWgoMJAME3eQ4Iau4SiGFn+zh/+ISrddRvBHXDHehR
	 EqmJXGsijQ/EJGdAbwRnL4Raz/JnKpIEHMTb43WxLbEf7YEvbRpG3r20T/vR8OKxnW8Vb
	 F+y3a8Lo5hPOFYFt8pICbEcdQp6KFyPPDCsyZfBoH4hfo3nMHHVsgM4IWr7dUJh/rHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362461;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2qdjp2ma6GziNpWie7aRmBjMaJqhYZ4Ns3+DoQD46PE=;
	b=OQmLzUX58/+nOe4jNLvEg8oGnrTqVmMBwHuqvtFkY3DV7KDFmrWRFInHeFWfjmng54Tb
	 u7NCTFD5oMXiAbhKU1WB71noulyqVZLO7gETXmiAXZ0KT86hBTivU3I9vfnp+pD0Ks90H
	 6rz8Trbvf1yWbB2hRwM56L4bXPMqlaKw+rKZ8q8D8jEhkFmpwtwa3ipmo5Q+Q6BwY/aVn
	 QCy9M3bk/u+cUBmBYWlIhrPOfchHG9MAef1CfaWb55eGrSXjKuCihRA3jLizIg8Cjs1qG
	 0AqTNFA2jhJlukIwOqd6k5GNTpoUYcVpSYCOgbsDwF4nfwZYjAhI/SHERzf+ThfOFgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=P+Mhmkdc;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD1606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CD1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=P+Mhmkdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=2qdjp2ma6GziNpWie7aRmBjMaJqhYZ4Ns3+DoQD46PE=; t=1795362460; x=2110722460; 
	b=P+MhmkdcJ8jP/8kBafiO8uRGPbEnzoGekqjXE2/+1DmzIcyxP0nIlixf7GtBjNhHIg8S2EqbxV3
	idDoi+YJk07K2Iu6dWy57AEJuuTrnobPwYr5LC2dyPIddORGvEpqBsFXz1EDhp5qgUpLSd08BG6ZP
	6RRmMomrUAdAEzKcVOwOa69ACpr6zeIIQJBtDb3qXOhk0KNKP5it4cMjnXAr22EiS1yc7Hjf1sEl4
	i4VbK6bpw99Q970nJvXWb+csrhQSh9PW4nR28aEILQb8op9bpxqctyv/ASsIwGCQ0p0q4Vj4+Bkhy
	8NGQtJByK7FOkqMDulieC6eJ0zRvTXIkS1Og==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xV9mu-00000002er2-2ooI;
	Sun, 22 Nov 2026 16:47:32 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 22 Nov 2026 12:47:23 -0300
Subject: [PATCH 1/2] dt-bindings: gpu: v3d: Require resets for BCM2711 and
 BCM2712
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261122-v3d-remove-33-41-v1-1-52152b454ad8@igalia.com>
References: <20261122-v3d-remove-33-41-v1-0-52152b454ad8@igalia.com>
In-Reply-To: <20261122-v3d-remove-33-41-v1-0-52152b454ad8@igalia.com>
To: Iago Toral <itoral@igalia.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Melissa Wen <mwen@igalia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=2ZFLVlkZjB5+Zv1b8WTNaVPfKQOEYPDvPhWVyPmnJ6A=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBrAw6OtGBXbiqv4VElVP8K3g5wELV7vheKEPepx
 p3VU3FUUqWJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCawMOjgAKCRA/8w6Kdoj6
 ql/xB/9uVjg2KkbMj83qLs4SS5Wq15y2vDKbqh/QoBs0qn1/rFOpXGfZlh8vjDMa86UStK4AcSa
 xF1hDVRl1UPzY8m66ghfxgbcQQcDVLkdvTa/OcIIdXVeV4GHjAiOWEHjXyYI7M4vW0EDUoB1YSn
 M1daqdBCZbgoQiI12/03YqiDS5f6Szhh053HNTXKpkmmCXZaW1WZlmL0/R9JA3LZ1kHC5xKM/0p
 UGOzCzQlKmgohUfsRl1CpaGEQWL/mCu7cOzXuhx3SKWD4+TkrN1Rw7MDb083HpFFn4owXQPbvjt
 tvzrgCf8dkZw5b+8FqwXRu16CK9Z/glH2SPdJMAU8reoBzpB
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

BCM2711 and BCM2712 reset V3D through the reset controller and have no
bridge registers to fall back on. Make "resets" required for them.

BCM7268 and BCM7278 have a register set for bridge resets, so "resets"
remains optional for them.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index 43c6d2d72456..45bd54a633a7 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -66,6 +66,8 @@ allOf:
           items:
             - const: hub
             - const: core0
+      required:
+        - resets
   - if:
       properties:
         compatible:
@@ -83,6 +85,8 @@ allOf:
             - const: hub
             - const: core0
             - const: sms
+      required:
+        - resets
   - if:
       properties:
         compatible:

-- 
2.56.0

