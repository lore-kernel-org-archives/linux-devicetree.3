Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645339DBD7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419310; cv=none; b=b3bG8OWSjhrpY7Z7m0ehJYhwPggDCOKZmbpA7Cxav7atsN2S/7HST7elUmBVKFS979yF64jxSvtTnqpGAM3dGC4lmGNyRVrTj3k74cdb4Z0v/2S+mfn6upAFaheiWv5rRjQyb22v9nEs9s1BmYnrjNkEQ552aIBg9+ewwH9JqaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419310; c=relaxed/simple;
	bh=PPhvql50jCpxhlBmGGb0EOWK/emzUgxfX2PzPXRGo2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTmI85aFDc/0qxXXaRJ9jMoAVvhZW/C/WZAu9KWElsQtrsv97NS3g/pwDL0wKRURZRuyuW7Nr+Tda3Rh2RRcG3NsLVvEj2F1TgBVcEre9ktr9FgpsOH92PEE02evII+564lxMsq4Sf7uA4vE2ubiPOQfEMQBpI3+DDBNeSnQ4yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FL4vgDI6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FL4vgDI6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1209888a12.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785419308; x=1786024108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUyxSz5c3/MDQCOI75162kYwAQ50MisZs/s81C016VE=;
        b=FL4vgDI6cxdTOjmMT+sU4QefX3P32Q+0ibaf7fzcdkkcvxkaRBsiY2wXACozsLnULZ
         y37VaQDDykop/cfAKXFCuzyftQ9MXAU25IOe+zVMVDs/Jl46K7WCiCglMgUp95unMAdk
         kaiVw04T1wYNveXhtDSDYWt6qGNStvUFWCTybKeOCFSY4fqhcw0vEATQNYDPJSUrZdeP
         /1tWkEbyQMl9Na2kdiUTRVZd11AyHIxh/vldazEmiZ6gEpafp20zXN/ZEvGhx3+p5j4b
         kiU8liy0GVJYRUcBs9CIwssv34UY/1BckZvP8RUOR/hx9BFueeHEK1YIjLsyuAtKp0ag
         8elA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419308; x=1786024108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUyxSz5c3/MDQCOI75162kYwAQ50MisZs/s81C016VE=;
        b=A1/QWBXukBu7O1nXu7FmeQs4ysvUuDG6hGlIQvy0dN1Z3tH9btuMzbA8Ovezrjcgn7
         oT/2J3rYr8s1eS4CQShbHldruL8fGoha+mhyi4hsykdshOsEhwT1771kmwO5nuBtexAN
         Eq9p9++ixndjW2GM6w2A0fSpADGVxvK+YW4bse7cM9hjSbyWEj0dP1sGff58X5/S/Cm2
         vvHo9J534XISEN1Ims00mzTDIuCURiXpnmkm11kFSKpTpuJoOU7MBA4gMRKGVSnGJ7ju
         04xBFSTkYKMo1auQ0ys1e/j7Alig+feTyxbEogfNP6hdKaut2cK+K17EJh2pfsgBc0vQ
         q2uQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQDvCVZN+rsmXpmdGQb3cfVgWfdUYcQJXu2kPqmIIy9NpYYVJpYBII4nqIRxtWQ0t7bGOSyQc59J5w@vger.kernel.org
X-Gm-Message-State: AOJu0YyNL+0Mg6RYbGKSz9f48oA4qxp3QCLlcRE8elL5veHWOdbTD2hZ
	x3f2aOjXX4VzHCT4MgAhs4hn0p+nHUkQRqi4mdE7FpF0y523MAPyAlun
X-Gm-Gg: AR+sD12Lo8lUp9tiFnb9uI4JaPDjQpDeGk5LE5Cn+gM4lrXTIYisgaeeHSHruYTPhpk
	65tLLPZQnHRtJQ/55M1Q1RzEoHgPtfaG96MTGCbecZBgT2K2h2+ga3bDHdDZ0rbxeCf7/sByv6X
	JVFdEPgDpCDa98qZ+VMR/4QX259E6Z/UtjWyNvtZqERfrI8sBRTBgz5zhP8S/5xHEY0ldDTelW2
	RNYPJ+eIvFCbFbn63njtvx8QHFKQqFztbtVy+/FSorlcywWbdHotZX2ndzlVBaHapq9gL8v+810
	Tx71DJi074TXKT14+pS6FNcmwLuwflo8pPQe9H96zE/pRqHPDnArmNcY+TxRxW9ViMAYrzlUUmU
	I5gQmtgDzomPZMqrtdSxLBwc0OE6AP3K7zS/OnNb3a78CpYRZr1y+GCohTH5J3HHSIZNr6iREx6
	TzpyFrgDfzBchWe1Z/k123kNVPLLEdiq3upUbOLqb3DsaEz8KpqGoQm4RIRPCiPQN1hxl6
X-Received: by 2002:a05:6a20:918b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c900705785mr2618493637.27.1785419308313;
        Thu, 30 Jul 2026 06:48:28 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b670dcsm20692047eec.7.2026.07.30.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:48:27 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
Date: Thu, 30 Jul 2026 19:18:14 +0530
Message-ID: <20260730134815.434654-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730134815.434654-1-hrushirajg23@gmail.com>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the Vicharak Axon Lite, an RK3576-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..4e80b594f42f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon Lite
+        items:
+          - const: vicharak,axon-lite
+          - const: rockchip,rk3576
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

