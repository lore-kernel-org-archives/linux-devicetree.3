Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844F3D667B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395401; cv=none; b=BA6kQ23G2MnOvz5zVn0JgErgeWeBlnK1UJgd3qTjaLQVGh72hkrnuYrmYDERxd++hTyab5iMJk2lvf8TJvM30z6WZjJ7w2KpvPCIYDUDrK1BQq2HrcUbnHNejltp7eU+tP1Kh52ASeZqZs2O7XM/Kqb12GTma8TO87Qn3BA5wkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395401; c=relaxed/simple;
	bh=uW2jVibi5UlVA0sr1KUeudNxCWTIR8KeS8lo2eLVMg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmP9E9JhccIUN05ZbRThrktMn5x5n78IlSYAji0/SP+WZwHM4S1friVI8gYgSK+O4DWQIYpasR/Vc+MEa1BCjlWfkm2eejwWkGW09sIZMl1HWnLdZJZVwnlFeP3bd1Oz1bhts64Lu3qUIUI2Zvi16+lCRXN11dGaeBGNRhDXSbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7eQFVIb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7eQFVIb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8588f8fef3so1100898a12.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395400; x=1781000200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=;
        b=V7eQFVIbEAH0qA+HSG67mI9/Dy15UHKBjRc8dC51Hqx3v+3hd05Plp0x/2Sed7WThn
         aDc75iNsSDHj9CJ5kFMCXsJk+uTX3Gu04NL/BuVHsIkcaPL2MQHZkO89T8VHMuJpOnKG
         pD8cmlnkVF8cg0RLH4mLc1mr2EQR9IIgR0Wh/Y/Q/j5mVqGL4o/URmz8/auMR+OPJluB
         eIhb79uYKw8MFuCpcBMR3LCWc3AaordjJY715aT4St+HsGbjToJ73UvxZYKgWVxN5OPZ
         vhZEU8QiGoJzskAWrm9vcdLGzKk+7NtS0DOhBkmAYENZ0OqDPW94Dq/bsmIYcqWcb3VC
         DfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395400; x=1781000200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=;
        b=lljtcOKY/gtoB74pAvwqr6eBuL3y9uC+MdXX1P6y9SVIuDleMdd+c3rwFmsjnF33zn
         OC+GL5NzavWW6mWoThpIFG6y5SXskyQl8W6gKr3s/wOjhCIlQzGL5kWc3dIeb4VPEPWq
         d2Mif4/SP0AWTQTejdQvQRNHk9gKJ0avELoUCE5AfvTqUZzrcuxLFZVCr3b96qzba9VR
         XYCNhPjhTFM5dkLmzTheNm7PdKIl+4SsU3RDmq0uDdsHFlZeNKVZSJcl3cMBkCWxbPC6
         u7H7ScQQXZM2VypDothAHQFQp5y16v7Pa+33o7omUDoJwrsMkOs4bGfjRIzreYo0EiKN
         suPg==
X-Forwarded-Encrypted: i=1; AFNElJ/SbziD8KMweR/p+JEbX+oVHs3gnpLa7FzWe/98MMjkLrzOQA3oV2k4L8X1sOaeB1P/2BlEaQFKZtcC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQc02qh2bmkl3KGNii08LHQvBid2vbGkgD2DW8fv4hBtdA9SyR
	icGUeInaYcLF71ooz9voDtcGLkFBS+U/YVsKnDGd4uoXeKNhYpLrM7GR
X-Gm-Gg: Acq92OGlbamJGMIau4+FZiM89ELHOp0ctFgqCN5XdkBn67EqM+S1asdS5p4+tylvXDd
	2p2dYKiq+vgjj0nlGcKYbghX8aGOAnbfqL1WsK9GgIy8ypMzHpxuLI3yqyBB903mGtgwVLD83/n
	gXp0+Au/ZR8uA8GETOEXhdCRmeORAqhd4+zvUwwlWA0H1ppIyXKK6Hlr17BVAxiI5DMzKkGvDeX
	+4cdK+1W5nFtfcfEWiLYtajWaHNdfs0z5R3lCi2Ce1HNx62Y/BUm4AKa8FpPlqg51rkEZlAG9pQ
	9O/uwEGjOADieS4yMBESiADhJ1S5yCbvf/j27JCmLoer/EDKy+bxbTS8sIAPHxs3xDHh6eCBgQZ
	4vCv1G+lO55FmxjdQzb4qa/DAvMoGIRSQv6plhVmXSINQAIHk9WFifZ4DFUJB5Yal83WQm9RTdB
	36gkJfhFhiJ0R21SuLjusNnLDYIf5AHfqFpXEqT3H0IiRTlmNMJ5LGaWIw33+rco7vD9AY
X-Received: by 2002:a17:902:e88c:b0:2bf:30c8:bfa1 with SMTP id d9443c01a7336-2bf368bd8aamr168629675ad.41.1780395399946;
        Tue, 02 Jun 2026 03:16:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/5] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
Date: Tue,  2 Jun 2026 17:16:04 +0700
Message-ID: <20260602101608.45137-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Update the binding descriptions to match the actual clock usage, where
'mclk' is the controller clock and 'hclk' is the bus clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
  - Update commit message based on Krzysztof's review

 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 502907dd28b3..b174d7498029 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -45,8 +45,8 @@ properties:
 
   clocks:
     items:
-      - description: clock for SPDIF bus
       - description: clock for SPDIF controller
+      - description: clock for SPDIF bus
 
   clock-names:
     items:
-- 
2.43.0

