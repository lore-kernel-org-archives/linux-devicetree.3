Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479919;
	b=4TkLy+yiW3sV79Zxjjapywsgl/u+uMPdQXvma6s9VVrpHtBsX/2HfJpUAoSagNwGKkjE
	 2HlD010oZAGqcIKyo3UtnMMS7I+C6cD6uQLImZHC0wA3RIzmGgnkJ6O4PWYmh7m/l/u+I
	 rJOjKCKDbPKnF5pUppWdOtK4+8g8CCrbKGPUzqcZ9gkUu9jOSErtH1AHtrWVQEIOuq7VN
	 /YROEPH3uSyQ5PRvpUHZlmbfonJcPNyNkM/hsG0ZdELIVKltiRXow4lHG9lbh8DRNG3VM
	 vbF9OwDZW5DzKH5965KOSoB3xG6beivTWQt2orI3805Ilmlz7dRuYoX1hyebc9sl//A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
	b=dRlGemnD3svkbhSNkcimM5kbFlLdYe9m9u0YN48eT+ribO319VnYFfS748SB/ip9QRN3
	 DXTa66YvC0emhfu8SXsD5p4r9GjHF+E81Mszb+edlMmZ45fEYHf+84gss/aos70tmPeyM
	 NXpum3Y1E6A1HN9/uFMzfj/wirVCtaGrdKescPdxs3hIVlZS6cwOct1IuZUCX5xbH8LbX
	 HFKt2Vx6QFn5r1Rw4+09ln/QBOvFWotCBLpfueSdrDvlVtc6NLrTURT9F4VWfADUa2rdi
	 xelFgT2rHcHyn5RoeOFukqcTY1GmrdlQZFghJradQ3MSctlpcfbQtka/8OXkoyCTM8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rECP3UTe;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B8606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rECP3UTe
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddc250d815so1491942a12.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479918; x=1796084718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=rECP3UTef4PvXoUQb83BYp8pKtAC156zgZJ3/BphXbAbnpzL0nuUZNFmr5F740vieL
         2WHDyllGPPtQfz+I5qAqgWymbjXdkoz4p1MbnjoKV5+WeRZjf/dLwdrVCB2dEb/owk9f
         qF8VyCOUv6xouZkSg2PR68akrT5Y0H9ghrpwO0d7RmXSPvJMZM6Bru7iMxsOLfCZuuIv
         aCi03Wvu/rPSE1Khh7couJd2BX3cqhaYkspnnk5fz+cDB68vvLssulxPnbC+qwrrGlYW
         QYGzHL9YHLagrjSEtqCcjxgcLOIEyicBlm6wGyLvERrlADMPdBpVDotdCIfOBf+oM8gn
         RDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479918; x=1796084718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=Lj+yJ+OLCvBY+Y6MJGVyYmqpY81twYtSt1aVKxDT1Ohgb61KABgF2Fb6vNnmQiDc5s
         QnxrzRJXg5Y9MeENWIhx9rh6Am0Tu12G1wwoEti5kR4YxoxLu+VBTSfToqPEgbTTAoa6
         5xFtq06L5u6GGtqTHQMWnCwkWpipOQAcbLT2Zr97l8zW8B4OvVjyebW47NdpuCgSf61/
         tlK5ropL9x1xy5WeoIvtJdZHDuhl1pXX/J6z9jMKR++6nBAMtVeQW9zrA+X0/Jkq3if8
         c8t3kgGe7NhcHLHYjcbe5oEX5iIwSfRjIBcmCbLSmVQzEwmx+H9W8iMTsm8qJ9Nkx/Q2
         lKUg==
X-Forwarded-Encrypted: i=1; AL+hErFYtixQBPkrTiiKPATisi8zyJTeMfW6asPZscb5YqOir8pbRTa6nuEqkI4TsSWpawtca1mChdGy5f1c@vger.kernel.org
X-Gm-Message-State: APuU4Z9CHxTjUq7XAY3FQMtmIMxWRvvrMMV/ulIGKfWXTCAp8tucJjUb
	HD1JxDrCcCiMMQX4YiEu7CNVTzML0ShuGSdCFYHVW/duxt06c6WZ+kIF
X-Gm-Gg: AZFdTZe2FCdVRgrF0WmGS+Gev0llMEfqx/2r4BLCtf9PJfNUYE+UT6wGLN+fQnrFgib
	T1Ez8Va+oPJicW4xSzPrrd2k9cxjcVNGDlCtdzBrVq2clyjS3WOaNRRT4uohtcDtPe0Tj/PQ+6p
	nTQatkXF2m7UcFPQBVVL0KfH2z5is3uQSWnD21cpuJLXKqsT9U1DTtAHxXcHksud0ZjzU/rpzDl
	TZVoYTZXHSJzw4rZY+NeD2SWBEyrD88CxPcWiktJCZROVKefbhDGSRYSFFnYS9oeQ0clHOUQQV/
	Xsd3ez0PexQ26c1JhaaZLs7yi5INUyU/R1m3D8hhu/ci1f1oP4oxDduvq16QDlNn8eN3Tk59hnj
	/Y9KSVjtelH9QBLmgHGd5qZIrZoZVfxLCl+XbbE75BtaEtiy4cEyO7M6XWy7WA4QKTDUl/LZxGM
	F4UtLQqjbgJ7WscudqYG1eBInssr3mfaKwcft6BqPRSQrgXSrF8kE0CHnAi7BCPfuoTDQ7Td87y
	WRg7Ba6qPxq/EGK5CUgSsiYbiKwbte2njHuwF8iWsrnwYrjSb3TpWWMlM8kPshVAZzSLsixSspB
	CxlhNkKNwivUZR95+4Y7Nhgpu179FdzQ2uLH0xdmWQIpPK+8rjqB/xekYoqQ39M4OWQ=
X-Received: by 2002:a17:90b:35c2:b0:3b3:cf61:dc65 with SMTP id 98e67ed59e1d1-3b41c8debf5mr11489016a91.23.1795479917975;
        Mon, 23 Nov 2026 16:25:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:17 -0800 (PST)
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
Subject: [PATCH net-next v3 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
Date: Tue, 24 Nov 2026 08:24:36 +0800
Message-ID: <20261124002442.19414-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124002442.19414-1-mmyangfl@gmail.com>
References: <20261124002442.19414-1-mmyangfl@gmail.com>
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

