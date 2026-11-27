Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784886;
	b=DfaEMvwW8zvPi9fkzj7apUbTHzq0ltGss7FKTfnTTxN6mSNNSJHWxhwnN10a7g57Ekp9
	 NWCTrEF5l6PslfClw2+i8d+NiAG/O3Ql0FdfppoZ8Ly/f5gPPm4cU4nHqLF1m+DPGUJAh
	 dve7u/6diHQ5/Zjw86edkStL7s2Lr9s5x7Bprwz1x/OtWJXmGZJyLkXvS2H2VNyS1whpU
	 H680G/Kv9W47f0+duz7oevVuTRZDurprd4hQPJhwd/k1OY7tGfOYCcUP7QMplj4sLaaZL
	 9v3/rPPaAMQEj+f8QM34PzdDpXL8cYN5rzfkifGHMw71Ruhrg0lNYR94dfVZWLSauzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
	b=am+8HIAKIdPiDYCmJpWB7XvOT0RVL4h1z7gTo1rfAZdG2D20k2pf+Zz7t9PnYgn8Xdxd
	 GkrVmvlHaM4USNyzfU/NPbFPZ54XG4CruEmsrt5SxUiwu4sPapXoBNZkhJVRw4Bs/flTh
	 fA2FG5ddcVXT0OOWp69mKtR+r2u7qYgLxQfpvzWxYhoNn4yqVUzSgPausHpd4pp4qcaae
	 tqAbhAvlVdgjhqRBhMppInWdtxguneqhJT3GGvr8CxwoYNeclHKDyZksd8aap+sDG/XFJ
	 JsyKMkjFMpSHoayXJ8be8GgnaMySz2GFMMZW1GyoXUcrCA1b0a74Xwb4SVPjxCeeqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElXf2h8h;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55105606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55105606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElXf2h8h
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso5616167b3a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784886; x=1796389686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=ElXf2h8h9nfTtFmf2DWYPK8CucPykSR6O0pmk1h6wilQ5yCxJoP6ogMBMhPJbmgkpH
         Vnps8qhtZPL7UAeNzYJ/Ec6EkQabz4Q6vhiht9X57T8k657dkrGSvh2iMQZXRbiz/3tf
         Lo3SOyD9XMBW0tO8e8J+EpRji/GAreh/xZa5McKnJVrG6QcwZgbDHFtpF2emy9reWNM8
         jGiJ8x5SGceNEBcmE5waQksUo8rZBHkPN+sTyOgODlrFqa+biXsv2LarREkIsi2XFFiq
         jHslO5dEm+UbpUHarQkm1wIAXrLolPQftFBIbTV37snqdA8X1sFhTmOhGy09ZEA4z6XA
         lngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784886; x=1796389686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=RWo6cB7RKtENkeu0Bj2HS+tcb/LoeUuKssikiy5WItI8JFCdIZ+j4XfZxsCCmQD6fF
         KTiHNsv6pvyDq5xn/QlhicxlBQdsfknZR+u3SxeJ5iAFS2clFyO2tnQr9xySiI/WQzyF
         ftVTkkq8v8rqYaNyv3KBmPIyxogdnb2PJ/IWoy8+uZthkJzVadBiZCNXhFA12lqxGg0O
         9amgVfqbH2z6AbMX/u1WxKNcMEJ7niVE2oQgs8i9whdOKfv6eQk76JkDOVGcN/DNMUqt
         inpylQ0oZlOlt5lrQvfiIy20YNH9/GL4LDSLAxCEmkD4HYUD+yQVoZXa/m1L8JvusKht
         Pndw==
X-Forwarded-Encrypted: i=1; AL+hErGmzZ6fDwpyITGgEll+9vEWkl14E0TOiudaKM0HDenCy34JfyfGt0aZgu5upIr1MYtylZs9gq6HBVZ4@vger.kernel.org
X-Gm-Message-State: APuU4Z82fARRUpJYVETeuY0g0bS8p8aW+E0EXmQiZ5WrbeyD5JgReLYO
	aRRQlUAcLl5+/dQPoAJJSpku9IU/1ePdc+VkufHk6WfAAImugtb9Lg0i
X-Gm-Gg: AZFdTZdI7Fdde2j0gPq8nHDXlMdPeCSaQ0w2tZNC2/3jb4bo0Qumb6qc6TZzip+fMoO
	rAomycLhmcGa/u0YmiFvkgPiXGkqytk9pI/4E/cndpwbCtlOc5KzhSH2r+WgzKE5Il0wGs55jfJ
	n42BedPIt9GToCGCaJmXqa204A1Dl/UE8pcCjyiVLVQWmFoc49rSTlDDgtnXXN2j1ijfkoyuf75
	t+pkTn8eA23B9lVamFjzacmUFz8AXBMIogETHEs9DODK0d/UI9DOT/1wjwgU4RG+HS/gfryh2nU
	FAvHbgM+/aNYEIccVIbh3+mXIAnWT6aU/3dvt8FphpMkcEAar/v+qGOUbmYVB7bVLrMMb4GYhLB
	2xfubdDSy6+rDr5BsHlgAb/frRFe+FscySRZf/5auLU5pTQ/61rQej0HelRBaEXqHWM3NyLm6PR
	7vv7fr2s50v4DUZbRFuZe9+5ZOLwaj0LoxWDeZpf2OaNp872jMUcBkozbFZYuoLP93p8n/29mDI
	KV6ZTk0nPJ1lhOU+yMiSp/lkDnUaqoUDDvTUZM31zHguIOpM2fFUovAKOTr9jvg886XRNHyDjfj
	E4B6ekmTS54MQdVLCaNo0D1Hkn97dNfJ5mCyXrQEpg8Z3Q2x8YiFxXg=
X-Received: by 2002:a05:6a20:4303:b0:3e1:379d:f953 with SMTP id adf61e73a8af0-4014ca45151mr26753532637.57.1795784885543;
        Fri, 27 Nov 2026 05:08:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:05 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v5 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
Date: Fri, 27 Nov 2026 21:07:25 +0800
Message-ID: <20261127130729.1263920-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127130729.1263920-1-mmyangfl@gmail.com>
References: <20261127130729.1263920-1-mmyangfl@gmail.com>
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

This adds an optional mdio bus child node. If present, the mac will
look for PHYs there instead of directly under the top-level node. This
eliminates any ambiguity about whether child nodes are PHYs, and allows
the MDIO bus to contain non-PHY devices.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index 89ed6ab1905e..a71529825955 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -53,6 +53,13 @@ properties:
       - const: mac_ifc
       - const: phy
 
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Node containing PHY children. If this node is not present, then PHYs will
+      be direct children.
+
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
     items:
-- 
2.53.0

