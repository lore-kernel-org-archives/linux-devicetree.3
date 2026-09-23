Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986246D0B6
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195002; cv=none; b=fuSLmHA1iKRmCdEEmnzrf973Otf9cMkqbbmCGdmQ+OeZM3zt2rQ4oSoMYdMu6OYCGv/2F0vD3oBMcXQLd4Cz+Jb6iyWqlQ6WA1hoSuDwIX2Qu3pshtyKeBOtQOvZONCtbuHahAA1z/PFcftKS/8Ir8USd3FQ/N1ZlccgXa8pDd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195002; c=relaxed/simple;
	bh=HqfZG9G5ZIenBJJAaY9rfjLXNR0FjaP1nUhMOUSdumE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqCOfpOYnh5qkVs53giVNiyw1iFQ/Pd+PMwDs81dbnNVSHIiSIoKMI11GhtUU66usBVPzH+DvByOnm27XT4XobXIEY19gNlZma/2c5e1sOLHUSWsnQ9BBOUyOjsxE9cO1MtP3ZzUkii68uliRvHrGpVDls6eSvJGCdwdFAKrb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+7yDiyi; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+7yDiyi"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so200422966b.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194992; x=1790799792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=H+7yDiyimWvAj4n0Uv32CAQtUJ9aYA0/YgwNR964k+YIw4nhYUG2w0qDxu3/NBxElC
         IrZeN6OeC0x7KihzqwPnH/7laZxSSrmc6IvM7yUvq6KZYe1c+2rHQaNyti+xDnjAnNk/
         +IGemOM7RsJ45awkWLOEZiChQjXvRyHHw9TtnLR2OqM+oEPKD1vGwOkwnO7EU1sqiQDj
         sjN6KIFFIy+Dcf2F5zY2Pz3zB1QcH5KrXSWRfFSMyF4+mMXgNdiWBjQj0wywTa3kRuoK
         DtEdGQKoHMOvy3sOSJFI4V2yB2ZodEpjqL3sEgLDrTGAF5pEK1T3ySrzJqFxMDJh8Htp
         GA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194992; x=1790799792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=yQ65a/02w/23BqSoYVK8ANLWJsihczY4Rke5eVrOeVaudbrCROv/zWp+pTThffbZo3
         pnJC7ZLgo9tC5Btf9FUx4dRmG8ghU2JljcS9uYrta1JqCkKRfeoW46Ot8D17+vm6hx/L
         MvQHntZcG99VeK+0QGhRB0J7d4rK/8XvmASD1rqrOW2yABDa3jDdaYEeOkig74oaV+mi
         z2fnCXtOCaXP36kiO5ZlbeTwJYWOTjgnF9d1ikVQY3VRSX3paE2VAwloyDWskBFr8KST
         uVcBw/XigiYHd8kjUfAqvSYwULA9OnXowZncPRtKf2DT0eokppSPJzZcBf6QdOJlBSnG
         YfQA==
X-Forwarded-Encrypted: i=1; AKwUvByazg0l3109pEnvm/Isr3lSVvmXcN5p916+256aeBZ2wXy/wfXGttSCG6tG/kNjrIXsRpiwt1f9GuhU@vger.kernel.org
X-Gm-Message-State: AFuF++mmnbrapZv73ZAf2glgujSuCSO65YrBTUKf7ETxsEJvbJLlNlL4
	vOFUWarK2h4YpMMq0sW2ZFAhR1JzZ9iGDUEza+r/GTwb1Huj/NUj9wHj
X-Gm-Gg: AYBFou270cVT6ATLWjmJO8yUsTWA3I1O2VgeI/pSJ4dizoJ4h+WHHC3UpDFroyx9dYO
	pSKzM9NyAIzswl45jD8Y0mOMhZk7BLrWV8s3/dzOfaQJj1BRg9wIxVestjSymJbdmi8g0XVjUdT
	FOY+rWEl2p+22fDC80TBw4wOP2Me/XpRko2N57zObi1VaJrT4A3aK1G41FXwe6NCg3aAUfTK42/
	tStX3kYgaP+LCLrsYBovh0ed6j7GTKqR3oV3RsfVqD9R1/QEd1ByTBMExAAcIeA3eOvbEh/w/S4
	mbQaaRmg63GuT4DW4/iw3D2iccD4HQ0VoL1aaMYzaQPn8qTrDgy0JJLP0dHhRDqvALTlGDOs0Nj
	Tf8skK3MDCXSWmNWKF7owvUz6n6cS65MFdxZlmaRcp95Ea5PEC7BkJ6ZRhRvIGyWb1cC/BwbxsZ
	ihFfUKZEA3aUlSKufTT2NC+MlhMQ/zrk9B6roe4Sy7K49h/fnTjKR6uRtrtrtBme4ami8liF6UU
	rBqVB7fk3hGTqjtUs4tI7Hzb1oNvwu5
X-Received: by 2002:a17:907:e8f:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c2ac26820b5mr19501766b.47.1790194991761;
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Wed, 23 Sep 2026 21:16:59 +0100
Message-ID: <20260923201701.43391-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0

