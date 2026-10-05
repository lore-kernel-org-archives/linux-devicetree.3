Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923AB3A75BB
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239465; cv=none; b=UV57ystQAyVaaJ8rXdy54C1KsZxffWRl8v7VeZSublYx9WlmGZlxBQSJ0hFwjGpesn5gIjJ6i/qecVDDbRVxdXzdqoxPe7r4oM5PzSlxnd7kY3gCRUiJKb0IcD7/HN3AcPczFGrx7RfonOl9QomEIISfPQrBzstDib8wsNXWtBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239465; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+M3fpZeQKrHEgmDo7HV2CMPfZou+zJYijy1ayfXVQ3edGLWPyfWRhKf+AjaxvNFaosOzKpw+x67IW9619dFCFLD1rDETOQUUf3tDQjS/F+Y8C0oFA72jdVnAg88ux4wEGopJhELMqP06dRUaBs0yLXghAPXz/3b7DO8Iu1M40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXBlHr03; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXBlHr03"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a854dffb5dso166798a91.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239462; x=1791844262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=kXBlHr03nLR0+jE4+yYiWsUjVXmiPb22fXkSWaF21mAiymf38ptMHN+lfeZoGr1izX
         xi7Npxoyrl1nNNSTVtT9EBl+9VKgAF6JdSFDI9+zIzrD+K35GKZiwEn6G9zTY0/cM9C7
         AVaY13ybuOvxubmlLTaH7MyHYrVV70WtDyyFEn7lzPCAQf95fhT2w53ppoZmc2iM2Wnv
         waMnC/pPqU6o68o4arAvQBHi9QjNBzhtPPQZgBlcXeT+HaLSIXe4j/CokxQJdX7Nd9w0
         PP8kio/cA4k3X3HWlZm1oIvbC8i2BWr76aCaFdCnN+qoI7fAqImFGRwxdrFbGyId3GuH
         8lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239462; x=1791844262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=JTcWrcefH7OjHjPULzp0RUJg/7aVn/n3MlZsk2fKT/2BDOIqAO3orJWM2qXW3677eu
         TCwuQLg6DC5YjBkx0mzX2KSZdnxh9s78dlyfoK2Um/chslyjiA43P4wJrOo0VWHLdVZn
         v7Y+CgC9nNqctSdxnkexH5DjdGn6us58+spZXcojwg3bvTSiS+tUGg/0sMcmINMqn+i0
         CceUMRPAqKdcKD8+0OeuQ2pUoYNq0x5duzyfN2uiT+DJ8Yh7JkmX/2sdfT7aAluL4NJY
         FzeU8D0g8xkV0TPbwyhGaLu1lrSa6KrX2PJzeFGspJwF7vV4omXpAqZlPEojgo3b9ySV
         34vw==
X-Forwarded-Encrypted: i=1; AKwUvBxhhxhZLJPeS7dGEowIkSewH+04VDxsZ/AazVd1ZD4YwWuNLNukYplcJWR+2xf2/F8xF+v838E9gRB8@vger.kernel.org
X-Gm-Message-State: AFq9FYKqpcLFA+UDYO+hSRQvDETzbMvpf0gt16wnAjFt2uVcA6E+oNyo
	SlZJfs8Q8K/19ba/HF+hvhWKqU/dAAWyzhVa1LRKIiLD+4SKSNNwyh7g
X-Gm-Gg: AYBFou1O2K0jLtMDPMvaX2wJsx313q+NnlRkItRTEbos0Lm2EK97tKYCsd7YY3xngNx
	Ol0uo3Is0Y78RB8cU7NqxtVzfbdzS13260Cjt0vF/15y2H3FpeYF7GZmphbP3HTDcF+ooov8PUB
	psiyHu0KcVF6D2o5PzOmM8GjD1lx5//ZFjsCudd3W6d8pt2tCAnlbpTcGip+5CuHdTd6yKxjNdn
	KOfzmdFORNqn2f/+dO76OztWnu7FQlqQ/v/3nplZgx4R+QynHAcstYX6KpaTubR9b6IQQUGwkNQ
	U2d5ETkFR1/g6s+z8j64C58gl4/JQKZ3yKqXaoBR3O8sxLl7qk6NiAr+UI8gbF3MPs7rxx+nYls
	6makh6lvFkddLEHQGN1lC2rnVQ281N6ci65eJAqO4VxYb0DAdvVotJknQ1vibOnFs0TjLCP+5ie
	9ipguB4aBbDcn4qX8JAS6TYn6b2W+uHCg7taqtvfmF0mbdyiAqVR+/5+4ibUrhebufeJiH
X-Received: by 2002:a17:90b:39b0:b0:3a4:c538:49c with SMTP id 98e67ed59e1d1-3a6ce846cb3mr9080240a91.50.1791239461527;
        Mon, 05 Oct 2026 15:31:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:31:00 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Tue,  6 Oct 2026 06:30:06 +0800
Message-ID: <20261005223011.1124347-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3

