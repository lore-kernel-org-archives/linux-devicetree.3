Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42E331218
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481527; cv=none; b=Ybj+w0wC63so/HCQ5YUljXVPf7MiVwhN5vbiiR2d0u19ykkx3WumcNZL2Em1ICcDGjU9GTFXWTtzl6CjEcLUKxZnaZz+/JhqBNh1idQZPi01ns92CvDho8FvKsNawMldqO6ojuEq9F37dMudZZfD2H3GC03rsH/KIF9kkzD+60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481527; c=relaxed/simple;
	bh=rp9TUgqWsAEGx8ZoT9kL/TuCnQzCen5V/DE+nTxNcxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvvYqxCJuxqwD6tXvvmni/5Wgb8YqMGcsDC0346rMaPDgm2rteNSFA6p6PgO835QZtPzyYFIDHLTrP4CJHgyE7WuvUYeWcgliF7UUEsB0BriXFCCsIFJ1PP3CGYghxmRj5lUPSlqZtwM0bq0TqSHM1qa8UZBDMiAmp25PkKvpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnnFc1pT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnnFc1pT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3660b84347dso2341859a91.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481525; x=1779086325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=EnnFc1pTp6X+s5TrzyVgByNOdsVvAjfs/ryXTXnwR67MuBodCLJRLYehufJ0Q8cRbY
         YHO4BmqTjp0VbjWVZJe5blpbr3iDJnKxjeWAWOMFhnbGlkJdzQ4ch92VelT9hLyoYcvb
         IiypCMSO3WJ2+O+u98kAzTJY8ckfjpTIXVCaKckXA7Do1PUpAHYtvAHY6BAj9IzJNPGY
         h2DZLi0F6j6nZ6g8/m599GeBvr64Oo/kSTfgUIE+Xyl25w+A+aZqsTzqHe91oY7aG00K
         wn/wmWIOT7XE1bOVxsW9eq47Zom5XVGslUY6v5e3izCMljd92UEskAMmZ4cvpQpY31Mw
         he7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481525; x=1779086325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=i5Kx6IWtd7wBZb7/wpH5NbjyAbbjZEE5jgaR5h2eEaqThPzdu6XE/kM1OPG0MyZ2p6
         gDL5D3Eu8E5hsqnSjBq2fjJG2BJ9l8/lV1AMQXa/8xCPTR2vpam14JvRJmoQc7EuniTG
         piTE5p+g2b3zzvz9llfqG/5i5uuLaX+yNAP8g3KhzWHYp02jfy0bqydDWY9kC7X3XdpG
         1cNcwcAW2po5XVsC8BotHEm1paaKimPKbc/dy0VsUUIXkN7X5MhxNYSW/2AlB0G8QtbK
         tFD/5VxySGTB4zBMBQXLQzMUgpe2Ijtj79Ug/2zBiyQq2Ygcz/Or14JH4/3iADM2f9mz
         16iA==
X-Forwarded-Encrypted: i=1; AFNElJ9i36MBkABQ3lMxAlJKyBRFJ0wp+iBvuUiq+5BKUGyh6pN/AyowNYvYdr9Nw/ENd6xiDDq5QQZQmZ7u@vger.kernel.org
X-Gm-Message-State: AOJu0YwNx8Zur4mnPQnulmEfEG0QXiQbEniMtTieCefQ2C+Q1sXa89mB
	QvV4zPbHGdzDxtOqsVWhoaI0MvE3BsqP07m0rWTkGf94bbV94R0864Bn
X-Gm-Gg: Acq92OHPZch+XCll7WB4fVowHqrlVZ74ftV3l41mX/0MZYtTCD84IkfZHWmKC8E0aA+
	TOdx1vPmXQZEBVwa1OM3Uke7lKctOrAsjiO5aPwLSRQeJkvemnqFRzIaUOijoSqHMtWqpDJE6ug
	k+YVfWSYk8Pv5PJNKbniCbApclOz3YioOvExBt5+1mDk/5BFiojcC1/QdpR266WG2NkY758fGs5
	zM0ngKmDjWl5+rAc0e6KXOquwt8qa2rYBE0SU19Dw00KdA/YCmT90b0mcLKkIbc4VdQhbrtxW7i
	u0e6ZcTff5Uby+N7yI1nIt6nYyXNn/bul3m6lS55GH3ZmvJUAiQZZIFBHAW5jxRtE9uIXOoh76G
	nVnEKpsIBy0Rrdf2vCTclC6fVcPyY20GZdgawb8D4IoCZEhaQhbwMNCzY77bZ5Or3zxdLrpwTZ1
	RCOiQA9UWG4qfC9e0MuZ0ybF+J5bszqnrMuA==
X-Received: by 2002:a17:90a:2cc6:b0:365:fd4b:24ef with SMTP id 98e67ed59e1d1-365fd5a6b34mr13110423a91.8.1778481525495;
        Sun, 10 May 2026 23:38:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687a2a8sm6358472a91.15.2026.05.10.23.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:45 -0700 (PDT)
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
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
Date: Mon, 11 May 2026 14:38:16 +0800
Message-ID: <20260511063818.463877-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
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

