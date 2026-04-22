Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81439347FFE;
	Wed, 22 Apr 2026 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892105; cv=none; b=AJmkzl1exxcLk3VbFEJcgSvHgCFJaMG3rZlm0CdurIBgjuAeR8Y1Wjz0EFJXvPYFNs+zWE8VyZsHud9TSTAj8xsveIdu8l3X7s1qjOhDsOeQS2j3ger2NyIA/yT67GKF7fgBTjb1qyhB6HKhAAtyfZPpTsbM4N3uDfmF+cWrZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892105; c=relaxed/simple;
	bh=opajQm6udq6m/migfOwFNPme8+VZx90YleJev5vmE0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEd5+nFJMuYzU+EzCw7PBX2jTghaENnNEBvKJ7hFCZuybbASd8T1vO6lceSLxr2tcj6ZUhVeoOpUE3f/Vx8FHbgEBn2lZvaC/AVAzttGPlnJIoN4tuG0dQvGfmGknHcD1AHxOLWOmRHWXiqMewf7z2Xt/2aZSnk2oSs9IqWmKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=diigRvAL; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="diigRvAL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EE99114B33;
	Wed, 22 Apr 2026 23:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1776892101; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=t6Lu79H5Cv29UG2GxLMMRQLK0gy9NI9/AQURP2Ocdd0=;
	b=diigRvALxdDTtYxjBj/87TLJ0QTEabZT+UnirpBJJgy2fWOuzeiZkfAVWmT5BlCRHWilfB
	ZffiVVMLJO1Ws/BQL2k9LNskKNDUHU7BxSU9FnZl/KC0RqUnxR7Oyr3lC9WLSuj2GZiewV
	jHqaWN975RtAlEIhJVXCuxDcIhgntGkrn//ZR/8esYl5lHX4myxMLVxYvoWxCWY5l8CW4z
	b8ekMq9GHWd+UvjqBvPmwWkHASBZSN0EDvXTJc1V2MvLBF95H49JeswEJQ83u1pPj3VAdb
	mpM9+hEtjWy19xo6orbS9kI5CNH688eu3NcRuGOiHrUfYDieEf+Xq3agtBUDdA==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: display: simple: Document Displaytech DT050BTFT-PTS panel
Date: Wed, 22 Apr 2026 23:07:24 +0200
Message-ID: <20260422210806.80948-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422210806.80948-1-marex@nabladev.com>
References: <20260422210806.80948-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document the Displaytech DT050BTFT-PTS 5.0" (800x480) color TFT LCD
panel, connected over DPI. The datasheet from 16 Nov 2023 is available
from Seacomp:

https://www.seacomp.com/sites/default/files/datasheets/DT050BTFT-Displaytech-Spec.pdf

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "Kael D'Alcamo" <dev@kael-k.io>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3e41ed0ef5d51..9c2faeb47b812 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -97,6 +97,8 @@ properties:
       - dataimage,fg1001l0dsswmg01
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
+        # Displaytech DT050BTFT-PTS 5.0" 800x480 TFT LCD Panel
+      - displaytech,dt050btft-pts
         # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
       - dlc,dlc1010gig
         # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
-- 
2.53.0

