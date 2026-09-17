Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D04EB84A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659714; cv=none; b=jorm3PsnOEMJOjy4NiYN849cxgC3vp6WJxGYBT7uMOhj4lQ7GOp+b3WFoewt85dIQIOBk8op31iIQwrk3zUI8kgrRmDp42Eo4yV4T1K+QCiUezwi65YioFMPoL+EuXxSifwee2X4WdWCppm012pu05kGHcrhpU2UU4Q+7R3ke+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659714; c=relaxed/simple;
	bh=iOmCO9NxqyQ+5yWQl+Ovx/mmtM/mWQRsYwhnpKqkdrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHGDab437K3+nMBzUpkG8NMtUBKpM59srcxkTvagdcHxWcj9RHJ1hfLaJVlimSQ5R36oeQwGoJQRtwa9gehA9PsL+kAql5mztg9kLzSG9hFMGdHbpOqr74v9VybJXz29iHXgBzYEzv3oIAnpdDMx6AbRqBWruL7lmjlGX0+k/3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB5PZSXO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB5PZSXO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e620fa473so6133435e9.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=fB5PZSXOVhzFJIq/JkG6bgcXsNbWOp52mWMlR+T9sNrJ4pjqvRSqm54BcbZpnZXdu5
         64bftU4KtKF16lDfPXn5ZBnUwXlLQQRNQuvBXCMSUVHeQJNVcDfTXy93qBRc8wPuVNj0
         f06cHdZdgIHT/Qv8+Sicdy86gOsuhIoRBKT5nn+n0dtcE0ulEANSSahco7nfMFVA7UeN
         9MfqutKJ+UvBEAXdHO6G+fsiV4lpebV2dfbwhiaJ6H6u4UzA3UMCjKuK2LWbhbu/Gmik
         6B4d5xDM6xYfVWtSOTk9QayAh7uuK3q9DWMpuoBb1cY3h1HAOSsN2FwWCDnL1ZwOei7h
         WKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=SqKFz+QHhSBYf2Iu1tRwhq0QpyB1If7pilB1D/0R2bsXGYxtuX88dE2wlXZAH0tLM3
         +066Q85JycBNFKIxA6rsgrjaG0S1Q2w5k3xpQiye3dXud2JqsyODkGqDrw/EDW2MGSsM
         a0ww/+3E5DwrSorHRwpZQsyk7XcOkbIpW1o7Z8QLX5TI1eVRkDpPjFykUCUmF6Z7baO7
         vIg9TYJGL+BirMrWXFfdFoCrF1GUldHky6Ek9yspGm7S7gOBRKdftnF9TJkOwEJQ/DyG
         W1PonlNJzeifSK+3toR5yjaHE9D4yyNqe9wZqQDuxlh3iKlMRdXU6HIrv7684jM2uoDE
         sV9w==
X-Forwarded-Encrypted: i=1; AKwUvBwq8JDoRinhMoqtHvFvFMjUFrb1qkUIX5aS0SFZE8FS3ZJWRw83fGG8m48rP/zfXPViy5vQu2IJQDrz@vger.kernel.org
X-Gm-Message-State: AFuF++kZ3cJ0cEiYOgRDoVjqDCJhEsUfX51Q3AajoFnztrL0LZ0mnCrg
	r+BC1NiaUeXAFgjeDUmV7JezA1/aX9AYCvQ6mYFZd5NLbMLZHII//2CC
X-Gm-Gg: AYBFou3JxMnTHIkU7f9R1l2Ad55M95GFhpeM+w0kQKbih4h2brXhe/idjWI+mbkJ6/V
	ZE6Ybfyzt6GP96GUNsMqS0l8qjI3cIK0I/bmQNzQSWbpX88UDZ0N20+fcDzLzGgt6gX1+eYwsYe
	UOS74AGM7ipnO+Gj58VxxdrktYeUc8iTAIMo/E2m0hCJpgk31VBFpPRyxOoYI73Q/xUUBsGDEhG
	7uRj6QCC1ISFI/rbeevWvznFmwRFpJ8LEoz+pirwsYaNUQgD0kPMs7DLW04J1SUfxNstc706A+2
	iWWHNsb88AxxNHUc3cr1wtSbLRzqCu9PbFzrIpR7kUFVJSDUh6/vvSkeWrsA9qc0bzGzDt338te
	C0VXKutkGYXpQ+Df+w4JgSO/UDu1lp/LAumhf9nUfZZ4o8zRmRmHlyDAt0HsU+PnM/7m4hS4sPI
	sblrelLNtEX1TuTu/q6jY1fa+QKtTZQ9jFl1c5/WYnNJ9JAkL52KmnhQw2TVHnvOAymaCqVlx34
	H7HTIfk7dLag759wPrpwo3WiomLFeErBGkk75iDAmfSK53IqGysVo1LChz6Rtp1EcQbjVZzkk8t
	ln50s58Ldyd96CUv5JgnBg==
X-Received: by 2002:a05:600c:1f87:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49eb732350cmr85671685e9.21.1789659703973;
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:41:30 +0200
Message-ID: <c13d304b5eb9a82717d192aed0d81ffef5573aa9.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 953950e55bf9..4d6a79bbb132 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3

