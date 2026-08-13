Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C2F481658
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629968; cv=none; b=qr3/YrDp7JbcM2T9aM16OAQgiEbvskJsU9yAw8rwXsN45CAd5s3JMw/1RLfGNIbZzr+6C+SyAMq8d3TC3czP/mnJTPkmE1T4L2lR/0hcNgsP3zQmdLawVFXPTr+lLJyk7hYYq6Ql6bkf8UMeHYlqj0zbhC1VE+xX3qfY2jjCYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629968; c=relaxed/simple;
	bh=ZQgiNiqYgsBrWLZgSSsY8QzFfXicVpacPgeKKriczcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwCBcJpTjVjdSD9wDmYRHtYaCespkW+H1F2Uv0UOKLggzGfmztcdYCCEL3uS319OlNY5APwLqRR/xVn6qB2GtI7FG+wzfS/UNnC7zaQ5M8TKGHyu80m+4G9tZbMRRCewO9gveoT0xd659mB80yiIflDUOijZDJpO/R5Rg8p7+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hrbtl/FD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hrbtl/FD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1039716f8f.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629965; x=1787234765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=Hrbtl/FDnaNkGhB9I+sXjCXlhG3ejw9NAcP2GObgX2vph1y+/HGD9eAaS06/EJj4oS
         1d4hUT7Wmh43j9nrTZ7ECgSDUTt3fmY2acPuDIijkT0miap4zg5p7jhV3dF2u0DFmN7C
         RyqdJmfSATf+AQuIpn0y5Drd0Utgs7s9VK5W31Yu3qnAvPltPv7biAoh+883ODwHstzX
         6+bhqG65wlgHDLGYitFrOs6I9tVktSRRzObK84RDEMHP1pbRiA0xljnvFCs9uSZVnxC5
         fJUjeUpWVV95S7bH14eKQuYaswKw6/lIYOfFQUeuOBwGNvHURkJrJDQIf1fqRj+lYKxD
         3ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629965; x=1787234765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=K9+kkD0NOtBXpJllHIKhJLBImRDaZKaVR5IXGD/iAjeVWT8lIJ4Qp2PQgiNlvklt7f
         76adYiQxSBKZ/I4RiXJGIy66RSrtoWwMcv/7QwEIc3q0AAh+jtPKP8IGulfYv0ZmjjaK
         88c5pBqaluIWH5PKTqNnfdwA/eUmEeKSeL0aZgg0d5tlPD7CeATMSpFzG38KUmNAwmDY
         cvH4RAQ/la+6HdIEMGsYp2KdIIc74oTfo4b9BnO0uYHweJ1XrGKsAqmb82jR5NlU9YHq
         IrZGPs8EKjFcRGoqS93waP/RTIeyaNLbzUs8IKC+kr/6Jc/XI72v/Eex3ReJhxrR+TdO
         MDIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Vr25ZrLi3691jW1GBmuJTgxDC9D+AKkQPo6d8/UmfX3UM1Ij2xdVTnSpdZKB+/gBKGOm5YRrwWQW@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0vJMBKQPSmiLh2vcamcJnAShlngVMeijt1TJWkdFN8UtHzKx
	m7ZAiC4KOPvjoaJ/GnZQLerRoHAA2NtmBdZCBdFsrh/e4aRuiAz73+nX
X-Gm-Gg: AR+sD12sxxOaPCKhsXxRysyfW/wus3Zlv6+dleWLstR6IFsT6NSaYfvUGpquk1bR/GE
	DS1pEe7i3m7zu43klxwBtXBmeXL2RrkvGoIRz26OUNag2MOcxTaMPMntYSSLCXA8ePdjKAgA8tE
	aUdSCg3KmQZ1e1CcmpkmcW+dpS+HR+XDCs9AxbncNHuU8n6C347QZAk2NZQQpL9JxTlswZeS+Za
	yf6Ltd6mKFvn0QfadNFfXAE3G4MHK14zzJoOUM50EQJ2P3iXfGitesIUqOSOAiM3lhcLd4Csmeq
	IKoT06o5HF+VBDwG2sbQwMtWho2tOhwP1h0pZA9wzA7rtcl/oRn0Yq08SikOM/qTQn8SUGs7H7R
	gVKmBg1bdbFUToORBs4SiG4m3uluTdtTr0PQUyADAqk4jgc2JSV2GafOgUWjElmJrbHURNeQV6A
	C3DLWf534Q1Y44pRQQYZmIT3LzHMt4eqC09IE9zCYrMarz9ycAT7uzxO/ocJQPCX1q0PVFtbZMZ
	SPK
X-Received: by 2002:a05:6000:430d:b0:481:568e:d6ed with SMTP id ffacd0b85a97d-48159ee5201mr8885423f8f.15.1786629964824;
        Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Thu, 13 Aug 2026 16:05:59 +0200
Message-ID: <20260813140600.1824949-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0

