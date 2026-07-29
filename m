Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32548D897
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332198; cv=none; b=nf3sTAhhwati21x8qA/ZK9qJgCX9Xnv/ck4TbYQmRxUHGBpjmkDKSaRjbvN7Y2tvTwX9unceQPO4qsILmtXgTcu37icjgEaobxZfDpsxJHi9ddNTl2Jh59ZzVEi/eaMga15CMybRAWKcqRW6mtlDbkMrw5bdRtHA9LZmBZgpzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332198; c=relaxed/simple;
	bh=u1sFzBtIvZhDf0/KQ6ExYfTAhM4nq6AqUQV8by8wuCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cL4xgtRc5mfZrkbJsqAAvXj9Q/rRl6/J9Lxiw4F4OGOy1yIZyD3/1EVMQEuY7zR6aKKNJkNe0AKiGEgURr0hMt80jZHRl6425r/UwKjc4vO0QPOCcQb4cfnKuZdYwBvPmgT7hNcJcEdy8FxMSCN4zTq5+34IIf+jPzFx1SViBLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hg3+2Fsv; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hg3+2Fsv"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ab04bbcc11so388497eaf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332189; x=1785936989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/poVjj7DauL+sp/Q/JZ34E4HGVAnOwuNgsFBTn2UtM=;
        b=hg3+2FsvIZt638NCZOfVVzh5K9WniKAnHLQV2WvMgvpkBb1/yvLvaidbmryBolseZM
         R6+EIvqJmwf4hC2OZi6IpcyVdInrt9abtycON/LKVlO6uQfe1Rq/nGAZV1KaW2EJ6bi2
         V7+1eOO3CJwPf1NCS6pGkjCoPD6zmuKEy/tOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332189; x=1785936989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/poVjj7DauL+sp/Q/JZ34E4HGVAnOwuNgsFBTn2UtM=;
        b=AAt/zJACvW+OJ1QsaddrbwIctgOLTLZH2HHLhq0tfighe38JUhLLeot/NAoBg5YEk1
         1eq3A5jkriWG2emTk+xIB7LgF76QwDJV5HlqkCgVNuO1Bmfi+MH752Kk7fwUIDUdDL5C
         8Ny1M5UNubvlzf6BA+bnsby1YewCZlNzTCxk2j6i887HhlCHo4ejNXtPKyj+rkG5iZae
         Lndvtz3lKCwFRea6H9y9uLU+qLXmtFr9Q+7SsAI5vbVqcXO/qGC8lsTTEv31gAvEQo6s
         ajEPP62kwNYTGdw493JpO0965oOUZ9Mx0NOC+dtsrjDK42flbqrt+WltEAcS4tQVWIgu
         wyvg==
X-Forwarded-Encrypted: i=1; AHgh+Rqlu7XK7QgknOfWHGhR+n40l/Lr8VlH46WWya3+4XHVZTq/kvh6oNkr8PU2OHZZvGCVUxvC6eVprR5c@vger.kernel.org
X-Gm-Message-State: AOJu0YypdCytdfyGqu6BAE9MRo4MWNj9q6BK5tsSmme9Q+0hQC1hvoN1
	nxAC+R6DBmlEZk3S1EPb7fNqOFNRsqX0ZUycr0fYVpfJKGsimmxPqJwNUE4dFnPOfw==
X-Gm-Gg: AR+sD10wGq9JiT2mLHr5sR3MjUQBmK+AOjlxNswA1xCQ4N0jKUWhpWlRnRogkQEUsDx
	1L14N2MYDbnW6gFEr0fN48ac2L6a1N9Zv+8WEeFChGI1PwxfK4n8E3UIGz1//9pulXqVrzxGlbg
	RdVyO9vXCH7/q/rDHyHkaOv6EOeHAYV4Ql7fqCnQlJIjQhL0e3AriQzKTbe+NL1G8GUlylJh21v
	qu9LbVGZPcMqECNib/hbslyqGKGvIxh0A+6yCxL726DejaQBM1TiXwzhJTnqZjMvqvvarb9O/2E
	7b2p3JkBXVpQhrpWNWbei0zSHrqXeG74GHd9qM9S2JIIeJQSsBpKQbYzQv853PM08uRYeFSL5AH
	dyj4BQnujuHB8qrDMlWHkSP0gw6WZKVe8Ws/hpITxNdqDjEc2G6V9oQHj1BdY7hkZIx0Qw6gqaB
	XMX2AwXFH739DDRTR6Mo9Uojux2HYa8YV9UzID8qZsX2IE3JAtiCRuGlo26lj0lG+zow==
X-Received: by 2002:a05:6820:1a04:b0:6a1:857f:787b with SMTP id 006d021491bc7-6ac96d6ef03mr2710820eaf.55.1785332189205;
        Wed, 29 Jul 2026 06:36:29 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:28 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Wed, 29 Jul 2026 07:35:50 -0600
Message-ID: <20260729133609.3465563-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatibles for the general register files of the Rockchip
RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
controller.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Use a separate compatible for each GPIO IOC block, since their
  register layouts differ

Changes in v2:
- Drop the grf-cru clock-controller child and use the syscon-only
  group for the main GRF, since the CRU now provides the MMC phase
  clocks
- Use a single gpio-ioc compatible for the per-bank IOC blocks in
  place of the ioc and pmuioc regions

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..ec122db3b8fd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -64,6 +64,12 @@ properties:
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1103b-ioc
+              - rockchip,rv1106-gpio0-ioc
+              - rockchip,rv1106-gpio1-ioc
+              - rockchip,rv1106-gpio2-ioc
+              - rockchip,rv1106-gpio3-ioc
+              - rockchip,rv1106-gpio4-ioc
+              - rockchip,rv1106-grf
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
-- 
2.43.0

