Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960C92ED870
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290805; cv=none; b=EctQ+ofgONy5WINQMxL4UsGczmwH8EgWbcatKNVns7WI84/jGz14Oe/tt2z4KmMWjS80EZWPOLvPTNttdMC8F8O4Jj4D2EIL/PQNwlqUbqNNaSBTuXglJvQbMqgVl0qKPc1WmFiyt8d7tBn5/oDanVkB2Ce9gZaPEwtYcRCHNG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290805; c=relaxed/simple;
	bh=Jsh+4vP/f+Y7qzRXW4NmYmHJSetmziSvku7ESza+DQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKFyCxZ80M7M7uPhIF/SLebo25/uTud5hs9QHpZ26gEmw0lYYMvq7BjE4hVvxRPCEngVox4ghXNeEp/BXTJcSH70hHL8Ag4XUqY51p3KzeBViF9nhhB0she2tpqnrmyYn+xErgC6FGbO0K4UfdwwtF2XDo4oNTB2ujlgmNEllK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJi2w7oB; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJi2w7oB"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so4797a91.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290804; x=1782895604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=;
        b=DJi2w7oBNKq00YJO+RhjhHa9xYBVP63kTvGWwc+wVJUX8ff2dWvf5yR4PS8z+VSHq/
         9m/MbRPgIG4eWHE4hFtJHqsPAbhu4not0whkHp1sqEQ/lBrH2/D6BWHcp0husABtBprh
         kiqammE/tha3J3RA9hya/pWSfJeyDRFq/9cSbLjZcidF91qql93mMa+98N+N/FDoqNuQ
         FisYU0X8HA0BlVBWDj6MYvAk7PCQFmkgXHzfR5LDyGzFFZcNq0Oi4OByScyoLzB+j5OZ
         ta/aAgfUZr/d10CvbEvtmlJn4i1fBYlZu6xcIQi6zToqajD09TufIsP/f/bvdgwjG7U+
         OP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290804; x=1782895604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=;
        b=pMTF0wCxVdwOQNIjcjQbtZ6TVQTuK0FQd+HJqYoif7xw8bb2g+91LHxpn3X72YzwAq
         OaA1FSfnQc72l5w4IH/A1iCZYJYYDhqLvbsFgUvPKIlXgfJDJ0Z+WYhlP/5hO8lNDDNi
         JW2C+T3JyKCxruWo/79BTZpvjnd7/a0yvkmtK6DhX7o7j32q3YSFtW29YAp4RW7YyVYO
         NqQSHJ8/PcG8VQdOe7Z9ZN/ww8rlXwRDmPVaeOTkURAWzLqtJWTfHjeFLks8Tc0IXuwp
         jg4TpC7+EAn5RjIqjq1f3E2uBYAu76+ubhFX82WF2T92sX8iEMJgpFxwSfUQJskXJfA+
         JkMw==
X-Gm-Message-State: AOJu0Yzo6ch2Z3CkvSLamyIFmoi7ygWferJCdkRXIa0NDmJ1usVyvXJh
	4BT5reLEfSDBtk/rXlymL/Fla+TpSY7q0z1p1rIyOffC0oB27JPWdc0b
X-Gm-Gg: AfdE7cmEyfUHJTIEidv5WA5UEh3QUQIGoV6KveWH/TJ7/4Cxt1X4qJHoVDq105k9EoA
	q55MAD1xSnUzskdgW/8PrhwdVPLEpAb4fBc/I/+8Wb1SQxUbX1DBbEkGlxUR7YX3mH2dBWoz3iX
	gy+gz6vcqGuqqWtHquLU02A133GA3DwI9S2seSAg9dHlez5CORjVUqW7b57GT1+y24p/L63+p5C
	YYJYBE+DMcNfOGFhBdeKS/XsB0+Nhop+Fgh4qNeiTfYh5MczwyGo+OJtXxDNJ7Dv4J+p8d8sWz9
	j237D/JOBHV5IERTJnHrBsR3KOQiA/MaZl8dXt5MslNAuGx5cfoMMsJpTPetS1T2tJIA70JFZPL
	M0huawvh1gwuvw0WP5edwtTwokKHyqT2Bgfe1tB/umficrWU1y8sMvqWz/6JJ47UCaXBj7YLQtG
	iVaMnuekGGAxq5NBKsmSf50PDDXCYu9/FIo8E=
X-Received: by 2002:a17:90b:3d8f:b0:37d:9874:935f with SMTP id 98e67ed59e1d1-37dcd701ea1mr6306406a91.11.1782290803441;
        Wed, 24 Jun 2026 01:46:43 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:42 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:38 +0800
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: add alientek
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-1-5aef608a3f64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=883;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=Jsh+4vP/f+Y7qzRXW4NmYmHJSetmziSvku7ESza+DQU=;
 b=Z9Lt///3m84yBAmd5Rx6elPweLgGZVP5itDksYZtTAsSRkl/mztlr90ckF6yRI06aMkezej95
 wSJvTw1mqiAB++WxygtHTIGc9+5JEekbHz0QDhcyHEO0zxJqsmdeR9j
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

Add a vendor prefix for Alientek, a board and module vendor used by the
ATK-DLRV1126 board.

Link: https://en.alientek.com
Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..a23508a61373 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -88,6 +88,8 @@ patternProperties:
     description: ALFA Network Inc.
   "^algoltek,.*":
     description: AlgolTek, Inc.
+  "^alientek,.*":
+    description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":

-- 
2.54.0

