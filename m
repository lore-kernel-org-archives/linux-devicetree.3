Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EF244687
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782601143; cv=none; b=nmq/iKTC5RRubM3QJtl9cXJtWAHIq0NeUjRIejova1NObXeNuRIZW1FA0I67sD4DPUGJo1/pIhl+doWHABKFqkuaxwdWAKQyzXQNrPRgvSoo/9eu8CrUc/hbAW+J7QyP6TF6KmChaQMBM/9kAJxGvuxemr7WuGJT6b0SxEy8Mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782601143; c=relaxed/simple;
	bh=gh/6srbp3Zda/1QBjBcnH8BkhZviRHqZeWkCGqL2g8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4KMOYcFt+HulUzr76Vx2Y9OklYZXOXMw1CgJ3ph8jcbpPTGf/o9gUX3GZzpcXeR2oAB0pkr7ewkLPXdHAqRrJgnbAw8/v8r37ZWd2XWkIkPx2BnwSYPzS1OL5y1fygB057I22YbFk3EJbtEij087ZR/Lr6M5ODThv0vF9hRpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET/IDgEH; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET/IDgEH"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-37df416c45cso1007909a91.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 15:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782601140; x=1783205940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIQYg38HKX2hWoFak3/raun5oGJ1Q4Ta/HKT5+91FRc=;
        b=ET/IDgEH7LE3Gby6GrQTvA/CJY/Ee//l4J+RVn1ymT/fMFdSfOJb8Cp8yeyJ2BGLPs
         6ay1iYJQxu1SXbivfnxksH9But5bXKECW2x17cWf2vTBBZy0H+QhoftnXk3oQkqV6CBE
         hY/4z+B2uVthu1fijJ070MehifJNNxKOsS9gkI2uW0DUzr8d1C1DFlPZHgZud3IJ7tla
         hgICzeSgB0NEoSbsF4tEgrylrKgtox0CTD5oABL8BU5Ruu3fgA5U4cl10a8XxOTlxooc
         dXdY/4jw2o7+t/Cvm1336BIPSgpz3neUFFVyvPJN8PuM/rFqldNSbs7VBprVzPrEAX77
         S/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782601140; x=1783205940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xIQYg38HKX2hWoFak3/raun5oGJ1Q4Ta/HKT5+91FRc=;
        b=PtG5UVDeJYSy5nNj6IEHq6rUJ8eMj79RSx/vkXabra/AU9NJYrQnX0NTqiPJfLZcQe
         HtMHknOO6VdzlnIfAbJngXq8pjRBpGO2JMIvmX24MVpi4FJx1Th5asfCnwej0S9o5BQJ
         cUDZ0rs/Q4b2XdkNW7J3JBf/oh6fI64/FWYBkF+dJXqOiaSJjqMwz9kDJxUWSZ4jRzpT
         sjHQRDq9oaksS/TvHBnWDBhJgttfEr2x44JBKABaGfICb6SqG6VAxzPF3pHfIgBuCnKS
         WKFIBGLge5EXdf1skObt7LbciLxOrcGaQGw1ges/ynfrJJpqczrRjADJJ0WvnvRxiRAK
         XJGg==
X-Gm-Message-State: AOJu0Yx3xom64cZCamClmuWFjB7p4evw99+JSxIYlCl0j1t8JoYO8AWV
	68Xvez6Yh22aUEQgxj+xUFihNXZDOz/PUEZEE+2ny62z6SXQVx3b1iuy
X-Gm-Gg: AfdE7cks7hXjdOtcRtm/caUS477dKMJmdQSi1F6d29iFlgkTD+RCNaIqT7ALtlalBw9
	0jWOvllsNw1GchRbcsZqg3Iod8qpJEm/snamFtRtNkFa3wgqcdeKe18JYwr1tE+cUiDZpbnLbON
	rSZJcMrGD3Qy2sinomooe5QJJM/2EI4rwfchUzuWgisCSXdonDte7RdKGC8jMxB9jSyrLnLa9pI
	YMA2dUp9a4hyhYu8bQy/6BbMSEkbuV+AC7AzYUPZnLD/FW1jOiG+TJzB+FqgRI9UqirshjMEWyh
	mVcb+igefZJhZuoYY47qt5RI1fswRwaARSJrSZMMIbmrfU+KFj4wnYLTWfuS/A8pXkQVNub+Y87
	vxpEFZ7w/7nRgFxVv7QvVBu8InNHzdQHHTW4qu6MfR5143Wi7Pa9nXkEqSrDQKRO64c9jqP2IkN
	fRiLRHo93pziQ=
X-Received: by 2002:a17:90b:17c2:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-37df9f3821dmr11072345a91.3.1782601140142;
        Sat, 27 Jun 2026 15:59:00 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b0ee6esm6313693a91.6.2026.06.27.15.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 15:58:59 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Sun, 28 Jun 2026 06:57:56 +0800
Message-ID: <20260627225755.1710837-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627225755.1710837-2-coiaprant@gmail.com>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This documents Graperain G3568 v2 which is a development board based on RK3568 SoC.

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
index 1a9dde186..873d41bff 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -683,6 +683,12 @@ properties:
           - const: google,veyron-tiger
           - const: google,veyron
           - const: rockchip,rk3288
+      
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
 
       - description: H96 Max V58 TV Box
         items:
-- 
2.47.3

