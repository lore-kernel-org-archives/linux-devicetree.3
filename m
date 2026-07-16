Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6DA3590C3
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194164; cv=none; b=XS0hQNkvOU90/Rnomd8ZDiuYGcCk/cxLlQDLsld4s4g++E5l1AaLlDbMK8K0tVIfPDw6psYsNZP2IwKCevODI9zbKM6sJM1ZfaLugQVIL09+JQHZUjL4XRj+OH41WLpMoKNHcb+r5xGQJO9/zvBqHtXI3xd+34FdKQUXV438JKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194164; c=relaxed/simple;
	bh=0aEnkMJF34zHcSad9mJgGTJERjlHufLEtpJoRgmqTEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NScjJacHiA0YujyrLT8e2WDJxtQhzYuA3i1TYs6NB2C66MDTUeR8g5HgzjeU8AcxYReWAyulcGQkwaF+th6S0qXVc9VZ0eA6avgpm7RHlL9gBmWplabhMxm4wFAfBy7BrNlfIy9Ccr1iaDJUIgW+TAjHxfklOaGzGn1nzCqQiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBFRtOMb; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBFRtOMb"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e8fa1b8d6so55775187b3.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194162; x=1784798962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=WBFRtOMbXMJxXLcKNMb++l53tlpruZYscOwOaikPiaRqakxsN+tXO60YfdlzRNsj5T
         2WzYTWN2QZDoB62EEG7aGmI4GE1cD6rp54XBWVZ26y9PirpPR6iLL7WT1B4qGftyATAu
         ZDbXRY0IfolKNk05hLN9eA6ZIfhQw0SZx/5BIkmHEh8yKwWGWP8nlDryblpsd8DJd96t
         HACdHX67pp/pO3/CLcDjwqWXWoRdSL9S+2Drpfv+7ysJ2due8YobTNfaNj+L/Xc5c3hT
         fTjRfjKKIIKWcr9xPENVv5MXTQmM9WQhG2VQJqLOSrncEwz3S7cG74mRY8zbI5PY+SpD
         6K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194162; x=1784798962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=kzcQWuDvWJM+SvzNoJRFTHHDwEt9B/EXj9+Y3xJPnuCouxi7TDCmyQ30U4Aey15wQJ
         o7SODdxKXCNdMct+NWDttaHil5JGx9tpnsg49A6bBD9ZY9fntnp9OoUWT/3WMlQActOG
         VeIhjfHcPV33jXxV0JXAo9pmjjEUOcQF4yDDN0knueAo7hGYln8b9YjLI6OGFp1+vT/X
         t9A3tJl513JpKl9hFSe1WhAzw7Yje5/CvGvmwQ/1Sxx3+NccQLGPeiAo1L0SK2qKKjUQ
         zU99IkjEy6gAHf6x69ZmZUBbblhhJvH+e9/8NWzLoozRJc/gspfykZXG46R+7n33DUCb
         OXVQ==
X-Gm-Message-State: AOJu0YzeL7+QbyUc2SQMqCjUZi/OUhwrT6DpaZhYEwPcpUmd349ypt9q
	2KKIBW80lXd3Y/JEj9Q2TOz69uyCzZJ8kLPlBEcrjqE4i5CPUDa4P/IU
X-Gm-Gg: AfdE7cmDLkXwCr8HIJ8kMVYwN+Gp4987IOnDBbPr6stuq0Hb9EmaO6ZMV8zgPMiJm1J
	WcEjBdH3+u11wtRzbdhBMxrb99IkARv+yO04rHLce/QlMZqaroZRjZdFdK02QdGy3xCZR+GE6el
	JrvKOEzMD2rHIc/q2cMm+dhifwBOqIR5vrTnGwOIu0hxqYCcH5kYzXf9IQ08vh2lb9nXkNIz367
	3yNbjRs5AF/EIrOgEVzgjLzp3sydQgmapoVJfuQBpU+TLoXqL496nTMjy25ml9zU7fNWfCBBJ/T
	49ZFMVRnBOzB01caWxp8xBfgwoKl9V1S0RInnrAejI+AT6/FFrVFQgy/OV+tYRTH/maiTCUV80i
	HirmclfgS0r2vucX1CE/G+qb4aSbNFIqk/XwgGO5ql09QaHom9WhwNrApqCGlh5fqgJq6YW2Fch
	8lj+L21juRbw==
X-Received: by 2002:a05:690c:a87:b0:81e:528d:3625 with SMTP id 00721157ae682-81ebfd85389mr75472897b3.24.1784194162195;
        Thu, 16 Jul 2026 02:29:22 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e950567eesm130241807b3.13.2026.07.16.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:29:21 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Date: Thu, 16 Jul 2026 14:58:58 +0530
Message-ID: <20260716092859.512306-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716092859.512306-1-hrushirajg23@gmail.com>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the Vicharak Vaaman, an RK3399-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..7cfd3687768c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman
+        items:
+          - const: vicharak,vaaman
+          - const: rockchip,rk3399
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

