Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CF5650EB
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000244; cv=none; b=mQJj2Lu3QFi80l+goD6NLG4JGJdcWPxj8iwnerOcei7x+qf2AbCjfouov3GPkBeqNlM8tJSTJ58tsYoZqM/XgCeoe58EWRgoQ2ixCkNYy210fAblz0dA9+JwIM95kwV1Lwmb3DIF39SrXynMlxf/QsGZjUyy+49c9x72GHWJTeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000244; c=relaxed/simple;
	bh=wNHc1TVX9sLdgDlURVwlHfFyDA+suFjfxqcNteo3u0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVrgHICadwJR8455oR2a6g98ILsutkAIEb+koouBLl3BbaLofuZdaUvhWNOcIxS3+v9YgHXuAr2xjB9PB4U+llxjtu4yRH2nII27G7TUwCZwj/m5sN3W7w2Exg+3bVfHuETBLtsURHCKtxfnuHCPJyHz/tGhieCqjmfovTcOnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFz4dKVd; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFz4dKVd"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac5f801d7cso283785a91.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000242; x=1792605042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=;
        b=XFz4dKVdU+siE6vnkJ/ggBPB4FNRvnDy0dWilLdet/jGHl9baBZPq9lngFEGroxbmz
         IZn+/vPyTPFoJ/kLoKBkRz6Kn4GmvhW/CiUYJ7mpIena1WMoPFV3GKwWQkw+abXJATIY
         Im2xjV9Zo9h4GgjF6l8iQETKFvFTAvZziaR+OytckvqaRho8nBZkLgOUV7UDThBu4pRy
         ThST6z5I+L3UzRd8mWpSEb025rpb4HidWAhjgtKGrPj6ABolJLwsvRh4Y/59wK/EROw4
         6e+p6Kr3kYB/p7nPR5iLjmDtQKkpnRHyf6H3uuZ/WQ9KPodNk1Rh/q8zYE+21dm+Wrem
         e7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000242; x=1792605042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AieOTAd4jPGHXEklzseP5L8MSUknMI2VVdbM9VXqd6o=;
        b=TpqvN/iATsMao+L0wEwIuANRfHwOULBPTrZcy38jg87nm5Gg7Fw33501ac/ZjCiaVK
         IUQpK0qSqndPsvAwDcdqXFGcGdeaydY5uuCwomeS3h8j5BqXVV5P+0gHZdgiPnbPEN94
         4Aeh9GArh59IxYXXyH4bnIwt7dAcbfYJEKXk2hZyTpBEhgYe5r+7RhlRaJNidVuc3xs5
         qmR/O9SI3/up3KDFNk0GAQn96alM2hITMpvkcK0jli2JbuYoYMqUHQpY04wDnEoU6Qb/
         m1ynP9xJmgbLO45RN3+iTObETb2nNCymUVUeOM2Rn0ylsdW8f7ekR04Vhf2iRGeamEhz
         qgow==
X-Forwarded-Encrypted: i=1; AKwUvBx3mNT2aYE1JVmSUAGLyybP7u66Gln/ctNcEm9Se8qMVlJPObIhQd5NkqXkb011+BalmXMhPlp6UI48@vger.kernel.org
X-Gm-Message-State: AFq9FYLqoucuoefvczNoZGyBdaBGXv15VsJ164VrSDk4z42IcBnz1zLD
	xyCVt6/AjXGZ6cItO7K7e4ExGonGogApFpp7wob7NN4GAiRQLu1i2+jC
X-Gm-Gg: AYBFou1LqLCVUna6dypu/0uhkA9xY6anfZD3S2ZG9E+KrlsHujaFd6zHCbLZ1tXLV/w
	rBm3G1shoQTXxBMO62DVd8c6TJGZB79qUF/IZY1XAzX7kB2hwcDYgh5lrYMi4oi6IjIt571yliG
	UUD1W1ZnBVzXs0v3A3CnuRNxo2yce/IkDMhzi94MzzItyhkVbp1UX7QRM74ySx2w6733fNGDdAo
	LP28Jh20Yvm5yI3+D3hkfU6TaBgtZ/cRQNZh6FFhepEX+8uDic4bG7LnzBtr9Rwk6+3QXpkCY4b
	I0KdbtYYhqwP55XD6b9VDqQDE0FyNTUTT5o0iCFRE1aT5jk0ehho048yUfB1B+ysvvcd9THQOcj
	LrDqHtcpyxi0cC//+Yv2vUqlU8lNRUOFBSvXrnNoBdWr68CN7VUiLbp6wpDOA+zWG0tllxa3Er1
	TBqH+cBvsZuJbIBxvAxRwOucqZdvZQXfGwVW0yAQoZFZumYTpdg0yB+Cs0xOhiLNPgYEZqhoqp1
	3Mf77eHNRhaNeW9eekx
X-Received: by 2002:a17:90a:d44b:b0:3ab:365f:ebdd with SMTP id 98e67ed59e1d1-3ab3ad2029bmr13240853a91.37.1792000242195;
        Wed, 14 Oct 2026 10:50:42 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:41 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:19 +0800
Message-ID: <20261014175020.62907-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Collect Conor's Acked-by

Changes in v2:
  - Use 'alinx,edgeboard-fz3a' instead of 'ebdee,edgeboard-fz3a'
    (Krzysztof Kozlowski)

 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.56.0

