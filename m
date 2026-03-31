Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F6C3A5E65
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958991; cv=none; b=NG00qAQQrvZLVrDKkivvV6Ta6jh/UXYTQ6KGnZVt5CwfAaCh1hPVuM+rm6mEQi3cX2+tP0i7Jc4C4DeYWYviTH36lqMPMK0WeHga3IkbfmLAoI7zBYx02P53jEAlMo+EbIwmn5/UdPHt5V9ZyUUQY6tOttV7X/ySgMnN/8m1vM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958991; c=relaxed/simple;
	bh=0ze6s62GoWXJwedORq0Ck2i8s/n/lLU7Kn7pTb1PCSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjobzb914UMnPRqbWLaVGMFztScYZC6WfFyHu7FDwXwlCtphRV1fvMjOK35DxBL/fFnbqOzCmKNgm4lCo0hVaaQiE0QSnRubkT9Ggsn0pCWwDcjjrHJ8uMRh4CDxWMzGW3Rxm63+tKr+QS6tooxM60ZMcd4EV7WwDe5QjTj6FgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6SBti1Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6SBti1Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aae146b604so33216975ad.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774958989; x=1775563789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJsN9xOorEStaNzhqVyskGIBPrVNwL+4GmqbmijKTAk=;
        b=g6SBti1Zbx41AUZ4zD1F1mn9v1H+IGlz3gHMaZKAFiHjBRPMQAbeqjEcMLrYx82lke
         vjnYRzJ5CO3r4nq/ILd+jCYwfEqaQMGc+KJ/yXETAmiuRd9CP+B6nuCwx8EnVKHL5dKk
         uArnOeZLPSiGvDJaoK9dTtIAUJBM1v1JyII6SGfe0jed5UxmEADSWgU0MwJ6o9lNdofz
         WlhwTiL7WrHtbJWyYpxV+00uX0FiAcpRxaVleN/vaF6uqM5vAzl41w6gMrHIygHoE1Or
         b94soWnLRlbapWHc38uh7KMjyXVRwC/Lt74FNj/d+v+GYNDI68tD48D4zMkAvpBn78nQ
         008g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958989; x=1775563789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJsN9xOorEStaNzhqVyskGIBPrVNwL+4GmqbmijKTAk=;
        b=mTcg0wu4KGVzilHsREbXv4Vpg7FRiwqq4WJRw3wxVeG0RFWXnzzuoQU+A2uPfZdr8h
         Jz7sYIM5LMGyHx2Jp6mbb9RFoIL0fGkGhQfGyA4VWyxJKp9NfT/BxxAsXBA3QDwPlB2E
         N+7nrpHYPWHcJf1JWIn5I0fy9k5Lj8TI+gf+wk2BYBOhPqsUHMMpiwNjZYl5OLppdlQe
         5r6chaE1Cluwscz5WI7pDEmpiRO/uLkTRrc9vhLFTjZcoQ+oNPfkFWpmk22l2SBPu/ij
         yfhJkz41QGv4/dl4XJVNkB2v+tpRi9H65KkjQKSeb55eF1jptRaEvIbIzLMIikN2psh+
         gdow==
X-Forwarded-Encrypted: i=1; AJvYcCWXEzfWVtynynoGU7OQEMU0Ayjc0btC6BbJ1ZJnzq1B0FmXRGP5e05bCym66i3n/Mkdm0w1fcCcVL54@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8z2EWE8sWfvumLq9M4dfrgWZWw1NVfaQb2fLlK1d0B9auhBs
	Nx+A8XXWAhSqOZ5W76Tgo4iGrJHi74TQrRY/nVRt8ZDNsJUy+2CFzUgJ
X-Gm-Gg: ATEYQzxqXa9FGHGKpGlF4f6TKHLUeYoArvofFjVCZ6PS4Ne06yYdDmzc29sdcnd1lrK
	yvGRPV2fxALiAsXlC8siOAQdZOy1SiQ6uiOohtwh0WllQUDFeLJYQ8EnEhq8q93EhgnKrghTi3M
	YZCnXysUwVEldDTzndpk9ykbGke9hfJO17TbxsE05/OcwQJeGWHE/wr8V404Wok8SXeJcG0yOgV
	nLKrBlm/PtY/k7blFRGLrg4QZTFDf6qNJ8Uw3jTwZ7sLnE8tizVxijqDdoZylaXLQUChovEFIEq
	OpasFtaR0FHywsRT0mts/hzqpeNw7HddhQe8vJyu52HZrWIp1gAB+DpvYrK9tG3C+1NoU5vpsTk
	sh6Dix/eJLKVbdbysGCsjKQ1UsA/xVlNpibccsj1zeryItA7hyn4sjXpRzuFBbp9ze/+IB+VaMo
	bUJLkYHWEwR8IBGt/UHyZn3YWnzt1WMblVHf4RySzmWLT+zApVLCzxCWiy+/GtX5S3YpoiO824n
	mdCzIbOv8vW8bFaqtXuiw==
X-Received: by 2002:a17:902:e846:b0:2b2:490c:411e with SMTP id d9443c01a7336-2b2490c53c4mr108364095ad.6.1774958989240;
        Tue, 31 Mar 2026 05:09:49 -0700 (PDT)
Received: from bu9-daniel.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642c5asm109350915ad.7.2026.03.31.05.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:09:48 -0700 (PDT)
From: Daniel Hsu <d486250@gmail.com>
X-Google-Original-From: Daniel Hsu <Daniel-Hsu@quantatw.com>
To: andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Subject: [PATCH v2] ARM: dts: aspeed: yosemite5: Add MP5998 power monitor
Date: Tue, 31 Mar 2026 20:07:34 +0800
Message-ID: <20260331120734.39260-1-Daniel-Hsu@quantatw.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an MP5998 power monitor used to monitor the power consumption
of the Paddle_P12V_HSC rail on the Yosemite5 paddle board.

[v2]
- Describe the purpose of the power monitor
- Remove software/driver related description

Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6b..6287f80d70d9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -422,6 +422,11 @@ power-sensor@45 {
 		shunt-resistor = <1000>;
 	};
 
+	power-monitor@46 {
+		compatible = "mps,mp5998";
+		reg = <0x46>;
+	};
+
 	power-monitor@47 {
 		compatible = "ti,tps25990";
 		reg = <0x47>;
-- 
2.53.0

