Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62F93F39EE
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833945; cv=none; b=Grb2u8Az6mo38Xwe6lYjvGq3ByQJi//gPISEcOvTRgKdYNtx7nntOPhaggjmLtRAVPsS3PwoytVv1qidLbUpU+w1aoSE4EIZc0P5jkkxwSpKvEb5XrcQQyOtwvLU3Wpy98wYcm58LiI7JJPNZOKpYmoQhMHPeXP/dorPycqkI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833945; c=relaxed/simple;
	bh=3c9edpSzno4OMtvZB2RDwVkVwrrxXXtrkSKQjP7QClk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaPGZsHsREk5EkocSsc5ZQpk4Bt4fSqencJTTKYpQbdPVdx4hXbM2PWqHXrdrXz99o6MkkKq582pcsUog8ZRcguXnPKWAwhWeaN/9C31PNCuwBZFWMikyxrPwFlakMINGmeiR2znsrzz6zP0OO1AiGEdzJEJT+iWwoxwEAolXa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csMV44mk; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csMV44mk"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so553359b3a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833942; x=1783438742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfmIKm5rHIJIAW9GcZYFiHLu+bo2uk/pPVU4wB7S6jA=;
        b=csMV44mknalpdKC4t6bLvmHFBl94MQmvQpCe/tEzIxziSsrJeVHd1Z5Nsp7ve4yYwO
         t5EVJOfU+QBDGwG0NEvsAf/2v0i8pWeDRNR33e8FUJ5jD3yTpuvEcWpem4Oe0K3YB1FX
         dbuU3laSRnsgIKW0GuenBTbMyjJFq59MYVNrDsj4R40kMiEp9QggK4hIXLjG7pKCZaj2
         OyqLU6SRRjn9AR0PSXDOiYNxhPLjPmnOmTKsWgHympgGvqqkhBtECRfqQiKeI70SUabO
         diFCJRijdLnNApwwCabHcNL6l4jWVqsQpSKUlmrM55OjYpE9czVNGK60v95+4Ml0kA9i
         NQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833942; x=1783438742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfmIKm5rHIJIAW9GcZYFiHLu+bo2uk/pPVU4wB7S6jA=;
        b=FcdgLG/rdxLL+SnKHurHbcm+I3349XhLa4qnQ0vykjN9UN6Vc9heL9Wbc1k7c5rSr0
         Q/nr+jmlIcXYFsW0wjkSeAoT8N33BfucSMNElBuN+0QwxycL2daGfAAHkLz2l5QBxuBC
         72C2Iqlm2qaePBUg8H11PeUJZKpLA5/imTLR4YornjhYdzoHsHpzA1yhuvVkwi7Da0IM
         qcfjWr1ITZ1MAl0vP1bx25qEINGnWngGL+V2D768tnR6HRwZSr3xsI926/55uAOIQDST
         TfCoD0ogenh4d4/5KvMEvCIMcfi6b9D/tcH4i/7ZiX5AmbOVBv5goqJlzQZYxyh369/E
         rB0A==
X-Gm-Message-State: AOJu0Yz+MrlZv55c8sYfD/TGzZM9j2pcx+X+8ci1TKdofq/ycw455nGN
	M+UoOA9WyIkGA1yGqI830Uf/8FQWGPw2Yhl5DfFFn24lUl9PmE4OSspz
X-Gm-Gg: AfdE7cnwq20TnPwSkQbC4dQ/Wx9CSygt5eyhRIjFVRA5ivK3RTtLHrEsplkBYuGSy0/
	WB44O+tHg/Evx2ePP9RpPGieW8YsGwIOjfLwQNNyBBQXhz5ri5xs2t5h/4Evho8xXLJQuGNnvgI
	mY6HPdOa50tMLVVZ3vB9b++iSYnrEkyFggHt8PTGlF3ACL6tiPriGl3bnwaWCantIB9+tm6tWbo
	ygVxZUtJORq4PbUWp+C/Fwpn1LMeGNDnFrcomoSNB/04O6YFBciUfQkH/4dBtYKoPxX2vDNy/vi
	pegJTj93WYVJTctQOksS6CZOKBaWRZqGhnt5LRsMxyPlb5QQTeEfn2z0c0c6v3tDgNHk1x57NLU
	ktfkXhFztlxRchBh0jdTiNdvMeTpmSNb/3cIpuH8Tnd8kGSTIlAKUGwx7j3qYDPbJ6TSzaxrTht
	rlIiLeXKI7hUc=
X-Received: by 2002:a05:6a00:f8b:b0:847:9223:9726 with SMTP id d2e1a72fcca58-847a82d9976mr1775094b3a.18.1782833942073;
        Tue, 30 Jun 2026 08:39:02 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm2413695b3a.60.2026.06.30.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:39:01 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Tue, 30 Jun 2026 23:38:11 +0800
Message-ID: <20260630153810.3574714-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630153810.3574714-2-coiaprant@gmail.com>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Graperain G3568 v2
 which is a development board based on RK3568 SoC.

This series also have an SBC series with the suffix "box".

This board is development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3

