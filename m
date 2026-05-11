Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272FE3148D2
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481476; cv=none; b=OXW5gUTbxaN5/5vl3RoNtnYj3IQRuhrHU90I68fEJlaDh7enls55d0Ty7OkzCvCCVDTb57QWO0TWmgjxkYM6UphLQ1h8rgXFF+Tf9LVyWMt+isBKPHNvm5j46a2v6KD0lLtB2Z2DNKq1BdhQX2QISd8lSs8GuCZJWMZ+cmkBizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481476; c=relaxed/simple;
	bh=rp9TUgqWsAEGx8ZoT9kL/TuCnQzCen5V/DE+nTxNcxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+2Hzb3PTRaJmfpimYDv+gjPYVJdfolRglCX020stka+FtuwVnx0zq6ZSxRDNHSfYtc4/Ic0cd85uWSwkiJu/j/53SDCzxFXx0deHfFBuNauEme3+IczPOAJ9ai2wq9twK6MTaoVdPPz+cbO5zE0uE0Dnyzj0S0lB16Ld8ITCno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBMWipPX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBMWipPX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b4650d5f5cso14559095ad.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481473; x=1779086273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=OBMWipPXr48sxrFwvRIhlOuRZ3n4qxZ9o/uGQdN2orJF+wYyRoyQMzjccKZMRDeh+1
         rKHIV2nk9SUekZUHaU/pdZzixGFiVNAGihHQEC9pshNescKp3vDaJzb5N+hu/FXY+feB
         2qja/dDlbEZjfw4ixWUgBTuUsw8vPOtay7g5uJBckv46L0hpZqLdPwYkurB55HLNk7VJ
         64UKdci8sg/Kk+Es04lVFVsSg/HGvu1Sx4FY9Ca7nkddtyAL+eTzcl02L2yh+EL2fOs7
         Wi0DqmOIS3dGBlAfjm6fJCAa5pX3QY9yVKCYVurR67f/hYM56+2Y8gKDGSHfBQcoVVCA
         jcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481473; x=1779086273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=TeKf9h2btCA5982tQjbSnmdQz2cQV68r/MaKOXeLMFrohKSJqfrqBc34oJVKD67ner
         xTLbBKl+UpW4hyEvabWVMv9Qp7SDfwz9NwBW8D1PuVWEj12t/w8iHdU89d5n8yhBL8iX
         TuW2ss0NeLl/hu7Yb1IaKP9jLGk30iQbeOG5UA8pTXi3ScuU2IhKF6E3c0lD6Y25qY8q
         MSVdjMChzhp9vmy1dVhs2kPAM+Jk1qruwLuRdlnMBB/WUjYX6e43gf7W/l6dAnCCfYBL
         o/6aFBlHsO4PTkdYexXeQTFgiriE73GWqZvm8qHmrjGDyzAHsLYBZg9S9HZpqrJAFbPj
         QqIA==
X-Forwarded-Encrypted: i=1; AFNElJ+MM0Z7XwWB92gb1HuSvO2DBZOgUshY2YxhFT3cBmvunh5LipqSyjgCQOoETPlog84GCW5H7Owdv3mu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rqWmc4c+qEqF8LRRYkkHBF76n4EMLp/SdNaGz7GooBfIfd29
	cV6gQUKXnKmKK5VDDcNRW4MjatERuaM1S8kUEphh6ApwRZh5nx1k9sln
X-Gm-Gg: Acq92OEU45zv2g71/Ezqcf8xFb9FulV0EYGwq/NDmQv00vD9xNVeD99Y3u8xVsVZPNZ
	oValEvS0Eyc3n/C705KaMlXpLgLms1tSVHHiU3jGHL/lPpz+posoGllZM+NpAEl9ZRz4n+mcDYI
	CDILqijcnqOYhGpded850qO29EeFgxKNdneDmFPqrcRCMS/QEQvZNd5zRTJJKD7GDo9HtoCnzI+
	LL/4lVPpqH56+c0Newy8GQw5kTyd8OAhsdJlnJRDDMh4ZHZqfkkfrTIPz1KXWs70kzlr1N4XoAj
	JCtcguekQdMjKOfB5oLeIvhcpEkz/JWZsgH5WBVSnHUcBDCMHA9Die25xclspboNRkG3PwweUnn
	Mi0d2dYeFSuJoYeDCnKgnXfJblhX7OxlxHMqSzV33XZkWAMT9KMfiyIl+GbbAGUP82zyIP3+RBh
	fXsdrk7K0Q64RR9tBd8hjWNDo=
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id d9443c01a7336-2bc8634c747mr79731485ad.21.1778481473488;
        Sun, 10 May 2026 23:37:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm86095085ad.18.2026.05.10.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:37:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
Date: Mon, 11 May 2026 14:37:17 +0800
Message-ID: <20260511063719.460049-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063719.460049-1-inochiama@gmail.com>
References: <20260511063719.460049-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous version of the binding change only add compatible
string without adding the fallback compatible, this breaks
backward compatibility. Add the needed fallback compatible to
fix this.

Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 804514732dbe..0a30a455b0ee 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -21,11 +21,12 @@ properties:
       - enum:
           - snps,axi-dma-1.01a
           - intel,kmb-axi-dma
-          - sophgo,cv1800b-axi-dma
           - starfive,jh7110-axi-dma
           - starfive,jh8100-axi-dma
       - items:
-          - const: altr,agilex5-axi-dma
+          - enum:
+              - altr,agilex5-axi-dma
+              - sophgo,cv1800b-axi-dma
           - const: snps,axi-dma-1.01a
 
   reg:
-- 
2.54.0

