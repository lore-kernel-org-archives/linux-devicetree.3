Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA412ED870
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290821; cv=none; b=dkEdVrE+A5cq/12K9z0BPPsM5dDwgrhlESLe3FcWC/cuhfFFpiKk3fBTWPfEnue9g8tUZ2YIFZ8MBZg2IkeSYdoe2JLLW1v8RWIcn8Kp8IIgeQrjtUVkxcQv9y1RWH2CzG3PNOc5/njYeISclgEkXcCWhCWwBPhi5y84oWHOP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290821; c=relaxed/simple;
	bh=7ocGNYRnYoq9maF2qAH3laNWa/8XOoI4f7GpRXsmMt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrnClOqD6jqhXFRJeWlxPBIR6g7Ncl4up2gBi6azn+vl3fV4uU+K2UJk3o1Mn4Xvn5qqSN2fVycrtlQCGBI7BNglukQFE3pYeKOeVFPKaOscxPfxiqGySk94zX16K3Xu4Be9uhuzUHZV4wUQT9yhqr7xNb+xT9ZjL+sHwTbjK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zn8kb4oq; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zn8kb4oq"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37d7c265ca5so660109a91.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290818; x=1782895618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=;
        b=Zn8kb4oqgNzkxNdTqN+PwganhWev7Oo61h32tOWP77PMTXkxWm7bTDrfku+UzgYcUA
         4eTWI3KjL8F1theqaGlX+HN0jPff3UG/2DMjJuheqh87XyI3TY06TrrRKD0iY+sEJY9b
         UczvjFUug5Hlwqsn4uqeLiJgvnQuE27ZBvPV/A6FM+JhZFvrIz9vLSl47z6Vc0livduE
         oIjlEA+J0VI7EPRdz8kmPSAKZp8LC6CKGZ97/IEPXVSrTcTk+lieLIFrB+cBmVh9eZ3i
         zqt4slGA7LkHyaMT+TnP8WIo0Ot0zCcq8Fyg+kUx0cQHj3kAY23QnnUvKU3P+PGFgDM3
         aK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290818; x=1782895618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=;
        b=VM/86d4wpQYGh1TtSKsRFVEJkFIi624bMKGZuvugnwpwizoAJNCk39cey5fmjAGDSI
         MC2yyc2U7bpeT2baEmtPGHiXiFDgdLxudzdNA9RbzQJJdxCNEK5CW3c0CHw4KRSnfB1m
         8E7ENee59cOQGkYg/nFLE0YZM96OExamJ12T0vjUPkzDlyd3GdMm6OKvx683bZRH5mcb
         Be+2nRpMrrBG8J+0WW3xvFrvO7K0p2OMcKTXXasSCArr90knW3i3zoKaUGDI7PRURcWV
         wTAPHucfV+uwdOCC9ukrNg5xYpePycWKfKT9EYW1KuJGdS1zDyKa1XASrqZIbtc03Y6y
         4wTw==
X-Gm-Message-State: AOJu0Yw4JFmwf2DBYlR5WvD/q000NeD+C3ca6xQF3nS7y4aN018KUD8q
	Sp1XNN9YnsXyA683oqUZKn8JFTQRmbkYEHmUW6rSu0jPVnyvAhRUxN6l
X-Gm-Gg: AfdE7cnBzmAJu8f3SJpfRwo1RmkGf6A9zz8O3VEANkw57YIN5zLt4Fk8WuprDTv9DHi
	vbpMDpWccHGxi/Ig8ksViDJ3ebAngTsfD6DustWHMbnrFReVHmfBe02PEhqiuNU50XXq8Cr9fDD
	uTRe0bQMFnTjZyiEbtKoRdGwQANm7AOr67ZtPsbA3YXeypw730ruc3xeplTHpzWLjQsAZONBIMr
	08pi6ACy4cl0ZGypI4aPdDRaQi9tKTJihLxTqYEIFkAzqPNnjpr3Yufr6GsvdEdqq8TRqDfmDG8
	xI2Um6sGCam4EG/1AJ5fHklZEQVi8gEjR8i+VIk4QNOIXwQvtxgKeB03iOGtOiFL/WGSdYTGfJW
	eR7dxTx3Unum2PeX4VWxAU7ofGLJz0eOeSJbDmfWU2Bdmi+WGhFnOOlF5vzJY3coXmSmTcd5Owl
	DM61+tgts0tleyHwJiwp5zKhaZ
X-Received: by 2002:a17:90b:48d1:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37de428c345mr2433079a91.20.1782290817925;
        Wed, 24 Jun 2026 01:46:57 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:57 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:40 +0800
Subject: [PATCH 3/7] dt-bindings: net: rockchip-dwmac: Allow 9 clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=790;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=7ocGNYRnYoq9maF2qAH3laNWa/8XOoI4f7GpRXsmMt4=;
 b=uzOAy6qn4x5/EXYbBgpWhNj60Kg44wCLTm0qHhvgeTMI+w1MXiBW2yw05av0FmzEnKcNPFl/2
 lhmTEwFcLUWDNbN0W8PzbS2ebsv35H1x8pduzk0iFDXlOiBZFmhJT3E
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

RV1126 has a separate GMAC Ethernet output clock used as the external
PHY reference clock. This clock is described in addition to the existing
GMAC clocks.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349..86a7e83675ae 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -71,7 +71,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 8
+    maxItems: 9
 
   clock-names:
     contains:

-- 
2.54.0

