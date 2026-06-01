Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB82C08BC
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329996; cv=none; b=sOuKok8kNERkh+xk1m/M8EBo0SWGqsom9brkJZJ8B3S798qYZSrwuNqC26lPNeGQCpVhTRuFCqsvJArxT5U7eeLsmVqYWULhtUqN1OBUu00NNIf3FdvH6xmNlpa485Y/0MYx2Ow0Xy5C0LaJY2z91nonK9gZJPDrJ1VF87lHoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329996; c=relaxed/simple;
	bh=PPWvaKyXHBKw3dRbdQICjaYQ5ch3ydY/WU7J8dzT2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gbwyc+bKrENJy2rZr0fjK9Yt3lwT84NT7eeGSDx33VSxZEjA9AVzFGEFmcNB6Zr5sPA9BEltKRjTPcvlXuX8chx4tD+SFOYYPjRfCbaVEfTEpH+zjjrpnI8vCJ3B1GciEMQkuYnzOFAUKkI7moYz1abwnBmryyQaA8FWPnXT9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6z4Pam/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6z4Pam/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so603128a91.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780329994; x=1780934794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=b6z4Pam/84jF40mebaQPHAymhHthSyJoDHPCDDF3eKyqaC727zXeW6o0H6Bl7TUwhW
         HWDFDMd8gQWODATiPhjjjYfFWHxnWIv2jjSWDO7tiEMR78mQkPHrX+YhHbKuG8Z3cO9n
         HXMqtTy1uzBeUbOJQVGCz9CMecx46K4GQE3oZnDA54d38VcoP47PNeJLBZkGn4WavKVa
         8aahm0YTLccDtOU2ut7v4p0B4K8IR+VoDUb7+TbSnJSH+hyF9DnS92CuCkbpRPYruvEd
         iBLdtQ7HhfTG0KNVodVi0AYS7QrI4PN29ZqiRxSO1gBL4AUwumUAFOwS2JXjEV5pttEL
         xuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329994; x=1780934794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=Pq43UzvFOjm/REyShvZf5XLbZ7n933N+PN4DSw/njU+drrnPhFQPSr2OC0k/SaqTAX
         MhayFhHx8+o74fu32M3xAYY3qOItZVRS+hRA3MlDszDyDtxShnZkxO1VoJ2LpSdQmphU
         cKEtwIgpQHxRX4ouHiHDTEwM+aoIICQyh9sdPml8zngJUgKug6CJiuVGL0lTIsyYGsBt
         XEWBzfAVsl0MCzAULPqMdovaP9pVdraSQow1I94alImJ4Yc7qMZxXOI3rTKghcthMSlL
         jkx9kIW5LLofhF0HyAp8vZiEUmwy16BUqRSRUWQqkEGJwYN+6+fu4RzcXUUilLnhbA+6
         yytw==
X-Forwarded-Encrypted: i=1; AFNElJ8dzUhgDH9o69otlvdiPyLIuTKpLAmjKRXPDRyn+pcJEU28lAUKetZLbd+X3qx8MxKc9MM+Xddp1CiG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/81eS2QTlVwj6G/eIVzxj/pdU2zD9KrQdpV0zQ/9XcFgTU4H
	Gh6ox5NwHIn9SZxYeXjawMs6+F2G5i5mq5RiAY0hmcPTvu1cD0cNDOF3
X-Gm-Gg: Acq92OHAOk57UnboOBPTBG+QrRE5Fn7CnEkHzK8jmLnyB41w2bFZ+AHX0/bJrza5PBF
	CNIqFP2Qx9JN1Q5qTAx+LkM+5DeNiyJ8Bir2Tp9Wr90rKgJ9cJTqYAgx+7gEDmDsvkvI2NHTQW6
	XQfahcalg/JvqMygfG/+r35jLUPzoJm9i8o/6O+2ZiStW5g3H6zvV/2mJHwgXpP9u3uRKZecvj3
	PNxkiHAWBxQaEE1eDIQoGrgR+Gv/yr9WspOKgFticL7H3cD+7rcETTT6n9nSPAgg+VY4jEJADXX
	4De8i8o1EC3/M0hDxShAyHQOYG/47xqKjTpuXquI8+HxptiLWZjPct6tYF0kuPB5JImPLao8OpC
	VfkF5X6tSbHAIXk9mQsIgbTL/9Ux1PsjG2sFXsudCPRfudiT4t6sH19e0bsYeVpilMDPv4wasHE
	torIEMshUvZkRo98ku+8PW6biCMPTDE9Y1pDL/dirs
X-Received: by 2002:a17:90b:3c92:b0:365:a5f6:4a5c with SMTP id 98e67ed59e1d1-36c4ff2c8c0mr10880173a91.1.1780329994484;
        Mon, 01 Jun 2026 09:06:34 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9205ddasm64218a91.14.2026.06.01.09.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:06:33 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 21:36:02 +0530
Message-ID: <20260601160603.167706-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601160603.167706-1-hrushirajg23@gmail.com>
References: <20260601160603.167706-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

