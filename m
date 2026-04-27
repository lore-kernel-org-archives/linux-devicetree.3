Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92E34E754
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304827; cv=none; b=GE7JgueRKxlapRuQPKk7vDx/wfxss8CSiasLXOztFieenwBmsK+7eHkMrzIelu4q0pIEEnZa+ejZnGrkE57fXaM0MDbxgENQt1UoPVaLwXvDQE+FiuwjfiZGPE6bp2imemCRP3S97X78nqJSxQJL4TiOTvuGDkyBcSogtYLNpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304827; c=relaxed/simple;
	bh=DZkH2s9DxboY02/rZB68aD2kBB1YKCmT2r/yM/j/b98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUX4HyxJ7dyfvyvVZClvaCxypeLY16O+yCvokfvI/Kh+Rb2SgoTAaiQtwPbLCE/yupadBa5F2snEVvdLcvDBEodM1f8AiGaYfS7iu+ZrR+d++z9XsJzm4yBzh0IRVFJotciz6a4s+Q/MElzNtqL61EnB0NORwtWP64oVF2o2I8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9/4GEtU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9/4GEtU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43eb05b1875so6105937f8f.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777304824; x=1777909624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAfTMxnj/6IMVjfTHuWc/Km6sx3eQW0UAcM2xEXbSOk=;
        b=d9/4GEtUlO5ipRao3bBbCIyBo8SQUzDOZkFWTZ1BmrADR78cnolLAiODIIm1NsXK3w
         bWreeVUb0r4s3pL4T33bwFhh9g7aTWTvLXhvNHVEPwX4g7u2wbN4Xf9ea51AlZgQNeF8
         ktOGAWpn9mq5JUUcFV0nLVrShQKLOoEwtRp10wv0bTEl+4kULggIQMq9yyqJUuHIHYbR
         5/i6k/QddnujZDR6zZBDOTah4BLyFfUR/mZm0OQ0RWu//EzjEKVTrUuuDDVoyBGDVBRy
         TsiyvuPk7Fjdr3dGEtfg7pgGF6+vG9jB3fy1bjdN2DCcYN3J6Y0z7cnx/wR4M27lmF+s
         4giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304824; x=1777909624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAfTMxnj/6IMVjfTHuWc/Km6sx3eQW0UAcM2xEXbSOk=;
        b=mQOcrc03JVUqhhb77E0fWVjMD5BTNIEfjPFawnOdRHOjSFQor7ojeGgaN9oqp4t0Hb
         hEISLDzaylDpgXCrWK4t8FKVhdzlql1eVkwQecDHzqSaeMpLbsxVGYekvOlcx/PfG9AM
         Y84dg1SbwVj/aq7NfSITkXy4REh0J0v4Yss2WEAA7DhDDvvWnsnowOL7P0lvrI+91lB7
         Hs0XX35OiUuZtEHdUEwO0QmVSQiBRFoV9zVRzRrZ+YAKwDvThqHYLH9B7MfKufUh+2/1
         ryqpqaYLS/KqkGZf7N8Z7CyoW6sUDGnr55AKGRfjXR2UaiyLVqMkINMhWR7EYruv3xmB
         VrPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K7mehIRDRcY6FhxPuvHpZkupLvID3L89jGjDAYSeHITzel0c620p5yAKcr8P65jtXQCWy8jAnWd0g@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDMdbA9QnerqEQZUv6PhwGxlhAmcyjXiV/Ck+M8SYL/tABxla
	7PEinsNDrm49pxndZGeTAQWY9y50pIEEIuJ57dgzetb5s6sO88nROJgW
X-Gm-Gg: AeBDievnT07TjH6ScaQEpCOK3SBHc8tq+jOzq83NzatPfDeznV+iAi/Aw9qZDFref7B
	amrhXgMbcZckgSlbJ0krjERVFVC+GIm7GKIdrcKPM4GZEnx6l4FIwWkLsTLHvYlmZftBXMknMsu
	aeiqeiWAaINU6hc7NN/zr4I/QG4goAIM8BwpK6kc+pcKlRtS8dx5XGRKvwywcsEwrfiIF4M7Y3d
	X6Ez9X9rIEtRPkwCGcMZiViAj9qS4DpfkjFIoZJB2AyyyEb6bQrkbq34fWykaFlSUzCK2Wf7yal
	Dbd/ot5TIxcikt7yuhkS6fSPNdzrhIBsRtiSf13vep6W3Pxa4MVnjllx9L5TRKJX6s+VjdOnxoI
	3z03kkQg6HZKWOwa5UuE/YfbbHMD5nIvDPTDbNfM6xn434l0Z7f1WJgln7+RB2sMH4gUnLuudjb
	kJ8Ndl07cODvtkOPXe3O+moHhTkMjDNXO9bKSkoEBDz8E7Vk23YvSfchWqyTeocKWihOQUYxpR7
	4F0XNFpsezlbLxIz/TresDLcjQ2cQkf//Y2noycqXUQnEGP
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4411c18f7c5mr47093562f8f.37.1777304823718;
        Mon, 27 Apr 2026 08:47:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4dc24cfsm80537830f8f.16.2026.04.27.08.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:47:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: display/msm: Fix typo in clock-names property
Date: Mon, 27 Apr 2026 16:46:58 +0100
Message-ID: <20260427154658.276737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix the typo "clocks-names" to "clock-names" in the allOf/if conditional
blocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, patch applies on top of next-20260427.
---
 .../devicetree/bindings/display/msm/dp-controller.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8239adb7f7d3..43ebd053f98c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -243,7 +243,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
-        clocks-names:
+        clock-names:
           minItems: 5
           maxItems: 5
 
@@ -264,7 +264,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 5
           maxItems: 6
 
@@ -286,7 +286,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 6
           maxItems: 6
 
@@ -306,7 +306,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 8
-        clocks-names:
+        clock-names:
           minItems: 6
           maxItems: 8
 
@@ -326,7 +326,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 5
           maxItems: 6
 
-- 
2.54.0

